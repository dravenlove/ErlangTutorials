%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Jan 2021 2:57 PM
%%%-------------------------------------------------------------------
-module(pp_city_building).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_CITY_BUILDING_INFO, _, Msg) ->
	lib_player_city_building:request_city_building_info(Msg);
handle(?MSG_CLIENT_HERO_BUILDING, _, Msg) ->
	lib_player_city_building:request_hero_building(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.