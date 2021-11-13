%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 2月 2021 15:10
%%%-------------------------------------------------------------------
-module(pp_science).
-author("13661").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_SCIENCE_LIST, _, _Msg) ->
	lib_player_science:request_science_list();
handle(?MSG_CLIENT_SCIENCE_INFO, _, Msg) ->
	lib_player_science:request_science_info(Msg);
handle(?MSG_CLIENT_SCIENCE_UPGRADE, _, Msg) ->
	lib_player_science:request_upgrade(Msg);
handle(?MSG_CLIENT_SCIENCE_ACCELERATE, _, Msg) ->
	lib_player_science:request_accelerate(Msg);
handle(?MSG_CLIENT_SCIENCE_RECEIVE, _, _Msg) ->
	lib_player_science:request_receive_item();
handle(?MSG_CLIENT_SCIENCE_ACTIVE, _, Msg) ->
	lib_player_science:request_active_science(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.