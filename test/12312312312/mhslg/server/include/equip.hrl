%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2020 6:14 PM
%%%-------------------------------------------------------------------

-ifndef('equip_HRL').
-define('equip_HRL', true).

-define(BACK_FAIL,			0).
-define(BACK_SUCCESS,		1).

-define(QUALITY_WHITE,	1).		%%白色品质
-define(QUALITY_GREEN,	2).		%%绿色品质
-define(QUALITY_BLUE,	3).		%%蓝色品质
-define(QUALITY_PURPLE,	4).		%%紫色品质
-define(QUALITY_ORANGE,	5).		%%橙色品质

-define(SHEN_BING,		1).		%%神兵
-define(ZUO_QI,			2).		%%坐骑
-define(BAO_DIAN,		3).		%%宝典
-define(QI_ZHEN,		4).		%%奇珍
-define(LING_FU,		5).		%%令符
-define(HE_XIN,			6).		%% 核心
-define(EQUIP_PART_LIST, [		%%装备部位列表
	?SHEN_BING,
	?ZUO_QI,
	?BAO_DIAN,
	?QI_ZHEN,
	?LING_FU,
	?HE_XIN
]).

-define(WASH_BEFORE,	1).		%%洗练前位置
-define(WASH_LOCK,		2).		%%洗练上锁位置
-define(WASH_AFTER,		3).		%%洗练后位置
-define(WASH_FINGER,	4).		%%洗练金手指位置

-define(RANDOM_MAKE,	0).	%% 随机制作
-define(FIXED_MAKE,		1).	%% 固定制作

-define(IN_EQUIP_BREAK,	1).	%% 装备突破中，param = UniqueId
-define(IN_EQUIP_MAKE,	2).	%% 装备制作中，param = MakeId

-define(EQUIP_TYPE_NUM, 6).		%%装备类型种类

-define(DEFINE_BREAK,		1).	%% 装备默认阶数
-define(EQUIP_APPEND_CONDITION,		[1, 3, 6]).	%% todo tb_const

-define(EQUIP_LEVEL(Break, Up),		Break * 10 + Up).
-define(EQUIP_BREAK_ID(ItemId, Break),	ItemId * 10 + Break).
-define(EQUIP_UP_ID(Type, Up),			Type * 100000 + Up).
-define(EQUIP_LEVEL_BREAK(Id),		Id div 10).
-define(EQUIP_LEVEL_UP(Id),			Id rem 10).
-define(EQUIP_LEVEL_ID(ItemId, Level),	ItemId * 100 + Level).
-define(EQUIP_APPEND_BIN_ID(Color, Index),	Color * 10 + Index).
-define(EQUIP_APPEND_ID(Type, Value),		Type * 100 + Value).
-define(EQUIP_APPEND_TYPE(Id),		Id div 100).
-define(EQUIP_APPEND_VALUE(Id),		Id rem 100).

-record(player_equip, {
	id = 0,					%% 玩家id
	make_bin = maps:new(),	%% 装备制作记录 bin_id => [make_id]
	type = 0,				%% 玩家装备操作，突破制作
	param = 0				%% 参数

}).


-record(equip_info, {
	hero_id = 0,		%%英雄id
	break_through = ?DEFINE_BREAK,	%%突破次数
	up = 0,				%%强化等级
	up_fail = 0,		%%强化失败次数
	attribute = {
		[0, 0, 0, 0, 0],	%% 洗练前
		[0, 0, 0, 0, 0],	%% 上锁
		[0, 0, 0, 0, 0],	%% 洗练后
		[0, 0, 0, 0, 0]		%% 金手指
	}	%%	洗练属性
}).





-endif.
