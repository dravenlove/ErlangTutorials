%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 5月 2021 18:12
%%%-------------------------------------------------------------------
-module(lib_season_api).
-author("13661").

-include("base.hrl").
-include("ets.hrl").
-include("season.hrl").

%% API
-export([
    season_info/0,
    season_info/1,
    season_info/2,
    season_default_days/1,
    calc_season_day/2
]).

season_info() ->
    season_info(lib_timer:unixtime())
.
season_info(CurTick) ->
    [SeasonInfo] = ets:lookup(?ETS_SEASON, 0),
    season_info(SeasonInfo, CurTick)
.
season_info(SeasonInfo, CurTick) ->
    StartTick = SeasonInfo#season_info.start_tick,
    SeasonDay = calc_season_day(StartTick, CurTick),
    {SeasonInfo#season_info.season, SeasonDay}
.

season_default_days(Season) ->
    Key = 
    case config:server_type() of
        ?SERVER_TYPE_WORLD -> world_season_day;
        ?SERVER_TYPE_CLUSTER -> cluster_season_day;
        ?SERVER_TYPE_GAME -> single_season_day;
        ?SERVER_TYPE_TEST -> single_season_day;
        _ -> single_season_day
    end,

    [Day0, Day1, DayOther] = lib_const_api:get_const_list(Key, [?DEFAULT_ZERO_SEASON_DAY, ?DEFAULT_ONE_SEASON_DAY, ?DEFAULT_OTHER_SEASON_DAY]),
    case Season of
        0 -> Day0;
        1 -> Day1;
        _ -> DayOther
    end
.

calc_season_day(StartTick, CurTick) ->
    CurFiveTick = lib_timer:cur_refresh_tick(CurTick),
    StartFiveTick = lib_timer:cur_refresh_tick(StartTick),

    Day = (CurFiveTick - StartFiveTick) div lib_timer:day_second() + 1,
    Diff1 = ?IIF(StartTick < StartFiveTick, 1, 0),
    Diff2 = ?IIF(CurTick < CurFiveTick, -1, 0),
    Day + Diff1 + Diff2
.