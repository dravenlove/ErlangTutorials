%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_passive_skill.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_passive_skill).
-include("fight_effect.hrl").
-include("fight_prop.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").
-include("fight_buff.hrl").
-include("common.hrl").
%% API
-export([
	check_passive_skill/4,			%% 检查被动技能（XL）
	passive_effect_value/2,			%% 被动技能数值（XL）
	passive_effect_config/2,		%% 读配置获得被动技能效果（XL）
	is_have_passive_effect/2,
	passive_effect_tmp_prop/1,
	check_passive_effect/2,
	is_be_invalid/1,
	passive_skill/4,
	passive_target_effect_config/2,
	validation_passive_effect/4
]).
check_passive_skill(TriggerTime, ActiveObject, FightData, Flag) ->
	try
	    ?JUDGE_RETURN(Flag, 0),
		?JUDGE_RETURN(FightData#fight_data.effect_type =/= ?EFFECT_SKILL_NULLIFY, 0),
		?JUDGE_RETURN(FightData#fight_data.is_be_invalid =/= true, 0),
		check_passive_skill_done(TriggerTime, ActiveObject, FightData)
	catch
		throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
		throw:next_round -> ?NEXT_ROUND(true);
		throw:skip_skill -> ?NEXT_SKILL(true);
	    _:_  -> ok
	end.
check_passive_skill_done(TriggerTime, ActiveObject, FightData) ->
	Fighter = lib_fight_data:get_fighter(ActiveObject),
%%	?INFO("TriggerTime ~p",[TriggerTime]),
	lists:foreach(fun(SkillId) ->
		try
%%			?INFO("passive SkillId ~p",[SkillId]),
			%% 判断是否被禁止发动
			?JUDGE_RETURN(lib_fight_api:skill_can_launch(SkillId,ActiveObject), 0),
			?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
			Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
			?JUDGE_RETURN(Prefix =:= FightData#fight_data.prefix orelse Prefix =:= ?PROP_PREFIX_HERO
				orelse FightData#fight_data.prefix =:= undefined, 0),
			ConfTriggerTime = maps:get(trigger_time, tb_skill:get(SkillId), 0),
			?JUDGE_RETURN(ConfTriggerTime =:= TriggerTime, false),
			lists:foreach(fun(Conf) ->
				ConfTrigger = maps:get(passive_trigger, tb_skill:get(SkillId), 0),
				?JUDGE_RETURN(check_trigger_flag(ConfTrigger, ActiveObject, SkillId, FightData, Conf), 0),
				?JUDGE_RETURN(lib_fight_api:round_can_active(SkillId, Conf), 0),
				?JUDGE_RETURN(lib_fight_api:trigger_hero(ActiveObject, SkillId), 0),
				passive_skill(ActiveObject, SkillId, FightData, Conf),
				lib_fight_data:add_skill_active_times(ActiveObject, SkillId),
				lib_fight_data:add_skill_round_active_times(ActiveObject, SkillId)
			end, lib_fight_config:passive_skill_effect(SkillId,ActiveObject))
		catch
			throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
			throw:next_round -> ?NEXT_ROUND(true);
			throw:skip_skill -> ?NEXT_SKILL(true);
			throw:_ -> skip;
			_:Reason  -> ?DEBUG("~p ~p~n", [Reason, erlang:get_stacktrace()]), skip
		end
	end, Fighter#combat_hero.skill_list).

is_be_invalid(FightData) ->
	Target_object = FightData#fight_data.target_object,
	Fighter = lib_fight_data:get_fighter(Target_object),
	is_be_invalid(FightData,Fighter#combat_hero.skill_list)
.
is_be_invalid(FightData,[SkillId|Skill_list]) ->
	Target_object = FightData#fight_data.target_object,
		try
			?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
			lists:foreach(fun(Conf) ->
				?JUDGE_RETURN(maps:get(effect,Conf) =:= ?EFFECT_SKILL_NULLIFY,0),
				ObjectConfig = tb_skill:get(FightData#fight_data.skill_id),
				%% 技能类型
				?JUDGE_RETURN(maps:get(skill_type,ObjectConfig,0) =:= maps:get(object_skill_type,Conf),0),
				%% 能否触发
				?JUDGE_RETURN(lib_fight_effect:can_effect(FightData, Conf),0),
				%% 随机
				Rate = lib_fight_api:get_skill_rate(FightData#fight_data.skill_id,Conf,FightData),
				Rand = lib_fight_rand:rand_float(),
				?JUDGE_RETURN(Rate > Rand,0),
				ConfTimes = maps:get(time, Conf, 1),
				Times = lib_fight_data:get_skill_active_times(Target_object, FightData#fight_data.skill_id),
				?JUDGE_RETURN(Times < ConfTimes,0),
				throw({true, Conf})
			end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object)),
			throw({skip})
		catch
			throw:{true,Conf} -> {true,Conf,SkillId};
			throw:_  -> is_be_invalid(FightData,Skill_list)
		end
;
is_be_invalid(_FightData,[]) ->
	{false,0,0}
.
%% 被动技能
passive_skill(ActiveObject, SkillId, FightData, Conf) ->
	try
%%		?INFO("active passive skill ~p~n  ~p~n  ~p~n", [ActiveObject, SkillId,Conf]),
%%		?INFO("cur_round  ~p",[lib_fight_data:get_cur_round()]),
		lib_fight_effect:effect(Conf, #fight_data{
			type = ?CLIENT_EFFECT_TYPE1,
			object = ActiveObject,
			prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
			skill_id = SkillId,
			target_object = lib_fight_config:skill_target_object(ActiveObject, Conf),
			target_prefix = lib_fight_config:skill_target(Conf, SkillId, FightData),
			flag = ?EFFECT_TIPS
		}, FightData)
	catch
		throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
		throw:next_round -> ?NEXT_ROUND(true);
		throw:skip_skill -> ?NEXT_SKILL(true);
		throw:_ -> skip;
		_:Reason  -> ?ERROR("passive skill effect error reason:~p~n~p", [Reason, erlang:get_stacktrace()])
	end.

passive_effect_tmp_prop(FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
			Prefix = lib_fight_api:skill_prefix(FightData#fight_data.object, SkillId),
			?JUDGE_RETURN(Prefix =:= FightData#fight_data.prefix orelse Prefix =:= ?PROP_PREFIX_HERO, 0),
			lists:foldl(fun(Conf, Acc1) ->
				case ?EFFECT_TMP_PROP =:= maps:get(effect, Conf) andalso lib_fight_effect:can_effect(FightData, Conf)
					andalso lib_fight_api:round_can_active(SkillId, Conf) andalso passive_can_effect(FightData, Conf) of
					true ->
						PropName = maps:get(prop_type, Conf),
						PropVal = maps:get(value, Conf),
						lib_fight_prop:add_prop(PropName, PropVal, Acc1);
					_ -> Acc1
				end
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, dict:new(), Fighter#combat_hero.skill_list).

add_value_effect(?EFFECT_IGNORE_DEFENCE, Object, FightData, SkillId) ->
	lib_fight_passive_skill:check_passive_effect(?EFFECT_IGNORE_DEFENCE_ADD_VALUE, FightData#fight_data{
		object = Object,
		skill_id = SkillId
	});
add_value_effect(_, _, _, _) ->
	0.

passive_effect_value(?EFFECT_SKILL_BUFF_TYPE_RATE, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				BuffId = FightData#fight_data.skill_id,
				?JUDGE_RETURN(maps:get(type, tb_buff:get(BuffId)) =:= maps:get(buff_type,Conf),0),
				case validation_passive_effect(?EFFECT_SKILL_BUFF_TYPE_RATE, SkillId, Conf, FightData) of
					true ->
						after_passive_effect(?EFFECT_SKILL_BUFF_TYPE_RATE, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
						Acc1 + maps:get(value, Conf, 0);
					_ -> Acc1
				end
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, 0, Fighter#combat_hero.skill_list);

passive_effect_value(?EFFECT_IMMUNE_PERCENT_HURT, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				case validation_passive_effect(?EFFECT_IMMUNE_PERCENT_HURT, SkillId, Conf, FightData) of
					true ->
						after_passive_effect(?EFFECT_IMMUNE_PERCENT_HURT, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
						Acc1 + maps:get(value, Conf, 0);
					_ -> Acc1
				end
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, 0, Fighter#combat_hero.skill_list);

passive_effect_value(?EFFECT_SKILL_ADD_OR_CUR_ROUND, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	SKillConf = tb_skill:get(FightData#fight_data.skill_id),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				?JUDGE_RETURN(maps:get(effect,Conf) =:= ?EFFECT_SKILL_NO_LAUNCH,0),
				Active_passive = maps:get(active_passive,Conf,0),
				?JUDGE_RETURN(maps:get(active_passive,SKillConf) =:= Active_passive orelse Active_passive =:= 0,0),
				Skill_type = maps:get(skill_type,Conf,0),
				?JUDGE_RETURN(maps:get(skill_type,SKillConf) =:= Skill_type orelse Skill_type =:= 0,0),
				Skill_type_add = maps:get(skill_type_add,Conf,0),
				?JUDGE_RETURN(maps:get(skill_type_add,SKillConf) =:= Skill_type_add orelse Skill_type_add =:= 0,0),
				Round = maps:get(round,Conf,0),
				?JUDGE_RETURN(maps:get(round,SKillConf) =:= Round orelse Round =:= 0,0),
				Acc1 + maps:get(value,Conf,0)
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, 0, Fighter#combat_hero.skill_list);

passive_effect_value(?EFFECT_ITSELF_RETURN_HURT_DERATE, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				case validation_passive_effect(?EFFECT_ITSELF_RETURN_HURT_DERATE, SkillId, Conf, FightData) of
					true ->
						after_passive_effect(?EFFECT_ITSELF_RETURN_HURT_DERATE, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
						Acc1 + maps:get(value, Conf, 0);
					_ -> Acc1
				end
						end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, 0, Fighter#combat_hero.skill_list);

passive_effect_value(EffectType, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				case validation_passive_effect(EffectType, SkillId, Conf, FightData) of
					true ->
						after_passive_effect(EffectType, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
						AddValue = add_value_effect(EffectType, FightData#fight_data.object, FightData, SkillId),
						Acc1 + maps:get(value, Conf, 0) + AddValue;
					_ -> Acc1
				end
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, 0, Fighter#combat_hero.skill_list).

passive_effect_config(EffectType, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				case validation_passive_effect(EffectType, SkillId, Conf, FightData) of
					true ->
						after_passive_effect(EffectType, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
						[Conf | Acc1];
					_ -> Acc1
				end
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, [], Fighter#combat_hero.skill_list).

passive_target_effect_config(EffectType, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			lists:foldl(fun(Conf, Acc1) ->
				case validation_passive_effect(EffectType, SkillId, Conf, FightData) of
					true ->
						after_passive_effect(EffectType, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
						[Conf | Acc1];
					_ -> Acc1
				end
			end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
		catch
			_:_  -> Acc
		end
	end, [], Fighter#combat_hero.skill_list).

is_have_passive_effect(EffectType, FightData) ->
	try
		Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
		lists:foreach(fun(SkillId) ->
			try
				lists:foreach(fun(Conf) ->
					case validation_passive_effect(EffectType, SkillId, Conf, FightData) of
						true ->
							after_passive_effect(EffectType, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
							throw({ok});
						_ ->
							skip
					end
				end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object)),
				false
			catch
				throw:{ok} -> throw({ok});
				_:_  -> false
			end
		end, Fighter#combat_hero.skill_list)
	catch
		throw:{ok} -> true;
		_:_  -> false
	end.

check_trigger_flag(Trigger, ActiveObject, SkillId, FightData, Conf) ->
	try
		check_trigger(Trigger, ActiveObject, SkillId, FightData, Conf)
	catch
		_:_Reason  ->
%%			?DEBUG("check_trigger_flag ~p ~p~n", [Reason, erlang:get_stacktrace()]),
			false
	end.

check_trigger(?PASSIVE_SKILL_TRIGGER_0, _, _, _, _) ->
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_1, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	if
		Trigger1 =:= 0 -> ?JUDGE_RETURN(Prefix =:= FightData#fight_data.prefix, 0);
		Trigger1 =:= 1 -> ?JUDGE_RETURN(?PROP_PREFIX_FORMER =:= FightData#fight_data.prefix, 0);
		Trigger1 =:= 2 -> ?JUDGE_RETURN(?PROP_PREFIX_LATTER =:= FightData#fight_data.prefix, 0);
		Trigger1 =:= 3 -> ?JUDGE_RETURN(?PROP_PREFIX_HERO =:= FightData#fight_data.prefix, 0);
		true -> skip
	end,
	if
		Trigger2 =:= 1 ->
			?JUDGE_RETURN(?PROP_PREFIX_FORMER =:= FightData#fight_data.prefix orelse
				lists:member(?PROP_PREFIX_FORMER, FightData#fight_data.target_prefix), 0);
		Trigger2 =:= 2 -> ?JUDGE_RETURN(?PROP_PREFIX_LATTER =:= FightData#fight_data.prefix orelse
			lists:member(?PROP_PREFIX_LATTER, FightData#fight_data.target_prefix), 0);
		Trigger2 =:= 3 -> ?JUDGE_RETURN(?PROP_PREFIX_HERO =:= FightData#fight_data.prefix orelse
			lists:member(?PROP_PREFIX_HERO, FightData#fight_data.target_prefix), 0);
		true -> skip
	end,
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_2, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =/= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	if
		Trigger1 =:= 0 ->
			?JUDGE_RETURN(Prefix =:= FightData#fight_data.prefix orelse
				lists:member(Prefix, FightData#fight_data.target_prefix), 0);
		Trigger1 =:= 1 ->
			?JUDGE_RETURN(?PROP_PREFIX_FORMER =:= FightData#fight_data.prefix orelse
				lists:member(?PROP_PREFIX_FORMER, FightData#fight_data.target_prefix), 0);
		Trigger1 =:= 2 -> ?JUDGE_RETURN(?PROP_PREFIX_LATTER =:= FightData#fight_data.prefix orelse
			lists:member(?PROP_PREFIX_LATTER, FightData#fight_data.target_prefix), 0);
		Trigger1 =:= 3 -> ?JUDGE_RETURN(?PROP_PREFIX_HERO =:= FightData#fight_data.prefix orelse
			lists:member(?PROP_PREFIX_HERO, FightData#fight_data.target_prefix), 0);
		true -> skip
	end,
	if
		Trigger2 =:= 1 -> ?JUDGE_RETURN(?PROP_PREFIX_FORMER =:= FightData#fight_data.prefix, 0);
		Trigger2 =:= 2 -> ?JUDGE_RETURN(?PROP_PREFIX_LATTER =:= FightData#fight_data.prefix, 0);
		Trigger2 =:= 3 -> ?JUDGE_RETURN(?PROP_PREFIX_HERO =:= FightData#fight_data.prefix, 0);
		true -> skip
	end,
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_3, ActiveObject, SkillId, FightData, _Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
	?JUDGE_RETURN(Prefix, FightData#fight_data.prefix),
	?JUDGE_RETURN(lib_fight_data:attack_times(ActiveObject, FightData#fight_data.prefix) =:= 1, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_4, ActiveObject, SkillId, FightData, _Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
	?JUDGE_RETURN(Prefix, FightData#fight_data.prefix),
	?JUDGE_RETURN(lib_fight_data:active_attack_times(ActiveObject, FightData#fight_data.prefix) =:= 1, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_5, _ActiveObject, _SkillId, _FightData, _Conf) ->
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_6, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	if
		Trigger1 =:= 0 -> ?JUDGE_RETURN(Prefix =:= FightData#fight_data.prefix, 0);
		Trigger1 =:= 1 -> ?JUDGE_RETURN(?PROP_PREFIX_FORMER =:= FightData#fight_data.prefix, 0);
		Trigger1 =:= 2 -> ?JUDGE_RETURN(?PROP_PREFIX_LATTER =:= FightData#fight_data.prefix, 0);
		Trigger1 =:= 3 -> ?JUDGE_RETURN(?PROP_PREFIX_HERO =:= FightData#fight_data.prefix, 0);
		true -> skip
	end,
	Conf1 = tb_skill:get(FightData#fight_data.skill_id),
	if
		Trigger2 =:= -1 -> skip;
		true -> ?JUDGE_RETURN(Trigger2 =:= maps:get(skill_type, Conf1), 0)
	end,
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_7, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =/= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Prefix = lib_fight_api:skill_prefix(ActiveObject, SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	if
		Trigger1 =:= 0 -> ?JUDGE_RETURN(lists:member(Prefix, FightData#fight_data.target_prefix), 0);
		Trigger1 =:= 1 -> ?JUDGE_RETURN(lists:member(?PROP_PREFIX_FORMER, FightData#fight_data.target_prefix), 0);
		Trigger1 =:= 2 -> ?JUDGE_RETURN(lists:member(?PROP_PREFIX_LATTER, FightData#fight_data.target_prefix), 0);
		Trigger1 =:= 3 -> ?JUDGE_RETURN(lists:member(?PROP_PREFIX_HERO, FightData#fight_data.target_prefix), 0);
		true -> skip
	end,
	Conf1 = tb_skill:get(FightData#fight_data.skill_id),
	if
		Trigger2 =:= -1 -> skip;
		true -> ?JUDGE_RETURN(Trigger2 =:= maps:get(skill_type, Conf1), 0)
	end,
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_8, ActiveObject, SkillId, _FightData, Conf) ->
	Fighter = lib_fight_data:get_fighter(?OTHER(ActiveObject)),
	SkillConf = tb_skill:get(SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	?JUDGE_RETURN(lib_fight_api:hero_type(Fighter, Fighter#combat_hero.is_robot) =:= Trigger1, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_9, _ActiveObject, _SkillId, _FightData, _Conf) ->
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_10, _ActiveObject, _SkillId, _FightData, _Conf) ->
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_11, _ActiveObject, _SkillId, _FightData, _Conf) ->
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_12, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.target_object, 0),
	HurtTimes = lib_fight_data:get_hurt_times(ActiveObject),
	Trigger = maps:get(trigger_value1, Conf, maps:get(trigger_value1, tb_skill:get(SkillId), 0)),
	?JUDGE_RETURN(Trigger > 0 andalso HurtTimes rem Trigger =:= 0, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_13, ActiveObject, _SkillId, FightData, _Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.target_object, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_14, ActiveObject, _SkillId, FightData, _Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	?JUDGE_RETURN(lib_fight_config:is_active_skill(FightData#fight_data.skill_id), 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_15, ActiveObject, _SkillId, FightData, _Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.target_object, 0),
	?JUDGE_RETURN(lib_fight_config:is_active_skill(FightData#fight_data.skill_id), 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_16, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	Trigger = maps:get(trigger_value1, Conf, maps:get(trigger_value1, tb_skill:get(SkillId), 0)),
	Group = lib_fight_config:fetch_skill_group(FightData#fight_data.skill_id),
	?JUDGE_RETURN(Trigger =:= Group, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_17, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.target_object, 0),
	Trigger = maps:get(trigger_value1, Conf, maps:get(trigger_value1, tb_skill:get(SkillId), 0)),
	Group = lib_fight_config:fetch_skill_group(FightData#fight_data.skill_id),
	?JUDGE_RETURN(Trigger =:= Group, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_18, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =/= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	[TargetPrefix | _] = FightData#fight_data.target_prefix,
	ActiveArmy = lib_fight_data:get_army(ActiveObject, TargetPrefix),
	?JUDGE_RETURN(ActiveArmy#combat_army.type =:= Trigger1 orelse Trigger1 =:= 0, 0),
	?JUDGE_RETURN(TargetPrefix =:= get_prefix(Trigger2) orelse Trigger2 =:= 0, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_19, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	ActiveArmy = lib_fight_data:get_army(ActiveObject, FightData#fight_data.prefix),
	[TargetPrefix | _] = FightData#fight_data.target_prefix,
	TriggerArmy = lib_fight_data:get_army(FightData#fight_data.target_object, TargetPrefix),
	?JUDGE_RETURN(ActiveArmy#combat_army.type =:= Trigger1 orelse Trigger1 =:= 0, 0),
	?JUDGE_RETURN(TriggerArmy#combat_army.type =:= Trigger2 orelse Trigger2 =:= 0, 0),
	true;
check_trigger(?PASSIVE_SKILL_TRIGGER_20, ActiveObject, SkillId, FightData, Conf) ->
	?JUDGE_RETURN(ActiveObject =:= FightData#fight_data.object, 0),
	SkillConf = tb_skill:get(SkillId),
	Trigger1 = maps:get(trigger_value1, Conf, maps:get(trigger_value1, SkillConf, 0)),
	Trigger2 = maps:get(trigger_value2, Conf, maps:get(trigger_value2, SkillConf, 0)),
	{A,B} = lib_fight_data:get_cur_round(),
	StartA = Trigger1 div 100,
	StartB = Trigger1 - StartA,
	Can_launch1 = (StartA =:= A) andalso (StartB =:= B),
	Round_num1 = lib_fight_api:round_to_round_num(A, B),
	Round_num2 = lib_fight_api:round_to_round_num(StartA, StartB),
	Can_launch2 = (((Round_num1 - Round_num2) rem Trigger2) =:= 0),
	?JUDGE_RETURN(Can_launch1 orelse Can_launch2, 0),
	true;
check_trigger(_, _, _, _, _) ->
	false.

passive_can_effect(FightData, Conf) ->
	try
		?JUDGE_RETURN(lib_fight_passive_skill:is_have_passive_effect(?EFFECT_GROUP_SKILL_NO_ACTIVE,
			FightData#fight_data{object = ?OTHER(FightData#fight_data.object)}) =/= true, 0),
		passive_can_effect(maps:get(passive_condition, Conf, ?PASSIVE_CONDITION_0), FightData, Conf),
		true
	catch
		_:_  -> false
	end.

passive_can_effect(?PASSIVE_CONDITION_0, _, _) ->
	true;
passive_can_effect(?PASSIVE_CONDITION_1, FightData, Conf) ->
	ConfPrefix1 = maps:get(passive_condition_value1, Conf, 0),
	ConfPrefix2 = maps:get(passive_condition_value2, Conf, 0),
	?JUDGE_RETURN(FightData#fight_data.prefix =:= get_prefix(ConfPrefix1) orelse ConfPrefix1 =:= 0, 0),
	?JUDGE_RETURN(FightData#fight_data.target_prefix  =:= get_prefix(ConfPrefix2) orelse ConfPrefix2 =:= 0, 0);
passive_can_effect(?PASSIVE_CONDITION_2, FightData, Conf) ->
	ConfType1 = maps:get(passive_condition_value1, Conf, 0),
	ConfType2 = maps:get(passive_condition_value2, Conf, 0),
	Army1 = lib_fight_data:get_army(FightData#fight_data.object, FightData#fight_data.prefix),
	Army2 = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
	?JUDGE_RETURN(Army1#combat_army.type =:= ConfType1 orelse ConfType1 =:= 0, 0),
	?JUDGE_RETURN(Army2#combat_army.type  =:= ConfType2 orelse ConfType2 =:= 0, 0);
passive_can_effect(?PASSIVE_CONDITION_3, FightData, _) ->
	lib_fight_data:attack_times(FightData#fight_data.object, FightData#fight_data.prefix) =:= 0;
passive_can_effect(?PASSIVE_CONDITION_4, FightData, Conf) ->
	ConfSkillType = maps:get(passive_condition_value1, Conf, 0),
%%	ConfSkillType2 = maps:get(passive_condition_value2, Conf, 0),
	SkillType = lib_fight_config:skill_type(FightData#fight_data.skill_id),
	?JUDGE_RETURN(ConfSkillType  =:= SkillType orelse ConfSkillType =:= 0, 0);
passive_can_effect(?PASSIVE_CONDITION_5, FightData, Conf) ->
	Object = FightData#fight_data.object,
	Fighter = lib_fight_data:get_fighter(Object),
	HeroIdList = lib_fight_data:get_player_heros(Object, lib_fight_data:get_player_id(Object)),
	HeroIdList1 = lists:delete(Fighter#combat_hero.hero_id, HeroIdList),
	?JUDGE_RETURN(lib_fight_api:is_have_hero_type(HeroIdList1, maps:get(passive_condition_value1, Conf, 0)), 0);
passive_can_effect(?PASSIVE_CONDITION_6, FightData, Conf) ->
	Object = ?OTHER(FightData#fight_data.object),
	Fighter = lib_fight_data:get_fighter(Object),
	?JUDGE_RETURN(lib_fight_api:hero_type(Fighter,Fighter#combat_hero.is_robot) =:= maps:get(passive_condition_value1, Conf, 0), 0);
passive_can_effect(?PASSIVE_CONDITION_7, FightData, Conf) ->
	Object = ?OTHER(FightData#fight_data.object),
	Fighter = lib_fight_data:get_fighter(Object),
	?JUDGE_RETURN(lib_fight_api:hero_sex(Fighter,Fighter#combat_hero.is_robot) =:= maps:get(passive_condition_value1, Conf, 0), 0);
passive_can_effect(?PASSIVE_CONDITION_8, FightData, Conf) ->
	ConfType = maps:get(passive_condition_value1, Conf, 0),
	ConfPrefix = maps:get(passive_condition_value2, Conf, 0),
	Army = lib_fight_data:get_army(FightData#fight_data.object, FightData#fight_data.prefix),
	Type = Army#combat_army.type,
	TargetPrefix = FightData#fight_data.target_prefix,
	?JUDGE_RETURN(Type =:= ConfType orelse ConfType =:= 0, 0),
	?JUDGE_RETURN(TargetPrefix =:= get_prefix(ConfPrefix) orelse ConfPrefix =:= 0, 0);
passive_can_effect(?PASSIVE_CONDITION_9, FightData, Conf) ->
	ConfType = maps:get(passive_condition_value1, Conf, 0),
	ConfSkillType = maps:get(passive_condition_value2, Conf, 0),
	Army = lib_fight_data:get_army(FightData#fight_data.object, FightData#fight_data.prefix),
	Type = Army#combat_army.type,
	SkillType = lib_fight_config:skill_type(FightData#fight_data.skill_id),
	?JUDGE_RETURN(Type =:= ConfType orelse ConfType =:= 0, 0),
	?JUDGE_RETURN(ConfSkillType =:= SkillType orelse ConfSkillType =:= 0, 0);
passive_can_effect(?PASSIVE_CONDITION_10, FightData, Conf) ->
	ConfPrefix = maps:get(passive_condition_value1, Conf, 0),
	ConfSkillType = maps:get(passive_condition_value2, Conf, 0),
	SkillType = lib_fight_config:skill_type(FightData#fight_data.skill_id),
	?JUDGE_RETURN(FightData#fight_data.prefix =:= ConfPrefix orelse ConfPrefix =:= 0, 0),
	?JUDGE_RETURN(ConfSkillType =:= SkillType orelse ConfSkillType =:= 0, 0);
passive_can_effect(?PASSIVE_CONDITION_11, FightData, Conf) ->
	Object = FightData#fight_data.object,
	Fighter = lib_fight_data:get_fighter(Object),
	NeedHeroList = maps:get(passive_condition, Conf, []),
	HeroIdList = lib_fight_data:get_player_heros(Object, lib_fight_data:get_player_id(Object)),
	HeroIdList1 = lists:delete(Fighter#combat_hero.hero_id, HeroIdList),
	List = case Fighter#combat_hero.is_robot of
		true ->	[maps:get(hero_id, tb_monster_base:get(Base_id))|| Base_id <- HeroIdList1];
		false-> HeroIdList1
	end,
	lists:all(fun(HeroId) -> lists:member(HeroId,List) end, NeedHeroList);
passive_can_effect(_, _, _) ->
	true.

get_prefix(ConfPrefix) ->
	case ConfPrefix of
		1 -> ?PROP_PREFIX_FORMER;
		2 -> ?PROP_PREFIX_LATTER;
		_ -> error
	end.

check_passive_effect(?EFFECT_SKILL_ACTIVE_AGAIN, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	Fun =
	fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, Acc1) ->
			case validation_passive_effect(?EFFECT_SKILL_ACTIVE_AGAIN, SkillId, Conf, FightData) of
				true ->
					after_passive_effect(?EFFECT_SKILL_ACTIVE_AGAIN, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					List = lists:duplicate(maps:get(times, Conf, 1), FightData#fight_data.skill_id),
					lists:append(List, Acc1);
				_ -> Acc1
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end,
	?LISTS_FOLD(Fun, [], Fighter#combat_hero.skill_list);
check_passive_effect(?EFFECT_SKILL_ACTIVE_ROUND, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	try
		lists:foreach(fun(SkillId) ->
			try
				lists:foreach(fun(Conf) ->
					case validation_passive_effect(?EFFECT_SKILL_ACTIVE_ROUND, SkillId, Conf, FightData) of
						true ->
							after_passive_effect(?EFFECT_SKILL_ACTIVE_ROUND, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
							throw(true);
						_ -> skip
					end
				end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
			catch
				throw:true  -> throw(true);
				_:_  -> skip
			end
		end, Fighter#combat_hero.skill_list),
		false
	catch
		_:_  -> true
	end;
check_passive_effect(?EFFECT_SKILL_ADD_HURT_TIMES, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			case validation_passive_effect(?EFFECT_SKILL_ADD_HURT_TIMES, SkillId, Conf, FightData) of
				true ->
					after_passive_effect(?EFFECT_SKILL_ADD_HURT_TIMES, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					lib_fight_rand:rand(maps:get(times1, Conf, 1), maps:get(times2, Conf, 1)) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);
check_passive_effect(?EFFECT_SKILL_CHANGE_TARGET_OBJECT, FightData) ->
	try
		Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
		Prefix0 = lib_fight_api:skill_prefix(FightData#fight_data.object, FightData#fight_data.skill_id),
		lists:foreach(fun(SkillId) ->
			try
				lists:foreach(fun(Conf) ->
					case validation_passive_effect(?EFFECT_SKILL_CHANGE_TARGET_OBJECT, SkillId, Conf, FightData) of
						true ->
							after_passive_effect(?EFFECT_SKILL_CHANGE_TARGET_OBJECT, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
							TargetPrefix = lib_fight_config:skill_target(Conf, FightData#fight_data.skill_id, FightData),
							throw({ok, TargetPrefix});
						_ ->
							skip
					end
				end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
			catch
				throw:{ok, Prefix0} -> throw({ok, Prefix0});
				_:_  -> skip
			end
		end, Fighter#combat_hero.skill_list)
	catch
		throw:{ok, Prefix} -> Prefix;
		_:_  -> skip
	end;
check_passive_effect(?EFFECT_INCREASE_HURT, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			case validation_passive_effect(?EFFECT_INCREASE_HURT, SkillId, Conf, FightData) of
				true ->
					after_passive_effect(?EFFECT_INCREASE_HURT, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					maps:get(percent, Conf, 0) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);
check_passive_effect(?EFFECT_BUFF_SHIELD_RATE, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			BuffGroup = maps:get(buff_group, Conf, 0),
			Group = lib_fight_config:fetch_buff_group(FightData#fight_data.value),
			case validation_passive_effect(?EFFECT_BUFF_SHIELD_RATE, SkillId, Conf, FightData) andalso (BuffGroup =:= Group orelse BuffGroup =:= 0) of
				true ->
					after_passive_effect(?EFFECT_BUFF_SHIELD_RATE, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					maps:get(percent, Conf, 0) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);
check_passive_effect(?EFFECT_REMIT_FATAL_INJURY, FightData) ->
	try
		Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
		lists:foreach(fun(SkillId) ->
			try
				lists:foreach(fun(Conf) ->
					case validation_passive_effect(?EFFECT_REMIT_FATAL_INJURY, SkillId, Conf, FightData) of
						true ->
							after_passive_effect(?EFFECT_REMIT_FATAL_INJURY, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
							throw({ok});
						_ ->
							skip
					end
				end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object)),
				false
			catch
				throw:{ok} -> throw({ok});
				_:_  -> false
			end
		end, Fighter#combat_hero.skill_list)
	catch
		throw:{ok} -> true;
		_:_  -> skip
	end;
check_passive_effect(?EFFECT_INCREASE_HURT_BY_SKILL, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			case validation_passive_effect(?EFFECT_INCREASE_HURT_BY_SKILL, SkillId, Conf, FightData) of
				true ->
					after_passive_effect(?EFFECT_INCREASE_HURT_BY_SKILL, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					TargetSkillGroup = maps:get(target_skill_group, Conf, 0),
					Lvl = lib_fight_api:get_group_skill_level(TargetSkillGroup, Fighter#combat_hero.skill_list),
					OnePercent = maps:get(percent, Conf, 0),
					MaxPercent = maps:get(max_percent, Conf, 0),
					min(MaxPercent, Lvl * OnePercent) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);
check_passive_effect(?EFFECT_IGNORE_DEFENCE_ADD_VALUE, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			BuffGroup = maps:get(buff_group, Conf, 0),
			Group = lib_fight_config:fetch_buff_group(FightData#fight_data.value),
			case validation_passive_effect(?EFFECT_IGNORE_DEFENCE_ADD_VALUE, SkillId, Conf, FightData) andalso (BuffGroup =:= Group orelse BuffGroup =:= 0) of
				true ->
					after_passive_effect(?EFFECT_IGNORE_DEFENCE_ADD_VALUE, FightData#fight_data.object, FightData#fight_data.prefix,SkillId),
					maps:get(value, Conf, 0) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);
check_passive_effect(?EFFECT_IMMUNE_HURT_BY_SKILL, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			case validation_passive_effect(?EFFECT_IMMUNE_HURT_BY_SKILL, SkillId, Conf, FightData) of
				true ->
					after_passive_effect(?EFFECT_IMMUNE_HURT_BY_SKILL, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					TargetSkillGroup = maps:get(target_skill_group, Conf, 0),
					Lvl = lib_fight_api:get_group_skill_level(TargetSkillGroup, Fighter#combat_hero.skill_list),
					OnePercent = maps:get(percent, Conf, 0),
					MaxPercent = maps:get(max_percent, Conf, 0),
					min(MaxPercent, Lvl * OnePercent) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);

check_passive_effect(?EFFECT_INCREASE_HURT_BY_BUFF, FightData) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, TmpAcc) ->
			case validation_passive_effect(?EFFECT_INCREASE_HURT_BY_BUFF, SkillId, Conf, FightData) of
				true ->
					after_passive_effect(?EFFECT_INCREASE_HURT_BY_BUFF, FightData#fight_data.object, FightData#fight_data.prefix, SkillId),
					BuffList = lists:foldl(fun(Prefix,List)->
						BuffList = maps:to_list(lib_fight_data:get_buff_map(FightData#fight_data.target_object, Prefix)),
						lists:append(BuffList,List)
					 end,[],[?PROP_PREFIX_HERO,?PROP_PREFIX_FORMER,?PROP_PREFIX_LATTER]),
					NewBuffList = lists:filter(fun(BuffId) -> lib_fight_buff:buff_ad_type(BuffId) =:= ?FIGHT_BUFF_AD_TYPE2 end,BuffList),
					OnePercent = maps:get(percent, Conf, 0),
					MaxPercent = maps:get(max_percent, Conf, 0),
					min(MaxPercent,length(NewBuffList) * OnePercent) + TmpAcc;
				_ -> TmpAcc
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
	end, 0, Fighter#combat_hero.skill_list);

%%check_passive_effect(?EFFECT_CHANGE_BUFF_ID,FightData) ->
%%	BuffId = FightData#fight_data.skill_id,
%%	try
%%		Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
%%		lists:foreach(fun(SkillId) ->
%%			try
%%				lists:foreach(fun(Conf) ->
%%					case validation_passive_effect(?EFFECT_CHANGE_BUFF_ID, SkillId, Conf, FightData) of
%%						true ->
%%							case maps:get(buff_id,Conf) =:= BuffId andalso maps:get(object,Conf) =:= ?FIGHTER_TYPE_L of
%%								true -> after_passive_effect(?EFFECT_CHANGE_BUFF_ID, FightData#fight_data.object, FightData#fight_data.prefix, FightData#fight_data.skill_id),
%%										NewBuffId = maps:get(new_buff_id,Conf),
%%										throw({ok,NewBuffId});
%%								false-> skip
%%							end;
%%						_ ->
%%							skip
%%					end
%%				end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object))
%%			catch
%%				throw:{ok,NewBuffId} -> throw({ok,NewBuffId});
%%				_:_  -> {false,0}
%%			end
%%		end, Fighter#combat_hero.skill_list),
%%		TargetFighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
%%		lists:foreach(fun(SkillId) ->
%%			try
%%				lists:foreach(fun(Conf) ->
%%					case validation_passive_effect(?EFFECT_CHANGE_BUFF_ID, SkillId, Conf, FightData) of
%%						true ->
%%							case maps:get(buff_id,Conf) =:= BuffId andalso maps:get(object,Conf) =:= ?FIGHTER_TYPE_R of
%%								true -> after_passive_effect(?EFFECT_CHANGE_BUFF_ID, FightData#fight_data.object, FightData#fight_data.prefix, FightData#fight_data.skill_id),
%%									NewBuffId = maps:get(new_buff_id,Conf),
%%									throw({ok,NewBuffId});
%%								false-> skip
%%							end;
%%						_ ->
%%							skip
%%					end
%%							  end, lib_fight_config:passive_skill_effect(SkillId,FightData#fight_data.object)),
%%				{false,0}
%%			catch
%%				throw:{ok,NewBuffId} -> throw({ok,NewBuffId});
%%				_:_  -> {false,0}
%%			end
%%		end, TargetFighter#combat_hero.skill_list)
%%	catch
%%		throw:{ok,NewBuffId} -> {true,NewBuffId};
%%		_:_  -> {false,0}
%%	end
%%;

check_passive_effect(_,_) ->
	skip.

%% 验证被动技能效果
validation_passive_effect(EType, SkillId, Conf, FightData) ->
	?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
	Prefix = lib_fight_api:skill_prefix(FightData#fight_data.object, SkillId),
	?JUDGE_RETURN(Prefix =:= FightData#fight_data.target_prefix orelse Prefix =:= ?PROP_PREFIX_HERO, 0),
	SkillGroup =
		case maps:find(skill_group, Conf) of
			error -> maps:get(skill_group, tb_skill:get(SkillId));
			{ok, Value} -> Value
		end,
	Group = lib_fight_config:fetch_skill_group(FightData#fight_data.skill_id),
	SkillGroupFlag = validation_skill_group(SkillGroup, Group),
	Army = lib_fight_data:get_army(FightData#fight_data.object, FightData#fight_data.prefix),
	ArmyType = maps:get(army_type, Conf, 0),
	TargetPrefix = lib_fight_config:skill_target(Conf, FightData#fight_data.skill_id, FightData),
	SKillConf = tb_skill:get(SkillId),

	Active_passive = maps:get(active_passive,Conf,0),
	Skill_type = maps:get(skill_type,Conf,0),
	Skill_type_add = maps:get(skill_type_add,Conf,0),

	(maps:get(active_passive,SKillConf) =:= Active_passive orelse Active_passive =:= 0) andalso
	(maps:get(skill_type,SKillConf) =:= Skill_type orelse Skill_type =:= 0) andalso
	(maps:get(skill_type_add,SKillConf) =:= Skill_type_add orelse Skill_type_add =:= 0) andalso

	EType =:= maps:get(effect, Conf) andalso
	lib_fight_effect:can_effect(FightData, Conf) andalso
	lib_fight_api:round_can_active(SkillId, Conf) andalso
	passive_can_effect(FightData, Conf) andalso
	lib_fight_rand:rand_float() =< lib_fight_api:get_skill_rate(SkillId,Conf,FightData) andalso
	lib_fight_api:trigger_hero(FightData#fight_data.object, SkillId) andalso
	SkillGroupFlag =:= true andalso
	(TargetPrefix =:= [] orelse lists:member(Prefix, TargetPrefix)) andalso
	(ArmyType =:= 0 orelse ArmyType =:= Army#combat_army.type).


validation_skill_group(SkillGroup, Group) when erlang:is_integer(SkillGroup) ->
	SkillGroup =:= Group orelse SkillGroup =:= 0
;
validation_skill_group(SkillGroup, Group) when erlang:is_list(SkillGroup) ->
	lists:member(Group, SkillGroup) orelse SkillGroup =:= []
;
validation_skill_group(_SkillGroup, _Group) ->
	false
.

after_passive_effect(EType, Object, Prefix, SkillId) ->
	lib_fight_parsing:parsing_proto_effect(#fight_data{
		object = Object,
		prefix = Prefix,
		skill_id = SkillId,
		effect_type = EType,
		target_object = Object,
		target_prefix = [Prefix],
		flag = ?IIF(SkillId > 0, 1, 0)
	}),
	lib_fight_data:add_skill_active_times(Object, SkillId),
	lib_fight_data:add_skill_round_active_times(Object, SkillId).