%%--- coding:utf-8 ---
-module(tb_task_achievement).
-export([get/1,get_list/0]).
get(1003010100)-> #{
    'type' => 1003,
    'sub_type' => 1,
    'cond_type' => 1,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 10100101
};

get(_N) -> false.
get_list() ->
	[1003010100].
