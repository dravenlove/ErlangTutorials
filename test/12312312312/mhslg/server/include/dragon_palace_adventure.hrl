%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 2月 2021 10:10
%%%-------------------------------------------------------------------
-author("df").
-define(FOREST_DRAGON_PALACE, 	1). %% 森林龙殿
-define(LAVA_DRAGON_PALACE, 	2).	%% 熔岩龙殿
-define(CRYSTAL_DRAGON_PALACE, 	3).	%% 冰霜龙殿

%% 占星效果类型
-define(ASTROLOGY_ADD_ITEM, 		1).		%% 获得额外道具
-define(ASTROLOGY_ADD_ARAGON_GEM,  	2).		%% 获得龙晶加成
-define(ASTROLOGY_FIGHT_BUFF,		3).		%% 获得战斗buff


%%　战斗结果
-define(ROB,		1).		%% 掠夺
-define(BE_ROB,		2).		%% 被掠夺

%% 刷新掠夺
-define(DPA_FREE,		0).		%% 免费刷新
-define(DPA_UES_ITEM,	1).		%% 使用道具刷新
-define(DPA_REVENGE,	2).		%% 复仇


%% 刷新占星
-define(DPA_ASTROLOGY_FREE,		0).		%% 免费刷新
-define(DPA_ASTROLOGY_UES_ITEM,	1).		%% 使用道具刷新


-record(dragon_palace_adventure_gather, {
	dragon_palace_adventure_map = maps:new(), 	%% 玩家龙殿信息MAP PlayerId => #dragon_palace_adventure
	adventure_info_map = maps:new(),			%% 探险中玩家信息MAP Key => #adventure_info
	start_tick = 0,								%% 进程开启tick
	system_refresh_tick = 0						%% 系统更新时间tick
}).


-record(dragon_palace_adventure,{
	player_id = 0,
	show = undefined,       		%% 显示信息
	rob_time = 0,					%% 当日掠夺次数
	be_robs = dict:new(),			%% 当日被掠夺信息
	astrology_id = 0,				%% 占星id
	free_astrology_time = 0,		%% 今日免费占星使用次数
	rob_player_id = 0,				%% 指向的可掠夺玩家id
	adventure_info = dict:new(),	%% 龙殿信息
	rob_info = dict:new(),			%% 掠夺记录
	be_rob_info = dict:new()		%% 被掠夺记录
}).

-record(be_rob,{
	type = 0,			%% 龙殿类型
	time = 0			%% 次数
}).

-record(adventure,{
	type = 0,					%% 龙殿类型
	expedition_state = 0,  		%% 是否在探险 0 空闲 1 探险中 2 探险完成
	start_tick = 0,				%% 开始时间戳
	hero_list = [],				%% 探险英雄信息 [#hero_base]
	dragon_gem = [],			%% 可获得的龙晶 [道具id,数量]
	item = [],					%% 额外获得的道具 [道具id,数量]
	be_rob_dragon_gem = 0,		%% 被掠夺的龙晶数量
	be_rob = 0,					%% 被掠夺次数
	be_rob_success = 0			%% 被掠夺成功次数
}).

-record(rob,{
	combat_id = 0,          			%% 战斗队列唯一id
	player_id = 0,						%% 敌方玩家id
	show = undefined,
	tick = 0,
	type = 0,							%% 龙殿类型
	star = 0,							%% 星数
	fight_info = maps:new(), 			%% 我方战斗信息 HeroId => Is_win
	adverse_fight_info = maps:new(), 	%% 敌方战斗信息 HeroId => Is_win
	item = [],							%% 获得道具id
	record_id = 0,						%% 录像id
	is_revenge_success = 0				%% 被掠夺战报是否复仇成功
}).

-record(adventure_info,{
	key = 0,		%% key = player_id * 10 + type
	id = 0,			%% 玩家id
	type = 0		%% 龙殿类型
}).
