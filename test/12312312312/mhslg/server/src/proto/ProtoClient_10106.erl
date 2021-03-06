%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10106').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10106.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10106003') ->
    #'Proto10106003'{'name'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='name'}	% name
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10106004') ->
    #'Proto10106004'{'type'=F1,'league_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'},	% type
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F2,field_name='league_id'}	% league_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10106005') ->
    #'Proto10106005'{'type'=F1,'player_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='type'},	% type
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F2,field_name='player_id'}	% player_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10106007') ->
    #'Proto10106007'{'member_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='member_id'}	% member_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10106011') ->
    #'Proto10106011'{'member_id'=F1,'position'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='member_id'},	% member_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='position'}	% position
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10106012') ->
    #'Proto10106012'{'member_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='member_id'}	% member_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10106013') ->
    #'Proto10106013'{'notice'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='notice'}	% notice
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50106001') ->
    #'Proto50106001'{'league_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeague',is_array=1,value=F1,field_name='league_list'}	% league_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50106002') ->
    #'Proto50106002'{'league'=F1,'notice'=F2,'leader_show'=F3,'self_position'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeague',is_array=0,value=F1,field_name='league'},	% league
        #proto_field{field_tag=2,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F2,field_name='notice'},	% notice
        #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoShowRole',is_array=0,value=F3,field_name='leader_show'},	% leader_show
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='self_position'}	% self_position
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50106010') ->
    #'Proto50106010'{'member_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeagueMember',is_array=1,value=F1,field_name='member_list'}	% member_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50106014') ->
    #'Proto50106014'{'apply_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeagueMember',is_array=1,value=F1,field_name='apply_list'}	% apply_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50106015') ->
    #'Proto50106015'{'log_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeagueLog',is_array=1,value=F1,field_name='log_list'}	% log_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80106009') ->
    #'Proto80106009'{'league_id'=F1,'league_name'=F2,'league_level'=F3,'league_position'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='league_id'},	% league_id
        #proto_field{field_tag=2,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F2,field_name='league_name'},	% league_name
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='league_level'},	% league_level
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='league_position'}	% league_position
    ].
fetch_field_map('Proto10106003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='name'}	% name
    };
fetch_field_map('Proto10106004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='league_id'}	% league_id
    };
fetch_field_map('Proto10106005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='type'},	% type
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='player_id'}	% player_id
    };
fetch_field_map('Proto10106007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='member_id'}	% member_id
    };
fetch_field_map('Proto10106011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='member_id'},	% member_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='position'}	% position
    };
fetch_field_map('Proto10106012') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='member_id'}	% member_id
    };
fetch_field_map('Proto10106013') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='notice'}	% notice
    };
fetch_field_map('Proto50106001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeague',is_array=1,field_name='league_list'}	% league_list
    };
fetch_field_map('Proto50106002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeague',is_array=0,field_name='league'},	% league
        2 => #proto_field{field_tag=2,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='notice'},	% notice
        3 => #proto_field{field_tag=3,wire_type=2,data_type=16,data_type_name='ProtoShowRole',is_array=0,field_name='leader_show'},	% leader_show
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='self_position'}	% self_position
    };
fetch_field_map('Proto50106010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeagueMember',is_array=1,field_name='member_list'}	% member_list
    };
fetch_field_map('Proto50106014') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeagueMember',is_array=1,field_name='apply_list'}	% apply_list
    };
fetch_field_map('Proto50106015') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoLeagueLog',is_array=1,field_name='log_list'}	% log_list
    };
fetch_field_map('Proto80106009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='league_id'},	% league_id
        2 => #proto_field{field_tag=2,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='league_name'},	% league_name
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='league_level'},	% league_level
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='league_position'}	% league_position
    }.
field_map_to_msg('Proto10106003', FieldMap) ->
    #'Proto10106003'{
        'name' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10106004', FieldMap) ->
    #'Proto10106004'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'league_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10106005', FieldMap) ->
    #'Proto10106005'{
        'type' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'player_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10106007', FieldMap) ->
    #'Proto10106007'{
        'member_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10106011', FieldMap) ->
    #'Proto10106011'{
        'member_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'position' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10106012', FieldMap) ->
    #'Proto10106012'{
        'member_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10106013', FieldMap) ->
    #'Proto10106013'{
        'notice' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50106001', FieldMap) ->
    #'Proto50106001'{
        'league_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50106002', FieldMap) ->
    #'Proto50106002'{
        'league' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'notice' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'leader_show' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'self_position' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto50106010', FieldMap) ->
    #'Proto50106010'{
        'member_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50106014', FieldMap) ->
    #'Proto50106014'{
        'apply_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50106015', FieldMap) ->
    #'Proto50106015'{
        'log_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80106009', FieldMap) ->
    #'Proto80106009'{
        'league_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'league_name' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'league_level' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'league_position' = gb_unserialize:get_value(maps:get(4,FieldMap))
    }.
