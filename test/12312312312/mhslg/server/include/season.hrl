%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 5月 2021 15:55
%%%-------------------------------------------------------------------

-define(SEASON_TYPE_CUR, 0).
-define(SEASON_TYPE_SINGLE, 1).
-define(SEASON_TYPE_CLUSTER, 2).
-define(SEASON_TYPE_WORLD, 3).

-define(DEFAULT_ZERO_SEASON_DAY, 45).
-define(DEFAULT_ONE_SEASON_DAY, 60).
-define(DEFAULT_OTHER_SEASON_DAY, 90).

-define(SEASON_LOOP_MAP, season_loop_map).

-record(season_info, {
    id = 0,
    season = 0,
    start_tick = 0,
    duration_days = 0,
    update_tick = 0
}).

-record(season_loop, {
    season = 0,
    duration_days = 0,
    update_tick = 0
}).

-define(DEFAULT_ZERO_SEASON_LOOP(UpdateTick), #season_loop{
    season = 0,
    duration_days = ?DEFAULT_ZERO_SEASON_DAY,
    update_tick = UpdateTick
}).
-define(DEFAULT_ONE_SEASON_LOOP(UpdateTick), #season_loop{
    season = 1,
    duration_days = ?DEFAULT_ONE_SEASON_DAY,
    update_tick = UpdateTick
}).
-define(DEFAULT_OTHER_SEASON_LOOP(Season, UpdateTick), #season_loop{
    season = Season,
    duration_days = ?DEFAULT_ONE_SEASON_DAY,
    update_tick = UpdateTick
}).