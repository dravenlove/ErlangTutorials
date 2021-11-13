%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_role
%%% Created on : 2020/8/6 0006 17:17
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_role).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_TEST_COMMAND, _, Msg) ->
	lib_test_command:handle(Msg);
handle(?MSG_CLIENT_PLAYER_OTHER, _, Msg) ->
	lib_player_other:request_player_other(Msg);
handle(?MSG_CLIENT_PLAYER_RENAME, _, Msg) ->
	lib_player:request_rename(Msg);
handle(?MSG_CLIENT_PLAYER_HERO_BASE, _, Msg) ->
	lib_player_other:request_player_hero_base(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
