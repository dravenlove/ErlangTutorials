%%--- coding:utf-8 ---
-module(tb_arena_setting).
-export([get/1,get_list/0]).
get(single_buy_times)-> #{
    'int_val' => 5
};
get(record_number)-> #{
    'int_val' => 30
};
get(rank_reward_hour)-> #{
    'int_val' => 21
};
get(rank_number)-> #{
    'int_val' => 3000
};
get(rank_page_number)-> #{
    'int_val' => 10
};

get(_N) -> false.
get_list() ->
	[single_buy_times,record_number,rank_reward_hour,rank_number,rank_page_number].
