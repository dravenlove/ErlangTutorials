%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 23. Mar 2021 4:54 PM
%%%-------------------------------------------------------------------

-ifndef('genesis_church_HRL').
-define('genesis_church_HRL', true).

-define(LEVEL_SMALL,		1).	%% 小
-define(LEVEL_BIG,			2).	%% 大

-define(ROBOT_MONEY,		1).	%% 运钱队
-define(ROBOT_TRANSPORT,	2).	%% 辎重队

-record(genesis_church, {	%% 启世教派
	city = 0,				%% 目标城池
	coord = 0,				%% 方位
	level = 0,				%% 等级
	robot = 0,				%% 机器人
	monster = 0,			%% 怪物id
	arrive_tick = 0			%% 到达时间
}).

-endif.
