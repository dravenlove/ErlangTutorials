%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: task_system
%%% Created on : 2021/1/28 15:57
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('task_system_HRL').
-define('task_system_HRL', true).

-define(TASK_SYSTEM_COUNTRY_TASK, 	1000).	%%国家任务

-define(FLAG_INDUSTRY_WORK_TIME,1).  %%产业生产多少次条件
-define(FLAG_OCCUPY_CITY_CONFIRM,2).  %%占领特定城市
-define(FLAG_TRAN_SOLIDER,3).  %%锻炼士兵
-define(FLAG_KILL_ENEMY,4).  %%消灭敌人


-define(ETS_TASK_SYSTEM_TABLE, ets_task_system_table).

-define(TERMINATION_TYPE_NORMAL, 1).	%%正常终止

-record(task_monitor,{
  list = []
}).



%%-record(task_data,{
%%
%%}).

-record(task_system,{
  main_type = 0,
  data = undefined, %%各个任务进程自己的数据
  daily_reset_tick = 0,	%%每天重置的时间
  version = 0 %%赛季版本
})
.

-endif.