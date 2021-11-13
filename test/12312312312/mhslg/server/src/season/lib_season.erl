%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 5月 2021 15:50
%%%-------------------------------------------------------------------
-module(lib_season).
-author("13661").

-include("base.hrl").
-include("log.hrl").
-include("ets.hrl").
-include("cluster.hrl").
-include("season.hrl").

%% API
-export([
    init_ets/0,
    world_init/0,
    cluster_init/0,
    single_init/0,
    % world_back_refresh_season/1,
    five_refresh_season/0,
    init_refresh_season/1
]).
-export([
    season_info/0,
    season_info/1,
    loop_map/0
]).

init_ets() ->
    ets:new(?ETS_SEASON, ?ETS_OPTIONS ++ [?ETS_KEY_POS(#season_info.id)])
.

season_info() ->
    season_info(?SEASON_TYPE_CUR)
.

season_info(Type) ->
    [SeasonInfo] = ets:lookup(?ETS_SEASON, Type),
    SeasonInfo
.

update_season(SeasonInfo) when is_record(SeasonInfo, season_info) ->
    ets:insert(?ETS_SEASON, SeasonInfo),
    case SeasonInfo#season_info.id of
        ?SEASON_TYPE_CUR -> db_season:save_mmo_season(SeasonInfo, true);
        _ -> db_season:save_mmo_season(SeasonInfo, false)
    end
.

update_season(SeasonInfo, Type) when is_record(SeasonInfo, season_info) ->
    update_season(SeasonInfo#season_info{id = Type})
.

loop_map() ->
    case erlang:get(?SEASON_LOOP_MAP) of
        undefined -> maps:new();
        Map -> Map
    end
.

world_init() ->
    CurTick = lib_timer:unixtime(),
    SeasonInfo = db_season:load_mmo_season(),
    {OldSeason, OldDay} = lib_season_api:season_info(SeasonInfo, CurTick),

    CurSeason = SeasonInfo#season_info.season,
    LoopMap = db_season:load_back_season_loop_map(CurSeason),

    world_refresh_season(SeasonInfo, LoopMap, CurTick),

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("init season [~p:~p] => [~p:~p]", [OldSeason, OldDay, Season, Day]),

    LoopMap
.

cluster_init() ->
    CurTick = lib_timer:unixtime(),
    LocalSeasonInfo = db_season:load_mmo_season(),
    {OldSeason, OldDay} = lib_season_api:season_info(LocalSeasonInfo, CurTick),

    pong = net_adm:ping(config:world_node()),
    WorldSeasonInfo = lib_cluster_send:world_sync_apply(mod_season, fun lib_season:season_info/0, []),
    LoopMap = lib_cluster_send:world_sync_apply(mod_season, fun lib_season:loop_map/0, []),

    update_season(WorldSeasonInfo, ?SEASON_TYPE_WORLD),

    cluster_refresh_season(WorldSeasonInfo, LocalSeasonInfo, LoopMap, CurTick),

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("init season [~p:~p] => [~p:~p]", [OldSeason, OldDay, Season, Day]),

    LoopMap
.

single_init() ->
    CurTick = lib_timer:unixtime(),
    LocalSeasonInfo = db_season:load_mmo_season(),
    update_season(LocalSeasonInfo, ?SEASON_TYPE_CUR),
    {OldSeason, OldDay} = lib_season_api:season_info(LocalSeasonInfo, CurTick),

    pong = net_adm:ping(config:cluster_node()),
    pong = net_adm:ping(config:world_node()),

    ClusterSeasonInfo = lib_cluster_send:cluster_sync_apply(mod_season, fun lib_season:season_info/0, []),
    WorldSeasonInfo = lib_cluster_send:world_sync_apply(mod_season, fun lib_season:season_info/0, []),

    LoopMap = lib_cluster_send:world_sync_apply(mod_season, fun lib_season:loop_map/0, []),

    update_season(WorldSeasonInfo, ?SEASON_TYPE_WORLD),
    update_season(ClusterSeasonInfo, ?SEASON_TYPE_CLUSTER),

    single_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, LocalSeasonInfo, LoopMap, CurTick),

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("init season [~p:~p] => [~p:~p]", [OldSeason, OldDay, Season, Day]),

    LoopMap
.

check_next_season(Season, Loop, CurTick) when is_record(Season, season_info), is_record(Loop, season_loop) ->
    StartTick = Season#season_info.start_tick,
    SeasonDay = lib_season_api:calc_season_day(StartTick, CurTick),
    SeasonDay >= Loop#season_loop.duration_days
.

next_season(CurSeasonInfo, NextLoop, CurTick) when is_record(CurSeasonInfo, season_info), is_record(NextLoop, season_loop) ->
    CurSeason = CurSeasonInfo#season_info.season,
    #season_info{
        season = CurSeason + 1,
        start_tick = CurTick,
        duration_days = NextLoop#season_loop.duration_days,
        update_tick = NextLoop#season_loop.update_tick
    }
.

calc_season(SeasonInfo, LoopMap, CurTick) ->
    calc_season(SeasonInfo, LoopMap, CurTick, infinite)
.
calc_season(SeasonInfo, LoopMap, CurTick, MaxSeason) ->
    SeasonDay = lib_season_api:calc_season_day(SeasonInfo#season_info.start_tick, CurTick),
    {Season, Day} = calc_season_i(LoopMap, SeasonInfo#season_info.season, SeasonDay, MaxSeason),
    PrevFiveTick = lib_timer:prev_refresh_tick(CurTick),
    StartTick = PrevFiveTick - (lib_timer:day_second() * (Day - 1)),
    #season_info{
        season = Season,
        start_tick = StartTick,
        duration_days = max(maps:get(Season, LoopMap, lib_season_api:season_default_days(Season)), 2),
        update_tick = CurTick
    }
.
calc_season_i(LoopMap, Season, Day, MaxSeason) ->
    DurationDay = max(maps:get(Season, LoopMap, lib_season_api:season_default_days(Season)), 2),
    case Day < DurationDay orelse (MaxSeason =/= infinite andalso MaxSeason >= Season) of
        true -> {Season, Day};
        false ->
            calc_season_i(LoopMap, Season + 1, Day - DurationDay + 1, MaxSeason)
    end
.

sync_season_from_world(WorldSeasonInfo) ->
    update_season(WorldSeasonInfo, ?SEASON_TYPE_WORLD),

    CurTick = lib_timer:unixtime(),
    LocalSeasonInfo = season_info(),
    {OldSeason, OldDay} = lib_season_api:season_info(),

    LoopMap = loop_map(),
    ServerType = config:server_type(),

    if
        ServerType =:= ?SERVER_TYPE_GAME orelse ServerType =:= ?SERVER_TYPE_TEST ->
            ClusterSeasonInfo = season_info(?SEASON_TYPE_CLUSTER),
            single_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, LocalSeasonInfo, LoopMap, CurTick);
        ServerType =:= ?SERVER_TYPE_CLUSTER ->
            cluster_refresh_season(WorldSeasonInfo, LocalSeasonInfo, LoopMap, CurTick),
            ServerTypeList = [?SERVER_TYPE_TEST, ?SERVER_TYPE_GAME],
            lib_cluster_send:server_type_async_apply(ServerTypeList, mod_season, fun sync_season_from_cluster/1, [season_info()]);
        true -> skip
    end,

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("sync season from world [~p:~p] => [~p:~p]", [OldSeason, OldDay, Season, Day]),
    validate_and_process_update({OldSeason, OldDay}, {Season, Day})
.

sync_season_from_cluster(ClusterSeasonInfo) ->
    update_season(ClusterSeasonInfo, ?SEASON_TYPE_CLUSTER),

    CurTick = lib_timer:unixtime(),
    LocalSeasonInfo = season_info(),
    {OldSeason, OldDay} = lib_season_api:season_info(),

    ServerType = config:server_type(),
    case ServerType =:= ?SERVER_TYPE_TEST orelse ServerType =:= ?SERVER_TYPE_GAME of
        false -> skip;
        true ->
            WorldSeasonInfo = season_info(?SEASON_TYPE_WORLD),
            LoopMap = loop_map(),
            single_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, LocalSeasonInfo, LoopMap, CurTick)
    end,

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("sync season from cluster [~p:~p] => [~p:~p]", [OldSeason, OldDay, Season, Day]),
    validate_and_process_update({OldSeason, OldDay}, {Season, Day})
.

world_refresh_season(CurSeasonInfo, LoopMap, CurTick) when is_record(CurSeasonInfo, season_info) ->
    CurSeason = CurSeasonInfo#season_info.season,

    Loop =
        case CurSeason of
            0 ->
                ?DEFAULT_ZERO_SEASON_LOOP(CurTick);
            1 ->
                ?DEFAULT_ONE_SEASON_LOOP(CurTick);
            _ ->
                maps:get(CurSeason, LoopMap, ?DEFAULT_OTHER_SEASON_LOOP(CurSeason, CurTick))
        end,

    NextLoop =
        case CurSeason of
            0 -> ?DEFAULT_ONE_SEASON_LOOP(CurTick);
            _ -> maps:get(CurSeason + 1, LoopMap, ?DEFAULT_OTHER_SEASON_LOOP(CurSeason + 1, CurTick))
        end,

    NewSeasonInfo =
        case check_next_season(CurSeasonInfo, Loop, CurTick) of
            false ->
                CurSeasonInfo#season_info{
                    duration_days = Loop#season_loop.duration_days,
                    update_tick = Loop#season_loop.update_tick
                };
            true ->
                next_season(CurSeasonInfo, NextLoop, CurTick)
        end,

    update_season(NewSeasonInfo, ?SEASON_TYPE_WORLD),
    update_season(NewSeasonInfo, ?SEASON_TYPE_CUR)
.

% world_back_refresh_season(LoopBsonList) ->
%     SeasonInfo = season_info(),
%     LoopMap = db_season:loop_bson_list_to_map(LoopBsonList),

%     world_refresh_season(SeasonInfo, LoopMap, lib_timer:unixtime()),

%     NewSeasonInfo = season_info(),
%     ServerTypeList = [?SERVER_TYPE_TEST, ?SERVER_TYPE_GAME, ?SERVER_TYPE_CLUSTER],
%     lib_cluster_send:server_type_async_apply(ServerTypeList, mod_season, fun sync_season_from_world/1, [NewSeasonInfo])
% .

world_init_refesh_season(CurTick) ->
    SeasonInfo = season_info(),
    LoopMap = loop_map(),

    world_refresh_season(SeasonInfo, LoopMap, CurTick)
.

world_five_refresh_season() ->
    SeasonInfo = season_info(),
    LoopMap = loop_map(),

    world_refresh_season(SeasonInfo, LoopMap, lib_timer:unixtime()),

    NewSeasonInfo = season_info(),
    ServerTypeList = [?SERVER_TYPE_TEST, ?SERVER_TYPE_GAME, ?SERVER_TYPE_CLUSTER],
    lib_cluster_send:server_type_async_apply(ServerTypeList, mod_season, fun sync_season_from_world/1, [NewSeasonInfo])
.

cluster_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, LoopMap, CurTick) ->
    NewWorldSeasonInfo = calc_season(WorldSeasonInfo, LoopMap, CurTick),

    % NewSeasonInfo = 
    % case NewWorldSeasonInfo#season_info.season >= 2 of
    %     true ->
    %         NewWorldSeasonInfo;
    %     false ->
    %         calc_season(ClusterSeasonInfo, maps:new(), CurTick, 1)
    % end,

    NewSeasonInfo =
        if
            NewWorldSeasonInfo#season_info.season >= 2 -> NewWorldSeasonInfo;
            ClusterSeasonInfo#season_info.season =:= 0 ->
                case check_next_season(ClusterSeasonInfo, ?DEFAULT_ZERO_SEASON_LOOP(CurTick), CurTick) of
                    false -> ClusterSeasonInfo;
                    true -> next_season(ClusterSeasonInfo, ?DEFAULT_ONE_SEASON_LOOP(CurTick), CurTick)
                end;
            true -> ClusterSeasonInfo
        end,

    update_season(NewSeasonInfo, ?SEASON_TYPE_CUR)
.

cluster_init_refresh_season(CurTick) ->
    LocalSeasonInfo = season_info(),
    WorldSeasonInfo = season_info(?SEASON_TYPE_WORLD),
    LoopMap = loop_map(),

    cluster_refresh_season(WorldSeasonInfo, LocalSeasonInfo, LoopMap, CurTick)
.

cluster_five_refresh_season() ->
    LocalSeasonInfo = season_info(),
    WorldSeasonInfo = season_info(?SEASON_TYPE_WORLD),
    LoopMap = loop_map(),
    CurTick = lib_timer:unixtime(),

    cluster_refresh_season(WorldSeasonInfo, LocalSeasonInfo, LoopMap, CurTick),

    NewSeasonInfo = season_info(),

    ServerTypeList = [?SERVER_TYPE_TEST, ?SERVER_TYPE_GAME],
    lib_cluster_send:server_type_async_apply(ServerTypeList, mod_season, fun sync_season_from_cluster/1, [NewSeasonInfo])
.

single_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, SingleSeasonInfo, LoopMap, CurTick) ->
    NewWorldSeasonInfo = calc_season(WorldSeasonInfo, LoopMap, CurTick),
    NewClusterSeasonInfo = calc_season(ClusterSeasonInfo, maps:new(), CurTick, 1),

    NewSeasonInfo =
        case NewWorldSeasonInfo#season_info.season >= 2 of
            true -> NewWorldSeasonInfo;
            false ->
                case NewClusterSeasonInfo#season_info.season =:= 1 of
                    true -> NewClusterSeasonInfo;
                    false -> SingleSeasonInfo
                end
        end,

    update_season(NewSeasonInfo, ?SEASON_TYPE_CUR)
.

single_init_refresh_season(CurTick) ->
    LocalSeasonInfo = season_info(),
    ClusterSeasonInfo = season_info(?SEASON_TYPE_CLUSTER),
    WorldSeasonInfo = season_info(?SEASON_TYPE_WORLD),

    LoopMap = loop_map(),

    single_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, LocalSeasonInfo, LoopMap, CurTick)
.

single_five_refresh_season() ->
    LocalSeasonInfo = season_info(),
    ClusterSeasonInfo = season_info(?SEASON_TYPE_CLUSTER),
    WorldSeasonInfo = season_info(?SEASON_TYPE_WORLD),

    LoopMap = loop_map(),
    CurTick = lib_timer:unixtime(),

    single_refresh_season(WorldSeasonInfo, ClusterSeasonInfo, LocalSeasonInfo, LoopMap, CurTick)
.

five_refresh_season() ->
    {OldSeason, OldDay} = lib_season_api:season_info(),

    case config:server_type() of
        ?SERVER_TYPE_WORLD ->
            world_five_refresh_season();
        ?SERVER_TYPE_CLUSTER ->
            cluster_five_refresh_season();
        ?SERVER_TYPE_GAME ->
            single_five_refresh_season();
        ?SERVER_TYPE_TEST ->
            single_five_refresh_season()
    end,

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("five refresh season [~p:~p] => [~p:~p]",[OldSeason, OldDay, Season, Day]),

    validate_and_process_update({OldSeason, OldDay}, {Season, Day})
.

init_refresh_season(CurTick) ->
    {OldSeason, OldDay} = lib_season_api:season_info(),

    case config:server_type() of
        ?SERVER_TYPE_WORLD ->
            world_init_refesh_season(CurTick);
        ?SERVER_TYPE_CLUSTER ->
            cluster_init_refresh_season(CurTick);
        ?SERVER_TYPE_GAME ->
            single_init_refresh_season(CurTick);
        ?SERVER_TYPE_TEST ->
            single_init_refresh_season(CurTick)
    end,

    {Season, Day} = lib_season_api:season_info(),
    ?INFO("init refresh season [~p:~p] => [~p:~p]",[OldSeason, OldDay, Season, Day])
.

validate_and_process_update({OldSeason, OldDay}, {NewSeason, NewDay}) ->
    IsUpdate = not (OldSeason =:= NewSeason andalso OldDay =:= NewDay),
    case IsUpdate of
        false -> skip;
        true -> process_season_update(NewSeason, NewDay)
    end
.

process_season_update(Season, Day) ->
    ?INFO("season update ~p:~p", [Season, Day])
.