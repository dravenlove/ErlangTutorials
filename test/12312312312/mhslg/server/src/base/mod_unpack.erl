%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_unpack
%%% Created on : 2020/8/3 0003 16:58
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_unpack).
-behaviour(mod_server).
-export([start/4,
	do_init/1,
	do_db_init/2,
	do_call/3,
	do_cast/2,
	do_info/2,
	do_terminate/2,
	do_code_change/2
]).
-include("log.hrl").
-include("msgcode.hrl").
-include("unpack.hrl").

start(SPid, IP, Port, ModRouting) ->
	mod_server:start_link(?MODULE, [SPid, IP, Port, ModRouting], []).

do_init([SPid, IP, Port, ModRouting]) ->
	?INFO("mod_unpack pid ~w",[self()]),
	erlang:process_flag(trap_exit, true),
%%	erlang:system_flag(min_heap_size, 5000),
%%	erlang:system_flag(min_bin_vheap_size, 100000),
	erlang:system_flag(fullsweep_after, 100),
	erlang:send_after(?HEARTBEAT_CHECK_INTERVAL, self(), heartbeat_check),
	{ok, #unpack_state{sock_pid = SPid, client_ip = IP, client_port = Port, mod_routing = ModRouting}}.

do_db_init(State, _Args) ->
	{noreply, State}.
do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast({unpack, DataBin}, State) ->
	NewState = unpack_binary(DataBin, State),
	{noreply, NewState#unpack_state{heratbeat_tick = lib_timer:unixtime()}};
do_cast(_Info, State) ->
	{noreply, State}.

do_info(heartbeat_check, #unpack_state{sock_pid = Sid, player_pid = PlayerPid, client_ip = Ip, client_port = Port, heratbeat_tick = HeartbeatTcik} = State) ->
	erlang:send_after(?HEARTBEAT_CHECK_INTERVAL, self(), heartbeat_check),
	#{value := HeartSec} = tb_const:get(heart_sec),
	NowTick = lib_timer:unixtime(),
	if
		HeartbeatTcik =:= 0 ->
			skip;
		NowTick =< HeartbeatTcik + HeartSec ->
			skip;
		true ->
			?WARNING("heartbeat kick_off [~p] [~p] [~p] [~p] [~p]", [Sid, PlayerPid, Ip, Port, HeartbeatTcik]),
			%%停掉player进程
			mod_server:cast(PlayerPid, heartbeat_kick_off),
			%%停掉自己进程
			mod_server:stop(self()),
			%%停掉tcp进程
			mod_server:cast(Sid, kick_off)
	end,
	{noreply, State};

do_info(Info, State) ->
	?INFO("unpack recv: ~p ~n", [Info]),
	{noreply, State}.

do_terminate(_Reason, #unpack_state{player_id = PlayerId} = _State) ->
	%% 停掉对应的mod_player进程
	if
		PlayerId > 0 ->
			mod_server:stop(lib_player:get_process_name(PlayerId));
		true -> skip
	end,
	?INFO("unpack stop: ~p", [PlayerId]),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

unpack_wait_binary(<<Len:32/little, T/binary>> = WaitBin, _Len, ?PEND_LEN_STATE, State) when size(WaitBin) >= 4 ->
	unpack_wait_binary(T, Len, ?PEND_DATA_STATE, State#unpack_state{pending_state = ?PEND_DATA_STATE, pending_len = Len});
unpack_wait_binary(WaitBin, Len, ?PEND_DATA_STATE, #unpack_state{serial_key=NowSerialKey, mod_routing = ModRouting} = State) when size(WaitBin) >= Len ->
	<<PackCrcBin:Len/binary, NewWaitBin/binary>> = WaitBin,
	<<MsgCrcCode:32/little, PackBin/binary>> = PackCrcBin,
	HeadBin = list_to_binary(?CRC_HEAD_KEY),
	CrcHeadBin = <<HeadBin/binary, PackBin/binary>>,
	CrcCode = erlang:crc32(CrcHeadBin),
	if MsgCrcCode /= CrcCode -> ?WARNING("crc check error"), {NewWaitBin, State};
		true ->
			<<SerialKey:32/little, Recogn:32/little, _Error:32/little, MsgBody/binary>> = PackBin,
			if SerialKey > 0 andalso SerialKey > NowSerialKey ->
				if
					Recogn =:= ?MSG_CLIENT_HEARTBEAT -> skip;
					true -> ?DEBUG("recogn ~p SerialKey ~p ", [Recogn, SerialKey])
				end,
				ProtoMsg = decode_msg(Recogn, MsgBody),
				NewState =
					case erlang:apply(ModRouting, routing, [Recogn, State, ProtoMsg]) of
						{ok, state, NewState0} -> NewState0;
						_ -> State
					end,
				unpack_wait_binary(NewWaitBin, 4, ?PEND_LEN_STATE, NewState#unpack_state{pending_state = ?PEND_LEN_STATE, pending_len = 0, serial_key = SerialKey});
				true ->
					?INFO("client requset error recogn ~p SServerKey is ~p CServerKey is ~p~n", [Recogn, NowSerialKey, SerialKey]),
					{NewWaitBin, State}
			end
	end;
unpack_wait_binary(T, _Len, _PEND_STATE, State) ->
	{T, State}.

unpack_binary(DataBin, #unpack_state{pending_wait = WaitBin, pending_state = PendState, pending_len = PendLen} = State) ->
	WaitBinSize = size(WaitBin),
	NewWaitBin = if WaitBinSize > 0 -> <<WaitBin/binary, DataBin/binary>>; true -> DataBin end,
	try
		{LeftWaitBin, NewState} = unpack_wait_binary(NewWaitBin, PendLen, PendState, State),
		NewState#unpack_state{pending_wait = LeftWaitBin}
	catch
		_:_Reason ->
			State#unpack_state{pending_wait = NewWaitBin}
	end.

decode_msg(Recogn, DataBin) ->
	try
		Mod = lib_msg:mod_atom_by_recogn(Recogn),
		MsgName = lib_msg:msgname_atom_by_recogn(Recogn),
		apply(Mod, decode_msg, [DataBin, MsgName])
	catch
		_:_Reason ->
%%			?DEBUG("undefined proto: ~p~n", [Recogn]),
			undefined
	end.
