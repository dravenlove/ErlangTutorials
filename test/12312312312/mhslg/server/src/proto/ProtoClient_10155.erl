%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10155').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10155.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10155002') ->
    #'Proto10155002'{'hero_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10155003') ->
    #'Proto10155003'{'hero_id'=F1,'pos_list'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'},	% hero_id
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoPos',is_array=1,value=F2,field_name='pos_list'}	% pos_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10155004') ->
    #'Proto10155004'{'hero_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50155001') ->
    #'Proto50155001'{'troop_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroop',is_array=1,value=F1,field_name='troop_list'}	% troop_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50155101') ->
    #'Proto50155101'{'troop_fight_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopFight',is_array=1,value=F1,field_name='troop_fight_list'}	% troop_fight_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80155001') ->
    #'Proto80155001'{'troop_list'=F1,'flag'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroop',is_array=1,value=F1,field_name='troop_list'},	% troop_list
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='flag'}	% flag
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80155101') ->
    #'Proto80155101'{'troop_fight'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopFight',is_array=0,value=F1,field_name='troop_fight'}	% troop_fight
    ].
fetch_field_map('Proto10155002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto10155003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'},	% hero_id
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoPos',is_array=1,field_name='pos_list'}	% pos_list
    };
fetch_field_map('Proto10155004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto50155001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroop',is_array=1,field_name='troop_list'}	% troop_list
    };
fetch_field_map('Proto50155101') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopFight',is_array=1,field_name='troop_fight_list'}	% troop_fight_list
    };
fetch_field_map('Proto80155001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroop',is_array=1,field_name='troop_list'},	% troop_list
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='flag'}	% flag
    };
fetch_field_map('Proto80155101') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopFight',is_array=0,field_name='troop_fight'}	% troop_fight
    }.
field_map_to_msg('Proto10155002', FieldMap) ->
    #'Proto10155002'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10155003', FieldMap) ->
    #'Proto10155003'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'pos_list' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10155004', FieldMap) ->
    #'Proto10155004'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50155001', FieldMap) ->
    #'Proto50155001'{
        'troop_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50155101', FieldMap) ->
    #'Proto50155101'{
        'troop_fight_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80155001', FieldMap) ->
    #'Proto80155001'{
        'troop_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'flag' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto80155101', FieldMap) ->
    #'Proto80155101'{
        'troop_fight' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
