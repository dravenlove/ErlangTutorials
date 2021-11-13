%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: item.hrl
%% Created on : 2019-05-22 15:17:00
%% Author: Jiuan
%% Last Modified: 2019-05-22 15:17:00
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-ifndef('alien_HRL').
-define('alien_HRL', true).

-define(ALIEN_TEAM_STATE_0, 0). %% 未集结
-define(ALIEN_TEAM_STATE_1, 1).	%% 集结中
-define(ALIEN_TEAM_STATE_2, 2). %% 战斗中

-define(ALIEN_PLAYER_REWARD_SIZE, 3). %% 玩家奖励格子数

-define(ALIEN_ONE_BUFF, 1). %% 一个buff
-define(ALIEN_TWO_BUFF, 2). %% 两个buff

-define(REWARD_CHECK_TIME, 20).

-define(ALIEN_BROAD, 1016).

%%-define(CATCH_ALL(Fun, Args), try apply(Fun, Args) catch _:_ -> skip end ).
%%-define(CATCH_RETURN(Fun, Args), try apply(Fun, Args) catch throw:{return, Par} -> Par end ).
%%-define(RETURN(Par), throw({return, Par}) ).

-record(alien, {
	country_id = 0,				%% 国家id
	detail_map = maps:new(),	%% 战场信息 key-floor value-#alien_detail
	player_map = maps:new()		%% 玩家信息 key-role_id value-#alien_player
}).

-record(alien_detail, {
	floor = 0,				%% 层数
	open_state = 0,			%% 开启状态 0-未开启 1-已开启
	is_notify = false,		%% 是否通知玩家
	state = 0,				%% 状态 0-未集结 1-集结中 2-战斗中
	fight_msg = undefined,	%% 战斗消息
	result_msg = undefined,	%% 战斗结果消息
	fight_tick = 0,			%% 战斗完成时间
	buff_list = [],			%% 怪物buff列表
	buff_refresh_tick = 0,	%% buff刷新时间
	robot_id = 0,			%% 机器人hero
	hero_base = undefined,	%% 机器人英雄基础信息
	convene_tick = 0,		%% 召集冷却时间戳
	fighters = [],			%% 集结列表（#combat_hero）
	build_up_tick = 0		%% 集结开始时间
}).

-record(alien_player, {
	role_id = 0,		%% 玩家id
	on_show = false,	%% 是否打开主界面
	on_line = false,	%% 是否在在线
	use_hero_list = [],	%% 已使用英雄id列表
	reward_list = [],	%% 奖励列表（#alien_reward）
	floor_list = [],	%% 已加入层数
	count = 0			%% 参与次数
}).

-record(alien_reward, {
	item_id = 0,
	amount = 0,
	floor = 0,
	get_tick = 0
}).

-endif.