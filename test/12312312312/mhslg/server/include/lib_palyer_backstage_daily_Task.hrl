%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_palyer_backstage_daily_Task
%%% Created on : 2020/12/15 14:25
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('lib_palyer_backstage_daily_Task_HRL').
-define('lib_palyer_backstage_daily_Task_HRL', true).

-endif.

-record(daily_task_config,{
  task_dict = dict:new(),
  task_reward_dict = dict:new(),
  task_weight_dict = dict:new(),
  free_time = 0,
  pay_time = 0,
  pay_cost = 0,
  refresh = 0,
  task_type_dict = dict:new()
}
).

-record(proto_daily_task,{
  act_id = 0,
  task_id = 0,
  percent = 0,
  task_info = [],
  task_reward = [],
  task_exp = 0,
  hyperlinks = []
}).