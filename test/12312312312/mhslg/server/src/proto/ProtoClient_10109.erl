%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10109').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10109.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10109001') ->
    #'Proto10109001'{'rank_type'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='rank_type'}	% rank_type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10109002') ->
    #'Proto10109002'{'country'=F1,'rank_type'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='country'},	% country
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='rank_type'}	% rank_type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50109001') ->
    #'Proto50109001'{'rank_type'=F1,'rank_list'=F2,'self_rank'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='rank_type'},	% rank_type
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoRank',is_array=1,value=F2,field_name='rank_list'},	% rank_list
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoRank',is_array=0,value=F3,field_name='self_rank'}	% self_rank
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50109002') ->
    #'Proto50109002'{'rank_list'=F1,'self_rank'=F2,'country'=F3,'rank_type'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoRanker',is_array=1,value=F1,field_name='rank_list'},	% rank_list
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoRanker',is_array=0,value=F2,field_name='self_rank'},	% self_rank
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='country'},	% country
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='rank_type'}	% rank_type
    ].
fetch_field_map('Proto10109001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='rank_type'}	% rank_type
    };
fetch_field_map('Proto10109002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='country'},	% country
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='rank_type'}	% rank_type
    };
fetch_field_map('Proto50109001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='rank_type'},	% rank_type
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoRank',is_array=1,field_name='rank_list'},	% rank_list
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoRank',is_array=0,field_name='self_rank'}	% self_rank
    };
fetch_field_map('Proto50109002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoRanker',is_array=1,field_name='rank_list'},	% rank_list
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoRanker',is_array=0,field_name='self_rank'},	% self_rank
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='country'},	% country
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='rank_type'}	% rank_type
    }.
field_map_to_msg('Proto10109001', FieldMap) ->
    #'Proto10109001'{
        'rank_type' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10109002', FieldMap) ->
    #'Proto10109002'{
        'country' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'rank_type' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50109001', FieldMap) ->
    #'Proto50109001'{
        'rank_type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'rank_list' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'self_rank' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50109002', FieldMap) ->
    #'Proto50109002'{
        'rank_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'self_rank' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'country' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'rank_type' = gb_unserialize:get_value(maps:get(4,FieldMap))
    }.