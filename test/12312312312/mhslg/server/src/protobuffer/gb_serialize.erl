%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: gb_serialize
%%% Created on : 2020/9/3 0003 15:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(gb_serialize).
-author("glendy").
-include("protobuffer.hrl").

%% API
-export([
	serialize_field_list/2
]).

serialize_field_list(FieldList, MsgName) ->
	serialize_field_list(<<>>, FieldList, MsgName).

serialize_field_list(Bin, [], _MsgName) ->
	Bin;
serialize_field_list(Bin, [ProtoField | T], MsgName ) ->
	#proto_field{
		field_tag = Tag,
		wire_type = WireType,
		data_type = DataType,
		is_array = IsArray,
		value = Value0,
		field_name = FieldName
	} = ProtoField,
	Key = tag_type_to_key(Tag, WireType),
	NewBin =
	try
		if
			IsArray =:= 1 andalso is_list(Value0) ->
				%% 数组处理逻辑
				lists:foldl(
					fun(Val, AccBin0) ->
						serialize_field(AccBin0, Key, DataType, Val)
					end, Bin, Value0);
			true ->
				serialize_field(Bin, Key, DataType, Value0)
		end
	catch
		throw: {encode, {FieldName1, Value1, Trace1}} -> throw({encode, {list_to_atom(atom_to_list(FieldName) ++ "." ++ atom_to_list(FieldName1)), Value1, Trace1}});
	    _Type: _Reason -> throw({encode, {FieldName, Value0, erlang:get_stacktrace()}})
	end,
%%	Type: Reason -> throw({encode, {Type, Reason, MsgName, Tag, WireType, DataType, IsArray, FieldName, Value0, erlang:get_stacktrace()}})
	serialize_field_list(NewBin, T, MsgName).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tag_type_to_key(Tag, WireType) ->
	Tag bsl 3 + WireType.

serialize_field(Bin, _Key, _DataType, undefined) ->
	Bin;
serialize_field(Bin, Key, DataType, Value)
  when DataType =:= ?DATA_TYPE_INT32
  orelse DataType =:= ?DATA_TYPE_INT64
  orelse DataType =:= ?DATA_TYPE_UINT32
  orelse DataType =:= ?DATA_TYPE_UINT64 ->
	NewBin1 = e_varint(Key, Bin),
	e_type_int64(Value, NewBin1);
serialize_field(Bin, Key, DataType, Value)
  when DataType =:= ?DATA_TYPE_SINT32
  orelse DataType =:= ?DATA_TYPE_SINT64 ->
	NewBin1 = e_varint(Key, Bin),
	e_type_sint(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_DOUBLE, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_double(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_FLOAT, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_float(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_STRING, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_string(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_BOOL, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_bool(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_BYTES, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_bytes(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_FIXED32, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_fixed32(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_FIXED64, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_fixed64(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_SFIXED32, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_sfixed32(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_SFIXED64, Value) ->
	NewBin1 = e_varint(Key, Bin),
	e_type_sfixed64(Value, NewBin1);
serialize_field(Bin, Key, ?DATA_TYPE_MESSAGE, Value) ->
	NewBin1 = e_varint(Key, Bin),
	MsgBin = apply('ProtoPublic', encode_msg, [Value]),
	NewBin2 = e_varint(byte_size(MsgBin), NewBin1),
	<<NewBin2/binary, MsgBin/binary>>.

e_type_int64(Value, Bin) when 0 =< Value, Value =< 127 -> <<Bin/binary, Value>>;
e_type_int64(Value, Bin) -> <<N:64/unsigned-native>> = <<Value:64/signed-native>>, e_varint(N, Bin).

e_type_bool(true, Bin) -> <<Bin/binary, 1>>;
e_type_bool(false, Bin) -> <<Bin/binary, 0>>;
e_type_bool(1, Bin) -> <<Bin/binary, 1>>;
e_type_bool(0, Bin) -> <<Bin/binary, 0>>.

e_type_string(S, Bin) -> Utf8 = unicode:characters_to_binary(S), Bin2 = e_varint(byte_size(Utf8), Bin), <<Bin2/binary, Utf8/binary>>.

e_type_bytes(Bytes, Bin) when is_binary(Bytes) -> Bin2 = e_varint(byte_size(Bytes), Bin), <<Bin2/binary, Bytes/binary>>;
e_type_bytes(Bytes, Bin) when is_list(Bytes) -> BytesBin = iolist_to_binary(Bytes), Bin2 = e_varint(byte_size(BytesBin), Bin), <<Bin2/binary, BytesBin/binary>>.

e_type_sint(Value, Bin) when Value >= 0 -> e_varint(Value * 2, Bin);
e_type_sint(Value, Bin) -> e_varint(Value * -2 - 1, Bin).

e_type_fixed32(Value, Bin) -> <<Bin/binary, Value:32/little>>.

e_type_sfixed32(Value, Bin) -> <<Bin/binary, Value:32/little-signed>>.

e_type_fixed64(Value, Bin) -> <<Bin/binary, Value:64/little>>.

e_type_sfixed64(Value, Bin) -> <<Bin/binary, Value:64/little-signed>>.

e_type_float(V, Bin) when is_number(V) -> <<Bin/binary, V:32/little-float>>;
e_type_float(infinity, Bin) -> <<Bin/binary, 0:16, 128, 127>>;
e_type_float('-infinity', Bin) -> <<Bin/binary, 0:16, 128, 255>>;
e_type_float(nan, Bin) -> <<Bin/binary, 0:16, 192, 127>>.

e_type_double(V, Bin) when is_number(V) -> <<Bin/binary, V:64/little-float>>;
e_type_double(infinity, Bin) -> <<Bin/binary, 0:48, 240, 127>>;
e_type_double('-infinity', Bin) -> <<Bin/binary, 0:48, 240, 255>>;
e_type_double(nan, Bin) -> <<Bin/binary, 0:48, 248, 127>>.

e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) -> Bin2 = <<Bin/binary, (N band 127 bor 128)>>, e_varint(N bsr 7, Bin2).
