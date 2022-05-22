%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_task
%%% Created on : 2020/11/17 11:43
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%% 内置表为main_task
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_task).
-author("yc").
-include("common.hrl").

%% API
-export([
  player_task_handler/0,
  get_player_task/0,
  put_player_task/2,
  ets_init/0,
  build_index/0
]).

-export([
  main_task_init/0, %%主线任务
  update_task_flag/2, %%更新任务状态
  check_all_task_flag/0, %%检测任务
  get_task_info/0,
  task_state/2,  %%当前任务检测
  task_flag/1,   %%任务状态
  accept_next_task/1,
  finish_task_reward/2, %%完成任务奖励
  finish_task/2
]).

ets_init() ->
  ets:new(?ETS_PLAYER_TASK, [?ETS_KEY_POS(#player_task.id) | ?ETS_OPTIONS]).

build_index() ->
  mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_TASK, {?TUPLE_INT(<<"id">>, 1)}, true),
  ok.

get_player_task() ->
  get(?ETS_PLAYER_TASK).

put_player_task(PlayerTask,IsSaveDb) ->
  lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_RANK),
  put(?ETS_PLAYER_TASK, PlayerTask).

player_task_handler() ->
  #player_handler{
    ets = ?ETS_PLAYER_TASK,
    table_name = ?DBPLAYER_TASK,
    table_player_field = <<"id">>,
    ets_init_func = fun lib_player_task:ets_init/0,
    mongo_index_func = fun lib_player_task:build_index/0,
    load_func = fun db_player_task:load_player_task/1,
    save_func = fun db_player_task:save_player_task/1,
    get_func = fun lib_player_rank:get_player_rank/0,
    put_func = fun lib_player_rank:put_player_rank/2
  }.


main_task_init() ->
  PlayerTask = get_player_task(),
  case dict:is_key(?TASK_TYPE_MAIN_TASK, PlayerTask#player_task.task_dict) of
    true ->
      skip;
    false ->
      case dict:is_key(?TASK_TYPE_MAIN_TASK, PlayerTask#player_task.finish_task_dict) of
        true ->
          skip;
        false ->
          [TaskId | _] = tb_main_task:get_list(),
          accept_task(?TASK_TYPE_MAIN_TASK, TaskId)
      end
  end.

accept_task(TaskType, TaskId) ->
  PlayerTask = get_player_task(),
  TaskDict = dict:store(TaskType, #task{task_id = TaskId, flag = ?TASK_FLAG_UNDONE}, PlayerTask#player_task.task_dict),
  put_player_task(PlayerTask#player_task{task_dict = TaskDict},true),
  lib_serial_api:serial_task(lib_player:get_player_base(), TaskType, TaskId, ?ACCEPT_TASK),
  check_and_update_task_flag(TaskType).

check_and_update_task_flag(TaskType) ->
  case check_task_flag(TaskType) of
    ?TASK_FLAG_FINISH ->
      update_task_flag(TaskType, ?TASK_FLAG_FINISH),
      lib_player_task_api:notify_player_task_flag();
    _ ->
      ok
  end.

check_task_flag(TaskType) ->
  PlayerTask = get_player_task(),
  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
  #{condition_type := ConditionType} = Conf = tb_main_task:get(Task#task.task_id),
  try
    SourceDate =
      case ConditionType of
        ?CONDITION_PLAYER_LEVEL ->
          lib_player:player_level();
        ?CONDITION_PLAYER_CHAPTER ->
          lib_player_chapter:get_player_chapter();
        ?CONDITION_HERO_STAR ->
          #{array_value := HeroStar} = Conf,
          lib_hero_api:hero_info(lists:nth(1, HeroStar));
        ?CONDITION_HERO_ORDER ->
          #{array_value := HeroStar} = Conf,
          lib_hero_api:hero_info(lists:nth(1, HeroStar));
        ?CONDITION_HERO_SLOT ->
          #{array_value := HeroStar} = Conf,
          lib_hero_api:hero_info(lists:nth(1, HeroStar))
      %%--------------------仅供参考可删除
%%        ?CONDITION_TOTAL_HERO_STAR ->
%%          lib_hero_api:get_player_hero();
%%        ?CONDITION_TOTAL_HERO_ORDER ->
%%          lib_hero_api:get_player_hero();
%%        ?CONDITION_HERO_LEVEL ->
%%          #{array_value := HeroStar} = Conf,
%%          lib_hero_api:hero_info(lists:nth(1, HeroStar));
%%        ?CONDITION_HERO_FORCE ->
%%          #{array_value := HeroStar} = Conf,
%%          lib_hero_api:hero_info(lists:nth(1, HeroStar));
%%        ?CONDITION_CHAPTER_STAR_REWARD ->
%%          lib_player_chapter:get_player_chapter();
%%        ?CONDITION_EQUIP_LEVEL_AMOUNT ->
%%          skip;
%%        ?CONDITION_EQUIP_STAR_AMOUNT ->
%%          skip;
%%        ?CONDITION_EQUIP_ORDER_AMOUNT ->
%%          skip;
%%        ?CONDITION_WATCH_TOWER_FLOOR ->
%%          lib_player_watch_tower:get_player_watch_tower();
%%        ?CONDITION_EXERCISE_WAVE ->
%%          lib_player_exercise:get_player_exercise()
      %%--------------------------------分割线
      end,
    check_task_flag(TaskType, ConditionType, SourceDate)
  catch
    _:_  -> ?TASK_FLAG_UNDONE
  end.


check_task_flag(TaskType, CheckType, SourceDate) ->
  try
    case CheckType of
      ?CONDITION_PLAYER_LEVEL ->
        check_flag_player_level(TaskType, SourceDate);
%%      ?CONDITION_PLAYER_CHAPTER ->

%%        check_flag_player_chapter(TaskType, SourceDate);
%%      ?CONDITION_HERO_STAR ->
%%        check_flag_hero_star(TaskType, SourceDate);
%%      ?CONDITION_HERO_ORDER ->
%%        check_flag_hero_order(TaskType, SourceDate);
%%      ?CONDITION_HERO_SLOT ->
%%        check_flag_hero_slot(TaskType, SourceDate);
%%      ?CONDITION_TOTAL_HERO_STAR ->
%%        check_flag_total_hero_star(TaskType, SourceDate);
%%      ?CONDITION_TOTAL_HERO_ORDER ->
%%        check_flag_total_hero_order(TaskType, SourceDate);
%%      ?CONDITION_HERO_LEVEL ->
%%        check_flag_hero_level(TaskType, SourceDate);
%%      ?CONDITION_HERO_FORCE ->
%%        check_flag_hero_force(TaskType, SourceDate);
%%      ?CONDITION_CHAPTER_STAR_REWARD ->
%%        check_flag_chapter_star_reward(TaskType, SourceDate);
%%      ?CONDITION_EQUIP_LEVEL_AMOUNT ->
%%        check_flag_equip_level_amount(TaskType);
%%      ?CONDITION_EQUIP_STAR_AMOUNT ->
%%        check_flag_equip_star_amount(TaskType);
%%      ?CONDITION_EQUIP_ORDER_AMOUNT ->
%%        check_flag_equip_order_amount(TaskType);
%%      ?CONDITION_WATCH_TOWER_FLOOR ->
%%        check_flag_player_tower_floor(TaskType, SourceDate);
%%      ?CONDITION_EXERCISE_WAVE ->
%%        check_flag_player_exercise_floor(TaskType, SourceDate);
      _ ->
        ?TASK_FLAG_UNDONE
    end
  catch
    throw:{error, Flag}  -> Flag;
    _:_ -> false
  end.


update_task_flag(TaskType, Flag) ->
  PlayerTask = get_player_task(),
  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
  TaskDict = dict:store(TaskType, Task#task{flag = Flag}, PlayerTask#player_task.task_dict),
  put_player_task(PlayerTask#player_task{task_dict = TaskDict},true).

check_flag_player_level(TaskType, PlayerLevel) ->
  PlayerTask = get_player_task(),
  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
  #{condition_type := ConditionType} = tb_main_task:get(Task#task.task_id),
  ?JUDGE_RETURN(ConditionType =:= ?CONDITION_PLAYER_LEVEL, ?TASK_FLAG_UNDONE),
  #{value := Value} = tb_main_task:get(Task#task.task_id),
  case PlayerLevel >= Value of
    true ->
      throw({error, ?TASK_FLAG_FINISH});
    false ->
      throw({error, ?TASK_FLAG_UNDONE})
  end.

%%check_flag_player_chapter(TaskType, PlayerChapter) ->
%%%%  PlayerTask = get_player_task(),
%%%%  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
%%%%  #{condition_type := ConditionType} = tb_main_task:get(Task#task.task_id),
%%%%  ?JUDGE_RETURN(ConditionType =:= ?CONDITION_PLAYER_CHAPTER, ?TASK_FLAG_UNDONE),
%%%%  #{array_value := Chapter} = tb_main_task:get(Task#task.task_id),
%%%%  ChapterInfo = lists:keyfind(lists:nth(1, Chapter), #chapter_stage.substage_id, PlayerChapter#player_chapter.stage_list),
%%%%  case ChapterInfo =/= false andalso ChapterInfo#chapter_stage.pass_star >= lists:nth(2, Chapter) of
%%%%    true ->
%%%%      throw({error, ?TASK_FLAG_FINISH});
%%%%    false ->
%%%%      throw({error, ?TASK_FLAG_UNDONE})
%%  throw({error, ?TASK_FLAG_UNDONE})
%%  .


get_task_info() ->
  PlayerTask = get_player_task(),
  dict:fold(fun(TaskType, Task, ProtoAcc) ->
    [#'ProtoTask'{
      task_id = Task#task.task_id,
      task_type = TaskType,
      task_flag = Task#task.flag
    } | ProtoAcc]
            end, [], PlayerTask#player_task.task_dict).
%%
%%check_all_task_flag() ->
%%  PlayerTask = get_player_task(),
%%  dict:fold(fun(TaskType, _, _Acc) ->
%%    check_and_update_task_flag(TaskType)
%%            end, 0, PlayerTask#player_task.task_dict).


check_all_task_flag() ->
  PlayerTask = get_player_task(),
  dict:fold(fun(TaskType, _, _Acc) ->
    check_and_update_task_flag(TaskType)
            end, 0, PlayerTask#player_task.task_dict).

task_state(TaskType, TaskId) ->
  PlayerTask = get_player_task(),
  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
  Task#task.task_id =:= TaskId.

task_flag(TaskType) ->
  PlayerTask = get_player_task(),
  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
  Task#task.flag.

delete_task(TaskType) ->
  PlayerTask = get_player_task(),
  TaskDict = dict:erase(TaskType, PlayerTask#player_task.task_dict),
  put_player_task(PlayerTask#player_task{task_dict = TaskDict},true).

accept_next_task(TaskType) ->
  PlayerTask = get_player_task(),
  Task = dict:fetch(TaskType, PlayerTask#player_task.task_dict),
  #{next_task_id := NextTaskId} = tb_main_task:get(Task#task.task_id),
  accept_next_task(TaskType, NextTaskId).
accept_next_task(TaskType, TaskId) ->
  case TaskId of
    0 ->
      delete_task(TaskType);
    _ ->
      accept_task(TaskType, TaskId)
  end.

finish_task_reward(TaskType, TaskId) ->
  case TaskType of
    ?TASK_TYPE_MAIN_TASK ->
      finish_main_task_reward(TaskId);
    _ ->
      ok
  end.

finish_main_task_reward(TaskId) ->
  #{reward := Reward} = tb_main_task:get(TaskId),
  RewardItem =
    lists:foldl(fun(ItemCfg, ItemAcc) ->
      [#item{
        item_id = lists:nth(1, ItemCfg),
        amount = lists:nth(2, ItemCfg)
      } | ItemAcc]
                end, [], Reward),
  lib_player_pack:auto_insert(RewardItem, #serial_obj{insert_serial_type = ?ADD_ITEM_TASK}).

finish_task(TaskType, TaskId) ->
  PlayerTask = get_player_task(),
  FinishDict =
    case dict:is_key(TaskType, PlayerTask#player_task.finish_task_dict) of
      true ->
        dict:fetch(TaskType, PlayerTask#player_task.finish_task_dict);
      false ->
        dict:new()
    end,
  lib_serial_api:serial_task(lib_player:get_player_base(), TaskType, TaskId, ?SUBMIT_TASK),
  NewFinish = dict:store(TaskId, ?TASK_FLAG_FINISH, FinishDict),
  NewFinishDict = dict:store(TaskType, NewFinish, PlayerTask#player_task.finish_task_dict),
  put_player_task(PlayerTask#player_task{finish_task_dict = NewFinishDict},true).
