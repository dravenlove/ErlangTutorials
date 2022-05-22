%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10119').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10119.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10119001') ->
    #'Proto10119001'{'other'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='other'}	% other
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50119001') ->
    #'Proto50119001'{'function_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F1,field_name='function_list'}	% function_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80119001') ->
    #'Proto80119001'{'function_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F1,field_name='function_list'}	% function_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80119002') ->
    #'Proto80119002'{'function_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F1,field_name='function_list'}	% function_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80119003') ->
    #'Proto80119003'{'function_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F1,field_name='function_list'}	% function_list
    ].
fetch_field_map('Proto10119001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='other'}	% other
    };
fetch_field_map('Proto50119001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='function_list'}	% function_list
    };
fetch_field_map('Proto80119001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='function_list'}	% function_list
    };
fetch_field_map('Proto80119002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='function_list'}	% function_list
    };
fetch_field_map('Proto80119003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='function_list'}	% function_list
    }.
field_map_to_msg('Proto10119001', FieldMap) ->
    #'Proto10119001'{
        'other' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50119001', FieldMap) ->
    #'Proto50119001'{
        'function_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80119001', FieldMap) ->
    #'Proto80119001'{
        'function_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80119002', FieldMap) ->
    #'Proto80119002'{
        'function_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80119003', FieldMap) ->
    #'Proto80119003'{
        'function_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
