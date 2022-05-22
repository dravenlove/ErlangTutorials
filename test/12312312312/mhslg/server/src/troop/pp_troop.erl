%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2021 5:36 PM
%%%-------------------------------------------------------------------
-module(pp_troop).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_TROOP_INFO, _, Msg) ->
	lib_player_troop:request_troop_info(Msg)
;
handle(?MSG_CLIENT_CREATE_TROOP, _, Msg) ->
	lib_player_troop:request_create_troop(Msg)
;
handle(?MSG_CLIENT_TROOP_MARCH, _, Msg) ->
	lib_player_troop:request_troop_march(Msg)
;
handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok
.

