%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 9月 2021 15:02
%%%-------------------------------------------------------------------
-module(lib_field_fight).
-author("df").
-include("field_combat_queue.hrl").
-include("fight_effect.hrl").
-include("fight.hrl").
%% API
-export([
	start_launch_skill/1
]).


start_launch_skill(UnitId_List) ->
	Now_tick = lib_timer:unixtime_ms(),
	Skill_list = lists:foldl(fun(Unit_id,L1) ->
		Map = lib_field_fight_data:get_skill_lunch_map(Unit_id),
		lists:append(maps:fold(fun(Skill,Release_tick,L2)->
			case Now_tick >= Release_tick of  true -> [{Unit_id,Release_tick,Skill}|L2]; false -> L2 end
		end,[],Map),L1)
	end,[],UnitId_List),

	lists:foreach(fun({Unit_id,_Release_tick,SkillId})->
		try
			?JUDGE_RETURN(lib_field_fight_api:can_activity_skill(Unit_id, SkillId, true),0),
			Conf = tb_field_skill:get(SkillId),
			%% 获得攻击距离内是否有目标
		    %% 无目标退出
			Flag = is_no_passive_effect(SkillId),
			Now_release_tick = lib_timer:unixtime_ms(),
			%% 释放者前缀
			Prefix = lib_field_fight_api:skill_prefix(Unit_id, SkillId),
			%% 目标前缀
			TargetPrefix = lib_field_fight_config:skill_target(SkillId),
			FightData = #field_fight_data{
				type = ?CLIENT_EFFECT_TYPE1,
				trigger = lib_field_fight_api:get_trigger(?TRIGGER_TYPE_1001),
				skill_id = SkillId,
				effect_type = ?EFFECT_COMMON_HURT,
				unit_id = Unit_id,
				prefix = Prefix,
				target_passive_flag = Flag
			},
			Skill_Distance = maps:get(skill_distance,Conf),
			Target_List =
			maps:fold(fun(Target_Unit_id,Distance,L) ->
				case Skill_Distance =< Distance andalso lib_field_fight_api:target_allow_skill_activity(SkillId,Target_Unit_id) of
					true -> [Target_Unit_id|L];
					false-> L
				end
			end,[],lib_field_fight_data:get_distance_map(Unit_id)),
			Attack_num = lib_fight_rand:rand(maps:get(mix_unit,Conf),maps:get(max_unit,Conf)),
			Attack_list =
			case length(Target_List) =< Attack_num of
				true -> Target_List;
				false-> lists:foldl(fun(_X,{L1,L2}) -> A = lib_fight_rand:rand_one(L2), {[A|L1],lists:delete(A,L2)} end,{[],Target_List},lists:seq(1,Attack_num))
			end,
			lists:foreach(fun(Target_Unit_id) ->
				FightData1 = FightData#field_fight_data{
					target_unit_id = Target_Unit_id,
					target_prefix = TargetPrefix
				},
				{Is_be_invalid,PassiveConf,PassiveSkillId} = lib_fight_passive_skill:is_be_invalid(FightData),
				NewFightData = FightData1#field_fight_data{
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
						lib_fight_passive_skill:passive_skill(FightData1#field_fight_data.target_unit_id, PassiveSkillId, NewFightData, PassiveConf),
						lib_fight_data:add_skill_active_times(FightData1#field_fight_data.target_unit_id, PassiveSkillId);
					false -> skip
				end
			end,Attack_list),
			%% 技能释放成功后，加上冷却时间
			case Attack_list =/= [] of
				true -> case lib_field_fight_data:get_skill_active_times(Unit_id, SkillId) =:= maps:get(activity_time,Conf) of
							true -> lib_field_fight_data:delete_skill_lunch(Unit_id,SkillId);
							false-> Cooling_time = maps:get(cooling_time,Conf,0),
									lib_field_fight_data:update_skill_lunch_map(Unit_id,SkillId,Now_release_tick + Cooling_time)
						end;
				false -> skip
			end
		catch
		    _:_  -> skip
		end

	end,lists:keysort(2,Skill_list))
.


is_no_passive_effect(SkillId) ->
	lists:foldl(fun(Conf, Acc) ->
		EffectType = maps:get(effect, Conf, ?EFFECT_COMMON_HURT),
		case EffectType =:= ?EFFECT_IGNORE_PASSIVE of
			true ->
				false;
			_ ->
				Acc
		end
	end, true, lib_field_fight_config:skill_add_effect(SkillId)).

%% 释放技能
launch_skill(FightData) ->
	try
		skill_effect(FightData)
	catch
		throw:skip_skill -> ?INFO("skip_skill ~p", [FightData#fight_data.skill_id])
	end.

skill_effect(FightData) ->
	TipsFlag = lib_fight_api:active_skill_extra_effect(FightData#fight_data{flag = ?EFFECT_TIPS}, ?ACTIVE_EFFECT_TIME1),

	%% 主动技能基本效果
	handle_skill_effect_start(),
	active_skill_main_effect(FightData#fight_data{flag = TipsFlag}),
	handle_skill_effect_finish(),

	%% 主动技能额外效果
	lib_fight_api:active_skill_extra_effect(FightData#fight_data{flag = ?EFFECT_NO_TIPS}, ?ACTIVE_EFFECT_TIME2),

	lib_field_fight_data:init_prop2(FightData#field_fight_data.unit_id).

active_skill_main_effect(FightData) ->
	?JUDGE_RETURN(FightData#fight_data.is_be_invalid =/= true, 0),
	lib_fight_effect:effect(tb_field_skill:get(FightData#fight_data.skill_id), FightData).

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


%%handle_deduct_health(FightData) ->
%%	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_1,
%%		FightData#fight_data.object, FightData, FightData#fight_data.passive_flag),
%%	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_1,
%%		FightData#fight_data.target_object, FightData, FightData#fight_data.target_passive_flag),
%%	lib_fight_api:check_finish(FightData),rend.
%%
%%handle_recover_health(_TargetPrefix, _Health) ->
%%	rend.
%%
%%handle_die(Object, FightData) ->
%%	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_7,
%%		Object, FightData, FightData#fight_data.target_passive_flag),
%%	rend.
%%
%%handle_win(Object, FightData) ->
%%	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_8,
%%		Object, FightData, FightData#fight_data.target_passive_flag),
%%	rend.