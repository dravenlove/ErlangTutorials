%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 5月 2021 11:08
%%%-------------------------------------------------------------------
-module(pp_honour_top).
-author("df").
-include("common.hrl").
%% API
-export([
	handle/3
]).
handle(?MSG_CLIENT_HONOUR_TOP_INFO, _, Msg) ->
	lib_player_honour_top:get_honour_top_info(Msg)
;
handle(?MSG_CLIENT_HONOUR_TOP_APPLY, _, _) ->
	lib_player_honour_top:get_honour_top_apply_info()
;
handle(?MSG_CLIENT_HONOUR_TOP_APPLY_CHANGE, _, Msg) ->
	lib_player_honour_top:honour_top_apply(Msg)
;
handle(?MSG_CLIENT_HONOUR_TOP_WORSHIP, _, _) ->
	lib_player_honour_top:honour_top_worship()
;
handle(?MSG_CLIENT_HONOUR_TOP_REPORT, _, Msg) ->
	lib_player_honour_top:get_honour_top_report(Msg)
;
handle(?MSG_CLIENT_HONOUR_TOP_FINAL, _, _) ->
	lib_player_honour_top:get_honour_top_final()
;
handle(?MSG_CLIENT_HONOUR_TOP_BET_INFO, _, _) ->
	lib_player_honour_top:get_honour_top_bet_info()
;
handle(?MSG_CLIENT_HONOUR_TOP_BET_ON, _, Msg) ->
	lib_player_honour_top:honour_top_bet_on(Msg)
;
handle(?MSG_CLIENT_HONOUR_TOP_APPLY_HERO, _, _) ->
	lib_player_honour_top:get_apply_hero()
;
handle(?MSG_CLIENT_HONOUR_TOP_USE, _, Msg) ->
	lib_player_honour_top:use_honour_top(Msg)
;
handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.

