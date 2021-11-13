%%%-------------------------------------------------------------------
%%% @author yuexiao
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 8月 2021 16:26
%%%-------------------------------------------------------------------
-module(lib_supervalue_gift).
-author("yuexiao").

-include("common.hrl").

%% API
-export([
  reset_everyday/0,
  reset/0,
  show_season/1
]).

%%get_day() ->


reset_everyday() ->
  lib_player_process:process_reset_everyday().

reset() ->
  lib_player:reset_every_day().

show_season(Type) ->
  CurTick = lib_timer:unixtime(),
  case Type >= 0 andalso Type =< 3 of
    false -> skip;
    true ->
      SeasonInfo = lib_season:season_info(Type),
      {Season, Day} = lib_season_api:season_info(SeasonInfo, CurTick),
      [Season,Day]
%%      debug_string(io_lib:format("第~p赛季第~p天", [Season, Day]))
  end
.

%%request_info() ->

