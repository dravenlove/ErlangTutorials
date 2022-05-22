%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_item
%%% Created on : 2020/8/13 0013 19:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_fight).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_BEGIN_FIGHT, _, Msg) ->
	lib_player_fight:request_fight(Msg);

handle(?MSG_CLIENT_FIGHT_KILL_RANK, _, Msg) ->
	lib_player_fight:request_kill_rank(Msg);

handle(?MSG_CLIENT_FIGHT_IN_WATCHING, _, Msg) ->
	lib_player_fight:request_join_watching(Msg);

handle(?MSG_CLIENT_FIGHT_OUT_WATCHING, _, Msg) ->
	lib_player_fight:request_quit_watching(Msg);

handle(?MSG_CLIENT_FIGHT_FIGHT_RECORD, _, Msg) ->
	lib_player_fight:request_fight_record(Msg);

handle(?MSG_CLIENT_TEST_FIGHT_RECORD, _, _) ->
	lib_player_fight:request_test_fight_record();

handle(?MSG_CLIENT_DELETE_TEST_FIGHT_RECORD, _, _) ->
	lib_player_fight:delete_test_fight_record();

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
