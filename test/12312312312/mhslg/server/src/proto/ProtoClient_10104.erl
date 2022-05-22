%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10104').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10104.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10104003') ->
    #'Proto10104003'{'mail_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='mail_id'}	% mail_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10104004') ->
    #'Proto10104004'{'mail_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='mail_id'}	% mail_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10104005') ->
    #'Proto10104005'{'mail_id_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F1,field_name='mail_id_list'}	% mail_id_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50104002') ->
    #'Proto50104002'{'mail_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMail',is_array=1,value=F1,field_name='mail_list'}	% mail_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50104003') ->
    #'Proto50104003'{'mail_info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMail',is_array=0,value=F1,field_name='mail_info'}	% mail_info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50104004') ->
    #'Proto50104004'{'mail_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMail',is_array=1,value=F1,field_name='mail_list'}	% mail_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50104005') ->
    #'Proto50104005'{'mail_id_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F1,field_name='mail_id_list'}	% mail_id_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80104001') ->
    #'Proto80104001'{'mail_id_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F1,field_name='mail_id_list'}	% mail_id_list
    ].
fetch_field_map('Proto10104003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='mail_id'}	% mail_id
    };
fetch_field_map('Proto10104004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='mail_id'}	% mail_id
    };
fetch_field_map('Proto10104005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='mail_id_list'}	% mail_id_list
    };
fetch_field_map('Proto50104002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMail',is_array=1,field_name='mail_list'}	% mail_list
    };
fetch_field_map('Proto50104003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMail',is_array=0,field_name='mail_info'}	% mail_info
    };
fetch_field_map('Proto50104004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMail',is_array=1,field_name='mail_list'}	% mail_list
    };
fetch_field_map('Proto50104005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='mail_id_list'}	% mail_id_list
    };
fetch_field_map('Proto80104001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='mail_id_list'}	% mail_id_list
    }.
field_map_to_msg('Proto10104003', FieldMap) ->
    #'Proto10104003'{
        'mail_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10104004', FieldMap) ->
    #'Proto10104004'{
        'mail_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10104005', FieldMap) ->
    #'Proto10104005'{
        'mail_id_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50104002', FieldMap) ->
    #'Proto50104002'{
        'mail_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50104003', FieldMap) ->
    #'Proto50104003'{
        'mail_info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50104004', FieldMap) ->
    #'Proto50104004'{
        'mail_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50104005', FieldMap) ->
    #'Proto50104005'{
        'mail_id_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80104001', FieldMap) ->
    #'Proto80104001'{
        'mail_id_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
