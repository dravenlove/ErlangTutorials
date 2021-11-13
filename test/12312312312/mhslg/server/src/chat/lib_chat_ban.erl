%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_chat_ban
%%% Created on : 2020/9/14 0014 15:16
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_chat_ban).
-author("glendy").
-include("common.hrl").
-include("chat.hrl").

%% API
-export([
	unban_player_chat/2,
	ban_player_chat/2,
	validate_ban_chat/4
]).

unban_player_chat(ChatState, PlayerId) ->
	case lib_chat:find_chat_player(PlayerId, ChatState) of
		ChatPlayer = #chat_player{} ->
			NewChatPlayer = ChatPlayer#chat_player{
				chat_ban = 0
			},
			NewChatPlayerMap = maps:put(PlayerId, NewChatPlayer, ChatState#chat_state.player_map),
			{ok, ChatState#chat_state{player_map = NewChatPlayerMap}};
		_ -> skip
	end.

ban_player_chat(ChatState, PlayerId) ->
	case lib_chat:find_chat_player(PlayerId, ChatState) of
		ChatPlayer = #chat_player{} ->
			NewChatPlayer = ChatPlayer#chat_player{
				chat_ban = 1
			},
			NewChatPlayerMap = maps:put(PlayerId, NewChatPlayer, ChatState#chat_state.player_map),
			{ok, ChatState#chat_state{player_map = NewChatPlayerMap}};
		_ -> skip
	end.

validate_ban_chat(ChatPlayer, Msg, ReqShowRole, ProtoPrivateShowRole) ->
	if
		ChatPlayer#chat_player.chat_ban =:= 1 ->
			?DEBUG("player ban chat: ~p", [ChatPlayer#chat_player.id]),
			ChatMsg = lib_chat:make_up_chat_msg(Msg, ReqShowRole, ProtoPrivateShowRole, 0),
			lib_send:respond_to_client_by_sid(ChatPlayer#chat_player.sid, ChatMsg),
			throw({error, 0});
		true ->
			skip
	end.
