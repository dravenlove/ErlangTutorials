%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_chat
%%% Created on : 2020/8/6 0006 16:28
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_chat).
-author("glendy").
-include("common.hrl").
-include("chat.hrl").
-include("ProtoClient_10105.hrl").

-define(CHAT_VOICE(Id), {chat_voice, Id}).

%% API
-export([
	find_chat_player/2,
	async_player_login/2,
	async_player_logout/2,
	async_player_show/2,
	async_send_chat/5,
	async_req_chat_voice/3,
	remove_chat_voice_expire/1,
	async_league_info/6,
	serial_online_users/1,
	all_player_async_apply/3,
	pack_chat_binary/5,
	make_up_chat_msg/4,
	async_history/4,
	proto_to_five/1,
	proto_to_five_broadcast/2
]).

find_chat_player(PlayerId, ChatState) ->
	maps:get(PlayerId, ChatState#chat_state.player_map, undefined).

async_player_login(ChatState, ChatPlayer) ->
	#chat_state{
		player_map = PlayerMap,
		private_history_map = PrivateHisMap
	} = ChatState,
	lib_chat_history:notify_private_history_when_login(ChatPlayer, PrivateHisMap),
	PlayerId = ChatPlayer#chat_player.id,
	New_PrivateHisMap = maps:remove(PlayerId, PrivateHisMap),
	register_chat_channel_when_login(ChatPlayer),  %%登录注册调用
	NewPlayerMap = maps:put(ChatPlayer#chat_player.id, ChatPlayer, PlayerMap),
	{ok, ChatState#chat_state{player_map = NewPlayerMap,private_history_map = New_PrivateHisMap}}.

async_player_logout(ChatState, PlayerId) ->
	#chat_state{
		player_map = PlayerMap
	} = ChatState,
	ChatPlayer = maps:get(PlayerId, PlayerMap),
	unregister_chat_channel_when_logout(ChatPlayer),
	NewPlayerMap = maps:remove(PlayerId, PlayerMap),
	{ok, ChatState#chat_state{player_map = NewPlayerMap}}.

async_player_show(ChatState, PlayerShow) ->
	#chat_state{
		player_map = PlayerMap
	} = ChatState,
	PlayerId = PlayerShow#'ProtoShowRole'.id,
	case maps:get(PlayerId, PlayerMap, undefined) of
		undefined -> skip;
		ChatPlayer ->
			NewChatPlayer = ChatPlayer#chat_player{
				show = PlayerShow
			},
			{ok, ChatState#chat_state{player_map = maps:put(PlayerId, NewChatPlayer, PlayerMap)}}
	end.

%% 登录时注册进的聊天频道
register_chat_channel_when_login(ChatPlayer) ->
	#chat_player{
		id = PlayerId,
		sid = PlayerSid,
		league_id = League
	} = ChatPlayer,
	mod_channel:register_world_channel(PlayerId, PlayerSid),
	mod_channel:register_cluster_channel(PlayerId, PlayerSid),
	mod_channel:register_system_channel(PlayerId, PlayerSid),
	mod_channel:register_governor_channel(League,PlayerId,PlayerSid),
	mod_channel:register_league_channel(League,PlayerId,PlayerSid),
	ok.

%% 登出时注销的聊天频道
unregister_chat_channel_when_logout(ChatPlayer) ->
	#chat_player{
		id = PlayerId,
		league_id = LeagueId
	} = ChatPlayer,
	mod_channel:unregister_world_channel(PlayerId),
	mod_channel:unregister_cluster_channel(PlayerId),
	mod_channel:unregister_system_channel(PlayerId),
	if
		LeagueId > 0 ->
			mod_channel:unregister_league_channel(LeagueId, PlayerId),
			mod_channel:unregister_governor_channel(LeagueId, PlayerId)
	;
		true -> skip
	end,
	ok.

%% 加个私聊玩家的信息参数，支持跨服私聊
%% TODO 加上后台聊天封禁功能
async_send_chat(ChatState, Msg, ReqShowRole, ChannelId, ProtoPrivateShowRole) ->
	PlayerId = ReqShowRole#'ProtoShowRole'.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		ChatPlayer = find_chat_player(PlayerId, ChatState),
		?JUDGE_RETURN(ChatPlayer =/= undefined, ?ERROR_NO_LOGIN_CHAT),
		lib_chat_ban:validate_ban_chat(ChatPlayer, Msg, ReqShowRole, ProtoPrivateShowRole),
		ChannelType = Msg#'Proto10105001'.chat_type,
		NewChatState = send_chat_by_channel_type(ChatState, ChannelType, ChannelId, Msg, ReqShowRole, ProtoPrivateShowRole),
	    lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_SEND_CHAT),
		PrivatePlayerId =
			if
				ProtoPrivateShowRole =/= undefined -> ProtoPrivateShowRole#'ProtoShowRole'.id;
				true -> 0
			end,
		lib_serial_api:serial_chat(ChatPlayer, Msg#'Proto10105001'.wcontent, ChannelType, PrivatePlayerId),
		{ok, NewChatState}
	catch
	    throw:{error, ErrCode} -> lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_SEND_CHAT, ErrCode)
	end.

async_history(Msg, ReqShowRole, ChannelId, _ProtoPrivateShowRole) ->
	PlayerId = ReqShowRole#'ProtoShowRole'.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	try
%%		ChatPlayer = find_chat_player(PlayerId, ChatState),
%%		?JUDGE_RETURN(ChatPlayer =/= undefined, ?ERROR_NO_LOGIN_CHAT),
%%		lib_chat_ban:validate_ban_chat(ChatPlayer, Msg, ReqShowRole, ProtoPrivateShowRole),
		ChannelType = Msg#'Proto10105001'.chat_type,
		Pid = mod_channel:get_pid(ChannelType, ChannelId),
		{_Ok,State} = mod_server:sync_status(Pid, fun mod_channel:do_channel_history/2, [PlayerId]),
		#channel_state{history = HistoryList} = State,
		lists:foldl(fun({_Time,Proto},Acc) -> [Proto|Acc] end,[],HistoryList)
	catch
		throw:{error, ErrCode} -> lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_SEND_CHAT, ErrCode),
			?INFO("ERROR lib chat ~p ~p",[PlayerId,erlang:get_stacktrace()])
	end.

async_req_chat_voice(_ChatState, PlayerId, VoiceId) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		ChatVoice = get_chat_voice(VoiceId),
		?JUDGE_RETURN(ChatVoice =/= undefined, ?ERROR_NO_CHAT_VOICE),
		Respond = #'Proto50105006'{
			voice_id = VoiceId,
			chat_type = ChatVoice#chat_voice.chat_type,
			content = ChatVoice#chat_voice.content,
			voice_length = ChatVoice#chat_voice.byte_size
		},
		lib_send:respond_to_client_by_pid(PlayerPid, Respond)
	catch
	    throw:{error, ErrCode} -> lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_GET_VOICE, ErrCode)
	end.

remove_chat_voice_expire(State) ->
	#chat_state{
		voice_map = VoiceMap
	} = State,
	VoiceExpireList = lists:sort(fun voice_expire_cmp/2, maps:to_list(VoiceMap)),
	NowTick = lib_timer:unixtime(),
	remove_chat_voice_expire(State, NowTick, VoiceExpireList).

%% 同步联盟信息到聊天进程
async_league_info(ChatState, PlayerId, LeagueId, LeagueName, LeagueLevel, LeaguePosition) ->
	#chat_state{
		player_map = PlayerMap
	} = ChatState,
	ChatPlayer = maps:get(PlayerId, PlayerMap),
	NewChaptPlayer = ChatPlayer#chat_player{
		league_id = LeagueId,
		league_name = LeagueName,
		league_level = LeagueLevel,
		league_position = LeaguePosition
	},
	OldLeagueId = ChatPlayer#chat_player.league_id,
	_Sid = ChatPlayer#chat_player.sid,
	if
		OldLeagueId =/= LeagueId ->
			if
%%				OldLeagueId > 0 -> mod_channel:unregister_league_channel(OldLeagueId, PlayerId);
				true -> skip
			end,
			if
%%				LeagueId > 0 -> mod_channel:register_league_channel(LeagueId, PlayerId, Sid);
				true -> skip
			end;
		true -> skip
	end,
	{ok, ChatState#chat_state{
		player_map = maps:put(PlayerId, NewChaptPlayer, PlayerMap)
	}}.

%% 计算并写入在线流水
serial_online_users(State) ->
	NowTick = lib_timer:unixtime(),
	#chat_state{
		player_map = PlayerMap
	} = State,
	TotalSize = maps:size(PlayerMap),
	{AgentMap, MarketMap} = maps:fold(
		fun(_Id, ChatPlayer, {AccAgentMap0, AccMarketMap0}) ->
			#chat_player{
				agent_code = AgentCode,
				market = Market
			} = ChatPlayer,
			AccAgentMap1 =
				if
					AgentCode > 0 ->
						AgentAmount0 = maps:get(AgentCode, AccAgentMap0, 0),
						maps:put(AgentCode, AgentAmount0 + 1, AccAgentMap0);
					true -> AccAgentMap0
				end,
			AccMarketMap1 =
				if
					Market > 0 ->
						MarketAmount0 = maps:get(Market, AccMarketMap0, 0),
						maps:put(Market, MarketAmount0 + 1, AccMarketMap0);
					true -> AccMarketMap0
				end,
			{AccAgentMap1, AccMarketMap1}
		end, {#{}, #{}}, PlayerMap),
	lib_serial_api:serial_online(0, 0, TotalSize, TotalSize, NowTick),
	maps:fold(
		fun(Agent, Amount, Acc0) ->
			lib_serial_api:serial_online(Agent, 0, Amount, TotalSize, NowTick),
			Acc0
		end, ok, AgentMap),
	maps:fold(
		fun(Market, Amount, Acc0) ->
			lib_serial_api:serial_online(0, Market, Amount, TotalSize, NowTick),
			Acc0
		end, ok, MarketMap),
	ok.

all_player_async_apply(#chat_state{player_map = PlayerMap}, Fun, Args) ->
	maps:map(fun(PlayerId, _ChatPlayer) ->
		mod_player:async_apply(PlayerId, Fun, Args)
 	end, PlayerMap)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
send_chat_by_channel_type(ChatState, ?CHANNEL_PRIVATE, _ChannelId, Msg, ReqShowRole, ProtoPrivateShowRole) ->
	ReqPlayerId = ReqShowRole#'ProtoShowRole'.id,
	PrivatePlayerId = ProtoPrivateShowRole#'ProtoShowRole'.id,
%%	lib_chat_friend:validate_black_friend(ChatState, ReqPlayerId, PrivatePlayerId),
	{NewChatState, _History,Proto} = pack_chat_binary(ChatState, ?CHANNEL_PRIVATE, Msg, ReqShowRole, ProtoPrivateShowRole), %% <-
	ReqPid = lib_player:get_pid(ReqPlayerId),
	lib_send:respond_to_client_by_pid(ReqPid, Proto),
	PrivatePid = lib_player:get_pid(PrivatePlayerId),
	lib_send:respond_to_client_by_pid(PrivatePid, Proto),
	NewChatState;
send_chat_by_channel_type(ChatState, ?CHANNEL_CLUSTER, ChannelId, Msg, ReqShowRole, ProtoPrivateShowRole) ->
	?DEBUG("ERROR IS ~p",[ ?CHANNEL_CLUSTER]),
	{NewChatState,History_proto, Proto} = pack_chat_binary(ChatState, ?CHANNEL_CLUSTER, Msg, ReqShowRole, ProtoPrivateShowRole),
	mod_channel:push_channel_msg(?CHANNEL_CLUSTER, ChannelId, lib_msg:pack_to_bin(Proto),History_proto),
	% lib_cluster_chat_base:async_chat_by_channel_type(ChatState, ?CHANNEL_CLUSTER, ChannelId, Msg, ReqShowRole, ProtoPrivateShowRole),
	% TODO
	NewChatState;
send_chat_by_channel_type(ChatState, ChannelType, ChannelId, Msg, ReqShowRole, ProtoPrivateShowRole) ->
	{NewChatState,History_proto, Proto} = pack_chat_binary(ChatState, ChannelType, Msg, ReqShowRole, ProtoPrivateShowRole),
	mod_channel:push_channel_msg(ChannelType, ChannelId, lib_msg:pack_to_bin(Proto),History_proto),
	NewChatState.

pack_chat_binary(ChatState, ChatType, Msg, ReqShowRole, ProtoPrivateShowRole) ->
	{NewChatState0, VoiceId} =
		if
			Msg#'Proto10105001'.content_type =:= ?CHAT_CONTENT_VOICE ->
				push_chat_voice(ChatState, Msg);
			true -> {ChatState, 0}
		end,
	It_Id = Msg#'Proto10105001'.private_role_id,
	Pid =  lib_player:get_pid(It_Id),
	Flag =case is_pid(Pid) andalso is_process_alive(Pid)  =:= true of
					true -> fasle;
					_ -> true
				end,
	?DEBUG("Flag is ~p",[Flag]),
	ChatMsg = make_up_chat_msg(Msg, ReqShowRole, ProtoPrivateShowRole, VoiceId),
	HistoryMsg = proto_to_five(ChatMsg),
	NewChatState =
		if
			ChatType =:= ?CHANNEL_PRIVATE andalso Flag->
				lib_chat_history:push_private_history_record(NewChatState0, ChatMsg, ReqShowRole#'ProtoShowRole'.id, Msg#'Proto10105001'.private_role_id);
			true -> NewChatState0
		end,

	{NewChatState,HistoryMsg, ChatMsg}.

make_up_chat_msg(Msg, ReqShowRole, ProtoPrivateShowRole, VoiceId) ->
	#'Proto80105002'{
		chat_type = Msg#'Proto10105001'.chat_type,
		content_type = Msg#'Proto10105001'.content_type,
		wcontent = Msg#'Proto10105001'.wcontent,
		voice_sec = Msg#'Proto10105001'.voice_sec,
		voice_id = VoiceId,
		show = ReqShowRole,
		private_show = ProtoPrivateShowRole,
		send_tick = lib_timer:unixtime(),
		addit_list = Msg#'Proto10105001'.addit_list
	}.

proto_to_five(Msg) ->
	#'ProtoChatList'{
		chat_type = Msg#'Proto80105002'.chat_type,
		content_type = Msg#'Proto80105002'.content_type,
		wcontent = Msg#'Proto80105002'.wcontent,
		voice_sec = Msg#'Proto80105002'.voice_sec,
		voice_id = Msg#'Proto80105002'.voice_id,
		show = Msg#'Proto80105002'.show,
		private_show = Msg#'Proto80105002'.private_show,
		send_tick = Msg#'Proto80105002'.send_tick,
    addit_list = Msg#'Proto80105002'.addit_list
	}.

proto_to_five_broadcast(Msg,Type) ->
	#'ProtoChatList'{
		chat_type = Type,
		content_type = 2,
		shout_id = Msg#'Proto80105004'.shout_id,
		send_tick = lib_timer:unixtime(),
		broad_args = Msg#'Proto80105004'.broad_args
	}
.

push_chat_voice(ChatState, Msg) ->
	NowTick = lib_timer:unixtime(),
	ChatVoice = #chat_voice{
		id = lib_counter:get_voice_id(),
		send_tick = NowTick,
		chat_type = Msg#'Proto10105001'.chat_type,
		voice_sec = Msg#'Proto10105001'.voice_sec,
		content = Msg#'Proto10105001'.vcontent,
		byte_size = byte_size(Msg#'Proto10105001'.vcontent)
	},
	erlang:put(?CHAT_VOICE(ChatVoice#chat_voice.id), ChatVoice),
	NewVoiceMap = maps:put(ChatVoice#chat_voice.id, NowTick, ChatState#chat_state.voice_map),
	{ChatState#chat_state{voice_map = NewVoiceMap}, ChatVoice#chat_voice.id}.

get_chat_voice(VoiceId) ->
	erlang:get(?CHAT_VOICE(VoiceId)).

voice_expire_cmp(Left, Right) ->
	{LeftId, LeftExpire} = Left,
	{RightId, RightExpire} = Right,
	try
		?JUDGE_RETURN(LeftExpire =:= RightExpire, LeftExpire < RightExpire),
	    LeftId < RightId
	catch
	    throw:{error, Flag} -> Flag
	end.

remove_chat_voice_expire(State, _NowTick, []) ->
	State#chat_state{voice_map = #{}};
remove_chat_voice_expire(State, NowTick, [{VoiceId, Expire} | T]) ->
	if
		Expire > NowTick ->
			State#chat_state{voice_map = maps:from_list(T)};
		true ->
			erlang:erase(?CHAT_VOICE(VoiceId)),
			remove_chat_voice_expire(State, NowTick, T)
	end.
