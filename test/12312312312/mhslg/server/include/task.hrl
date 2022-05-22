%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: task
%%% Created on : 2020/11/17 15:42
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('task_HRL').
-define('task_HRL', true).

-define(TASK_TYPE_LIST,    [?TASK_TYPE_MAIN_TASK, ?TASK_TYPE_BOUNTY_MISSION]). %% 任务类型列表
-define(TASK_TYPE_MAIN_TASK,    1001).		%% 主线任务
-define(TASK_TYPE_BOUNTY_MISSION,   1002).  %% 赏金任务

-define(TASK_FLAG_UNDONE,    0).  %% 任务未完成
-define(TASK_FLAG_FINISH,    1).  %% 任务已完成

-define(ACCEPT_TASK,    0).  %% 接受任务
-define(SUBMIT_TASK,    1).  %% 提交任务


-define(CONDITION_PLAYER_LEVEL,          1).		%% 1主角升到X级
-define(CONDITION_PLAYER_CHAPTER,        2).		%% 通关指定关卡id
-define(CONDITION_HERO_STAR,             3).		%% 将指定的某个英雄升星到X星
-define(CONDITION_HERO_ORDER,            4).		%% 将指定的某个英雄进阶到X阶
-define(CONDITION_HERO_SLOT,             5).		%% 将指定的某个英雄进阶到X阶Y槽Z级

%%-----------------已下皆是亮剑表的方式可供参考。接下来数值最好从6开始。main_task表中对应数据
%%-define(CONDITION_TOTAL_HERO_STAR,       6).		%% 任意X个英雄升星到Y星
%%-define(CONDITION_TOTAL_HERO_ORDER,      7).		%% 任意X个英雄进阶到X阶
%%-define(CONDITION_HERO_LEVEL,            8).		%% 将指定的某个英雄达到指定等级
%%-define(CONDITION_HERO_FORCE,            9).		%% 将指定的某个英雄达到指定战力
%%-define(CONDITION_CHAPTER_STAR_REWARD,  10).		%% 指定副本领取总星奖励
%%-define(CONDITION_EQUIP_LEVEL_AMOUNT,   11).		%% 任意X件军备强化至Y级
%%-define(CONDITION_EQUIP_STAR_AMOUNT,    12).		%% 任意X件军备升至Y星
%%-define(CONDITION_EQUIP_ORDER_AMOUNT,   13).		%% 任意X件军备共鸣至Y级
%%-define(CONDITION_WATCH_TOWER_FLOOR,    14).		%% 警界塔挑战至X层
%%-define(CONDITION_EXERCISE_WAVE,        15).		%% 反扫荡挑战至X波
%%--------------------------------------------------------------------------分隔线

-record(task,{
  task_id = 0,   %% 任务id
  flag = 0       %% 状态
}).

-record(player_task,{
  id = 0,                         %% 玩家id
  task_dict = dict:new(),         %% 当前任务   key:任务类型  value:#task_detail{}
  finish_task_dict = dict:new(),  %% 已完成任务列表  key:任务类型
  guidance_dict = dict:new()		%%新手引导 key:引导id, vlaue:引导进行阶段
}).

-endif.