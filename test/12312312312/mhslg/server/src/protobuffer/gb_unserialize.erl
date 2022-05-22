%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: gb_unserialize
%%% Created on : 2020/9/3 0003 18:20
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(gb_unserialize).
-author("glendy").
-include("protobuffer.hrl").

%% API
-export([
	unserialize_field_list/2,
	get_value/1
]).

unserialize_field_list(<<>>, FieldMap) ->
	FieldMap;
unserialize_field_list(DataBin, FieldMap) ->
	{Key, RestDataBin0} = d_varint(DataBin, 0, 0),
	{Tag, WireType} = key_split_to_tag(Key),
	{Value, RestDataBin1} = unserialize_field(WireType, RestDataBin0),
	case 0 < Tag andalso maps:is_key(Tag, FieldMap) of
		true ->
			NewFieldMap = set_field_value(Value, Tag, FieldMap),
			unserialize_field_list(RestDataBin1, NewFieldMap);
		_ ->
			unserialize_field_list(RestDataBin1, FieldMap)
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

key_split_to_tag(Key) ->
	WireType = Key band 7,
	Tag = Key bsr 3,
	{Tag, WireType}.

unserialize_field(?WIRE_TYPE_VARINT, DataBin) ->
	d_varint(DataBin, 0, 0);
unserialize_field(?WIRE_TYPE_DOUBLE, DataBin) ->
	d_type_double(DataBin);
unserialize_field(?WIRE_TYPE_STRING_OR_MESSAGE, DataBin) ->
	{ByteSize, RestDataBin0} = d_varint(DataBin, 0, 0),
	d_type_bytes(RestDataBin0, ByteSize);
unserialize_field(?WIRE_TYPE_FLOAT, DataBin) ->
	d_type_float(DataBin).

d_varint(<<1:1, X:7, Rest/binary>>, N, Acc0) when N + 7 < 64 -> d_varint(Rest, N + 7, X bsl N + Acc0);
d_varint(<<0:1, X:7, Rest/binary>>, N, Acc0) -> {X bsl N + Acc0, Rest}.

d_type_bytes(Bin, Len) -> <<Bytes:Len/binary, Rest/binary>> = Bin, {Bytes, Rest}.

d_type_float(<<0:16, 128, 127, Rest/binary>>) -> {'infinity', Rest};
d_type_float(<<0:16, 128, 255, Rest/binary>>) -> {'-infinity', Rest};
d_type_float(<<0:16, 192, 127, Rest/binary>>) -> {'nan', Rest};
d_type_float(<<Value:32/little-float, Rest/binary>>) -> {Value, Rest}.

d_type_double(<<0:48, 240, 127, Rest/binary>>) -> {'infinity', Rest};
d_type_double(<<0:48, 240, 255, Rest/binary>>) -> {'-infinity', Rest};
d_type_double(<<0:48, 248, 127, Rest/binary>>) -> {'nan', Rest};
d_type_double(<<Value:64/little-float, Rest/binary>>) -> {Value, Rest}.

set_field_value(Value, Tag, FieldMap) ->
	Field = maps:get(Tag, FieldMap),
	NewField = set_field_value(Value, Field),
	maps:put(Tag, NewField, FieldMap).

set_field_value_with_array(Value, #proto_field{is_array = IsArray, value = OrgValue} = Field) ->
	if
		IsArray =:= 1 ->
			if
				is_list(OrgValue) -> Field#proto_field{value = [Value | OrgValue]};
				true -> Field#proto_field{value = [Value]}
			end;
		true ->
			Field#proto_field{value = Value}
	end.

set_field_value(Value, #proto_field{data_type = DataType} = Field)
  when DataType =:= ?DATA_TYPE_INT32
  orelse DataType =:= ?DATA_TYPE_INT64
  orelse DataType =:= ?DATA_TYPE_UINT32
  orelse DataType =:= ?DATA_TYPE_UINT64 ->
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = DataType} = Field)
  when DataType =:= ?DATA_TYPE_SINT32
  orelse DataType =:= ?DATA_TYPE_SINT64 ->
	Value =
		if
			Value0 band 1 =:= 0 -> Value0 bsr 1;
			true -> -(Value0 + 1 bsr 1)
		end,
	set_field_value_with_array(Value, Field);
set_field_value(Value, #proto_field{data_type = ?DATA_TYPE_DOUBLE} = Field) ->
	set_field_value_with_array(Value, Field);
set_field_value(Value, #proto_field{data_type = ?DATA_TYPE_FLOAT} = Field) ->
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_STRING} = Field) ->
	Value = unicode:characters_to_list(Value0, unicode),
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_BOOL} = Field) ->
	Value = (Value0 =/= 0),
	set_field_value_with_array(Value, Field);
set_field_value(Value, #proto_field{data_type = ?DATA_TYPE_BYTES} = Field) ->
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_FIXED32} = Field) ->
	<<Value:32/little>> =
		if
			Value0 =:= 'infinity' -> <<0:16, 128, 127>>;
			Value0 =:= '-infinity' -> <<0:16, 128, 255>>;
			Value0 =:= 'nan' -> <<0:16, 192, 127>>;
			true -> <<Value0:32/little-float>>
		end,
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_FIXED64} = Field) ->
	<<Value:64/little>> =
		if
			Value0 =:= 'infinity' -> <<0:48, 240, 127>>;
			Value0 =:= '-infinity' -> <<0:48, 240, 255>>;
			Value0 =:= 'nan' -> <<0:48, 248, 127>>;
			true -> <<Value0:64/little-float>>
		end,
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_SFIXED32} = Field) ->
	<<Value:32/little-signed>> =
		if
			Value0 =:= 'infinity' -> <<0:16, 128, 127>>;
			Value0 =:= '-infinity' -> <<0:16, 128, 255>>;
			Value0 =:= 'nan' -> <<0:16, 192, 127>>;
			true -> <<Value0:32/little-float>>
		end,
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_SFIXED64} = Field) ->
	<<Value:64/little-signed>> =
		if
			Value0 =:= 'infinity' -> <<0:48, 240, 127>>;
			Value0 =:= '-infinity' -> <<0:48, 240, 255>>;
			Value0 =:= 'nan' -> <<0:48, 248, 127>>;
			true -> <<Value0:64/little-float>>
		end,
	set_field_value_with_array(Value, Field);
set_field_value(Value0, #proto_field{data_type = ?DATA_TYPE_MESSAGE, data_type_name = MsgNameAtom} = Field) ->
	Value = apply('ProtoPublic', decode_msg, [Value0, MsgNameAtom]),
	set_field_value_with_array(Value, Field).

%% 获取proto_field的字段值
get_value(#proto_field{data_type = DataType, is_array = IsArray, value = Value})
  when DataType =:= ?DATA_TYPE_INT32
  orelse DataType =:= ?DATA_TYPE_INT64
  orelse DataType =:= ?DATA_TYPE_UINT32
  orelse DataType =:= ?DATA_TYPE_UINT64
  orelse DataType =:= ?DATA_TYPE_SINT32
  orelse DataType =:= ?DATA_TYPE_SINT64
  orelse DataType =:= ?DATA_TYPE_FIXED32
  orelse DataType =:= ?DATA_TYPE_FIXED64
  orelse DataType =:= ?DATA_TYPE_SFIXED32
  orelse DataType =:= ?DATA_TYPE_SFIXED64 ->
	if
		Value =/= undefined andalso IsArray =:= 1 -> lists:reverse(Value);
		Value =/= undefined andalso IsArray =:= 0 -> Value;
		IsArray =:= 1 -> [];
		true -> 0
	end;
get_value(#proto_field{data_type = DataType, is_array = IsArray, value = Value})
  when DataType =:= ?DATA_TYPE_DOUBLE
  orelse DataType =:= ?DATA_TYPE_FLOAT ->
	if
		Value =/= undefined andalso IsArray =:= 1 -> lists:reverse(Value);
		Value =/= undefined andalso IsArray =:= 0 -> Value;
		IsArray =:= 1 -> [];
		true -> 0.0
	end;
get_value(#proto_field{data_type = ?DATA_TYPE_STRING, is_array = IsArray, value = Value}) ->
	if
		Value =/= undefined andalso IsArray =:= 1 -> lists:reverse(Value);
		Value =/= undefined andalso IsArray =:= 0 -> Value;
		IsArray =:= 1 -> [];
		true -> ""
	end;
get_value(#proto_field{data_type = ?DATA_TYPE_BOOL, is_array = IsArray, value = Value}) ->
	if
		Value =/= undefined andalso IsArray =:= 1 -> lists:reverse(Value);
		Value =/= undefined andalso IsArray =:= 0 -> Value;
		IsArray =:= 1 -> [];
		true -> false
	end;
get_value(#proto_field{data_type = ?DATA_TYPE_BYTES, is_array = IsArray, value = Value}) ->
	if
		Value =/= undefined andalso IsArray =:= 1 -> lists:reverse(Value);
		Value =/= undefined andalso IsArray =:= 0 -> Value;
		IsArray =:= 1 -> [];
		true -> <<>>
	end;
get_value(#proto_field{data_type = ?DATA_TYPE_MESSAGE, is_array = IsArray, value = Value}) ->
	if
		Value =/= undefined andalso IsArray =:= 1 -> lists:reverse(Value);
		Value =/= undefined andalso IsArray =:= 0 -> Value;
		IsArray =:= 1 -> [];
		true -> undefined
	end.
