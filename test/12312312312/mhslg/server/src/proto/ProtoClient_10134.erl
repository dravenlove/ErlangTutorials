%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10134').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10134.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10134001') ->
    #'Proto10134001'{'hero_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F1,field_name='hero_list'}	% hero_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50134005') ->
    #'Proto50134005'{'rank_list'=F1,'self'=F2,'self_kills'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoDungeonedRank',is_array=1,value=F1,field_name='rank_list'},	% rank_list
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoShowRole',is_array=0,value=F2,field_name='self'},	% self
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='self_kills'}	% self_kills
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80134003') ->
    #'Proto80134003'{'state'=F1,'combat_id'=F2,'cur_floor'=F3,'use_times'=F4,'buy_times'=F5,'former_type'=F6,'latter_type'=F7}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='state'},	% state
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F2,field_name='combat_id'},	% combat_id
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='cur_floor'},	% cur_floor
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='use_times'},	% use_times
        #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F5,field_name='buy_times'},	% buy_times
        #proto_field{field_tag=6,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F6,field_name='former_type'},	% former_type
        #proto_field{field_tag=7,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F7,field_name='latter_type'}	% latter_type
    ].
fetch_field_map('Proto10134001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='hero_list'}	% hero_list
    };
fetch_field_map('Proto50134005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoDungeonedRank',is_array=1,field_name='rank_list'},	% rank_list
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoShowRole',is_array=0,field_name='self'},	% self
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='self_kills'}	% self_kills
    };
fetch_field_map('Proto80134003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='state'},	% state
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'},	% combat_id
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='cur_floor'},	% cur_floor
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='use_times'},	% use_times
        5 => #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='buy_times'},	% buy_times
        6 => #proto_field{field_tag=6,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='former_type'},	% former_type
        7 => #proto_field{field_tag=7,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='latter_type'}	% latter_type
    }.
field_map_to_msg('Proto10134001', FieldMap) ->
    #'Proto10134001'{
        'hero_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50134005', FieldMap) ->
    #'Proto50134005'{
        'rank_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'self' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'self_kills' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto80134003', FieldMap) ->
    #'Proto80134003'{
        'state' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'combat_id' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'cur_floor' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'use_times' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'buy_times' = gb_unserialize:get_value(maps:get(5,FieldMap)),
        'former_type' = gb_unserialize:get_value(maps:get(6,FieldMap)),
        'latter_type' = gb_unserialize:get_value(maps:get(7,FieldMap))
    }.
