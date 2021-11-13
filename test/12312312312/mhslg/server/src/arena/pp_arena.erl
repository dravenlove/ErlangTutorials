%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 2月 2021 16:20
%%%-------------------------------------------------------------------
-module(pp_arena).
-author("13661").

-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_ARENA_INFO, _, _Msg) ->
	lib_player_arena:request_info();
handle(?MSG_CLIENT_ARENA_CHALLENGE, _, Msg) ->
	lib_player_arena:request_challenge(Msg);
handle(?MSG_CLIENT_ARENA_BUY_TIMES, _, _Msg) ->
	lib_player_arena:request_buy_times();
handle(?MSG_CLIENT_ARENA_REFRESH, _, _Msg) ->
	lib_player_arena:request_refresh();
handle(?MSG_CLIENT_ARENA_RECORD, _, _Msg) ->
	lib_player_arena:request_history();
handle(?MSG_CLIENT_ARENA_RANK_LIST, _, Msg) ->
	lib_player_arena:request_rank_list(Msg);
handle(?MSG_CLIENT_ARENA_TIMES_INFO, _, _Msg) ->
	lib_player_arena:request_times_info();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.