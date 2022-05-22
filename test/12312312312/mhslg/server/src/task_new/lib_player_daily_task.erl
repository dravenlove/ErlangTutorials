%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 22. 4月 2021 16:40
%%%-------------------------------------------------------------------
-module(lib_player_daily_task).
-author("xuyonghui").
-include("common.hrl").
-include("inner_city.hrl").

%% API
-export([
	reset_everyday/0,
	check_accept_daily_task/0
]).

reset_everyday() ->
	check_send_task_reward_mail(),
	lib_player_task_new:delete_all_task_info(?TASK_TYPE_DAILY_TASK),
	lib_player_daily_task:check_accept_daily_task()
.

check_accept_daily_task() ->
	case lib_function_open:function_is_open(?CONDITION_ID_140) of
		false -> skip;
		true ->
			lib_common:list_map(
				fun(TaskId) ->
					Conf = lib_task_api:get_task_conf(TaskId),
					Cond = maps:get(lord_mansion, Conf, 0),
					?JUDGE_CONTINUE(lib_inner_city_api:building_level(?BUILDING_LORD_MANSION) >= Cond),
					?JUDGE_CONTINUE(lib_player_task_new:find_task_info(TaskId) =:= undefined),
					TaskInfo = lib_task_api:init_task(TaskId),
					lib_player_task_new:accept_task(TaskInfo)
				end,
				tb_daily_task:get_list())
	end
.

check_send_task_reward_mail() ->
	ItemConfList = lib_common:dict_fold(
		fun(_TaskId, TaskInfo, Acc) ->
			?JUDGE_CONTINUE(TaskInfo#task_info.status =:= ?TASK_STATUS_FINISH),
			ItemConf = maps:get(item_list, tb_task_reward:get(TaskInfo#task_info.reward_id)),
			ItemConf ++ Acc
		end,
	[], lib_player_task_new:fetch_task_dict_by_type(?TASK_TYPE_DAILY_TASK)),
	case erlang:length(ItemConfList) > 0 of
		true ->
			ItemList = lib_item_api:merge_conf_item_list(ItemConfList),
			lib_mail_api:fast_send_mail(lib_player:player_id(), ?TASK_REWARD_MAIL_ID_DAILY, [],
				lib_item_api:conf_item_list_to_pack_item_list(ItemList), ?ADD_TASK_REWARD);
		false ->
			skip
	end
.