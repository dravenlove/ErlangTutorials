%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 十二月 2019 11:08
%%%-------------------------------------------------------------------
-module(mod_backstage_activity_monitor).
-author("13661").

-include("common.hrl").
-include("rank.hrl").
-include("backstage_activity.hrl").

%% API
-export([start/0, start_link/0, stop/0, get_pid/0, do_init/1, do_db_init/2, do_stop/0, do_call/3, do_cast/2, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	remove_activity/1,
	activity_start/1,
	activity_end/1,
	activity_close/1,
	notify_online_player_update/1,
	all_online_player_async_apply/2,
	refresh_activity_by_backstage/0,
	do_refresh_activity_by_backstage/1
]).
-export([
	player_recharge/2,
	player_consume/2,
	player_activity_list/3
]).

start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], [])
.

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], [])
.

stop() ->
	mod_server:call(?MODULE, stop)
.

get_pid() ->
	erlang:whereis(?MODULE).

do_init([]) ->
	process_flag(trap_exit, true),

	?INFO("mod_activity_monitor started ~n"),

	{ok, #activity_monitor_state{}}
.

do_db_init(State, _Args) ->
	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(NextHour * 1000, self(), hour_timer),
	erlang:send_after(lib_timer:minute_second() * 1000, self(), minute_timer),

	ActivityList = db_backstage_activity:load_mmo_activity(),

	ets:new(?ETS_ACTIVITY_TABLE, [{keypos, #activity.id}, {write_concurrency, true}] ++ ?ETS_OPTIONS),
	ets:insert(?ETS_ACTIVITY_TABLE, ActivityList),

	lists:map(fun(Activity) ->
		mod_backstage_activity:start_link(Activity, false)
	end, ActivityList),

	s_refresh_activity_by_backstage(),

	%%更新backstage库后再init
	lists:map(fun(Activity) ->
		mod_server:cast(lib_backstage_activity:get_pid(Activity#activity.id), init)
  	end, activity_list()),

	%%删除close的活动
	db_backstage_activity:remove_all_close_activity(),

	?INFO("~p db init finish~n", [?MODULE]),
	{noreply, State}.

do_stop() ->
	ActivityList = activity_list(),
	lists:map(fun(Activity) ->
		lib_backstage_activity:is_have_process(Activity#activity.id),
		mod_server:call(lib_backstage_activity:get_pid(Activity#activity.id), stop)
  	end, ActivityList)
.

do_call(_Info, _From, State) ->
	{reply,State,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(hour_timer, State) ->
	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(NextHour * 1000, self(), hour_timer),

	{noreply, State}
;
do_info(minute_timer, State) ->
	erlang:send_after(lib_timer:minute_second() * 1000, self(), minute_timer),

%%	refresh_activity_by_backstage(),

	{noreply, State}
;
do_info(_Info, State) ->
	{noreply, State}
.

do_terminate(_Reason, _State) ->
	do_stop(),
	?INFO("activity monitor stop~n").

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

activity_list() ->
	ets:foldl(fun(Activity, List) ->
		[Activity | List]
  	end, [], ?ETS_ACTIVITY_TABLE)
.

ongoing_activity_list()->
	ets:foldl(fun(Activity, List) ->
		case lib_backstage_activity:is_ongoing(Activity) of
			false -> List;
			true -> [lib_backstage_activity:delete_surplus(Activity) | List]
		end
 	end, [], ?ETS_ACTIVITY_TABLE)
.

s_refresh_activity_by_backstage() ->
%%	CurActivityList = activity_list(),
	{BackActivityList, BackIdList} = db_backstage_activity:load_backstage_activity(),
	refresh_activity_list(BackActivityList, BackIdList)
%%	CurIdList = lists:foldl(fun(Activity, List) ->
%%		[Activity#activity.id | List]
%%	end, [], CurActivityList),
%%
%%	%%已有的活动这次没有加载到, 通知close
%%	lists:map(fun(CurId) ->
%%  		case lists:member(CurId, BackIdList) of
%%			true -> skip;
%%			false -> mod_server:cast(lib_backstage_activity:get_process_name(CurId), {activity_close})
%%		end
%%  	end, CurIdList),
%%
%%	lists:map(fun(BackActivity) ->
%%		BackId = BackActivity#activity.id,
%%		case lists:member(BackId, CurIdList) of
%%			true ->	%%加载到的活动已有, 通知更新
%%				lib_backstage_activity:notify_activity(BackId, {activity_update, BackActivity});
%%			false -> %%加载到的活动之前没有, 创建新活动
%%				case lib_backstage_activity:is_have_process(BackId) of
%%					true -> skip;
%%					false ->
%%						mod_backstage_activity:start_link(BackActivity, true),
%%						mod_server:cast(lib_backstage_activity:get_pid(BackId), init)
%%				end
%%		end
%%  	end, BackActivityList)
.

refresh_activity_by_backstage() ->
	QueryBson = #{?BSONSET_BOOL(is_close, false)},
%%	lib_backdb_api:task_find_mfa(?MODULE, do_refresh_activity_by_backstage, [], ?DB_BACKSTAGE_ACTIVITY, QueryBson)
	BsonList = mongo_poolboy:find(?BACK_POOL, ?DB_BACKSTAGE_ACTIVITY, QueryBson),
	mod_server:async_apply(mod_backstage_activity_monitor, fun do_refresh_activity_by_backstage/1, [BsonList])
.
do_refresh_activity_by_backstage(ReplyBsonList) ->
	if is_list(ReplyBsonList) ->
		CurActivityList = activity_list(),
		UpdateDict = lists:foldl(fun(Activity, Dict) ->
			dict:store(Activity#activity.id, Activity#activity.update_tick, Dict)
	 	end, dict:new(), CurActivityList),

		{BackActivityList, BackIdList} = db_backstage_activity:bson_list_to_activity_list(ReplyBsonList, UpdateDict),

		refresh_activity_list(BackActivityList, BackIdList);
		true -> skip
	end
.

refresh_activity_list(BackActivityList, BackIdList) ->
	?INFO("refresh backstage activity id_list ~w", [BackIdList]),

	CurActivityList = activity_list(),
	CurIdList = lists:foldl(fun(Activity, List) ->
		[Activity#activity.id | List]
	end, [], CurActivityList),

	%%已有的活动这次没有加载到, 通知close
	lists:map(fun(CurId) ->
		case lists:member(CurId, BackIdList) of
			true -> skip;
			false ->
				mod_server:cast(lib_backstage_activity:get_process_name(CurId), {activity_close}),
				?INFO("refresh backstage activity close ~p", [CurId])
		end
	end, CurIdList),

	lists:map(fun(BackActivity) ->
		BackId = BackActivity#activity.id,
		case lists:member(BackId, CurIdList) of
			true ->	%%加载到的活动已有, 通知更新
				lib_backstage_activity:notify_activity(BackId, {activity_update, BackActivity}),
				?INFO("refresh backstage activity update ~p", [BackId]);
			false -> %%加载到的活动之前没有, 创建新活动
				case lib_backstage_activity:is_have_process(BackId) of
					true -> skip;
					false ->
						?INFO("refresh backstage activity new ~p", [BackId]),
						mod_backstage_activity:start_link(BackActivity, true),
						mod_server:cast(lib_backstage_activity:get_pid(BackId), init)
				end
		end
  	end, BackActivityList)
.

notify_all_activity(Msg) ->
	ActivityList = ongoing_activity_list(),
	lists:map(fun(Activity) ->
		ActivityId = Activity#activity.id,
		lib_backstage_activity:notify_activity(ActivityId, Msg)
	end, ActivityList)
.

remove_activity(Activity) ->
	ActivityId = Activity#activity.id,
	ets:delete(?ETS_ACTIVITY_TABLE, ActivityId),
	db_backstage_activity:remove_activity(Activity)
.

activity_start(Activity) ->
	notify_online_player_update([Activity])
.

activity_end(Activity) ->
	notify_online_player_update([Activity])
.

activity_close(Activity) ->
	notify_online_player_update([Activity])
.

notify_online_player_update(Activity) when is_record(Activity, activity) ->
	notify_online_player_update([Activity])
;
notify_online_player_update(ActivityList) when is_list(ActivityList) ->
	NewActivityList = lists:foldl(fun(Activity, List) ->
		[lib_backstage_activity:delete_surplus(Activity) | List]
	end, [], ActivityList),

	all_online_player_async_apply(fun lib_player_backstage_activity:notify_activity_update/1, [NewActivityList])
.

all_online_player_async_apply(Fun, Args) ->
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:all_player_async_apply/3, [Fun, Args])
.

player_recharge(PlayerId, RechargeNumber) ->
	notify_all_activity({player_recharge, PlayerId, RechargeNumber})
.

player_consume(PlayerId, RechargeNumber) ->
	notify_all_activity({player_consume, PlayerId, RechargeNumber})
.

player_activity_list(PlayerId, PFun, PArgs) ->
	lib_backstage_activity:player_async_apply(PlayerId, PFun, [ongoing_activity_list() | PArgs])
.