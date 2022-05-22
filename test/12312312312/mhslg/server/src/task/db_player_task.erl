%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_task
%%% Created on : 2020/12/10 20:54
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_task).
-author("yc").
-include("common.hrl").

%% API
-export([
  load_player_task/1,
  save_player_task/1
]).


load_player_task(Id) ->
  case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_TASK, #{?BSONSET_INT(<<"id">>, Id)}) of
    Bson = #{} ->
      Task_Bson_List = ?BSON_BSON_DEFAULT(Bson, task_dict, []),
      Finish_Bson_List = ?BSON_BSON_DEFAULT(Bson, finish_task_dict, []),
      Guidance =
        lists:foldl(
          fun(Val, Dict)->
            dict:store(?BSON_INT(Val, id), ?BSON_INT(Val, stage), Dict)
          end, dict:new(), ?BSON_BSON_DEFAULT(Bson, guidance_dict, [])),
      #player_task{
        id = Id,
        task_dict = bosn_to_task_dict(Task_Bson_List),
        finish_task_dict = bosn_to_finish_dict(Finish_Bson_List),
        guidance_dict = Guidance
      };
    _ ->
      #player_task{id = Id}
  end.

bosn_to_task_dict(Task_Bson_List) ->
  lists:foldl(fun(Task_Bson, TaskDictAcc) ->
    TaskType = ?BSON_INT(Task_Bson, task_type),
    Task = #task{
      task_id = ?BSON_INT(Task_Bson, task_id),
      flag = ?BSON_INT(Task_Bson, flag)
    },
    dict:store(TaskType, Task, TaskDictAcc)
              end, dict:new(), Task_Bson_List).

bosn_to_finish_dict(Finish_Bson_List) ->
  lists:foldl(fun(Task_Bson, FinishTaskDictAcc) ->
    TaskType = ?BSON_INT(Task_Bson, task_type),
    FinishDict =
      lists:foldl(fun(Finish, FinishDictAcc) ->
        dict:store(Finish, ?TASK_FLAG_FINISH, FinishDictAcc)
                  end, dict:new(), ?BSON_VALUE(Task_Bson, finish_task)),
    dict:store(TaskType, FinishDict, FinishTaskDictAcc)
              end, dict:new(), Finish_Bson_List).




save_player_task(PlayerTask) ->
  PlayerId = PlayerTask#player_task.id,
  PlayerTaskBson = player_task_to_bosn(PlayerTask),
  mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_TASK, #{?BSONSET_INT(id, PlayerId)}, #{<<"$set">> => PlayerTaskBson}).

player_task_to_bosn(PlayerTask) ->
  TaskDictBson = task_dict_to_bosn(PlayerTask#player_task.task_dict),
  FinishDictBson = finish_task_dict_to_bosn(PlayerTask#player_task.finish_task_dict),
  GuidanceBson =
    dict:fold(
      fun(Id, Stage, List)->
        [#{
          ?BSONSET_INT(id, Id),
          ?BSONSET_INT(stage, Stage)
        } | List]
      end, [], PlayerTask#player_task.guidance_dict),
  #{
    ?BSONSET_VALUE(id, PlayerTask#player_task.id),
    ?BSONSET_VALUE(task_dict, TaskDictBson),
    ?BSONSET_VALUE(finish_task_dict, FinishDictBson),
    ?BSONSET_VALUE(guidance_dict, GuidanceBson)
  }.

task_dict_to_bosn(TaskDict) ->
  dict:fold(fun(TaskType, Task, TaskBsonAcc) ->
    [#{
      ?BSONSET_INT(task_type, TaskType),
      ?BSONSET_INT(task_id, Task#task.task_id),
      ?BSONSET_INT(flag, Task#task.flag)
    } | TaskBsonAcc]
            end, [], TaskDict).

finish_task_dict_to_bosn(FinishDict) ->
  dict:fold(fun(TaskType, Finish, FinishBsonAcc) ->
    [#{
      ?BSONSET_INT(task_type, TaskType),
      ?BSONSET_VALUE(finish_task, dict:fetch_keys(Finish))
    } | FinishBsonAcc]
            end, [], FinishDict).