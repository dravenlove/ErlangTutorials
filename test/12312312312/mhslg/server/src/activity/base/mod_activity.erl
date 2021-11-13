%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 5月 2021 15:47
%%%-------------------------------------------------------------------
-module(mod_activity).
-author("13661").

-include("base.hrl").
-include("log.hrl").
-include("ets.hrl").
-include("activity.hrl").

-define(ACTIVITY_CACHE_FLAG, activity_cache_flag).
-define(ACTIVITY_REMOVE_FLAG, activity_remove_flag).

-define(ONE_MICROSEC, 1000). %% %%通用一秒计时器
-define(TEN_MICROSEC, 10 * 1000). %% %%通用10秒计时器
-define(MINUTE_MICROSEC, 60 * 1000). %% %%通用60秒计时器
-define(FIVE_MINUTE_MICROSEC, 5 * 60 * 1000). %% %%通用五分钟计时器
%% API
-export([start/2, start_link/2, stop/0, do_init/1, do_db_init/2, do_call/3, do_cast/2, do_info/2, do_terminate/2, do_code_change/2]).
-export([get_activity/0, get_activity/1, update_activity/1, update_activity/2]).
-export([
	sync_apply/3,
	sync_apply/4,
	async_apply/3,
	player_request/3,

	fetch_activity/1,
	player_fetch_activity/5
]).

start(Activity, IsNew) ->
	mod_server:start({local, lib_activity_api:get_process_name(Activity)}, ?MODULE, [Activity, IsNew], [])
.
start_link(Activity, IsNew) ->
	mod_server:start_link({local, lib_activity_api:get_process_name(Activity)}, ?MODULE, [Activity, IsNew], [])
.

stop() ->
	mod_server:cast(?MODULE, stop)
.

do_init([Activity, IsNew]) ->
	update_activity(Activity),
	Tick = lib_timer:unixtime(),
	case Activity#activity.main_type of
		?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK -> lib_open_server_rank:rank_award(Tick);
		_ -> skip
	end,


	?INFO("mod_activity start [~p]", [Activity#activity.id]),

	{ok, #activity_state{is_new = IsNew}}
.

do_db_init(State, _Args) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,State,State}.

do_cast(init, State) ->
	?INFO("init "),
	try
		?JUDGE_RETURN(not State#activity_state.is_init, -1),
        CurTick = lib_timer:unixtime(),

        erlang:send_after(?ONE_MICROSEC, self(), sec_timer),

        NextMinSec = lib_timer:next_min_time(CurTick),
		erlang:send_after(NextMinSec * 1000, self(), min_timer),

		erlang:send_after(?FIVE_MINUTE_MICROSEC, self(), five_min_timer),

        NextZero = lib_timer:next_zero_time(),
		erlang:send_after(NextZero * 1000, self(), zero_timer),

		process_activity_process_start(State#activity_state.is_new),

		check_activity_remove(),
		check_activity_init(),
		check_activity_start(),
		% check_activity_timeout(),
		check_activity_daily_reset(),
		check_activity_end()
	catch
	    throw: {error, _} -> skip
	end,

	{noreply, State#activity_state{is_init = true}}
;

% do_cast({activity_update, NewActivity}, State) ->
% 	try
% 		OldActivity = get_activity(),
% 		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
% 		?JUDGE_RETURN(NewActivity#activity.update_tick =/= OldActivity#activity.update_tick, -1),

% 		case OldActivity#activity.main_type =/= NewActivity#activity.main_type orelse OldActivity#activity.sub_type =/= NewActivity#activity.sub_type of
% 			true -> %%活动的main_type 和 sub_type不能被更改
% 				?INFO("update activity error [~p:~p] [~p:~p] [~p:~p]", [
% 				OldActivity#activity.id, NewActivity#activity.id,
% 				OldActivity#activity.main_type, NewActivity#activity.main_type,
% 				OldActivity#activity.sub_type, NewActivity#activity.sub_type]),
% 				throw({error, -1});
% 			false -> skip
% 		end,

% 		case NewActivity#activity.version =:= OldActivity#activity.version of
% 			true ->
% 				before_activity_modify(),
% 				modify_activity(NewActivity, OldActivity),
% 				after_activity_modify();
% 		   	false ->
% 			   	before_activity_reset(),
% 			   	reset_activity(NewActivity, OldActivity),
% 			   	after_activity_reset()
% 	   	end,
% 		check_activity_remove()
% 	catch
% 	    throw: {error, _} -> skip
% 	end,

% 	{noreply, State}
% ;

do_cast({close}, State) ->
	try
		Activity = get_activity(),
		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
		?JUDGE_RETURN(not lib_activity_api:is_closed(Activity), -1),
		?JUDGE_RETURN(not lib_activity_api:is_ended(Activity), -1),
		process_activity_close(),
		remove_activity()
	catch
	    throw: {error, _} -> skip
	end,

	{stop, normal, State}
;
% do_cast({player_recharge, _PlayerId, _RechargeNumber}, #activity_state{is_init = IsInit} = State) ->
% 	try
% 		?JUDGE_RETURN(IsInit, -1),
% 		Activity = get_activity(),
% 		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
% 		?JUDGE_RETURN(not lib_backstage_activity:is_closed(Activity), -1),
% 		skip
% %%		NewActivity = process_player_recharge(Activity, PlayerId, RechargeNumber),
% %%		update_activity(NewActivity)
% 	catch
% 		throw: {error, _} -> skip
% 	end,

% 	{noreply, State}
% ;
% do_cast({player_consume, _PlayerId, _RechargeNumber}, #activity_state{is_init = IsInit} = State) ->
% 	try
% 		?JUDGE_RETURN(IsInit, -1),
% 		Activity = get_activity(),
% 		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
% 		?JUDGE_RETURN(not lib_backstage_activity:is_closed(Activity), -1),
% 		skip
% 	catch
% 		throw: {error, _} -> skip
% 	end,

% 	{noreply, State}
% ;
do_cast(_Info, State) ->
	{noreply, State}.


do_info(sec_timer, State) ->
	try
		erlang:send_after(?ONE_MICROSEC, self(), sec_timer),

		check_activity_start(),
		% check_activity_timeout(),
		check_activity_end()
		% check_activity_daily_reset()
	catch
		Reason: Result -> error_output("activity sec_tiemr error", get_activity(), Reason, Result)
	end,

	{noreply, State}
;
do_info(min_timer, State) ->
	try
		CurTick = lib_timer:unixtime(),
        NextMinSec = lib_timer:next_min_time(CurTick),
        erlang:send_after(NextMinSec * 1000, self(), min_timer),

        check_activity_start(),
		check_activity_end(),

		check_save_activity()
	catch
		Reason: Result -> error_output("activity min_tiemr error", get_activity(), Reason, Result)
	end,

	{noreply, State}
;
do_info(five_min_timer, State) ->
	try
		erlang:send_after(?FIVE_MINUTE_MICROSEC, self(), five_min_timer),

		five_min_execute()
	catch
		Reason: Result -> error_output("activity min_tiemr error", get_activity(), Reason, Result)
	end,

	{noreply, State}
;
do_info(zero_timer, State) ->
	try
		NextZero = lib_timer:next_zero_time(),
		erlang:send_after(NextZero * 1000, self(), zero_timer),

		check_activity_start(),
		check_activity_end(),
		check_activity_daily_reset()
	catch
		Reason: Result -> error_output("activity zero_tiemr error", get_activity(), Reason, Result)
	end,

	{noreply, State}
;
do_info({timer, M, F, A}, State) ->
	try
		Activity = get_activity(),
		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
		?JUDGE_RETURN(not lib_activity_api:is_closed(Activity), -1),
		?JUDGE_RETURN(lib_activity_api:is_started(Activity) andalso not lib_activity_api:is_ended(Activity), -1),
		erlang:apply(M, F, A)
	catch
		throw: {error, _} -> skip;
		Reason: Result -> error_output("activity tiemr error", get_activity(), Reason, Result)
	end,
	{noreply, State}
;
do_info({open_server_timer,Type}, State) ->
	?INFO("rank_award_mail Type : ~p",[Type]),
	lib_open_server_rank:rank_award_mail(Type),

	{noreply, State}
;
do_info(_Info, State) ->
	{noreply, State}
.

do_terminate(_Reason, _State) ->
	process_activity_process_termination(?ACTIVITY_TERMINATION_TYPE_NORMAL),
	save_activity(true)
.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

get_activity() ->
	erlang:get(?MODULE)
.
get_activity(_ActId) ->
	get_activity()
.

put_activity(Activity) when is_record(Activity, activity) ->
	erlang:put(?MODULE, Activity),
	erlang:put(?ACTIVITY_CACHE_FLAG, true)
.

update_activity(Activity) when is_record(Activity, activity) ->
	update_activity(Activity, true)
.
update_activity(Activity, InsertEts) when is_record(Activity, activity), is_boolean(InsertEts) ->
	put_activity(Activity),
	case erlang:get(?ACTIVITY_REMOVE_FLAG) of
		true -> skip;
		_ ->
			case InsertEts of
				false -> skip;
				true -> ets:insert(?ETS_ACTIVITY_TABLE, Activity)
			end
	end
.

activity_id() ->
	Activity = get_activity(),
	Activity#activity.id
.

check_save_activity() ->
	case erlang:get(?ACTIVITY_CACHE_FLAG) of
		true ->
			erlang:put(?ACTIVITY_CACHE_FLAG, false),
			save_activity(false);
		_ -> skip
	end
.
save_activity(Block) ->
	case erlang:get(?ACTIVITY_REMOVE_FLAG) of
		true -> skip;
		_ -> db_activity:save_mmo_activity(get_activity(), Block)
	end
.

remove_activity() ->
%%	save_activity(true),

	erlang:put(?ACTIVITY_REMOVE_FLAG, true),
	mod_server:stop(self()),
	mod_activity_monitor:async_apply(fun mod_activity_monitor:remove_activity/1, [get_activity()])
.

debug_output(Output, Activity) when is_record(Activity, activity) ->
	?INFO("~ts, [~p] [~p] [~p] ~n", [Output, Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type])
.

error_output(Output, Activity, Reason, Result) when is_record(Activity, activity) ->
	?ERROR("~ts, [~p] [~p] [~p] ~p:~p ~p ~n", [Output, Activity#activity.id, Activity#activity.main_type, Activity#activity.sub_type, Reason, Result, erlang:get_stacktrace()])
.

check_activity_remove() ->
	try
		Activity = get_activity(),
		CurTick = lib_timer:unixtime(),

		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),

        {_IsStart, StartTick} = lib_activity_api:calc_start_tick(Activity, CurTick),
        {IsEnd, _} = lib_activity_api:calc_end_tick(Activity, CurTick, StartTick, true),

        ?JUDGE_RETURN(lib_activity_api:is_ended(Activity) orelse (not lib_activity_api:is_started(Activity) andalso IsEnd), -1),

		remove_activity()
	catch
	    throw: {error, _} -> ok
	end
.

check_activity_init() ->
	try
		Activity = get_activity(),
		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
		?JUDGE_RETURN(not lib_activity_api:is_closed(Activity), -1),
		?JUDGE_RETURN(not lib_activity_api:is_initialized(Activity), -1),

		process_activity_init()
	catch
		throw: {error, _} -> ok
	end
.

check_activity_start() ->
	try
		Activity = get_activity(),
		CurTick = lib_timer:unixtime(),
		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
		?JUDGE_RETURN(not lib_activity_api:is_closed(Activity), -1),
		?JUDGE_RETURN(not lib_activity_api:is_started(Activity), -1),
		
        {IsStart, StartTick} = lib_activity_api:calc_start_tick(Activity, CurTick),
        ?JUDGE_RETURN(IsStart, -1),

		process_activity_start(StartTick)
	catch
	    throw: {error, _} -> ok
	end
.

check_activity_end() ->
	try
		Activity = get_activity(),
		CurTick = lib_timer:unixtime(),
		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
		?JUDGE_RETURN(not lib_activity_api:is_closed(Activity), -1),
		?JUDGE_RETURN(lib_activity_api:is_started(Activity) andalso not lib_activity_api:is_ended(Activity), -1),
		
        StartTick = lib_activity_api:start_tick(Activity),
        {IsEnd, _EndTick} = lib_activity_api:calc_end_tick(Activity, CurTick, StartTick, false),
        ?JUDGE_RETURN(IsEnd, -1),    

		process_activity_end(),
		remove_activity()
	catch
	    throw: {error, _} -> ok
	end
.

check_activity_daily_reset() ->
	try
		Activity = get_activity(),
		CurTick = lib_timer:unixtime(),
		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
		?JUDGE_RETURN(not lib_activity_api:is_closed(Activity), -1),
		?JUDGE_RETURN(not lib_timer:is_same_day(CurTick, Activity#activity.daily_reset_tick), -1),

		process_activity_daily_reset(CurTick)
	catch
	    throw: {error, _} -> ok
	end
.

five_min_execute() ->
	try
		Activity = get_activity(),
		?INFO("five_min_execute"),
		case Activity#activity.main_type of
			?ACTIVITY_MAIN_TYPE_OPEN_SERVER_RANK -> lib_open_server_rank:timer_refresh_rank();
			_ -> skip
		end
	catch
		throw: {error, _} -> ok
	end

.


% check_activity_timeout() ->
% 	try
% 		Activity = get_activity(),
% 		CurTick = lib_timer:unixtime(),
% 		?JUDGE_RETURN(erlang:get(?ACTIVITY_REMOVE_FLAG) =/= true, -1),
% 		?JUDGE_RETURN(lib_activity_api:is_ongoing(Activity), -1),
% 		?JUDGE_RETURN(Activity#activity.is_open_timeout, -1),
% 		?JUDGE_RETURN(CurTick >= Activity#activity.timeout_tick, -1),

% 		process_activity_timeout(CurTick)
% 	catch
% 	    throw: {error, _} -> ok
% 	end
% .

%%初始化活动data
process_activity_init() ->
	try
		lib_activity_handle:process_activity_init(activity_id())
	catch
		Reason: Result -> error_output("activity init error", get_activity(), Reason, Result)
	end,

	NewActivity = get_activity(),
	update_activity(NewActivity#activity{is_initialized = true}),

	debug_output("activity init", NewActivity)
	% mod_activity_monitor:async_apply(fun mod_activity_monitor:activity_start/1, [get_activity()])
.

%%处理活动开始
process_activity_start(StartTick) ->
	try
        lib_activity_handle:process_activity_start(activity_id())
	catch
		Reason: Result -> error_output("activity start error", get_activity(), Reason, Result)
	end,

	NewActivity = get_activity(),
	update_activity(NewActivity#activity{is_started = true, start_tick = StartTick}),

	debug_output("activity start", NewActivity),
	mod_activity_monitor:async_apply(fun mod_activity_monitor:activity_start/1, [get_activity()])
.

%%处理活动结束
process_activity_end() ->
	try
        lib_activity_handle:process_activity_end(activity_id())
	catch
		Reason: Result -> error_output("activity end error", get_activity(), Reason, Result)
	end,

	NewActivity = get_activity(),
	update_activity(NewActivity#activity{is_ended = true}),

	debug_output("activity end", NewActivity),
	mod_activity_monitor:async_apply(fun mod_activity_monitor:activity_end/1, [get_activity()])
.

%%处理活动每天重置
%% CurTick : 当前时间
process_activity_daily_reset(CurTick) ->
	try
        lib_activity_handle:process_activity_daily_reset(activity_id(), CurTick)
	catch
		Reason: Result -> error_output("activity daily reset error", get_activity(), Reason, Result)
	end,

	NewActivity = get_activity(),
	update_activity(NewActivity#activity{daily_reset_tick = CurTick}),

	debug_output("activity daily reset", NewActivity)
.

% %%在活动重置之前
% before_activity_reset() ->
% 	try
%         lib_activity_handle:before_activity_reset()
% 	catch
% 		Reason: Result -> error_output("before activity reset error", get_activity(), Reason, Result)
% 	end,

% 	debug_output("before activity reset", get_activity())
% .

% %%在活动重置之后
% after_activity_reset() ->
% 	Activity = get_activity(),
% 	try
%         lib_activity_handle:after_activity_reset()
% 	catch
% 		Reason: Result -> error_output("after activity reset error", get_activity(), Reason, Result)
% 	end,

% 	mod_activity_monitor:all_online_player_async_apply(
% 		fun lib_player_backstage_activity_handle:check_activity_event/1, [Activity#activity.id]
% 	),

% 	debug_output("after activity reset", get_activity())
% .

% %%在活动修改之前
% before_activity_modify() ->
% 	try
%         lib_activity_handle:before_activity_modify()
% 	catch
% 		Reason: Result -> error_output("before activity modify error", get_activity(), Reason, Result)
% 	end,

% 	debug_output("before activity modify", get_activity())
% .

% %%在活动修改之后
% after_activity_modify() ->
% 	Activity = get_activity(),
% 	try
%         lib_activity_handle:after_activity_modify()
% 	catch
% 		Reason: Result -> error_output("after activity modify error", get_activity(), Reason, Result)
% 	end,

% 	mod_activity_monitor:all_online_player_async_apply(
% 		fun lib_player_backstage_activity_handle:check_activity_event/1, [Activity#activity.id]
% 	),

% 	debug_output("after activity modify", get_activity())
% .

%%处理活动关闭
process_activity_close() ->
	try
        lib_activity_handle:process_activity_close(activity_id())
	catch
		Reason: Result -> error_output("activity close error", get_activity(), Reason, Result)
	end,

	NewActivity = get_activity(),
	update_activity(NewActivity#activity{is_closed = true}),

	debug_output("activity close", NewActivity),
	mod_activity_monitor:async_apply(fun mod_activity_monitor:activity_close/1, [get_activity()])
.

%%处理活动超时
%% CurTick : 当前时间
% process_activity_timeout(CurTick) ->
% 	lib_activity_api:clear_activity_timeout(), %%TODO
% 	try
%         lib_activity_handle:process_activity_timeout(CurTick)
% 	catch
% 		Reason: Result -> error_output("activity timeout error", get_activity(), Reason, Result)
% 	end,

% 	debug_output("activity timeout", get_activity())
% .

%%处理活动进程启动
%% IsNew : 是否是新活动
process_activity_process_start(IsNew) ->
	try
        lib_activity_handle:process_activity_process_start(activity_id(), IsNew)
	catch
		Reason: Result -> error_output("activity process start error", get_activity(), Reason, Result)
	end,

	debug_output("activity process start", get_activity())
.

%%处理活动进程终止
%% TerminationType : 终止类型
process_activity_process_termination(TerminationType) ->
	try
        lib_activity_handle:process_activity_process_termination(activity_id(), TerminationType)
	catch
		Reason: Result -> error_output("activity process termination error", get_activity(), Reason, Result)
	end,

	debug_output("activity process termination", get_activity())
.

% %%修改活动
% modify_activity(NewActivity, OldActivity) ->
% 	update_activity(NewActivity#activity{
% 		data = lib_activity_handle:modify_activity_data(NewActivity, OldActivity)
% 	})
% .

% %%重置活动
% reset_activity(NewActivity, OldActivity) ->
% 	update_activity(NewActivity#activity{
% 		data = lib_activity_handle:reset_activity_data(NewActivity, OldActivity)
% 	})
% .

%%玩家进程接口 同步调用活动进程方法
sync_apply(UID, Fun, Args) ->
	sync_apply(UID, Fun, Args, -1) %%TODO ERROR CODE
.
sync_apply(UID, Fun, Args, Default) ->
	try
		% ?JUDGE_RETURN(lib_activity_api:is_have_process(UID), -1),
		% mod_server:sync_apply(lib_activity_api:get_process_name(UID), Fun, Args)
		ProcessName = lib_activity_api:get_process_name(UID),
		case UID#activity_uid.server_type of
			?ACTIVITY_SERVER_TYPE_SINGLE ->
				mod_server:sync_apply(ProcessName, Fun, Args);
			?ACTIVITY_SERVER_TYPE_CLUSTER ->
				lib_cluster_send:cluster_sync_apply(ProcessName, Fun, Args);
			?ACTIVITY_SERVER_TYPE_WORLD ->
				lib_cluster_send:world_sync_apply(ProcessName, Fun, Args)
		end
	catch
	    _:_  -> Default
	end
.


%%玩家进程接口 异步调用活动进程方法
async_apply(UID, Fun, Args) ->
	ProcessName = lib_activity_api:get_process_name(UID),
	case UID#activity.server_type of
		?ACTIVITY_SERVER_TYPE_SINGLE ->
			mod_server:async_apply(ProcessName, Fun, Args);
		?ACTIVITY_SERVER_TYPE_CLUSTER ->
			lib_cluster_send:cluster_async_apply(ProcessName, Fun, Args);
		?ACTIVITY_SERVER_TYPE_WORLD ->
			lib_cluster_send:world_async_apply(ProcessName, Fun, Args)
	end
.

fetch_activity(ActId)->
	lib_activity_api:delete_surplus(get_activity(ActId))
.

player_fetch_activity(ServerFlag, ActId, PlayerId, PFun, PArgs) ->
	lib_activity_api:player_async_apply(ServerFlag, PlayerId, PFun, [fetch_activity(ActId) | PArgs])
.

player_request(UID, Fun, Args) ->
	PlayerId = lib_player:player_id(),
	ServerFlag = config:server_flag(),
	ActId = UID#activity_uid.id,
	async_apply(UID, fun do_player_request/6, [erlang:get(recogn), ServerFlag, ActId, PlayerId, Fun, Args])
.
do_player_request(Recogn, ServerFlag, ActId, PlayerId, F, A) ->
	try
		erlang:apply(F, [ServerFlag, ActId, PlayerId] ++ A)
	catch
		throw: {respond, ErrCode, Line} when is_integer(ErrCode) ->
			ResRecogn = lib_msg:request_code_to_respond_code(Recogn),
			lib_cluster_send:respond_to_client(ServerFlag, PlayerId, ResRecogn, ErrCode),
			?INFO("recogn[proto] error: ~p ~p ~p ~p ~p ~p", [ServerFlag, ActId, PlayerId, ResRecogn, ErrCode, Line]);
		throw: {respond, Body, _Line} ->
			lib_cluster_send:respond_to_client(ServerFlag, PlayerId, Body);
		throw: {respond, Msg, ErrCode, Line} when is_integer(Msg) andalso is_integer(ErrCode) ->
			lib_cluster_send:respond_to_client(ServerFlag, PlayerId, Msg, ErrCode),
			?INFO("recogn[proto] error: ~p ~p ~p ~p ~p ~p", [ServerFlag, ActId, PlayerId, Msg, ErrCode, Line])
	end
.



