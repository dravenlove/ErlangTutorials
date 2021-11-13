%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 十一月 2020 15:04
%%%-------------------------------------------------------------------
-module(lib_robot_api).
-author("13661").

-include("player.hrl").
-include("hero.hrl").
-include("combat_queue.hrl").
-include("fight_prop.hrl").
-include("common.hrl").
-define(SKILL_KEY2(Lib,Type), Lib * 100 + Type).
-define(SKILL_KEY3(Lib,Type,Sex), Lib * 100 + Type * 10 + Sex).

%% API
-export([
	robot_player_show/1,				%% 参数 robot_id  返回 #player_show{}
%%	robot_monster/1,					%% 参数 monster_id  返回 #hero_base{}
%%	robot_monster/2,
	monster_id_list_to_hero_base_list/2,%% 参数 RobotId monster_id list  返回 #hero_base{} list
	robot_monster_id_list/1,			%% 参数 robot_id  返回 monster_id list
	robot_monster_list/1,				%% 参数 robot_id  返回 #hero_base{} list
	monster_name/2,						%% 参数 monster_id  返回怪物名字

%%	robot_prop/4,
	former_type/1,
	latter_type/1,
	monster_sex/1,
	monster_type/1,
	monster_quality/1
]).
%% API
-export([
	get_monster/2,				%% 用怪物id生成怪物 =》 #player_base{}
	get_monster/4
]).

-export([
	guard_robot/2,				%% 获取一个城防军怪物
	genesis_church_robot/1,		%% 获取一个黄巾军怪物
	alien_invasion_robot/3,		%% 获取一个异族入侵怪物
	random_monster/1,
	random_monster_id/1
]).

-define(GENESIS_CHURCH_ROBOT,	106).	%% 启世教派
-define(GUARD_ROBOT,			107).	%% 城防军
-define(ALIEN_INVASION_ROBOT,	111).	%% 异族入侵

robot_player_show(RobotId) ->
	Config = tb_robot:get(RobotId),
	#player_show{
		id = RobotId,
		is_robot = true,
		country = maps:get(robot_country, Config, ""),
		name = maps:get(robot_name, Config, ""),
		sex = maps:get(robot_sex, Config, ""),
		head_icon = maps:get(robot_head, Config, ""),
		level = maps:get(robot_level, Config, 0),
		force = maps:get(robot_force, Config, 0)
	}
.

robot_monster_id_list(RobotId) ->
	Config = tb_robot:get(RobotId),
	maps:get(monster_id_list, Config, [])
.

robot_monster_list(RobotId) ->
	MonsterIdList = robot_monster_id_list(RobotId),
	[get_monster(MonsterId,RobotId) || MonsterId <- MonsterIdList]
.

monster_id_list_to_hero_base_list(RobotId,MonsterIdList) ->
	[get_monster(MonsterId,RobotId) || MonsterId <- MonsterIdList]
.


get_monster(MonsterId,RobotId) ->
	Config = tb_monster:get(MonsterId),
	BaseId = ger_base_id(Config),
	BaseConfig = tb_monster_base:get(BaseId),
	Former_type = get_config_value_rand(former_type, Config, BaseConfig, rand_former_type),
	Latter_type = get_config_value_rand(latter_type, Config, BaseConfig, rand_latter_type),
	get_monster(MonsterId,BaseId,Former_type,Latter_type,RobotId)
.

get_monster(MonsterId,Former_type,Latter_type,RobotId) ->
	Config = tb_monster:get(MonsterId),
	BaseId = ger_base_id(Config),
	get_monster(MonsterId,BaseId,Former_type,Latter_type,RobotId)
.

get_monster(MonsterId,BaseId,Former_type,Latter_type,RobotId) ->
	Config = tb_monster:get(MonsterId),
	BaseConfig = tb_monster_base:get(BaseId),
	Deploy_List = lists:append(maps:get(skill_list,Config,[]),maps:get(skill_list,BaseConfig,[])),
	SkillList = case Deploy_List =:= [] of true -> rand_skill(Config, BaseConfig,Former_type,Latter_type);false-> Deploy_List  end,
	get_monster(MonsterId,BaseId,SkillList,Config,BaseConfig,Former_type,Latter_type,RobotId)
.

get_monster(MonsterId,BaseId,SkillList,Config,BaseConfig,Former_type,Latter_type,RobotId) ->
%%	?INFO("MonsterId ~p",[MonsterId]),
%%	?INFO("BaseId ~p",[BaseId]),
	HeroLevel = get_config_value_rand(lvl, Config, BaseConfig, rand_lvl),
	HeroStar = get_config_value_rand(star, Config, BaseConfig, rand_star),
	FormerStage = get_config_value_rand(former_stage, Config, BaseConfig, rand_former_stage),
	LatterStage = get_config_value_rand(latter_stage, Config, BaseConfig, rand_latter_stage),
	FormerLevel = get_config_value_rand(former_level, Config, BaseConfig, rand_former_level),
	LatterLevel = get_config_value_rand(latter_level, Config, BaseConfig, rand_latter_level),
	EquipDict =
		lists:foldl(fun([EquipId, BreakLvl, Up], Acc) ->
			#{sub_type := Type} = tb_item:get(EquipId),
			Equip = #equip_info{
				hero_id = MonsterId,
				break_through = BreakLvl,
				up = Up
			},
			dict:store(Type, #item{
				equip_info = Equip,
				item_id = EquipId
			}, Acc)
	end, dict:new(), maps:get(equip, Config, [])),
	%% 圣灵大厅属性
	{HallSkillList,HallPropDict} = lib_holy_spirit_hall_api:robot_get_holy(#hero_base{robot_base_id = BaseId, former_type = Former_type, latter_type = Latter_type},RobotId),
	%% 阵法属性
	Type = get_config_value_rand(formation, Config, BaseConfig, rand_formation),
	{FormationSkillList,FormationPropDict} =
	case Type =:= 0 orelse Type =:= 1 of
		true -> {[],dict:new()};
		false -> Formation = lib_hero_formation:robot_formation(Type),
				{lib_hero_formation:calc_one_skill_list(Formation),lib_hero_formation:calc_one_formation_prop(Formation)}
	end,
	%% 命运属性
	{DestinySkillList,DestinyPropDict} =lib_hero_destiny:robot_get_destiny(maps:get(hero_id,BaseConfig)),


	NewSkillList1 = lists:append(FormationSkillList,SkillList),
	NewSkillList2 = lists:append(HallSkillList,DestinySkillList),
	NewSkillList = lists:append(NewSkillList1,NewSkillList2),
	Hero = #hero{
		id = BaseId,
		level = HeroLevel,
		star = HeroStar,
		front_stage = FormerStage,
		back_stage = LatterStage,
		front_level = FormerLevel,
		back_level = LatterLevel,
		equip_item_dict = EquipDict,
		skill_list = NewSkillList
	},
	?INFO("MonsterId ~p",[MonsterId]),
	EquipPropFlag = get_config_value(equip_prop, Config, BaseConfig),
	EquipProp = case EquipPropFlag of 1 -> lib_equip_api:calc_equip_prop(Hero); _ -> dict:new() end,
	EquipSkill = lib_equip_api:calc_equip_skill(Hero),

	NewHero = Hero#hero{skill_list = lists:append(EquipSkill,Hero#hero.skill_list)}	,
	PropBase = monster_to_prop_base(NewHero,BaseId,Former_type,Latter_type),
	ConfPropDict = robot_prop(PropBase, NewHero, Config, BaseConfig),
	NewPropDict = lib_fight_prop:increase_prop([HallPropDict,ConfPropDict,FormationPropDict,DestinyPropDict,EquipProp]),

	PropDict = lib_fight_prop:parsing_cfg_prop_dict(PropBase, NewPropDict),
	Force = lib_fight_prop:calc_force(PropBase, NewPropDict),
	#hero_base{
		id = MonsterId,
		robot_base_id = BaseId,
		former_type = Former_type,
		latter_type = Latter_type,
		level = Hero#hero.level,
		star = Hero#hero.star,
		awaken = Hero#hero.awaken,
		front_level = Hero#hero.front_level,
		back_level = Hero#hero.back_level,
		front_stage = Hero#hero.front_stage,
		back_stage = Hero#hero.back_stage,
		force = Force,
		equip_item_dict = Hero#hero.equip_item_dict,
		skill_list = NewHero#hero.skill_list,
		prop_dict = PropDict,
		honor_title = Hero#hero.honor_title
	}
.

monster_to_prop_base(#hero{id = HeroId, star = Star, skill_list = SkillList} = Hero, BaseId, Former_type, Latter_type) when is_record(Hero, hero) ->
	BaseConfig = tb_monster_base:get(BaseId),
	#prop_base{
		id = HeroId,
		sex = maps:get(sex, BaseConfig, 0),
		type = maps:get(hero_type, BaseConfig, 0),
		quality = maps:get(quality, BaseConfig, 0),
		color = lib_hero_api:hero_color(Star),
		front_corps = Former_type,
		back_corps = Latter_type,
		skill_list = SkillList
	}
.

robot_prop(_PropBase, Hero, Config, BaseConfig) ->
	%% 四维
	FourD1 = get_config_value(hero_strength, Config, BaseConfig),
	FourD2 = get_config_value(hero_intelect, Config, BaseConfig),
	FourD3 = get_config_value(hero_spirit, Config, BaseConfig),
	FourD4 = get_config_value(hero_leadership, Config, BaseConfig),
	Config1 = maps:put(hero_strength, FourD1, Config),
	Config2 = maps:put(hero_intelect, FourD2, Config1),
	Config3 = maps:put(hero_spirit, FourD3, Config2),
	Config4 = maps:put(hero_leadership, FourD4, Config3),
	ConfDict = lib_fight_prop:cfg_prop_dict_from_conf(Config4),
	LevelPropFlag = get_config_value(lvl_prop, Config, BaseConfig),
	LevelProp = case LevelPropFlag of 1 -> lib_hero_level:calc_level_prop(Hero); _ -> dict:new() end,
	StarPropFlag = get_config_value(star_prop, Config, BaseConfig),
	StarProp = case StarPropFlag of 1 -> lib_hero_star:calc_star_prop(Hero); _ -> dict:new() end,
	CorpsLevelPropFlag = get_config_value(corps_level_prop, Config, BaseConfig),
	CorpsLevelProp = case CorpsLevelPropFlag of 1 -> lib_hero_corps:calc_corps_level_prop(Hero); _ -> dict:new() end,
	CorpsStagePropFlag = get_config_value(corps_stage_prop, Config, BaseConfig),
	CorpsStageProp = case CorpsStagePropFlag of 1 -> lib_hero_corps:calc_corps_stage_prop(Hero); _ -> dict:new() end,

	lib_fight_prop:increase_prop([ConfDict, LevelProp, StarProp, CorpsLevelProp, CorpsStageProp]).


get_config_value_rand(KeyName, Config, BaseConfig, RandKeyName) ->
	case maps:is_key(KeyName, Config) of
		true ->
			maps:get(KeyName, Config);
		_ -> case maps:is_key(KeyName, BaseConfig) of
				 true -> maps:get(KeyName, BaseConfig);
				 false-> lib_random:rand_one(maps:get(RandKeyName, Config))
			 end
	end.


ger_base_id(Config) ->
	case maps:is_key(base_id,Config) of
		true -> maps:get(base_id,Config);
		_ 	 -> lib_random:rand_one(maps:get(rand_base_id,Config))
	end
.


rand_skill(Config, BaseConfig, Former_type, Latter_type) ->
	Hero_type = maps:get(hero_type,BaseConfig),
	Sex = maps:get(sex,BaseConfig),

	HeroLib = maps:get(hero_skill_lib,Config),
	Hero_skill_num = lib_random:rand_one(maps:get(rand_hero_skill_num,Config)),
	Hero_lvl_list = maps:get(rand_hero_skill_lvl,Config),

	FormerLib = maps:get(former_skill_lib,Config),
	Former_skill_num = lib_random:rand_one(maps:get(rand_former_skill_num,Config)),
	Former_lvl_list = maps:get(rand_former_skill_lvl,Config),

	LatterLib = maps:get(latter_skill_lib,Config),
	Latter_skill_num = lib_random:rand_one(maps:get(rand_latter_skill_num,Config)),
	Latter_lvl_list= maps:get(rand_latter_skill_lvl,Config),

	SupportLib = maps:get(support_skill_lib,Config),
	Support_skill_num = lib_random:rand_one(maps:get(rand_support_skill_num,Config)),
	Support_lvl_list = maps:get(rand_support_skill_lvl,Config),

	FormerGeneralLib = maps:get(former_general_attack_lib,Config),
	LatterGeneralLib = maps:get(latter_general_attack_lib,Config),
	DieSkillLib = maps:get(die_skill_lib,Config),

	SKill1 = maps:get(skill, tb_corps_general_attack:get(?SKILL_KEY2(FormerGeneralLib,Former_type))),
	SKill2 = maps:get(skill, tb_corps_general_attack:get(?SKILL_KEY2(LatterGeneralLib,Latter_type))),
	SKill3 = maps:get(skill, tb_here_die_attack:get(?SKILL_KEY2(DieSkillLib,Hero_type))),

	List1 = get_skill_list_in_lib(maps:get(skill, tb_hero_skill_list:get(?SKILL_KEY3(HeroLib,Hero_type,Sex))), Hero_skill_num,Hero_lvl_list),
	List2 = get_skill_list_in_lib(maps:get(skill, tb_corps_skill_list:get(?SKILL_KEY2(FormerLib,Former_type))), Former_skill_num,Former_lvl_list),
	List3 = get_skill_list_in_lib(maps:get(skill, tb_corps_skill_list:get(?SKILL_KEY2(LatterLib,Latter_type))), Latter_skill_num, Latter_lvl_list),
	List4 = get_skill_list_in_lib(maps:get(skill, tb_support_skill_list:get(?SKILL_KEY3(SupportLib,Hero_type,Sex))), Support_skill_num, Support_lvl_list),

	lists:append([SKill1,SKill2,SKill3],lists:append(List4, lists:append(List3, lists:append(List1, List2))))
.

get_skill_list_in_lib(ALLSkillList, Num, Rand_lvl_list) ->
	{List, _} =
		lists:foldl(fun(_, {Acc1, Acc2}) ->
			Lvl = lib_random:rand_one(Rand_lvl_list),
			Group = lib_random:rand_one(Acc2),
			{[Group * 1000 + Lvl | Acc1], lists:delete(Group, Acc2)}
					end, {[], ALLSkillList}, lists:seq(1, Num)),
	List
.


get_config_value(KeyName, Config, BaseConfig) ->
	get_config_value(KeyName, Config, BaseConfig, 0).

get_config_value(KeyName, Config, BaseConfig, Default) ->
	case maps:is_key(KeyName, Config) of
		true ->
			maps:get(KeyName, Config);
		_ ->
			maps:get(KeyName, BaseConfig, Default)
	end
.

monster_name(MonsterId,Robot_base_id) ->
	Config = tb_monster:get(MonsterId),
	BaseConfig = tb_monster_base:get(Robot_base_id),
	Name = get_config_value(name, Config, BaseConfig),
	language:auto(Name).

former_type(Robot_base_id) ->
	BaseConfig = tb_monster_base:get(Robot_base_id),
	case BaseConfig of
		false -> 0;
		_     -> maps:get(former_type, BaseConfig, 0)
	end.

latter_type(Robot_base_id) ->
	BaseConfig = tb_monster_base:get(Robot_base_id),
	case BaseConfig of
		false -> 0;
		_     -> maps:get(latter_type, BaseConfig, 0)
	end.

monster_sex(Robot_base_id) ->
	BaseConfig = tb_monster_base:get(Robot_base_id),
	case BaseConfig of
		false -> 0;
		_     -> maps:get(sex, BaseConfig, 0)
	end.

monster_type(Robot_base_id) ->
	BaseConfig = tb_monster_base:get(Robot_base_id),
	case BaseConfig of
		false -> 0;
		_     -> maps:get(hero_type, BaseConfig, 0)
	end.

monster_quality(Robot_base_id) ->
	BaseConfig = tb_monster_base:get(Robot_base_id),
	case BaseConfig of
		false -> 0;
		_     -> maps:get(quality, BaseConfig, 0)
	end.




guard_robot(Type, Level) ->
	random_monster((?GUARD_ROBOT * 10 + Type) * 1000 + Level)
.
genesis_church_robot(Robot) ->
	random_monster(Robot)
.

alien_invasion_robot(Type, Level, MonsterNum) ->
	RobotId = (?ALIEN_INVASION_ROBOT * 10 + Type) * 1000 + Level,
	?DEBUG("~p",[RobotId]),
	MonsterList = [(random_monster(RobotId))#combat_hero{id = RobotId * 100 + X} || X <- lists:seq(1, MonsterNum)],
	{RobotId, MonsterList}
.

random_monster(RobotId) ->
	RobotShow = lib_robot_api:robot_player_show(RobotId),
	MonsterId = random_monster_id(RobotId),
	HeroBase = get_monster(MonsterId,RobotId),
	lib_combat_queue_api:to_combat_hero(RobotShow, HeroBase)
.
random_monster_id(RobotId) ->
	lib_random:rand_one(maps:get(monster_id_list, tb_robot:get(RobotId)))
.