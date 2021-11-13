%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 11:48
%%%-------------------------------------------------------------------
-author("13661").
-include("common.hrl").


%%英雄性别
-define(HERO_SEX_MAN, 	1). %%男
-define(HERO_SEX_WOMAN, 2). %%女

%%英雄类型
-define(HERO_TYPE_WISDOM, 	1). %%智慧
-define(HERO_TYPE_VALIANT, 	2).	%%勇猛
-define(HERO_TYPE_BALANCE, 	3).	%%均衡

%%英雄品质
-define(HERO_QUALITY_WARRIOR,	1).	%%勇士
-define(HERO_QUALITY_HEROES,	2).	%%英豪
-define(HERO_QUALITY_KINGDOM,	3).	%%王者
-define(HERO_QUALITY_VIRGIN,	4).	%%圣女
-define(HERO_QUALITY_WAR_GOD,	5).	%%战神

%%兵种类型
-define(CORPS_TYPE_CAVALRY, 	2).	%%骑兵
-define(CORPS_TYPE_INFANTRY,	1). %%步兵
-define(CORPS_TYPE_ARCHER, 		3).	%%弓兵
-define(CORPS_TYPE_MAGICIAN, 	4).	%%方士
-define(HERO_CORPS_LIST, [?CORPS_TYPE_INFANTRY, ?CORPS_TYPE_CAVALRY, ?CORPS_TYPE_ARCHER, ?CORPS_TYPE_MAGICIAN]).

%%英雄颜色
-define(HERO_COLOR_WHITE,		1). %%白
-define(HERO_COLOR_GREEN,		2).	%%绿
-define(HERO_COLOR_BLUE,		3).	%%蓝
-define(HERO_COLOR_PURPLE,		4). %%紫
-define(HERO_COLOR_ORANGE,		5). %%橙
-define(HERO_COLOR_RED,			6). %%红

%%英雄激活方式
-define(HERO_ACTIVE_TYPE_COMPOSE,	1).	%%碎片合成
-define(HERO_ACTIVE_TYPE_SYSTEM,	2).	%%创角赠送
-define(HERO_ACTIVE_TYPE_COMMAND,	3). %%测试命令

%% 英雄觉醒
-define(HERO_AWAKEN_NO,		0).	%% 未觉醒
-define(HERO_AWAKEN_YES,	1).	%% 已觉醒

%%英雄更新类型
-define(HERO_UPDATE_TYPE_START,		0). %%开始
-define(HERO_UPDATE_TYPE_NO_NOTIFY, 0). %%不通知
-define(HERO_UPDATE_TYPE_ADD,		1).	%%增加英雄
-define(HERO_UPDATE_TYPE_DEL,		2).	%%删除英雄
-define(HERO_UPDATE_TYPE_ALL,		3).	%%全部信息
-define(HERO_UPDATE_TYPE_SKILL,		4).	%%技能信息
-define(HERO_UPDATE_TYPE_LEVEL,		5).	%%等级信息
-define(HERO_UPDATE_TYPE_STAR,		6).	%%星级信息
-define(HERO_UPDATE_TYPE_CORPS_STAGE,	7). %%兵种等阶
-define(HERO_UPDATE_TYPE_CORPS_LEVEL,	8). %%兵种等级
-define(HERO_UPDATE_TYPE_SKILL_LEARNING,9). %%技能学习
-define(HERO_UPDATE_TYPE_HONOR_TITLE,10). %%称号信息
-define(HERO_UPDATE_TYPE_EQUIP,		11). %%装备信息
-define(HERO_UPDATE_TYPE_HALL_INFO,		12). %%圣灵大厅加成信息
-define(HERO_UPDATE_SCIENCE,            13). %%科技效果加成信息
-define(HERO_UPDATE_INNER_CITY,         14). %%内城建筑效果加成信息
-define(HERO_UPDATE_DESTINY,         	15). %%英雄命运加成信息
-define(HERO_UPDATE_AWAKEN,				16). %%英雄觉醒信息
-define(HERO_UPDATE_CROPS_STUDY,		17). %%英雄兵种研究加成信息
-define(HERO_UPDATE_STAR_INFO,			18). %%英雄星座系统加成信息
-define(HERO_UPDATE_ASSIST,				19). %%英雄助战信息
-define(HERO_UPDATE_TYPE_FORMATION,		20). %% 英雄阵法信息
-define(HERO_UPDATE_TYPE_END,			20). %%结尾, 每次增加类型时需修改

%%英雄技能组
-define(HERO_SKILL_GROUP_INIT,			1). %%英雄初始技能
-define(HERO_SKILL_GROUP_LEARNING,		2). %%英雄技能学习
-define(HERO_SKILL_DESTINY,				3). %%英雄命运技能
-define(HERO_SKILL_GENIUS,				4). %%英雄天赋技能
-define(HERO_SKILL_EQUIP,				5). %%英雄装备技能
-define(HERO_SKILL_CROPS_STUDY,			6). %%英雄兵种研究技能
-define(HERO_SKILL_HOLY_SPIRIT_HALL,	7). %%英雄圣灵大厅技能
-define(HERO_SKILL_ASSIST,				8). %%英雄助战技能
-define(HERO_SKILL_GROUP_FORMATION,		9). %% 英雄阵法技能

%%英雄属性类型
-define(HERO_PROP_TYPE_INIT,			1). %%英雄初始属性
-define(HERO_PROP_TYPE_LEVEL,			2).	%%英雄等级属性
-define(HERO_PROP_TYPE_STAR,			3).	%%英雄星级属性
-define(HERO_PROP_TYPE_CORPS_LEVEL,		4).	%%英雄兵种等级属性
-define(HERO_PROP_TYPE_CORPS_STAGE,		5).	%%英雄兵种等阶属性
-define(HERO_PROP_TYPE_SKILL_LEARNING,	6). %%英雄技能学习属性
-define(HERO_PROP_TYPE_HONOR_TITLE,		7). %%英雄称号属性
-define(HERO_PROP_TYPE_EQUIP,			8). %%英雄装备属性
-define(HOLY_SPIRIT_HALL_ADDITION,		9). %%圣灵大厅属性
-define(HERO_PROP_SCIENCE,              10).%%心树科技属性
-define(HERO_PROP_INNER_CITY,           11).%%内城建筑属性
-define(HERO_PROP_DESTINY,          	12).%%英雄命运属性
-define(HERO_PROP_GENIUS,				13).%%英雄天赋属性
-define(HERO_CROPS_STUDY,				14).%%英雄兵种研究属性
-define(HERO_STAR_INFO,					15).%%英雄星座属性
-define(HERO_PROP_ASSIST,				16).%%英雄助战属性
-define(HERO_PROP_TYPE_FORMATION,		17).%% 英雄阵法属性

-define(NO_PACK_TEST, false). %%todo 测试

-record(hero, {			%%英雄信息
	id = 0,				%%英雄ID
	active_type = 0,	%%激活类型

	level = 1,			%%等级
	exp = 0,			%%经验
	star = 0,			%%星级
	awaken = 0,			%% 觉醒
	front_level = 0,	%%前军等级
	back_level = 0,		%%后军等级
	front_stage = 0,	%%前军等阶
	back_stage = 0,		%%后军等阶

	force = 0,			%%战力
	activate_destiny_list = [], %% 激活命运列表

	equip_item_dict = dict:new(),	%%装备dict, key:equip_type,val:#item
	prev_prop_dict = dict:new(), %%上一次的属性dict
	prop_dict = dict:new(), %%属性dict
	skill_list = [],	%%技能列表[战斗技能ID]
	fight_skill_group = dict:new(),	 %%技能dict, key:组类型, val: [战斗技能ID]
	skill_learning_map = maps:new(), %%key:技能ID val:#skill
	skill_learning_num_map = maps:new(), %%key:技能类型 val:最多有效数量
	honor_title = #hero_title{},
	hero_star = #star_hero{},
	assist = lib_hero_assist:new(),			%% 副将
	formation = lib_hero_formation:new(),	%% 阵法

	rend
}).

-record(hero_base, { 	%%英雄基础信息
	id = 0,				%%英雄ID
	robot_base_id = 0,	%%怪物base_id (随机怪物模型使用)
	former_type = 0,	%%怪物前军
	latter_type = 0,	%%怪物后军
	level = 0,			%%等级
	star = 0,			%%星级
	awaken = 0,			%%觉醒
	front_level = 0,	%%前军等级
	back_level = 0,		%%后军等级
	front_stage = 0,	%%前军等阶
	back_stage = 0,		%%后军等阶
	force = 0,			%%战力
	equip_item_dict = dict:new(),	%%装备dict
	skill_list = [],	%%技能列表[战斗技能ID]
	prop_dict = dict:new(), %%属性dict
	honor_title = #hero_title{},
	formation_id = 0
}).

-record(player_hero, {
	id = 0,		%%玩家ID
	name = "",	%%玩家名字
	country = 0,
	hero_dict  = dict:new(), %%英雄dict key:hero_id val:#hero
	prop_all_update = false, %%更新全部英雄属性
	prop_update_sets = sets:new() %%需要更新属性的英雄set
}).