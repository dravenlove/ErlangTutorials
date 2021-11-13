%%--- coding:utf-8 ---
-module(tb_science_stage).
-export([get/1,get_list/0]).
get(1)-> #{
    'number' => 15,
    'need_level' => 1
};
get(2)-> #{
    'number' => 10,
    'need_level' => 2
};
get(3)-> #{
    'number' => 18,
    'need_level' => 3
};
get(4)-> #{
    'number' => 12,
    'need_level' => 4
};
get(5)-> #{
    'number' => 11,
    'need_level' => 5
};
get(6)-> #{
    'number' => 14,
    'need_level' => 6
};
get(7)-> #{
    'number' => 14,
    'need_level' => 7
};
get(8)-> #{
    'number' => 21,
    'need_level' => 8
};
get(9)-> #{
    'number' => 17,
    'need_level' => 9
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9].
