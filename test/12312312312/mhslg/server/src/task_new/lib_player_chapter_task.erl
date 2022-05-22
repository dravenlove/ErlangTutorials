%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 17. 4月 2021 14:42
%%%-------------------------------------------------------------------
-module(lib_player_chapter_task).
-author("xuyonghui").
-include("common.hrl").

%% API
-export([
	update_chapter_detail/1,
	check_start_next_chapter/0,

	request_draw_chapter_task_reward/0
]).

update_chapter_detail(Chapter) when is_record(Chapter, chapter_detail) ->
	PlayerTaskInfo = lib_player_task_new:get_player_task_info(),
	NewTaskTypeDict = dict:store(
		?TASK_TYPE_CHAPTER_TASK, Chapter, PlayerTaskInfo#player_task_info.task_type_detail),
	lib_player_task_new:put_player_task_info(PlayerTaskInfo#player_task_info{task_type_detail = NewTaskTypeDict})
.

check_start_next_chapter() ->
	Chapter = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_CHAPTER_TASK),
	case Chapter#chapter_detail.chapter_id of
		0 -> start_next_chapter();
		_ -> skip
	end
.

start_next_chapter() ->
	Chapter = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_CHAPTER_TASK),
	NewChapterId = Chapter#chapter_detail.chapter_id + 1,
	NewChapter = Chapter#chapter_detail{chapter_id = NewChapterId, draw = 0},
	Conf = tb_chapter_task_const:get(NewChapterId),
	case Conf =/= false andalso erlang:length(maps:get(task_list, Conf, [])) > 0 of
		true ->
			?JUDGE_RETURN(Conf =/= false, error),
			TaskList = maps:get(task_list, Conf),
			lib_player_task_new:delete_all_task_info(?TASK_TYPE_CHAPTER_TASK),
			lib_common:list_map(
				fun(TaskId) ->
					?JUDGE_CONTINUE(lib_task_api:check_task_country_flag(lib_player:player_country(), TaskId)),
					TaskInfo = lib_task_api:init_task(TaskId),
					lib_player_task_new:accept_task(TaskInfo)
				end,
			TaskList),
			update_chapter_detail(NewChapter);
		false ->
			skip
	end
.

request_draw_chapter_task_reward() ->
	TaskDict = lib_player_task_new:fetch_task_dict_by_type(?TASK_TYPE_CHAPTER_TASK),
	Chapter = lib_player_task_new:fetch_task_type_detail(?TASK_TYPE_CHAPTER_TASK),
	?JUDGE_RETURN(Chapter =/= undefined, ?ERROR_SERVER_DATA),
	?JUDGE_RETURN(Chapter#chapter_detail.chapter_id > 0 andalso
		Chapter#chapter_detail.draw =:= 0, ?ERROR_BACKACT_DRAWED),
	lib_common:dict_map(
		fun(_TaskId,TaskInfo) ->
			?JUDGE_RETURN(TaskInfo#task_info.status =:= ?TASK_STATUS_DRAW, ?ERROR_DRAW_CHAPTER_TASK)
		end,
	TaskDict),
	RewardId = maps:get(reward_id, tb_chapter_task_const:get(Chapter#chapter_detail.chapter_id)),
	ItemList = lib_task_api:make_reward(RewardId),
	lib_player_pack:auto_insert(ItemList, ?INSERT_SERIAL(?ADD_TASK_REWARD, ?TASK_TYPE_CHAPTER_TASK), true, ?PACK_TIPS1),

	update_chapter_detail(Chapter#chapter_detail{draw = 1}),
	start_next_chapter()
.