%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 十二月 2019 11:09
%%%-------------------------------------------------------------------
-module(lib_backstage_activity).
-author("13661").

-include("common.hrl").
-include("backstage_activity.hrl").
-include("ProtoPublic.hrl").

%% API
-export([ %%进程无关接口
	build_index/0,
	validate_time/1,		%%是否在开启时间内
	get_process_name/1,		%%获取活动进程名
	get_pid/1,				%%活动活动进程ID
	is_have_process/1,		%%是否有活动进程
	notify_activity/2,		%%cast通知活动
	is_initialized/1,		%%活动是否已初始化
	is_started/1,			%%活动是否已开始
	is_ended/1,				%%活动是否已结束
	is_closed/1,			%%活动是否被关闭
	is_ongoing/1,			%%活动是否进行中
	is_hide/1,				%%活动是否已隐藏
	start_tick/1,			%%活动开始时间
	end_tick/1,				%%活动结束时间
	left_time/1,			%%活动剩余时间
	activity_to_proto/1,
	delete_surplus/1		%%删除多余的数据
]).
-export([	%%活动进程使用接口
	get_activity/0,						%%获取活动#activity
	get_activity_config/0,				%%获取活动config
	get_activity_data/0,				%%获取活动Data
	update_activity_data/1,				%%更新活动Data

	set_activity_hide/1,				%%设置活动是否显示
	set_activity_hide/2,				%%设置活动是否显示
	set_activity_client_value/1,		%%设置客户端额外值
	set_activity_extra_val/1,			%%设置活动extra_value
	set_activity_timeout/1,				%%设置活动超时时间
	clear_activity_timeout/0,			%%清除超时

	notify_activity_update/0,			%%通知全部玩家活动更新
	notify_player_activity_update/1,	%%通知玩家活动更新

	timer/4,							%%计时器
	player_async_apply/3				%%玩家异步apply
]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_MMO_ACTIVITY, {?TUPLE_INT(id, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_MMO_ACTIVITY, {?TUPLE_INT(is_close, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_MMO_ACTIVITY, {?TUPLE_INT(id, 1), ?TUPLE_INT(update_tick, 1)}),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, {?TUPLE_INT(id, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, {?TUPLE_INT(is_close, 1)}, false),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DB_MMO_ACTIVITY, {?TUPLE_INT(id, 1), ?TUPLE_INT(update_tick, 1)})
.

validate_time(Activity) when is_record(Activity, activity) ->
	CurTick = lib_timer:unixtime(),
	start_tick(Activity) =< CurTick andalso CurTick < end_tick(Activity)
.

get_process_name(ActivityId) ->
	util:to_atom("activity_" ++ util:to_list(ActivityId))
.

get_pid(ActivityId) ->
	ProcessName = get_process_name(ActivityId),
	erlang:whereis(ProcessName)
.

is_have_process(ActivityId) ->
	Pid = get_pid(ActivityId),
	case is_pid(Pid) of
		false -> false;
		true -> is_process_alive(Pid)
	end
.

notify_activity(ActivityId, Msg) ->
	Pid = get_pid(ActivityId),
	case is_pid(Pid) of
		false -> skip;
		true ->
			case is_process_alive(Pid) of
				false -> skip;
				true -> mod_server:cast(Pid, Msg)
			end
	end
.

is_initialized(Activity) when is_record(Activity, activity) ->
	Activity#activity.is_initialized
.

is_started(Activity) when is_record(Activity, activity) ->
	Activity#activity.is_started
.

is_ended(Activity) when is_record(Activity, activity) ->
	Activity#activity.is_ended
.

is_closed(Activity) when is_record(Activity, activity) ->
	Activity#activity.is_close
.

is_ongoing(Activity) when is_record(Activity, activity) ->
	is_started(Activity) andalso not is_ended(Activity) andalso not is_closed(Activity)
.

is_hide(Activity) when is_record(Activity, activity) ->
	Activity#activity.is_hide
.

start_tick(Activity) when is_record(Activity, activity) ->
	case Activity#activity.time_type of
		?ACTIVITY_TIME_TYPE_TICK ->
			Activity#activity.start_tick;
		?ACTIVITY_TIME_TYPE_OPEN_DAY ->
			CurTick = lib_timer:unixtime(),
			CurOpenDay = config:get_open_days(CurTick),

			CurOpenDay2 =
			case CurOpenDay < 0 of
				true -> CurOpenDay + 1;
				false -> CurOpenDay
			end,

			DiffDay = Activity#activity.start_day - CurOpenDay2,
			lib_timer:current_zero_unixtime(CurTick) + DiffDay * lib_timer:day_second()
	end
.

end_tick(Activity) when is_record(Activity, activity) ->
	case Activity#activity.time_type of
		?ACTIVITY_TIME_TYPE_TICK ->
			Activity#activity.end_tick;
		?ACTIVITY_TIME_TYPE_OPEN_DAY ->
			CurTick = lib_timer:unixtime(),
			CurOpenDay = config:get_open_days(CurTick),

			CurOpenDay2 =
			case CurOpenDay < 0 of
				true -> CurOpenDay + 1;
				false -> CurOpenDay
			end,

			DiffDay = Activity#activity.end_day - CurOpenDay2,
			lib_timer:current_zero_unixtime(CurTick) + DiffDay * lib_timer:day_second() - lib_timer:minute_second()
	end
.

left_time(Activity) when is_record(Activity, activity) ->
	try
		case Activity#activity.main_type of
			_ ->
				CurTick = lib_timer:unixtime(),
				LeftTime = end_tick(Activity) - CurTick,
				case LeftTime < 0 of
					false -> LeftTime;
					true -> 0
				end
		end
	catch
		Reason: Result -> ?ERROR("backstage activity left_time ~p ~p~n", [Reason, Result]), 0
	end
.

activity_to_proto(Activity) when is_record(Activity, activity) ->
	#'ProtoActivityBase'{
		id = Activity#activity.id,
		main_type = Activity#activity.main_type,
		sub_type = Activity#activity.sub_type,
		group_type = Activity#activity.group_type,
		title = Activity#activity.title,
		content = Activity#activity.content,
		icon = Activity#activity.icon,
		level_limit = Activity#activity.level_limit,
		start_tick = start_tick(Activity),
		end_tick = end_tick(Activity),
		left_time = left_time(Activity),
		sort = Activity#activity.sort,
		extra_value = Activity#activity.client_value
	}
.

%% 去掉多余的信息
delete_surplus(Activity) when is_record(Activity, activity) ->
	MainType = Activity#activity.main_type,

	case MainType of
		_ -> Activity#activity{
			data = undefined,
			config_str = undefined,
			config_bson = undefined
		}
	end
.

get_activity() ->
	mod_backstage_activity:get_activity()
.

update_activity(Activity) when is_record(Activity, activity) ->
	mod_backstage_activity:update_activity(Activity)
.
update_activity(Activity, InsertEts) when is_record(Activity, activity), is_boolean(InsertEts) ->
	mod_backstage_activity:update_activity(Activity, InsertEts)
.

get_activity_config() ->
	Activity = get_activity(),
	Activity#activity.config
.

get_activity_data() ->
	Activity = get_activity(),
	Activity#activity.data
.

update_activity_data(Data) ->
	Activity = get_activity(),
	update_activity(Activity#activity{data = Data}, false) %%现获取活动列表时不能使用data, 所以此处不需要更新ETS
.

set_activity_hide(IsHide) when is_boolean(IsHide)->
	set_activity_hide(IsHide, false)
.
set_activity_hide(IsHide, IsNotify) when is_boolean(IsHide) andalso is_boolean(IsNotify) ->
	Activity = get_activity(),
	update_activity(Activity#activity{is_hide = IsHide}),

	case IsNotify of
		false -> skip;
		true -> notify_activity_update()
	end
.

set_activity_client_value(Value) when is_integer(Value) ->
	Activity = get_activity(),
	update_activity(Activity#activity{client_value = Value})
.

set_activity_extra_val(Value) ->
	Activity = get_activity(),
	update_activity(Activity#activity{extra_value = Value})
.

set_activity_timeout(TimeOutTick) ->
	Activity = get_activity(),
	update_activity(Activity#activity{is_open_timeout = true, timeout_tick = TimeOutTick})
.

clear_activity_timeout() ->
	Activity = get_activity(),
	update_activity(Activity#activity{is_open_timeout = false})
.

notify_activity_update() ->
	mod_backstage_activity_monitor:notify_online_player_update(get_activity())
.

notify_player_activity_update(PlayerId) ->
	Activity = lib_backstage_activity:delete_surplus(get_activity()),
	lib_backstage_activity:player_async_apply(PlayerId, fun lib_player_backstage_activity:notify_activity_update/1, [[Activity]])
.

timer(Msec, M, F, A) ->
	erlang:send_after(Msec, self(), {timer, M, F, A})
.

player_async_apply(PlayerId, Fun, Args) ->
	mod_player:async_apply(PlayerId, Fun, Args)
.