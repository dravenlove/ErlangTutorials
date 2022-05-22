%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10108').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10108.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10108002') ->
    #'Proto10108002'{'act_index'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='act_index'}	% act_index
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10108004') ->
    #'Proto10108004'{'act_index'=F1,'id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='act_index'},	% act_index
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='id'}	% id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50108003') ->
    #'Proto50108003'{'recharge_money'=F1,'gear_list'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=1,data_type=5,data_type_name='undefined',is_array=0,value=F1,field_name='recharge_money'},	% recharge_money
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoBackActReward',is_array=1,value=F2,field_name='gear_list'}	% gear_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80108001') ->
    #'Proto80108001'{'backact_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBackAct',is_array=1,value=F1,field_name='backact_list'}	% backact_list
    ].
fetch_field_map('Proto10108002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='act_index'}	% act_index
    };
fetch_field_map('Proto10108004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='act_index'},	% act_index
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='id'}	% id
    };
fetch_field_map('Proto50108003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=1,data_type=5,data_type_name='undefined',is_array=0,field_name='recharge_money'},	% recharge_money
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoBackActReward',is_array=1,field_name='gear_list'}	% gear_list
    };
fetch_field_map('Proto80108001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBackAct',is_array=1,field_name='backact_list'}	% backact_list
    }.
field_map_to_msg('Proto10108002', FieldMap) ->
    #'Proto10108002'{
        'act_index' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10108004', FieldMap) ->
    #'Proto10108004'{
        'act_index' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50108003', FieldMap) ->
    #'Proto50108003'{
        'recharge_money' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'gear_list' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto80108001', FieldMap) ->
    #'Proto80108001'{
        'backact_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
