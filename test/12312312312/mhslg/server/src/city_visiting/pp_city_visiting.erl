%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Feb 2021 10:04 AM
%%%-------------------------------------------------------------------
-module(pp_city_visiting).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	handle/3
]).


handle(?MSG_CLIENT_HERO_VISITING, _, Msg) ->
	lib_player_city_visiting:request_hero_visiting(Msg);
handle(?MSG_CLIENT_CITY_VISITING_INFO, _, _Msg) ->
	lib_player_city_visiting:request_city_visiting_info();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

