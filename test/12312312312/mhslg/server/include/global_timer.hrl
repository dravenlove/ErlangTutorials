%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: global_timer
%%% Created on : 2020/10/16 10:41
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('global_timer_HRL').
-define('global_timer_HRL', true).

%% 全局每分钟定时器,启动新的进程来调用模块的handle接口
-define(CLUSTER_MIN_TIMER_MODULES, [    %% 跨服

]).

-define(SINGLE_MIN_TIMER_MODULES, [    %% 单服
	{fun mod_backstage_activity_monitor:refresh_activity_by_backstage/0, []}
]).

%% 全局每小时定时器,启动新的进程来调用模块的handle接口
-define(CLUSTER_HOUR_TIMER_MODULES, [    %% 跨服

]).

-define(SINGLE_HOUR_TIMER_MODULES, [    %% 单服

]).

%% 全局零晨定时器,启动新的进程来调用模块的handle接口
-define(CLUSTER_ZERO_TIMER_MODULES, [    %% 跨服

]).

-define(SINGLE_ZERO_TIMER_MODULES, [    %% 单服

]).

%% 全局6点定时器,启动新的进程来调用模块的handle接口
-define(CLUSTER_SIX_TIMER_MODULES, [    %% 跨服
	{fun lib_garbage_collect:handle/0, []}
]).


-define(SINGLE_SIX_TIMER_MODULES, [    %% 单服
	{fun lib_garbage_collect:handle/0, []},
	{fun mod_fight_manager:handle/0, []}
]).

%% 全局季节 改变定时器,启动新的进程来调用模块的handle接口
-define(CLUSTER_SEASON_CHANGE_MODULES, [    %% 跨服

]).
-define(SINGLE_SEASON_CHANGE_MODULES, [     %% 单服

]).

%% 全局通用刷新定时器,启动新的进程来调用模块的handle接口	(用于赛季日期变更)
-define(CLUSTER_COMMON_REFRESH_CHANGE_MODULES, [    %% 跨服

]).
-define(SINGLE_COMMON_REFRESH_CHANGE_MODULES, [     %% 单服

]).





-endif.
