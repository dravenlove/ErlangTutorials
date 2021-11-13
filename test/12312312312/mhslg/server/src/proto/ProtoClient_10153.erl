%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10153').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10153.hrl").
-include("ProtoPublic.hrl").
-include("protobuffer.hrl").
encode_msg(Msg) ->
	encode_msg(Msg, element(1, Msg)).
encode_msg(Msg, MsgName)->
	SerialFieldList = convert_field_list(Msg),
	gb_serialize:serialize_field_list(SerialFieldList, MsgName).
decode_msg(DataBin, MsgNameAtom) ->
	FieldMap = fetch_field_map(MsgNameAtom),
	NewFieldMap = gb_unserialize:unserialize_field_list(DataBin, FieldMap),
	field_map_to_msg(MsgNameAtom, NewFieldMap).
convert_field_list(Msg) when is_record(Msg, 'Proto10153001') ->
    #'Proto10153001'{'code'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='code'}	% code
    ].
fetch_field_map('Proto10153001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='code'}	% code
    }.
field_map_to_msg('Proto10153001', FieldMap) ->
    #'Proto10153001'{
        'code' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.