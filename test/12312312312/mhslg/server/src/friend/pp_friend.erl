%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_friend
%%% Created on : 2020/8/21 0021 11:38
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_friend).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_FRIEND_LIST, _, Msg) ->
	lib_player_friend:request_friend_list(Msg);
handle(?MSG_CLIENT_FRIEND_APPLY, _, Msg) ->
	lib_player_friend:request_friend_apply(Msg);
handle(?MSG_CLIENT_FRIEND_APPLY_REPLY, _, Msg) ->
	lib_player_friend:request_friend_apply_reply(Msg);
handle(?MSG_CLIENT_FRIEND_REMOVE, _, Msg) ->
	lib_player_friend:request_friend_remove(Msg);
handle(?MSG_CLIENT_FRIEND_BLACK_ADD, _, Msg) ->
	lib_player_friend:request_friend_black_add(Msg);
handle(?MSG_CLIENT_FRIEND_BLACK_DEL, _, Msg) ->
	lib_player_friend:request_friend_black_del(Msg);
handle(?MSG_CLIENT_FRIEND_SEARCH, _, Msg) ->
	lib_player_friend:request_friend_search(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
