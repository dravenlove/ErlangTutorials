%%--- coding:utf-8 ---
-module(tb_visiting_fragment).
-export([get/1,get_list/0]).
get(1)-> #{
    'num' => [
        5,
         5
    ],
    'weight' => [
        1,
         1
    ]
};
get(2)-> #{
    'num' => [
        5,
         6
    ],
    'weight' => [
        2,
         1
    ]
};
get(3)-> #{
    'num' => [
        6,
         7
    ],
    'weight' => [
        2,
         1
    ]
};
get(4)-> #{
    'num' => [
        7,
         8
    ],
    'weight' => [
        2,
         1
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4].
