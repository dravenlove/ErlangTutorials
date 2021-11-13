%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10133').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10133.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10133001') ->
    #'Proto10133001'{'city_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='city_id'}	% city_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10133003') ->
    #'Proto10133003'{'hero_id'=F1,'city_id'=F2,'building_id'=F3,'choose'=F4,'type'=F5}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'},	% hero_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='city_id'},	% city_id
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='building_id'},	% building_id
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='choose'},	% choose
        #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F5,field_name='type'}	% type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50133001') ->
    #'Proto50133001'{'building'=F1,'add1'=F2,'add2'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCityBuilding',is_array=1,value=F1,field_name='building'},	% building
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='add1'},	% add1
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='add2'}	% add2
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50133003') ->
    #'Proto50133003'{'building_id'=F1,'value'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'},	% building_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='value'}	% value
    ].
fetch_field_map('Proto10133001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='city_id'}	% city_id
    };
fetch_field_map('Proto10133003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'},	% hero_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='city_id'},	% city_id
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='choose'},	% choose
        5 => #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'}	% type
    };
fetch_field_map('Proto50133001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCityBuilding',is_array=1,field_name='building'},	% building
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='add1'},	% add1
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='add2'}	% add2
    };
fetch_field_map('Proto50133003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='value'}	% value
    }.
field_map_to_msg('Proto10133001', FieldMap) ->
    #'Proto10133001'{
        'city_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10133003', FieldMap) ->
    #'Proto10133003'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'city_id' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'building_id' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'choose' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'type' = gb_unserialize:get_value(maps:get(5,FieldMap))
    };
field_map_to_msg('Proto50133001', FieldMap) ->
    #'Proto50133001'{
        'building' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'add1' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'add2' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50133003', FieldMap) ->
    #'Proto50133003'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'value' = gb_unserialize:get_value(maps:get(2,FieldMap))
    }.