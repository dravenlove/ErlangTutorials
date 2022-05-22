%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: item.hrl
%% Created on : 2019-05-22 15:17:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-22 15:17:00
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-ifndef('dungeoned_HRL').
-define('dungeoned_HRL', true).

-define(FIGHT_STATE_NOTHING, 	0). %% 空闲
-define(FIGHT_STATE_FIGHTING, 	1). %% 战斗中
-define(FIGHT_STATE_REWARD, 	2). %% 可领取奖励

-define(DUNGEONED_RANK_REWARD_MAIL_ID,	1001).		%% 邮件

-define(MONSTER_SKILL_KEY(A,B,C,D), A * 1000 + B * 100 + C * 10 + D).

-record(dungeoned, {
	rank_list = [],
	sort_rank = false,
	is_settle = false,
	fight_map = maps:new()
}).

-record(dungeoned_rank, {
	id = 0,
	show = undefined,
	kills = 0,
	tick = 0
}).

-record(dungeoned_fight, {
	combat_id = 0,
	state = 0,
	cur_floor = 0,
	reward = maps:new()
}).

-record(player_dungeoned, {
	id = 0,
	cur_season = 0,
	use_times = 0,
	buy_times = 0,
	state = 0,
	combat_id = 0,
	cur_floor = 0,
	reward = maps:new()
}).

-endif.