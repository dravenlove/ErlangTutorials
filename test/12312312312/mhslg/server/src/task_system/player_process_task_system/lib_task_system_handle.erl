%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_task_system_handle
%%% Created on : 2021/2/6 17:24
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_task_system_handle).
-author("yc").

-include("task_system.hrl").
-include("common.hrl").

%% API
-export([
  process_task_process_termination/1,
  process_task_daily_reset/1
]).


-export([
  country_city_confirm/0,
  country_city_confirm_end/1,
  country_city_building_uplevel/0,
  country_city_building_uplevel_end/1,
  update_country_and_industry_work/3,
  update_country_and_industry_work_end/4,
  update_tran_soldier/2,
  update_tran_soldier_end/3
]).

get_task_process() ->
  mod_task_system:get_task_process()
.

%%处理活动进程终止(来添加需要的操作）
%% TerminationType : 终止类型
process_task_process_termination(TerminationType) ->
  Task = get_task_process(),
  case Task#task_system.main_type of
    _ -> lib_task_system_default:process_task_process_termination(TerminationType)
  end
.

process_task_daily_reset(Tick) ->
  Task = get_task_process(),
  case Task#task_system.main_type of
    _ -> lib_backstage_activity_default:process_activity_daily_reset(Tick)
  end
.

%%占领城池
country_city_confirm() ->
  ?DEBUG("country_city_confirm end"),
  mod_task_system_monitor:task_list_system(fun lib_task_system_handle:country_city_confirm_end/1)
.
country_city_confirm_end(Task) ->
  MainType = Task#task_system.main_type,
  ?DEBUG("country_city_confirm end,~p",[Task]),

  case MainType of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_country_task:update_country_city_confirm()
    ,lib_country_task:update_country_any_city();
    _ -> skip
  end
.

%%建筑升级刷新
country_city_building_uplevel() ->
  mod_task_system_monitor:task_list_system(fun lib_task_system_handle:country_city_building_uplevel_end/1)
.
country_city_building_uplevel_end(Task) ->
  ?DEBUG("country_city_building_uplevel_end end,~p",[Task]),
  MainType = Task#task_system.main_type,

  case MainType of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_country_task:update_country_city_confirm_industry(),
    lib_country_task:update_any_city_confirm_industry_accurate();
    _ -> skip
  end
.

%%指定产业工作
update_country_and_industry_work(Country_id,Industry_id,Time) ->
  mod_task_system_monitor:task_list_system(fun lib_task_system_handle:update_country_and_industry_work_end/4,[Country_id,Industry_id,Time])
.

update_country_and_industry_work_end(Task,Country_id,Industry_id,Time) ->
  ?DEBUG("update_country_and_industry_work_end end,~p",[Task]),

  MainType = Task#task_system.main_type,

  case MainType of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_country_task:update_country_any_industry_work(Country_id,Industry_id,Time);
    _ -> skip
  end
.

%%训练士兵
update_tran_soldier(Country_id,Num) ->
  mod_task_system_monitor:task_list_system(fun lib_task_system_handle:update_tran_soldier_end/3,[Country_id,Num])
  .

update_tran_soldier_end(Task,County_id,Num) ->
  ?DEBUG("update_tran_soldier end,~p",[Task]),
  MainType = Task#task_system.main_type,

  case MainType of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_country_task:update_tran_soldier(County_id,Num);
    _ -> skip
  end
.