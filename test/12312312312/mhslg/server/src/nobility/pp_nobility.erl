%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 2:20 PM
%%%-------------------------------------------------------------------
-module(pp_nobility).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([handle/3]).


handle(?MSG_CLIENT_NOBILITY_INFO, _, Msg) ->
	lib_player_nobility:request_nobility_info(Msg);
handle(?MSG_CLIENT_PRIVILEGE_ACTIVATION, _, Msg) ->
	lib_player_nobility:request_privilege_activation(Msg);
handle(?MSG_CLIENT_NOBILITY_ACTIVATION, _, _Msg) ->
	lib_player_nobility:request_nobility_activation();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.

