%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_backactivity
%%% Created on : 2020/8/25 0025 10:42
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_backactivity).
-author("glendy").
-include("common.hrl").
-include("back_activity.hrl").
-include("ProtoClient_10108.hrl").

%% API
-export([
	put_player_backactivity/2,
	get_player_backactivity/0,
	ets_init/0,
	build_index/0,
	player_backactivity_handler/0,
	sign_in/0,
	sign_out/0,

	get_backact_info/1,
	put_backact_info/2,
	remove_player_backactivity/1,

	get_conf/2,
	get_conf_list/1,

	is_open_backact/1,
	get_open_backact_list_by_main_type/1
]).

-export([
	async_backactivity_when_login/1,
	async_backactivity_when_back_update/1,
	async_backactivity_state_vary/1
]).

-export([
	request_backact_info/1,
	test_backact_command/4
]).

put_player_backactivity(PlayerBackActivity, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BACKACTIVITY),
	erlang:put(?ETS_PLAYER_BACKACTIVITY, PlayerBackActivity).

get_player_backactivity() ->
	erlang:get(?ETS_PLAYER_BACKACTIVITY).

ets_init() ->
	ets:new(?ETS_PLAYER_BACKACTIVITY, [?ETS_KEY_POS(#player_backactivity.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_BACKACTIVITY, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_ACTIVITY, {?TUPLE_INT(<<"act_index">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACKACTIVITY_CONVERT, {?TUPLE_INT(<<"act_index">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBBACKACTIVITY_ACTIVE, {?TUPLE_INT(<<"act_index">>, 1)}, true),
	ok.

player_backactivity_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BACKACTIVITY,
		table_name = ?DBPLAYER_BACKACTIVITY,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_backactivity:ets_init/0,
		mongo_index_func = fun lib_player_backactivity:build_index/0,
		load_func = fun db_backactivity:load_player_backactivity/1,
		save_func = fun db_backactivity:save_player_backactivity/1,
		get_func = fun lib_player_backactivity:get_player_backactivity/0,
		put_func = fun lib_player_backactivity:put_player_backactivity/2
	}.

sign_in() ->
	mod_server:async_apply(mod_backactivity:get_pid(), fun lib_backact_listen:async_listen_player_login/1, [lib_player:player_id()]),
	ok.

sign_out() ->
	mod_server:async_apply(mod_backactivity:get_pid(), fun lib_backact_listen:async_listen_player_logout/1, [lib_player:player_id()]),
	ok.

%% 获取某个运营活动信息
get_backact_info(ActIndex) ->
	#player_backactivity{
		backact_map = BackActMap
	} = get_player_backactivity(),
	maps:get(ActIndex, BackActMap, undefined).

%% 更新某个运营活动信息
put_backact_info(BackActInfo, IsSaveDb) ->
	ActIndex = BackActInfo#backact_info.id,
	#player_backactivity{
		backact_map = BackActMap,
		maintype_map = MainTypeMap
	} = PlayerBackActivity = get_player_backactivity(),
	case maps:get(ActIndex, BackActMap, undefined) of
		undefined -> skip;
		OrgBackActInfo ->
			OrgMainType = OrgBackActInfo#backact_info.main_type,
			NewMainType = BackActInfo#backact_info.main_type,
			NewBackActMap = maps:put(ActIndex, BackActInfo, BackActMap),
			NewMainTypeMap =
				if
					OrgMainType =/= NewMainType ->
						update_main_type_map(MainTypeMap, ActIndex, OrgMainType, NewMainType);
					true ->
						MainTypeMap
				end,
			put_player_backactivity(PlayerBackActivity#player_backactivity{
				backact_map = NewBackActMap,
				maintype_map = NewMainTypeMap
			}, IsSaveDb)
	end.

remove_player_backactivity(ActIndex) ->
	#player_backactivity{
		backact_map = BackActMap,
		maintype_map = MainTypeMap
	} = PlayerBackActivity = get_player_backactivity(),
	{NewBackActMap, NewMainTypeMap} = remove_player_backactivity(ActIndex, BackActMap, MainTypeMap),
	put_player_backactivity(PlayerBackActivity#player_backactivity{
		backact_map = NewBackActMap,
		maintype_map = NewMainTypeMap
	}, true).

%% 获取配置信息
get_backact_conf(BackActInfo) ->
	#backact_info{
		backactivity = BackActivity
	} = BackActInfo,
	BackActivity#backactivity.conf.

%% 获取配置id的配置, 不存在返回false
get_conf(Id, BackActInfo) ->
	Conf = get_backact_conf(BackActInfo),
	maps:get(Id, Conf, false).

%% 获取配置id的列表
get_conf_list(BackActInfo) ->
	Conf = get_backact_conf(BackActInfo),
	maps:get(get_list, Conf, []).

%% 运营活动是是否正常开启
is_open_backact(BackActInfo) ->
	#backact_info{
		clear_tick = ClearTick,
		backactivity = BackActivity
	} = BackActInfo,
	#backactivity{
		is_open = IsOpen,
		start_tick = StartTick,
		end_tick = EndTick
	} = BackActivity,
	NowTick = lib_timer:unixtime(),
	(ClearTick =< 0 andalso IsOpen =:= 1 andalso StartTick =< NowTick andalso NowTick < EndTick).

%% 获取指定运营活动主类型的所有开启的运营活动信息
get_open_backact_list_by_main_type(MainType) ->
	#player_backactivity{
		backact_map = BackActMap,
		maintype_map = MainTypeMap
	} = get_player_backactivity(),
	IdList = maps:get(MainType, MainTypeMap, []),
	lists:foldl(
		fun(Id, AccBackActList0) ->
			case maps:get(Id, BackActMap, undefined) of
				undefined -> AccBackActList0;
				BackAct ->
					case is_open_backact(BackAct) of
						true -> [BackAct | AccBackActList0];
						_ -> AccBackActList0
					end
			end
		end, [], IdList).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端请求接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
request_backact_info(Msg) ->
	#'Proto10108002'{act_index = ActIndex} = Msg,
	BackActInfo = get_backact_info(ActIndex),
	?JUDGE_RETURN(BackActInfo =/= undefined, ?ERROR_NO_BACKACT),
	?JUDGE_RETURN(is_open_backact(BackActInfo) =:= true, ?ERROR_BACKACT_NO_START),
	put_backact_info(BackActInfo#backact_info{is_new = 0}, false),
	MainType = BackActInfo#backact_info.main_type,
	case MainType of
		?BACKACT_TYPE_CUMULATE_RECHARGE ->
			lib_player_ba_cumulate_recharge:request_backact_info(ActIndex);
		_ ->
			?WARNING("no backact pannel info: ~p ~p", [MainType, ActIndex])
	end,
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
notify_open_backactivity_list()->
	#player_backactivity{
		backact_map = BackActMap
	} = get_player_backactivity(),
	ProtoActivityList = maps:fold(
		fun(_Id, BackActInfo, AccProtoList0) ->
			case is_open_backact(BackActInfo) of
				true ->
					Proto = lib_backact_base:serialize_proto_backact(BackActInfo#backact_info.backactivity),
					[Proto | AccProtoList0];
				_ -> AccProtoList0
			end
		end, [], BackActMap),
	Respond = #'Proto80108001'{
		backact_list = ProtoActivityList
	},
	lib_send:respond_to_client(Respond).

%% 登录时同步运营活动信息
async_backactivity_when_login(BackActivityList) ->
	async_backactivity_list(?SYNC_PLAYER_BACKACT_LOGIN, BackActivityList),
	notify_open_backactivity_list().

%% 运营活动的后台配置有变化更新时调用
async_backactivity_when_back_update(BackActivityList) ->
	async_backactivity_list(?SYNC_PLAYER_BACKACT_UPDATE, BackActivityList).

%% 状态发生变化的运营活动列表
async_backactivity_state_vary(BackActivityList) ->
	async_backactivity_list(?SYNC_PLAYER_BACKACT_STATE, BackActivityList).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
async_backactivity_list(OpType, BackActivityList) ->
	async_backactivity_list(#{}, OpType, BackActivityList).
async_backactivity_list(UpdateMap, ?SYNC_PLAYER_BACKACT_LOGIN, []) ->		%% 登录时删除玩家身上已经关闭的活动信息
	#player_backactivity{
		backact_map = BackActMap,
		maintype_map = MainTypeMap
	} = PlayerBackActivity = get_player_backactivity(),
	NowTick = lib_timer:unixtime(),
	{NewBackActMap, NewMainTypeMap, ForceCloseList} = maps:fold(
		fun(ActIndex, BackActInfo, {AccBackActMap0, AccMainTypeMap0, AccForceCloseList0}) ->
			case maps:is_key(ActIndex, UpdateMap) of
				false ->
					if
						BackActInfo#backact_info.clear_tick > 0 andalso BackActInfo#backact_info.clear_tick =< NowTick ->
							{AccBackActMap1, AccMainTypeMap1} = remove_player_backactivity(ActIndex, AccBackActMap0, AccMainTypeMap0),
							{AccBackActMap1, AccMainTypeMap1, AccForceCloseList0};
						true ->
							{AccBackActMap0, AccMainTypeMap0, [BackActInfo | AccForceCloseList0]}
					end;
				_ ->
					{AccBackActMap0, AccMainTypeMap0, AccForceCloseList0}
			end
		end, {BackActMap, MainTypeMap, []}, BackActMap),
	put_player_backactivity(PlayerBackActivity#player_backactivity{
		backact_map = NewBackActMap,
		maintype_map = NewMainTypeMap
	}, true),
	lists:foldl(
		fun(BackActInfo, Acc0) ->
			process_backactivity_force_close(BackActInfo#backact_info.backactivity, BackActInfo),
			Acc0
		end, ok, ForceCloseList),
	ok;
async_backactivity_list(_UpdateMap, _OpType, []) ->
	ok;
async_backactivity_list(UpdateMap, OpType, [BackActivity | T]) ->
	#backactivity{
		act_index = ActIndex,
		main_type = MainType,
		is_open = IsOpen
	} = BackActivity,
	#player_backactivity{
		backact_map = BackActMap,
		maintype_map = MainTypeMap
	} = PlayerBackActivity = get_player_backactivity(),
	if
		IsOpen =:= 0 ->
			%% 关闭的活动不处理
			PlayerBackActInfo = maps:get(ActIndex, BackActMap, undefined),
			process_backactivity_force_close(BackActivity, PlayerBackActInfo),
			async_backactivity_list(UpdateMap, OpType, T);
		true ->
			case maps:is_key(ActIndex, BackActMap) of
				false ->
					%% 新开的活动
					BackActInfo = init_new_backact_info(OpType, BackActivity),
					NewBackActMap = maps:put(ActIndex, BackActInfo, BackActMap),
					ActList = maps:get(MainType, MainTypeMap, []),
					NewMainTypeMap = maps:put(MainType, [ActIndex | ActList], MainTypeMap),
					put_player_backactivity(PlayerBackActivity#player_backactivity{
						backact_map = NewBackActMap,
						maintype_map = NewMainTypeMap
					}, true),
					process_backactivity_new_open(OpType, BackActInfo);
				_ ->
					%% 更新活动
					BackActInfo = maps:get(ActIndex, BackActMap),
					OrgMainType = BackActInfo#backact_info.main_type,
					{OrgState, OrgConfigString} =
						case BackActInfo#backact_info.backactivity of
							#backactivity{state = OrgState0, config_string = OrgConfigString0} ->
								{OrgState0, OrgConfigString0};
							_ -> {0, ""}
						end,
					NewBackActInfo = update_backact_info(OpType, BackActInfo, BackActivity, OrgConfigString),
					NewMainType = NewBackActInfo#backact_info.main_type,
					NewBackActMap = maps:put(ActIndex, NewBackActInfo, BackActMap),
					NewMainTypeMap =
						if
							OrgMainType =/= NewMainType ->
								update_main_type_map(MainTypeMap, ActIndex, OrgMainType, NewMainType);
							true -> MainTypeMap
						end,
					put_player_backactivity(PlayerBackActivity#player_backactivity{
						backact_map = NewBackActMap,
						maintype_map = NewMainTypeMap
					}, true),
					if
						OrgState =/= BackActivity#backactivity.state ->
							process_backactivity_state_change(OpType, NewBackActInfo,
								OrgState,
								BackActivity#backactivity.state);
						true -> skip
					end
			end,
			async_backactivity_list(maps:put(ActIndex, 1, UpdateMap), OpType, T)
	end.

update_main_type_map(MainTypeMap, ActIndex, OrgMainType, NewMainType) ->
	OrgList0 = maps:get(OrgMainType, MainTypeMap, []),
	MainTypeMap0 = maps:put(OrgMainType, lists:delete(ActIndex, OrgList0), MainTypeMap),
	NewList0 = maps:get(NewMainType, MainTypeMap0, []),
	case lib_common:lists_find(ActIndex, NewList0) > 0 of
		true ->
			MainTypeMap0;
		_ ->
			maps:put(NewMainType, [ActIndex | NewList0], MainTypeMap0)
	end.

remove_player_backactivity(ActIndex, BackActMap, MainTypeMap) ->
	case maps:get(ActIndex, BackActMap, undefined) of
		undefined -> {BackActMap, MainTypeMap};
		BackActInfo ->
			MainType = BackActInfo#backact_info.main_type,
			List0 = maps:get(MainType, MainTypeMap, []),
			NewMainTypeMap = maps:put(MainType, lists:delete(ActIndex, List0), MainTypeMap),
			NewBackActMap = maps:remove(ActIndex, BackActMap),
			{NewBackActMap, NewMainTypeMap}
	end.

%% OpType: ?SYNC_PLAYER_BACKACT_LOGIN等枚举值
%% 同步活动信息时更新初始化相关字段
update_backact_info(OpType, BackActInfo, BackActivity, OldConfigString) ->
	NewBackActInfo0 = BackActInfo#backact_info{
		backactivity = BackActivity,
		clear_tick = 0
	},
	NewConfigString = BackActivity#backactivity.config_string,
	if
		NewBackActInfo0#backact_info.main_type =/= BackActivity#backactivity.main_type ->
			reinit_backact_info_change_main_type(OpType, NewBackActInfo0);
		OpType =:= ?SYNC_PLAYER_BACKACT_LOGIN andalso OldConfigString =/= NewConfigString ->
			lib_player_backactivity_listen:listen_fast_load_config(OpType, NewBackActInfo0);
		OpType =:= ?SYNC_PLAYER_BACKACT_UPDATE andalso OldConfigString =/= NewConfigString ->
			lib_player_backactivity_listen:listen_fast_load_config(OpType, NewBackActInfo0);
		true -> NewBackActInfo0
	end.

reinit_backact_info_change_main_type(OpType, BackActInfo) ->
	BackActivity = BackActInfo#backact_info.backactivity,
	init_new_backact_info(OpType, BackActivity).

init_new_backact_info(OpType, BackActivity) ->
	BackActInfo0 = #backact_info{
		id = BackActivity#backactivity.act_index,
		main_type = BackActivity#backactivity.main_type,
		is_new = 1,
		backactivity = BackActivity
	},
	BackActInfo = init_backact_info_by_main_type(BackActInfo0#backact_info.main_type, BackActInfo0),
	lib_player_backactivity_listen:listen_fast_load_config(OpType, BackActInfo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init_backact_info_by_main_type(?BACKACT_TYPE_CUMULATE_RECHARGE, BackActInfo) ->
	lib_player_ba_cumulate_recharge:init_backact_info(BackActInfo);
init_backact_info_by_main_type(MainType, BackActInfo) ->
	?WARNING("no init by main type: ~p ~p", [MainType, BackActInfo#backact_info.id]),
	BackActInfo.

%% 运营活动强制关闭或玩家上线时活动不存在都视为强制关闭
process_backactivity_force_close(BackActivity, BackActInfo) when is_record(BackActivity, backactivity) =:= false orelse is_record(BackActInfo, backact_info) =:= false ->
	?DEBUG("player backactivity force close[undefined]:~n~w~n~w", [BackActivity, BackActInfo]),
	ok;
process_backactivity_force_close(BackActivity, BackActInfo) ->
	%% 当clear_tick > 0并且#backactivity.is_open = 1表示玩家上线时运营活动已经不存在, 有可能是正常结束，也有可能是强制关闭
	%% 当clear_tick > 0并且#backactivity.is_open = 0表示玩家在线时运营活动强制关闭了
	NewBackActInfo = BackActInfo#backact_info{
		clear_tick = lib_timer:next_zero_unixtime() + lib_timer:day_second(),
		backactivity = BackActivity
	},
	put_backact_info(NewBackActInfo, true),
	lib_player_backactivity_listen:listen_backactivity_force_close(BackActivity, BackActInfo),
	ok.

%% 对于玩家来说是新开的运营活动时调用
process_backactivity_new_open(OpType, BackActInfo) ->
	#backact_info{
		main_type = MainType,
		backactivity = BackActivity
	} = BackActInfo,
	State = BackActivity#backactivity.state,
	if
		State =:= ?BACKACT_STATE_START ->
			lib_player_backactivity_listen:listen_backactivity_start(MainType, OpType, BackActInfo, ?BACKACT_STATE_NOSTART);
		true -> skip
	end,
	lib_player_backactivity_listen:listen_backactivity_new(OpType, BackActInfo),
	ok.

%% 运营活动的状态改变时调用
process_backactivity_state_change(OpType, BackActInfo, OldState, NewState) ->
	MainType = BackActInfo#backact_info.main_type,
	if
		NewState =:= ?BACKACT_STATE_START ->
			lib_player_backactivity_listen:listen_backactivity_start(MainType, OpType, BackActInfo, OldState);
		NewState =:= ?BACKACT_STATE_STOP ->
			lib_player_backactivity_listen:listen_backactivity_stop(MainType, OpType, BackActInfo, OldState);
		NewState =:= ?BACKACT_STATE_DISAPPEAR ->
			NewBackActInfo = BackActInfo#backact_info{
				clear_tick = lib_timer:next_zero_unixtime() + lib_timer:day_second()
			},
			put_backact_info(NewBackActInfo, true),
			lib_player_backactivity_listen:listen_backactivity_disappear(MainType, OpType, BackActInfo, OldState);
		true -> skip
	end,
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%
test_backact_command(Par1, Par2, Par3, Par4) ->
	if
		Par1 =:= 1 ->
			request_backact_info(#'Proto10108002'{act_index = Par2});
		Par1 =:= 2 ->
			lib_player_ba_cumulate_recharge:request_cumulate_recharge_draw(#'Proto10108004'{act_index = Par2, id = Par3});
		true ->
			?WARNING("test backactivity: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
	end.

