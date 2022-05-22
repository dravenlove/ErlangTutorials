%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. Aug 2021 11:40 AM
%%%-------------------------------------------------------------------
-module(lib_hero_formation).
-author("lichaoyu").
-include("common.hrl").
-include("hero.hrl").
-include("ProtoClient_10116.hrl").

%% API
-export([		%% 通用
	new/0,
	formation_conf/1,
	formation_to_bson/1,
	bson_to_formation/1,
	to_proto/2,
	calc_formation_prop/1,
	robot_formation/1,
	robot_formation/3,
	calc_one_skill_list/1,
	calc_one_formation_prop/1

]).
-export([		%% 玩家进程
	type_stage_num/2,			%% 玩家拥有该阵法类型等级的英雄数量

	update_skill_group/2,
	reset/1,					%% 阵法重置

	request_hero_formation_use/1,		%% 请求阵法激活
	request_hero_formation_level/1,		%% 请求阵法升级
	request_hero_formation_stage/1,		%% 请求阵法升阶
	request_hero_formation_reset/1		%% 请求阵法重置
]).

-define(LEVEL_ID(Type, Level),	Type * 1000 + Level).	%% 等级id
-define(STAGE_ID(Type, Stage),	Type * 100 + Stage).	%% 阶级id

-define(DEFINE_STAGE,	1).	%% 默认阶级
-define(DEFINE_LEVEL,	0).	%% 默认等级
-define(NO_FORMATION,	1).	%% 无阵法
-define(UN_USE,			0).	%% 未使用
-define(ON_USE,			1).	%% 在使用

-record(formation, { %% 阵法
	stage = ?DEFINE_STAGE,	%% 阶数
	level = ?DEFINE_LEVEL,	%% 等级
	is_use = ?UN_USE		%% 是否使用
}).

new() ->
	{#formation{}, #formation{}, #formation{}}
.

formation_conf(HeroId) ->
	Conf = tb_hero:get(HeroId),
	maps:get(formation, Conf)
.

formation_to_bson(FormationTuple) ->
	FormationList = tuple_to_list(FormationTuple),
	[#{
		?BSONSET_INT(<<"stage">>, Formation#formation.stage),
		?BSONSET_INT(<<"level">>, Formation#formation.level),
		?BSONSET_INT(<<"is_use">>, Formation#formation.is_use)
	} || Formation <- FormationList]
.

bson_to_formation([]) ->
	new()
;
bson_to_formation(BsonList) ->
	FormationList = [#formation{
		stage = ?BSON_INT(Bson, <<"stage">>),
		level = ?BSON_INT(Bson, <<"level">>),
		is_use = ?BSON_INT(Bson, <<"is_use">>)
	} || Bson <- BsonList],
	list_to_tuple(FormationList)
.

to_proto(Proto, Hero) ->
	FormationList = tuple_to_list(Hero#hero.formation),
	ProtoFormationList = [to_proto(Formation) || Formation <- FormationList],
	Proto#'ProtoHero'{
		formation_list = ProtoFormationList
	}
.
to_proto(Formation) ->
	#'ProtoHeroFormation'{
		class = Formation#formation.stage,
		level = Formation#formation.level,
		is_use = Formation#formation.is_use
	}
.

robot_formation(Type) ->
	robot_formation(Type, 1, 1)
.
robot_formation(Type, Stage, Level) ->
	Formation = #formation{
		level = Level,
		stage = Stage,
		is_use = ?ON_USE
	},
	{Type, Formation}
.

calc_back_item(Hero) ->
	FormationInfo = tuple_to_list(Hero#hero.formation),
	FormationConf = formation_conf(Hero#hero.id),
	FormationList = lists:zip(FormationConf, FormationInfo),
	BackItemList = lists:foldl(
		fun(Formation, List) ->
			calc_one_back_item(Formation) ++ List
		end, [], FormationList),
	lib_item_api:merge_conf_item_list(BackItemList)
.
calc_one_back_item({Type, Formation}) ->
	Level = Formation#formation.level,
	BeginLevelId = ?LEVEL_ID(Type, ?DEFINE_LEVEL),
	EndLevelId = ?LEVEL_ID(Type, Level - 1),
	LevelIdList = lists:seq(BeginLevelId, EndLevelId),
	LevelItemList = [
		begin
			Conf = tb_formation_level:get(LevelId),
			maps:get(consume, Conf)
		end || LevelId <- LevelIdList],
	Stage = Formation#formation.stage,
	BeginStageId = ?STAGE_ID(Type, ?DEFINE_STAGE),
	EndStageId = ?STAGE_ID(Type, Stage - 1),
	StageIdList = lists:seq(BeginStageId, EndStageId),
	StageItemList = [
		begin
			Conf = tb_formation_stage:get(StageId),
			maps:get(consume, Conf)
		end || StageId <- StageIdList],
	lib_item_api:merge_conf_item_list(LevelItemList, StageItemList)
.

calc_formation_prop(Hero) ->
	FormationInfo = tuple_to_list(Hero#hero.formation),
	FormationConf = formation_conf(Hero#hero.id),
	FormationList = lists:zip(FormationConf, FormationInfo),
	FormationPropList = [calc_one_formation_prop(Formation) || Formation <- FormationList],
	lib_fight_prop:increase_prop(FormationPropList)
.
calc_one_formation_prop({Type, Formation}) ->
	Level = Formation#formation.level,
	LevelId = ?LEVEL_ID(Type, Level),
	PassiveConf = tb_formation_passive_porp:get(LevelId),
	PassiveProp = lib_fight_prop:cfg_prop_dict_from_conf(PassiveConf),
	case Formation#formation.is_use of
		?UN_USE -> PassiveProp;
		?ON_USE ->
			ActivateConf = tb_formation_activate_porp:get(LevelId),
			ActivateProp = lib_fight_prop:cfg_prop_dict_from_conf(ActivateConf),
			Stage = Formation#formation.stage,
			BeginStageId = ?STAGE_ID(Type, ?DEFINE_STAGE),
			EndStageId = ?STAGE_ID(Type, Stage),
			StageIdList = lists:seq(BeginStageId, EndStageId),
			StagePropList = [
				begin
					StageConf = tb_formation_stage:get(StageId),
					StagePropConf = maps:get(prop, StageConf, #{}),
					lib_fight_prop:cfg_prop_dict_from_conf(StagePropConf)
				end || StageId <- StageIdList],
			StageProp = lib_fight_prop:increase_prop(StagePropList),
			lib_fight_prop:increase_prop([PassiveProp, ActivateProp, StageProp])
	end
.

calc_skill_list(Hero) ->
	FormationInfo = tuple_to_list(Hero#hero.formation),
	FormationConf = formation_conf(Hero#hero.id),
	FormationList = lists:zip(FormationConf, FormationInfo),
	calc_skill_list(FormationList, [])
.
calc_skill_list([{Type, Formation} | FormationList], SkillList) ->
	NewSkillList =
		case Formation#formation.is_use of
			?UN_USE -> SkillList;
			?ON_USE ->
				Stage = Formation#formation.stage,
				BeginStageId = ?STAGE_ID(Type, ?DEFINE_STAGE),
				EndStageId = ?STAGE_ID(Type, Stage),
				StageIdList = lists:seq(BeginStageId, EndStageId),
				StageSkillList = [StageSkill || StageId <- StageIdList,
					begin
						StageConf = tb_formation_stage:get(StageId),
						StageSkill = maps:get(skill, StageConf, 0),
						StageSkill =/= 0
					end],
				StageSkillList ++ SkillList
		end,
	calc_skill_list(FormationList, NewSkillList)
;
calc_skill_list([], SkillList) ->
	SkillList
.

calc_one_skill_list({Type, Formation}) ->
	case Formation#formation.is_use of
		?UN_USE -> [];
		?ON_USE ->
			Stage = Formation#formation.stage,
			BeginStageId = ?STAGE_ID(Type, ?DEFINE_STAGE),
			EndStageId = ?STAGE_ID(Type, Stage),
			StageIdList = lists:seq(BeginStageId, EndStageId),
			StageSkillList = [StageSkill || StageId <- StageIdList,
				begin
					StageConf = tb_formation_stage:get(StageId),
					StageSkill = maps:get(skill, StageConf, 0),
					StageSkill =/= 0
				end],
			StageSkillList
	end
.

type_stage_num(Type, Stage) ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fold(
		fun(HeroId, Hero, Acc) ->
			FormationConf = lib_hero_formation:formation_conf(HeroId),
			case lib_api:list_index(Type, FormationConf) of
				0 -> Acc;
				Index ->
					FormationTuple = Hero#hero.formation,
					Formation = element(Index, FormationTuple),
					?IIF(Formation#formation.stage >= Stage, Acc + 1, Acc)
			end
		end, 0, PlayerHero#player_hero.hero_dict)
.

update_skill_group(HeroId, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillList = calc_skill_list(Hero),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_GROUP_FORMATION, HeroId, SkillList, IsNotify)
.

update_prop_and_skill(HeroId) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_FORMATION),
	update_skill_group(HeroId, true)
.

update_info(Hero) ->
	lib_hero_api:update_hero(Hero, ?HERO_UPDATE_TYPE_FORMATION)
.

reset(HeroId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	NewHero = Hero#hero{formation = new()},
	update_info(NewHero),
	update_prop_and_skill(HeroId),
	calc_back_item(Hero)
.

request_hero_formation_use(Msg) ->
	HeroId = Msg#'Proto10116091'.hero_id,
	Index = Msg#'Proto10116091'.index,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Hero = lib_hero_api:hero_info(HeroId),
	FormationTuple = Hero#hero.formation,
	Formation = element(Index, FormationTuple),
	NewFormationTuple =
		case Formation#formation.is_use of
			?UN_USE ->
				FormationList = tuple_to_list(FormationTuple),
				NewFormationList = [F#formation{is_use = ?UN_USE} || F <- FormationList],
				FormationTuple0 = list_to_tuple(NewFormationList),
				NewFormation = Formation#formation{is_use = ?ON_USE},
				setelement(Index, FormationTuple0, NewFormation);
			?ON_USE ->
				NewFormation = Formation#formation{is_use = ?UN_USE},
				setelement(Index, FormationTuple, NewFormation)
		end,
	NewHero = Hero#hero{formation = NewFormationTuple},
	update_info(NewHero),
	update_prop_and_skill(HeroId),
	lib_send:respond_to_client(?MSG_RETURN_HERO_FORMATION_USE)
.


request_hero_formation_level(Msg) ->
	HeroId = Msg#'Proto10116092'.hero_id,
	Index = Msg#'Proto10116092'.index,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Hero = lib_hero_api:hero_info(HeroId),
	FormationTuple = Hero#hero.formation,
	Formation = element(Index, FormationTuple),
	FormationConf = formation_conf(HeroId),
	Type = lists:nth(Index, FormationConf),
	Level = Formation#formation.level,
	LevelId = ?LEVEL_ID(Type, Level),
	Conf = tb_formation_level:get(LevelId),
	Consume = maps:get(consume, Conf),
	lib_equip_api:item(Consume, ?USE_HERO_FORMATION_LEVEL, HeroId),
	NewFormation = Formation#formation{level = Level + 1},
	NewFormationTuple = setelement(Index, FormationTuple, NewFormation),
	NewHero = Hero#hero{formation = NewFormationTuple},
	update_info(NewHero),
	update_prop_and_skill(HeroId),
	lib_send:respond_to_client(?MSG_RETURN_HERO_FORMATION_LEVEL)
.

request_hero_formation_stage(Msg) ->
	HeroId = Msg#'Proto10116093'.hero_id,
	Index = Msg#'Proto10116093'.index,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Hero = lib_hero_api:hero_info(HeroId),
	FormationTuple = Hero#hero.formation,
	Formation = element(Index, FormationTuple),
	FormationConf = formation_conf(HeroId),
	Type = lists:nth(Index, FormationConf),
	Stage = Formation#formation.stage,
	StageId = ?STAGE_ID(Type, Stage),
	Conf = tb_formation_stage:get(StageId),
	case maps:find(condition, Conf) of
		error -> skip;
		{ok, [GoalStage, GoalNum]} ->
			Num = type_stage_num(Type, GoalStage),
			?JUDGE_RETURN(Num >= GoalNum, ?ERROR_CLIENT_OPERATOR)
	end,
	Consume = maps:get(consume, Conf),
	lib_equip_api:item(Consume, ?USE_HERO_FORMATION_STAGE, HeroId),
	NewFormation = Formation#formation{stage = Stage + 1},
	NewFormationTuple = setelement(Index, FormationTuple, NewFormation),
	NewHero = Hero#hero{formation = NewFormationTuple},
	update_info(NewHero),
	update_prop_and_skill(HeroId),
	lib_send:respond_to_client(?MSG_RETURN_HERO_FORMATION_STAGE)
.

request_hero_formation_reset(Msg) ->
	HeroId = Msg#'Proto10116094'.hero_id,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Conf = tb_const:get(hero_formation_reset),
	Consume = maps:get(jsonvalue, Conf),
	lib_equip_api:item(Consume, ?USE_HERO_FORMATION_RESET, HeroId),
	BackItem = reset(HeroId),
	lib_equip_api:item(BackItem, ?ADD_HERO_FORMATION_RESET, HeroId),
	lib_send:respond_to_client(?MSG_RETURN_HERO_FORMATION_RESET)
.

