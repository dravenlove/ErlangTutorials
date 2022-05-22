%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_extra.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_field_fight_config).
-compile(export_all).
-include("common.hrl").
-include("fight.hrl").
-include("fight_effect.hrl").
-include("fight_prop.hrl").
-include("combat_queue.hrl").
-include("fight_buff.hrl").

%%troops_damping(Object,Prefix,N) ->
%%    try
%%        lists:foldl(fun(Key, Acc) ->
%%            ?JUDGE_RETURN(N >= Key, Acc),
%%            #{value := V} = tb_damping:get(Key), V
%%        end, 0, tb_damping:get_list())
%%    catch
%%        throw:{error, TNum}  -> case lib_fight_buff:have_type(Object, Prefix,?FIGHT_BUFF_TYPE_1015) of
%%                                    true -> max(-0.2,-TNum);
%%                                    false-> TNum
%%                                end
%%    end.

round_hurt(N) ->
    try
        lists:foldl(fun(Key, Acc) ->
            ?JUDGE_RETURN(N >= Key, Acc),
            #{value := V} = tb_round_hurt:get(Key), V
        end, 0, tb_round_hurt:get_list())
    catch
        throw:{error, TNum}  -> TNum
    end.


skill_type(ID) ->
    Conf = tb_field_skill:get(ID),
    case Conf of
        false -> error;
        _ -> maps:get(skill_type, Conf, ?SKILL_TYPE0)
    end.

skill_sort(ID) ->
    Conf = tb_field_skill:get(ID),
    maps:get(skill_sort, Conf, ?SKILL_TYPE0).

skill_sort_type(ID) ->
    Conf = tb_field_skill:get(ID),
    maps:get(skill_sort_type, Conf, ?SKILL_TYPE0).

skill_sort_value(ID) ->
    Conf = tb_field_skill:get(ID),
    maps:get(skill_sort_value, Conf, ?SKILL_TYPE0).

skill_type_add(ID) ->
    Conf = tb_field_skill:get(ID),
    maps:get(skill_type_add, Conf, 0).

skill_target_object(Object, SkillId) when is_integer(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
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
    Conf = tb_field_skill:get(SkillId),
    Target = maps:get(target, Conf, []),
    case Target of
        ?FIGHT_SKILL_TARGET1 -> [?PROP_PREFIX_HERO];
        ?FIGHT_SKILL_TARGET2 -> [?PROP_PREFIX_FORMER];
        ?FIGHT_SKILL_TARGET3 -> [?PROP_PREFIX_LATTER];
        ?FIGHT_SKILL_TARGET4 -> lib_fight_rand:rand_one([?PROP_PREFIX_LATTER,?PROP_PREFIX_FORMER]);
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
    Conf = tb_field_skill:get(SkillId),
    {maps:get(skill_hurt_l, Conf, 0), maps:get(skill_hurt_r, Conf, 0)};
fetch_skill_hurt(Conf) ->
    {maps:get(skill_hurt_l, Conf, 0), maps:get(skill_hurt_r, Conf, 0)}.

skill_hurt_times(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(hurt_times, Conf, 0).

skill_interval(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(interval, Conf, 0).

skill_round(Conf) when is_map(Conf) ->
    maps:get(round, Conf, 0);
skill_round(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(round, Conf, 0).

skill_round_add(Conf) when is_map(Conf) ->
    maps:get(round_add, Conf, 0);
skill_round_add(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(round_add, Conf, 0).

skill_active_rand(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(active_rand, Conf, 0).

skill_trigger_army_type(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(trigger_army_type, Conf, 0).

skill_trigger_hero_type(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(trigger_hero_type, Conf, 0).

skill_trigger_hero_value(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(trigger_hero_value, Conf, 0).

skill_trigger_extra_type(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(trigger_extra, Conf, 0).

skill_trigger_extra_value1(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(trigger_extra_value1, Conf, 0).

skill_trigger_extra_value2(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(trigger_extra_value2, Conf, 0).

%%  主动技能额外技能conf
skill_add_effect(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    List1 = maps:get(four_d_effect, Conf, []),
    List2 = maps:get(effect_of_additional, Conf, []),
    lists:append(List1, List2).

skill_add_effect(SkillId,Object) ->
    Config1 = lib_fight_data:get_change_config_skill(Object,SkillId),
    case Config1 =:= false of
        true -> Conf = tb_field_skill:get(SkillId),
                List1 = maps:get(four_d_effect, Conf, []),
                List2 = maps:get(effect_of_additional, Conf, []),
                lists:append(List1, List2);
        false-> Config1
    end
.

%%  被动技能conf
passive_skill_effect(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(effect, Conf, []).

passive_skill_effect(SkillId,Object) ->
    Config1 = lib_fight_data:get_change_config_skill(Object,SkillId),
    case Config1 =:= false of
        true -> Conf = tb_field_skill:get(SkillId),
                maps:get(effect, Conf, []);
        false-> Config1
    end
.

is_passive_skill(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(active_passive, Conf, 0) =:= ?SKILL_PASSIVE.

is_active_skill(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(active_passive, Conf, 0) =:= ?SKILL_ACTIVE.

active_skill_passive_effect(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    maps:get(passive_effect, Conf, []).

fetch_skill_group(SkillId) when is_integer(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
    case Conf of
        false -> ?DEBUG("fetch_skill_group error ~p~n", [SkillId]), 0;
        _ -> maps:get(group, Conf, 0)
    end.

fetch_skill_level(SkillId) when is_integer(SkillId) ->
    Conf = tb_field_skill:get(SkillId),
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

