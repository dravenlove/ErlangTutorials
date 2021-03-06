%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10131').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10131.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10131002') ->
    #'Proto10131002'{'type'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'}	% type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10131003') ->
    #'Proto10131003'{'id'=F1,'type'=F2,'hero_id'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='id'},	% id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='type'},	% type
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10131004') ->
    #'Proto10131004'{'id'=F1,'type'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='id'},	% id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='type'}	% type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10131005') ->
    #'Proto10131005'{'id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='id'}	% id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10131006') ->
    #'Proto10131006'{'id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='id'}	% id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50131001') ->
    #'Proto50131001'{'hall_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoHolySpiritHall',is_array=1,value=F1,field_name='hall_list'}	% hall_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50131002') ->
    #'Proto50131002'{'hero_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoHeroGarde',is_array=1,value=F1,field_name='hero_list'}	% hero_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50131004') ->
    #'Proto50131004'{'type_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoKeyValue',is_array=1,value=F1,field_name='type_list'}	% type_list
    ].
fetch_field_map('Proto10131002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'}	% type
    };
fetch_field_map('Proto10131003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='id'},	% id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto10131004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='id'},	% id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'}	% type
    };
fetch_field_map('Proto10131005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='id'}	% id
    };
fetch_field_map('Proto10131006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='id'}	% id
    };
fetch_field_map('Proto50131001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoHolySpiritHall',is_array=1,field_name='hall_list'}	% hall_list
    };
fetch_field_map('Proto50131002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoHeroGarde',is_array=1,field_name='hero_list'}	% hero_list
    };
fetch_field_map('Proto50131004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoKeyValue',is_array=1,field_name='type_list'}	% type_list
    }.
field_map_to_msg('Proto10131002', FieldMap) ->
    #'Proto10131002'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10131003', FieldMap) ->
    #'Proto10131003'{
        'id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'hero_id' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto10131004', FieldMap) ->
    #'Proto10131004'{
        'id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'type' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10131005', FieldMap) ->
    #'Proto10131005'{
        'id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10131006', FieldMap) ->
    #'Proto10131006'{
        'id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50131001', FieldMap) ->
    #'Proto50131001'{
        'hall_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50131002', FieldMap) ->
    #'Proto50131002'{
        'hero_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50131004', FieldMap) ->
    #'Proto50131004'{
        'type_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
