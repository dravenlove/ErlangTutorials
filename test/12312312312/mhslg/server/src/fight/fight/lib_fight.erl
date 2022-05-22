%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight).
-include("common.hrl").
-include("fight.hrl").
-include("hero.hrl").
-include("fight_prop.hrl").
-include("fight_effect.hrl").
-include("combat_queue.hrl").

%% API
-export([
	fight/1
]).

fight(CombatQueue) ->
	?INFO("start fight"),
	lib_fight_data:put_fight_result(#fight_result{}),
	try

		%% 战斗开始处理
		handle_start(CombatQueue),
		%% 本场战斗过程
		handle_fight(),
		%% 战斗结束处理
		handle_finish(),

		ProtoDetail0 = lib_fight_parsing:get_proto_fight_detail(),
		Result = lib_fight_data:get_fight_result(),
		ProtoDetail = ProtoDetail0#'ProtoFightDetail'{win_type = Result#fight_result.win_type},
		?INFO("finish fight"),
		{Result, ProtoDetail}
	catch
		_:Reason -> ?ERROR("fight error Reason: ~p ~n ~p", [Reason, erlang:get_stacktrace()]), {error, error}
	end.


%% 本场战斗开始
handle_start(CombatQueue) -> lib_fight_handle:handle_start(CombatQueue).
%% 本场战斗结束
handle_finish() -> lib_fight_handle:handle_finish().
%% 本场战斗过程
handle_fight() ->
	try

		%% 回合开始
		handle_round_start(),
		%% 回合过程
		launch_round(),
		%% 回合结束
		handle_round_finish(),

		%% 继续下一回合
		handle_fight()

	catch
		%% 结束战斗
		throw:{finish, Win} ->
%%			handle_round_finish(),
			lib_fight_data:set_win_type(Win),
			?DEBUG("fight finish ~p~n", [Win]);
		%% 结束本回合继续下一回合
		throw:next_round ->
			?DEBUG("next round~n"),
%%			handle_round_finish(),%% 回合结束处理
			handle_fight()
	end.


%% 回合开始
handle_round_start() -> lib_fight_handle:handle_round_start().
%% 回合结束
handle_round_finish() -> lib_fight_handle:handle_round_finish().
%% 回合过程
launch_round() ->
	lists:foreach(fun({Object, SkillId, _}) ->
		?INFO("launch skill ~p ~p~n", [Object, SkillId]),
		try
			?JUDGE_RETURN(lib_fight_api:can_active_skill(Object, SkillId, true), 0),
			lib_fight_data:add_skill_active_times(Object, SkillId),
			lib_fight_data:add_skill_round_active_times(Object, SkillId),
			%% 释放者前缀
			Prefix = lib_fight_api:skill_prefix(Object, SkillId),
			%% 目标前缀
			TargetPrefix = lib_fight_config:skill_target(SkillId),
%%			?DEBUG("skill target prefix ~p~n", [TargetPrefix]),
			lib_fight_data:put_prefix(SkillId, TargetPrefix),
			Flag = lib_fight_effect:is_no_passive_effect(SkillId),

			FightData = #fight_data{
				type = ?CLIENT_EFFECT_TYPE1,
				effect_type = ?EFFECT_COMMON_HURT,
				object = Object,
				prefix = Prefix,
				target_object = lib_fight_config:skill_target_object(Object, SkillId),
				target_prefix = TargetPrefix,
				skill_id = SkillId,
				target_passive_flag = Flag
			},
			{Is_be_invalid,PassiveConf,PassiveSkillId} = lib_fight_passive_skill:is_be_invalid(FightData),
			NewFightData = FightData#fight_data{
				is_be_invalid = Is_be_invalid
			},
			%% 释放技能开始
			launch_skill_start(NewFightData),
			%% 释放技能
			launch_skill(NewFightData),
			%% 释放技能结束
			launch_skill_finish(NewFightData),
			case Is_be_invalid  of
				 true ->
					 	?INFO("技能 ~p 被无懈了",[SkillId]),
						lib_fight_passive_skill:passive_skill(NewFightData#fight_data.target_object, PassiveSkillId, NewFightData, PassiveConf),
						lib_fight_data:add_skill_active_times(NewFightData#fight_data.target_object, PassiveSkillId);
				false -> skip
			end
		catch
			throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
			throw:next_round -> ?NEXT_ROUND(true);
			throw:skip_skill -> ?NEXT_SKILL(true);
			throw:_ -> ?DEBUG("skill no active ~p", [SkillId]), skip
		end
	end, lib_fight_api:calc_launch_skill_list()).


%% 释放技能开始
launch_skill_start(FightData) -> lib_fight_handle:launch_skill_start(FightData).
%% 释放技能结束
launch_skill_finish(FightData) -> lib_fight_handle:launch_skill_finish(FightData).
%% 释放技能
launch_skill(FightData) ->
	try
		%%handle_launch_skill(FightData),
		skill_effect(FightData)
	catch
		throw:skip_skill -> ?INFO("skip_skill ~p", [FightData#fight_data.skill_id])
	end.

skill_effect(FightData) ->
	TipsFlag = lib_fight_api:active_skill_extra_effect(FightData#fight_data{flag = ?EFFECT_TIPS}, ?ACTIVE_EFFECT_TIME1),

	%% 主动技能基本效果
	lib_fight_handle:handle_skill_effect_start(),
	lib_fight_api:active_skill_main_effect(FightData#fight_data{flag = TipsFlag}),
	lib_fight_handle:handle_skill_effect_finish(),

	%% 主动技能额外效果
	lib_fight_api:active_skill_extra_effect(FightData#fight_data{flag = ?EFFECT_NO_TIPS}, ?ACTIVE_EFFECT_TIME2),
	lib_fight_api:update_skill_flag(FightData#fight_data.object,1),
	lib_fight_api:clean_fight_prop3().





%%handle_launch_skill(FightData) ->
%%	Object = FightData#fight_data.object,
%%	SkillId = FightData#fight_data.skill_id,
%%	Prefix = FightData#fight_data.prefix,
%%	AttackType = FightData#fight_data.attack_type,
%%	lib_fight_handle:handle_launch_skill(Object, SkillId),
%%	Fighter = lib_fight_data:get_fighter(Object),
%%	case Prefix of
%%		?PROP_PREFIX_HERO ->
%%			case AttackType of
%%				?FIGHT_ATTACK_TYPE1 ->
%%					lib_fight_handle:handle_hero_attack_type1(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE2 ->
%%					lib_fight_handle:handle_hero_attack_type2(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE3 ->
%%					lib_fight_handle:handle_hero_attack_type3(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE4 ->
%%					lib_fight_handle:handle_hero_attack_type4(Object, SkillId)
%%			end,
%%			case lib_hero_api:hero_type(Fighter#combat_hero.hero_id) of
%%				?HERO_TYPE_WISDOM ->
%%					lib_fight_handle:handle_hero_wisdom_launch_skill(Object, SkillId);
%%				?HERO_TYPE_VALIANT ->
%%					lib_fight_handle:handle_hero_valiant_launch_skill(Object, SkillId);
%%				?HERO_TYPE_BALANCE ->
%%					lib_fight_handle:handle_hero_balance_launch_skill(Object, SkillId)
%%			end,
%%			lib_fight_handle:handle_hero_launch_skill(Object, SkillId);
%%		?PROP_PREFIX_FORMER ->
%%			case AttackType of
%%				?FIGHT_ATTACK_TYPE1 ->
%%					lib_fight_handle:handle_former_attack_type1(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE2 ->
%%					lib_fight_handle:handle_former_attack_type2(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE3 ->
%%					lib_fight_handle:handle_former_attack_type3(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE4 ->
%%					lib_fight_handle:handle_former_attack_type4(Object, SkillId)
%%			end,
%%			case Fighter#combat_hero.former#combat_army.type of
%%				?CORPS_TYPE_INFANTRY ->
%%					lib_fight_handle:handle_former_infantry_launch_skill(Object, SkillId);
%%				?CORPS_TYPE_CAVALRY ->
%%					lib_fight_handle:handle_former_cavalry_launch_skill(Object, SkillId);
%%				?CORPS_TYPE_ARCHER ->
%%					lib_fight_handle:handle_former_archer_launch_skill(Object, SkillId);
%%				?CORPS_TYPE_MAGICIAN ->
%%					lib_fight_handle:handle_former_magician_launch_skill(Object, SkillId)
%%			end,
%%			lib_fight_handle:handle_former_launch_skill(Object, SkillId);
%%		?PROP_PREFIX_LATTER ->
%%			case AttackType of
%%				?FIGHT_ATTACK_TYPE1 ->
%%					lib_fight_handle:handle_latter_attack_type1(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE2 ->
%%					lib_fight_handle:handle_latter_attack_type2(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE3 ->
%%					lib_fight_handle:handle_latter_attack_type3(Object, SkillId);
%%				?FIGHT_ATTACK_TYPE4 ->
%%					lib_fight_handle:handle_latter_attack_type4(Object, SkillId)
%%			end,
%%			case Fighter#combat_hero.latter#combat_army.type of
%%				?CORPS_TYPE_INFANTRY ->
%%					lib_fight_handle:handle_latter_infantry_launch_skill(Object, SkillId);
%%				?CORPS_TYPE_CAVALRY ->
%%					lib_fight_handle:handle_latter_cavalry_launch_skill(Object, SkillId);
%%				?CORPS_TYPE_ARCHER ->
%%					lib_fight_handle:handle_latter_archer_launch_skill(Object, SkillId);
%%				?CORPS_TYPE_MAGICIAN ->
%%					lib_fight_handle:handle_latter_magician_launch_skill(Object, SkillId)
%%			end,
%%			lib_fight_handle:handle_latter_launch_skill(Object, SkillId)
%%	end.