%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 09. Apr 2021 2:33 PM
%%%-------------------------------------------------------------------

-ifndef('country_war_task_HRL').
-define('country_war_task_HRL', true).

-define(TYPE_TASK_0,	0).		%% 无任务
-define(TYPE_TASK_1,	1).		%% 预备阶段19:00
-define(TYPE_TASK_2,	2).		%% 发布阶段20:00
-define(TYPE_TASK_3,	3).		%% 加成阶段21:00
-define(TYPE_TASK_4,	4).		%% 结束阶段22:00

-record(country_war_task, {
	type = 0,				%% 阶段
	tick = 0,				%% 时间戳
	param = maps:new(),		%% 数据
	finish = maps:new()		%% 国家完成的城池
}).

-endif.
