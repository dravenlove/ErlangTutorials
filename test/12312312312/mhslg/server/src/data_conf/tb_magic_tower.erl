%%--- coding:utf-8 ---
-module(tb_magic_tower).
-export([get/1,get_list/0]).
get(0)-> #{
    'name' => <<"13956"/utf8>>,
    'open_level' => 12,
    'free_time' => 2,
    'buy_consume' => [
        [
            101001002,
             200
        ],
         [
            101001002,
             200
        ]
    ],
    'max_day' => 45,
    'max_floor' => 200
};
get(1)-> #{
    'name' => <<"13957"/utf8>>,
    'open_level' => 12,
    'free_time' => 2,
    'buy_consume' => [
        [
            101001002,
             200
        ],
         [
            101001002,
             200
        ]
    ],
    'max_day' => 5,
    'max_floor' => 200
};
get(2)-> #{
    'name' => <<"13958"/utf8>>,
    'open_level' => 12,
    'free_time' => 2,
    'buy_consume' => [
        [
            101001002,
             200
        ],
         [
            101001002,
             200
        ]
    ],
    'max_day' => 1,
    'max_floor' => 200
};

get(_N) -> false.
get_list() ->
	[0,1,2].
