%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_merge
%%% Created on : 2020/10/16 10:30
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%     TODO 进一步优化：每个表和每个源库单独一个数据库进程处理
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_player_merge).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").
-include("player.hrl").

-define(PLAYER_BATCH_FINISH(Index), {player_batch_finish, Index}).
-define(PLAYER_ID_FIELD, <<"id">>).
-define(PLAYER_NAME_FIELD, <<"name">>).

%% API
-export([
	merge/0
]).

-export([
	put_player_batch_finish/2,
	find_player_rename/1,
	update_player_rename/1,
	fetch_player_name_count/1,
	fetch_max_role_size/1,
	merge_batch_in_db/3,
	copy_players/2
]).

%% 多进程分批并发处理
merge() ->
	?INFO("start merge player tables"),
	MaxRoleSize = lib_merge_mongo:sync_status(fun lib_player_merge:fetch_max_role_size/1, []),
	?INFO("max role_size: ~p", [MaxRoleSize]),
	BatchSize = lib_merge_handle:batchsize(),
	SplitCount = lib_common:ceil(MaxRoleSize / BatchSize),
	merge_batch(BatchSize, SplitCount, 1),
	check_merge_batch_finish(SplitCount, 1),
	?INFO("finish merge player tables"),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 分批处理的完成标识
put_player_batch_finish(CurIndex, Val) ->
	lib_cache:set(?PLAYER_BATCH_FINISH(CurIndex), Val).
get_player_batch_finish(CurIndex) ->
	lib_cache:fetch(?PLAYER_BATCH_FINISH(CurIndex)).

%% 查找玩家的重命名
find_player_rename(PlayerId) ->
	case ets:lookup(?ETS_PLAYER_RENAME, PlayerId) of
		[Data] ->
			Data;
		[] ->
			#player_rename{id = PlayerId}
	end.

update_player_rename(PlayerReName) ->
	ets:insert(?ETS_PLAYER_RENAME, PlayerReName).

%% 相同名字的玩家数量
fetch_player_name_count(PlayerName) ->
	ets:update_counter(?ETS_PLAYER_NAME_COUNT, PlayerName, {2, 1}, {PlayerName, 0}).

fetch_max_role_size(State) ->
	#merge_mongo_state{
		slave = SlaveList
	} = State,
	lists:foldl(
		fun({SlaveMMO, _SlaveBack}, AccMaxSize0) ->
			Connection = maps:get(conn, SlaveMMO),
			Count = lib_merge_mongo:count(Connection, ?DBROLE, #{}),
			if
				Count > AccMaxSize0 -> Count;
				true -> AccMaxSize0
			end
		end, 0, SlaveList).

%% 分批调用数据库进程处理
merge_batch(_BatchSize, SplitCount, CurIndex) when CurIndex > SplitCount ->
	ok;
merge_batch(BatchSize, SplitCount, CurIndex) ->
	put_player_batch_finish(CurIndex, 0),
	lib_merge_mongo:async_status(fun lib_player_merge:merge_batch_in_db/3, [CurIndex, BatchSize]),
	merge_batch(BatchSize, SplitCount, CurIndex + 1).

%% 检查是否所有批次都处理完
check_merge_batch_finish(SplitCount, CurIndex) when CurIndex > SplitCount ->
	ok;
check_merge_batch_finish(SplitCount, CurIndex) ->
	Val = get_player_batch_finish(CurIndex),
	if
		Val =< 0 ->
			?DEBUG("check batch finish: ~p ~p ~p", [SplitCount, CurIndex, Val]),
			lib_timer:sleep(10000),
			check_merge_batch_finish(SplitCount, CurIndex);
		true ->
			check_merge_batch_finish(SplitCount, CurIndex + 1)
 	end.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 在数据库进程里处理指定一批玩家
merge_batch_in_db(State, CurIndex, BatchSize) ->
	StartSize = BatchSize * (CurIndex - 1),
	?INFO("batch merge player tables: ~p ~p", [StartSize, StartSize + BatchSize]),
	#merge_mongo_state{
		master_mmo = MasterMMO,
		master_backstage = MasterBack,
		slave = SlaveList
	} = State,
	lists:foreach(
		fun({SlaveMMO, SlaveBack}) ->
			merge_batch_in_db(maps:get(conn, MasterMMO), maps:get(conn, SlaveMMO), maps:get(conn, MasterBack), maps:get(conn, SlaveBack), StartSize, BatchSize)
		end, SlaveList),
	lib_player_merge:put_player_batch_finish(CurIndex, 1),
	?INFO("finish batch merge player: ~p", [CurIndex]),
	ok.
merge_batch_in_db(MasterMMOConn, SlaveMMOConn, MasterBackConn, SlaveBackConn, StartSize, BatchSize) ->
	PlayerIdList = merge_batch_player(MasterMMOConn, SlaveMMOConn, MasterBackConn, SlaveBackConn, StartSize, BatchSize),
	?INFO("batch merge player other table: ~p ~p", [StartSize, StartSize + BatchSize]),
	PlayerHandlerList = lib_player_handler:get_merge_handlers(),
	lists:foreach(
		fun(PlayerHandle) ->
			#player_handler{
				table_name = TableName,
				table_player_field = TBPlayerField
			} = PlayerHandle,
			if
				TableName =/= ?DBROLE -> merge_player_other_table(MasterMMOConn, SlaveMMOConn, TableName, TBPlayerField, PlayerIdList);
				true -> skip
			end
		end, PlayerHandlerList),
	ok.

%% 合并mmo.role和backstage.role表
merge_batch_player(MasterMMOConn, SlaveMMOConn, MasterBackConn, SlaveBackConn, StartSize, BatchSize) ->
	BsonList = lib_merge_mongo:find(SlaveMMOConn, ?DBROLE, #{}, StartSize, BatchSize),
	lists:foldr(
		fun(Bson, AccPlayerIdList0) ->
			PlayerId = ?BSON_INT(Bson, ?PLAYER_ID_FIELD),
			PlayerName = ?BSON_STRING(Bson, ?PLAYER_NAME_FIELD),
			Level = maps:get(<<"level">>, Bson, 0),
			LoginTick = maps:get(<<"login_tick">>, Bson, 0),
			LogoutTick = maps:get(<<"logout_tick">>, Bson, 0),
			try
				validate_player_remove(Bson),
				PlayerReName0 = find_player_rename(PlayerId),
				PlayerNameCount = fetch_player_name_count(PlayerName),
				PlayerReName =
					if
						PlayerNameCount =< 1 ->
							PlayerReName0#player_rename{
								name = PlayerName,
								rename = PlayerName
							};
						true ->
							send_rename_mail(Bson),
							PlayerReName0#player_rename{
								name = PlayerName,
								rename = "s" ++ lib_types:to_list(PlayerNameCount) ++ "." ++ PlayerName
							}
					end,
				update_player_rename(PlayerReName),
				NewBson0 = maps:remove(<<"_id">>, Bson),
				NewBson = maps:put(?PLAYER_NAME_FIELD, lib_types:to_binary(PlayerReName#player_rename.rename), NewBson0),
				lib_merge_mongo:update(MasterMMOConn, ?DBROLE, #{?BSONSET_INT(?PLAYER_ID_FIELD, PlayerId)}, #{<<"$set">> => NewBson}, true, false),
				case lib_merge_mongo:find_one(SlaveBackConn, ?DBROLE, #{?BSONSET_INT(?PLAYER_ID_FIELD, PlayerId)}) of
					BackRoleBson = #{} ->
						NewBackRoleBson0 = maps:remove(<<"_id">>, BackRoleBson),
						NewBackRoleBson = maps:put(?PLAYER_NAME_FIELD, lib_types:to_binary(PlayerReName#player_rename.rename), NewBackRoleBson0),
						lib_merge_mongo:update(MasterBackConn, ?DBROLE, #{?BSONSET_INT(?PLAYER_ID_FIELD, PlayerId)}, #{<<"$set">> => NewBackRoleBson}, true, false);
					_ -> skip
				end,
				?INFO("combine player role: ~p ~ts ~ts ~p ~p ~p", [PlayerId, PlayerName, PlayerReName#player_rename.rename, Level, LoginTick, LogoutTick]),
				[PlayerId | AccPlayerIdList0]
			catch
			    throw:{error, _ErrCode} ->
				    ?INFO("remove player: ~p ~ts ~p ~p ~p", [PlayerId, PlayerName, Level, LoginTick, LogoutTick]),
				    case config:is_remove_slave() of
						true ->
					        remove_slave_player(SlaveMMOConn, SlaveBackConn, PlayerId);
						_ -> skip
				    end,
				    AccPlayerIdList0
			end
		end, [], BsonList).

%% 判断该玩家是否要删除
validate_player_remove(Bson) ->
	#player_base{
		level = Level,
		login_tick = LoginTick,
		logout_tick = LogoutTick
	} = db_player_base:bson_to_player_base(Bson),
	Tick = max(LoginTick, LogoutTick),
	NowTick = lib_timer:unixtime(),
	[LogoutDays, MinLevel] = config:remove_merge_login(),
	?JUDGE_RETURN(Level > MinLevel orelse (Tick + LogoutDays * lib_timer:day_second()) > NowTick, -1),
	ok.

remove_slave_player(SlaveMMOConn, SlaveBackConn, PlayerId) ->
	PlayerHandlerList = lib_player_handler:get_merge_handlers(),
	lists:foreach(
		fun(PlayerHandle) ->
			#player_handler{
				table_name = TableName,
				table_player_field = TBPlayerField
			} = PlayerHandle,
			lib_merge_mongo:delete(SlaveMMOConn, TableName, #{TBPlayerField => PlayerId}, 0)
		end, PlayerHandlerList),
	lib_merge_mongo:delete(SlaveBackConn, ?DBROLE, #{?PLAYER_ID_FIELD => PlayerId}, 0),
	ok.

%% 合并玩家的其他表
merge_player_other_table(MasterMMOConn, SlaveMMOConn, TableName, TBPlayerField, PlayerIdList) ->
	?INFO("combine table : ~ts ~p", [TableName, SlaveMMOConn]),
	BsonList = lib_merge_mongo:find(SlaveMMOConn, TableName, #{TBPlayerField => #{?BSONSET_LIST(<<"$in">>, PlayerIdList)}}, 0, 0),
	lists:foreach(
		fun(Bson) ->
			NewBson = maps:remove(<<"_id">>, Bson),
			lib_merge_mongo:insert(MasterMMOConn, TableName, NewBson)
		end, BsonList).

%% 发重命名道具邮件
send_rename_mail(_Bson) ->
	%% TODO
%%	MailInfo0 = lib_mail_api:create_sys_mail(?ADD_BACK_MAIL),
%%	#{strvalue:=Title} = tb_merge:get(player_rename_mail_title),
%%	MailInfo1 = lib_mail_api:set_title(MailInfo0, Title),
%%	#{strvalue:=Content} = tb_merge:get(player_rename_mail_content),
%%	MailInfo2 = lib_mail_api:set_content(MailInfo1, Content, []),
%%	#{jsonvalue:=ConfItemList} = tb_merge:get(player_rename_mail_item),
%%	PackItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfItemList),
%%	MailInfo3 = lib_mail_api:add_item_list(MailInfo2, PackItemList),
%%	PlayerId = ?BSON_INT(Bson, ?PLAYER_ID_FIELD),
%%	lib_mail_api:send(MailInfo3, PlayerId),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 复制玩家
copy_players(State, PlayerId) ->
	#merge_mongo_state{
		master_mmo = MasterMMO,
		master_backstage = MasterBack,
		slave = SlaveList
	} = State,
	MasterMMOConn = maps:get(conn, MasterMMO),
	MasterBackConn = maps:get(conn, MasterBack),
	PlayerHandlerList = lib_player_handler:get_merge_handlers(),
	lists:foreach(
		fun({SlaveMMO, SlaveBack}) ->
			SlaveMMOConn = maps:get(conn, SlaveMMO),
			SlaveBackConn = maps:get(conn, SlaveBack),
			PlayerName =
				case lib_merge_mongo:find_one(SlaveMMOConn, ?DBROLE, #{?PLAYER_ID_FIELD => PlayerId}) of
					RoleBson = #{} ->
						OrgName = ?BSON_STRING(RoleBson, ?PLAYER_NAME_FIELD),
						Count = lib_merge_mongo:count(MasterMMOConn, ?DBROLE, #{?PLAYER_NAME_FIELD => OrgName}),
						if
							Count >= 1 -> "s" ++ lib_types:to_list(Count + 1) ++ "." ++ OrgName;
							true -> OrgName
						end;
					_ -> ""
				end,
			case lib_merge_mongo:find_one(SlaveBackConn, ?DBROLE, #{?PLAYER_ID_FIELD => PlayerId}) of
				BackRoleBson = #{} ->
					NewBackRoleBson0 = maps:remove(<<"_id">>, BackRoleBson),
					NewBackRoleBson = maps:put(?PLAYER_NAME_FIELD, PlayerName, NewBackRoleBson0),
					lib_merge_mongo:insert(MasterBackConn, ?DBROLE, NewBackRoleBson);
				_ -> skip
			end,
			lists:foreach(
				fun(PlayerHandle) ->
					#player_handler{
						table_name = TableName,
						table_player_field = TBPlayerField
					} = PlayerHandle,
					?INFO("copy player: ~p ~p ~p", [PlayerId, TableName, SlaveMMOConn]),
					lists:foreach(
						fun(Bson) ->
							if
								TableName =:= ?DBROLE ->
									NewBson0 = maps:remove(<<"_id">>, Bson),
									NewBson = maps:put(?PLAYER_NAME_FIELD, PlayerName, NewBson0),
									lib_merge_mongo:insert(MasterMMOConn, TableName, NewBson);
								true ->
									NewBson = maps:remove(<<"_id">>, Bson),
									lib_merge_mongo:insert(MasterMMOConn, TableName, NewBson)
							end
						end, lib_merge_mongo:find(SlaveMMOConn, TableName, #{TBPlayerField => PlayerId}, 0, 0))
				end, PlayerHandlerList)
		end, SlaveList),
	ok.
