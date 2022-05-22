%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 20. 11月 2020 14:39
%%%-------------------------------------------------------------------
-include("combat_queue.hrl").
-ifndef('troops_HRL').
-define('troops_HRL', true).

-define(TROOPS_NOT_CREATED,	0).			%%未创建
-define(TROOPS_FREE,		1).			%%空闲
-define(TROOPS_FIGHTING,	2).			%%战斗中
-define(TROOPS_MOVING,		3).			%%行进中
-define(TROOPS_NOT_HERO,	4).			%%英雄不足

-define(RECALL_TIME, 30000).	%% 可撤回时间

-define(TROOPS_ERROR(X), case X of {error, _} -> throw(X); _ -> skip end).

-define(FAIL, 0).			%%状态
-define(SUCCESS, 1).
-define(SUCCESS_STOP, 2).

-define(MARCH(A, B, C), #{ %% 行军信息
	city_lists => A,	%% 路线城池列表
	city_times => B,	%% 路线时间列表
	depart_tick => C	%% 出发时间戳
}).

-record(player_troops, {
	id = 0,
	hero_id = []
}).

-record(troops, {
	troops_id = 0,					%% 部队id*
	combat_hero = #combat_hero{},	%% 部队战斗信息*
	state = 0,						%% 部队状态*
	city_id = 0,					%% 当前所在城池id*
	march							%% 状态信息

}).

-define(DEFINE_SPEED,	1).
-record(troop, {	%% 新部队数据
	id = 0,
	x = 0,				%% x坐标
	y = 0,				%% y坐标
	speed = ?DEFINE_SPEED,		%% 速度
	list = [],			%% 路径坐标[{x,y}]
	state = 0,			%% 状态
	combat_hero

}).


-endif.
