%%--- coding:utf-8 ---
-module(tb_bounty_mission).
-export([get/1,get_list/0]).
get(1)-> #{
    'type' => 1,
    'x' => 3,
    'consume' => [
        [
            101001003,
             5000
        ]
    ],
    'award' => [
        [
            101001002,
             50
        ]
    ]
};
get(2)-> #{
    'type' => 1,
    'x' => 3,
    'consume' => [
        [
            101001004,
             10000
        ]
    ],
    'award' => [
        [
            101001002,
             100
        ]
    ]
};
get(3)-> #{
    'type' => 1,
    'x' => 3,
    'consume' => [
        [
            101001005,
             10000
        ]
    ],
    'award' => [
        [
            101001002,
             150
        ]
    ]
};
get(4)-> #{
    'type' => 1,
    'x' => 3,
    'consume' => [
        [
            101001006,
             10000
        ]
    ],
    'award' => [
        [
            101001002,
             200
        ]
    ]
};
get(5)-> #{
    'type' => 2,
    'x' => 3,
    'consume' => [
        1000000
    ],
    'award' => [
        [
            101001002,
             500
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5].
