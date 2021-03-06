%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10107').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10107.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10107001') ->
    #'Proto10107001'{'type'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'}	% type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10107002') ->
    #'Proto10107002'{'friend_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='friend_id'}	% friend_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10107003') ->
    #'Proto10107003'{'type'=F1,'apply_list'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'},	% type
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F2,field_name='apply_list'}	% apply_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10107004') ->
    #'Proto10107004'{'id_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F1,field_name='id_list'}	% id_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10107005') ->
    #'Proto10107005'{'id_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F1,field_name='id_list'}	% id_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10107006') ->
    #'Proto10107006'{'id_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,value=F1,field_name='id_list'}	% id_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10107007') ->
    #'Proto10107007'{'name'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='name'}	% name
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50107001') ->
    #'Proto50107001'{'type'=F1,'friend_list'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'},	% type
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoFriend',is_array=1,value=F2,field_name='friend_list'}	% friend_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50107007') ->
    #'Proto50107007'{'friend'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFriend',is_array=0,value=F1,field_name='friend'}	% friend
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80107008') ->
    #'Proto80107008'{'player_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='player_id'}	% player_id
    ].
fetch_field_map('Proto10107001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'}	% type
    };
fetch_field_map('Proto10107002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='friend_id'}	% friend_id
    };
fetch_field_map('Proto10107003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='apply_list'}	% apply_list
    };
fetch_field_map('Proto10107004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='id_list'}	% id_list
    };
fetch_field_map('Proto10107005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='id_list'}	% id_list
    };
fetch_field_map('Proto10107006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=1,field_name='id_list'}	% id_list
    };
fetch_field_map('Proto10107007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='name'}	% name
    };
fetch_field_map('Proto50107001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoFriend',is_array=1,field_name='friend_list'}	% friend_list
    };
fetch_field_map('Proto50107007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFriend',is_array=0,field_name='friend'}	% friend
    };
fetch_field_map('Proto80107008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='player_id'}	% player_id
    }.
field_map_to_msg('Proto10107001', FieldMap) ->
    #'Proto10107001'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10107002', FieldMap) ->
    #'Proto10107002'{
        'friend_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10107003', FieldMap) ->
    #'Proto10107003'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'apply_list' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10107004', FieldMap) ->
    #'Proto10107004'{
        'id_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10107005', FieldMap) ->
    #'Proto10107005'{
        'id_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10107006', FieldMap) ->
    #'Proto10107006'{
        'id_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10107007', FieldMap) ->
    #'Proto10107007'{
        'name' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50107001', FieldMap) ->
    #'Proto50107001'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'friend_list' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50107007', FieldMap) ->
    #'Proto50107007'{
        'friend' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80107008', FieldMap) ->
    #'Proto80107008'{
        'player_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
