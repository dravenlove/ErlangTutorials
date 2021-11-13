%%--- coding:utf-8 ---
-module(tb_country_order).
-export([get/1,get_list/0]).
get(1)-> #{
    'max_times' => 100,
    'duration' => 120,
    'rate' => 100,
    'cost' => [
        101001002,
         100
    ],
    'reward' => [
        101001007,
         1000
    ]
};
get(2)-> #{
    'max_times' => 100,
    'duration' => 120,
    'rate' => 100,
    'cost' => [
        101001002,
         100
    ],
    'reward' => [
        101001007,
         1000
    ]
};
get(3)-> #{
    'max_times' => 3,
    'duration' => 120,
    'rate' => 20,
    'cost' => [
        101001002,
         200
    ],
    'reward' => [
        101001007,
         2000
    ]
};
get(4)-> #{
    'max_times' => 1,
    'duration' => 120,
    'rate' => 50,
    'cost' => [
        101001002,
         100
    ],
    'reward' => [
        101001007,
         1000
    ]
};
get(5)-> #{
    'max_times' => 1,
    'duration' => 120,
    'rate' => 100,
    'cost' => [
        101001002,
         500
    ],
    'reward' => [
        101001007,
         5000
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5].
