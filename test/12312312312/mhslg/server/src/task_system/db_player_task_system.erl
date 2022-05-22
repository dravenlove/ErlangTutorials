%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_task_system
%%% Created on : 2021/2/4 16:00
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_task_system).
-author("yc").
-include("common.hrl").
-include("task_system_player.hrl").
-include("task_system.hrl").

%% API
-export([
  load_player_task_system/1,
  save_player_task_system/1,
  remove_detail/2
]).

%%data_to_bson(MainType, Data) ->
%%  case MainType of
%%    ?TASK_SYSTEM_COUNTRY_TASK -> lib_player_country_task:country_task_to_bson(Data);
%%    _ -> Data
%%  end
%%.
%%
%%bson_to_data(MainType, Bson) ->
%%  case MainType of
%%    ?TASK_SYSTEM_COUNTRY_TASK -> lib_player_country_task:bson_to_country_task(Bson);
%%    _ -> Bson
%%  end
%%.

dict_task_percent_to_list(Val) ->
  dict:fold(fun(Id,Task_percent,Acc) ->
    [#{
      ?BSONSET_INT(key,Id),
      ?BSONSET_INT(id,Task_percent#task_percent.id),
      ?BSONSET_INT(need,Task_percent#task_percent.need),
      ?BSONSET_INT(add,Task_percent#task_percent.add),
      ?BSONSET_INT(state,Task_percent#task_percent.state)
    }|Acc]
  end,[],Val)
.

bson_list_to_task_percent(Middle_Bson) ->
  lists:foldl(fun(Bson,Acc) ->
    Key = ?BSON_INT(Bson,key),
    Id = ?BSON_INT(Bson,id),
    Need = ?BSON_INT(Bson,need),
    Add = ?BSON_INT(Bson,add),
    State = ?BSON_INT(Bson,state),
    Value = #task_percent{
      id = Id,
      need = Need,
      add = Add,
      state = State
    },
    dict:store(Key,Value,Acc)
              end,dict:new(),Middle_Bson)
.
bson_to_task_percent(Bson) ->
  Task_percent_middle = ?BSON_LIST(Bson,task_percent),
  lists:foldl(fun(Key,Acc) ->
    Middle_Bson = ?BSON_VALUE(Key,value_1),
    Bson_list = bson_list_to_task_percent(Middle_Bson),
    Key_1 = ?BSON_VALUE(Key,key_1),
    dict:store(Key_1,Bson_list,Acc)
              end,dict:new(),Task_percent_middle)
.

task_percent_to_bson(Dict_percent) ->
  dict:fold(fun(Key, Val, List) ->
    Value = dict_task_percent_to_list(Val),
    Bson = #{
      ?BSONSET_VALUE(key_1, Key),
      ?BSONSET_VALUE(value_1, Value)
    },
    [Bson | List]
            end, [], Dict_percent)
.

task_detail_to_bson(Detail) when is_record(Detail, task_detail) ->
  Type = Detail#task_detail.type,
  DataBson = dict_to_bson_list(Detail#task_detail.task_state),
  Task_percent = task_percent_to_bson(Detail#task_detail.task_percent),
  Version = Detail#task_detail.version,
  Daily_reset_tick = Detail#task_detail.daily_reset_tick,

  #{
    ?BSONSET_INT(main_type, Type),
    ?BSONSET_LIST(task_state, DataBson),
    ?BSONSET_LIST(task_percent,Task_percent),
    ?BSONSET_INT(version,Version),
    ?BSONSET_INT(daily_reset_tick,Daily_reset_tick)
  }
.




bson_to_task_detail(Bson) ->
  Type = ?BSON_INT(Bson, main_type),
  Task_state = bson_list_to_dict(Bson,task_state),
  Task_percent = bson_to_task_percent(Bson),
  Version = ?BSON_INT(Bson,version),
  Daily_reset_tick = ?BSON_INT(Bson,daily_reset_tick),

  #task_detail{
    type = Type,
    task_state = Task_state,
    task_percent = Task_percent,
    version = Version,
    daily_reset_tick = Daily_reset_tick
  }
.

load_player_task_system(PlayerId) ->
  QueryBson = #{
    ?BSONSET_INT(id, PlayerId)
  },
  case mongo_poolboy:find(?MMO_POOL, ?DB_PLAYER_TASK_SYSTEM, QueryBson) of
    [_ | _] = BsonList ->
      DetailDict = lists:foldl(fun(DetailBson, Dict) ->
        Detail = bson_to_task_detail(DetailBson),
        dict:store(Detail#task_detail.type, Detail, Dict)
                               end, dict:new(), BsonList),

      #player_task_detail{
        id = PlayerId,
        task_detail_dict = DetailDict
      };
    _ -> #player_task{id = PlayerId}
  end
.

save_player_task_system(PlayerActivity) when is_record(PlayerActivity, player_task) ->
  PlayerId = PlayerActivity#player_task.id,
  ?INFO("save player task activity : ~p", [PlayerId]),
  _ = dict:map(fun(Main_type, Detail) ->
    DetailBson = task_detail_to_bson(Detail),
    QueryBson = #{
      ?BSONSET_INT(id, PlayerId),
      ?BSONSET_INT(main_type, Main_type)
    },
    mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_TASK_SYSTEM, QueryBson, DetailBson#{?BSONSET_INT(id, PlayerId)})
           end, PlayerActivity#player_task_detail.task_detail_dict)
.

remove_detail(PlayerId, Detail) ->
  QueryBson = #{
    ?BSONSET_INT(id, PlayerId),
    ?BSONSET_INT(main_type, Detail#task_detail.type)
  },
  mongo_poolboy:async_delete_one(?MMO_POOL, ?DB_PLAYER_TASK_SYSTEM, QueryBson)
.

dict_to_bson_list(Dict) ->
  case dict:is_empty(Dict) of
    true -> lists:foldl(fun(_Slot,Acc) ->
      Bson = #{
        ?BSONSET_INT(key,0),
        ?BSONSET_INT(value,0)
      },
      [Bson | Acc]
                        end,[],lists:seq(1,1));
    false ->lib_common:dict_to_bson_list(Dict)
  end.

%%bson数据转换成dict 列表自带默认空列表
bson_list_to_dict(Bson,Sign)->
  To_List = ?BSON_LIST_DEFAULT(Bson, Sign, []),
  _to_dict = lib_common:bson_list_to_dict(To_List).
