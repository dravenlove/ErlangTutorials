%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 3月 2021 16:49
%%%-------------------------------------------------------------------
-module(pp_challenge).
-author("df").
-include("common.hrl").

%% API
-export([
	handle/3
]).

handle(?MSG_CLIENT_CHALLENGE_INFO, _, _) ->
	lib_player_challenge:challenge_info()
;
handle(?MSG_CLIENT_CHALLENGE_GUESS, _, Msg) ->
	lib_player_challenge:challenge_guess(Msg)
;
%%handle(?MSG_CLIENT_CHALLENGE_HERO, _, Msg) ->
%%	lib_player_challenge:challenge_hero(Msg)
%%;
handle(?MSG_CLIENT_CHALLENGE_ATTACK, _, Msg) ->
	lib_player_challenge:challenge_attack(Msg)
;
handle(?MSG_CLIENT_CHALLENGE_REPORT, _, Msg) ->
	lib_player_challenge:challenge_report(Msg)
;
handle(?MSG_CLIENT_CHALLENGE_BUY_TIME, _, Msg) ->
	lib_player_challenge:buy_time(Msg)
;
handle(?MSG_CLIENT_CHALLENGE_USE, _, Msg) ->
	lib_player_challenge:player_use(Msg)
;
handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.
