%%--- coding:utf-8 ---
-module(tb_magic_tower_type).
-export([get/1,get_list/0]).
get(1)-> #{
    'name' => <<"开服"/utf8>>,
    'open_level' => 12,
    'open_type' => 1,
    'open_season' => [
        0,
         1
    ],
    'close_type' => 1,
    'close_season' => [
        1,
         1
    ],
    'free_time' => 2,
    'buy_consume' => [
        1,
         200
    ]
};
get(2)-> #{
    'name' => <<"一合"/utf8>>,
    'open_level' => 12,
    'open_type' => 1,
    'open_season' => [
        1,
         1
    ],
    'close_type' => 1,
    'close_season' => [
        2,
         1
    ],
    'free_time' => 2,
    'buy_consume' => [
        1,
         200
    ]
};
get(3)-> #{
    'name' => <<"二合"/utf8>>,
    'open_level' => 12,
    'open_type' => 1,
    'open_season' => [
        2,
         1
    ],
    'close_type' => 1,
    'close_season' => [
        3,
         1
    ],
    'free_time' => 2,
    'buy_consume' => [
        1,
         200
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3].
