%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_process_task_system
%%% Created on : 2021/2/5 21:27
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_process_task_system).
-author("yc").
-include("common.hrl").
-include("task_system.hrl").



%% API
-export([
  load_mmo_task_system/0,
  bson_list_to_task_list/1,
  bson_to_task_process/1,
  task_process_to_bson/1,
  save_mmo_task_system/2
]).

%%非玩家进程数据存储输入的接口
data_to_task_bson(MainType,Data) ->
  case MainType of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_country_task:data_to_task_system(Data);
    _ -> Data
  end
.

task_bson_to_data(MainType, Bson) ->
  case MainType of
    ?TASK_SYSTEM_COUNTRY_TASK -> lib_country_task:bson_to_data(Bson);
    _ -> Bson
  end
.

bson_to_task_process(Bson)  ->
  MainType = ?BSON_INT(Bson, main_type),

  DataBson = ?BSON_BSON_DEFAULT(Bson, data, #{}),
  Data = task_bson_to_data(MainType, DataBson),
  Daily_reset_tick = ?BSON_INT(Bson,daily_reset_tick),
  Version = ?BSON_INT(Bson,daily_reset_tick),

  #task_system{
    main_type = MainType,
    data = Data,
    daily_reset_tick = Daily_reset_tick,
    version = Version
  }
.

task_process_to_bson(Task_system) when is_record(Task_system,task_system) ->
  DataBson = data_to_task_bson(Task_system#'task_system'.main_type,Task_system#'task_system'.data),
  #{
    ?BSONSET_INT(main_type, Task_system#task_system.main_type),
    ?BSONSET_BSON(data, DataBson),
    ?BSONSET_INT(daily_reset_tick,Task_system#'task_system'.daily_reset_tick),
    ?BSONSET_INT(version,Task_system#'task_system'.version)
  }
.

bson_list_to_task_list(BsonList) when is_list(BsonList) ->
  StartMs = lib_timer:unixtime(),
  Task_process_list =
    lists:foldl(fun(Bson, List) ->

      try
        Task_system = bson_to_task_process(Bson),
        ?INFO("load task system [~p] ", [Task_system#task_system.main_type]),
        [Task_system| List]
      catch
        _:Reason  -> ?ERROR("bson_to_task_system error: Reason ~p, ~n bson: ~p ~p",[Reason,Bson,erlang:get_stacktrace()])
      end
                end,[],BsonList),

  EndTime = lib_timer:unixtime(),
  ?INFO("load task system total time cost [~p] [~p]",[erlang:length(Task_process_list),EndTime - StartMs]),

  Task_process_list
.

load_mmo_task_system() ->
  BsonList = mongo_poolboy:find(?MMO_POOL, ?DB_MMO_TASK_SYTEM,#{?BSONSET_VALUE(main_type, #{?BSONSET_VALUE(<<"$gte">>, 0)})}),
  bson_list_to_task_list(BsonList)
.

save_mmo_task_system(Task_system_record,Block) when is_record(Task_system_record, task_system) ->
  Bson = task_process_to_bson(Task_system_record),
  case Block of
    true ->
      mongo_poolboy:async_update(?MMO_POOL, ?DB_MMO_TASK_SYTEM, #{?BSONSET_INT(main_type, Task_system_record#task_system.main_type)}, Bson);
%%			lib_gamedb_api:noreply_update(?DB_MMO_ACTIVITY, #{?BSONSET_INT(id, Activity#activity.id)}, ActivityBson);
    false ->
      mongo_poolboy:async_update(?MMO_POOL, ?DB_MMO_TASK_SYTEM, #{?BSONSET_INT(main_type, Task_system_record#task_system.main_type)}, Bson)
%%			lib_gamedb_api:noreply_update(?DB_MMO_ACTIVITY, #{?BSONSET_INT(id, Activity#activity.id)}, ActivityBson)
  end,
  ?INFO("save task_system [~p] ~n",[Task_system_record#'task_system'.main_type])
.


