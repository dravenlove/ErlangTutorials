%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. 3月 2021 10:15
%%%-------------------------------------------------------------------

-ifndef('puppet_HRL').
-define('puppet_HRL', true).

-record(player_puppet,{
	id = 0,						%% 玩家id
	today_use_times = 0,		%% 今日已使用次数
	today_buy_times = 0,		%% 今日已购买次数
	today_use_fresh_times = 0,	%% 今日已使用刷新次数
	refresh_time_tick = 0,		%% 刷新时间戳
	puppet = dict:new(),		%% 怪物信息,key:城池id,vlaue:怪物相关信息
	hero_id_set = sets:new()	%% 已刷出英雄id
}).

-record(puppet,{
	city_id = 0,				%% 城池id
	clear_id = "",				%% 空地id
	robot_id = 0,				%% 机器人id
	hero_base,					%% 机器人基础信息
	hero_id = 0,				%% 英雄id
	reward_id = 0,				%% 奖励
	is_lock = 0					%% 是否锁定(0否,1是)
}).

-endif.
