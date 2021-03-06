%%--- coding:utf-8 ---
-module(tb_godofwar_suit).
-export([get/1,get_list/0]).
get(10001)-> #{
    'serial_number' => 101,
    'index' => 1,
    'need_recharge' => 500,
    'rewards' => [
        [
            107001101,
             1
        ],
         [
            102013002,
             3
        ],
         [
            101001003,
             50000
        ]
    ]
};
get(10002)-> #{
    'serial_number' => 101,
    'index' => 2,
    'need_recharge' => 1000,
    'rewards' => [
        [
            102012206,
             40
        ],
         [
            102013002,
             5
        ],
         [
            101001003,
             100000
        ],
         [
            101001006,
             200000
        ]
    ]
};
get(10003)-> #{
    'serial_number' => 101,
    'index' => 3,
    'need_recharge' => 2000,
    'rewards' => [
        [
            107002101,
             1
        ],
         [
            102013002,
             7
        ],
         [
            101001003,
             150000
        ],
         [
            101001006,
             300000
        ]
    ]
};
get(10004)-> #{
    'serial_number' => 101,
    'index' => 4,
    'need_recharge' => 5000,
    'rewards' => [
        [
            102012206,
             80
        ],
         [
            102013002,
             10
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ]
};
get(10005)-> #{
    'serial_number' => 101,
    'index' => 5,
    'need_recharge' => 10000,
    'rewards' => [
        [
            107003101,
             1
        ],
         [
            102013002,
             15
        ],
         [
            101001003,
             250000
        ],
         [
            101001006,
             500000
        ]
    ]
};
get(10006)-> #{
    'serial_number' => 101,
    'index' => 6,
    'need_recharge' => 20000,
    'rewards' => [
        [
            102012206,
             180
        ],
         [
            102013002,
             20
        ],
         [
            101001004,
             600000
        ],
         [
            101001005,
             600000
        ]
    ]
};
get(10007)-> #{
    'serial_number' => 101,
    'index' => 7,
    'need_recharge' => 30000,
    'rewards' => [
        [
            107004101,
             1
        ],
         [
            102013002,
             25
        ],
         [
            101001004,
             700000
        ],
         [
            101001005,
             700000
        ]
    ]
};
get(10008)-> #{
    'serial_number' => 101,
    'index' => 8,
    'need_recharge' => 40000,
    'rewards' => [
        [
            102012206,
             320
        ],
         [
            102013002,
             30
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             800000
        ]
    ]
};
get(10009)-> #{
    'serial_number' => 101,
    'index' => 9,
    'need_recharge' => 50000,
    'rewards' => [
        [
            107005101,
             1
        ],
         [
            102013002,
             35
        ],
         [
            101001003,
             450000
        ],
         [
            101001004,
             900000
        ]
    ]
};
get(10010)-> #{
    'serial_number' => 101,
    'index' => 10,
    'need_recharge' => 60000,
    'rewards' => [
        [
            102012206,
             540
        ],
         [
            102013002,
             40
        ],
         [
            101001005,
             1000000
        ],
         [
            101001006,
             1000000
        ]
    ]
};
get(10011)-> #{
    'serial_number' => 101,
    'index' => 11,
    'need_recharge' => 80000,
    'rewards' => [
        [
            102012206,
             720
        ],
         [
            102013002,
             45
        ],
         [
            101001005,
             1500000
        ],
         [
            101001006,
             1500000
        ]
    ]
};
get(10012)-> #{
    'serial_number' => 101,
    'index' => 12,
    'need_recharge' => 100000,
    'rewards' => [
        [
            102012206,
             900
        ],
         [
            102013002,
             50
        ],
         [
            101001003,
             1000000
        ],
         [
            101001004,
             2000000
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012].
