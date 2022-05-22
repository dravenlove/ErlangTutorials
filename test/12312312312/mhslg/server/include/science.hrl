%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 1月 2021 16:49
%%%-------------------------------------------------------------------
-author("13661").

-define(SCIENCE_STATE_NONE,     0). %% 空闲
-define(SCIENCE_STATE_UPGRADE,  1). %% 升级中
-define(SCIENCE_STATE_FINISH,   2). %% 升级完成待激活

-define(EFFECT_TYPE_HERO_PROP,          1). %% X类型英雄增加属性
-define(EFFECT_ARMS_HERO_PROP,          2). %% 拥有X兵种英雄增加属性
-define(EFFECT_COLOR_HERO_PROP,         3). %% X颜色以上英雄增加属性
-define(EFFECT_QUALITY_HERO_PROP,       4). %% 增加X品质（quality）英雄属性
-define(EFFECT_TRIBUTE_OPEN_CD_REDUCE,  5). %% 百分比减少贡品开启CD
-define(EFFECT_SCIENCE_UPGRADE_TIME_REDUCE, 6). %% 百分比减少科技学习时间
-define(EFFECT_SCIENCE_UPGRADE_COST_REDUCE, 7). %% 百分比减少科技学习X消耗数量
-define(EFFECT_BARRACKS_TRAIN_COST_REDUCE,  8). %% 百分比减少所有兵营训练所耗资源
-define(EFFECT_MARCH_COST_REDUCE,           9). %% 百分比减少所有英雄行军消耗粮草数量*
-define(EFFECT_ARMS_TRAIN_TIME_REDUCE,      10). %% 百分比减少X兵种训练时间
-define(EFFECT_EQUIP_BREAK_TIME_REDUCE,     11). %% 百分比减少装备突破时间*
-define(EFFECT_EQUIP_BREAK_COST_REDUCE,     12). %% 百分比减少装备突破所需消耗X道具数量*
-define(EFFECT_EQUIP_CLEAR_COST_REDUCE,     13). %% 百分比减少装备洗练消耗道具数量*
-define(EFFECT_EQUIP_MAKE_TIME_REDUCE,      14). %% 百分比减少装备制作时间*
-define(EFFECT_ARMS_MAX_NUMBER_ADD,         15). %% 百分比增加X兵营兵种最大存量
-define(EFFECT_TRIBUTE_NUMBER_ADD,          16). %% 百分比增加贡品刀币奖励数量
-define(EFFECT_BUILD_REWARD_ADD,            17). %% 百分比增加建设获得功勋*
-define(EFFECT_INNER_CITY_YIELD_ADD,        18). %% 百分比增加内城X产业每小时产量
-define(EFFECT_CHAPTER_REWARD_ADD,          19). %% 百分比增加沙盘演义（信仰战争）挑战奖励数量
-define(EFFECT_MAP_YIELD_TASK_REWARD_ADD,   20). %% 百分比增加世界地图X产业作业收益*
-define(EFFECT_MARCH_SPEED_ADD,             21). %% 百分比增加所有英雄行军速度*
-define(EFFECT_AFFAIR_REWARD_ADD,           22). %% 百分比增加政务功勋奖励*
-define(EFFECT_ARMS_TRAIN_NUMBER_ADD,       23). %% 百分比增加X兵种单次训练量
-define(EFFECT_MAP_YIELD_HOUR_REWARD_ADD,   24). %% 百分比增加X产业每小时产量*
-define(EFFECT_EQUIP_BREAK_RATE_ADD,        25). %% 百分比增加X装备部位突破成功率*
-define(EFFECT_CHUANSHI_SKILL_NUMBER_ADD,   26). %% 增加传识获得技能数量
-define(EFFECT_CHUANSHI_SOUL_NUMBER_ADD,    27). %% 增加传识获得灵魂数量
-define(EFFECT_PUB_REWARD_NUMBER_ADD,       28). %% 增加酒馆X招募类型获得碎片数量
-define(EFFECT_SCIENCE_ITEM_REWARD,         29). %% 增加每日获得X道具数量(心树科技系统)
-define(EFFECT_BATTLE_FREE_TIMES_ADD,       30). %% 增加每日切磋免费挑战次数
-define(EFFECT_BATTLE_REWARD_NUMBER_ADD,    31). %% 增加切磋获得技能碎片奖励数量
-define(EFFECT_CHAPTER_FREE_TIMERS_ADD,     32). %% 增加沙盘演义免费挑战次数
-define(EFFECT_SHENWEN_MAX_LEVEL_ADD,       33). %% 增加神纹等级上限
-define(EFFECT_OLD_ENEMY_MAX_LEVEL_ADD,     34). %% 增加宿敌等级上限
-define(EFFECT_OLD_ENEMY_MAX_NUMBER_ADD,    35). %% 增加宿敌数量上限
-define(EFFECT_TYPE_SKILL_LEARNING_MAX_LEVEL_ADD,   36). %% 增加英雄X类型技能的等级上限
-define(EFFECT_QUALITY_SKILL_LEARNING_NUMBER_ADD,   37). %% 增加X品质（quality）英雄Y技能位
-define(EFFECT_SEX_SKILL_LEARNING_NUMBER_ADD,       38). %% 增加X性别英雄Y技能位
-define(EFFECT_COLOR_STARS_MAX_LEVEL_ADD,   39). %% 增加X颜色星辰等级上限
-define(EFFECT_HELP_FIGHT_SKILL_MAX_LEVEL_ADD,      40). %% 增加助战英雄X技能等级上限
-define(EFFECT_EQUIP_TRAIN_MAX_LEVEL_ADD,   41). %% 增加装备强化等级上限*
-define(EFFECT_PUPPET_CHALLENGE_TIMES_ADD,	42). %% 增加混沌傀儡每日挑战次数
-define(EFFECT_GOVERNMENT_TASK_TIMES_ADD,	43). %% 增加政务任务次数

-record(science, {
	id = 0,                 %% 科技ID
	level = 0,              %% 科技等级
	state = 0,              %% 状态
	start_tick = 0,         %% 升级开始时间
	accelerate_time = 0     %% 加速时间
}).

-record(player_science, {
	id = 0,                         %% 玩家ID
	science_map = maps:new(),       %% 科技map 科技ID => #science
	upgrading_set = gb_sets:new(),  %% 升级中的科技set [科技ID]
	is_received = true             %% 是否已领取每天道具
}).