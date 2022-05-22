%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_chat
%%% Created on : 2020/8/6 0006 16:36
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_chat).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("chat.hrl").
-include("ProtoClient_10105.hrl").

%% API
-export([
	to_chat_player/0,
	async_chat_show/0,
	request_send_chat/1,
	request_chat_voice/1,
	request_history/0,

	send_chat/2,
	send_chat/3
]).

%% 在玩家进程中调用，构造#chapt_player
to_chat_player() ->
	PlayerBase = lib_player:get_player_base(),
	PlayerOther = lib_player:get_player_base_other(),
	Show = lib_player:serialize_show_role(),
	#chat_player{
		id = PlayerBase#player_base.id,
		ip = PlayerOther#player_base_other.ip,
		sid = PlayerBase#player_base.sid,
		account = PlayerBase#player_base.account,
		show = Show,
		agent_code = PlayerBase#player_base.agent_code,
		market = PlayerBase#player_base.market,
		server_flag = PlayerBase#player_base.server_flag,
		league_id = PlayerBase#player_base.country
	}.

async_chat_show() ->
	Show = lib_player:serialize_show_role(),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:async_player_show/2, [Show]),
	ok.

send_chat(ChatType, Content) ->
	send_chat(ChatType, Content, 0).
send_chat(ChatType, Content, PrivateRoleId) ->
	Msg = #'Proto10105001'{chat_type = ChatType, private_role_id = PrivateRoleId, wcontent = Content},
	request_send_chat(Msg).

request_send_chat(Msg) ->
	#'Proto10105001'{chat_type = ChatType, private_role_id = PrivateRoleId,wcontent = Wcontent} = Msg,
	?JUDGE_RETURN(?CHANNEL_WORLD =< ChatType andalso ChatType =< ?MAX_CHANNEL_TYPE, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(authority_limit(ChatType), ?ERROR_AUTHORITY_LIMIT),
	{ChannelId, ProtoPrivateShowRole} = get_channel_id_by_type(ChatType, PrivateRoleId),
	{_IsShield, NewContent} = lib_player_chat_limit:check_is_limit_content(Wcontent),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:async_send_chat/5, [Msg#'Proto10105001'{wcontent = NewContent}, lib_player:serialize_show_role(), ChannelId, ProtoPrivateShowRole]).
%% 聊天频道权限
authority_limit(ChatType) ->
	Key =
	case ChatType of
		?CHANNEL_WORLD    ->?CONDITION_ID_115;
		?CHANNEL_COUNTRY  ->?CONDITION_ID_116;
		?CHANNEL_GOVERNOR ->?CONDITION_ID_117;
		?CHANNEL_CLUSTER  ->?CONDITION_ID_118;
		_ -> true
	end,
	case Key of true -> skip; _ ->?JUDGE_RETURN(lib_function_open:function_is_open(Key), ?INFO("功能未开启")) end,
	look_authority_limit(ChatType)
.
look_authority_limit(?CHANNEL_GOVERNOR) ->
	Player = lib_player:get_player_base(),
	Player#player_base.country_pos =/= 0 orelse Player#player_base.city_id =/= 0
;
look_authority_limit(_) ->
	true
.
request_history() ->
	ProtoList = [#'Proto10105001'{chat_type = X, private_role_id = 0} || X <- ?CHANNEL_LIST],
	List = lists:foldl(
		fun(Msg, AccZero) ->
			#'Proto10105001'{chat_type = ChatType, private_role_id = PrivateRoleId} = Msg,
			case look_authority_limit(ChatType) of
				false -> AccZero;
				true ->
					{ChannelId, ProtoPrivateShowRole} = get_channel_id_by_type(ChatType, PrivateRoleId),
					GetList = mod_server:sync_apply(mod_chat:get_pid(), fun lib_chat:async_history/4, [Msg, lib_player:serialize_show_role(), ChannelId, ProtoPrivateShowRole]),
					case GetList of
						[] -> AccZero;
						_ -> lists:append(GetList, AccZero)
					end
			end
		end,[],ProtoList),
	New_list = lists:keysort(#'ProtoChatList'.send_tick,List),
	Respond = #'Proto50105008'{
		chat_list = New_list
	},
	lib_send:respond_to_client(Respond)
.

request_chat_voice(Msg) ->
	#'Proto10105006'{voice_id = VoiceId} = Msg,
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:async_req_chat_voice/3, [lib_player:player_id(), VoiceId]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_channel_id_by_type(?CHANNEL_WORLD, _PrivateRoleId) ->
	{0, undefined};
get_channel_id_by_type(?CHANNEL_COUNTRY, _PrivateRoleId) ->
	{lib_player:player_country(), undefined};
get_channel_id_by_type(?CHANNEL_SYSTEM, _PrivateRoleId) ->
	{0, undefined};
get_channel_id_by_type(?CHANNEL_PRIVATE, PrivateRoleId) ->
%%	PrivatePid = lib_player:get_pid(PrivateRoleId),
%%	?JUDGE_RETURN(is_pid(PrivatePid) andalso is_process_alive(PrivatePid), ?ERROR_ROLE_NO_LOGIN_SINGLE),
%%	?JUDGE_RETURN(db_player_base:is_exists_player(PrivateRoleId) =:= true, ?ERROR_ROLE_NOT_EXISTS),
	ProtoPrivShow = lib_player:serialize_other_player_show_role(PrivateRoleId),
	{PrivateRoleId, ProtoPrivShow};
get_channel_id_by_type(?CHANNEL_CLUSTER, _PrivateRoleId) ->
	{0, undefined};
get_channel_id_by_type(?CHANNEL_GOVERNOR, _PrivateRoleId) ->
	{lib_player:player_country(), undefined};
get_channel_id_by_type(ChatType, PrivateRoleId) ->
	?WARNING("can't get channel_id: ~p ~p", [ChatType, PrivateRoleId]),
	{0, undefined}.
