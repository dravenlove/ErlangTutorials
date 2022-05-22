%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 12月 2020 10:40
%%%-------------------------------------------------------------------
-author("13661").

%%激活方式
-define(ACTIVE_TYPE_PLAYER, 1).	%%玩家激活
-define(ACTIVE_TYPE_INIT, 	2).	%%初始固定技能激活

%%学习技能条件
-define(SKILL_HERO_TYPE_NO_LIMIT, 	0).	%%不限制
-define(SKILL_HERO_TYPE_WISDOM,		1).	%%智慧
-define(SKILL_HERO_TYPE_VALIANT,	2).	%%勇猛
-define(SKILL_HERO_TYPE_BALANCE,	3).	%%均衡
-define(SKILL_HERO_TYPE_WISDOM_OR_BALANCE, 	4).	%%智慧或均衡
-define(SKILL_HERO_TYPE_VALIANT_OR_BALANCE,	5).	%%勇猛或均衡

%%技能类型
-define(SKILL_TYPE_HERO,		1). %%英雄技
-define(SKILL_TYPE_INFANTRY,	2).	%%步兵技
-define(SKILL_TYPE_CAVALRY,		3).	%%骑兵技
-define(SKILL_TYPE_ARCHER,		4).	%%弓兵技
-define(SKILL_TYPE_MAGICIAN,	5).	%%方士技
-define(SKILL_TYPE_SUBSIDIARY,	6).	%%辅助技
-define(SKILL_TYPE_INTERIOR,	7).	%%内政技

%%解锁技能位条件
-define(SKILL_NUM_COND_TYPE_LEVEL,		1).	%% 等级
-define(SKILL_NUM_COND_TYPE_STAR,		2). %% 星级
-define(SKILL_NUM_COND_TYPE_SCIENCE, 	3). %% 科技等级

-record(skill, {
	id = 0,				%%技能ID
	level = 0,			%%技能等级
	is_active = false,	%%是否已激活
	active_type = 0,	%%激活类型
	active_level = 0,	%%激活等级
	is_fixed = false	%%是否是固定技能
}).