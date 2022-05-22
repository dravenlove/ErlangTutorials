%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 9月 2021 11:07
%%%-------------------------------------------------------------------
-module(lib_field_fight_effect).
-include("fight_effect.hrl").
-include("fight_prop.hrl").
-include("fight_buff.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("common.hrl").
-author("df").

%%%% API
%%-export([
%%	effect/2
%%]).
%%
%%effect(Conf, FightData) ->
%%	?INFO("1221212"),
%%	effect(Conf, FightData, #fight_data{}).
%%effect(Conf, FightData, PassiveFightData) ->
%%	try
%%		?JUDGE_RETURN(can_effect(FightData, Conf), 0),
%%		Condition = maps:get(condition, Conf, 0),
%%		ConditionStr = get_condition_str(Condition, maps:get(condition_type, Conf, 1)),
%%		ConditionVal = maps:get(condition_value, Conf, 0),
%%		EffectType = maps:get(effect, Conf, ?EFFECT_COMMON_HURT),
%%		{A,B} = lib_fight_data:get_cur_round(),
%%		?INFO("~p 阶段 ~p 回合",[A,B]),
%%		?INFO("释放 Skill ~p",[FightData#fight_data.skill_id]),
%%		?INFO("object ~p",[FightData#fight_data.object]),
%%		?INFO("prefix ~p",[FightData#fight_data.prefix]),
%%		?INFO("target_object ~p",[FightData#fight_data.target_object]),
%%		?INFO("target_prefix ~p",[FightData#fight_data.target_prefix]),
%%		?INFO("EffectType ~p",[EffectType]),
%%		?INFO("飘字 ~p",[FightData#fight_data.flag]),
%%
%%		effect(EffectType, Conf, FightData#fight_data{
%%			effect_type = EffectType,
%%			condition = Condition,
%%			condition_str = ConditionStr,
%%			condition_value = ConditionVal
%%		}, PassiveFightData)
%%	catch
%%		throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
%%		throw:next_round -> ?NEXT_ROUND(true);
%%		throw:skip_skill -> ?NEXT_SKILL(true);
%%		throw:_ -> ok;
%%		_:Reason  -> ?DEBUG("fight effect ~p~n~p", [Reason, erlang:get_stacktrace()]), ok
%%	end.
%%
%%effect(?EFFECT_COMMON_HURT, Conf, FightData, FightData1) ->
%%	?JUDGE_RETURN(lib_fight_rand:rand_float() =< maps:get(active_rand, Conf, 1), 0),
%%%%	TargetPrefix = lib_fight_config:skill_target(Conf, FightData#fight_data.skill_id),
%%%%	Target = get_target(FightData#fight_data.object, Conf),
%%	{Target, TargetPrefix} = get_effect_target(Conf, FightData, FightData1),
%%	HurtTimes = maps:get(hurt_times, Conf, 0),
%%	HurtTimesAdd = maps:get(hurt_times_rand, Conf, []),
%%	Times = case erlang:length(HurtTimesAdd) < 2 of
%%				true ->
%%					HurtTimes;
%%				_ ->
%%					lib_fight_rand:rand(lists:nth(1,HurtTimesAdd),lists:nth(2,HurtTimesAdd))
%%			end,
%%	PassiveAddTimes = lib_fight_passive_skill:check_passive_effect(?EFFECT_SKILL_ADD_HURT_TIMES, #fight_data{
%%		object = FightData#fight_data.object,
%%		prefix = FightData#fight_data.prefix,
%%		skill_id = FightData#fight_data.skill_id
%%	}),
%%	lib_fight_api:skill_hurt(Times + PassiveAddTimes, FightData#fight_data{
%%		target_object = Target,
%%		target_prefix = TargetPrefix
%%	}, Conf),
%%	?JUDGE_RETURN(maps:is_key(buff_list, Conf), 0),
%%	effect(?EFFECT_INSERT_BUFF, Conf, FightData#fight_data{
%%		target_object = Target,
%%		target_prefix = TargetPrefix,
%%		related = true,
%%		flag = ?EFFECT_NO_TIPS
%%	}, FightData1);
%%%%
%%.