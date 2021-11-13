%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 5月 2021 14:51
%%%-------------------------------------------------------------------
-module(mod_activity_monitor).
-author("13661").

-include("base.hrl").
-include("ets.hrl").
-include("log.hrl").
-include("mongodb.hrl").
-include("activity.hrl").

%% API
-export([start/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	remove_activity/1,
	activity_start/1,
	activity_end/1,
	activity_close/1,
	notify_online_player_update/1,
	all_online_player_async_apply/2,
	find_activity_uid_list/1
]).
-export([
    player_activity_list/4
]).
-export([
    async_apply/2
]).

start() ->
    mod_server:start({local, ?MODULE}, ?MODULE, [], []).

stop() ->
    mod_server:sync_stop(?MODULE).

do_init([]) ->
    erlang:process_flag(trap_exit, true),

    {ok, undefined}.

do_db_init(State, _Args) ->
    CurTick = lib_timer:unixtime(),
    NextMinSec = lib_timer:next_min_time(CurTick),
    erlang:send_after(NextMinSec * 1000, self(), min_timer),

    MMOActList = db_activity:load_mmo_activity(activity_server_type(), ?ACTIVITY_SYSTEM_TYPE_INNER),
    ets:new(?ETS_ACTIVITY_TABLE, [{keypos, #activity.id}, {write_concurrency, true}] ++ ?ETS_OPTIONS),
	ets:insert(?ETS_ACTIVITY_TABLE, MMOActList),

    lists:map(fun(Activity) -> 
        start_activity(Activity, false)
    end, MMOActList),

    refresh_activity_list(),

    lists:map(fun(Activity) -> 
        init_activity(Activity)
    end, MMOActList),

    {noreply, State}.

do_call(_Info, _From, State) ->
    {reply, State, State}.

do_cast(_Info, State) ->
    {noreply, State}.

do_info(min_timer, State) ->
    CurTick = lib_timer:unixtime(),
    NextMinSec = lib_timer:next_min_time(CurTick),
    erlang:send_after(NextMinSec * 1000, self(), min_timer),

    refresh_activity_list(),

    {noreply, State}
;
do_info(_Info, State) ->
    {noreply, State}.

do_terminate(_Reason, _State) ->
    ok.

do_code_change(_Mod, State) ->
    mod_server:put_callback_mod(?MODULE),
    {ok, State}.

conf_to_activity(Conf) ->
    #activity{
        id = maps:get(id, Conf),

        server_type = maps:get(server_type, Conf),
        system_type = ?ACTIVITY_SYSTEM_TYPE_INNER,

        main_type = maps:get(main_type, Conf),
        sub_type = maps:get(sub_type, Conf, 0),

        conf_index = maps:get(index, Conf),

        time_type = maps:get(time_type, Conf),

        start_date = maps:get(start_date, Conf, 0),
        start_season = maps:get(start_season, Conf, [0,0,0]),
        start_festival = maps:get(start_festival, Conf, ["",0,0]),

        end_date = maps:get(end_date, Conf, 0),
        end_season = maps:get(end_season, Conf, [0,0,0]),
        duration_min = maps:get(duration_min, Conf, 0),
		tips_time = maps:get(tips_time, Conf, 0),
		tips = maps:get(tips, Conf, 0)
    }
.

activity_server_type() ->
    case config:server_type() of
        ?SERVER_TYPE_TEST -> ?ACTIVITY_SERVER_TYPE_SINGLE;
        ?SERVER_TYPE_GAME -> ?ACTIVITY_SERVER_TYPE_SINGLE;
        ?SERVER_TYPE_CLUSTER -> ?ACTIVITY_SERVER_TYPE_CLUSTER;
        ?SERVER_TYPE_WORLD -> ?ACTIVITY_SERVER_TYPE_WORLD;
        _ -> -1
    end
.

conf_activity_map() ->
    ServerType = activity_server_type(),
    lists:foldl(
		fun(Id, Map) ->
			Conf = tb_activity:get(Id),
			case maps:get(server_type, Conf, 0) of
				ServerType ->
					Activity = conf_to_activity(Conf),
					maps:put(Id, Activity, Map);
				_ -> Map
			end
		end, maps:new(), tb_activity:get_list())
.

refresh_activity_list() ->
    ActivityList = activity_list(),
    ConfActMap = conf_activity_map(),
    ActivityMap = 
    lists:foldl(fun(Activity, Map) -> 
        maps:put(Activity#activity.id, Activity, Map)    
    end, maps:new(), ActivityList),
    maps:map(fun(ActId, Activity) -> 
        case maps:is_key(ActId, ConfActMap) of
            true -> skip;
            false -> close_activity(Activity)
        end
    end, ActivityMap),

    CurTick = lib_timer:unixtime(),
    lib_common:map_map(fun(ActId, ConfAct) -> 
        ?JUDGE_CONTINUE(not maps:is_key(ActId, ActivityMap)),
        {IsStart, StartTick} = lib_activity_api:calc_start_tick(ConfAct, CurTick),
        ?JUDGE_CONTINUE(IsStart),
    
        {IsEnd, _} = lib_activity_api:calc_end_tick(ConfAct, CurTick, StartTick, true),
        ?JUDGE_CONTINUE(not IsEnd),
        ets:insert_new(?ETS_ACTIVITY_TABLE, [ConfAct]),
        start_activity(ConfAct, true),
        init_activity(ConfAct)
    end, ConfActMap)
.

activity_list() ->
    ets:foldl(fun(Activity, List) ->
        [Activity | List]
        end, [], ?ETS_ACTIVITY_TABLE)
.

cast(Activity, Info) when is_record(Activity, activity) ->
    cast(lib_activity_api:uid(Activity), Info)
;
cast(UID, Info) when is_record(UID, activity_uid) ->
    ProcessName = lib_activity_api:get_process_name(UID),
    mod_server:cast(ProcessName, Info)
.

start_activity(Activity, IsNew) ->
    mod_activity:start_link(Activity, IsNew)
.

init_activity(Activity) ->
    cast(Activity, init)
.

close_activity(Activity) ->
    cast(Activity, {close})
.

ongoing_activity_list()->
	ets:foldl(fun(Activity, List) ->
		case lib_activity_api:is_ongoing(Activity) of
			false -> List;
			true -> [lib_activity_api:delete_surplus(Activity) | List]
		end
 	end, [], ?ETS_ACTIVITY_TABLE)
.

% notify_all_activity(Msg) ->
% 	ActivityList = ongoing_activity_list(),
% 	lists:map(fun(Activity) ->
% 		ActivityId = Activity#activity.id,
% 		lib_activity_api:notify_activity(ActivityId, Msg)
% 	end, ActivityList)
% .

remove_activity(Activity) ->
	ActivityId = Activity#activity.id,
	ets:delete(?ETS_ACTIVITY_TABLE, ActivityId),
	db_activity:remove_activity(Activity)
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
		[lib_activity_api:delete_surplus(Activity) | List]
	end, [], ActivityList),

	all_online_player_async_apply(fun lib_player_activity:notify_activity_update/1, [NewActivityList])
.

all_online_player_async_apply(Fun, Args) ->
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:all_player_async_apply/3, [Fun, Args])
.

player_activity_list(ServerFlag, PlayerId, PFun, PArgs) ->
    TID = #activity_tid{server_type = activity_server_type(), system_type = ?ACTIVITY_SYSTEM_TYPE_INNER},
	lib_activity_api:player_async_apply(ServerFlag, PlayerId, PFun, [TID, ongoing_activity_list()] ++ PArgs)
.

async_apply(Fun, Args) ->
    mod_server:async_apply(?MODULE, Fun, Args)
.

find_activity_uid_list(Main_type) ->
	lists:foldl(fun(Activity,List) ->
		case Activity#activity.main_type =:= Main_type of
			true -> [lib_activity_api:uid(Activity)|List];
			false-> List
		end
	end,[],activity_list())
.