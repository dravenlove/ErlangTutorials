%%--- coding:utf-8 ---
-module(tb_supervalue_gift).
-export([get/1,get_list/0]).
get(10001)-> #{
    'serial_number' => 101,
    'index' => 1,
    'need_recharge' => 300,
    'rewards' => [
        [
            102007009,
             20
        ],
         [
            102005047,
             10
        ]
    ],
    'cost' => [
        [
            101001002,
             188
        ]
    ]
};
get(10002)-> #{
    'serial_number' => 101,
    'index' => 2,
    'need_recharge' => 300,
    'rewards' => [
        [
            102007009,
             20
        ],
         [
            102005047,
             10
        ]
    ],
    'cost' => [
        [
            101001002,
             188
        ]
    ]
};
get(10003)-> #{
    'serial_number' => 101,
    'index' => 3,
    'need_recharge' => 680,
    'rewards' => [
        [
            102007009,
             40
        ],
         [
            102005047,
             30
        ]
    ],
    'cost' => [
        [
            101001002,
             388
        ]
    ]
};
get(10004)-> #{
    'serial_number' => 101,
    'index' => 4,
    'need_recharge' => 680,
    'rewards' => [
        [
            102007009,
             40
        ],
         [
            102005047,
             30
        ]
    ],
    'cost' => [
        [
            101001002,
             388
        ]
    ]
};
get(10005)-> #{
    'serial_number' => 101,
    'index' => 5,
    'need_recharge' => 1280,
    'rewards' => [
        [
            102007009,
             60
        ],
         [
            102005047,
             50
        ]
    ],
    'cost' => [
        [
            101001002,
             588
        ]
    ]
};
get(10006)-> #{
    'serial_number' => 101,
    'index' => 6,
    'need_recharge' => 1280,
    'rewards' => [
        [
            102007009,
             60
        ],
         [
            102005047,
             50
        ]
    ],
    'cost' => [
        [
            101001002,
             588
        ]
    ]
};
get(10007)-> #{
    'serial_number' => 101,
    'index' => 7,
    'need_recharge' => 3280,
    'rewards' => [
        [
            102007009,
             80
        ],
         [
            102005047,
             70
        ]
    ],
    'cost' => [
        [
            101001002,
             1288
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[10001,10002,10003,10004,10005,10006,10007].
