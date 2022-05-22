%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_accept
%%% Created on : 2020/8/3 0003 16:45
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_accept).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-export([start/2, start_link/3, stop/1]).
-include("log.hrl").

-define(TCP_OPTIONS, [
	binary,
	{backlog, 10000},	%% 等待连接监听队列
	{packet, 0}, % 自己构造包体，不由系统构造，灵活性好一些
	{recbuf, 64 * 1024}, %%64 KB 设置gen_tcp所拥有的socket句柄的内核的接收缓冲区
	{sndbuf, 64 * 1024}, %%64 KB 设置gen_tcp所拥有的socket句柄的内核的发送缓冲区
	{high_watermark, 64 * 1024}, %%当消息量达到高水位线的时候，port进入busy状态，这时候会把发送进程suspend起来，等消息达到低水位线的时候，解除busy状态，同时让发送进程继续执行。
	{reuseaddr, true}, % allow rebind without waiting
	{nodelay, true},
	{delay_send, true}
]).

-record(accpet_state, {transport, sock, ip, port, pack_pid}).

start(Port, ModRouting) ->
	?INFO("accept port[~p] ~p", [Port, ModRouting]),
	SockOpts = [
		{acceptors, config:tcp_accept_amount()},
		{max_connections, config:tcp_max_connect()},
		{tcp_options, ?TCP_OPTIONS}
	],
	esockd:open(echo, Port, SockOpts, {?MODULE, start_link, [ModRouting]}).

start_link(Transport, LSocket, ModRouting) ->
	{ok, proc_lib:spawn_link(?MODULE, init, [[Transport, LSocket, ModRouting]])}.

stop(Port) ->
	?INFO("esockd stop: ~p", [Port]),
	esockd:close({echo, Port}),
	ok.


init([Transport, LSocket, ModRouting]) ->
	?INFO("mod_accept pid ~w ~p",[self(), ModRouting]),
	case Transport:wait(LSocket) of
		{ok, CSocket} ->
			%% 获取客户端IP和端口
			{ok, {IP, Port}} = Transport:peername(CSocket),
			FormatIp = lib_types:to_ip_string(IP),
			?INFO("accept from client: [~s:~w]", [FormatIp, Port]),
			%% 启动分包进程
			erlang:system_flag(fullsweep_after, 100),
%%			erlang:system_flag(min_heap_size, 1024),
%%			erlang:system_flag(min_bin_vheap_size, 10240),
			{ok, PackPid} = mod_unpack:start(self(), FormatIp, Port, ModRouting),
			Transport:async_recv(LSocket, 0, infinity),
			State = #accpet_state{
				transport = Transport,
				sock = CSocket,
				ip = FormatIp,
				port = Port,
				pack_pid = PackPid
			},
			gen_server:enter_loop(?MODULE, [], State);
		{error, Reason} ->
			?ERROR("esocket accept error: ~p", [Reason]),
			{stop, Reason}
	end.

handle_call(_Info, _From, State) ->
	{reply,State,State}.

handle_cast(kick_off, State) ->
	shutdown(stop, State);
handle_cast(stop, State) ->
	shutdown(stop, State);
handle_cast(_Info, State) ->
	{noreply, State}.

handle_info({inet_async, CSocket, _Ref, {ok, Data}}, #accpet_state{transport = Transport, sock = CSocket, pack_pid = PackPid} = State) ->
	mod_server:cast(PackPid, {unpack, Data}),
	Transport:async_recv(CSocket, 0, infinity),
	{noreply, State};
handle_info({inet_async, CSocket, _Ref, {error, Reason}}, #accpet_state{sock = CSocket, ip = IP, port = Port} = State) ->
	?ERROR("tcp recv error[~p:~w]: ~s", [IP, Port, Reason]),
	shutdown(Reason, State);
handle_info({inet_reply, CSocket ,ok}, #accpet_state{sock = CSocket} = State) ->
	{noreply, State};
handle_info({inet_reply, CSocket, {error, Reason}}, #accpet_state{sock = CSocket, ip = IP, port = Port, pack_pid = PackPid} = State) ->
	?ERROR("tcp send error[~p:~w]: ~s", [IP, Port, Reason]),
	mod_server:stop(PackPid),
	shutdown(Reason, State);
handle_info({tcp_closed, CSocket}, #accpet_state{sock = CSocket, ip = IP, port = Port} = State) ->
	?INFO("client tcp close[~p:~w]", [IP, Port]),
	{stop, normal, State};
handle_info({closed, CSocket}, #accpet_state{sock = CSocket, ip = IP, port = Port} = State) ->
	?ERROR("client closed[~p:~w]", [IP, Port]),
	{stop, normal, State};
handle_info({send, DataBin}, #accpet_state{transport = Transport, sock = CSocket, ip = _IP, port = _Port} = State) ->
	%%?INFO("client tcp async_send[~p:~w]", [IP, Port]),
	Transport:async_send(CSocket, DataBin),
	{noreply, State};
handle_info(_Info, State) ->
	{noreply, State}.
%%
terminate(Reason, #accpet_state{ip = IP, port = Port, pack_pid = PackPid} = _State) ->
	%% 停掉对应的分包进程
	mod_server:sync_stop(PackPid),
	?INFO("client stop [~p:~p] ~p ~p", [IP, Port, PackPid, Reason]).

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

shutdown(Reason, State) ->
	{stop, {shutdown, Reason}, State}.
