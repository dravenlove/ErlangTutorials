%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2021 11:46
%%%-------------------------------------------------------------------
-module(lib_player_activity_handle).
-author("13661").

-include("common.hrl").
-include("activity.hrl").
-include("activity_player.hrl").

%% API
-export([
	process_cache_event/0,
	process_cache_event_end/3
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
	% reset_data/2,
	% modify_data/2,

	check_activity_event/0,
	check_activity_event/1,
	check_activity_event_end/1,
	check_activity_event_end/2
]).
-export([
	sign_in/0,					%%登陆
	sign_out/0,					%%登出
	level_upgrade/0,			%%升级
	system_refresh/0,			%%每日通用刷新处理
	reset_everyday/0,			%%每日0点重置
	% reset_everyweek/0,			%%每周重置
	process_recharge_gold/2,	%%充值金条
	process_recharge_money/3,	%%充值金钱
	process_recharge_all/3		%%任意充值
	% process_consume/2			%%消费金条
]).
-export([
	sign_in_end/2,
	level_upgrade_end/1,
	system_refresh_end/1,
	reset_everyday_end/1,
	% reset_everyweek_end/1,
	process_recharge_gold_end/3,
	process_recharge_money_end/4,
	process_recharge_all_end/4
	% process_consume_end/3
]).

put_cache_event({_F, _A} = Event) ->
	Info = lib_player_activity:get_player_activity(),
	CacheList = Info#player_activity.event_cache_list,
	lib_player_activity:put_player_activity(Info#player_activity{event_cache_list = [Event | CacheList]})
.

cache_event_list() ->
	Info = lib_player_activity:get_player_activity(),
	Info#player_activity.event_cache_list
.

clear_cache_event() ->
	Info = lib_player_activity:get_player_activity(),
	lib_player_activity:put_player_activity(Info#player_activity{event_cache_list = []})
.

process_cache_event() ->
	CacheEventList = cache_event_list(),
	clear_cache_event(),
	case length(CacheEventList) > 0 of
		true -> lib_player_activity:async_activity_list_apply(fun process_cache_event_end/3, [CacheEventList]);
		false -> skip
	end
.
process_cache_event_end(TID, ActivityList, CacheEventList) ->
	% CacheEventList = cache_event_list(),
	% clear_cache_event(),

	lib_common:list_map(fun({Fun, _Args} = Event) ->
		try
			async_process_event_done(TID, ActivityList, Event)
		catch
			Reason: Result -> ?ERROR("process_cache_event error [~p] ~p,~p	~p", [Fun, Reason, Result, erlang:get_stacktrace()])
		end
	end, CacheEventList)
.

error_output(Output, Activity, Reason, Result) when is_record(Activity, activity) ->
	?ERROR("~ts, [~p] [~p] [~p] ~p:~p ~p ~n", [Output, Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, Reason, Result, erlang:get_stacktrace()])
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
	Event = {Fun, Args},
	case Delay of
		true -> put_cache_event(Event);
		false -> lib_player_activity:async_activity_list_apply(fun async_process_event_done/3, [Event])
	end
.
async_process_event_done(_TID, ActivityList, {Fun, Args} = _Event) ->
	lists:map(fun(Activity) ->
		try
			?JUDGE_CONTINUE(lib_activity_api:is_ongoing(Activity)),
			apply(Fun, [Activity | Args])
		catch
			throw : continue -> skip;
			Reason: Result ->
				ErrStr = io_lib:format("activity player ~p error", [Fun]),
				error_output(ErrStr, Activity, Reason, Result)
		end
  	end, ActivityList)
.

new_data(Activity) when is_record(Activity, activity) ->
	MainType = Activity#activity.main_type,
	case MainType of
		?ACTIVITY_MAIN_TYPE_ACC_RECHARGE ->
			#cumulatice_recharge{};
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK ->
			#player_open_server{day_award = ?BOX_RECEIVED};
		_ -> #{}
	end
.

% reset_data(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
% 	MainType = Activity#activity.main_type,
% 	_Data = Detail#activity_detail.data,

% 	case MainType of
% 		_ -> new_data(Activity)
% 	end
% .

% modify_data(Detail, Activity) when is_record(Detail, activity_detail), is_record(Activity, activity) ->
% 	MainType = Activity#activity.main_type,
% 	_Data = Detail#activity_detail.data,

% 	case MainType of
% 		_ -> reset_data(Detail, Activity)
% 	end
% .

%%检查活动event
check_activity_event() ->
	lib_player_activity:async_activity_list_apply(fun check_activity_event_end/2)
.
check_activity_event(UID) ->
	lib_player_activity:async_activity_apply(UID, fun check_activity_event_end/1)
.
check_activity_event_end(_TID, ActivityList) when is_list(ActivityList) ->
	lists:map(fun(Activity) ->
		check_activity_event_end(Activity)
  	end, ActivityList)
.
check_activity_event_end(Activity) when is_record(Activity, activity) ->
	try
		?JUDGE_RETURN(lib_activity_api:is_ongoing(Activity), -1),
		MainType = Activity#activity.main_type,
		_ActId = Activity#activity.id,
		case MainType of
			_ -> skip
		end
	catch
		throw: {error, _} -> skip;
		Reason: Result -> error_output("activity player event err", Activity, Reason, Result)
	end
.

%%登陆处理
sign_in() ->
	lib_player_activity:async_activity_list_apply(fun sign_in_end/2)
.
sign_in_end(TID, ActivityList) when is_list(ActivityList) ->
	ActivityMap = 
	lists:foldl(fun(Activity, Map) -> 
		maps:put(Activity#activity.id, Activity, Map)	
	end, maps:new(), ActivityList),
	lib_player_activity:remove_expire_detail(TID, ActivityMap),

	lists:map(fun(Activity) ->
		try
			sign_in_fun(Activity)
		catch
			throw : {error, _} -> skip;
			Reason: Result -> error_output("activity player sign_in_end error", Activity, Reason, Result)
		end
  	end, ActivityList),

	check_activity_event_end(TID, ActivityList),
	lib_player_activity:check_login_assist(TID, ActivityList)
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
	async_process_event(fun level_upgrade_end/1)
	% lib_player_activity:fetch_activity_list()
.
level_upgrade_end(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%每日通用刷新处理
system_refresh() ->
	async_process_event(fun system_refresh_end/1)
.
system_refresh_end(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK -> lib_player_open_server_rank:refresh_day_award(Activity);
		_ -> skip
	end
.

%%每日0点重置处理
reset_everyday() ->
	async_process_event(fun reset_everyday_end/1)
.
reset_everyday_end(Activity) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

% %%每周重置处理
% reset_everyweek() ->
% 	async_process_event(fun reset_everyweek_end/1)
% .
% reset_everyweek_end(Activity) ->
% 	_ActivityId = Activity#activity.id,
% 	MainType = Activity#activity.main_type,

% 	case MainType of
% 		_ -> skip
% 	end
% .

%%充值金条处理
process_recharge_gold(Money, Gold) ->
	% mod_server:async_apply(fun mod_backstage_activity_monitor:player_recharge/2, [lib_player:player_id(), Gold]),
	async_process_event(fun process_recharge_gold_end/3, [Money, Gold])
.
process_recharge_gold_end(Activity, _RechargeMoney, Gold) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		?ACTIVITY_MAIN_TYPE_ACC_RECHARGE ->
			lib_player_cumulative_recharge:process_recharge(Activity, Gold);
		_ -> skip
	end
.

%%充值金钱处理
process_recharge_money(ConfId, Money, Gold) ->
	async_process_event(fun process_recharge_money_end/4, [ConfId, Money, Gold])
.
process_recharge_money_end(Activity, _ConfId, _Money, _Gold) ->
	_ActivityId = Activity#activity.id,
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> skip
	end
.

%%任意充值处理
process_recharge_all(ConfId, RechargeMoney, RechargeGold)->
	async_process_event(fun process_recharge_all_end/4, [ConfId, RechargeMoney, RechargeGold])
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
% process_consume(Gold, SerialType) ->
% 	mod_server:async_apply(fun mod_backstage_activity_monitor:player_consume/2, [lib_player:player_id(), Gold]),
% 	async_process_event(fun process_consume_end/3, [Gold, SerialType])
% .
% process_consume_end(Activity, _Gold, _SerialType) ->
% 	_ActivityId = Activity#activity.id,
% 	MainType = Activity#activity.main_type,

% 	case MainType of
% 		_ -> skip
% 	end
% .