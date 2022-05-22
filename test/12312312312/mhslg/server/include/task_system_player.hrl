%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: player_task_system
%%% Created on : 2021/2/4 11:49
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('player_task_system_HRL').
-define('player_task_system_HRL', true).

-record(player_task_detail,{
  id = 0,
  task_detail_dict = dict:new(), %%玩家任务数据
  event_cache_list = []
}).

-record(task_detail,{
  type = 0, 	%%
  task_state = dict:new(), %%任务状态key - task_id val - state 0 - 未完成 1 - 已完成 2 - 完成且已经领取
  task_percent = dict:new(),  %%任务进度key - task_id val - dict:new() key - task_percent 的id val - task_percent 的结构体
  task_id_for_flag = dict:new(), %%任务id  val - 任务类别
  version = 0,  %%赛季,
  daily_reset_tick = 0,
  task_for_person_or_community = dict:new() %%任务是集体还是个人 0 - 个人 1 - 集体
}).

-record(task_percent,{
  id = 0,   %%如果有需求则为需求id 无需求则为0 作为判断
  need = 0,  %%需求量  无需需求量时为0 作为判断
  add = 0,  %%增加量
  state = 0  %%1 为占领 0-为未占领
}).


-endif.