%%%-------------------------------------------------------------------
%%% @author xuyonghui
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. 4月 2021 14:32
%%%-------------------------------------------------------------------
-module(lib_task_api).
-author("xuyonghui").
-include("common.hrl").

%% API
-export([
	calc_task_type/1,			%% 根据任务id计算任务类型
	get_task_conf/1,			%% 获取任务配置
	init_task/1,				%% 初始化任务
	make_proto_task_info/1,		%% 任务序列化
	make_reward/1,				%% 任务奖励
	check_task_country_flag/2	%% 检查是否对应国家
]).

calc_task_type(TaskId) ->
	TaskId div 10000000 + 1000
.

get_task_conf(TaskId) ->
	Type = calc_task_type(TaskId),
	get_task_conf(Type, TaskId)
.

get_task_conf(?TASK_TYPE_CHAPTER_TASK, TaskId) ->
	tb_chapter_task:get(TaskId)
;
get_task_conf(?TASK_TYPE_DAILY_TASK, TaskId) ->
	tb_daily_task:get(TaskId)
;
get_task_conf(?TASK_TYPE_ACHIEVEMENT_TASK, TaskId) ->
	tb_achievement_task:get(TaskId)
;
get_task_conf(?TASK_TYPE_GOVERNMENT_TASK, TaskId) ->
	tb_government_task:get(TaskId)
;
get_task_conf(_Type, _TaskId) ->
	false
.

make_proto_task_info(TaskInfo) ->
	#'ProtoTaskInfo'{
		id = TaskInfo#task_info.id,
		type = TaskInfo#task_info.type,
		sub_type = TaskInfo#task_info.sub_type,
		status = TaskInfo#task_info.status,
		cond_type = TaskInfo#task_info.cond_type,
		cur_value = TaskInfo#task_info.cur_value,
		final_value = TaskInfo#task_info.final_value,
		grade = TaskInfo#task_info.grade,
		reward_id = TaskInfo#task_info.reward_id,
		city_id = TaskInfo#task_info.city_id
	}
.

make_reward(RewardId) ->
	Conf = tb_task_reward:get(RewardId),
	ItemConfList = maps:get(item_list, Conf, []),
	lib_item_api:conf_item_list_to_item_obj_list(ItemConfList)
.

check_task_country_flag(PlayerCountry, TaskId) ->
	Conf = get_task_conf(TaskId),
	TaskCountry = maps:get(country, Conf, 0),
	case TaskCountry =:= 0 of
		true -> true;
		false -> TaskCountry =:= PlayerCountry
	end
.

init_task(TaskId) ->
	Conf = get_task_conf(TaskId),
	?JUDGE_RETURN(Conf =/= false, error),
	#task_info{
		id = TaskId,
		type = maps:get(type, Conf, 0),
		sub_type = maps:get(sub_type, Conf, 0),
		cond_id = maps:get(cond_id, Conf, 0),
		cond_type = maps:get(cond_type, Conf, 0),
		final_value = maps:get(final_value, Conf, 0),
		reward_id = maps:get(reward_id, Conf, 0)
	}
.