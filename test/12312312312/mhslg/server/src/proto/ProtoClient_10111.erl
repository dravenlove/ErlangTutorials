%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10111').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10111.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10111002') ->
    #'Proto10111002'{'player_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='player_id'}	% player_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10111003') ->
    #'Proto10111003'{'name'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='name'}	% name
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10111004') ->
    #'Proto10111004'{'player_id'=F1,'hero_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F1,field_name='player_id'},	% player_id
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10111999') ->
    #'Proto10111999'{'cmd_name'=F1,'param1'=F2,'param2'=F3,'param3'=F4,'param4'=F5}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='cmd_name'},	% cmd_name
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F2,field_name='param1'},	% param1
        #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F3,field_name='param2'},	% param2
        #proto_field{field_tag=4,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F4,field_name='param3'},	% param3
        #proto_field{field_tag=5,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F5,field_name='param4'}	% param4
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50111002') ->
    #'Proto50111002'{'show'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoRoleShowInfo',is_array=0,value=F1,field_name='show'}	% show
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50111003') ->
    #'Proto50111003'{'name'=F1,'value'=F2,'cool_time'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='name'},	% name
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='value'},	% value
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='cool_time'}	% cool_time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50111004') ->
    #'Proto50111004'{'hero_base'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoHeroBase',is_array=0,value=F1,field_name='hero_base'}	% hero_base
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80111001') ->
    #'Proto80111001'{'prop_list'=F1,'force'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoProp',is_array=1,value=F1,field_name='prop_list'},	% prop_list
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F2,field_name='force'}	% force
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80111999') ->
    #'Proto80111999'{'str'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,value=F1,field_name='str'}	% str
    ].
fetch_field_map('Proto10111002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='player_id'}	% player_id
    };
fetch_field_map('Proto10111003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='name'}	% name
    };
fetch_field_map('Proto10111004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='player_id'},	% player_id
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto10111999') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='cmd_name'},	% cmd_name
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param1'},	% param1
        3 => #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param2'},	% param2
        4 => #proto_field{field_tag=4,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param3'},	% param3
        5 => #proto_field{field_tag=5,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='param4'}	% param4
    };
fetch_field_map('Proto50111002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoRoleShowInfo',is_array=0,field_name='show'}	% show
    };
fetch_field_map('Proto50111003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='name'},	% name
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='value'},	% value
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='cool_time'}	% cool_time
    };
fetch_field_map('Proto50111004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoHeroBase',is_array=0,field_name='hero_base'}	% hero_base
    };
fetch_field_map('Proto80111001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoProp',is_array=1,field_name='prop_list'},	% prop_list
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='force'}	% force
    };
fetch_field_map('Proto80111999') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=7,data_type_name='undefined',is_array=0,field_name='str'}	% str
    }.
field_map_to_msg('Proto10111002', FieldMap) ->
    #'Proto10111002'{
        'player_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10111003', FieldMap) ->
    #'Proto10111003'{
        'name' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10111004', FieldMap) ->
    #'Proto10111004'{
        'player_id' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'hero_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10111999', FieldMap) ->
    #'Proto10111999'{
        'cmd_name' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'param1' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'param2' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'param3' = gb_unserialize:get_value(maps:get(4,FieldMap)),
        'param4' = gb_unserialize:get_value(maps:get(5,FieldMap))
    };
field_map_to_msg('Proto50111002', FieldMap) ->
    #'Proto50111002'{
        'show' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50111003', FieldMap) ->
    #'Proto50111003'{
        'name' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'value' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'cool_time' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50111004', FieldMap) ->
    #'Proto50111004'{
        'hero_base' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80111001', FieldMap) ->
    #'Proto80111001'{
        'prop_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'force' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto80111999', FieldMap) ->
    #'Proto80111999'{
        'str' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
