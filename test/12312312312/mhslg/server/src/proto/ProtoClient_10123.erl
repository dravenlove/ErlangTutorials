%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10123').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10123.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10123003') ->
    #'Proto10123003'{'building_id'=F1,'use'=F2,'num'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'},	% building_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='use'},	% use
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='num'}	% num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123004') ->
    #'Proto10123004'{'building_id'=F1,'use'=F2,'item_id'=F3,'num'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'},	% building_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='use'},	% use
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='item_id'},	% item_id
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='num'}	% num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123005') ->
    #'Proto10123005'{'class_id_big'=F1,'class_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='class_id_big'},	% class_id_big
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='class_id'}	% class_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123007') ->
    #'Proto10123007'{'building_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'}	% building_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123008') ->
    #'Proto10123008'{'building_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'}	% building_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123009') ->
    #'Proto10123009'{'building_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='building_id'}	% building_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123010') ->
    #'Proto10123010'{'skip'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='skip'}	% skip
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123011') ->
    #'Proto10123011'{'mutual'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=0,value=F1,field_name='mutual'}	% mutual
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123012') ->
    #'Proto10123012'{'mutual'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=0,value=F1,field_name='mutual'}	% mutual
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123013') ->
    #'Proto10123013'{'mutual'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=0,value=F1,field_name='mutual'}	% mutual
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10123014') ->
    #'Proto10123014'{'do_it'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='do_it'}	% do_it
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123001') ->
    #'Proto50123001'{'building_list'=F1,'workers_num'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=1,value=F1,field_name='building_list'},	% building_list
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='workers_num'}	% workers_num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123003') ->
    #'Proto50123003'{'building'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,value=F1,field_name='building'}	% building
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123004') ->
    #'Proto50123004'{'building'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,value=F1,field_name='building'}	% building
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123007') ->
    #'Proto50123007'{'building'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,value=F1,field_name='building'}	% building
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123008') ->
    #'Proto50123008'{'info'=F1,'workers_num'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,value=F1,field_name='info'},	% info
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='workers_num'}	% workers_num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123009') ->
    #'Proto50123009'{'mutual_list'=F1,'building'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'},	% mutual_list
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,value=F2,field_name='building'}	% building
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123010') ->
    #'Proto50123010'{'mutual_list'=F1,'my_mutual_list'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'},	% mutual_list
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F2,field_name='my_mutual_list'}	% my_mutual_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123011') ->
    #'Proto50123011'{'mutual_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'}	% mutual_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123012') ->
    #'Proto50123012'{'mutual_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'}	% mutual_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123013') ->
    #'Proto50123013'{'mutual_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'}	% mutual_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50123014') ->
    #'Proto50123014'{'mutual_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'}	% mutual_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80123002') ->
    #'Proto80123002'{'building_list'=F1,'workers_num'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=1,value=F1,field_name='building_list'},	% building_list
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='workers_num'}	% workers_num
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80123006') ->
    #'Proto80123006'{'building_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=1,value=F1,field_name='building_list'}	% building_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80123009') ->
    #'Proto80123009'{'mutual_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,value=F1,field_name='mutual_list'}	% mutual_list
    ].
fetch_field_map('Proto10123003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='use'},	% use
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'}	% num
    };
fetch_field_map('Proto10123004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'},	% building_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='use'},	% use
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='item_id'},	% item_id
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='num'}	% num
    };
fetch_field_map('Proto10123005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='class_id_big'},	% class_id_big
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='class_id'}	% class_id
    };
fetch_field_map('Proto10123007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'}	% building_id
    };
fetch_field_map('Proto10123008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'}	% building_id
    };
fetch_field_map('Proto10123009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='building_id'}	% building_id
    };
fetch_field_map('Proto10123010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='skip'}	% skip
    };
fetch_field_map('Proto10123011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=0,field_name='mutual'}	% mutual
    };
fetch_field_map('Proto10123012') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=0,field_name='mutual'}	% mutual
    };
fetch_field_map('Proto10123013') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=0,field_name='mutual'}	% mutual
    };
fetch_field_map('Proto10123014') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='do_it'}	% do_it
    };
fetch_field_map('Proto50123001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=1,field_name='building_list'},	% building_list
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='workers_num'}	% workers_num
    };
fetch_field_map('Proto50123003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,field_name='building'}	% building
    };
fetch_field_map('Proto50123004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,field_name='building'}	% building
    };
fetch_field_map('Proto50123007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,field_name='building'}	% building
    };
fetch_field_map('Proto50123008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,field_name='info'},	% info
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='workers_num'}	% workers_num
    };
fetch_field_map('Proto50123009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'},	% mutual_list
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=0,field_name='building'}	% building
    };
fetch_field_map('Proto50123010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'},	% mutual_list
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='my_mutual_list'}	% my_mutual_list
    };
fetch_field_map('Proto50123011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'}	% mutual_list
    };
fetch_field_map('Proto50123012') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'}	% mutual_list
    };
fetch_field_map('Proto50123013') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'}	% mutual_list
    };
fetch_field_map('Proto50123014') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'}	% mutual_list
    };
fetch_field_map('Proto80123002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=1,field_name='building_list'},	% building_list
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='workers_num'}	% workers_num
    };
fetch_field_map('Proto80123006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoBuilding',is_array=1,field_name='building_list'}	% building_list
    };
fetch_field_map('Proto80123009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoMutual',is_array=1,field_name='mutual_list'}	% mutual_list
    }.
field_map_to_msg('Proto10123003', FieldMap) ->
    #'Proto10123003'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'use' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto10123004', FieldMap) ->
    #'Proto10123004'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'use' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'item_id' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'num' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto10123005', FieldMap) ->
    #'Proto10123005'{
        'class_id_big' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'class_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10123007', FieldMap) ->
    #'Proto10123007'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123008', FieldMap) ->
    #'Proto10123008'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123009', FieldMap) ->
    #'Proto10123009'{
        'building_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123010', FieldMap) ->
    #'Proto10123010'{
        'skip' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123011', FieldMap) ->
    #'Proto10123011'{
        'mutual' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123012', FieldMap) ->
    #'Proto10123012'{
        'mutual' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123013', FieldMap) ->
    #'Proto10123013'{
        'mutual' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10123014', FieldMap) ->
    #'Proto10123014'{
        'do_it' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123001', FieldMap) ->
    #'Proto50123001'{
        'building_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'workers_num' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50123003', FieldMap) ->
    #'Proto50123003'{
        'building' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123004', FieldMap) ->
    #'Proto50123004'{
        'building' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123007', FieldMap) ->
    #'Proto50123007'{
        'building' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123008', FieldMap) ->
    #'Proto50123008'{
        'info' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'workers_num' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50123009', FieldMap) ->
    #'Proto50123009'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'building' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50123010', FieldMap) ->
    #'Proto50123010'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'my_mutual_list' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50123011', FieldMap) ->
    #'Proto50123011'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123012', FieldMap) ->
    #'Proto50123012'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123013', FieldMap) ->
    #'Proto50123013'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50123014', FieldMap) ->
    #'Proto50123014'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80123002', FieldMap) ->
    #'Proto80123002'{
        'building_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'workers_num' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto80123006', FieldMap) ->
    #'Proto80123006'{
        'building_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80123009', FieldMap) ->
    #'Proto80123009'{
        'mutual_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
