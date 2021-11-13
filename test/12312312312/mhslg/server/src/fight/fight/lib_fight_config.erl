%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_extra.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_config).
-compile(export_all).
-include("common.hrl").
-include("fight.hrl").
-include("fight_effect.hrl").
-include("fight_prop.hrl").
-include("combat_queue.hrl").
-include("fight_buff.hrl").

troops_damping(Object,Prefix,N) ->
    try
        lists:foldl(fun(Key, Acc) ->
            ?JUDGE_RETURN(N >= Key, Acc),
            #{value := V} = tb_damping:get(Key), V
        end, 0, tb_damping:get_list())
    catch
        throw:{error, TNum}  -> case lib_fight_buff:have_type(Object, Prefix,?FIGHT_BUFF_TYPE_1015) of
                                    true -> max(-0.2,-TNum);
                                    false-> TNum
                                end
    end.

round_hurt(N) ->
    try
        lists:foldl(fun(Key, Acc) ->
            ?JUDGE_RETURN(N >= Key, Acc),
            #{value := V} = tb_round_hurt:get(Key), V
        end, 0, tb_round_hurt:get_list())
    catch
        throw:{error, TNum}  -> TNum
    end.

get_skill_dict(Object) ->
    Former = lib_fight_data:get_former(Object),
    Latter = lib_fight_data:get_latter(Object),
    lists:foldl(fun(SkillID, {Acc, F1, F2, L1, L2}) ->
        try
            Conf = tb_skill:get(SkillID),
            Type = maps:get(skill_type, Conf, 0),
            AddType = maps:get(skill_type_add, Conf, 0),
            case Type of ?SKILL_TYPE0 -> throw({common_skill, SkillID}); _ -> skip end,
            ?JUDGE_RETURN(is_active_skill(SkillID), 0),
            FightData = #fight_data{
                object = Object,
                skill_id = SkillID
            },
            Flag =
                lib_fight_api:active_skill_round_active(Object, SkillID) orelse
                lib_fight_api:round_can_active_extra(SkillID) orelse
                lib_fight_passive_skill:check_passive_effect(?EFFECT_SKILL_ACTIVE_ROUND, FightData),
            ?JUDGE_RETURN(Flag, 0),
            ?JUDGE_RETURN(lib_fight_api:can_active_skill(Object, SkillID, false), 0),
            SkillGroup = lib_fight_api:get_skill_sort_group(SkillID),
            PriorityDict = ?DICT_FETCH(SkillGroup, Acc, dict:new()),
            Dict = ?DICT_FETCH(skill_sort(SkillID), PriorityDict, dict:new()),
            List = ?DICT_FETCH(skill_sort_type(SkillID), Dict, []),
            EffectList = lib_fight_passive_skill:check_passive_effect(?EFFECT_SKILL_ACTIVE_AGAIN, #fight_data{
                object = Object,
                skill_id = SkillID
            }),
            NewList =
            lists:foldl(fun(SkillID0, NewListAcc) ->
                [{Object, SkillID0, skill_sort_type(SkillID0)} | NewListAcc]
            end, [{Object, SkillID, skill_sort_type(SkillID)} | List], EffectList),
            NewDict = dict:store(skill_sort_type(SkillID), NewList, Dict),
            NewPriorityDict = dict:store(skill_sort(SkillID), NewDict, PriorityDict),
            if
                Type =:= ?SKILL_TYPE4 andalso Former#combat_army.type =:= AddType ->
                    {dict:store(SkillGroup, NewPriorityDict, Acc), F1, false, L1, L2};
                Type =:= ?SKILL_TYPE4 andalso Latter#combat_army.type =:= AddType ->
                    {dict:store(SkillGroup, NewPriorityDict, Acc), F1, F2, L1, false};
                true ->
                    {dict:store(SkillGroup, NewPriorityDict, Acc), F1, F2, L1, L2}
            end
        catch
            throw:{common_skill, Id} ->
                Conf0 = tb_skill:get(Id),
                AddType0 = maps:get(skill_type_add, Conf0, 0),
                if
                    Former#combat_army.type =:= AddType0 -> {Acc, Id, F2, L1, L2};
                    Latter#combat_army.type =:= AddType0 -> {Acc, F1, F2, Id, L2};
                    true -> {Acc, F1, F2, L1, L2}
                end;
            _:_  -> {Acc, F1, F2, L1, L2}
        end
    end, {dict:new(), 0, true, 0, true}, lib_fight_data:get_fighter_skill_list(Object)).

skill_type(ID) ->
    Conf = tb_skill:get(ID),
    case Conf of
        false -> error;
        _ -> maps:get(skill_type, Conf, ?SKILL_TYPE0)
    end.

skill_sort(ID) ->
    Conf = tb_skill:get(ID),
    maps:get(skill_sort, Conf, ?SKILL_TYPE0).

skill_sort_type(ID) ->
    Conf = tb_skill:get(ID),
    maps:get(skill_sort_type, Conf, ?SKILL_TYPE0).

skill_sort_value(ID) ->
    Conf = tb_skill:get(ID),
    maps:get(skill_sort_value, Conf, ?SKILL_TYPE0).

skill_type_add(ID) ->
    Conf = tb_skill:get(ID),
    maps:get(skill_type_add, Conf, 0).

skill_target_object(Object, SkillId) when is_integer(SkillId) ->
    Conf = tb_skill:get(SkillId),
    TargetObject = maps:get(target_object, Conf, []),
    case TargetObject of
        1 -> ?OTHER(Object);
        2 -> Object;
        _ -> ?OTHER(Object)
    end;
skill_target_object(Object, Conf) ->
    TargetObject = maps:get(target_object, Conf, []),
    case TargetObject of
        1 -> ?OTHER(Object);
        2 -> Object;
        _ -> ?OTHER(Object)
    end.

skill_target(SkillId) when is_integer(SkillId) ->
    Conf = tb_skill:get(SkillId),
    Target = maps:get(target, Conf, []),
    case Target of
        ?FIGHT_SKILL_TARGET1 -> [?PROP_PREFIX_HERO];
        ?FIGHT_SKILL_TARGET2 -> [?PROP_PREFIX_FORMER];
        ?FIGHT_SKILL_TARGET3 -> [?PROP_PREFIX_LATTER];
        ?FIGHT_SKILL_TARGET4 -> lib_fight_rand:rand_one([?PROP_PREFIX_LATTER,?PROP_PREFIX_FORMER]);
%%            ?DEBUG("FIGHT_SKILL_TARGET4 SkillId ~p~n", [RandTarget]),[RandTarget];
        ?FIGHT_SKILL_TARGET5 -> [?PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER];
        _ -> []
    end.
skill_target(Conf, SkillId, FightData) ->
    Target = maps:get(target, Conf, []),
    case Target of
        ?FIGHT_SKILL_TARGET0 -> lib_fight_data:get_skill_prefix(SkillId);
        ?FIGHT_SKILL_TARGET1 -> [?PROP_PREFIX_HERO];
        ?FIGHT_SKILL_TARGET2 -> [?PROP_PREFIX_FORMER];
        ?FIGHT_SKILL_TARGET3 -> [?PROP_PREFIX_LATTER];
        ?FIGHT_SKILL_TARGET4 -> [lib_fight_rand:rand_one([?PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER])];
        ?FIGHT_SKILL_TARGET5 -> [?PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER];
        ?FIGHT_SKILL_TARGET6 -> ?OTHER_PREFIX_LIST(lib_fight_data:get_skill_prefix(SkillId));
        ?FIGHT_SKILL_TARGET7 -> case is_list(FightData#fight_data.target_prefix) of
                                true -> FightData#fight_data.target_prefix; _ -> [FightData#fight_data.target_prefix] end;
        _ -> []
    end.

config_target_to_target(V) ->
    case V of 1 -> ?PROP_PREFIX_HERO; 2 -> ?PROP_PREFIX_FORMER;
    3 -> ?PROP_PREFIX_LATTER end.

fetch_skill_hurt(SkillId) when is_integer(SkillId) ->
    Conf = tb_skill:get(SkillId),
    {maps:get(skill_hurt_l, Conf, 0), maps:get(skill_hurt_r, Conf, 0)};
fetch_skill_hurt(Conf) ->
    {maps:get(skill_hurt_l, Conf, 0), maps:get(skill_hurt_r, Conf, 0)}.

skill_hurt_times(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(hurt_times, Conf, 0).

skill_interval(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(interval, Conf, 0).

skill_round(Conf) when is_map(Conf) ->
    maps:get(round, Conf, 0);
skill_round(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(round, Conf, 0).

skill_round_add(Conf) when is_map(Conf) ->
    maps:get(round_add, Conf, 0);
skill_round_add(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(round_add, Conf, 0).

skill_active_rand(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(active_rand, Conf, 0).

skill_trigger_army_type(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(trigger_army_type, Conf, 0).

skill_trigger_hero_type(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(trigger_hero_type, Conf, 0).

skill_trigger_hero_value(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(trigger_hero_value, Conf, 0).

skill_trigger_extra_type(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(trigger_extra, Conf, 0).

skill_trigger_extra_value1(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(trigger_extra_value1, Conf, 0).

skill_trigger_extra_value2(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(trigger_extra_value2, Conf, 0).

%%  主动技能额外技能conf
skill_add_effect(SkillId) ->
    Conf = tb_skill:get(SkillId),
    List1 = maps:get(four_d_effect, Conf, []),
    List2 = maps:get(effect_of_additional, Conf, []),
    lists:append(List1, List2).

skill_add_effect(SkillId,Object) ->
    Config1 = lib_fight_data:get_change_config_skill(Object,SkillId),
    case Config1 =:= false of
        true -> Conf = tb_skill:get(SkillId),
                List1 = maps:get(four_d_effect, Conf, []),
                List2 = maps:get(effect_of_additional, Conf, []),
                lists:append(List1, List2);
        false-> Config1
    end
.
%%skill_add_effect(SkillId,Object) ->
%%    Conf = tb_skill:get(SkillId),
%%    List1 = maps:get(four_d_effect, Conf, []),
%%    List2 = maps:get(effect_of_additional, Conf, []),
%%    Effect = lists:append(List1, List2),
%%    FightData = #fight_data{skill_id = SkillId,object = Object},
%%    ExtraEffect = all_skill_add_effect(FightData),
%%    ConfList = lists:append(Effect,ExtraEffect),
%%    SkillGroup = maps:get(group,Conf),
%%    skill_change_conf(SkillGroup,ConfList,FightData).

%%  被动技能conf
passive_skill_effect(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(effect, Conf, []).

passive_skill_effect(SkillId,Object) ->
    Config1 = lib_fight_data:get_change_config_skill(Object,SkillId),
    case Config1 =:= false of
        true -> Conf = tb_skill:get(SkillId),
                maps:get(effect, Conf, []);
        false-> Config1
    end
.

is_passive_skill(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(active_passive, Conf, 0) =:= ?SKILL_PASSIVE.

is_active_skill(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(active_passive, Conf, 0) =:= ?SKILL_ACTIVE.

active_skill_passive_effect(SkillId) ->
    Conf = tb_skill:get(SkillId),
    maps:get(passive_effect, Conf, []).

%%active_skill_passive_effect(SkillId,Object) ->
%%    Conf = tb_skill:get(SkillId),
%%    Effect = maps:get(passive_effect, Conf, []),
%%    FightData = #fight_data{skill_id = SkillId,object = Object},
%%    ExtraEffect = all_skill_add_effect(FightData),
%%    ConfList = lists:append(Effect,ExtraEffect),
%%    SkillGroup = maps:get(group,Conf),
%%    skill_change_conf(SkillGroup,ConfList,FightData) .

fetch_skill_group(SkillId) when is_integer(SkillId) ->
    Conf = tb_skill:get(SkillId),
    case Conf of
        false -> ?DEBUG("fetch_skill_group error ~p~n", [SkillId]), 0;
        _ -> maps:get(group, Conf, 0)
    end.

fetch_skill_level(SkillId) when is_integer(SkillId) ->
    Conf = tb_skill:get(SkillId),
    case Conf of
        false -> ?DEBUG("fetch_skill_level error ~p~n", [SkillId]), 0;
        _ -> maps:get(level, Conf, 0)
    end.

fetch_buff_group(BuffId) when is_integer(BuffId) ->
    Conf = tb_buff:get(BuffId),
    case Conf of
        false -> 0;
        _ -> maps:get(group, Conf, 0)
    end.

%% 技能增加效果
all_skill_add_effect(FightData) ->
    MainSKill = FightData#fight_data.skill_id,
    MainGroupID = maps:get(group,tb_skill:get(MainSKill)),
    Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
    ?LISTS_FOLD(fun(SkillId, Acc) ->
        lists:foldl(fun(Conf, EffectList) ->
            ?JUDGE_RETURN(lib_fight_passive_skill:validation_passive_effect(?EFFECT_SKILL_ADD_EFFECT, SkillId, Conf, FightData),0),
            ?JUDGE_RETURN(MainGroupID =:= maps:get(skill_group,Conf,0),0),
            GroupID = maps:get(effect_skill_group,Conf,maps:get(group,tb_skill:get(SkillId))),
            Key = case maps:get(is_have_level,Conf,0) of
                      0 -> GroupID * 1000 + 1;
                      1 -> Effect_skill_group = maps:get(effect_skill_group,Conf,0),
                           Lvl = lib_fight_api:get_group_skill_level(Effect_skill_group, Fighter#combat_hero.skill_list),
                           GroupID * 1000 + Lvl
                  end,
            lists:append(maps:get(effect, tb_special_skill:get(Key),EffectList))
        end, Acc, lib_fight_config:passive_skill_effect(SkillId))
    end, [], Fighter#combat_hero.skill_list).

%% 技能更改效果
skill_change_conf(SkillGroup,EffectList,FightData) ->
    Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
    ChangeConfList =
    ?LISTS_FOLD(fun(SkillId, Acc) ->
        lists:foldl(fun(Conf, List) ->
            ?JUDGE_RETURN(lib_fight_passive_skill:validation_passive_effect(?EFFECT_SKILL_CHANGE_EFFECT, SkillId, Conf, FightData),0),
            ?JUDGE_RETURN(SkillGroup =:= maps:get(skill_group,Conf,0),0),
            lists:append(Conf,List)
         end, Acc, lib_fight_config:passive_skill_effect(SkillId))
    end, [], Fighter#combat_hero.skill_list),
    case ChangeConfList =:= [] of
        true -> {false,EffectList};
        false->
                NewEffectList = lists:foldl(fun(Effect,LIST) ->
                    List1 =
                    lists:foldl(fun(Conf, Effect1) ->
                        case maps:get(effect,Effect1) =:= maps:get(change_effect,Conf) of
                            true -> change_conf(Conf, FightData, Effect1);
                            false-> [Effect1]
                        end
                    end, Effect, ChangeConfList),
                    lists:append(LIST,List1)
                end,[],EffectList),
                {true,NewEffectList}
    end.

change_conf(Conf, FightData, Effect1) ->
    Type = maps:get(type,Conf,0),
    GroupID = maps:get(group,Conf),
    UpdateId = get_update_id(Type,GroupID,FightData,Conf),
    NewConf = tb_special_skill:get(UpdateId),
    case NewConf =:= false of
        true -> Effect1;
        false-> maps:get(effect,NewConf)
    end.

-define(NO,     0). %% 无需等级
-define(PROP,   1). %% 四维差
-define(LVL,    2). %% 等级
get_update_id(?NO,GroupID,_FightData,_Conf) ->
    GroupID * 1000 + 1
;
get_update_id(?PROP,GroupID,FightData,Conf) ->
    Name = 	case maps:get(type_value,Conf,1) of
                  1 -> ?STRENGTH;
                  2 -> ?INTELECT;
                  3 -> ?SPIRIT;
                  4 -> ?LEADERSHIP
              end,
    NowProp = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, Name, lib_fight_data:get_fighter_prop(FightData#fight_data.object)),
    Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
    HeroConf = case Fighter#combat_hero.is_robot of true -> tb_monster_base:get(Fighter#combat_hero.robot_base_id); false -> tb_hero:get(Fighter#combat_hero.hero_id) end,
    ConfProp = maps:get(Name,HeroConf),
    Level = NowProp - ConfProp,
    case Level =< 0 of
        true -> GroupID * 1000 + 1;
        false-> GroupID * 1000 + Level
    end
;
get_update_id(?LVL,GroupID,FightData,Conf) ->
    Effect_skill_group = maps:get(type_value,Conf,0),
    Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
    Lvl = lib_fight_api:get_group_skill_level(Effect_skill_group, Fighter#combat_hero.skill_list),
    GroupID * 1000 + Lvl
;
get_update_id(Type,_GroupID,_FightData,_Conf) ->
    ?INFO("error conf update type ~p",[Type]),0
.

init_update_config() ->
    lib_fight_data:reset_change_config_skill(),
    init_update_config(?FIGHTER_TYPE_L),
    init_update_config(?FIGHTER_TYPE_R)
.

init_update_config(Object) ->
    Fighter = lib_fight_data:get_fighter(Object),
    lists:foreach(fun(Skill_ID) ->
        Config = case is_passive_skill(Skill_ID) of true -> passive_skill_effect(Skill_ID) ;false -> skill_add_effect(Skill_ID) end,
        Conf = tb_skill:get(Skill_ID),
        SkillGroup = maps:get(group,Conf),
        FightData = #fight_data{
            object = Object,
            prefix = ?PROP_PREFIX_HERO,
            target_object = Object,
            target_prefix = ?PROP_PREFIX_HERO,
            skill_id = Skill_ID,
            flag = 0
        },
        {Type,Config1} = skill_change_conf(SkillGroup,Config,FightData),
        Config2 = all_skill_add_effect(FightData),
        case Type =:= false andalso Config2 =:= [] of
            true -> skip;
            false-> Config3 = lists:append(Config1,Config2),
                    lib_fight_data:put_change_config_skill(Object,Skill_ID,Config3),
                    ?INFO("player ~p  skill ~p update config ~n~p",[Object,Skill_ID,Config3])
        end
    end,Fighter#combat_hero.skill_list)
.