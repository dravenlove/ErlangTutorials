%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 11月 2020 20:29
%%%-------------------------------------------------------------------
-module(pp_season_and_days).
-author("df").
-include("common.hrl").

%% API
-export([
	handle/3
]).


%%请求当前时间的季节
handle(?MSG_CLIENT_WORLD_SEASON, _, _) ->
	lib_season_and_days:request_season_info();

handle(?MSG_CLIENT_SEASON_INFO, _, _) ->
	lib_season_and_days:request_season_and_day_info();

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.
