%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 9月 2021 11:34
%%%-------------------------------------------------------------------
-module(lib_join_field_fight).
-author("df").
-include("field_combat_queue.hrl").
-include("fight_prop.hrl").
-include("fight_effect.hrl").
-include("fight.hrl").
%% API
-export([
	join_fight/1,

	leave_fight/1
]).

join_fight(Unit_id) ->
	Tick = lib_timer:unixtime_ms(),
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	lib_field_fight_data:put_field_combat_hero(Unit_id,Data#field_combat_hero{fight_tick = Tick}),
	Active_skill = lists:filter(fun(SkillId) -> lib_field_fight_config:is_active_skill(SkillId) end,Data#field_combat_hero.skill_list),
	SkillMap =
		lists:foldl(fun(SkillId,Map) ->
			Conf = tb_field_skill:get(SkillId),
			maps:put(SkillId,(maps:get(first_time,Conf,0) + Tick),Map)
		end,maps:new(),Active_skill),
	lib_field_fight_data:put_skill_lunch_map(Unit_id,SkillMap),
	init_update_config(Unit_id)
.

leave_fight(Unit_id) ->
	RunList = [
		{fun lib_field_fight_data:erase_skill_lunch_map/1,		[Unit_id]},
		{fun lib_field_fight_data:erase_last_hurt/1,			[Unit_id]},
		{fun lib_field_fight_data:erase_buff_map/1, 			[Unit_id]},
		{fun lib_field_fight_data:erase_skill_active_times/1, 	[Unit_id]},
		{fun lib_field_fight_data:erase_be_hurt_times/1,		[Unit_id]},
		{fun lib_field_fight_data:erase_skill_extra_data/1, 	[Unit_id]},
		{fun lib_field_fight_data:erase_avoid_hurt_time/1, 		[Unit_id]},
		{fun lib_field_fight_data:erase_change_config_skill/1, 	[Unit_id]},
		{fun lib_field_fight_data:erase_change_buff/1, 			[Unit_id]}
	],
	lib_common:try_run(RunList)
.

init_update_config(Unit_id) ->
	lib_field_fight_data:init_change_config_skill(Unit_id),
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	lists:foreach(fun(Skill_ID) ->
		Config = case lib_field_fight_config:is_passive_skill(Skill_ID) of
					 true -> lib_field_fight_config:passive_skill_effect(Skill_ID) ;
					 false -> lib_field_fight_config:skill_add_effect(Skill_ID)
				 end,
		Conf = tb_field_skill:get(Skill_ID),
		SkillGroup = maps:get(group,Conf),
		FightData = #field_fight_data{
			unit_id = Unit_id,
			prefix = ?PROP_PREFIX_HERO,
			skill_id = Skill_ID
		},
		{Type,Config1} = skill_change_conf(Unit_id,SkillGroup,Config,FightData),
		Config2 = all_skill_add_effect(Unit_id,FightData),
		case Type =:= false andalso Config2 =:= [] of
			true -> skip;
			false-> Config3 = lists:append(Config1,Config2),
				lib_field_fight_data:put_change_config_skill(Unit_id,Skill_ID,Config3)
%%				?INFO("player ~p  skill ~p update config ~n~p",[Object,Skill_ID,Config3])
		end
	end,Data#field_combat_hero.skill_list)
.

%% 技能增加效果
all_skill_add_effect(Unit_id,FightData) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	MainSKill = FightData#fight_data.skill_id,
	MainGroupID = maps:get(group,tb_field_skill:get(MainSKill)),
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, EffectList) ->
			%% todo
			?JUDGE_RETURN(lib_fight_passive_skill:validation_passive_effect(?EFFECT_SKILL_ADD_EFFECT, SkillId, Conf, FightData),0),
			?JUDGE_RETURN(MainGroupID =:= maps:get(skill_group,Conf,0),0),
			GroupID = maps:get(effect_skill_group,Conf,maps:get(group,tb_field_skill:get(SkillId))),
			Key = case maps:get(is_have_level,Conf,0) of
					  0 -> GroupID * 1000 + 1;
					  1 -> Effect_skill_group = maps:get(effect_skill_group,Conf,0),
						  Lvl = lib_fight_api:get_group_skill_level(Effect_skill_group, Data#field_combat_hero.skill_list),
						  GroupID * 1000 + Lvl
				  end,
			lists:append(maps:get(effect, tb_special_skill:get(Key),EffectList))
		end, Acc, lib_fight_config:passive_skill_effect(SkillId))
	end, [], Data#field_combat_hero.skill_list).

%% 技能更改效果
skill_change_conf(Unit_id,SkillGroup,EffectList,FightData) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	ChangeConfList =
		?LISTS_FOLD(fun(SkillId, Acc) ->
			lists:foldl(fun(Conf, List) ->
				%% todo
%%				?JUDGE_RETURN(lib_fight_passive_skill:validation_passive_effect(?EFFECT_SKILL_CHANGE_EFFECT, SkillId, Conf, FightData),0),
				?JUDGE_RETURN(SkillGroup =:= maps:get(skill_group,Conf,0),0),
				lists:append(Conf,List)
			end, Acc, lib_field_fight_config:passive_skill_effect(SkillId))
		end, [], Data#field_combat_hero.skill_list),
	case ChangeConfList =:= [] of
		true -> {false,EffectList};
		false->
			NewEffectList = lists:foldl(fun(Effect,LIST) ->
				List1 =
					lists:foldl(fun(Conf, Effect1) ->
						case maps:get(effect,Effect1) =:= maps:get(change_effect,Conf) of
							true -> change_conf(Unit_id, Conf, FightData, Effect1);
							false-> [Effect1]
						end
					end, Effect, ChangeConfList),
				lists:append(LIST,List1)
			end,[],EffectList),
			{true,NewEffectList}
	end.

change_conf(Unit_id, Conf, FightData, Effect1) ->
	Type = maps:get(type,Conf,0),
	GroupID = maps:get(group,Conf),
	UpdateId = get_update_id(Type,GroupID,FightData,Conf,Unit_id),
	NewConf = tb_special_skill:get(UpdateId),
	case NewConf =:= false of
		true -> Effect1;
		false-> maps:get(effect,NewConf)
	end.

-define(NO,     0). %% 无需等级
-define(PROP,   1). %% 四维差
-define(LVL,    2). %% 等级
get_update_id(?NO,GroupID,_FightData,_Conf,_Unit_id) ->
	GroupID * 1000 + 1
;
get_update_id(?PROP,GroupID,FightData,Conf,Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	Name = 	case maps:get(type_value,Conf,1) of
				  1 -> ?STRENGTH;
				  2 -> ?INTELECT;
				  3 -> ?SPIRIT;
				  4 -> ?LEADERSHIP
			  end,
	NowProp = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, Name, lib_fight_data:get_fighter_prop(FightData#fight_data.object)),
	HeroConf = case Data#field_combat_hero.is_robot of true -> tb_monster_base:get(Data#field_combat_hero.robot_base_id); false -> tb_hero:get(Data#field_combat_hero.hero_id) end,
	ConfProp = maps:get(Name,HeroConf),
	Level = NowProp - ConfProp,
	case Level =< 0 of
		true -> GroupID * 1000 + 1;
		false-> GroupID * 1000 + Level
	end
;
get_update_id(?LVL,GroupID,_FightData,Conf,Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	Effect_skill_group = maps:get(type_value,Conf,0),
	%% todo
	Lvl = lib_fight_api:get_group_skill_level(Effect_skill_group, Data#field_combat_hero.skill_list),
	GroupID * 1000 + Lvl
;
get_update_id(Type,_GroupID,_FightData,_Conf,_Unit_id) ->
	?INFO("error conf update type ~p",[Type]),0
.