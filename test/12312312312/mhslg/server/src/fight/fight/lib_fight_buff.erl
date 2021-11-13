%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_buff.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_buff).
-include("fight_effect.hrl").
-include("fight_prop.hrl").
-include("fight_buff.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("common.hrl").
%% API
-export([
    init_buff/0,
    insert_buff/2,
    buff_effect/0,
    have_type/3,
    clean_buff/4,
    rand_clean_buff/4,
    shield_buff/3,
    check_overdue/0,
    buff_config/3,
    get_buff_by_type/3,
    buff_value_a/3,
    buff_value_b/3,
    buff_value_c/3,
    buff_ad_type/1,
    init_change_buff/0
]).

insert_buff(FightData, BuffId) when is_integer(BuffId) ->
    insert_buff(FightData, [BuffId]);
insert_buff(_, []) ->
    skip;
insert_buff(FightData, BuffList) when is_list(BuffList) ->
    lists:foreach(fun(BuffId) ->
        insert_one_buff(FightData, BuffId)
    end, BuffList),
    parsing_insert_buff(FightData, BuffList).

insert_one_buff(FightData, BuffId) when is_integer(BuffId) ->
    lists:foreach(fun(Prefix) ->
        insert_buff_done(FightData#fight_data{target_prefix = Prefix}, BuffId)
    end, FightData#fight_data.target_prefix).

insert_buff_done(FightData, BuffId) when is_integer(BuffId) ->
    BuffConfig = tb_buff:get(BuffId),
    ARate = lib_fight_effect:get_target_effect_value(FightData, ?EFFECT_A_SHIELD_WEAKEN),
    DRate = lib_fight_effect:get_target_effect_value(FightData#fight_data{target_object = ?OTHER(FightData#fight_data.target_object)}, ?EFFECT_D_SHIELD_WEAKEN),
    insert_buff_done(FightData#fight_data.target_object, FightData#fight_data.target_prefix, #fight_buff{
        id = BuffId,
        group = maps:get(group, BuffConfig),
        type = maps:get(type, BuffConfig),
        object = FightData#fight_data.target_object,
        prefix = FightData#fight_data.target_prefix,
        overdue = lib_fight_api:add_round(maps:get(round, BuffConfig, -1)),
        source_object = FightData#fight_data.object,
        source_prefix = FightData#fight_data.prefix,
        source_id = FightData#fight_data.skill_id,
        value_a = trunc(fetch_buff_value_a(FightData, BuffId, maps:get(type, BuffConfig)) * (ARate + DRate))
    }).
insert_buff_done(TargetObject, Prefix, Buff) when is_record(Buff, fight_buff) ->
    BuffMap = lib_fight_data:get_buff_map(TargetObject, Prefix),
    OldBuff = maps:get(Buff#fight_buff.group, BuffMap, #fight_buff{}),
    lib_fight_data:put_buff_map(TargetObject, Prefix, maps:put(Buff#fight_buff.group, Buff#fight_buff{
        overlay = 1 + OldBuff#fight_buff.overlay
    }, BuffMap)),
    effect(Buff, #fight_data{
        type = ?CLIENT_EFFECT_TYPE2,
        object = TargetObject,
        prefix = Buff#fight_buff.prefix,
        skill_id = Buff#fight_buff.id,
        target_object = TargetObject,
        target_prefix = Buff#fight_buff.prefix
    }).

parsing_insert_buff(FightData, BuffList) ->
    lib_fight_parsing:parsing_proto_effect(FightData#fight_data{
        value_list = BuffList
    }).

remove_buff(Object, Prefix, Group) ->
    BuffMap = lib_fight_data:get_buff_map(Object, Prefix),
    Buff = maps:get(Group, BuffMap, #fight_buff{}),
    parsing_remove_buff(Buff),
    remove_buff_prop(Buff#fight_buff.type, Buff),
    lib_fight_data:put_buff_map(Object, Prefix, maps:remove(Group, BuffMap)).

parsing_remove_buff(Buff) ->
    lib_fight_parsing:parsing_proto_effect(#fight_data{
        type = ?CLIENT_EFFECT_TYPE3,
        skill_id = Buff#fight_buff.id,
        object = Buff#fight_buff.object,
        prefix = Buff#fight_buff.prefix,
        target_object = Buff#fight_buff.object
    }).

remove_buff_prop(?FIGHT_BUFF_TYPE_2001, Buff) ->
    Conf = tb_buff:get(Buff#fight_buff.id),
    PropName = maps:get(value_str, Conf, ""),
    PropValue = maps:get(value_a, Conf, 0),
    Fighter = lib_fight_data:get_fighter(Buff#fight_buff.object),
    CurValue = lib_fight_prop:get_prop(Buff#fight_buff.prefix, PropName, Fighter#combat_hero.fight_prop2),
    Value = ?IIF(CurValue > PropValue, CurValue - PropValue, CurValue) * -1,
    lib_fight_api:add_fight_prop2(Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value)
;

remove_buff_prop(?FIGHT_BUFF_TYPE_2002, Buff) ->
    Conf = tb_buff:get(Buff#fight_buff.id),
    PropName = maps:get(value_str, Conf, ""),
    PropValue = maps:get(value_a, Conf, 0),
    Fighter = lib_fight_data:get_fighter(Buff#fight_buff.object),
    CurValue = lib_fight_prop:get_prop(Buff#fight_buff.prefix, PropName, Fighter#combat_hero.fight_prop1),
    Value = ?IIF(CurValue > PropValue, CurValue - PropValue, CurValue) * -1,
    lib_fight_api:add_fight_prop1(Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value)
;

remove_buff_prop(?FIGHT_BUFF_TYPE_1014, Buff) ->
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    ConfList = maps:get(value_json, BuffConfig, []),
    lists:foreach(fun(Conf)->
        PropName = maps:get(value_str, Conf, ""),
        PropValue = maps:get(value_b, Conf, 0),
        Fighter = lib_fight_data:get_fighter(Buff#fight_buff.object),
        CurValue = lib_fight_prop:get_prop(Buff#fight_buff.prefix, PropName, Fighter#combat_hero.fight_prop1),
        Value = ?IIF(CurValue > PropValue, CurValue - PropValue, CurValue) * -1,
        lib_fight_api:add_fight_prop1(Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value)
    end,ConfList)
;
remove_buff_prop(_BuffType, _Buff) ->
    skip
.


update_buff(Object, Prefix, Group, Buff) ->
    BuffMap = lib_fight_data:get_buff_map(Object, Prefix),
    NewBuffMap = maps:put(Group, Buff, BuffMap),
    lib_fight_data:put_buff_map(Object, Prefix, NewBuffMap).


fetch_buff_value_a(FightData, BuffId, ?FIGHT_BUFF_TYPE_1009) ->
    Value = maps:get(value_a, tb_buff:get(BuffId), 0),
    Army = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
    Rate0 = lib_fight_passive_skill:check_passive_effect(?EFFECT_BUFF_SHIELD_RATE, FightData#fight_data{value = BuffId}),
    Rate1 = ?IIF(Rate0 > 0, Rate0, 1),
    trunc((Army#combat_army.troops * Value) * Rate1);
fetch_buff_value_a(FightData, BuffId, ?FIGHT_BUFF_TYPE_1010) ->
    Value = maps:get(value_a, tb_buff:get(BuffId), 0),
    Army = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
    Rate0 = lib_fight_passive_skill:check_passive_effect(?EFFECT_BUFF_SHIELD_RATE, FightData#fight_data{value = BuffId}),
    Rate1 = ?IIF(Rate0 > 0, Rate0, 1),
    trunc((Army#combat_army.troops * Value) * Rate1);
fetch_buff_value_a(FightData, BuffId, ?FIGHT_BUFF_TYPE_1014) ->
    Value = maps:get(value_a, tb_buff:get(BuffId), 0),
    Army = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
    Rate0 = lib_fight_passive_skill:check_passive_effect(?EFFECT_BUFF_SHIELD_RATE, FightData#fight_data{value = BuffId}),
    Rate1 = ?IIF(Rate0 > 0, Rate0, 1),
    trunc((Army#combat_army.troops * Value) * Rate1);
fetch_buff_value_a(_, _, _) ->
    0.

buff_ad_type(BuffId) ->
    Conf = tb_buff:get(BuffId),
    maps:get(buff_type, Conf, ?FIGHT_BUFF_AD_TYPE1).

have_type(Object, Prefix, Type) ->
    try
        Maps = lib_fight_data:get_buff_map(Object, Prefix),
        maps:fold(fun(_, #fight_buff{type = BuffType} = _Buff, _) ->
            ?JUDGE_RETURN(BuffType =/= Type, 0), false
        end, false, Maps)
    catch
        _:_  -> ?INFO("~p buff have_type : ~p~n", [Prefix, Type]),true
    end.

buff_config(Object, Prefix, Type) ->
    try
        maps:fold(fun(_, #fight_buff{type = BuffType, prefix = BuffPrefix} = Buff, Acc) ->
            case BuffType =:= Type andalso BuffPrefix =:= Prefix of
                true ->
                    [tb_buff:get(Buff#fight_buff.id) | Acc];
                _ -> Acc
            end
        end, [], lib_fight_data:get_buff_map(Object, Prefix))
    catch
        throw:{error, Conf}  -> Conf
    end.

get_buff_by_type(Object, Prefix, Type) ->
    try
        maps:fold(fun(_, #fight_buff{type = BuffType, prefix = BuffPrefix} = Buff, Acc) ->
            case BuffType =:= Type andalso BuffPrefix =:= Prefix of
                true ->
                    [Buff | Acc];
                _ -> Acc
            end
        end, [], lib_fight_data:get_buff_map(Object, Prefix))
    catch
        throw:{error, Conf}  -> Conf
    end.

shield_buff(FightData, Prefix, Hurt) ->
    Object = FightData#fight_data.target_object,
    BuffList1 = get_buff_by_type(Object, Prefix, ?FIGHT_BUFF_TYPE_1009),
    BuffList2 = get_buff_by_type(Object, Prefix, ?FIGHT_BUFF_TYPE_1010),
    BuffList3 = get_buff_by_type(Object, Prefix, ?FIGHT_BUFF_TYPE_1014),
    lists:foldl(fun(#fight_buff{type = BuffType} = Buff, Acc) ->
        try
            ?JUDGE_RETURN(FightData#fight_data.effect_type =:= ?EFFECT_COMMON_HURT orelse
                FightData#fight_data.effect_type =:= ?EFFECT_COPY_HURT orelse
                FightData#fight_data.effect_type =:= ?EFFECT_PERCENT_HURT, 0),
%%            ?JUDGE_RETURN(BuffType =:= ?FIGHT_BUFF_TYPE_1009 orelse FightData#fight_data.effect_type =/= ?EFFECT_PERCENT_HURT, 0),
            case BuffType =:= ?FIGHT_BUFF_TYPE_1010 andalso FightData#fight_data.effect_type =:= ?EFFECT_PERCENT_HURT of
                true ->
                    %% 百分比伤害减免
                    DueHurtBuffConf = tb_buff:get(Buff#fight_buff.id),
                    ValueB = maps:get(value_b, DueHurtBuffConf, 1),
                    Acc * (1- ValueB);
                false ->
                    %% 正常处理护盾
                    case Buff#fight_buff.value_a > Acc of
                        true ->
                            lib_fight_parsing:parsing_proto_effect(#fight_data{
                                type = ?CLIENT_EFFECT_TYPE2,
                                skill_id = Buff#fight_buff.id,
                                effect_type = BuffType,
                                object = Object,
                                target_object = Object,
                                prefix = Prefix,
                                value = Acc
                            }),
                            update_buff(Object, Prefix, Buff#fight_buff.group, Buff#fight_buff{value_a = Buff#fight_buff.value_a - Acc}),
                            0;
                        _ ->
                            lib_fight_parsing:parsing_proto_effect(#fight_data{
                                type = ?CLIENT_EFFECT_TYPE2,
                                skill_id = Buff#fight_buff.id,
                                effect_type = BuffType,
                                object = Object,
                                target_object = Object,
                                prefix = Prefix,
                                value = Buff#fight_buff.value_a
                            }),
                            remove_buff(Object, Prefix, Buff#fight_buff.group),
                            Acc - Buff#fight_buff.value_a
                    end
            end
        catch
            throw:{error, _} -> Acc;
            _:_ ->
                ?ERROR("shield buff error[~p]~n",[erlang:get_stacktrace()]),
                Acc
        end
    end, Hurt, lists:append(BuffList3,lists:append(BuffList1, BuffList2))).

buff_value_a(Object, Prefix, Type) ->
    maps:fold(fun(_, #fight_buff{type = BuffType, prefix = BuffPrefix} = Buff, Acc) ->
        case BuffType =:= Type andalso BuffPrefix =:= Prefix of
            true ->
                maps:get(value_a, tb_buff:get(Buff#fight_buff.id), 0) + Acc;
            _ ->
                Acc
        end
    end, 0, lib_fight_data:get_buff_map(Object, Prefix)).

buff_value_b(Object, Prefix, Type) ->
    maps:fold(fun(_, #fight_buff{type = BuffType, prefix = BuffPrefix} = Buff, Acc) ->
        case BuffType =:= Type andalso BuffPrefix =/= Prefix of
            true ->
                maps:get(value_b, tb_buff:get(Buff#fight_buff.id), 0) + Acc;
            _ ->
                Acc
        end
    end, 0, lib_fight_data:get_buff_map(Object, Prefix)).

buff_value_c(Object, Prefix, Type) ->
    maps:fold(fun(_, #fight_buff{type = BuffType, prefix = BuffPrefix} = Buff, Acc) ->
        case BuffType =:= Type andalso BuffPrefix =/= Prefix of
            true ->
                maps:get(value_c, tb_buff:get(Buff#fight_buff.id), 0) + Acc;
            _ ->
                Acc
        end
    end, 0, lib_fight_data:get_buff_map(Object, Prefix)).

clean_buff(_Amount, Object, PrefixList, ?FIGHT_BUFF_AD_TYPE0) ->
    lists:foreach(fun(Prefix) ->
        lib_fight_data:put_buff_map(Object, Prefix, #{})
    end, PrefixList);
clean_buff(Amount, Object, PrefixList, Type) ->
    lists:foreach(fun(Prefix) ->
        maps:fold(fun(Group, #fight_buff{id = BuffID} = _Buff, Acc) ->
            ADType = maps:get(buff_type, tb_buff:get(BuffID)),
            case ADType =:= Type andalso (Acc > 0 orelse Acc =:= -1)of
                true ->
                    remove_buff(Object, Prefix, Group), Acc - 1;
                _ -> Acc
            end
        end, Amount, lib_fight_data:get_buff_map(Object, Prefix))
    end, PrefixList).

rand_clean_buff(Amount, Object, PrefixList, Type) ->
    lists:foreach(fun(Prefix) ->
        BuffList = maps:to_list(lib_fight_data:get_buff_map(Object, Prefix)),
        NewBuffList = lists:filter(
            fun({_Group, #fight_buff{id = BuffId}} = _Buff) ->
                ADType = maps:get(buff_type, tb_buff:get(BuffId)),
                ADType =:= Type
            end,
        BuffList),
        lib_common:list_foldl(
            fun(_, {Acc, Acc1}) ->
                ?JUDGE_BREAK(Acc > 0 andalso erlang:length(Acc1) > 0),
                {Group, _} = Buff = lib_fight_rand:rand_one(Acc1),
                remove_buff(Object, Prefix, Group),
                {Acc - 1, lists:delete(Buff, Acc1)}
            end,
        {Amount, NewBuffList}, NewBuffList)
    end, PrefixList).

init_buff() ->
    lists:foreach(fun(Prefix) ->
        lib_fight_data:put_buff_map(?FIGHTER_TYPE_L, Prefix, maps:new()),
        lib_fight_data:put_buff_map(?FIGHTER_TYPE_R, Prefix, maps:new())
    end, ?PREFIX_LIST).

check_overdue() ->
    lists:foreach(fun(Prefix) ->
        check_overdue(?FIGHTER_TYPE_L, Prefix),
        check_overdue(?FIGHTER_TYPE_R, Prefix)
    end, ?PREFIX_LIST).
check_overdue(Object, Prefix) ->
    maps:fold(fun(Group, Buff, _) ->
        try
            ?JUDGE_RETURN(is_overdue(Buff), 0),
            ?DEBUG("remove_buff ~p ~p ~p~n", [Object, Prefix, Group]),
            remove_buff(Object, Prefix, Group)
        catch
            _:_  -> skip
        end
    end, false, lib_fight_data:get_buff_map(Object, Prefix)).

is_overdue(Buff) ->
    try
        {OA, OB} = Buff#fight_buff.overdue,
        {A, B} = lib_fight_data:get_cur_round(),
        ?JUDGE_RETURN(OA < A orelse (OA =:= A andalso OB =< B), 0),
        true
    catch
        _:_  -> false
    end.


buff_effect() ->
    lists:foreach(fun(Prefix) ->
        buff_effect(?FIGHTER_TYPE_L, Prefix),
        buff_effect(?FIGHTER_TYPE_R, Prefix)
    end, ?PREFIX_LIST).
buff_effect(Object, Prefix) ->
    maps:fold(fun(_, Buff, _) ->
        try
            effect(Buff, #fight_data{
                type = ?CLIENT_EFFECT_TYPE2,
                object = Object,
                prefix = Buff#fight_buff.prefix,
                skill_id = Buff#fight_buff.id,
                target_object = Object,
                target_prefix = Buff#fight_buff.prefix
            })
        catch
            throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
            throw:next_round -> ?NEXT_ROUND(true);
            throw:skip_skill -> ?NEXT_SKILL(true);
            throw:_ -> skip;
            _:Reason  -> ?ERROR("buff effect error reason:~p~n~p", [Reason, erlang:get_stacktrace()])
        end
    end, 0, lib_fight_data:get_buff_map(Object, Prefix)).

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_1001} = Buff, FightData) ->
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    case Buff#fight_buff.prefix of
        ?PROP_PREFIX_FORMER ->
            ?JUDGE_RETURN(not lib_fight_api:latter_die(Buff#fight_buff.object), 0),
            lib_fight_api:skill_hurt(1, FightData#fight_data{
                effect_type = ?EFFECT_COMMON_HURT,
                target_object = Buff#fight_buff.object,
                target_prefix = [?PROP_PREFIX_LATTER],
                passive_flag = false,
                target_passive_flag = false
            }, BuffConfig);
%%            lib_fight_api:deduct_health(FightData#fight_data{
%%                effect_type = ?EFFECT_COMMON_HURT,
%%                target_object = Buff#fight_buff.object,
%%                target_prefix = [?PROP_PREFIX_LATTER],
%%                passive_flag = false,
%%                target_passive_flag = false
%%            }, maps:get(value_json, BuffConfig, BuffConfig));
        ?PROP_PREFIX_LATTER ->
            ?JUDGE_RETURN(not lib_fight_api:former_die(Buff#fight_buff.object), 0),
%%            Hurt = lib_fight_api:calc_hurt(FightData#fight_data{
%%                effect_type = ?EFFECT_COMMON_HURT,
%%                target_object = Buff#fight_buff.object,
%%                target_prefix = ?PROP_PREFIX_FORMER,
%%                attack_type = ?FIGHT_ATTACK_TYPE4,
%%                passive_flag = false,
%%                target_passive_flag = false
%%            }, ?PROP_PREFIX_FORMER, maps:get(value_json, BuffConfig, BuffConfig))),
%%            ?DEBUG("deduct_health_one self ~p~n", [Hurt]),
%%            deduct_health_done(FightData1, Hurt),
%%            FightData1#fight_data{target_prefix = [FightData#fight_data.target_prefix], value = -Hurt, value_list = [-Hurt]},
%%            lib_fight_parsing:parsing_proto_effect(NewFightData#fight_data{
%%                attack_type_list = [NewFightData#fight_data.attack_type]
%%            }),
            lib_fight_api:skill_hurt(1, FightData#fight_data{
                effect_type = ?EFFECT_COMMON_HURT,
                target_object = Buff#fight_buff.object,
                target_prefix = [?PROP_PREFIX_FORMER],
                passive_flag = false,
                target_passive_flag = false
            }, BuffConfig);
%%            lib_fight_api:deduct_health(FightData#fight_data{
%%                effect_type = ?EFFECT_COMMON_HURT,
%%                target_object = Buff#fight_buff.object,
%%                target_prefix = [?PROP_PREFIX_FORMER],
%%                passive_flag = false,
%%                target_passive_flag = false
%%            }, maps:get(value_json, BuffConfig, BuffConfig));
        _ -> skip
    end;

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_1003} = Buff, _FightData) ->
    Fighter = lib_fight_data:get_fighter(Buff#fight_buff.object),
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    Value = maps:get(value_a, BuffConfig, 0),
    ?DEBUG("FIGHT_BUFF_TYPE_1003 ~p ~p~n", [Value, Buff#fight_buff.overdue]),
    Prop = lib_fight_prop:sub_prop(Buff#fight_buff.prefix, ?SPEED, Value, Fighter#combat_hero.fight_prop2),
    lib_fight_data:put_fighter(Buff#fight_buff.object, Fighter#combat_hero{fight_prop2 = Prop});

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_1005} = Buff, FightData) ->
    Defender = lib_fight_data:get_fighter(Buff#fight_buff.object),
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    case Buff#fight_buff.prefix of
        ?PROP_PREFIX_FORMER ->
            ?JUDGE_RETURN(not lib_fight_api:former_die(Buff#fight_buff.object), 0),
            Former = Defender#combat_hero.former,
            Hurt = trunc(Former#combat_army.cur_troops * maps:get(value_a, BuffConfig, 0)),
            lib_fight_api:deduct_health(FightData#fight_data{
                target_object = Buff#fight_buff.object,
                target_prefix = [?PROP_PREFIX_FORMER],
                value = Hurt
            }, maps:new());
        ?PROP_PREFIX_LATTER ->
            ?JUDGE_RETURN(not lib_fight_api:latter_die(Buff#fight_buff.object), 0),
            Latter = Defender#combat_hero.latter,
            Hurt = trunc(Latter#combat_army.cur_troops * maps:get(value_a, BuffConfig, 0)),
            lib_fight_api:deduct_health(FightData#fight_data{
                target_object = Buff#fight_buff.object,
                target_prefix = [?PROP_PREFIX_LATTER],
                value = Hurt
            }, maps:new());
        _ -> skip
    end;

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_1006} = Buff, _FightData) ->
    Fighter = lib_fight_data:get_fighter(Buff#fight_buff.object),
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    Value1 = maps:get(value_a, BuffConfig, 0),
    Value2 = maps:get(value_b, BuffConfig, 0),
    Value3 = maps:get(value_c, BuffConfig, 0),
    Prop1 = lib_fight_prop:add_prop(Buff#fight_buff.prefix, ?HURT_INC_RATE, Value1, Fighter#combat_hero.fight_prop2),
    Prop2 = lib_fight_prop:add_prop(Buff#fight_buff.prefix, ?HURT_RED_RATE, Value2, Prop1),
    Prop3 = lib_fight_prop:add_prop(Buff#fight_buff.prefix, ?CRIT, Value3, Prop2),
    lib_fight_data:put_fighter(Buff#fight_buff.object, Fighter#combat_hero{fight_prop2 = Prop3});

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_1007} = Buff, FightData) ->
    Defender = lib_fight_data:get_fighter(Buff#fight_buff.object),
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    case Buff#fight_buff.prefix of
        ?PROP_PREFIX_FORMER ->
            ?JUDGE_RETURN(not lib_fight_api:former_die(Buff#fight_buff.object), 0),
            Former = Defender#combat_hero.former,
            Hurt = trunc(Former#combat_army.troops * maps:get(value_a, BuffConfig, 0)),
            lib_fight_api:deduct_health(FightData#fight_data{
                target_object = Buff#fight_buff.object,
                target_prefix = [?PROP_PREFIX_FORMER],
                value = Hurt
            }, maps:new());
        ?PROP_PREFIX_LATTER ->
            ?JUDGE_RETURN(not lib_fight_api:latter_die(Buff#fight_buff.object), 0),
            Latter = Defender#combat_hero.latter,
            Hurt = trunc(Latter#combat_army.troops * maps:get(value_a, BuffConfig, 0)),
            lib_fight_api:deduct_health(FightData#fight_data{
                target_object = Buff#fight_buff.object,
                target_prefix = [?PROP_PREFIX_LATTER],
                value = Hurt
            }, maps:new());
        _ -> skip
    end;


effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_2001} = Buff, _FightData) ->
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    BuffType = maps:get(buff_type, BuffConfig, ?FIGHT_BUFF_AD_TYPE1),
    PropName = maps:get(value_str, BuffConfig, ""),
    PropValue = maps:get(value_a, BuffConfig, 0),
    Value =
        case BuffType of
            ?FIGHT_BUFF_AD_TYPE2 -> -PropValue;
            _ -> PropValue
        end,
    ?INFO("FIGHT_BUFF_TYPE_2001 ~p ~p ~p ~p", [Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value]),
    lib_fight_api:add_fight_prop2(Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value);

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_2002} = Buff, _FightData) ->
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    BuffType = maps:get(buff_type, BuffConfig, ?FIGHT_BUFF_AD_TYPE1),
    PropName = maps:get(value_str, BuffConfig, ""),
    PropValue = maps:get(value_a, BuffConfig, 0),
    Value =
    case BuffType of
        ?FIGHT_BUFF_AD_TYPE2 -> -PropValue;
        _ -> PropValue
    end,
    lib_fight_api:add_fight_prop1(Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value);

effect(#fight_buff{type = ?FIGHT_BUFF_TYPE_1014} = Buff, _FightData) ->
    BuffConfig = tb_buff:get(Buff#fight_buff.id),
    BuffType = maps:get(buff_type, BuffConfig, ?FIGHT_BUFF_AD_TYPE1),
    ConfList = maps:get(value_json, BuffConfig, []),
    lists:foreach(fun(Conf)->
        PropName = maps:get(value_str, Conf, ""),
        PropValue = maps:get(value, Conf, 0),
        Value =
            case BuffType of
                ?FIGHT_BUFF_AD_TYPE2 -> -PropValue;
                _ -> PropValue
            end,
        ?INFO("FIGHT_BUFF_TYPE_1009 ~p ~p ~p ~p", [Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value]),
        lib_fight_api:add_fight_prop2(Buff#fight_buff.object, Buff#fight_buff.prefix, PropName, Value)
    end,ConfList)
;

effect(_, _) ->
    skip.

init_change_buff() ->
    lib_fight_data:reset_change_buff(),
    init_change_buff(?FIGHTER_TYPE_L),
    init_change_buff(?FIGHTER_TYPE_R)
.

init_change_buff(Object) ->
    Fighter = lib_fight_data:get_fighter(Object),
    lists:foreach(fun(Skill_ID) ->
        FightData = #fight_data{
            object = Object,
            prefix = ?PROP_PREFIX_HERO,
            target_object = Object,
            target_prefix = ?PROP_PREFIX_HERO,
            skill_id = Skill_ID,
            flag = 0
        },
        lists:foreach(fun(Conf) ->
            try
                case  lib_fight_passive_skill:validation_passive_effect(?EFFECT_CHANGE_BUFF_ID, Skill_ID, Conf, FightData) of
                    true ->
                        ?INFO("Skill_ID ~p",[Skill_ID]),
                        Buff_ID = maps:get(buff_id,Conf),
                        New_Buff_ID = maps:get(new_buff_id,Conf),
                        Object = maps:get(object,Conf),
                        case Object of
                            1 -> lib_fight_data:put_change_buff(Object,Buff_ID,New_Buff_ID);
                            2 -> lib_fight_data:put_change_buff(?OTHER(Object),Buff_ID,New_Buff_ID)
                        end;
                    _ ->
                        skip
                end
            catch
                _:_ -> skip
            end

		end, lib_fight_config:passive_skill_effect(Skill_ID,Object))
    end,Fighter#combat_hero.skill_list).