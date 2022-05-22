%%--- coding:utf-8 ---
-module(tb_guard_level).
-export([get/1,get_list/0]).
get(0)-> #{
    'day' => 5,
    'every' => 2,
    'up' => 1
};
get(1)-> #{
    'day' => 5,
    'every' => 2,
    'up' => 1
};
get(2)-> #{
    'day' => 5,
    'every' => 2,
    'up' => 1
};
get(3)-> #{
    'day' => 5,
    'every' => 2,
    'up' => 1
};

get(_N) -> false.
get_list() ->
	[0,1,2,3].
