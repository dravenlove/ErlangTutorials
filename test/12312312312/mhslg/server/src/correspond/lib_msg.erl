 %%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_msg
%%% Created on : 2020/8/3 0003 17:22
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_msg).
-author("glendy").
-include("common.hrl").

%% API
-export([
	pack_to_bin/1,
	pack_to_bin/2,
	pack_to_bin/3,
	mod_atom_by_recogn/1,
	msgname_atom_by_recogn/1,
	recogn_by_proto_msg/1,
	recogn_by_msgname/1,
	request_code_to_respond_code/1
]).

pack_to_bin(Recogn) when is_integer(Recogn) ->
	pack_to_bin(Recogn, 0);
pack_to_bin(ProtoMsg) ->
	Recogn = recogn_by_proto_msg(ProtoMsg),
	pack_to_bin(Recogn, 0, ProtoMsg).
pack_to_bin(Recogn, ErrCode) when is_integer(Recogn) ->
	pack_to_bin(Recogn, ErrCode, undefined);
pack_to_bin(ProtoMsg, ErrCode) ->
	Recogn = recogn_by_proto_msg(ProtoMsg),
	pack_to_bin(Recogn, ErrCode, ProtoMsg).
pack_to_bin(Recogn, ErrCode, ProtoMsg) ->
	HeadBin = <<0:32/little, Recogn:32/little, ErrCode:32/little>>,
	HeadSize = byte_size(HeadBin),
	if
		ProtoMsg =/= undefined ->
			ProtoMod = mod_atom_by_recogn(Recogn),
			MsgName = element(1, ProtoMsg),
			try
				BodyBin = apply(ProtoMod, encode_msg, [ProtoMsg, MsgName]),
				BodySize = byte_size(BodyBin),
				Size = HeadSize + BodySize,
				<<Size:32/little, HeadBin/binary, BodyBin/binary>>
			catch
				throw:{encode, {Name, Value, Stacktrace}} ->
					?ERROR("encode proto ~p error: field:~p, data:~p, ~n trace:~p",
						[MsgName, Name, Value, Stacktrace]),
					<<>>;
				_:Reason ->
					?ERROR("encode proto error: ~p ~p ~p ~n~w ~nReason:~w ~n trace: ~p", [Recogn, ProtoMod, MsgName, ProtoMsg, Reason, erlang:get_stacktrace()]),
					<<>>
			end;
		true ->
			<<HeadSize:32/little, HeadBin/binary>>
	end.
%%throw:{encode, {Type, Reason, EncodeMsgName, Tag, WireType, DataType, IsArray, FieldName, Val, Stacktrace}} ->
%%?ERROR("encode proto ~p error: msg_name:~p, field_name:~p index:~p, wire_type:~p data_type:~p is_array:~p ~n ~p:~p data:~w ~n trace: ~p",
%%[MsgName, EncodeMsgName, FieldName, Tag, WireType, DataType, IsArray, Type, Reason, Val, Stacktrace]),
%%<<>>;
mod_atom_by_recogn(Recogn) when is_integer(Recogn)->
	lib_types:to_atom("ProtoClient_" ++ lib_types:to_list(10000 + (Recogn div 1000) rem 10000));
mod_atom_by_recogn(Recogn) ->
	mod_atom_by_recogn(lib_types:to_integer(Recogn)).

msgname_atom_by_recogn(Recogn) when is_integer(Recogn) ->
	lib_types:to_atom("Proto" ++ lib_types:to_list(Recogn));
msgname_atom_by_recogn(Recogn) ->
	msgname_atom_by_recogn(lib_types:to_integer(Recogn)).

recogn_by_proto_msg(ProtoMsg) ->
	MsgName = element(1, ProtoMsg),
	recogn_by_msgname(MsgName).
recogn_by_msgname(MsgName) ->
	StrRecogn = string:substr(lib_types:to_list(MsgName), 6),
	lib_types:to_integer(StrRecogn).

request_code_to_respond_code(Recogn) when Recogn >= 10000000 andalso Recogn < 20000000 ->
	Recogn + 40000000;
request_code_to_respond_code(Recogn) ->
	Recogn.

