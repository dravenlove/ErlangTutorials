%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2021 5:38 PM
%%%-------------------------------------------------------------------
-module(pp_new_map).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_BLOCK_VIEW, _, Msg) ->
	lib_player_block:request_block_view(Msg)
;
handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok
.

