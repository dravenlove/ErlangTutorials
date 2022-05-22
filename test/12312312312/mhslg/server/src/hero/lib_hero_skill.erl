%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十一月 2020 10:12
%%%-------------------------------------------------------------------
-module(lib_hero_skill).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("ProtoPublic.hrl").

%% API
-export([
	hero_skill_to_proto/2,
	sign_in/0
]).
-export([
	init_hero_skill/1
]).
-export([
	update_fight_skill_group/3, %%更新技能组
	update_fight_skill_group/4,	%%更新技能组

	update_fight_skill_list/2
]).

hero_skill_to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		skill_list = Hero#hero.skill_list
	}
.

sign_in() ->
	lists:map(fun(HeroId) ->
		refresh_hero_skill(HeroId, false)
  	end, lib_hero_api:hero_id_list())
.

init_hero_skill(HeroId) ->
	refresh_hero_skill(HeroId, false)
.

refresh_hero_skill(HeroId, IsNotify) ->
	RunList = [
		{fun lib_hero:update_init_skill_group/2, [HeroId, false]},
		{fun lib_hero_skill_learning:update_learning_skill_group/2, [HeroId, false]},
		{fun lib_hero_crops_study:update_hero_crops_study_skill_group/2, [HeroId, false]},
		{fun lib_holy_spirit_hall_api:update_holy_spirit_hall_skill_group/2, [HeroId, false]},
		{fun lib_hero_destiny:update_hero_destiny_skill_group/2, [HeroId, false]},
		{fun lib_equip_api:update_skill_group/2, [HeroId, false]},
		{fun lib_hero_genius:update_skill_group/2, [HeroId, false]},
		{fun lib_hero_assist:update_skill_group/2, [HeroId, false]},
		{fun lib_hero_formation:update_skill_group/2, [HeroId, false]}
	],
	lib_common:try_run(RunList),

	case IsNotify of
		false -> skip;
		true -> lib_hero_api:notify_hero_update(HeroId, ?HERO_UPDATE_TYPE_SKILL)
	end
.

%%更新战斗技能组
%%GroupID: 哪个模块的更新
%%HeroId: 要更新的英雄ID
%%UpdateList: [技能ID]
update_fight_skill_group(GroupId, HeroId, UpdateList) when is_list(UpdateList) ->
	update_fight_skill_group(GroupId, HeroId, UpdateList, false)
.
update_fight_skill_group(GroupId, HeroId, UpdateList, IsNotify) when is_list(UpdateList) ->
	?INFO("~p ~ts update hero skill ~p ~p", [lib_player:player_id(), lib_player:player_name(), HeroId, nn]),
	?INFO("IsNotify ~p ",[IsNotify]),
	Hero = lib_hero_api:hero_info(HeroId),
	SkillGroup = dict:store(GroupId, UpdateList, Hero#hero.fight_skill_group),
	lib_hero_api:update_hero(Hero#hero{fight_skill_group = SkillGroup}),

	update_fight_skill_list(HeroId, IsNotify),
	process_hero_skill_update(GroupId,HeroId)
.

update_fight_skill_list(HeroId, IsNotify) ->
	try
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), -1),
		Hero = lib_hero_api:hero_info(HeroId),
		SkillList = dict:fold(fun(_GroupId, GroupSkillList, List) ->
			GroupSkillList ++ List
        end, [], Hero#hero.fight_skill_group),

		NewHero = Hero#hero{skill_list = SkillList},

		case IsNotify of
			false -> lib_hero_api:update_hero(NewHero, ?HERO_UPDATE_TYPE_NO_NOTIFY);
			true -> lib_hero_api:update_hero(NewHero, ?HERO_UPDATE_TYPE_SKILL)
		end
	catch
	    throw: {error, _} -> skip
	end
.

process_hero_skill_update(GroupId,HeroId) ->
	case GroupId =:= ?HERO_SKILL_HOLY_SPIRIT_HALL of
		 true -> skip;
		 false-> lib_holy_spirit_hall_api:recalculate_skill_id_by_hero_update(HeroId)
	end,
	RunList = [

	],
	lib_common:try_run(RunList)
.