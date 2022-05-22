%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 六月 2020 18:29
%%%-------------------------------------------------------------------
-module(lib_player_backstage_activity_handle).
-author("13661").

-include("common.hrl").
-include("backstage_activity.hrl").
-include("backstage_activity_player.hrl").

%% API
-export([
	process_cache_event/0,
	process_cache_event_end/1
]).
-export([
	%%异步获取活动列表后执行事件处理回调函数
	async_process_event/1,
	async_process_event/2,
	async_process_event/3,
	async_process_event_done/3
]).
-export([
	new_data/1,
	reset_data/2,
	modify_data/2,

	check_activity_event/0,
	check_activity_event/1,
	check_activity_event_end/1
]).
-export([
	sign_in/0,					%%登陆
	sign_out/0,					%%登出
	level_upgrade/0,			%%升级
	reset_everyday/0,			%%每日充值
	reset_everyweek/0,			%%每周重置
	process_recharge_gold/2,	%%充值金条
	process_recharge_money/1,	%%充值金钱
	process_recharge_all/3,		%%充值全部
	process_consume/2			%%消费金条
]).
-export([
	sign_in_end/1,
	level_upgrade_end/1,
	reset_everyday_end/1,
	reset_everyweek_end/1,
	process_recharge_gold_end/3,
	process_recharge_money_end/2,
	process_recharge_all_end/4,
	process_consume_end/3
]).

put_cache_event({_M, _F, _A} = Event) ->
	Info = lib_player_backstage_activity:get_player_activity(),
	CacheList = Info#player_back_act.event_cache_list,
	lib_player_backstage_activity:put_player_activity(Info#player_back_act{event_cache_list = [Event | CacheList]})
.

cache_event_list() ->
	Info = lib_player_backstage_activity:get_player_activity(),
	Info#player_back_act.event_cache_list
.

clear_cache_event() ->
	Info = lib_player_backstage_activity:get_player_activity(),
	lib_player_backstage_activity:put_player_activity(Info#player_back_act{event_cache_list = []})
.

process_cache_event() ->
	CacheEventList = cache_event_list(),
	case length(CacheEventList) > 0 of
		true -> lib_player_backstage_activity:async_activity_list_apply(fun lib_player_backstage_activity_handle:process_cache_event_end/1);
		false -> skip
	end
.
process_cache_event_end(ActivityList) ->
	CacheEventList = cache_event_list(),
	clear_cache_event(),

	lib_common:list_map(fun({Fun, Args}) ->
		try
			async_process_event_done(ActivityList, Fun, Args)
		catch
			Reason: Result -> ?ERROR("process_cache_event error [~p] ~p,~p	~p", [Fun, Reason, Result, erlang:get_stacktrace()])
		end
	end, CacheEventList)
.

error_output(Output, Activity, Reason, Result) when is_record(Activity, activity) ->
	?ERROR("~ts, [~p] [~p] [~p] [~p] ~p:~p ~p ~n", [Output, Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, Activity#activity.update_tick, Reason, Result, erlang:get_stacktrace()])
.

%%异步获取活动列表后执行事件处理回调函数
%%参数:
%% M: 回调模块, 默认为?MODULE
%% F: 回调函数
%% A: 回调参数, 完整参数为[Activity(活动信息) | A]
%% Delay : 是否延迟处理, 默认为true
async_process_event(Fun) ->
	async_process_event(Fun, [])
.
async_process_event(Fun, Args) ->
	async_process_event(Fun, Args, true)
.
async_process_event(Fun, Args, Delay) when is_boolean(Delay) ->
	case Delay of
		true -> put_cache_event({Fun, Args});
		false -> lib_player_backstage_activity:async_activity_list_run(fun lib_player_backstage_activity_handle:async_process_event_done/3, [Fun, Args])
	end
.
async_process_event_done(ActivityList, Fun, Args) ->
	lists:map(fun(Activity) ->
		try
			?JUDGE_CONTINUE(lib_backstage_activity:is_ongoing(Activity)),
			apply(Fun, [Activity | Args])
		catch
			throw : continue -> skip;
			Reason: Result ->
				ErrStr = io_lib:format("backstage activity player ~p error", [Fun]),
				error_output(ErrStr, Activity, Reason, Result)
		end
  	end, ActivityList)
.

new_data(Activity) when is_record(Activity, activity) ->
	MainType = Activity#activity.main_type,
	case MainType of
		_ -> #{}
	end
.

reset_data(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
	MainType = Activity#activity.main_type,
	_Data = Detail#activity_detail.data,

	case MainType of
		_ -> new_data(Activity)
	end
.

modify_data(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
	MainType = Activity#activity.main_type,
	_Data = Detail#activity_detail.data,

	case MainType of
		_ -> reset_data(Detail, Activity)
	end
.

%%检查活动event
check_activity_event() ->
	lib_player_backstage_activity:async_activity_list_apply(fun lib_player_backstage_activity_handle:check_activity_event_end/1)
.
check_activity_event(ActId) ->
	lib_player_backstage_activity:async_activity_apply(ActId, fun lib_player_backstage_activity_handle:check_activity_event_end/1)
.
check_activity_event_end(ActivityList) when is_list(ActivityList) ->
	lists:map(fun(Activity) ->
		check_activity_event_end(Activity)
  	end, ActivityList)
;
check_activity_event_end(Activity) when is_record(Activity, activity) ->
	try
		?JUDGE_RETURN(lib_backstage_activity:is_ongoing(Activity), -1),
		MainType = Activity#activity.main_type,
		_ActId = Activity#activity.id,
		case MainType of
			_ -> skip
		end
	catch
		throw: {error, _} -> skip;
		Reason: Result -> error_output("backstage activity player event err", Activity, Reason, Result)
	end
.

%%登陆处理
sign_in() ->
	lib_player_backstage_activity:async_activity_list_apply(fun lib_player_backstage_activity_handle:sign_in_end/1)
.
sign_in_end(ActivityList) when is_list(ActivityList) ->
	ActIdList = [ ActId || #activity{id = ActId} <- ActivityList],
	lib_player_backstage_activity:remove_expire_detail(ActIdList),

	lists:map(fun(Activity) ->
		try
			sign_in_fun(Activity)
		catch
			throw : {error, _} -> skip;
			Reason: Result -> error_output("backstage activity player sign_in_end error", Activity, Reason, Result)
		end
  	end, ActivityList),

	check_activity_event_end(ActivityList),
	lib_player_backstage_activity:check_login_assist()
.
sign_in_fun(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%登出处理
sign_out() ->
	skip
.

%%升级处理
level_upgrade() ->
	async_process_event(fun lib_player_backstage_activity_handle:level_upgrade_end/1),
	lib_player_backstage_activity:fetch_activity_list()
.
level_upgrade_end(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%每天重置处理
reset_everyday() ->
	async_process_event(fun lib_player_backstage_activity_handle:reset_everyday_end/1)
.
reset_everyday_end(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%每周重置处理
reset_everyweek() ->
	async_process_event(fun lib_player_backstage_activity_handle:reset_everyweek_end/1)
.
reset_everyweek_end(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%充值金条处理
process_recharge_gold(Gold, _RechargeMoney) ->
	mod_server:async_apply(fun mod_backstage_activity_monitor:player_recharge/2, [lib_player:player_id(), Gold]),
	async_process_event(fun lib_player_backstage_activity_handle:process_recharge_gold_end/3, [Gold, _RechargeMoney])
.
process_recharge_gold_end(Activity, _Gold, _RechargeMoney) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%充值金钱处理
process_recharge_money(Type) ->
	async_process_event(fun lib_player_backstage_activity_handle:process_recharge_money_end/2, [Type])
.
process_recharge_money_end(Activity, _Type) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%全部充值处理
process_recharge_all(ConfId, RechargeMoney, RechargeGold)->
	async_process_event(fun lib_player_backstage_activity_handle:process_recharge_all_end/4, [ConfId, RechargeMoney, RechargeGold])
.
process_recharge_all_end(Activity, _ConfId, _RechargeMoney, _RechargeGold)->
	%%调用在线奖励补偿
%%	online_gift:online_gift_recharge_compensate(),

	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%消费处理
process_consume(Gold, SerialType) ->
	mod_server:async_apply(fun mod_backstage_activity_monitor:player_consume/2, [lib_player:player_id(), Gold]),
	async_process_event(fun lib_player_backstage_activity_handle:process_consume_end/3, [Gold, SerialType])
.
process_consume_end(Activity, _Gold, _SerialType) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.