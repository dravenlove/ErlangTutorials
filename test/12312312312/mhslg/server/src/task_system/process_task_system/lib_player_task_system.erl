%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_task_system
%%% Created on : 2021/2/4 11:01
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_task_system).
-author("yc").
-include("common.hrl").
-include("task_system_player.hrl").
-include("task_system.hrl").
-include("ProtoClient_10139.hrl").

-define(ACC,1).  %%任务类别 1 累计数量
-define(ELSE,0).  %% 任务类别 0 其他判断条件
-define(NO_FINISH,0).  %% 未完成
-define(IS_FINISH,1).  %%已完成
-define(IS_GET,2).  %%已经完成且已经领取

%% API
-export([
  player_task_handler/0,  %%玩家任务数据
  put_player_task/1,
  get_player_task/0,
  put_player_task/2,
  ets_init/0,
  build_index/0
]).

-export([
  get_task_data/1,   %%通过类型获取任务数据
  put_task_data/2,
  update_num_add_flag/4, %%通过条件类别增加
  update_num_add/4,  %%通过任务id来实现自加
  update_else_change/4, %%通过任务id实现的状态改变
  update_else_chang_flag/4, %%通过条件类别实现状态改变
  task_get_reward/2,  %%获得奖励的接口
  add_task_into_task_detail/5, %%向数据中加入新的任务id及其flag 结构体等
  check_task_num_percent/1, %%检测数量的接口
  check_task_state_percent/1,
  check_else_task_detail/2,
  task_get_reward_another/2
]).

player_task_handler() ->
  #player_handler{
    ets = ?ETS_PLAYER_TASK_SYSTEM,
    table_name = ?DB_PLAYER_TASK_SYSTEM,
    table_player_field = <<"id">>,
    ets_init_func = fun ets_init/0,
    mongo_index_func = fun build_index/0,
    load_func = fun db_player_task_system:load_player_task_system/1,
    save_func = fun db_player_task_system:save_player_task_system/1,
    get_func = fun get_player_task/0,
    put_func = fun put_player_task/2
  }.

ets_init() ->
  ets:new(?ETS_PLAYER_TASK_SYSTEM, [?ETS_KEY_POS(#player_task.id) | ?ETS_OPTIONS]).

build_index() ->
  mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_TASK_SYSTEM, {?TUPLE_INT(id, 1)}, false),
  mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_TASK_SYSTEM, {?TUPLE_INT(id, 1), ?TUPLE_INT(main_type, 1)}, false)
.

get_player_task() ->
  erlang:get(?ETS_PLAYER_TASK_SYSTEM)
.

put_player_task(PlayerTask) when is_record(PlayerTask, player_task_detail) ->
  put_player_task(PlayerTask, true)
.
put_player_task(PlayerTask, IsSaveDb) when is_record(PlayerTask, player_task_detail) ->
  erlang:put(?ETS_PLAYER_TASK_SYSTEM, PlayerTask),
  lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_TASK_SYSTEM)
.

get_task_data(Type) ->
  Player_task_detail = get_player_task(),
  dict:fetch(Type,Player_task_detail)
.

put_task_data(Type,New_detail) when is_record(New_detail,task_detail)->
  Player_task_detail = get_player_task(),
  New = dict:store(Type,New_detail,Player_task_detail),
  put_player_task(New)
.

%%加入任务信息到玩家任务细节中 Flag是任务类别 和赛季相关联 Task_percent 是 结构体task_percent
add_task_into_task_detail(Type,Task_id,Task_state,Task_percent,Flag) ->
  Task_detail_old = get_task_data(Type),
  Task_percent_dict = Task_detail_old#task_detail.task_percent,
  Val = ?DICT_FETCH(Task_id,Task_percent_dict,dict:new()),
      Task_detail = #task_detail{type = Type
      ,task_state = dict:store(Task_id,Task_state,Task_detail_old#task_detail.task_state)
      ,task_percent = dict:store(Task_id,dict:store(Task_percent#task_percent.id,Task_percent,Val),Task_detail_old#task_detail.task_percent)
      ,task_id_for_flag = dict:store(Task_id,Flag,Task_detail_old#task_detail.task_id_for_flag)},
      put_task_data(Type,Task_detail)
.

%%根据分类进行增加 Id是比如产业id 那种有id 默认无id 为0 Flag 是判断类型
update_num_add_flag(Type,Flag_init,Num,Id) ->
  Task_detail = get_task_data(Type),
  New_task_id_for_flag = dict:filter(fun(_Key,Flag) ->
    Flag == Flag_init
  end,Task_detail#task_detail.task_id_for_flag),
  dict:map(fun(Task_id,_flag) ->
    update_num_add(Type,Task_id,Id,Num)
    end,New_task_id_for_flag)
.

%%增加刷新带有id的条件的累加任务 无id默认为0
update_num_add(Type,Task_id,Id,Num) ->
  Task_detail = get_task_data(Type),
  Task_percent = ?DICT_FETCH(Task_id,Task_detail#task_detail.task_percent,dict:new()),
  case Task_percent == dict:new() of
    true -> skip;
    false ->
      dict:map(fun(Id_key,Task_percent_val) ->
        Task_detail_dict = get_task_data(Type),
        Task_percent_dict = Task_detail_dict#task_detail.task_percent,
        Task_percent_id_dict = maps:get(Task_id,Task_percent_dict),
        case Id_key == Id of
          true  -> New_add = Num + Task_percent_val#task_percent.add,
          New_task_percent = dict:store(Id_key,Task_percent_val#task_percent{add = New_add},Task_percent_id_dict),
          New_task_percent_dict = dict:store(Task_id,New_task_percent,Task_percent_dict),
          put_task_data(Type,Task_detail_dict#task_detail{task_percent = New_task_percent_dict});
          false -> skip
        end
        end,Task_percent)
  end
.

%%根据分类进行增加 Id是比如产业id 那种有id 默认无id 为0 Flag 是判断类型
update_else_chang_flag(Type,Flag_init,Id,State) ->
  Task_detail = get_task_data(Type),
  New_task_id_for_flag = dict:filter(fun(_Key,Flag) ->
    Flag == Flag_init
                                     end,Task_detail#task_detail.task_id_for_flag),
  dict:map(fun(Task_id,_flag) ->
    update_else_change(Type,Task_id,Id,State)
           end,New_task_id_for_flag)
.

%%刷新带有id的非累加任务
update_else_change(Type,Task_id,Id,State) ->
  Task_detail = get_task_data(Type),
  Task_percent = ?DICT_FETCH(Task_id,Task_detail#task_detail.task_percent,dict:new()),
  case Task_percent == dict:new() of
    true -> skip;
    false ->
      dict:map(fun(Id_Key,Task_percent_val) ->
        Task_detail_dict = get_task_data(Type),
        Task_percent_dict = Task_detail_dict#task_detail.task_percent,
        Task_percent_id_dict= maps:get(Task_id,Task_percent_dict),
        case Id_Key == Id of
          true -> New_task_percent = dict:store(Id_Key,Task_percent_val#task_percent{state = State},Task_percent_id_dict),
            New_Task_percent_dict = dict:store(Task_id,New_task_percent,Task_percent_dict),
            put_task_data(Type,Task_detail_dict#task_detail{task_percent = New_Task_percent_dict});
          false -> skip
        end
               end,Task_percent)
  end
.

%%仅累计功能任务检查
check_task_num_percent(Type) ->
  Task_detail = get_task_data(Type),
  Task_flag = Task_detail#task_detail.task_id_for_flag,
  dict:map(fun(TaskId,_Val) ->
    Dict_task_detail = get_task_data(Type),
    Task_percent_dict = dict:fetch(TaskId,Task_detail#task_detail.task_percent),
    Flag = dict:fold(fun(_Id,Task_percent,Acc) ->
      case Task_percent#task_percent.need =/= 0 of
        true ->  (Task_percent#task_percent.add >= Task_percent#task_percent.need) andalso Acc;
        false -> false
      end
      end,true,Task_percent_dict),
    case Flag of
      true -> New_state = dict:store(TaskId,?IS_FINISH,Task_detail#task_detail.task_state),
        put_task_data(Type,Dict_task_detail#'task_detail'{task_state = New_state});
      false -> skip
    end
    end,Task_flag)
.

%%仅状态功能任务检查
check_task_state_percent(Type) ->
  Task_detail = get_task_data(Type),
  Task_flag = Task_detail#task_detail.task_id_for_flag,
  dict:map(fun(Task_id,Val) ->
    Dict_task_detail = get_task_data(Type),
    Task_percent_dict = dict:fetch(Task_id,Task_detail#task_detail.task_percent),
    case Val == ?FLAG_OCCUPY_CITY_CONFIRM of
      true ->
        Flag = dict:fold(fun(Id,Task_percent,Acc) ->
          case Id =/= 0 of
            true -> Task_percent#task_percent.state == ?IS_FINISH  andalso Acc;
            false -> false
          end
                         end,true,Task_percent_dict),
      case Flag of
        true -> New_state = dict:store(Task_id,?IS_FINISH,Task_detail#task_detail.task_state),
          put_task_data(Type,Dict_task_detail#'task_detail'{task_state = New_state})
      end
      ;
      false -> skip
    end
  end,Task_flag)
.

%%其他类型任务检查
check_else_task_detail(Type,TaskId) ->
  Task_detail = get_task_data(Type),
  Task_flag = dict:fetch(TaskId,Task_detail#task_detail.task_id_for_flag),

  Flag = check_else(Type,TaskId,Task_flag),
  case Flag of
    true -> New_state = dict:store(TaskId,?IS_FINISH,Task_detail#task_detail.task_state),
      put_task_data(Type,Task_detail#'task_detail'{task_state = New_state});
    false -> skip
  end
.

check_else(_Type,TaskId,Task_flag) ->
  Flag_task_id = case TaskId of
                   _ -> false
                 end,
  Flag_task_flag = case Task_flag of
                     _ -> false
                   end,
  (Flag_task_flag orelse Flag_task_id )
.

%%并且会删除任务的数据
task_get_reward(Type,Task_id) ->
%%  PlayerId = lib_player:player_id(),
  Task_detail = get_task_data(Type),
  Old_task_state = Task_detail#task_detail.task_state,
  try
      State = dict:fetch(Task_id,Old_task_state),
        ?JUDGE_RETURN(State == ?IS_FINISH,?ERROR_NO_STATE),
      Conf_reward_list = get_conf_reward_list(Type,Task_id),
      Item_obj_reward_lists = lib_item_api:conf_item_list_to_item_obj_list(Conf_reward_list),
      lib_player_pack:auto_insert(Item_obj_reward_lists,?INSERT_SERIAL(?ADD_COUNTRY_TASK, Type)),
        New_task_state = dict:erase(Task_id,Old_task_state),
        Old_task_percent = Task_detail#task_detail.task_percent,
        New_Task_percent = dict:erase(Task_id,Old_task_percent),
        Old_task_id_for_flag = Task_detail#task_detail.task_id_for_flag,
        New_task_id_for_flag = dict:erase(Task_id,Old_task_id_for_flag),
        put_task_data(Type,Task_detail#task_detail{task_state = New_task_state,task_percent = New_Task_percent,
          task_id_for_flag = New_task_id_for_flag})
  catch
    throw:{error, ErrCode} -> lib_send:respond_to_client(#'Proto50139004'{},ErrCode)
  end
  .

%%完成任务但是不删除状态和进度
task_get_reward_another(Type,Task_id) ->
  Task_detail = get_task_data(Type),
  Old_task_state = Task_detail#task_detail.task_state,
  try
    State = dict:fetch(Task_id,Old_task_state),
    ?JUDGE_RETURN(State == ?IS_FINISH,?ERROR_NO_STATE),
    Conf_reward_list = get_conf_reward_list(Type,Task_id),
    Item_obj_reward_lists = lib_item_api:conf_item_list_to_item_obj_list(Conf_reward_list),
    lib_player_pack:auto_insert(Item_obj_reward_lists,?INSERT_SERIAL(?ADD_COUNTRY_TASK, Type)),
    New_task_state = dict:store(Task_id,?IS_GET,Old_task_state),
    Old_task_id_for_flag = Task_detail#task_detail.task_id_for_flag,
    New_task_id_for_flag = dict:erase(Task_id,Old_task_id_for_flag),
    put_task_data(Type,Task_detail#task_detail{task_state = New_task_state,
      task_id_for_flag = New_task_id_for_flag})
  catch
    throw:{error, ErrCode} -> lib_send:respond_to_client(#'Proto50139004'{},ErrCode)
  end
.

%%获得奖励列表
get_conf_reward_list(_Type,_Task_id) ->
  true
%%  case Type of
%%    ?TASK_SYSTEM_COUNTRY_TASK ->  ;
%%    _ -> false
%%  end
.





















