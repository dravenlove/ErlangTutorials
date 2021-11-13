%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_merge
%%% Created on : 2020/10/16 10:30
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_league_merge).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").

-define(LEAGUE_IS_REMOVE_FIELD, <<"is_remove">>).
-define(LEAGUE_ID_FIELD, <<"id">>).
-define(LEAGUE_NAME_FIELD, <<"name">>).
-define(LEAGUE_LEADER_ID_FIELD, <<"leader_id">>).

%% API
-export([
	merge/0,
	merge_league/1
]).

%% 联盟合服操作
merge() ->
	lib_merge_mongo:sync_status(fun lib_league_merge:merge_league/1, []),
	ok.

merge_league(State) ->
	#merge_mongo_state{
		master_mmo = MasterMMO,
		slave = SlaveList
	} = State,
	lists:foreach(
		fun({SlaveMMO, _SlaveBack}) ->
			merge_slave_league(maps:get(conn, MasterMMO), maps:get(conn, SlaveMMO))
		end, SlaveList),
	ok.

merge_slave_league(MasterMMOConn, SlaveMMOConn) ->
	lists:foreach(
		fun(Bson) ->
			LeagueId = ?BSON_INT(Bson, ?LEAGUE_ID_FIELD),
			LeagueName = ?BSON_STRING(Bson, ?LEAGUE_NAME_FIELD),
			LeagueReName0 = find_league_rename(LeagueId),
			LeagueNameCount = fetch_league_name_count(LeagueName),
			LeagueReName =
				if
					LeagueNameCount =< 1 ->
						LeagueReName0#league_rename{
							name = LeagueName,
							rename = LeagueName
						};
					true ->
						send_rename_mail(Bson),
						LeagueReName0#league_rename{
							name = LeagueName,
							rename = "s" ++ lib_types:to_list(LeagueNameCount) ++ "." ++ LeagueName
						}
				end,
			update_league_rename(LeagueReName),
			?INFO("combine league: ~p ~ts ~p", [LeagueId, LeagueName, SlaveMMOConn]),
			NewBson0 = maps:remove(<<"_id">>, Bson),
			NewBson = maps:put(?LEAGUE_NAME_FIELD, lib_types:to_binary(LeagueReName#league_rename.rename), NewBson0),
			lib_merge_mongo:insert(MasterMMOConn, ?DBLEAGUE, NewBson)
		end, lib_merge_mongo:find(SlaveMMOConn, ?DBLEAGUE, #{?BSONSET_INT(?LEAGUE_IS_REMOVE_FIELD, 0)}, 0, 0)).


%% 查找联盟的重命名
find_league_rename(LeagueId) ->
	case ets:lookup(?ETS_LEAGUE_RENAME, LeagueId) of
		[Data] ->
			Data;
		[] ->
			#league_rename{id = LeagueId}
	end.

update_league_rename(LeagueReName) ->
	ets:insert(?ETS_LEAGUE_RENAME, LeagueReName).

%% 相同名字的联盟数量
fetch_league_name_count(LeagueName) ->
	ets:update_counter(?ETS_LEAGUE_NAME_COUNT, LeagueName, {2, 1}, {LeagueName, 0}).

%% 发重命名道具邮件
send_rename_mail(_Bson) ->
	%% TODO
%%	MailInfo0 = lib_mail_api:create_sys_mail(?ADD_BACK_MAIL),
%%	#{strvalue:=Title} = tb_merge:get(league_rename_mail_title),
%%	MailInfo1 = lib_mail_api:set_title(MailInfo0, Title),
%%	#{strvalue:=Content} = tb_merge:get(league_rename_mail_content),
%%	MailInfo2 = lib_mail_api:set_content(MailInfo1, Content, []),
%%	#{jsonvalue:=ConfItemList} = tb_merge:get(league_rename_mail_item),
%%	PackItemList = lib_item_api:conf_item_list_to_pack_item_list(ConfItemList),
%%	MailInfo3 = lib_mail_api:add_item_list(MailInfo2, PackItemList),
%%	LeaderId = ?BSON_INT(Bson, ?LEAGUE_LEADER_ID_FIELD),
%%	lib_mail_api:send(MailInfo3, LeaderId),
	ok.