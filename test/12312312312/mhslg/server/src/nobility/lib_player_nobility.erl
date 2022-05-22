%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 2:20 PM
%%%-------------------------------------------------------------------
-module(lib_player_nobility).
-author("lichaoyu").
-include("common.hrl").
-include("inner_city.hrl").
-include("ProtoClient_10132.hrl").

%% API
-export([
	notice_privilege/0,				%% 功勋和元宝修改时调用，特权提示
	notice_privilege_activation/0,	%% 通知已激活特权
	request_nobility_info/1,		%% 请求爵位信息
	request_privilege_activation/1,	%% 请求特权激活
	request_nobility_activation/0,	%% 请求爵位提升
	test/1
]).

-export([
	put_nobility/1,
	get_nobility/0,
	player_nobility_handler/0,
	sign_in/0,
	sign_out/0,
	get_tips/0
]).

-define(NOBILITY_NOTICE, 2).

put_nobility(Nobility) ->
	put_nobility(Nobility, true).
put_nobility(Nobility, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_NOBILITY),
	erlang:put(?ETS_PLAYER_NOBILITY, Nobility).

get_nobility() ->
	erlang:get(?ETS_PLAYER_NOBILITY).

ets_init() ->
	ets:new(?ETS_PLAYER_NOBILITY, [?ETS_KEY_POS(#player_nobility.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_NOBILITY, {?TUPLE_INT(id, 1)}, true).

player_nobility_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_NOBILITY,
		table_name = ?DBPLAYER_NOBILITY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_nobility:load_player_nobility/1,
		save_func = fun db_player_nobility:save_player_nobility/1,
		get_func = fun get_nobility/0,
		put_func = fun put_nobility/2
	}.

sign_in() ->
	lib_nobility_api:calc_privilege_prop()
.
sign_out() ->
	ok
.

request_nobility_info(Msg) ->
	#'Proto10132001'{
		nobility_id = NobilityId
	} = Msg,
	Conf = tb_nobility_base:get(NobilityId),
	?JUDGE_RETURN(Conf, ?ERROR_NOBILITY_ID),
	TbPrivilege = maps:get(privilege, Conf, []),
	PrivilegeSets = lib_nobility_api:get_privilege(),
	PrivilegeList = [case sets:is_element(X, PrivilegeSets) of true -> 1; false -> 0 end || X <- TbPrivilege],
	TbCondition = maps:get(condition, Conf, []),
	ConditionList = lib_nobility_api:condition_schedule(TbCondition),
	NewConf = tb_nobility_base:get(lib_nobility_api:get_nobility() + 1),
	Schedule =
		case NewConf of
			false -> 0;
			_ ->
				Finish = lib_nobility_api:condition_finish(maps:get(condition, NewConf, [])),
				{Now, Total} = lists:foldl(fun(X, {N, D}) -> {?IIF(X, N + 1, N), D + 1} end, {0, 0}, Finish),
				trunc(Now / Total * 100)
		end,
	Res = #'Proto50132001'{
		privilege = PrivilegeList,
		condition = ConditionList,
		schedule = Schedule
	},
	lib_send:respond_to_client(Res)
.
%% 元宝或功勋修改时，调用
notice_privilege() ->
	#player_nobility{
		nobility = NobilityId,
		privilege = PrivilegeSets
	} = get_nobility(),
	#{
		privilege := TbPrivilege
	} = lib_nobility_api:nobility(NobilityId),
	UnLockPrivilegeList = lists:foldl(
		fun(P, List) ->
			lists:delete(P, List)
		end, TbPrivilege, sets:to_list(PrivilegeSets)),
	#{value := SilverId} = tb_const:get(money),
	#{value := FeatId} = tb_const:get(feat),
	NowSilverNum = lib_money_api:get_money_amount(SilverId),
	NowFeatNum = lib_money_api:get_money_amount(FeatId),
	try
	   lists:filter(
		   fun(PrivilegeId) ->
			   #{
				   feat := FeatNum,
				   silver := SilverNum
			   } = tb_nobility_privilege:get(PrivilegeId),
			   F = (NowSilverNum >= SilverNum) andalso (NowFeatNum >= FeatNum),
			   case F of
				   true -> throw({error, -1});
				   false -> true
			   end
		   end, UnLockPrivilegeList),
		   false
	catch
	    _:_  ->
			Res = #'Proto80132001'{
				notice = 1
			},
			lib_send:respond_to_client(Res)
	end
.
get_tips() ->
	try
		#player_nobility{
			nobility = NobilityId
		} = get_nobility(),
		#{
			condition := TbCondition
		} = lib_nobility_api:nobility(NobilityId),
		GoalList = lib_nobility_api:condition_finish(TbCondition),
		?JUDGE_RETURN(lists:last(tb_nobility_base:get_list()) =/= NobilityId, -2),
		[?JUDGE_RETURN(X, ?ERROR_NOBILITY_FAIL) || X <- GoalList],
		?NOBILITY_NOTICE
	catch
		_:_  -> 0
	end
.

request_privilege_activation(Msg) ->
	#'Proto10132002'{
		id = PrivilegeId
	} = Msg,
	PlayerNobility = get_nobility(),
	?JUDGE_RETURN(lib_nobility_api:is_privilege(PrivilegeId, PlayerNobility#player_nobility.nobility), ?ERROR_PRIVILEGE_ID),
	PrivilegeSets = PlayerNobility#player_nobility.privilege,
	?JUDGE_RETURN(not sets:is_element(PrivilegeId, PrivilegeSets), ?ERROR_PRIVILEGE_FAIL),
	Conf = tb_nobility_privilege:get(PrivilegeId),
	ItemList = [[?MONEY_ID, maps:get(silver, Conf)], [?FEAT_ID, maps:get(feat, Conf)]],
	lib_equip_api:item(ItemList, ?USE_PRIVILEGE_ACTIVATION, PrivilegeId),
	NewPrivilegeSets = sets:add_element(PrivilegeId, PrivilegeSets),
	put_nobility(PlayerNobility#player_nobility{privilege = NewPrivilegeSets}),
	notice_privilege_activation(),
	lib_player_process:process_privilege_update(maps:get(big, Conf))
.
notice_privilege_activation() ->
	PrivilegeSets = lib_nobility_api:get_privilege(),
	Res = #'Proto80132002'{
		privilege_id_list = sets:to_list(PrivilegeSets)
	},
	lib_send:respond_to_client(Res)
.

request_nobility_activation() ->
	PlayerNobility = get_nobility(),
	NobilityId = PlayerNobility#player_nobility.nobility,
	NewNobility = NobilityId + 1,
	Conf = tb_nobility_base:get(NewNobility),
	TbCondition = maps:get(condition, Conf),
	Finish = lists:all(
		fun(X) ->
			lib_nobility_api:is_finish(tb_nobility_conition:get(X))
		end, TbCondition),
	?JUDGE_RETURN(Finish, ?ERROR_NO_STATE),
	UnLockTime = maps:get(unlock, Conf),
	?JUDGE_RETURN(UnLockTime =< lib_season_and_days_api:get_season(), ?ERROR_NOBILITY_FAIL),
	lib_equip_api:item([?GOLD_ID, maps:get(award, Conf)], ?ADD_NOBILITY_ACTIVATION, NewNobility),
	put_nobility(PlayerNobility#player_nobility{nobility = NewNobility}),
	lib_player_process:process_player_nobility(NewNobility),
	Res = #'Proto50132003'{
		nobility_id = NewNobility
	},
	lib_send:respond_to_client(Res)
.

test(Id) ->
	?JUDGE_RETURN(lib_nobility_api:is_nobility(Id), ?ERROR_NOBILITY_ID),
	List = lists:filter(
		fun(PrivilegeId) ->
			PrivilegeId =< Id
		end, tb_nobility_base:get_list()),
	PlayerNobility = get_nobility(),
	PrivilegeList = lists:flatten([lib_nobility_api:privilege(X) || X <- List]),
	put_nobility(PlayerNobility#player_nobility{nobility = Id, privilege = sets:from_list(PrivilegeList)}),
	lib_player_process:process_player_nobility(Id),
	[lib_player_process:process_privilege_update(maps:get(big, tb_nobility_privilege:get(PrivilegeId))) || PrivilegeId <- PrivilegeList],
	notice_privilege_activation()
.


