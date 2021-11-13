%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_chat_friend
%%% Created on : 2020/8/24 0024 17:20
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		聊天进程中调用的关于好友的处理
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_chat_friend).
-author("glendy").
-include("common.hrl").
-include("chat.hrl").

%% API
-export([
	async_black_friend_list/3,
	validate_black_friend/3
]).

%% 同步黑名单列表到聊天进程
async_black_friend_list(ChatState, PlayerId, BlackList) ->
	case lib_chat:find_chat_player(PlayerId, ChatState) of
		undefined -> skip;
		ChatPlayer ->
			NewChatPlayer = ChatPlayer#chat_player{
				black_friend_list = BlackList
			},
			{ok, ChatState#chat_state{
				player_map = maps:put(PlayerId, NewChatPlayer, ChatState#chat_state.player_map)
			}}
	end.

validate_black_friend(ChatState, ReqPlayerId, PrivatePlayerId) ->
	ReqChatPlayer_1 = lib_chat:find_chat_player(ReqPlayerId, ChatState),
	ReqChatPlayer = case ReqChatPlayer_1 == undefined of
										true -> State = mod_chat:get_info(),
											lib_chat:find_chat_player(ReqPlayerId, State);
										false -> ReqChatPlayer_1
									end,
	?JUDGE_RETURN(ReqChatPlayer =/= undefined, ?ERROR_NO_LOGIN_CHAT),
	?JUDGE_RETURN(lib_common:lists_find(PrivatePlayerId, ReqChatPlayer#chat_player.black_friend_list) =< 0, ?ERROR_IS_IN_BLACK_FRIEND),
	PrivateChatPlayer = lib_chat:find_chat_player(PrivatePlayerId, ChatState),
	?JUDGE_RETURN(PrivateChatPlayer =/= undefined, ?ERROR_TARGET_NO_LOGIN_CHAT),
	?JUDGE_RETURN(lib_common:lists_find(ReqPlayerId, PrivateChatPlayer#chat_player.black_friend_list) =< 0, ?ERROR_IN_TARGET_BLACK_FRIEND).
