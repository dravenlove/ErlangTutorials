%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_backact_base
%%% Created on : 2020/8/25 0025 10:48
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_backact_base).
-author("glendy").
-include("common.hrl").
-include("back_activity.hrl").
-include("ProtoClient_10108.hrl").

-define(BACKACTIVITY_INFO(Id), {backactivity, Id}).
-define(BACKACTIVITY_MAP, backactivity_map).
-define(LOAD_BACKACTIVITY_LIST, load_backactivity_list).
-define(CACHE_SAVE_BACKACTIVITY_LIST, cache_save_backactivity_list).
-define(CACHE_REMOVE_BACKACTIVITY_LIST, cache_remove_backactivity_list).
-define(BACKACT_ONLINE_PLAYER_LIST, backact_online_player_list).

%% API
-export([
	get_backactivity_map/0,
	put_backactivity_map/1,
	put_backactivity/2,
	get_backactivity/1,
	get_backactivity_list/0,
	get_cache_save_list/0,
	put_cache_save_list/1,
	get_cache_remove_list/0,
	put_cache_remove_list/1,
	get_online_player_map/0,
	put_online_player_map/1,
	insert_online_player/1,
	remove_online_player/1,
	async_apply_all_player/2,
	serialize_proto_backact/1
]).

-export([
	check_and_convert_backactivity/0,
	convert_back_activity_bson/1,
	check_and_active_backactivity/0,
	check_and_update_backactivity_state/0,
	check_and_remove_backactivity/0,
	dynamic_compile_backactivity_config/1,
	process_fast_load_config/1
]).

get_backactivity_map() ->
	case erlang:get(?BACKACTIVITY_MAP) of
		undefined -> #{};
		Val -> Val
	end.

put_backactivity_map(Map) ->
	erlang:put(?BACKACTIVITY_MAP, Map).

put_backactivity(BackActivity, IsSaveDb) ->
	ActIndex = BackActivity#backactivity.act_index,
	if
		IsSaveDb =:= true andalso BackActivity#backactivity.is_open =:= 1 ->
			insert_cache_save_list(ActIndex);
		true -> skip
	end,
	Map = get_backactivity_map(),
	put_backactivity_map(maps:put(ActIndex, BackActivity, Map)).

get_backactivity(Id) ->
	Map = get_backactivity_map(),
	maps:get(Id, Map, undefined).

get_backactivity_list() ->
	maps:fold(
		fun(_, BackActivity, AccList0) ->
			[BackActivity | AccList0]
		end, [], get_backactivity_map()).

get_cache_save_list() ->
	case erlang:get(?CACHE_SAVE_BACKACTIVITY_LIST) of
		undefined -> [];
		Val -> Val
	end.

put_cache_save_list(List) ->
	erlang:put(?CACHE_SAVE_BACKACTIVITY_LIST, List).

insert_cache_save_list(Id) ->
	List = get_cache_save_list(),
	case lib_common:lists_find(Id, List) > 0 of
		false -> put_cache_save_list([Id | List]);
		_ -> skip
	end.

remove_cache_save_list(Id) ->
	List = get_cache_save_list(),
	put_cache_save_list(lists:delete(Id, List)).

get_cache_remove_list() ->
	case erlang:get(?CACHE_REMOVE_BACKACTIVITY_LIST) of
		undefined -> [];
		Val -> Val
	end.

put_cache_remove_list(List) ->
	erlang:put(?CACHE_REMOVE_BACKACTIVITY_LIST, List).

insert_cache_remove_list(Id) ->
	List = get_cache_remove_list(),
	case lib_common:lists_find(Id, List) > 0 of
		false -> put_cache_remove_list([Id | List]);
		_ -> skip
	end.

remove_cache_remove_list(Id) ->
	List = get_cache_remove_list(),
	put_cache_remove_list(lists:delete(Id, List)).

get_online_player_map() ->
	case erlang:get(?BACKACT_ONLINE_PLAYER_LIST) of
		undefined -> #{};
		Val -> Val
	end.

put_online_player_map(Map) ->
	erlang:put(?BACKACT_ONLINE_PLAYER_LIST, Map).

insert_online_player(PlayerId) ->
	Map = get_online_player_map(),
	case maps:is_key(PlayerId, Map) of
		false -> put_online_player_map(maps:put(PlayerId, 1, Map));
		_ -> skip
	end.

remove_online_player(PlayerId) ->
	Map = get_online_player_map(),
	case maps:is_key(PlayerId, Map) of
		true -> put_online_player_map(maps:remove(PlayerId, Map));
		_ -> skip
	end.

async_apply_all_player(Func, Args) ->
	PlayerMap = get_online_player_map(),
	maps:fold(
		fun(PlayerId, _, Acc0) ->
			PlayerPid = lib_player:get_pid(PlayerId),
			mod_server:async_apply(PlayerPid, Func, Args),
			Acc0
		end, ok, PlayerMap).

serialize_proto_backact(BackActivity) ->
	#'ProtoBackAct'{
		act_index = BackActivity#backactivity.act_index,
		is_open = BackActivity#backactivity.is_open,
		start_tick = BackActivity#backactivity.start_tick,
		end_tick = BackActivity#backactivity.end_tick,
		disappear_tick = BackActivity#backactivity.disappear_tick,
		main_type = BackActivity#backactivity.main_type,
		main_icon = BackActivity#backactivity.main_icon,
		sub_icon = BackActivity#backactivity.sub_icon,
		open_win = BackActivity#backactivity.open_win,
		sort = BackActivity#backactivity.sort,
		title = BackActivity#backactivity.title,
		content = BackActivity#backactivity.content
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 把后台的活动配置换算成服务器的时间戳
%% 写入backstage.backactivity_convert表
check_and_convert_backactivity() ->
	BackActivityBsonList = db_backactivity:load_update_back_activity(),
	db_backactivity:save_to_backactivity_convert(BackActivityBsonList),
	ok.

%% 读取backstage.backactivity_convert表, 读取条件：
%% update_flag = 1 && is_open = 0时读取进来, 处理活动的关闭操作
%% 或者 update_flag = 1 && is_open = 1 && start_tick =< NowTick =< disappear_tick时读取进来
%% 其他的记录都不读取也不修改
%% 读取了的记录会被删除, 写入到mmo.backactivity_active表
check_and_active_backactivity() ->
	BackActivityConvertList = db_backactivity:load_convert_backactivity(),
	BackActivityList = check_and_active_backactivity([], BackActivityConvertList),
	case length(BackActivityList) > 0 of
		true ->
			notify_all_backactivity_state_vary(BackActivityList),
			async_apply_all_player(fun lib_player_backactivity:async_backactivity_when_back_update/1, [BackActivityList]);
		_ -> skip
	end,
	ok.

%% 检查并更新运营活动状态
check_and_update_backactivity_state() ->
	check_and_update_backactivity_state(get_backactivity_map()),
	ok.

%% 检查并删除已消失或强制关闭的运营活动
check_and_remove_backactivity() ->
	check_and_remove_backactivity(get_backactivity_map()),
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 把后台配置的运营活动转换成backactivity_convert记录格式
convert_back_activity_bson(Bson) ->
	{StartTick, EndTick, DisappearTick} = calc_backactivity_tick_of_back_bson(Bson),
	ActIndex = ?BSON_INT(Bson, <<"act_index">>),
	?INFO("load back_activity convert tick: ~p ~p ~p ~p", [ActIndex, StartTick, EndTick, DisappearTick]),
	ConfigString = ?BSON_STRING(Bson, <<"config_string">>) ++ "\n",
	Bson#{
		?BSONSET_INT(<<"start_tick">>, StartTick),
		?BSONSET_INT(<<"end_tick">>, EndTick),
		?BSONSET_INT(<<"disappear_tick">>, DisappearTick),
		?BSONSET_STRING(<<"config_string">>, ConfigString),
		?BSONSET_INT(<<"update_flag">>, 1)
	}.

%% 根据后台配置计算活动的时间
%% 返回:{开始时间戳, 结束时间戳, 消失时间戳}
calc_backactivity_tick_of_back_bson(Bson) ->
	TimeType = ?BSON_INT(Bson, <<"time_type">>),
	if
		TimeType =:= ?BACKACT_TIME_TICK ->
			StartTick = ?BSON_INT(Bson, <<"start_tick">>),
			EndTick = ?BSON_INT(Bson, <<"end_tick">>),
			DisappearTick = EndTick + ?BSON_INT(Bson, <<"disappear_sec">>),
			{StartTick, EndTick, DisappearTick};
		TimeType =:= ?BACKACT_TIME_OPEN ->
			StartDay = ?BSON_INT(Bson, <<"start_day">>),
			EndDay = ?BSON_INT(Bson, <<"end_day">>),
			DisappearSec = ?BSON_INT(Bson, <<"disappear_sec">>),
			calc_backactivity_tick_by_openday(StartDay, EndDay, DisappearSec);
		TimeType =:= ?BACKACT_TIME_COMBINE ->
			StartDay = ?BSON_INT(Bson, <<"start_day">>),
			EndDay = ?BSON_INT(Bson, <<"end_day">>),
			DisappearSec = ?BSON_INT(Bson, <<"disappear_sec">>),
			calc_backactivity_tick_by_combineday(StartDay, EndDay, DisappearSec);
		true ->
			{0, 0, 0}
	end.

%% 按开服天数计算
calc_backactivity_tick_by_openday(StartDay, EndDay, DisappearSec) ->
	OpenTick = config:open_tick(),
	StartTick = OpenTick + StartDay * lib_timer:day_second(),
	EndTick = OpenTick + EndDay * lib_timer:day_second(),
	DisappearTick = EndTick + DisappearSec,
	{StartTick, EndTick, DisappearTick}.

%% 按合服天数计算
calc_backactivity_tick_by_combineday(StartDay, EndDay, DisappearSec) ->
	CombineTick = config:combine_tick(),
	StartTick = CombineTick + StartDay * lib_timer:day_second(),
	EndTick = CombineTick + EndDay * lib_timer:day_second(),
	DisappearTick = EndTick + DisappearSec,
	{StartTick, EndTick, DisappearTick}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
check_and_active_backactivity(BackActivityList, []) ->
	BackActivityList;
check_and_active_backactivity(BackActivityList, [BackActivity | T]) ->
	ActIndex = BackActivity#backactivity.act_index,
	?DEBUG("active backactivity from convert: ~p", [ActIndex]),
	UpdateBackActivity =
		case get_backactivity(ActIndex) of
			undefined ->
				BackActivity0 = BackActivity#backactivity{
					back_update_tick = lib_timer:unixtime(),
					conf = dynamic_compile_backactivity_config(BackActivity#backactivity.config_string)
				},
				BackActivity1 = process_fast_load_config(BackActivity0),
				if
					BackActivity1#backactivity.is_open =:= 1 ->
						remove_cache_remove_list(ActIndex),
						put_backactivity(BackActivity1, true);
					true ->
						remove_cache_save_list(ActIndex),
						insert_cache_remove_list(ActIndex)
				end,
				BackActivity1;
			OrgBackActivity ->
				NewBackActivity = update_backactivity_by_back_config(OrgBackActivity, BackActivity),
				if
					NewBackActivity#backactivity.is_open =:= 1 ->
						remove_cache_remove_list(ActIndex),
						if
							OrgBackActivity#backactivity.state =/= NewBackActivity#backactivity.state ->
								?INFO("fix backactivity state: ~p ~p ~p", [ActIndex, OrgBackActivity#backactivity.state, NewBackActivity#backactivity.state]),
								lib_backact_listen:listen_backactivity_state(?SYNC_BACKACT_STATE_FIX, NewBackActivity, OrgBackActivity#backactivity.state, NewBackActivity#backactivity.state);
							true -> skip
						end;
					true ->
						lib_backact_listen:listen_backactivity_force_close(NewBackActivity, OrgBackActivity#backactivity.state),
						remove_cache_save_list(ActIndex),
						insert_cache_remove_list(ActIndex)
				end,
				NewBackActivity
		end,
	db_backactivity:update_convert_backactivity_flag(ActIndex),
	check_and_active_backactivity([UpdateBackActivity | BackActivityList], T).

update_backactivity_by_back_config(OrgBackActivity, BackActivity) ->
	NewBackActivity0 = OrgBackActivity#backactivity{
		is_open = BackActivity#backactivity.is_open,
		start_tick = BackActivity#backactivity.start_tick,
		end_tick = BackActivity#backactivity.end_tick,
		disappear_tick = BackActivity#backactivity.disappear_tick,
		back_update_tick = lib_timer:unixtime(),
		config_string = BackActivity#backactivity.config_string,
		conf = dynamic_compile_backactivity_config(BackActivity#backactivity.config_string),
		main_type = BackActivity#backactivity.main_type,
		sort = BackActivity#backactivity.sort,
		main_icon = BackActivity#backactivity.main_icon,
		sub_icon = BackActivity#backactivity.sub_icon,
		open_win = BackActivity#backactivity.open_win,
		title = BackActivity#backactivity.title,
		content = BackActivity#backactivity.content,
		level = BackActivity#backactivity.level
	},
	NewBackActivity1 =
		if
			OrgBackActivity#backactivity.config_string =/= BackActivity#backactivity.config_string ->
				process_fast_load_config(NewBackActivity0);
			true ->
				NewBackActivity0
		end,
	NewBackActivity =
		if
			NewBackActivity1#backactivity.is_open =:= 1 -> fix_backactivity_state(NewBackActivity1);
			true -> NewBackActivity1
		end,
	put_backactivity(NewBackActivity, true),
	NewBackActivity.

dynamic_compile_backactivity_config(ConfigString) ->
	{Mod, Code} = dynamic_compile:from_string(ConfigString),
	code:purge(Mod),
	code:load_binary(Mod, Mod, Code),
	KeyList = Mod:get_list(),
%%	?DEBUG("backactivity config key_list: ~p ~w", [Mod, KeyList]),
	lists:foldl(
		fun(Key, AccConfigMap0) ->
			Val = Mod:get(Key),
%%			?DEBUG("dynamic backactivity config: ~p ~p ~w", [Mod, Key, Val]),
			maps:put(Key, Val, AccConfigMap0)
		end, #{get_list => KeyList}, KeyList).

fix_backactivity_state(BackActivity) ->
	NowTick = lib_timer:unixtime(),
	#backactivity{
		start_tick = StartTick,
		end_tick = EndTick,
		disappear_tick = DisappearTick
	} = BackActivity,
	if
		NowTick < StartTick ->
			BackActivity#backactivity{state = ?BACKACT_STATE_NOSTART};
		StartTick =< NowTick andalso NowTick < EndTick ->
			BackActivity#backactivity{state = ?BACKACT_STATE_START};
		EndTick =< NowTick andalso NowTick < DisappearTick ->
			BackActivity#backactivity{state = ?BACKACT_STATE_STOP};
		true ->
			BackActivity#backactivity{state = ?BACKACT_STATE_DISAPPEAR}
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
check_and_update_backactivity_state(BackActivityMap) ->
	{NewBackActivityMap, StateActivityList} = maps:fold(
		fun(ActIndex, BackActivity, {AccBackActivityMap0, AccStateActivityList0}) ->
			try
				?JUDGE_RETURN(BackActivity#backactivity.is_open =:= 1, -1),
				#backactivity{
					state = OrgState,
					start_tick = StartTick,
					end_tick = EndTick,
					disappear_tick = DisappearTick
				} = BackActivity,
				NowTick = lib_timer:unixtime(),
				if
					OrgState =/= ?BACKACT_STATE_NOSTART andalso NowTick < StartTick ->
						NewBackActivity = BackActivity#backactivity{state = ?BACKACT_STATE_NOSTART},
						lib_backact_listen:listen_backactivity_state(?SYNC_BACKACT_STATE_NORMAL, NewBackActivity, OrgState, ?BACKACT_STATE_NOSTART),
						{maps:put(ActIndex, NewBackActivity, AccBackActivityMap0), [NewBackActivity | AccStateActivityList0]};
					OrgState =/= ?BACKACT_STATE_START andalso StartTick =< NowTick andalso NowTick < EndTick ->
						NewBackActivity = BackActivity#backactivity{state = ?BACKACT_STATE_START},
						lib_backact_listen:listen_backactivity_state(?SYNC_BACKACT_STATE_NORMAL, NewBackActivity, OrgState, ?BACKACT_STATE_START),
						{maps:put(ActIndex, NewBackActivity, AccBackActivityMap0), [NewBackActivity | AccStateActivityList0]};
					OrgState =/= ?BACKACT_STATE_STOP andalso EndTick =< NowTick andalso NowTick < DisappearTick ->
						NewBackActivity = BackActivity#backactivity{state = ?BACKACT_STATE_STOP},
						lib_backact_listen:listen_backactivity_state(?SYNC_BACKACT_STATE_NORMAL, NewBackActivity, OrgState, ?BACKACT_STATE_STOP),
						{maps:put(ActIndex, NewBackActivity, AccBackActivityMap0), [NewBackActivity | AccStateActivityList0]};
					OrgState =/= ?BACKACT_STATE_DISAPPEAR andalso DisappearTick =< NowTick ->
						NewBackActivity = BackActivity#backactivity{state = ?BACKACT_STATE_DISAPPEAR},
						lib_backact_listen:listen_backactivity_state(?SYNC_BACKACT_STATE_NORMAL, NewBackActivity, OrgState, ?BACKACT_STATE_DISAPPEAR),
						insert_cache_remove_list(ActIndex),
						{maps:put(ActIndex, NewBackActivity, AccBackActivityMap0), [NewBackActivity | AccStateActivityList0]};
					true ->
						{AccBackActivityMap0, AccStateActivityList0}
				end
			catch
				throw:{error, _ErrCode} ->
					{AccBackActivityMap0, AccStateActivityList0}
			end
		end, {BackActivityMap, []}, BackActivityMap),
	case length(StateActivityList) > 0 of
		true ->
			notify_all_backactivity_state_vary(StateActivityList),
			async_apply_all_player(fun lib_player_backactivity:async_backactivity_state_vary/1, [StateActivityList]);
		_ -> skip
	end,
	put_backactivity_map(NewBackActivityMap).

notify_all_backactivity_state_vary(StateActivityList) ->
	ProtoActivityList = lists:foldl(
		fun(BackActivity, AccProtoActivityList0) ->
			Proto = serialize_proto_backact(BackActivity),
			[Proto | AccProtoActivityList0]
		end, [], StateActivityList),
	Respond = #'Proto80108001'{
		backact_list = ProtoActivityList
	},
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_notify/2, [Respond]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
check_and_remove_backactivity(BackActivityMap) ->
	NewBackActivityMap = maps:fold(
		fun(ActIndex, BackActivity, AccBackActivityMap0) ->
			if
				BackActivity#backactivity.is_open =:= 0 ->
					insert_cache_remove_list(ActIndex),
					maps:remove(ActIndex, AccBackActivityMap0);
				BackActivity#backactivity.state =:= ?BACKACT_STATE_DISAPPEAR ->
					insert_cache_remove_list(ActIndex),
					maps:remove(ActIndex, AccBackActivityMap0);
				true ->
					AccBackActivityMap0
			end
		end, BackActivityMap, BackActivityMap),
	put_backactivity_map(NewBackActivityMap).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 不同的活动配置预处理接口
%% 写入到#backactivity.fast_conf字段
%% 设计思路: process_fast_load_config是在统一运营活动处理上下文语境处理的逻辑
%%			lib_backact_listen:listen_backactivity_fast_load_config
%%				是每个运营活动特殊处理逻辑
process_fast_load_config(BackActivity) ->
	lib_backact_listen:listen_backactivity_fast_load_config(BackActivity).

