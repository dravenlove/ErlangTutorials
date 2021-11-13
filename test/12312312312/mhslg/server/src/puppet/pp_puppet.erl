%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. 3月 2021 10:08
%%%-------------------------------------------------------------------
-module(pp_puppet).
-author("xuyonghui").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_PUPPET_INFO, _, Msg) ->
	lib_player_puppet:request_puppet_info(Msg);
handle(?MSG_CLIENT_PUPPET_REFRESH, _, Msg) ->
	lib_player_puppet:request_puppet_refresh(Msg);
handle(?MSG_CLIENT_PUPPET_LOCK, _, Msg) ->
	lib_player_puppet:request_puppet_lock(Msg);
handle(?MSG_CLIENT_PUPPET_CHALLENGE, _, Msg) ->
	lib_player_puppet:request_puppet_challenge(Msg);
handle(?MSG_CLIENT_PUPPET_CHALLENGE_BUY, _, Msg) ->
	lib_player_puppet:request_puppet_challenge_buy(Msg);
handle(Recogn, State, _Msg) ->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
