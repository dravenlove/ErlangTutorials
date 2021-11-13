%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_send
%%% Created on : 2020/8/3 0003 17:20
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_send).
-author("glendy").
-include("common.hrl").

%% API
-export([
	respond_to_client_by_sid/2,
	respond_to_client_by_sid/3,
	respond_to_client/1,
	respond_to_client/2,
	respond_to_player/2,
	respond_to_player/3,
	respond_to_client_by_pid/2,
	respond_to_client_by_pid/3,
	channel_send_by_sid/2,
	broad_send_by_sid/2,


	send_by_sid/2
]).

%% 发到指定的客户端socket进程发送
respond_to_client_by_sid(Sid, Recogn) when is_integer(Recogn) ->
	Bin = lib_msg:pack_to_bin(Recogn),
	send_by_sid(Sid, Bin);
respond_to_client_by_sid(Sid, ProtoMsg) ->
	Recogn = lib_msg:recogn_by_proto_msg(ProtoMsg),
	Bin = lib_msg:pack_to_bin(Recogn, 0, ProtoMsg),
	send_by_sid(Sid, Bin).

%% 发到指定的客户端socket进程发送
respond_to_client_by_sid(Sid, Recogn, ErrCode) when is_integer(Recogn) ->
	Bin = lib_msg:pack_to_bin(Recogn, ErrCode),
	send_by_sid(Sid, Bin);
respond_to_client_by_sid(Sid, ProtoMsg, ErrCode) ->
	Recogn = lib_msg:recogn_by_proto_msg(ProtoMsg),
	Bin = lib_msg:pack_to_bin(Recogn, ErrCode, ProtoMsg),
	send_by_sid(Sid, Bin).

%% 在玩家进程里调用，发消息给客户端
respond_to_client(Msg)->
	Sid = lib_player:player_sid(),
	respond_to_client_by_sid(Sid, Msg).
respond_to_client(Msg, ErrCode) ->
	Sid = lib_player:player_sid(),
	respond_to_client_by_sid(Sid, Msg, ErrCode).

%% 在其他进程先转发到玩家进程，再把消息推送给客户端
respond_to_player(PlayerId, Arg1) ->
	Pid = lib_player:get_pid(PlayerId),
	case is_pid(Pid) of
		false -> skip;
		true -> respond_to_client_by_pid(Pid, Arg1)
	end
.
respond_to_player(PlayerId, Arg1, Arg2) ->
	Pid = lib_player:get_pid(PlayerId),
	case is_pid(Pid) of
		false -> skip;
		true -> respond_to_client_by_pid(Pid, Arg1, Arg2)
	end
.

%% 在其他进程先转发到玩家进程，再把消息推送给客户端
respond_to_client_by_pid(PlayerPid, Msg) ->
	mod_server:async_apply(PlayerPid, fun lib_send:respond_to_client/1, [Msg]).
respond_to_client_by_pid(PlayerPid, Msg, ErrCode) ->
	mod_server:async_apply(PlayerPid, fun lib_send:respond_to_client/2, [Msg, ErrCode]).

channel_send_by_sid(Sid, Bin) ->
	send_by_sid(Sid, Bin).

broad_send_by_sid(Sid, Bin) ->
	send_by_sid(Sid, Bin).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
send_by_sid(Sid, Bin) when is_pid(Sid) ->
	Sid ! {send,Bin};
send_by_sid(_Pid,_Bin) ->
	error.
