%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 23. 4月 2021 14:45
%%%-------------------------------------------------------------------
-module(lib_player_achievement_task).
-author("xuyonghui").
-include("common.hrl").

%% API
-export([
	init_achievement_task/0,
	check_accept_achievement_task/0,
	update_achievement_detail/1,
	accept_next_task/1
]).

init_achievement_task() ->
	AchievementDetail = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_ACHIEVEMENT_TASK),
	try
	    ?JUDGE_RETURN(AchievementDetail#achievement_detail.is_init =:= 0, -1),
		update_achievement_detail(#achievement_detail{is_init = 1}),
		lib_common:list_map(
			fun(TaskId) ->
				Conf = lib_task_api:get_task_conf(TaskId),
				Precondition = maps:get(precondition, Conf, 0),
				?JUDGE_CONTINUE(Precondition =:= 0),

				TaskInfo = lib_task_api:init_task(TaskId),
				lib_player_task_new:accept_task(TaskInfo)
			end,
		tb_achievement_task:get_list())
	catch
	    throw:{error, _ErrCode}  -> skip
	end
.

check_accept_achievement_task() ->
	init_achievement_task(),
	TaskTypeDict = lib_player_task_new:fetch_task_dict_by_type(?TASK_TYPE_ACHIEVEMENT_TASK),
	lib_common:dict_map(
		fun(TaskId, TaskInfo) ->
			?JUDGE_CONTINUE(TaskInfo#task_info.status =:= ?TASK_STATUS_DRAW),
			Conf = lib_task_api:get_task_conf(TaskId),
			Postcondition = maps:get(postcondition, Conf, 0),
			?JUDGE_CONTINUE(Postcondition =/= 0),
			?JUDGE_CONTINUE(lib_task_api:get_task_conf(Postcondition) =/= false),
			lib_player_task_new:delete_task_info(TaskInfo),
			NewTaskInfo = lib_task_api:init_task(Postcondition),
			lib_player_task_new:accept_task(NewTaskInfo)
		end, TaskTypeDict)
.

update_achievement_detail(Achievement) when is_record(Achievement, achievement_detail) ->
	PlayerTaskInfo = lib_player_task_new:get_player_task_info(),
	NewTaskTypeDetail = dict:store(
		?TASK_TYPE_ACHIEVEMENT_TASK, Achievement, PlayerTaskInfo#player_task_info.task_type_detail),
	lib_player_task_new:put_player_task_info(PlayerTaskInfo#player_task_info{task_type_detail = NewTaskTypeDetail})
.

accept_next_task(TaskInfo) ->
	Conf = lib_task_api:get_task_conf(TaskInfo#task_info.id),
	Post = maps:get(postcondition, Conf, 0),
	NewConf = lib_task_api:get_task_conf(Post),
	case NewConf =/= false of
		true ->
			NewTaskInfo = lib_task_api:init_task(Post),
			NewTaskInfo1 = NewTaskInfo#task_info{cur_value = TaskInfo#task_info.cur_value},
			lib_player_task_new:delete_task_info(TaskInfo),
			lib_player_task_new:accept_task(NewTaskInfo1);
		false ->
			lib_player_task_new:update_task_info(TaskInfo),
			skip
	end
.