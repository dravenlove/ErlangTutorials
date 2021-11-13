%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Jan 2021 8:27 PM
%%%-------------------------------------------------------------------

-ifndef('bounty_mission_HRL').
-define('bounty_mission_HRL', true).

-define(UNRECEIVED,			0).		%% 未接受任务
-define(RECEIVED_RESOURCE,	1).		%% 接受资源任务，未完成
-define(RECEIVED_MONSTER,	2).		%% 接受杀怪任务，未完成
-define(COMPLETED,			3).		%% 已完成任务等待领奖
-define(ALL_FINISH,			4).		%% 完成全部任务，可激活
-define(ACTIVATION,			5).		%% 已激活

-record(bounty_mission, {
	city_id = 0,			%% 城池id
	task_id = 0,			%% 任务id
	state = ?UNRECEIVED		%% 完成状态
}).

-record(player_bounty, {
	id = 0,
	bounty_mission = dict:new()		%% key:city_id, value:#bounty_mission{}
}).

-endif.
