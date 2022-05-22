%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. 4月 2021 11:44
%%%-------------------------------------------------------------------
-module(db_player_task_new).
-author("xuyonghui").
-include("common.hrl").

%% API
-export([
	load_player_task/1,
	save_player_task/1
]).

bson_to_task_info(Bson) ->
	#task_info{
		id = ?BSON_INT(Bson, id),
		type = ?BSON_INT(Bson, type),
		sub_type = ?BSON_INT(Bson, sub_type),
		status = ?BSON_INT(Bson, status),
		cond_type = ?BSON_INT(Bson, cond_type),
		cond_id = ?BSON_INT(Bson, cond_id),
		cur_value = ?BSON_INT(Bson, cur_value),
		final_value = ?BSON_INT(Bson, final_value),
		reward_id = ?BSON_INT(Bson, reward_id),
		grade = ?BSON_INT(Bson, grade),
		city_id = ?BSON_INT(Bson, <<"city_id">>)
	}
.

task_info_to_bson(TaskInfo) when is_record(TaskInfo,task_info) ->
	#{
		?BSONSET_INT(id, TaskInfo#task_info.id),
		?BSONSET_INT(type, TaskInfo#task_info.type),
		?BSONSET_INT(sub_type, TaskInfo#task_info.sub_type),
		?BSONSET_INT(status, TaskInfo#task_info.status),
		?BSONSET_INT(cond_type, TaskInfo#task_info.cond_type),
		?BSONSET_INT(cond_id, TaskInfo#task_info.cond_id),
		?BSONSET_INT(cur_value, TaskInfo#task_info.cur_value),
		?BSONSET_INT(final_value, TaskInfo#task_info.final_value),
		?BSONSET_INT(reward_id, TaskInfo#task_info.reward_id),
		?BSONSET_INT(grade, TaskInfo#task_info.grade),
		?BSONSET_INT(<<"city_id">>, TaskInfo#task_info.city_id)
	}
.

task_type_detail_to_bson(?TASK_TYPE_CHAPTER_TASK,Detail) ->
	#{
		?BSONSET_INT(type, ?TASK_TYPE_CHAPTER_TASK),
		?BSONSET_INT(chapter_id, Detail#chapter_detail.chapter_id),
		?BSONSET_INT(draw, Detail#chapter_detail.draw)
	}
;
task_type_detail_to_bson(?TASK_TYPE_ACHIEVEMENT_TASK, Detail) ->
	#{
		?BSONSET_INT(type, ?TASK_TYPE_ACHIEVEMENT_TASK),
		?BSONSET_INT(is_init, Detail#achievement_detail.is_init)
	}
;
task_type_detail_to_bson(?TASK_TYPE_GOVERNMENT_TASK,Detail) ->
	#{
		?BSONSET_INT(type, ?TASK_TYPE_GOVERNMENT_TASK),
		?BSONSET_INT(next_refresh_tick, Detail#government_detail.next_refresh_tick),
		?BSONSET_INT(use_times, Detail#government_detail.use_times),
		?BSONSET_INT(buy_times, Detail#government_detail.buy_times),
		?BSONSET_INT(free_refresh_times, Detail#government_detail.free_refresh_times),
		?BSONSET_INT(buy_refresh_times, Detail#government_detail.buy_refresh_times),
		?BSONSET_INT(total_time, Detail#government_detail.total_time),
		?BSONSET_INT(<<"nobility_time">>, Detail#government_detail.nobility_time)
	}
;
task_type_detail_to_bson(_Type,_Detail) ->
	#{}
.

bson_to_task_type_detail(?TASK_TYPE_CHAPTER_TASK, Bson) ->
	#chapter_detail{
		chapter_id = ?BSON_INT(Bson, chapter_id),
		draw = ?BSON_INT(Bson, draw)
	}
;
bson_to_task_type_detail(?TASK_TYPE_ACHIEVEMENT_TASK, Bson) ->
	#achievement_detail{
		is_init = ?BSON_INT(Bson, is_init)
	}
;
bson_to_task_type_detail(?TASK_TYPE_GOVERNMENT_TASK, Bson) ->
	#government_detail{
		next_refresh_tick = ?BSON_INT(Bson, next_refresh_tick),
		use_times = ?BSON_INT(Bson, use_times),
		buy_times = ?BSON_INT(Bson, buy_times),
		free_refresh_times = ?BSON_INT(Bson, free_refresh_times),
		buy_refresh_times = ?BSON_INT(Bson, buy_refresh_times),
		total_time = ?BSON_INT(Bson, total_time),
		nobility_time = ?BSON_INT(Bson, <<"nobility_time">>)
	}
;
bson_to_task_type_detail(_Type, _Bson) ->
	undefined
.


load_player_task(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_PLAYER_TASK, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BsonTaskList = ?BSON_LIST(Bson, task_info),
			{TaskInfoDict,TaskListenDict} = lists:foldl(
				fun(BsonTask, {Acc, Acc1}) ->
					TaskInfo = bson_to_task_info(BsonTask),
					#task_info{id = TaskId, type = TaskType, status = Status, cond_type = CondType} = TaskInfo,
					TaskListenTypeDict =
						case dict:find(CondType, Acc1) of
							{ok, Value} -> Value;
							error -> dict:new()
						end,
					NewTaskListenDict =
						case Status =:= ?TASK_STATUS_UNDONE orelse
							(Status =:= ?TASK_STATUS_FINISH andalso
								TaskType =:= ?TASK_TYPE_GOVERNMENT_TASK) of
							true ->
								NewTaskListenTypeDict = dict:store(TaskId,TaskInfo,TaskListenTypeDict),
								dict:store(CondType, NewTaskListenTypeDict, Acc1);
							false -> Acc1
						end,
					TaskTypeDict =
						case dict:find(TaskType, Acc) of
							{ok, Value1} -> Value1;
							error -> dict:new()
						end,
					NewTaskTypeDict = dict:store(TaskId, TaskInfo, TaskTypeDict),
					{dict:store(TaskType, NewTaskTypeDict, Acc), NewTaskListenDict}
				end, {dict:new(), dict:new()}, BsonTaskList),

			BsonTaskTypeList = ?BSON_LIST(Bson, task_type_detail),
			TaskTypeDetailDict = lib_common:list_foldl(
				fun(BsonTaskType, Acc) ->
					Type = ?BSON_INT(BsonTaskType, type),
					TaskTypeDetail = bson_to_task_type_detail(Type,BsonTaskType),
					?JUDGE_CONTINUE(TaskTypeDetail =/= undefined),
					dict:store(Type, TaskTypeDetail, Acc)
				end, dict:new(), BsonTaskTypeList),
			#player_task_info{
				id = PlayerId,
				task_dict = TaskInfoDict,
				listen_task_dict = TaskListenDict,
				task_type_detail= TaskTypeDetailDict
			};
		_ ->
			#player_task_info{
				id = PlayerId
			}
	end
.

save_player_task(PlayerTaskInfo) ->
	PlayerId = PlayerTaskInfo#player_task_info.id,
	BsonTaskList = dict:fold(
		fun(_Type, TypeDict, Acc)->
			TaskList =
				dict:fold(
					fun(_TaskId, TaskInfo, Acc1) ->
						[task_info_to_bson(TaskInfo) | Acc1]
					end, [],TypeDict),
			TaskList ++ Acc
		end, [], PlayerTaskInfo#player_task_info.task_dict),

	BsonTaskTypeDetailList = dict:fold(
		fun(Type, TaskTypeDetail, Acc) ->
			[task_type_detail_to_bson(Type,TaskTypeDetail) | Acc]
		end, [], PlayerTaskInfo#player_task_info.task_type_detail),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(task_info, BsonTaskList),
		?BSONSET_LIST(task_type_detail, BsonTaskTypeDetailList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_PLAYER_TASK,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.