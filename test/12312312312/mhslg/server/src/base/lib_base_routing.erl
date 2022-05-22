%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_base_routing
%%% Created on : 2020/8/3 0003 20:17
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_base_routing).
-author("glendy").
-include("unpack.hrl").
-include("log.hrl").

%% API
-export([
	routing/3
]).

%% 要更新state时，返回格式：{ok, state, NewState}
routing(Recogn, #unpack_state{player_pid = PlayerPid, is_validate = IsValidate, sock_pid = SPid} = UnPackState, ProtoMsg) ->
	try
		%% 有消息体的请求10100 002
		case Recogn div 1000 of
			10100 -> pp_login:handle(Recogn, UnPackState, ProtoMsg);
			_Rec when IsValidate =:= true andalso PlayerPid =/= undefined ->
				mod_server:cast(PlayerPid, {socket_msg, Recogn, ProtoMsg}), ok;
			_ -> ?WARNING("no rout to proto ~p ~p ~p ~n", [Recogn, IsValidate, PlayerPid]), error
		end
	catch
		throw:{error, ErrCode} ->
			ResRecogn = lib_msg:request_code_to_respond_code(Recogn),
			if
				erlang:is_integer(ErrCode) ->
					lib_send:respond_to_client_by_sid(SPid, ResRecogn, ErrCode);
				true ->
					?WARNING("recogn[proto] throw error: ~p ~p ~n", [Recogn, ErrCode])
			end,
			error;
		_:Reason ->
			?WARNING("recogn[proto] error: ~p ~p ~n ~p ~n", [Recogn, Reason, erlang:get_stacktrace()]), error
	end.
