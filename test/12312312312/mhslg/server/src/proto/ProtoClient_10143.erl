%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10143').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10143.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10143002') ->
    #'Proto10143002'{'floor'=F1,'hero_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='floor'},	% floor
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F2,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10143003') ->
    #'Proto10143003'{'floor'=F1,'hero_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='floor'},	% floor
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10143004') ->
    #'Proto10143004'{'index'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='index'}	% index
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10143005') ->
    #'Proto10143005'{'floor'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='floor'}	% floor
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10143009') ->
    #'Proto10143009'{'floor'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='floor'}	% floor
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50143001') ->
    #'Proto50143001'{'detail_list'=F1,'reward_list'=F2,'floor_list'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienDetail',is_array=1,value=F1,field_name='detail_list'},	% detail_list
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoAlienReward',is_array=1,value=F2,field_name='reward_list'},	% reward_list
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F3,field_name='floor_list'}	% floor_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50143002') ->
    #'Proto50143002'{'fighters'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightHero',is_array=1,value=F1,field_name='fighters'}	% fighters
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50143003') ->
    #'Proto50143003'{'fighters'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightHero',is_array=1,value=F1,field_name='fighters'}	% fighters
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50143004') ->
    #'Proto50143004'{'reward_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienReward',is_array=0,value=F1,field_name='reward_list'}	% reward_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80143007') ->
    #'Proto80143007'{'detail_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienDetail',is_array=1,value=F1,field_name='detail_list'}	% detail_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80143008') ->
    #'Proto80143008'{'reward_list'=F1,'use_hero_list'=F2,'floor_list'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienReward',is_array=1,value=F1,field_name='reward_list'},	% reward_list
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F2,field_name='use_hero_list'},	% use_hero_list
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F3,field_name='floor_list'}	% floor_list
    ].
fetch_field_map('Proto10143002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='floor'},	% floor
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto10143003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='floor'},	% floor
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto10143004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='index'}	% index
    };
fetch_field_map('Proto10143005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='floor'}	% floor
    };
fetch_field_map('Proto10143009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='floor'}	% floor
    };
fetch_field_map('Proto50143001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienDetail',is_array=1,field_name='detail_list'},	% detail_list
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoAlienReward',is_array=1,field_name='reward_list'},	% reward_list
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='floor_list'}	% floor_list
    };
fetch_field_map('Proto50143002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightHero',is_array=1,field_name='fighters'}	% fighters
    };
fetch_field_map('Proto50143003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightHero',is_array=1,field_name='fighters'}	% fighters
    };
fetch_field_map('Proto50143004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienReward',is_array=0,field_name='reward_list'}	% reward_list
    };
fetch_field_map('Proto80143007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienDetail',is_array=1,field_name='detail_list'}	% detail_list
    };
fetch_field_map('Proto80143008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAlienReward',is_array=1,field_name='reward_list'},	% reward_list
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='use_hero_list'},	% use_hero_list
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='floor_list'}	% floor_list
    }.
field_map_to_msg('Proto10143002', FieldMap) ->
    #'Proto10143002'{
        'floor' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'hero_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10143003', FieldMap) ->
    #'Proto10143003'{
        'floor' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'hero_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10143004', FieldMap) ->
    #'Proto10143004'{
        'index' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10143005', FieldMap) ->
    #'Proto10143005'{
        'floor' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10143009', FieldMap) ->
    #'Proto10143009'{
        'floor' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50143001', FieldMap) ->
    #'Proto50143001'{
        'detail_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'reward_list' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'floor_list' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50143002', FieldMap) ->
    #'Proto50143002'{
        'fighters' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50143003', FieldMap) ->
    #'Proto50143003'{
        'fighters' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50143004', FieldMap) ->
    #'Proto50143004'{
        'reward_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80143007', FieldMap) ->
    #'Proto80143007'{
        'detail_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80143008', FieldMap) ->
    #'Proto80143008'{
        'reward_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'use_hero_list' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'floor_list' = gb_unserialize:get_value(maps:get(3,FieldMap))
    }.
