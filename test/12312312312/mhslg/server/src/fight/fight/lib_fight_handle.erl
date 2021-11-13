%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_handle.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_handle).
-include("common.hrl").
-include("fight.hrl").
-include("fight_effect.hrl").
-include("combat_queue.hrl").

-compile(export_all).

%% 本场战斗开始 处理
handle_start(CombatQueue) ->
	lib_fight_data:put_is_finish(false),
	lib_fight_data:put_no_throw_finish(false),
	lib_fight_api:fight_init(CombatQueue),
	lib_fight_data:reset_fight_result(CombatQueue),
	lib_fight_data:init_wastage(),
	lib_fight_parsing:reset_proto_fight_detail(),
	lib_fight_data:reset_cur_round(),
	lib_fight_buff:init_buff(),
	lib_fight_data:init_last_hurt(),
	lib_fight_data:reset_group_skill_hurt(),
	lib_fight_data:reset_change_active_round_skill(),
	lib_fight_data:reset_skill_extra_data(),
	lib_fight_config:init_update_config(),
	lib_fight_buff:init_change_buff(),

	lib_fight_parsing:parsing_proto_fight_detail(),rend.

%% 本场战斗结束 处理
handle_finish() ->
	lib_fight_api:clean_fight_prop1(),
	lib_fight_data:finish_wastage(),
	rend.%%放最后

%% 回合开始 处理
handle_round_start() ->
	try
		lib_fight_data:reset_avoid_hurt_time(),
		lib_fight_data:add_cur_round(),
		{A, B} = lib_fight_data:get_cur_round(),
%%		?DEBUG("cur round ~p-~p~n", [A, B]),
		?FIGHT_FINISH(A =:= ?FIGHT_ROUND4 andalso B > ?FIGHT_MAX_ROUND + 10, ?FIGHTER_TYPE_C),
		lib_fight_data:reset_skill_round_active_times(),
		lib_fight_data:reset_hurt_times(),
		lib_fight_parsing:reset_proto_fight(),
		lib_fight_parsing:parsing_proto_fight(),
		lib_fight_api:check_finish(#fight_data{}),
		lib_fight_buff:buff_effect(),
		case A of
			?FIGHT_ROUND1 ->
				lib_fight_api:insert_buff_list(),
				lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_6,
					?FIGHTER_TYPE_L, #fight_data{}, true),
				lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_6,
					?FIGHTER_TYPE_R, #fight_data{}, true);
			_ ->
				skip
		end,
		case (A =:= ?FIGHT_ROUND3) orelse (A =:= ?FIGHT_ROUND4) of
			 true ->lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_2,
				 ?FIGHTER_TYPE_L, #fight_data{}, true),
				 lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_2,
					 ?FIGHTER_TYPE_R, #fight_data{}, true);
			 false -> skip
		end

	catch
		throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
		throw:next_round -> ?NEXT_ROUND(true);
		throw:skip_skill -> ok
	end,
	rend.

%% 回合结束 处理
handle_round_finish() ->
	try
		{A, _B} = lib_fight_data:get_cur_round(),
		case (A =:= ?FIGHT_ROUND3) orelse (A =:= ?FIGHT_ROUND4) of
			true ->lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_3,
				?FIGHTER_TYPE_L, #fight_data{}, true),
				lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_3,
					?FIGHTER_TYPE_R, #fight_data{}, true);
			false -> skip
		end,
		lib_fight_api:clean_fight_prop2(),
		lib_fight_buff:check_overdue(),
		lib_fight_parsing:push_proto_fight()
	catch
		throw:{finish, Win} -> case lib_fight_data:get_no_throw_finish() of true -> skip; _ -> ?FIGHT_FINISH(true, Win) end;
		throw:next_round -> ?NEXT_ROUND(true);
		throw:skip_skill -> ok
	end,
	rend.%%放最后

%% 释放技能开始 处理
launch_skill_start(FightData) ->
	lib_fight_data:add_interval(lib_fight_config:skill_interval(FightData#fight_data.skill_id)),
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_4,
		FightData#fight_data.object, FightData, FightData#fight_data.passive_flag),
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_4,
		FightData#fight_data.target_object, FightData, FightData#fight_data.passive_flag),
	rend.%%放最后

%% 释放技能结束 处理
launch_skill_finish(FightData) ->
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_5,
		FightData#fight_data.object, FightData, FightData#fight_data.passive_flag),
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_5,
		FightData#fight_data.target_object, FightData, FightData#fight_data.passive_flag),
	rend.%%放最后

handle_skill_effect_start() ->
%% 技能效果开始 处理
	rend.

%% 技能效果完成 处理
handle_skill_effect_finish() ->
	rend.%%放最后

%% 计算攻击方式和前缀对象后 处理
handle_launch_skill(_Object, _SkillId) ->
	rend.

handle_deduct_health(FightData) ->
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_1,
		FightData#fight_data.object, FightData, FightData#fight_data.passive_flag),
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_1,
		FightData#fight_data.target_object, FightData, FightData#fight_data.target_passive_flag),
	lib_fight_api:check_finish(FightData),rend.

handle_recover_health(_TargetPrefix, _Health) ->
	rend.

handle_die(Object, FightData) ->
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_7,
		Object, FightData, FightData#fight_data.target_passive_flag),
	rend.

handle_win(Object, FightData) ->
	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_8,
		Object, FightData, FightData#fight_data.target_passive_flag),
	rend.

%% 英雄放技能 处理
handle_hero_launch_skill(_Object, _SkillId) ->
	rend.
%% 前军放技能 处理
handle_former_launch_skill(_Object, _SkillId) ->
	rend.
%% 后军放技能 处理
handle_latter_launch_skill(_Object, _SkillId) ->
	rend.


%% 智慧英雄放技能 处理
handle_hero_wisdom_launch_skill(_Object, _SkillId) ->
	rend.
%% 勇猛英雄放技能 处理
handle_hero_valiant_launch_skill(_Object, _SkillId) ->
	rend.
%% 均衡英雄放技能 处理
handle_hero_balance_launch_skill(_Object, _SkillId) ->
	rend.

%% 步兵放技能 处理
handle_former_infantry_launch_skill(_Object, _SkillId) ->
	rend.
%% 骑兵放技能 处理
handle_former_cavalry_launch_skill(_Object, _SkillId) ->
	rend.
%% 弓兵放技能 处理
handle_former_archer_launch_skill(_Object, _SkillId) ->
	rend.
%% 方士放技能 处理
handle_former_magician_launch_skill(_Object, _SkillId) ->
	rend.

%% 步兵放技能 处理
handle_latter_infantry_launch_skill(_Object, _SkillId) ->
	rend.
%% 骑兵放技能 处理
handle_latter_cavalry_launch_skill(_Object, _SkillId) ->
	rend.
%% 弓兵放技能 处理
handle_latter_archer_launch_skill(_Object, _SkillId) ->
	rend.
%% 方士放技能 处理
handle_latter_magician_launch_skill(_Object, _SkillId) ->
	rend.


handle_hero_attack_type1(_Object, _SkillId) ->%% 英雄攻击方式为闪避 处理
	rend.
handle_hero_attack_type2(_Object, _SkillId) ->%% 英雄攻击方式为暴击 处理
	rend.
handle_hero_attack_type3(_Object, _SkillId) ->%% 英雄攻击方式为格挡 处理
	rend.
handle_hero_attack_type4(_Object, _SkillId) ->%% 英雄攻击方式为普攻 处理
	rend.

handle_former_attack_type1(_Object, _SkillId) ->%% 前军攻击方式为闪避 处理
	rend.
handle_former_attack_type2(_Object, _SkillId) ->%% 前军攻击方式为暴击 处理
	rend.
handle_former_attack_type3(_Object, _SkillId) ->%% 前军攻击方式为格挡 处理
	rend.
handle_former_attack_type4(_Object, _SkillId) ->%% 前军攻击方式为普攻 处理
	rend.

handle_latter_attack_type1(_Object, _SkillId) ->%% 后军攻击方式为闪避 处理
	rend.
handle_latter_attack_type2(_Object, _SkillId) ->%% 后军攻击方式为暴击 处理
	rend.
handle_latter_attack_type3(_Object, _SkillId) ->%% 后军攻击方式为格挡 处理
	rend.
handle_latter_attack_type4(_Object, _SkillId) ->%% 后军攻击方式为普攻 处理
	rend.