%% -*- coding: utf-8 -*-
%% @private
%% Automatically generated, do not edit
%% Generated by gb_compile version 1.0.0
-module('ProtoClient_10152').
-export([encode_msg/1,encode_msg/2]).
-export([decode_msg/2]).
-include("ProtoClient_10152.hrl").
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
convert_field_list(Msg) when is_record(Msg, 'Proto10152004') ->
    #'Proto10152004'{'request_autumn'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='request_autumn'}	% request_autumn
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152010') ->
    #'Proto50152010'{'campfire_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,value=F1,field_name='campfire_list'}	% campfire_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152015') ->
    #'Proto10152015'{'is_right'=F1,'answer_time'=F2,'answer'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=8,data_type_name='undefined',is_array=0,value=F1,field_name='is_right'},	% is_right
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='answer_time'},	% answer_time
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='answer'}	% answer
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152014') ->
    #'Proto10152014'{'final'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='final'}	% final
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152004') ->
    #'Proto50152004'{'final_award'=F1,'mission_info'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,value=F1,field_name='final_award'},	% final_award
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,value=F2,field_name='mission_info'}	% mission_info
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80152006') ->
    #'Proto80152006'{'spring_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,value=F1,field_name='spring_mission_list'}	% spring_mission_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152013') ->
    #'Proto10152013'{'autumn_mission'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=0,value=F1,field_name='autumn_mission'}	% autumn_mission
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80152005') ->
    #'Proto80152005'{'question'=F1,'rank'=F2,'status'=F3,'remain_time'=F4}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTopic',is_array=0,value=F1,field_name='question'},	% question
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoWinterRank',is_array=0,value=F2,field_name='rank'},	% rank
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='status'},	% status
        #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F4,field_name='remain_time'}	% remain_time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152001') ->
    #'Proto10152001'{'request_season'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='request_season'}	% request_season
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152015') ->
    #'Proto50152015'{'rank'=F1,'remain_time'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoWinterRank',is_array=0,value=F1,field_name='rank'},	% rank
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='remain_time'}	% remain_time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152013') ->
    #'Proto50152013'{'autumn_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,value=F1,field_name='autumn_mission_list'}	% autumn_mission_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152010') ->
    #'Proto10152010'{'campfire'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=0,value=F1,field_name='campfire'}	% campfire
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152001') ->
    #'Proto50152001'{'season'=F1,'start_time'=F2,'end_time'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='season'},	% season
        #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F2,field_name='start_time'},	% start_time
        #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,value=F3,field_name='end_time'}	% end_time
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152012') ->
    #'Proto10152012'{'hero_id'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='hero_id'}	% hero_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152011') ->
    #'Proto50152011'{'autumn_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,value=F1,field_name='autumn_mission_list'}	% autumn_mission_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152008') ->
    #'Proto50152008'{'spring_mission'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,value=F1,field_name='spring_mission'}	% spring_mission
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152007') ->
    #'Proto50152007'{'spring_mission'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,value=F1,field_name='spring_mission'}	% spring_mission
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152016') ->
    #'Proto10152016'{'request_rank_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='request_rank_list'}	% request_rank_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152002') ->
    #'Proto50152002'{'final_award'=F1,'mission'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='final_award'},	% final_award
        #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,value=F2,field_name='mission'}	% mission
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152016') ->
    #'Proto50152016'{'final_rank_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoWinterFinalRank',is_array=1,value=F1,field_name='final_rank_list'}	% final_rank_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152006') ->
    #'Proto50152006'{'spring_mission'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,value=F1,field_name='spring_mission'}	% spring_mission
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152008') ->
    #'Proto10152008'{'ok'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='ok'}	% ok
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152014') ->
    #'Proto50152014'{'autumn_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,value=F1,field_name='autumn_mission_list'}	% autumn_mission_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152005') ->
    #'Proto10152005'{'request_winter'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='request_winter'}	% request_winter
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152003') ->
    #'Proto50152003'{'campfire_info'=F1,'firecracker_remain_times'=F2,'firework_remain_times'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,value=F1,field_name='campfire_info'},	% campfire_info
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='firecracker_remain_times'},	% firecracker_remain_times
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='firework_remain_times'}	% firework_remain_times
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152012') ->
    #'Proto50152012'{'autumn_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,value=F1,field_name='autumn_mission_list'}	% autumn_mission_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80152003') ->
    #'Proto80152003'{'campfire_list'=F1,'firecracker_remain_times'=F2,'firework_remain_times'=F3}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,value=F1,field_name='campfire_list'},	% campfire_list
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='firecracker_remain_times'},	% firecracker_remain_times
        #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F3,field_name='firework_remain_times'}	% firework_remain_times
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152005') ->
    #'Proto50152005'{'question'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTopic',is_array=0,value=F1,field_name='question'}	% question
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152011') ->
    #'Proto10152011'{'troops_hero'=F1,'autumn_mission_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopsHero',is_array=0,value=F1,field_name='troops_hero'},	% troops_hero
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='autumn_mission_id'}	% autumn_mission_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152009') ->
    #'Proto10152009'{'campfire'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=0,value=F1,field_name='campfire'}	% campfire
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152006') ->
    #'Proto10152006'{'troops_hero'=F1,'spring_mission_id'=F2}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopsHero',is_array=0,value=F1,field_name='troops_hero'},	% troops_hero
        #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F2,field_name='spring_mission_id'}	% spring_mission_id
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152003') ->
    #'Proto10152003'{'request_summer'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='request_summer'}	% request_summer
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152007') ->
    #'Proto10152007'{'spring_mission'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=0,value=F1,field_name='spring_mission'}	% spring_mission
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto50152009') ->
    #'Proto50152009'{'campfire_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,value=F1,field_name='campfire_list'}	% campfire_list
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto10152002') ->
    #'Proto10152002'{'request_spring'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,value=F1,field_name='request_spring'}	% request_spring
    ];
convert_field_list(Msg) when is_record(Msg, 'Proto80152011') ->
    #'Proto80152011'{'autumn_mission_list'=F1}=Msg,
    [
        #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,value=F1,field_name='autumn_mission_list'}	% autumn_mission_list
    ].
fetch_field_map('Proto10152004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='request_autumn'}	% request_autumn
    };
fetch_field_map('Proto50152010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,field_name='campfire_list'}	% campfire_list
    };
fetch_field_map('Proto10152015') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=8,data_type_name='undefined',is_array=0,field_name='is_right'},	% is_right
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='answer_time'},	% answer_time
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='answer'}	% answer
    };
fetch_field_map('Proto10152014') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='final'}	% final
    };
fetch_field_map('Proto50152004') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=1,field_name='final_award'},	% final_award
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,field_name='mission_info'}	% mission_info
    };
fetch_field_map('Proto80152006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,field_name='spring_mission_list'}	% spring_mission_list
    };
fetch_field_map('Proto10152013') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=0,field_name='autumn_mission'}	% autumn_mission
    };
fetch_field_map('Proto80152005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTopic',is_array=0,field_name='question'},	% question
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoWinterRank',is_array=0,field_name='rank'},	% rank
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='status'},	% status
        4 => #proto_field{field_tag=4,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='remain_time'}	% remain_time
    };
fetch_field_map('Proto10152001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='request_season'}	% request_season
    };
fetch_field_map('Proto50152015') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoWinterRank',is_array=0,field_name='rank'},	% rank
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='remain_time'}	% remain_time
    };
fetch_field_map('Proto50152013') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,field_name='autumn_mission_list'}	% autumn_mission_list
    };
fetch_field_map('Proto10152010') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=0,field_name='campfire'}	% campfire
    };
fetch_field_map('Proto50152001') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='season'},	% season
        2 => #proto_field{field_tag=2,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='start_time'},	% start_time
        3 => #proto_field{field_tag=3,wire_type=0,data_type=2,data_type_name='undefined',is_array=0,field_name='end_time'}	% end_time
    };
fetch_field_map('Proto10152012') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='hero_id'}	% hero_id
    };
fetch_field_map('Proto50152011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,field_name='autumn_mission_list'}	% autumn_mission_list
    };
fetch_field_map('Proto50152008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,field_name='spring_mission'}	% spring_mission
    };
fetch_field_map('Proto50152007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,field_name='spring_mission'}	% spring_mission
    };
fetch_field_map('Proto10152016') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='request_rank_list'}	% request_rank_list
    };
fetch_field_map('Proto50152002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='final_award'},	% final_award
        2 => #proto_field{field_tag=2,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,field_name='mission'}	% mission
    };
fetch_field_map('Proto50152016') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoWinterFinalRank',is_array=1,field_name='final_rank_list'}	% final_rank_list
    };
fetch_field_map('Proto50152006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=1,field_name='spring_mission'}	% spring_mission
    };
fetch_field_map('Proto10152008') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='ok'}	% ok
    };
fetch_field_map('Proto50152014') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,field_name='autumn_mission_list'}	% autumn_mission_list
    };
fetch_field_map('Proto10152005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='request_winter'}	% request_winter
    };
fetch_field_map('Proto50152003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,field_name='campfire_info'},	% campfire_info
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='firecracker_remain_times'},	% firecracker_remain_times
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='firework_remain_times'}	% firework_remain_times
    };
fetch_field_map('Proto50152012') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,field_name='autumn_mission_list'}	% autumn_mission_list
    };
fetch_field_map('Proto80152003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,field_name='campfire_list'},	% campfire_list
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='firecracker_remain_times'},	% firecracker_remain_times
        3 => #proto_field{field_tag=3,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='firework_remain_times'}	% firework_remain_times
    };
fetch_field_map('Proto50152005') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTopic',is_array=0,field_name='question'}	% question
    };
fetch_field_map('Proto10152011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopsHero',is_array=0,field_name='troops_hero'},	% troops_hero
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='autumn_mission_id'}	% autumn_mission_id
    };
fetch_field_map('Proto10152009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=0,field_name='campfire'}	% campfire
    };
fetch_field_map('Proto10152006') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoTroopsHero',is_array=0,field_name='troops_hero'},	% troops_hero
        2 => #proto_field{field_tag=2,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='spring_mission_id'}	% spring_mission_id
    };
fetch_field_map('Proto10152003') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='request_summer'}	% request_summer
    };
fetch_field_map('Proto10152007') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoSpringMission',is_array=0,field_name='spring_mission'}	% spring_mission
    };
fetch_field_map('Proto50152009') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoCampfire',is_array=1,field_name='campfire_list'}	% campfire_list
    };
fetch_field_map('Proto10152002') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=0,data_type=1,data_type_name='undefined',is_array=0,field_name='request_spring'}	% request_spring
    };
fetch_field_map('Proto80152011') ->
    #{
        1 => #proto_field{field_tag=1,wire_type=2,data_type=16,data_type_name='ProtoAutumnMission',is_array=1,field_name='autumn_mission_list'}	% autumn_mission_list
    }.
field_map_to_msg('Proto10152004', FieldMap) ->
    #'Proto10152004'{
        'request_autumn' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152010', FieldMap) ->
    #'Proto50152010'{
        'campfire_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152015', FieldMap) ->
    #'Proto10152015'{
        'is_right' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'answer_time' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'answer' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto10152014', FieldMap) ->
    #'Proto10152014'{
        'final' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152004', FieldMap) ->
    #'Proto50152004'{
        'final_award' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'mission_info' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto80152006', FieldMap) ->
    #'Proto80152006'{
        'spring_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152013', FieldMap) ->
    #'Proto10152013'{
        'autumn_mission' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80152005', FieldMap) ->
    #'Proto80152005'{
        'question' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'rank' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'status' = gb_unserialize:get_value(maps:get(3,FieldMap)),
        'remain_time' = gb_unserialize:get_value(maps:get(4,FieldMap))
    };
field_map_to_msg('Proto10152001', FieldMap) ->
    #'Proto10152001'{
        'request_season' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152015', FieldMap) ->
    #'Proto50152015'{
        'rank' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'remain_time' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50152013', FieldMap) ->
    #'Proto50152013'{
        'autumn_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152010', FieldMap) ->
    #'Proto10152010'{
        'campfire' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152001', FieldMap) ->
    #'Proto50152001'{
        'season' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'start_time' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'end_time' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto10152012', FieldMap) ->
    #'Proto10152012'{
        'hero_id' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152011', FieldMap) ->
    #'Proto50152011'{
        'autumn_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152008', FieldMap) ->
    #'Proto50152008'{
        'spring_mission' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152007', FieldMap) ->
    #'Proto50152007'{
        'spring_mission' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152016', FieldMap) ->
    #'Proto10152016'{
        'request_rank_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152002', FieldMap) ->
    #'Proto50152002'{
        'final_award' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'mission' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto50152016', FieldMap) ->
    #'Proto50152016'{
        'final_rank_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152006', FieldMap) ->
    #'Proto50152006'{
        'spring_mission' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152008', FieldMap) ->
    #'Proto10152008'{
        'ok' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152014', FieldMap) ->
    #'Proto50152014'{
        'autumn_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152005', FieldMap) ->
    #'Proto10152005'{
        'request_winter' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152003', FieldMap) ->
    #'Proto50152003'{
        'campfire_info' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'firecracker_remain_times' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'firework_remain_times' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50152012', FieldMap) ->
    #'Proto50152012'{
        'autumn_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80152003', FieldMap) ->
    #'Proto80152003'{
        'campfire_list' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'firecracker_remain_times' = gb_unserialize:get_value(maps:get(2,FieldMap)),
        'firework_remain_times' = gb_unserialize:get_value(maps:get(3,FieldMap))
    };
field_map_to_msg('Proto50152005', FieldMap) ->
    #'Proto50152005'{
        'question' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152011', FieldMap) ->
    #'Proto10152011'{
        'troops_hero' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'autumn_mission_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10152009', FieldMap) ->
    #'Proto10152009'{
        'campfire' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152006', FieldMap) ->
    #'Proto10152006'{
        'troops_hero' = gb_unserialize:get_value(maps:get(1,FieldMap)),
        'spring_mission_id' = gb_unserialize:get_value(maps:get(2,FieldMap))
    };
field_map_to_msg('Proto10152003', FieldMap) ->
    #'Proto10152003'{
        'request_summer' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152007', FieldMap) ->
    #'Proto10152007'{
        'spring_mission' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto50152009', FieldMap) ->
    #'Proto50152009'{
        'campfire_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto10152002', FieldMap) ->
    #'Proto10152002'{
        'request_spring' = gb_unserialize:get_value(maps:get(1,FieldMap))
    };
field_map_to_msg('Proto80152011', FieldMap) ->
    #'Proto80152011'{
        'autumn_mission_list' = gb_unserialize:get_value(maps:get(1,FieldMap))
    }.
