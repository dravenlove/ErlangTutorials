%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10115').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10115.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10115002') ->
    #'Proto10115002'{'gift_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='gift_id'}	% gift_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50115001') ->
    #'Proto50115001'{'gift_id'=F1,'surplus_time'=F2,'is_double'=F3,'is_get_all'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='gift_id'},	% gift_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='surplus_time'},	% surplus_time
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='is_double'},	% is_double
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='is_get_all'}	% is_get_all
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80115003') ->
    #'Proto80115003'{'type'=F1,'is_get_all'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'},	% type
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='is_get_all'}	% is_get_all
    ].
fetch_field_map('Proto10115002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='gift_id'}	% gift_id
    };
fetch_field_map('Proto50115001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='gift_id'},	% gift_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='surplus_time'},	% surplus_time
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='is_double'},	% is_double
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='is_get_all'}	% is_get_all
    };
fetch_field_map('Proto80115003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='is_get_all'}	% is_get_all
    }.
field_map_to_msg('Proto10115002', FieldMap) ->
    #'Proto10115002'{
        'gift_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50115001', FieldMap) ->
    #'Proto50115001'{
        'gift_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'surplus_time' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'is_double' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'is_get_all' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto80115003', FieldMap) ->
    #'Proto80115003'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'is_get_all' = gb_unserialize:get_value(maps:get(2,FieldMap))
    }.
