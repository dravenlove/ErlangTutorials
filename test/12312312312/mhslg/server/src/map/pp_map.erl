%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. 11月 2020 11:42
%%%-------------------------------------------------------------------
-module(pp_map).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_MAP_LIST, _, _Msg) ->
	lib_player_map:request_all_map();
handle(?MSG_CLIENT_MAP_CLEARING_LIST, _, _Msg) ->
	lib_player_map_clearing:request_map_clearing();
handle(?MSG_CLIENT_MAP_TROOPS_MARCH, _, _Msg) ->
	skip;
handle(?MSG_CLIENT_ATTACK_MAP_CLEARING, _, Msg) ->
	lib_player_map_clearing:request_attack_map_clearing(Msg);
handle(?MSG_CLIENT_MAP_INDUSTRY, _, _Msg) ->
	lib_player_city_industry:request_map_industry();
handle(?MSG_CLIENT_MAP_GENESIS_CHURCH, _, _Msg) ->
	lib_player_map:request_genesis_church();
handle(?MSG_CLIENT_CITY_DETAIL, _, Msg) ->
	lib_player_map:request_city_detail(Msg);
handle(?MSG_CLIENT_CLEARING_AWARD, _, Msg) ->
	lib_player_map_clearing:request_clearing_award(Msg);
handle(?MSG_CLIENT_MAP_VIEW, _, Msg) ->
	lib_player_map:request_update_view(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

