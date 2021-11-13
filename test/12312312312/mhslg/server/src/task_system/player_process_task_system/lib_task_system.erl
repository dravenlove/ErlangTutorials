%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_task_system
%%% Created on : 2021/1/29 10:36
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_task_system).
-author("yc").
-include("common.hrl").
-include("task_system.hrl").
-include("task_system_player.hrl").

%% API
-export([
  get_process_name/1,
  get_pid/1,
  is_have_process/1,
  player_async_apply/3,
  task_to_proto/1
]).

get_process_name(Task_id) ->
  ?DEBUG("get_process_name ~p",[Task_id]),
  util:to_atom("task_system_" ++ util:to_list(Task_id))
.

get_pid(Task_id) ->
  ?DEBUG("get_pid ~p",[Task_id]),
  ProcessName = get_process_name(Task_id),
  erlang:whereis(ProcessName)
.

is_have_process(Task_id) ->
  Pid = get_pid(Task_id),
  case is_pid(Pid) of
    false -> false;
    true -> is_process_alive(Pid)
  end
.

player_async_apply(PlayerId,Fun,Args) ->
  ?DEBUG("player_async_apply "),
  mod_player:async_apply(PlayerId,Fun,Args)
.

task_to_proto(Task_system) when is_record(Task_system, task_system) ->
  ?DEBUG("task_to_proto"),
  #'ProtoTaskSystem'{
    main_type  = Task_system#task_system.main_type
  }
.


