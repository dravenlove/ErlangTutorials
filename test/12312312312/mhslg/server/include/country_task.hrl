%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: country_task
%%% Created on : 2021/2/22 10:12
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('country_task_HRL').
-define('country_task_HRL', true).

-define(CLASS_COUNTRY,		1).		%% 集体任务
-define(CLASS_PERSON,		2).		%% 个人任务

%% 国家（集体）
-define(COUNTRY_CITY_CONFIRM,				1).	%% 占领指定城池
-define(COUNTRY_CITY_CONFIRM_INDUSTRY,		2).	%% 指定城池指定建筑升级
-define(COUNTRY_ANY_CITY_INDUSTRY_ACCURATE,	3).	%% 任意城池指定建筑升级
-define(COUNTRY_ANY_INDUSTRY_WORK,			4).	%% 指定产业工作(目前为单个）
-define(COUNTRY_TRAN_SOLDIER,				5).	%% 累计训练x个士兵
-define(COUNTRY_KILL_ENEMY,					6).	%% 累计歼灭敌人
-define(COUNTRY_LOOK_FOR,					7).	%% 累计拜访
-define(COUNTRY_ANY_CITY,					8).	%% 占领任意x城池
-define(COUNTRY_CITY_BUILDINGS_LEVEL,		9).	%% 指定p_text城池的p4（多个）建筑达到p3级

%% 个人
-define(PERSON_ANY_INDUSTRY,				1). %% 占领x个y级产业
-define(PERSON_CONFIRM_INDUSTRY_WORK,		2). %% 指定产业累计完成工作X次
-define(PERSON_TRAN_SOLDIER,				3). %% 累计训练x个士兵
-define(PERSON_KILL_ENEMY,					4). %% 累计歼灭敌人x个

-define(ADD_INDUSTRY_WORK,		1).		%% 累计产业作业
-define(ADD_TRAIN_SOLDIER,		2).		%% 累计训练士兵
-define(ADD_DESTROY_SOLDIER,	3).		%% 累计歼灭士兵
-define(ADD_VISITING,			4).		%% 累计拜访


-record(player_country_task, {
	id = 0,
	task = 1,
	param = 0
}).

-record(country_task, {
	task = 1,
	param = 0
}).

-endif.