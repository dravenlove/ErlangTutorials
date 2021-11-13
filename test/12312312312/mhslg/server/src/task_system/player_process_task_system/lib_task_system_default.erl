%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_task_system_default
%%% Created on : 2021/2/6 17:30
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_task_system_default).
-author("yc").

-include("task_system.hrl").

%% API
-export([
  process_task_init/0,
  process_tasky_start/0,
  process_task_end/0,
  process_task_daily_reset/1,
  before_task_reset/0,
  after_task_reset/0,
  before_taskmodify/0,
  after_task_modify/0,
  process_task_close/0,
  process_task_timeout/1,
  process_task_process_start/1,
  process_task_process_termination/1,
  modify_task/1,
  process_player_recharge/2
]).

process_task_init() ->
  ok
.

process_tasky_start()  ->
  ok
.

process_task_end()->
  ok
.

process_task_daily_reset(_CurTick) ->
  ok
.

before_task_reset() ->
  ok
.

after_task_reset() ->
  ok
.

before_taskmodify() ->
  ok
.

after_task_modify() ->
  ok
.

process_task_close() ->
  ok
.

process_task_timeout(_CurTick) ->
  ok
.

process_task_process_start(_IsNew) ->
  ok
.

process_task_process_termination(_TerminationType) ->
  ok
.

modify_task(NewActivity) when is_record(NewActivity, task_system) ->
  ok
.

process_player_recharge(_PlayerId, _RechargeNumber) ->
  ok
.
