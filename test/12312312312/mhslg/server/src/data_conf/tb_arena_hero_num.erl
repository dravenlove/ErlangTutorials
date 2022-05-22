%%--- coding:utf-8 ---
-module(tb_arena_hero_num).
-export([get/1,get_list/0]).
get(1)-> #{
    'level' => 1
};
get(2)-> #{
    'level' => 1
};
get(3)-> #{
    'level' => 1
};
get(4)-> #{
    'level' => 17
};
get(5)-> #{
    'level' => 19
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5].
