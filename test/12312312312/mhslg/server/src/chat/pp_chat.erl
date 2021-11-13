%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: pp_chat
%%% Created on : 2020/8/6 0006 18:01
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(pp_chat).
-author("glendy").
-include("log.hrl").
-include("msgcode.hrl").

%% API
-export([handle/3]).

handle(?MSG_CLIENT_SEND_CHAT, _, Msg) ->
	lib_player_chat:request_send_chat(Msg);
handle(?MSG_CLIENT_GET_VOICE, _, Msg) ->
	lib_player_chat:request_chat_voice(Msg);
handle(?MSG_CLIENT_HISTORY,_, _Msg) ->
	lib_player_chat:request_history();
handle(?MSG_CLIENT_BLOCK,_, Msg) ->
	lib_player_chat_block:request_block_one_player(Msg);
handle(?MSG_CLIENT_LIMIT_TYPE,_, Msg) ->
	lib_player_chat_block:request_ban_player_id(Msg);
handle(?MSG_ACTIVE_LIMIT_STATE,_, _Msg) ->
	lib_player_chat_block:request_block_list();
handle(?MSG_CLIENT_BAN_LIST,_, _Msg) ->
	lib_player_chat_block:request_ban_list();
handle(?MSG_CLIENT_REQUEST_PLAYER_INFO,_, Msg) ->
	lib_player_chat_block:request_other_info(Msg);

handle(Recogn, State, _Msg)->
	?WARNING("~p no handle recogn: ~p ~w", [?MODULE, Recogn, State]),
	ok.
