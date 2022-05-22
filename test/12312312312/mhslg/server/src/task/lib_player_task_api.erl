%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_task_api
%%% Created on : 2020/12/11 10:17
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_task_api).
-author("yc").
-include("common.hrl").
-include("ProtoClient_10118.hrl").

%% API
-export([
  sign_in/0,
  check_task_flag/2,
  request_player_task_info/0,
  notify_player_task_flag/0,
  request_player_submit_task/1,
  test_main_task/1,
  request_record_player_guidance_info/1,
  notify_player_guidance_info/0
]).


sign_in() ->
  lib_player_task:main_task_init(),
  lib_player_task:check_all_task_flag(),
  notify_player_task_flag().

check_task_flag(CheckType, SourceDate) ->
  lists:foldl(fun(TaskType, _Acc) ->
    case lib_player_task:check_task_flag(TaskType, CheckType, SourceDate) of
      ?TASK_FLAG_FINISH ->
        lib_player_task:update_task_flag(TaskType, ?TASK_FLAG_FINISH),
        notify_player_task_flag();
      _ ->
        skip
    end
              end, 0, ?TASK_TYPE_LIST).


notify_player_task_flag() ->
  TaskInfo = lib_player_task:get_task_info(),
  Notify = #'Proto80118001'{task_info = TaskInfo},
  ?INFO("notify_player_task_flag : ~p~n", [Notify]),
  lib_send:respond_to_client(Notify).

request_player_task_info() ->
  TaskInfo = lib_player_task:get_task_info(),
  Respond = #'Proto50118001'{task_info = TaskInfo},
  lib_send:respond_to_client(Respond).

request_player_submit_task(Msg) ->
  #'Proto10118002'{task_id = TaskId, task_type = TaskType} = Msg,
  case TaskType of
    ?TASK_TYPE_BOUNTY_MISSION ->
      lib_player_bounty_mission:request_bounty_mission_finish(TaskId);
    _ ->
      ?JUDGE_RETURN(lib_player_task:task_state(TaskType, TaskId) =:= true, ?ERROR_BAD_TASK),
      ?JUDGE_RETURN(lib_player_task:task_flag(TaskType) =:= ?TASK_FLAG_FINISH, ?ERROR_TASK_NOT_FINISH),
      lib_player_task:finish_task_reward(TaskType, TaskId),
      lib_player_task:finish_task(TaskType, TaskId),
      lib_player_task:accept_next_task(TaskType),
      Respond = #'Proto50118002'{task_id = TaskId, task_type = TaskType},
      lib_send:respond_to_client(Respond),
      notify_player_task_flag()
  end.

%%记录新手引导的信息
request_record_player_guidance_info(Msg)->
  #'Proto10118003'{guidance_info = #'ProtoPairLong'{key = Id, value = Stage}} = Msg,
%%	GuilbCfg = tb_guide:get(Id),
%%	?JUDGE_RETURN(GuilbCfg =/= false, ?ERR_CONFIG_NOT_EXISTENT),
  #player_task{guidance_dict = Guidance} = PlayerTask = lib_player_task:get_player_task(),
  NewGuidance = dict:store(Id, Stage, Guidance),
  lib_player_task:put_player_task(PlayerTask#player_task{guidance_dict = NewGuidance},true),
  notify_player_guidance_info().

%%通知新手引导信息
notify_player_guidance_info()->
  #player_task{guidance_dict = Guidance} = lib_player_task:get_player_task(),
  GuidanceProto =
    dict:fold(
      fun(Id, Stage, List)->
        [#'ProtoPairLong'{key = Id, value = Stage} | List]
      end, [], Guidance),
  Notify =
    #'Proto80118002'{
      guidance_info = GuidanceProto
    },
  lib_send:respond_to_client(Notify).

test_main_task(TaskId) ->
  lib_player_task:accept_task(?TASK_TYPE_MAIN_TASK, TaskId),
  notify_player_task_flag().


