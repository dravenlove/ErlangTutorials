%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10118').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10118.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10118002') ->
    #'Proto10118002'{'task_id'=F1,'task_type'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='task_id'},	% task_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='task_type'}	% task_type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10118003') ->
    #'Proto10118003'{'guidance_info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoPairLong',is_array=0,value=F1,field_name='guidance_info'}	% guidance_info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50118001') ->
    #'Proto50118001'{'task_info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTask',is_array=1,value=F1,field_name='task_info'}	% task_info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50118002') ->
    #'Proto50118002'{'task_id'=F1,'task_type'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='task_id'},	% task_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='task_type'}	% task_type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50118005') ->
    #'Proto50118005'{'bounty_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBountyMission',is_array=1,value=F1,field_name='bounty_mission_list'}	% bounty_mission_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80118001') ->
    #'Proto80118001'{'task_info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTask',is_array=1,value=F1,field_name='task_info'}	% task_info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80118002') ->
    #'Proto80118002'{'guidance_info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoPairLong',is_array=1,value=F1,field_name='guidance_info'}	% guidance_info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80118005') ->
    #'Proto80118005'{'bounty_mission'=F1,'state'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBountyMission',is_array=0,value=F1,field_name='bounty_mission'},	% bounty_mission
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='state'}	% state
    ].
fetch_field_map('Proto10118002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='task_id'},	% task_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='task_type'}	% task_type
    };
fetch_field_map('Proto10118003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoPairLong',is_array=0,field_name='guidance_info'}	% guidance_info
    };
fetch_field_map('Proto50118001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTask',is_array=1,field_name='task_info'}	% task_info
    };
fetch_field_map('Proto50118002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='task_id'},	% task_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='task_type'}	% task_type
    };
fetch_field_map('Proto50118005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBountyMission',is_array=1,field_name='bounty_mission_list'}	% bounty_mission_list
    };
fetch_field_map('Proto80118001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTask',is_array=1,field_name='task_info'}	% task_info
    };
fetch_field_map('Proto80118002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoPairLong',is_array=1,field_name='guidance_info'}	% guidance_info
    };
fetch_field_map('Proto80118005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBountyMission',is_array=0,field_name='bounty_mission'},	% bounty_mission
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='state'}	% state
    }.
field_map_to_msg('Proto10118002', FieldMap) ->
    #'Proto10118002'{
        'task_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'task_type' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10118003', FieldMap) ->
    #'Proto10118003'{
        'guidance_info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50118001', FieldMap) ->
    #'Proto50118001'{
        'task_info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50118002', FieldMap) ->
    #'Proto50118002'{
        'task_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'task_type' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50118005', FieldMap) ->
    #'Proto50118005'{
        'bounty_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80118001', FieldMap) ->
    #'Proto80118001'{
        'task_info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80118002', FieldMap) ->
    #'Proto80118002'{
        'guidance_info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80118005', FieldMap) ->
    #'Proto80118005'{
        'bounty_mission' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'state' = gb_unserialize:get_value(maps:get(2,FieldMap))
    }.