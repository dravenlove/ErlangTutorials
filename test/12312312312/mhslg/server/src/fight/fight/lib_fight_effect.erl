%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_effect.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_effect).
-include("fight_effect.hrl").
-include("fight_prop.hrl").
-include("fight_buff.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("common.hrl").
%% API
-export([
	effect/2,
	effect/3,
	can_effect/2,				%% 判定技能是否能释放
	related_effect/2,			%% 技能附加效果

	get_self_effect_value/2,
	get_self_effect_config/2,
	get_target_effect_value/2,
	get_target_effect_config/2,
	effect_tmp_prop/2,
	get_effect_certainly_crit/1,
	is_no_passive_effect/1
]).

effect(Conf, FightData) ->
	?INFO("1221212"),
	effect(Conf, FightData, #fight_data{}).
effect(Conf, FightData, PassiveFightData) ->
	try
		?JUDGE_RETURN(can_effect(FightData, Conf), 0),
		Condition = maps:get(condition, Conf, 0),
		ConditionStr = get_condition_str(Condition, maps:get(condition_type, Conf, 1)),
		ConditionVal = maps:get(condition_value, Conf, 0),
		EffectType = maps:get(effect, Conf, ?EFFECT_COMMON_HURT),
		{A,B} = lib_fight_data:get_cur_round(),
		?INFO("~p 阶段 ~p 回合",[A,B]),
		?INFO("释放 Skill ~p",[FightData#fight_data.skill_id]),
		?INFO("object ~p",[FightData#fight_data.object]),
		?INFO("prefix ~p",[FightData#fight_data.prefix]),
		?INFO("target_object ~p",[FightData#fight_data.target_object]),
		?INFO("target_prefix ~p",[FightData#fight_data.target_prefix]),
		?INFO("EffectType ~p",[EffectType]),
		?INFO("飘字 ~p",[FightData#fight_data.flag]),

		effect(EffectType, Conf, FightData#fight_data{
			effect_type = EffectType,
			condition = Condition,
			condition_str = ConditionStr,
			condition_value = ConditionVal
			}, PassiveFightData)
	catch
		throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
		throw:next_round -> ?NEXT_ROUND(true);
		throw:skip_skill -> ?NEXT_SKILL(true);
		throw:_ -> ok;
	    _:Reason  -> ?DEBUG("fight effect ~p~n~p", [Reason, erlang:get_stacktrace()]), ok
	end.

effect(?EFFECT_COMMON_HURT, Conf, FightData, FightData1) ->
	?JUDGE_RETURN(lib_fight_rand:rand_float() =< maps:get(active_rand, Conf, 1), 0),
%%	TargetPrefix = lib_fight_config:skill_target(Conf, FightData#fight_data.skill_id),
%%	Target = get_target(FightData#fight_data.object, Conf),
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	HurtTimes = maps:get(hurt_times, Conf, 0),
	HurtTimesAdd = maps:get(hurt_times_rand, Conf, []),
	Times = case erlang:length(HurtTimesAdd) < 2 of
				true ->
					HurtTimes;
				_ ->
					lib_fight_rand:rand(lists:nth(1,HurtTimesAdd),lists:nth(2,HurtTimesAdd))
			end,
	PassiveAddTimes = lib_fight_passive_skill:check_passive_effect(?EFFECT_SKILL_ADD_HURT_TIMES, #fight_data{
		object = FightData#fight_data.object,
		prefix = FightData#fight_data.prefix,
		skill_id = FightData#fight_data.skill_id
	}),
	lib_fight_api:skill_hurt(Times + PassiveAddTimes, FightData#fight_data{
		target_object = Target,
		target_prefix = TargetPrefix
	}, Conf),
	?JUDGE_RETURN(maps:is_key(buff_list, Conf), 0),
	effect(?EFFECT_INSERT_BUFF, Conf, FightData#fight_data{
		target_object = Target, 
		target_prefix = TargetPrefix,
		related = true,
		flag = ?EFFECT_NO_TIPS
	}, FightData1);


effect(?EFFECT_COPY_HURT, Conf, FightData, FightData1) ->
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	lib_fight_api:deduct_health(FightData#fight_data{target_object = Target, target_prefix = TargetPrefix}, Conf);

effect(?EFFECT_PERCENT_HURT, Conf, FightData, FightData1) ->
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	HurtTimes = maps:get(hurt_times, Conf, 1),
	HurtTimesAdd = maps:get(hurt_times_rand, Conf, []),
	Times = case erlang:length(HurtTimesAdd) < 2 of
				true ->
					HurtTimes;
				_ ->
					lib_fight_rand:rand(lists:nth(1,HurtTimesAdd),lists:nth(2,HurtTimesAdd))
			end,
	lib_fight_api:skill_hurt(Times, FightData#fight_data{target_object = Target, target_prefix = TargetPrefix}, Conf);

effect(?EFFECT_PERCENT_RETURN, Conf, FightData, FightData1) ->
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	ADD = lib_fight_passive_skill:passive_effect_value(?EFFECT_PERCENT_RETURN_ADD, FightData),
	ConfPercent = case maps:is_key(percent,Conf) of
					  true ->  maps:get(percent, Conf, 0);
					  false->  lib_fight_rand:rand_float(maps:get(percent_l, Conf, 0),maps:get(percent_r, Conf, 0))
				  end,
	ConfValue = case maps:is_key(value,Conf) of
					  true ->  maps:get(value, Conf, 0);
					  false->  lib_fight_rand:rand_float(maps:get(value_l, Conf, 0),maps:get(value_r, Conf, 0))
				  end,
	lists:foreach(fun(V) ->
		if
			?PROP_PREFIX_FORMER =:= V ->
				Defender0 = lib_fight_data:get_fighter(Target),
				Former = Defender0#combat_hero.former,
				Hurt =
					case maps:get(percent_type, Conf, 0) of
						0 -> trunc(Former#combat_army.troops * ConfPercent + ConfValue);
						1 -> trunc(Former#combat_army.cur_troops * ConfPercent + ConfValue);
						2 -> trunc((Former#combat_army.troops - Former#combat_army.cur_troops) * ConfPercent + ConfValue);
						_ -> error(effect_percent_error_type)
					end,
				Hurt1 = trunc(Hurt * (1 + ADD)),
				lib_fight_api:recover_health(V, FightData#fight_data{target_object = Target, target_prefix = [V], value = Hurt1});
			?PROP_PREFIX_LATTER =:= V ->
				Defender1 = lib_fight_data:get_fighter(Target),
				Latter = Defender1#combat_hero.former,
				Hurt =
					case maps:get(percent_type, Conf, 0) of
						0 -> trunc(Latter#combat_army.troops * ConfPercent + ConfValue);
						1 -> trunc(Latter#combat_army.cur_troops * ConfPercent + ConfValue);
						2 -> trunc((Latter#combat_army.troops - Latter#combat_army.cur_troops) * ConfPercent + ConfValue);
						_ -> error(effect_percent_error_type)
					end,
				Hurt1 = trunc(Hurt * (1 + ADD)),
				lib_fight_api:recover_health(V, FightData#fight_data{target_object = Target, target_prefix = [V], value = Hurt1});
			true -> skip
		end
	end, TargetPrefix);

effect(?EFFECT_INSERT_BUFF, Conf, FightData, FightData1) ->
	Rate = lib_fight_api:get_skill_rate(FightData#fight_data.skill_id,Conf,FightData),
	Rand = lib_fight_rand:rand_float(),
	{Target, TargetPrefixList} = get_effect_target(Conf, FightData, FightData1),
	BuffList = maps:get(buff_list, Conf, []),
%%	?DEBUG("EFFECT_INSERT_BUFF ~p ~p ~p~n", [Target, TargetPrefixList, BuffList]),
	lists:foreach(fun(TargetPrefix) ->
		AddRate = lib_fight_buff:buff_value_c(Target, TargetPrefix, ?FIGHT_BUFF_TYPE_1008),
		AEffectDBuffRate = lib_fight_effect:get_target_effect_value(#fight_data{
			target_object = Target,
			target_prefix = TargetPrefix
		}, ?EFFECT_SKILL_A_BUFF_RATE),
		DEffectDBuffRate = lib_fight_effect:get_target_effect_value(#fight_data{
			target_object = ?OTHER(Target),
			target_prefix = TargetPrefix
		}, ?EFFECT_SKILL_D_BUFF_RATE),
		lists:foreach(fun(BuffId) ->
			BuffTypeRate = lib_fight_passive_skill:passive_effect_value(?EFFECT_SKILL_BUFF_TYPE_RATE,#fight_data{
				object = Target,
				prefix = TargetPrefix,
				target_object = FightData#fight_data.object,
				target_prefix = FightData#fight_data.prefix,
				skill_id = BuffId
			}),
			Type = lib_fight_buff:buff_ad_type(BuffId),
			?JUDGE_RETURN(lib_fight_api:buff_can_activity(FightData#fight_data{target_object = Target}, BuffId),0),
			Change_buff = lib_fight_data:get_change_buff(Target,BuffId),
			New_buff = case Change_buff of
						   false -> BuffId;
						   _ 	 -> Change_buff
					   end,
			case Type of
				?FIGHT_BUFF_AD_TYPE2 ->
					case Rand =<  Rate * (1 + AddRate + AEffectDBuffRate + DEffectDBuffRate + BuffTypeRate) of
						true ->
							lib_fight_buff:insert_buff(FightData#fight_data{target_object = Target, target_prefix = [TargetPrefix]}, New_buff);
						_ -> skip
					end;
				_ ->
					case Rand =< Rate * (1 + BuffTypeRate) of
						true ->
							lib_fight_buff:insert_buff(FightData#fight_data{target_object = Target, target_prefix = [TargetPrefix]}, New_buff);
						_ -> skip
					end
			end
		end, BuffList)
	end, TargetPrefixList);

effect(?EFFECT_REMOVE_BUFF, Conf, FightData, FightData1) ->
	Rate = lib_fight_api:get_skill_rate(FightData#fight_data.skill_id,Conf,FightData),
	Rand = lib_fight_rand:rand_float(),
	?JUDGE_RETURN(Rand < Rate, 0),
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	lib_fight_buff:rand_clean_buff(maps:get(value,Conf,-1),Target,TargetPrefix, maps:get(buff_type,Conf,1));

effect(?EFFECT_ATTACK_BACK, Conf, FightData, PassiveFightData) ->
	HurtTimes = maps:get(hurt_times, Conf, 1),
	HurtTimesAdd = maps:get(hurt_times_rand, Conf, []),
	{Target, TargetPrefix} =
		case maps:is_key(target_object, Conf) andalso maps:is_key(target, Conf) of
			true ->
				get_effect_target(Conf, FightData, PassiveFightData);
			_ ->
				{PassiveFightData#fight_data.object, PassiveFightData#fight_data.prefix}
		end,
	?JUDGE_RETURN(FightData#fight_data.object =/= Target, 0),
	Times = case erlang:length(HurtTimesAdd) < 2 of
				true ->
					HurtTimes;
				_ ->
					lib_fight_rand:rand(lists:nth(1,HurtTimesAdd),lists:nth(2,HurtTimesAdd))
			end,
	lib_fight_api:skill_hurt(Times, FightData#fight_data{
		target_object = Target,
		target_prefix = TargetPrefix,
		add_value = trunc(maps:get(value, Conf, 0)),
		passive_flag = false,
		target_passive_flag = false
	}, Conf);

effect(?EFFECT_IGNORE_DEFENCE_HURT, Conf, FightData, FightData1) ->
	?JUDGE_RETURN(lib_fight_rand:rand_float() =< maps:get(active_rand, Conf, 0), 0),
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	HurtTimes = maps:get(hurt_times, Conf, 1),
	HurtTimesAdd = maps:get(hurt_times_rand, Conf, []),
	Times = case erlang:length(HurtTimesAdd) < 2 of
				true ->
					HurtTimes;
				_ ->
					lib_fight_rand:rand(lists:nth(1,HurtTimesAdd),lists:nth(2,HurtTimesAdd))
			end,
%%	?DEBUG("effect EFFECT_COMMON_HURT ~p ~p~n", [Target, TargetPrefix]),
	lib_fight_api:skill_hurt(Times, FightData#fight_data{
		target_object = Target,
		target_prefix = TargetPrefix,
		ignore_defence = 1
	}, Conf),
	?JUDGE_RETURN(maps:is_key(buff_list, Conf), 0),
	effect(?EFFECT_INSERT_BUFF, Conf, FightData#fight_data{
		target_object = Target,
		target_prefix = TargetPrefix,
		related = true
	}, FightData1);

effect(?EFFECT_ADD_FIGHT_PROP, Conf, FightData, FightData1) ->
	{Target, _} = get_effect_target(Conf, FightData, FightData1),
	Fighter = lib_fight_data:get_fighter(Target),
	PropDict = lib_fight_prop:prop_dict_from_conf(Fighter#combat_hero.prop_base, Conf),
	FightProp = lib_fight_prop:increase_prop([PropDict, Fighter#combat_hero.fight_prop1]),
	lib_fight_data:put_fighter(Target, Fighter#combat_hero{fight_prop1 = special_effect_prop(Conf, FightProp)}),
	lib_fight_parsing:parsing_proto_effect(FightData);

effect(?EFFECT_ADD_ROUND_FIGHT_PROP, Conf, FightData, FightData1) ->
	{Target, _} = get_effect_target(Conf, FightData, FightData1),
	Fighter = lib_fight_data:get_fighter(Target),
	PropDict = lib_fight_prop:prop_dict_from_conf(Fighter#combat_hero.prop_base, Conf),
	FightProp = lib_fight_prop:increase_prop([PropDict, Fighter#combat_hero.fight_prop2]),
	lib_fight_data:put_fighter(Target, Fighter#combat_hero{fight_prop2 = special_effect_prop(Conf, FightProp)}),
	lib_fight_parsing:parsing_proto_effect(FightData);

effect(?EFFECT_ADD_ACTIVE_SKILL_FIGHT_PROP, Conf, FightData, FightData1) ->
	{Target, _} = get_effect_target(Conf, FightData, FightData1),
	Fighter = lib_fight_data:get_fighter(Target),
	PropDict = lib_fight_prop:prop_dict_from_conf(Fighter#combat_hero.prop_base, Conf),
	FightProp = lib_fight_prop:increase_prop([PropDict, Fighter#combat_hero.fight_prop3]),
	lib_fight_data:put_fighter(Target, Fighter#combat_hero{fight_prop3 = special_effect_prop(Conf, FightProp)}),
	lib_fight_parsing:parsing_proto_effect(FightData);

effect(?EFFECT_GROUP_SKILL_ADD_HURT, Conf, FightData, _) ->
	Group = maps:get(skill_group, Conf, 0),
	Percent = maps:get(value, Conf, 0),
	?JUDGE_RETURN(Group > 0 andalso Percent =/= 0, 0),
	lib_fight_data:add_group_skill_hurt(FightData#fight_data.object, Group, Percent),
	lib_fight_parsing:parsing_proto_effect(FightData);

effect(?EFFECT_SKILL_CHANGE_ACTIVE_ROUND, Conf, FightData, FightData1) ->
	{Target, _} = get_effect_target(Conf, FightData, FightData1),
	SkillGroup = maps:get(skill_group, Conf, 0),
	Round = maps:get(group_round, Conf, 0),
	RoundAdd = maps:get(group_round_add, Conf, 0),
	lib_fight_data:add_change_active_round_skill(Target, SkillGroup, Round, RoundAdd),
	lib_fight_parsing:parsing_proto_effect(FightData);

effect(?EFFECT_ITSELF_HURT, Conf, FightData, FightData1) ->
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	SkillData0 = lib_fight_data:get_skill_extra_data(FightData#fight_data.object, FightData#fight_data.skill_id),
	SkillData = case is_integer(SkillData0) of true -> SkillData0; _ -> 0 end,
	TotalLoss = lib_fight_data:get_total_loss(FightData#fight_data.object),
	SelfLoss = maps:get(self_loss, Conf, 0),
	TargetLoss  = maps:get(target_loss, Conf, 0),
	case TotalLoss - SkillData >= SelfLoss of
		true ->
			lib_fight_api:deduct_health(FightData#fight_data{
				target_object = Target,
				target_prefix = TargetPrefix,
				value = TargetLoss
			}, Conf),
			lib_fight_data:put_skill_extra_data(FightData#fight_data.object, FightData#fight_data.skill_id, SkillData + SelfLoss);
		_ ->
			skip
	end;
effect(?EFFECT_ITSELF_RETURN_HURT, Conf, FightData, FightData1) ->
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	SkillData0 = lib_fight_data:get_skill_extra_data(FightData#fight_data.object, FightData#fight_data.skill_id),
	SkillData = case is_integer(SkillData0) of true -> SkillData0; _ -> 0 end,
	?JUDGE_RETURN(SkillData < maps:get(times, Conf, 0), 0),
	TotalLoss = lib_fight_data:get_total_loss(FightData#fight_data.object),
	Percent = maps:get(percent, Conf, 0),
	Derate = lib_fight_passive_skill:passive_effect_value(?EFFECT_ITSELF_RETURN_HURT_DERATE, FightData),
	Hurt = trunc(Percent * TotalLoss * (1 - Derate)),
	lib_fight_api:deduct_health(FightData#fight_data{
		target_object = Target,
		target_prefix = TargetPrefix,
		value = Hurt
	}, Conf),
	lib_fight_data:put_skill_extra_data(FightData#fight_data.object, FightData#fight_data.skill_id, SkillData + 1);

effect(?EFFECT_FIXED_DAMAGE, Conf, FightData, FightData1) ->
	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
	lib_fight_api:deduct_health(FightData#fight_data{
		target_object = Target,
		target_prefix = TargetPrefix
	}, Conf);

effect(?EFFECT_ADD_AVOID_HURT_TIME, Conf, FightData, _FightData1) ->
	Rate = lib_fight_api:get_skill_rate(FightData#fight_data.skill_id,Conf,FightData),
	Rand = lib_fight_rand:rand_float(),
	?JUDGE_RETURN(Rand < Rate, 0),
	Object = FightData#fight_data.object,
	Time = maps:get(time,Conf,0),
	Target_prefix = case maps:get(target_prefix,Conf,0) of 1 -> ?PROP_PREFIX_HERO; 2 -> ?PROP_PREFIX_FORMER; 3 -> ?PROP_PREFIX_LATTER end,
	OldTime = lib_fight_data:get_avoid_hurt_time(Object,Target_prefix),
	lib_fight_data:put_avoid_hurt_time(Object,Target_prefix,OldTime + Time)
;

effect(?EFFECT_ADD_FIGHT_PROP_BY_FOUR_D, Conf, FightData, FightData1) ->
	Type = maps:get(type, Conf, 1),
	PropName = get_condition_str(?EFFECT_CONDITION_1, maps:get(four_d_type, Conf, 1)),
	L = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_fight_data:get_fighter_prop(FightData#fight_data.object)),
	R = case Type of
			1 -> lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_fight_data:get_fighter_prop(FightData#fight_data.target_object));
			2 -> maps:get(four_d_value, Conf)
		end,
	Value = maps:get(special_effect_prop_value, Conf, 0),
	case L > R of
		true ->
			New_value = min((Value * (R - L)),maps:get(max_value, Conf, 0)),
			NewConf = maps:put(special_effect_prop_value,New_value,Conf),
			{Target, _} = get_effect_target(Conf, FightData, FightData1),
			Fighter = lib_fight_data:get_fighter(Target),
			PropDict = lib_fight_prop:prop_dict_from_conf(Fighter#combat_hero.prop_base, Conf),
			FightProp = lib_fight_prop:increase_prop([PropDict, Fighter#combat_hero.fight_prop1]),
			lib_fight_data:put_fighter(Target, Fighter#combat_hero{fight_prop1 = special_effect_prop(NewConf, FightProp)}),
			lib_fight_parsing:parsing_proto_effect(FightData);
		false -> skip
	end;

effect(?EFFECT_COIN_TOSSING, Conf, FightData, _FightData1) ->
	Rate = lib_fight_api:get_skill_rate(FightData#fight_data.skill_id,Conf,FightData),
	Rand = lib_fight_rand:rand_float(),
	Effect_conf_list =
	case Rate > Rand of
		true  -> maps:get(r_conf,Conf,[]);
		false -> maps:get(l_conf,Conf,[])
	end,
	SkillId = FightData#fight_data.skill_id,
	ActiveObject = FightData#fight_data.object,
	lists:foreach(fun(EffectConf) ->
		ConfTrigger = maps:get(passive_trigger, tb_skill:get(SkillId), 0),
		?JUDGE_RETURN(lib_fight_passive_skill:check_trigger_flag(ConfTrigger, ActiveObject, SkillId, FightData, Conf), 0),
		?JUDGE_RETURN(lib_fight_api:round_can_active(SkillId, Conf), 0),
		?JUDGE_RETURN(lib_fight_api:trigger_hero(ActiveObject, SkillId), 0),
		lib_fight_passive_skill:passive_skill(ActiveObject, SkillId, FightData, EffectConf)
	end,Effect_conf_list)
;

effect(?EFFECT_DEFENSE_HURT, Conf, FightData, _FightData1) ->
	lib_fight_api:skill_hurt(1, FightData#fight_data{
		effect_type = ?EFFECT_DEFENSE_HURT,
		target_object = ?OTHER(FightData#fight_data.object),
		target_prefix = [?PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER]
	}, Conf);

effect(Undefined, _, _, _) ->
	?INFO("undefined fight effect type ~p~n", [Undefined]).

get_target(Object, Conf) ->
	TargetObject = maps:get(target_object, Conf, []),
	case TargetObject of
		1 -> ?OTHER(Object);
		2 -> Object;
		_ -> ?OTHER(Object)
	end.

get_condition_str(?EFFECT_CONDITION_1, Type) ->
	case Type of
		1 -> ?STRENGTH;
		2 -> ?INTELECT;
		3 -> ?SPIRIT;
		4 -> ?LEADERSHIP
	end;
get_condition_str(?EFFECT_CONDITION_3, Type) ->
	case Type of
		1 -> ?STRENGTH;
		2 -> ?INTELECT;
		3 -> ?SPIRIT;
		4 -> ?LEADERSHIP
	end;
get_condition_str(?EFFECT_CONDITION_5, Type) ->
	case Type of
		1 -> ?STRENGTH;
		2 -> ?INTELECT;
		3 -> ?SPIRIT;
		4 -> ?LEADERSHIP
	end;
get_condition_str(?EFFECT_CONDITION_9, Type) ->
	case Type of
		1 -> ?STRENGTH;
		2 -> ?INTELECT;
		3 -> ?SPIRIT;
		4 -> ?LEADERSHIP
	end;
get_condition_str(?EFFECT_CONDITION_14, Type) ->
	case Type of
		1 -> ?STRENGTH;
		2 -> ?INTELECT;
		3 -> ?SPIRIT;
		4 -> ?LEADERSHIP
	end;
get_condition_str(?EFFECT_CONDITION_16, Type) ->
	case Type of
		1 -> ?STRENGTH;
		2 -> ?INTELECT;
		3 -> ?SPIRIT;
		4 -> ?LEADERSHIP
	end;
get_condition_str(_,_) ->
	"".



effect_value(EffectType, FightData) ->
	try
		?JUDGE_RETURN(FightData#fight_data.type =:= ?CLIENT_EFFECT_TYPE1, 0),
		lists:foldl(fun(Conf, Acc) ->
			ConfEffectType = maps:get(effect, Conf),
			case ConfEffectType =:= EffectType andalso can_effect(FightData, Conf) of
				true -> Acc + maps:get(value, Conf);
				_ -> Acc
			end
		end, 0, lib_fight_config:skill_add_effect(FightData#fight_data.skill_id))
	catch
	    _:_  -> 0
	end.

effect_config(EffectType, FightData) ->
	try
		?JUDGE_RETURN(FightData#fight_data.type =:= ?CLIENT_EFFECT_TYPE1, 0),
		lists:foldl(fun(Conf, Acc) ->
			ConfEffectType = maps:get(effect, Conf),
			case ConfEffectType =:= EffectType andalso can_effect(FightData, Conf) of
				true -> [Conf | Acc];
				_ -> Acc
			end
		end, [], lib_fight_config:skill_add_effect(FightData#fight_data.skill_id))
	catch
		_:_  -> []
	end.

active_effect_tmp_prop(FightData) ->
	try
		?JUDGE_RETURN(FightData#fight_data.type =:= ?CLIENT_EFFECT_TYPE1, 0),
		lists:foldl(fun(Conf, Acc) ->
			ConfEffectType = maps:get(effect, Conf),
			case ConfEffectType =:= ?EFFECT_TMP_PROP andalso can_effect(FightData, Conf) of
				true ->
					PropName = maps:get(prop_type, Conf),
					PropVal = maps:get(value, Conf),
					lib_fight_prop:add_prop(PropName, PropVal, Acc);
				_ -> Acc
			end
		end, dict:new(), lib_fight_config:skill_add_effect(FightData#fight_data.skill_id))
	catch
		_:_  -> dict:new()
	end.

effect_tmp_prop(FightData0, Object) ->
	FightData =
	case FightData0#fight_data.object =:= Object of
		true -> FightData0;
		_ -> FightData0#fight_data{
			object = FightData0#fight_data.target_object,
			prefix = FightData0#fight_data.target_prefix,
			target_object = FightData0#fight_data.object,
			target_prefix = FightData0#fight_data.prefix
		}
	end,
	PropDict1 = active_effect_tmp_prop(FightData),
	PropDict2 = lib_fight_passive_skill:passive_effect_tmp_prop(FightData),
	case Object =:= FightData#fight_data.object of
		true ->
			lib_fight_prop:increase_prop([PropDict1, PropDict2]);
		_ ->
			PropDict2
	end.

get_self_effect_value(FightData, EffectType) ->
	Num1 = effect_value(EffectType, FightData),
	Num2 = lib_fight_passive_skill:passive_effect_value(EffectType, FightData),
	Num3 = active_effect_value(EffectType, FightData#fight_data.object),
	case FightData#fight_data.passive_flag of
		true ->
			Num1 + Num2 + Num3;
		_ -> Num1 + Num3
	end.

get_self_effect_config(FightData, EffectType) ->
	Conf1 = effect_config(EffectType, FightData),
	Conf2 = lib_fight_passive_skill:passive_effect_config(EffectType, FightData),
	Conf3 = active_effect_config(EffectType, FightData#fight_data.object),
	case FightData#fight_data.passive_flag of
		true -> lists:append(lists:append(Conf1, Conf2), Conf3);
		_ -> lists:append(Conf1, Conf3)
	end.

%%get_effect_multi_hurt(FightData) ->
%%	Num1 = effect_value(?EFFECT_ENHANCE_HURT, FightData),
%%	Num2 = lib_fight_passive_skill:passive_effect_value(?EFFECT_ENHANCE_HURT, FightData#fight_data.object),
%%	case FightData#fight_data.passive_flag of
%%		true ->
%%			Num1 + Num2;
%%		_ -> Num1
%%	end.

get_target_effect_value(FightData, EffectType) ->
	Num1 = lib_fight_passive_skill:passive_effect_value(EffectType, FightData#fight_data{
		object = FightData#fight_data.target_object,
		prefix = FightData#fight_data.target_prefix,
		target_object = FightData#fight_data.object,
		target_prefix = FightData#fight_data.prefix,
		skill_id = FightData#fight_data.skill_id
	}),
	Num2 = active_effect_value(EffectType, FightData#fight_data.target_object),
	case FightData#fight_data.target_passive_flag of
		true ->
			Num1 + Num2;
		_ -> Num2
	end.

get_target_effect_config(FightData, EffectType) ->
	Conf1 = lib_fight_passive_skill:passive_effect_config(EffectType, FightData#fight_data{
		object = FightData#fight_data.target_object,
		prefix = FightData#fight_data.target_prefix
	}),
	Conf2 = active_effect_config(EffectType, FightData#fight_data.target_object),
	case FightData#fight_data.passive_flag of
		true -> lists:append(Conf1, Conf2);
		_ -> Conf2
	end.

active_effect_value(EffectType, Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	FightData = #fight_data{object = Object, target_object = ?OTHER(Object)},
	lists:foldl(fun(SkillId, Acc) ->
		try
			?JUDGE_RETURN(lib_fight_config:is_active_skill(SkillId), 0),
			lists:foldl(fun(Conf, Acc1) ->
				%% todo 主动技能被动效果配回合数（看情况删除回合判断）
				case EffectType =:= maps:get(effect, Conf) andalso lib_fight_effect:can_effect(FightData, Conf)
					andalso lib_fight_api:round_can_active(Conf) of
					true -> Acc1 + maps:get(value, Conf);
					_ -> Acc1
				end
			end, Acc, lib_fight_config:active_skill_passive_effect(SkillId))
		catch
			_:_  -> Acc
		end
	end, 0, Fighter#combat_hero.skill_list).

active_effect_config(EffectType, Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	FightData = #fight_data{object = Object, target_object = ?OTHER(Object)},
	lists:foldl(fun(SkillId, Acc) ->
		try
			?JUDGE_RETURN(lib_fight_config:is_active_skill(SkillId), 0),
			lists:foldl(fun(Conf, Acc1) ->
				case EffectType =:= maps:get(effect, Conf) andalso lib_fight_effect:can_effect(FightData, Conf)
					andalso lib_fight_api:round_can_active(Conf) of
					true -> [Conf | Acc1];
					_ -> Acc1
				end
			end, Acc, lib_fight_config:active_skill_passive_effect(SkillId))
		catch
			_:_  -> Acc
		end
	end, [], Fighter#combat_hero.skill_list).

get_effect_certainly_crit(FightData) ->
	have_type_effect(?EFFECT_CERTAINLY_CRIT, FightData).


have_type_effect(EffectType, FightData) ->
	try
		?JUDGE_RETURN(FightData#fight_data.type =:= ?CLIENT_EFFECT_TYPE1, 0),
		lists:foreach(fun(Conf) ->
			ConfEffectType = maps:get(effect, Conf),
			case ConfEffectType =:= EffectType andalso can_effect(FightData, Conf) of
				true -> throw(true);
				_ -> skip
			end
		end, lib_fight_config:skill_add_effect(FightData#fight_data.skill_id)),
		Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
		lists:foreach(fun(SkillId) ->
			try
				?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
				ConfTrigger = maps:get(passive_trigger, tb_skill:get(SkillId), 0),
				?JUDGE_RETURN(ConfTrigger =:= ?PASSIVE_SKILL_TRIGGER_0, false),
				lists:foreach(fun(Conf) ->
					case EffectType =:= maps:get(effect, Conf) andalso lib_fight_effect:can_effect(FightData, Conf)
						andalso lib_fight_api:round_can_active(SkillId, Conf) of
						true -> throw(true);
						_ -> skip
					end
				end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
			catch
				throw:{error,_} -> skip;
				_:_  -> throw(true)
			end
		end, Fighter#combat_hero.skill_list),
		false
	catch
		_:_  -> true
	end.


can_effect(FightData, Conf) ->
	Condition = maps:get(condition, Conf, 0),
	Condition_list = maps:get(condition_list, Conf, []),
	Condition_list_ok = lists:foldl(fun(Conf1 ,_Acc) ->
		Condition1 = maps:get(condition, Conf1, 0),
		try
			case effect_condition(Condition1, FightData, Conf1) of
				true -> true;
				false-> throw(false)
			end
		catch
			_:_ -> throw(false)
		end
	end, true, Condition_list),
	effect_condition(Condition, FightData, Conf) andalso Condition_list_ok.

effect_condition(?EFFECT_CONDITION_0, _FightData, _Conf) ->
	true;
effect_condition(?EFFECT_CONDITION_1, FightData, Conf) ->
	Name = get_condition_str(?EFFECT_CONDITION_1, maps:get(condition_type, Conf, 1)),
	TargetConfList = lib_fight_passive_skill:passive_target_effect_config(?EFFECT_SPECIAL_COMPETE_FOUR_D, FightData),
	ConfList = lib_fight_passive_skill:passive_effect_config(?EFFECT_SPECIAL_COMPETE_FOUR_D, FightData),
	try
		lists:foreach(fun(EConf) ->
			Value = maps:get(value, EConf),
			case Value =:= 0 of
				true -> throw(ok);
				_ -> skip
			end
		end, TargetConfList),
	    lists:foreach(fun(EConf) ->
			Value = maps:get(value, EConf),
			Name0 = get_condition_str(?EFFECT_CONDITION_1, Value),
			case lib_fight_api:compete_4d_prop(FightData#fight_data.object, FightData#fight_data.target_object, Name0) of
				true -> throw(ok);
				_ -> skip
			end
		end, ConfList),
		lib_fight_api:compete_4d_prop(FightData#fight_data.object, ?OTHER(FightData#fight_data.object), Name)
	catch
	    _:_  -> true
	end;
effect_condition(?EFFECT_CONDITION_2, FightData, _) ->
	lib_fight_api:compete_force(FightData#fight_data.object, FightData#fight_data.target_object);
effect_condition(?EFFECT_CONDITION_3, FightData, Conf) ->
	TargetConfList = lib_fight_passive_skill:passive_target_effect_config(?EFFECT_SPECIAL_COMPETE_FOUR_D, FightData),
	try
		lists:foreach(fun(EConf) ->
			Value = maps:get(value, EConf),
			case Value =:= 0 of
				true -> throw(ok);
				_ -> skip
			end
		end, TargetConfList),
		PropName = get_condition_str(?EFFECT_CONDITION_3, maps:get(condition_type, Conf, 1)),
		L = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_fight_data:get_fighter_prop(FightData#fight_data.target_object)),
		R = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_fight_data:get_fighter_prop(FightData#fight_data.object)),
		Type =  maps:get(condition_type, Conf, 0),
		case Type of
			 0 -> L > R;
			 1 -> L < R;
			 2 -> L =:= R;
			 3 -> L >= R;
			 4 -> L =< R
		end
	catch
		_:_  -> true
	end
;
effect_condition(?EFFECT_CONDITION_4, FightData, _) ->
	lib_fight_api:compete_force(FightData#fight_data.target_object, FightData#fight_data.object);
effect_condition(?EFFECT_CONDITION_5, FightData, Conf) ->
	Name = get_condition_str(?EFFECT_CONDITION_5, maps:get(condition_type, Conf, 0)),
	FourDFlag = case Name of
					 0 -> true;
					 _ -> lib_fight_api:compete_4d_prop(FightData#fight_data.object, FightData#fight_data.target_object, Name)
				end,
	DFighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	Sex = maps:get(condition_value, Conf, 0),
	HeroSexFlag = case Sex of
					  0 -> true;
					  _ -> lib_fight_api:hero_sex(DFighter, DFighter#combat_hero.is_robot) =:= Sex
				  end,
	FourDFlag andalso HeroSexFlag;
effect_condition(?EFFECT_CONDITION_6, FightData, Conf) ->
	lib_fight_api:compete_4d_total_prop(FightData#fight_data.object, FightData#fight_data.target_object, maps:get(type,Conf,0));
effect_condition(?EFFECT_CONDITION_7, FightData, Conf) ->
	ConfTimes = maps:get(condition_times, Conf, 0),
	Times = lib_fight_data:get_skill_active_times(FightData#fight_data.object, FightData#fight_data.skill_id),
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	Max = Fighter#combat_hero.former#combat_army.troops + Fighter#combat_hero.latter#combat_army.troops,
	Cur = Fighter#combat_hero.former#combat_army.cur_troops + Fighter#combat_hero.latter#combat_army.cur_troops,
	Value = maps:get(condition_value, Conf, 1),
	Cur / Max < Value andalso (Times < ConfTimes orelse ConfTimes =:= 0);
effect_condition(?EFFECT_CONDITION_8, FightData, Conf) ->
	Fighter = lib_fight_data:get_fighter(?OTHER(FightData#fight_data.object)),
	Value = maps:get(condition_value, Conf, 0),
	case Value of
		0 -> not Fighter#combat_hero.is_robot;
		1 -> Fighter#combat_hero.is_robot;
		_ -> false
	end;
effect_condition(?EFFECT_CONDITION_9, FightData, Conf) ->
	Name1 = get_condition_str(?EFFECT_CONDITION_9, maps:get(condition_type1, Conf, 1)),
	Name2 = get_condition_str(?EFFECT_CONDITION_9, maps:get(condition_type2, Conf, 1)),
	lib_fight_api:compete_4d_prop(FightData#fight_data.object, FightData#fight_data.target_object, Name1) orelse
		lib_fight_api:compete_4d_prop(FightData#fight_data.object, FightData#fight_data.target_object, Name2);
effect_condition(?EFFECT_CONDITION_10, FightData, _Conf) ->
	lib_fight_api:compete_army_amount(FightData#fight_data.object, FightData#fight_data.target_object);
effect_condition(?EFFECT_CONDITION_11, FightData, _Conf) ->
	lib_fight_api:compete_army_amount(FightData#fight_data.target_object, FightData#fight_data.object);
effect_condition(?EFFECT_CONDITION_12, FightData, _) ->
	not lib_fight_api:compete_force(FightData#fight_data.target_object, FightData#fight_data.object);
effect_condition(?EFFECT_CONDITION_13, FightData, Conf) ->
	ConfTimes = maps:get(condition_times, Conf, 1),
	Times = lib_fight_data:get_skill_round_active_times(FightData#fight_data.object, FightData#fight_data.skill_id),
	Times < ConfTimes;
effect_condition(?EFFECT_CONDITION_14, FightData, Conf) ->
	Name1 = get_condition_str(?EFFECT_CONDITION_14, maps:get(condition_type1, Conf, 1)),
	NumConf = maps:get(condition_type2, Conf, 1),
	Num = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, Name1, lib_fight_data:get_fighter_prop(FightData#fight_data.object)),
	Value = maps:get(condition_value, Conf, 0),
	case Value of
		0 -> Num > NumConf;
		1 -> Num < NumConf;
		2 -> Num =:= NumConf;
		_ -> false
	end;

effect_condition(?EFFECT_CONDITION_15, FightData, Conf) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	SkillGroup = maps:get(condition_type1, Conf, 1),
	SkillLevel = maps:get(condition_type2, Conf, 1),
	Lvl = lib_fight_api:get_group_skill_level(SkillGroup, Fighter#combat_hero.skill_list),
	Lvl >= SkillLevel;
effect_condition(?EFFECT_CONDITION_16, FightData, Conf) ->
	Name = get_condition_str(?EFFECT_CONDITION_1, maps:get(condition_type, Conf, 1)),
	TargetConfList = lib_fight_passive_skill:passive_target_effect_config(?EFFECT_SPECIAL_COMPETE_FOUR_D, FightData),
	ConfList = lib_fight_passive_skill:passive_effect_config(?EFFECT_SPECIAL_COMPETE_FOUR_D, FightData),
	try
		lists:foreach(fun(EConf) ->
			Value = maps:get(value, EConf),
			case Value =:= 0 of
				true -> throw(ok);
				_ -> skip
			end
		end, TargetConfList),
		lists:foreach(fun(EConf) ->
			Value = maps:get(value, EConf),
			Name0 = get_condition_str(?EFFECT_CONDITION_1, Value),
			case lib_fight_api:compete_4d_prop(FightData#fight_data.object, FightData#fight_data.target_object, Name0) andalso
				lib_fight_api:compete_army_amount(FightData#fight_data.object, FightData#fight_data.target_object) of
				true -> throw(ok);
				_ -> skip
			end
		end, ConfList),
		lib_fight_api:compete_4d_prop(FightData#fight_data.object, FightData#fight_data.target_object, Name) andalso
			lib_fight_api:compete_army_amount(FightData#fight_data.object, FightData#fight_data.target_object)
	catch
		_:_  -> true
	end;
effect_condition(?EFFECT_CONDITION_17, FightData, Conf) ->
	Target_object_skill_level = (FightData#fight_data.skill_id rem 1000),
	Object_skill_level = maps:get(skill_level,Conf,0),
	Value = maps:get(condition_value, Conf, 0),
	case Value of
		0 -> Object_skill_level > Target_object_skill_level;
		1 -> Object_skill_level < Target_object_skill_level;
		2 -> Object_skill_level =:= Target_object_skill_level;
		_ -> false
	end
;

effect_condition(?EFFECT_CONDITION_18, FightData, Conf) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	Hero_win_time = Fighter#combat_hero.hero_win_time,
	Hero_win_time =< maps:get(condition_type1,Conf,0)
;
effect_condition(?EFFECT_CONDITION_19, FightData, Conf) ->
	L_Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	R_Fighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	L_sex = lib_fight_api:hero_sex(L_Fighter, L_Fighter#combat_hero.is_robot),
	R_sex = lib_fight_api:hero_sex(R_Fighter, R_Fighter#combat_hero.is_robot),
	Type = maps:get(condition_type1,Conf,0),
	case Type of
		0 -> L_sex =:= R_sex;
		1 -> L_sex =/= R_sex
	end
;
effect_condition(?EFFECT_CONDITION_20, FightData, Conf) ->
	Type1 = maps:get(condition_type1,Conf,0),
	Type2 = maps:get(condition_type2,Conf,0),
	CombatQueue = lib_fight_data:get_combat_queue(),
	FightType1 = CombatQueue#combat_queue_detail.type,
	FightType2 = FightData#fight_data.object,
	(Type1 =:= FightType1 orelse Type1 =:= 0)
		andalso
	(Type2 =:= FightType2 orelse Type2 =:= 0)
;
effect_condition(?EFFECT_CONDITION_21, FightData, Conf) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	Need = maps:get(condition_value,Conf),
	lib_hero_api:hero_color(Fighter#combat_hero.hero_star) =:= Need
;
effect_condition(?EFFECT_CONDITION_22, FightData, Conf) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	Max = Fighter#combat_hero.former#combat_army.troops + Fighter#combat_hero.latter#combat_army.troops,
	Cur = Fighter#combat_hero.former#combat_army.cur_troops + Fighter#combat_hero.latter#combat_army.cur_troops,
	Value = maps:get(condition_value, Conf, 1),
	Cur / Max < Value
;

effect_condition(_, _FightData, _Conf) ->
	false.

is_no_passive_effect(SkillId) ->
	lists:foldl(fun(Conf, Acc) ->
		EffectType = maps:get(effect, Conf, ?EFFECT_COMMON_HURT),
		case EffectType =:= ?EFFECT_IGNORE_PASSIVE of
			true ->
				false;
			_ ->
				Acc
		end
	end, true, lib_fight_config:skill_add_effect(SkillId)).


get_effect_target(Conf, FightData, FightData1) ->
	case FightData#fight_data.related of
		true -> {FightData#fight_data.target_object, FightData#fight_data.target_prefix};
		_ -> {get_target(FightData#fight_data.object, Conf),
			get_target_prefix(Conf, FightData, FightData1)}
	end.

get_target_prefix(Conf, FightData, FightData1) ->
	Data = lib_fight_passive_skill:check_passive_effect(?EFFECT_SKILL_CHANGE_TARGET_OBJECT, FightData),
	case is_list(Data) of
		true -> Data;
		_ -> lib_fight_config:skill_target(Conf, FightData#fight_data.skill_id, FightData1)
	end.

related_effect(FightData, Conf) ->
	EffectList = maps:get(related_effect, Conf, []),
	lists:foreach(fun(Conf0) ->
		effect(Conf0, FightData#fight_data{related = true})
	end, EffectList).

special_effect_prop(Conf, PropDict) ->
	case maps:is_key(special_effect_prop, Conf) of
		true ->
			Name = lib_types:to_atom(maps:get(special_effect_prop, Conf)),
			Value = maps:get(special_effect_prop_value, Conf, 0),
			OldValue = ?DICT_FETCH(Name, PropDict, 0),
			dict:store(Name, Value + OldValue, PropDict);
		_ ->
			PropDict
	end.