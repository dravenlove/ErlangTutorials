%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_channel
%%% Created on : 2020/8/6 0006 14:32
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_channel).
-behavior(mod_server).
-author("glendy").
-include("log.hrl").
-include("chat.hrl").

-define(CHANNEL_PROCESS_WORLD, "channel_world").		%% 世界频道进程名
-define(CHANNEL_PROCESS_LEAGUE, "channel_league_").		%% 联盟频道进程名
-define(CHANNEL_PROCESS_TASK, "channel_system_").			%% 全部频道进程名
-define(CHANNEL_PROCESS_PRIVATE, "channel_private_").	%% 私聊频道进程名
-define(CHANNEL_PROCESS_TRAVEL, "channel_travel_").		%% 跨服频道进程名
-define(CHANNEL_PROCESS_GOVERNOR, "channel_governor_").		%% 跨服频道进程名

-export([start/2,start_link/2, stop/2, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_channel_process_name/2,
	get_pid/2,
	register_channel/4,
	async_register_channel/3,
	unregister_channel/3,
	async_unregister_channel/2,
	stop_chat_channel/2,
	push_channel_msg/4,
	async_push_channel_msg/3,
	do_channel_history/2,
	clean_history/1
]).

-export([
	register_world_channel/2,
	unregister_world_channel/1,
	register_league_channel/3,
	unregister_league_channel/2,
	register_cluster_channel/2,
	unregister_cluster_channel/1,
	register_system_channel/2, %%系统
	unregister_system_channel/1,
	register_governor_channel/3, %%栋梁
	unregister_governor_channel/2
]).

get_channel_process_name(Type, ChannelId) ->
	if
		Type =:= ?CHANNEL_WORLD ->
			lib_types:to_atom(?CHANNEL_PROCESS_WORLD);
		Type =:= ?CHANNEL_COUNTRY ->
			lib_types:to_atom(?CHANNEL_PROCESS_LEAGUE ++ lib_types:to_list(ChannelId));
		Type =:= ?CHANNEL_SYSTEM ->
			lib_types:to_atom(?CHANNEL_PROCESS_TASK ++ lib_types:to_list(ChannelId));
		Type =:= ?CHANNEL_PRIVATE ->
			lib_types:to_atom(?CHANNEL_PROCESS_PRIVATE ++ lib_types:to_list(ChannelId));
		Type =:= ?CHANNEL_CLUSTER ->
			lib_types:to_atom(?CHANNEL_PROCESS_TRAVEL);
		Type =:= ?CHANNEL_GOVERNOR ->
			lib_types:to_atom(?CHANNEL_PROCESS_GOVERNOR ++ lib_types:to_list(ChannelId));
		true -> lib_types:to_atom(?CHANNEL_PROCESS_WORLD)
	end.

get_pid(Type, ChannelId) ->
	ProgressName = get_channel_process_name(Type, ChannelId),
	erlang:whereis(ProgressName).

start(Type, ChannelId) ->
	ProcessName = get_channel_process_name(Type, ChannelId),
	mod_server:start({local, ProcessName}, ?MODULE, [Type, ChannelId], []).

start_link(Type, ChannelId) ->
	ProcessName = get_channel_process_name(Type, ChannelId),
	mod_server:start_link({local, ProcessName}, ?MODULE, [Type, ChannelId], []).

stop(Type, ChannelId) ->
	Pid = get_pid(Type, ChannelId),
	mod_server:stop(Pid).

do_init([Type, ChannelId]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(1000, self(), channel_timeout),
	erlang:send_after(5*60*1000, self(), history),
	?INFO("chat channel start: ~p ~p", [Type, ChannelId]),
	{ok, #channel_state{id = ChannelId, type = Type}}.

do_db_init(State, _Args) ->
	{noreply, State}.
do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(channel_timeout, State) ->
	erlang:send_after(1000, self(), channel_timeout),
	NewState = do_channel_send(State),
	{noreply, NewState};
do_info(history, State) ->
	erlang:send_after(5*60*1000, self(), history),
	NewState = clean_history(State),
	{noreply, NewState};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

do_channel_send(#channel_state{player_map = PlayerMap, bin_msg_list = BinMsgList} = State) ->
	case length(BinMsgList) > 0 of
		true ->
			maps:fold(
				fun(_, Sid, _Acc0) ->
					lists:foldr(
						fun(Bin, _AccAcc0) ->
							lib_send:channel_send_by_sid(Sid, Bin)
						end, ok, BinMsgList)
				end, ok, PlayerMap),
			State#channel_state{bin_msg_list = []};
		_ -> State
	end.

do_channel_history(#channel_state{history = HistoryList,type = Type} = State,PlayerId) ->
	try
		Num =	case Type of
						 ?CHANNEL_WORLD -> tb_const:get(chat_common_world);
						 ?CHANNEL_COUNTRY -> tb_const:get(chat_common_league);
						 ?CHANNEL_SYSTEM -> tb_const:get(chat_common_system);
						 ?CHANNEL_PRIVATE -> tb_const:get(chat_common_cluster);
						 ?CHANNEL_GOVERNOR -> tb_const:get(chat_common_governor);
						 _ -> 30
					 end,
		GET_history = case length(HistoryList) > Num of
										false -> HistoryList;
										true -> lists:sublist(HistoryList,Num)
									end,
		{ok,State#channel_state{history = GET_history}}
	catch
	    _:_  -> ?INFO("ERROR mod channel ~p ~p",[PlayerId,erlang:get_stacktrace()])
	end
.


clean_history(#channel_state{history = History_list} = State) ->
	Num = tb_const:get(chat_common_num),
	case length(History_list) > Num of
		false -> State;
		true -> lists:sublist(History_list,Num)
	end
.

%% 必须在聊天进程里调用
register_channel(Type, ChannelId, PlayerId, PlayerSid) ->
	ProgessName = get_channel_process_name(Type, ChannelId),
	ChannelPid = get_pid(Type, ChannelId),
	case erlang:is_pid(ChannelPid) andalso erlang:is_process_alive(ChannelPid) of
		true -> skip;
		_ -> mod_channel:start(Type, ChannelId)
%%			server_sup:start_child(ProgessName, mod_channel, start_link, [Type, ChannelId])
	end,
	mod_server:async_status(ProgessName, fun mod_channel:async_register_channel/3, [PlayerId, PlayerSid]).
async_register_channel(State, PlayerId, PlayerSid) ->
	#channel_state{
		player_map = PlayerMap
	} = State,
	?DEBUG("register chat channel: ~p ~p ~p ~p", [State#channel_state.type, State#channel_state.id, PlayerId, PlayerSid]),
	{ok, State#channel_state{player_map = maps:put(PlayerId, PlayerSid, PlayerMap)}}.

unregister_channel(Type, ChannelId, PlayerId) ->
	Pid = get_pid(Type, ChannelId),
	mod_server:async_status(Pid, fun mod_channel:async_unregister_channel/2, [PlayerId]).
async_unregister_channel(State, PlayerId) ->
	#channel_state{
		player_map = PlayerMap
	} = State,
	?DEBUG("unregister chat channel: ~p ~p ~p", [State#channel_state.type, State#channel_state.id, PlayerId]),
	NewPlayerMap = maps:remove(PlayerId, PlayerMap),
	case State#channel_state.type =:= ?CHANNEL_PRIVATE andalso maps:size(NewPlayerMap) =< 0 of
		true -> mod_server:stop(self());
		_ -> skip
	end,
	{ok, State#channel_state{player_map = NewPlayerMap}}.

stop_chat_channel(Type, ChannelId) ->
	Pid = get_pid(Type, ChannelId),
	case is_pid(Pid) andalso is_process_alive(Pid) of
		true -> mod_server:stop(Pid);
		_ -> skip
	end.

%% 注册进世界频道
register_world_channel(PlayerId, PlayerSid) ->
	register_channel(?CHANNEL_WORLD, 0, PlayerId, PlayerSid).
%%　注销世界频道
unregister_world_channel(PlayerId) ->
	unregister_channel(?CHANNEL_WORLD, 0, PlayerId).

%% 注册进全部频道
register_system_channel(PlayerId, PlayerSid) ->
	register_channel(?CHANNEL_SYSTEM,0,PlayerId,PlayerSid).
%% 注销全部频道
unregister_system_channel(PlayerId) ->
	unregister_channel(?CHANNEL_SYSTEM,0,PlayerId).

%%%% 注册进全部频道(原先代码,导致无法发送系统信息到前端)
%%register_system_channel(PlayerId, PlayerSid) ->
%%	register_channel(?CHANNEL_SYSTEM,PlayerId,PlayerId,PlayerSid).
%%%% 注销全部频道
%%unregister_system_channel(PlayerId) ->
%%	unregister_channel(?CHANNEL_SYSTEM,PlayerId,PlayerId).

%% 注册进栋梁频道
register_governor_channel(LeagueId,PlayerId,PlayerSid) ->
	register_channel(?CHANNEL_GOVERNOR, LeagueId, PlayerId, PlayerSid).
unregister_governor_channel(LeagueId, PlayerId) ->
	unregister_channel(?CHANNEL_GOVERNOR, LeagueId, PlayerId).

%% 注册进联盟频道  势力
register_league_channel(LeagueId, PlayerId, PlayerSid) ->
	register_channel(?CHANNEL_COUNTRY, LeagueId, PlayerId, PlayerSid).
%% 注销联盟频道  势利
unregister_league_channel(LeagueId, PlayerId) ->
	unregister_channel(?CHANNEL_COUNTRY, LeagueId, PlayerId).

%% 注册进跨服频道
register_cluster_channel(PlayerId, PlayerSid) ->
	register_channel(?CHANNEL_CLUSTER, 0, PlayerId, PlayerSid).
%%　注销跨服频道
unregister_cluster_channel(PlayerId) ->
	unregister_channel(?CHANNEL_CLUSTER, 0, PlayerId).

%% 其他进程向指定频道发送消息
push_channel_msg(Type, ChannelId, Bin,HistoryProto) ->
	Pid = get_pid(Type, ChannelId),
	mod_server:async_status(Pid, fun mod_channel:async_push_channel_msg/3, [Bin,HistoryProto]).
async_push_channel_msg(State, Bin,HistoryProto) ->
	Time = lib_timer:unixtime(),
	#channel_state{
		bin_msg_list = BinList,
		history = History_list
	} = State,
	{ok, State#channel_state{bin_msg_list = [Bin | BinList],history = [{Time,HistoryProto}|History_list]}}.

