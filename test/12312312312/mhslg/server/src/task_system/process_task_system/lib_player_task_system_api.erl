%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_task_system_handle
%%% Created on : 2021/2/6 21:22
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_task_system_api).
-author("yc").
-include("common.hrl").
-include("task_system_player.hrl").
-include("task_system.hrl").
-define(NO_ID,0).

%% API
-export([

]).
-export([

]).
-export([
  industry_work_time/2,
  industry_work_time_end/3,
  train_soldier/1,
  train_soldier_end/2,
  kill_enemy/1,
  kill_enemy_end/2
]).

%%产业id工作 Time 次数
industry_work_time(Id,Time) ->
  Player_task_detail = lib_player_task_system:get_player_task(),
  Task_detail_dict = Player_task_detail#player_task_detail.task_detail_dict,
  dict:map(fun(_Type,Task_detail) ->
    industry_work_time_end(Task_detail,Id,Time)
    end,Task_detail_dict)
.

industry_work_time_end(Task_detail,Id,Time) ->
  Type = Task_detail#task_detail.type,
  Flag = ?FLAG_INDUSTRY_WORK_TIME,

  case Type of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_player_task_system:update_num_add_flag(Type,Flag,Id,Time);
    _ -> skip
  end
.

%%士兵训练
train_soldier(Num) ->
  Player_task_detail = lib_player_task_system:get_player_task(),
  Task_detail_dict = Player_task_detail#player_task_detail.task_detail_dict,
  dict:map(fun(_Type,Task_detail) ->
    train_soldier_end(Task_detail,Num)
           end,Task_detail_dict)
.

train_soldier_end(Task_detail,Num) ->
  Type = Task_detail#task_detail.type,
  Flag = ?FLAG_TRAN_SOLIDER,

  case Type of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_player_task_system:update_num_add_flag(Type,Flag,?NO_ID,Num);
    _ -> skip
  end
.

%%歼敌功能 todo
kill_enemy(Num) ->
  Player_task_detail = lib_player_task_system:get_player_task(),
  Task_detail_dict = Player_task_detail#player_task_detail.task_detail_dict,
  dict:map(fun(_Type,Task_detail) ->
    kill_enemy_end(Task_detail,Num)
           end,Task_detail_dict)
.

kill_enemy_end(Task_detail,Num) ->
  Type = Task_detail#task_detail.type,
  Flag = ?FLAG_KILL_ENEMY,

  case Type of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_player_task_system:update_num_add_flag(Type,Flag,?NO_ID,Num);
    _ -> skip
  end
.

