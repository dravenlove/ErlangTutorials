%%--- coding:utf-8 ---
-module(tb_recharge_refresh).
-export([get/1,get_list/0]).
get(0)-> #{
    'refresh_type' => 0
};
get(1)-> #{
    'refresh_type' => 0
};
get(2)-> #{
    'refresh_type' => 1,
    'week_day' => 1
};

get(_N) -> false.
get_list() ->
	[0,1,2].
