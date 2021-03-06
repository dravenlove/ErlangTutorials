%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10136').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10136.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10136001') ->
    #'Proto10136001'{'state'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='state'}	% state
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10136002') ->
    #'Proto10136002'{'state'=F1,'city_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='state'},	% state
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='city_id'}	% city_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10136003') ->
    #'Proto10136003'{'hero_id'=F1,'city_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'},	% hero_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='city_id'}	% city_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10136004') ->
    #'Proto10136004'{'hero_id'=F1,'state'=F2,'city_id'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'},	% hero_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='state'},	% state
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='city_id'}	% city_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10136005') ->
    #'Proto10136005'{'city_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='city_id'}	% city_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50136001') ->
    #'Proto50136001'{'total_num'=F1,'num'=F2,'city_industry_list'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='total_num'},	% total_num
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='num'},	% num
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoCityIndustry',is_array=1,value=F3,field_name='city_industry_list'}	% city_industry_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50136002') ->
    #'Proto50136002'{'state'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='state'}	% state
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50136005') ->
    #'Proto50136005'{'total_num'=F1,'num'=F2,'city_industry'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='total_num'},	% total_num
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='num'},	% num
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoCityIndustry',is_array=0,value=F3,field_name='city_industry'}	% city_industry
    ].
fetch_field_map('Proto10136001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='state'}	% state
    };
fetch_field_map('Proto10136002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='state'},	% state
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='city_id'}	% city_id
    };
fetch_field_map('Proto10136003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'},	% hero_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='city_id'}	% city_id
    };
fetch_field_map('Proto10136004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'},	% hero_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='state'},	% state
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='city_id'}	% city_id
    };
fetch_field_map('Proto10136005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='city_id'}	% city_id
    };
fetch_field_map('Proto50136001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='total_num'},	% total_num
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'},	% num
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoCityIndustry',is_array=1,field_name='city_industry_list'}	% city_industry_list
    };
fetch_field_map('Proto50136002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='state'}	% state
    };
fetch_field_map('Proto50136005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='total_num'},	% total_num
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'},	% num
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoCityIndustry',is_array=0,field_name='city_industry'}	% city_industry
    }.
field_map_to_msg('Proto10136001', FieldMap) ->
    #'Proto10136001'{
        'state' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10136002', FieldMap) ->
    #'Proto10136002'{
        'state' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'city_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10136003', FieldMap) ->
    #'Proto10136003'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'city_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10136004', FieldMap) ->
    #'Proto10136004'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'state' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'city_id' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto10136005', FieldMap) ->
    #'Proto10136005'{
        'city_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50136001', FieldMap) ->
    #'Proto50136001'{
        'total_num' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'city_industry_list' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50136002', FieldMap) ->
    #'Proto50136002'{
        'state' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50136005', FieldMap) ->
    #'Proto50136005'{
        'total_num' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'city_industry' = gb_unserialize:get_value(maps:get(3,FieldMap))
    }.
