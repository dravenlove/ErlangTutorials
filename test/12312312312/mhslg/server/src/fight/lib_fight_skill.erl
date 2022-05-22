%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_fight_skill
%%% Created on : 2020/8/15 0015 11:02
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_fight_skill).
-author("glendy").
-include("common.hrl").
-include("fight.hrl").

%% API
-export([
	bson_list_to_skill_map/1,
	skill_map_to_bson_list/1,
	bson_to_fight_skill/1,
	fight_skill_to_bson/1
]).

bson_list_to_skill_map(BsonList) ->
	bson_list_to_skill_map(#{}, BsonList).
bson_list_to_skill_map(SkillMap, []) ->
	SkillMap;
bson_list_to_skill_map(SkillMap, [Bson | T]) ->
	FightSkill = bson_to_fight_skill(Bson),
	bson_list_to_skill_map(maps:put(FightSkill#fight_skill.skill_id, FightSkill, SkillMap), T).

skill_map_to_bson_list(SkillMap) ->
	maps:fold(
		fun(_, FightSkill, AccBsonList0) ->
			Bson = fight_skill_to_bson(FightSkill),
			[Bson | AccBsonList0]
		end, [], SkillMap).

bson_to_fight_skill(Bson) ->
	#fight_skill{
		skill_id = ?BSON_INT(Bson, <<"skill_id">>),
		skill_level = ?BSON_INT(Bson, <<"skill_level">>)
	}.

fight_skill_to_bson(FightSkill) ->
	#{
		?BSONSET_INT(<<"skill_id">>, FightSkill#fight_skill.skill_id),
		?BSONSET_INT(<<"skill_level">>, FightSkill#fight_skill.skill_level)
	}.
