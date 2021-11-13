%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10127').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10127.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10127001') ->
    #'Proto10127001'{'building_id'=F1,'type'=F2,'num'=F3,'training_type'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'},	% building_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='type'},	% type
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='num'},	% num
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='training_type'}	% training_type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10127002') ->
    #'Proto10127002'{'building_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'}	% building_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10127003') ->
    #'Proto10127003'{'building_id'=F1,'item_type'=F2,'item_id'=F3,'num'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'},	% building_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='item_type'},	% item_type
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='item_id'},	% item_id
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='num'}	% num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10127004') ->
    #'Proto10127004'{'type'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'}	% type
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10127007') ->
    #'Proto10127007'{'barrack_id'=F1,'num'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='barrack_id'},	% barrack_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='num'}	% num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50127001') ->
    #'Proto50127001'{'time'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='time'}	% time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50127002') ->
    #'Proto50127002'{'storage_num'=F1,'train_type'=F2,'train_num'=F3,'time'=F4,'total_time'=F5}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='storage_num'},	% storage_num
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='train_type'},	% train_type
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='train_num'},	% train_num
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='time'},	% time
        #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F5,field_name='total_time'}	% total_time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50127003') ->
    #'Proto50127003'{'time'=F1,'total_time'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='time'},	% time
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='total_time'}	% total_time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80127005') ->
    #'Proto80127005'{'building_id'=F1,'train_type'=F2,'time'=F3,'train_ok_num'=F4,'store_type'=F5,'store_num'=F6}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'},	% building_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='train_type'},	% train_type
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='time'},	% time
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='train_ok_num'},	% train_ok_num
        #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F5,field_name='store_type'},	% store_type
        #proto_field{field_tag=6,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F6,field_name='store_num'}	% store_num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80127006') ->
    #'Proto80127006'{'type'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'}	% type
    ].
fetch_field_map('Proto10127001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'},	% num
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='training_type'}	% training_type
    };
fetch_field_map('Proto10127002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'}	% building_id
    };
fetch_field_map('Proto10127003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='item_type'},	% item_type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='item_id'},	% item_id
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'}	% num
    };
fetch_field_map('Proto10127004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'}	% type
    };
fetch_field_map('Proto10127007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='barrack_id'},	% barrack_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'}	% num
    };
fetch_field_map('Proto50127001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='time'}	% time
    };
fetch_field_map('Proto50127002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='storage_num'},	% storage_num
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='train_type'},	% train_type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='train_num'},	% train_num
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='time'},	% time
        5 => #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='total_time'}	% total_time
    };
fetch_field_map('Proto50127003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='time'},	% time
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='total_time'}	% total_time
    };
fetch_field_map('Proto80127005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='train_type'},	% train_type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='time'},	% time
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='train_ok_num'},	% train_ok_num
        5 => #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='store_type'},	% store_type
        6 => #proto_field{field_tag=6,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='store_num'}	% store_num
    };
fetch_field_map('Proto80127006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'}	% type
    }.
field_map_to_msg('Proto10127001', FieldMap) ->
    #'Proto10127001'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'training_type' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto10127002', FieldMap) ->
    #'Proto10127002'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10127003', FieldMap) ->
    #'Proto10127003'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'item_type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'item_id' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto10127004', FieldMap) ->
    #'Proto10127004'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10127007', FieldMap) ->
    #'Proto10127007'{
        'barrack_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50127001', FieldMap) ->
    #'Proto50127001'{
        'time' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50127002', FieldMap) ->
    #'Proto50127002'{
        'storage_num' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'train_type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'train_num' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'time' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'total_time' = gb_unserialize:get_value(maps:get(5,FieldMap))
    };
field_map_to_msg('Proto50127003', FieldMap) ->
    #'Proto50127003'{
        'time' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'total_time' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto80127005', FieldMap) ->
    #'Proto80127005'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'train_type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'time' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'train_ok_num' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'store_type' = gb_unserialize:get_value(maps:get(5,FieldMap)),
        'store_num' = gb_unserialize:get_value(maps:get(6,FieldMap))
    };
field_map_to_msg('Proto80127006', FieldMap) ->
    #'Proto80127006'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.