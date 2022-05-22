%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10117').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10117.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10117001') ->
    #'Proto10117001'{'other'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='other'}	% other
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10117002') ->
    #'Proto10117002'{'act_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='act_id'}	% act_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10117010') ->
    #'Proto10117010'{'act_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='act_id'}	% act_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10117011') ->
    #'Proto10117011'{'act_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='act_id'}	% act_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10117012') ->
    #'Proto10117012'{'act_id'=F1,'task_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='act_id'},	% act_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='task_id'}	% task_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50117001') ->
    #'Proto50117001'{'act_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,value=F1,field_name='act_list'}	% act_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50117002') ->
    #'Proto50117002'{'act_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='act_id'}	% act_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50117010') ->
    #'Proto50117010'{'info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoDailyTask',is_array=1,value=F1,field_name='info'}	% info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80117001') ->
    #'Proto80117001'{'act_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,value=F1,field_name='act_list'}	% act_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80117002') ->
    #'Proto80117002'{'act_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,value=F1,field_name='act_list'}	% act_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80117003') ->
    #'Proto80117003'{'act_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,value=F1,field_name='act_list'}	% act_list
    ].
fetch_field_map('Proto10117001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='other'}	% other
    };
fetch_field_map('Proto10117002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='act_id'}	% act_id
    };
fetch_field_map('Proto10117010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='act_id'}	% act_id
    };
fetch_field_map('Proto10117011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='act_id'}	% act_id
    };
fetch_field_map('Proto10117012') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='act_id'},	% act_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='task_id'}	% task_id
    };
fetch_field_map('Proto50117001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,field_name='act_list'}	% act_list
    };
fetch_field_map('Proto50117002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='act_id'}	% act_id
    };
fetch_field_map('Proto50117010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoDailyTask',is_array=1,field_name='info'}	% info
    };
fetch_field_map('Proto80117001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,field_name='act_list'}	% act_list
    };
fetch_field_map('Proto80117002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,field_name='act_list'}	% act_list
    };
fetch_field_map('Proto80117003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoActivityBase',is_array=1,field_name='act_list'}	% act_list
    }.
field_map_to_msg('Proto10117001', FieldMap) ->
    #'Proto10117001'{
        'other' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10117002', FieldMap) ->
    #'Proto10117002'{
        'act_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10117010', FieldMap) ->
    #'Proto10117010'{
        'act_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10117011', FieldMap) ->
    #'Proto10117011'{
        'act_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10117012', FieldMap) ->
    #'Proto10117012'{
        'act_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'task_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50117001', FieldMap) ->
    #'Proto50117001'{
        'act_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50117002', FieldMap) ->
    #'Proto50117002'{
        'act_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50117010', FieldMap) ->
    #'Proto50117010'{
        'info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80117001', FieldMap) ->
    #'Proto80117001'{
        'act_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80117002', FieldMap) ->
    #'Proto80117002'{
        'act_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80117003', FieldMap) ->
    #'Proto80117003'{
        'act_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
