%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10102').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10102.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10102001') ->
    #'Proto10102001'{'type'=F1,'hero_list'=F2,'parameter1'=F3,'parameter2'=F4,'parameter3'=F5,'parameter4'=F6,'parameter_list'=F7,'parameter_string'=F8}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'},	% type
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F2,field_name='hero_list'},	% hero_list
        #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F3,field_name='parameter1'},	% parameter1
        #proto_field{field_tag=4,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F4,field_name='parameter2'},	% parameter2
        #proto_field{field_tag=5,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F5,field_name='parameter3'},	% parameter3
        #proto_field{field_tag=6,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F6,field_name='parameter4'},	% parameter4
        #proto_field{field_tag=7,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F7,field_name='parameter_list'},	% parameter_list
        #proto_field{field_tag=8,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F8,field_name='parameter_string'}	% parameter_string
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10102006') ->
    #'Proto10102006'{'combat_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='combat_id'}	% combat_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10102008') ->
    #'Proto10102008'{'combat_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='combat_id'}	% combat_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10102009') ->
    #'Proto10102009'{'combat_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='combat_id'}	% combat_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10102010') ->
    #'Proto10102010'{'record_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='record_id'}	% record_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50102006') ->
    #'Proto50102006'{'rank_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightRank',is_array=1,value=F1,field_name='rank_list'}	% rank_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50102011') ->
    #'Proto50102011'{'info'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoRecordID',is_array=1,value=F1,field_name='info'}	% info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80102002') ->
    #'Proto80102002'{'combat_id'=F1,'type'=F2,'country'=F3,'l_country'=F4,'r_country'=F5,'fight_process'=F6,'count_down'=F7,'drop_map'=F8}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='combat_id'},	% combat_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='type'},	% type
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='country'},	% country
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='l_country'},	% l_country
        #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F5,field_name='r_country'},	% r_country
        #proto_field{field_tag=6,wire_type=2,data_type=16,data_type_name='ProtoFightDetail',is_array=1,value=F6,field_name='fight_process'},	% fight_process
        #proto_field{field_tag=7,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F7,field_name='count_down'},	% count_down
        #proto_field{field_tag=8,wire_type=2,data_type=16,data_type_name='ProtoFightDrop',is_array=1,value=F8,field_name='drop_map'}	% drop_map
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80102003') ->
    #'Proto80102003'{'combat_id'=F1,'join_type'=F2,'fight_hero'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='combat_id'},	% combat_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='join_type'},	% join_type
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoFightHero',is_array=0,value=F3,field_name='fight_hero'}	% fight_hero
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80102004') ->
    #'Proto80102004'{'combat_id'=F1,'quit_type'=F2,'id'=F3,'hero_id'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='combat_id'},	% combat_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='quit_type'},	% quit_type
        #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F3,field_name='id'},	% id
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80102005') ->
    #'Proto80102005'{'l_highest'=F1,'r_highest'=F2,'self'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightHighest',is_array=0,value=F1,field_name='l_highest'},	% l_highest
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoFightHighest',is_array=0,value=F2,field_name='r_highest'},	% r_highest
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoFightSelf',is_array=1,value=F3,field_name='self'}	% self
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80102007') ->
    #'Proto80102007'{'win_type'=F1,'result'=F2,'reward'=F3,'type'=F4,'param1'=F5,'param2'=F6,'param3'=F7,'param4'=F8}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='win_type'},	% win_type
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoFightResult',is_array=1,value=F2,field_name='result'},	% result
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoItemObj',is_array=1,value=F3,field_name='reward'},	% reward
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='type'},	% type
        #proto_field{field_tag=5,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F5,field_name='param1'},	% param1
        #proto_field{field_tag=6,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F6,field_name='param2'},	% param2
        #proto_field{field_tag=7,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F7,field_name='param3'},	% param3
        #proto_field{field_tag=8,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F8,field_name='param4'}	% param4
    ].
fetch_field_map('Proto10102001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='hero_list'},	% hero_list
        3 => #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='parameter1'},	% parameter1
        4 => #proto_field{field_tag=4,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='parameter2'},	% parameter2
        5 => #proto_field{field_tag=5,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='parameter3'},	% parameter3
        6 => #proto_field{field_tag=6,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='parameter4'},	% parameter4
        7 => #proto_field{field_tag=7,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='parameter_list'},	% parameter_list
        8 => #proto_field{field_tag=8,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='parameter_string'}	% parameter_string
    };
fetch_field_map('Proto10102006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'}	% combat_id
    };
fetch_field_map('Proto10102008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'}	% combat_id
    };
fetch_field_map('Proto10102009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'}	% combat_id
    };
fetch_field_map('Proto10102010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='record_id'}	% record_id
    };
fetch_field_map('Proto50102006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightRank',is_array=1,field_name='rank_list'}	% rank_list
    };
fetch_field_map('Proto50102011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoRecordID',is_array=1,field_name='info'}	% info
    };
fetch_field_map('Proto80102002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'},	% combat_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='country'},	% country
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='l_country'},	% l_country
        5 => #proto_field{field_tag=5,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='r_country'},	% r_country
        6 => #proto_field{field_tag=6,wire_type=2,data_type=16,data_type_name='ProtoFightDetail',is_array=1,field_name='fight_process'},	% fight_process
        7 => #proto_field{field_tag=7,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='count_down'},	% count_down
        8 => #proto_field{field_tag=8,wire_type=2,data_type=16,data_type_name='ProtoFightDrop',is_array=1,field_name='drop_map'}	% drop_map
    };
fetch_field_map('Proto80102003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'},	% combat_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='join_type'},	% join_type
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoFightHero',is_array=0,field_name='fight_hero'}	% fight_hero
    };
fetch_field_map('Proto80102004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='combat_id'},	% combat_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='quit_type'},	% quit_type
        3 => #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='id'},	% id
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto80102005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoFightHighest',is_array=0,field_name='l_highest'},	% l_highest
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoFightHighest',is_array=0,field_name='r_highest'},	% r_highest
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoFightSelf',is_array=1,field_name='self'}	% self
    };
fetch_field_map('Proto80102007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='win_type'},	% win_type
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoFightResult',is_array=1,field_name='result'},	% result
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoItemObj',is_array=1,field_name='reward'},	% reward
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        5 => #proto_field{field_tag=5,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param1'},	% param1
        6 => #proto_field{field_tag=6,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param2'},	% param2
        7 => #proto_field{field_tag=7,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param3'},	% param3
        8 => #proto_field{field_tag=8,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param4'}	% param4
    }.
field_map_to_msg('Proto10102001', FieldMap) ->
    #'Proto10102001'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'hero_list' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'parameter1' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'parameter2' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'parameter3' = gb_unserialize:get_value(maps:get(5,FieldMap)),
        'parameter4' = gb_unserialize:get_value(maps:get(6,FieldMap)),
        'parameter_list' = gb_unserialize:get_value(maps:get(7,FieldMap)),
        'parameter_string' = gb_unserialize:get_value(maps:get(8,FieldMap))
    };
field_map_to_msg('Proto10102006', FieldMap) ->
    #'Proto10102006'{
        'combat_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10102008', FieldMap) ->
    #'Proto10102008'{
        'combat_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10102009', FieldMap) ->
    #'Proto10102009'{
        'combat_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10102010', FieldMap) ->
    #'Proto10102010'{
        'record_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50102006', FieldMap) ->
    #'Proto50102006'{
        'rank_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50102011', FieldMap) ->
    #'Proto50102011'{
        'info' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80102002', FieldMap) ->
    #'Proto80102002'{
        'combat_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'country' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'l_country' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'r_country' = gb_unserialize:get_value(maps:get(5,FieldMap)),
        'fight_process' = gb_unserialize:get_value(maps:get(6,FieldMap)),
        'count_down' = gb_unserialize:get_value(maps:get(7,FieldMap)),
        'drop_map' = gb_unserialize:get_value(maps:get(8,FieldMap))
    };
field_map_to_msg('Proto80102003', FieldMap) ->
    #'Proto80102003'{
        'combat_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'join_type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'fight_hero' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto80102004', FieldMap) ->
    #'Proto80102004'{
        'combat_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'quit_type' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'id' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'hero_id' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto80102005', FieldMap) ->
    #'Proto80102005'{
        'l_highest' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'r_highest' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'self' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto80102007', FieldMap) ->
    #'Proto80102007'{
        'win_type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'result' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'reward' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'type' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'param1' = gb_unserialize:get_value(maps:get(5,FieldMap)),
        'param2' = gb_unserialize:get_value(maps:get(6,FieldMap)),
        'param3' = gb_unserialize:get_value(maps:get(7,FieldMap)),
        'param4' = gb_unserialize:get_value(maps:get(8,FieldMap))
    }.
