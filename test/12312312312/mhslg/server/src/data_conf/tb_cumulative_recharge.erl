%%--- coding:utf-8 ---
-module(tb_cumulative_recharge).
-export([get/1,get_list/0]).
get(101)-> #{
        1=> #{
        'need_recharge' => 500,
        'rewards' => [
            [
                101001003,
                 300000
            ],
             [
                102014002,
                 5
            ],
             [
                102016002,
                 5
            ]
        ]
    },
        2=> #{
        'need_recharge' => 1000,
        'rewards' => [
            [
                101001004,
                 400000
            ],
             [
                101001005,
                 200000
            ],
             [
                102014002,
                 10
            ],
             [
                102016002,
                 10
            ],
             [
                102020001,
                 50
            ]
        ]
    },
        3=> #{
        'need_recharge' => 2000,
        'rewards' => [
            [
                101001003,
                 800000
            ],
             [
                101001006,
                 400000
            ],
             [
                102014002,
                 200000
            ],
             [
                102016002,
                 200000
            ],
             [
                102020001,
                 100
            ]
        ]
    },
        4=> #{
        'need_recharge' => 5000,
        'rewards' => [
            [
                101001004,
                 1200000
            ],
             [
                101001005,
                 600000
            ],
             [
                102014002,
                 30
            ],
             [
                102016002,
                 30
            ],
             [
                102020001,
                 300
            ]
        ]
    },
        5=> #{
        'need_recharge' => 10000,
        'rewards' => [
            [
                101001003,
                 2000000
            ],
             [
                101001006,
                 1000000
            ],
             [
                102006004,
                 1
            ],
             [
                102014002,
                 40
            ],
             [
                102016002,
                 40
            ]
        ]
    },
        6=> #{
        'need_recharge' => 20000,
        'rewards' => [
            [
                101001004,
                 3000000
            ],
             [
                101001005,
                 1500000
            ],
             [
                102006004,
                 2
            ],
             [
                102014002,
                 50
            ],
             [
                102016002,
                 50
            ]
        ]
    },
        7=> #{
        'need_recharge' => 30000,
        'rewards' => [
            [
                101001003,
                 5000000
            ],
             [
                101001006,
                 2500000
            ],
             [
                102006004,
                 70
            ],
             [
                102014002,
                 70
            ],
             [
                102016002,
                 600
            ]
        ]
    },
        8=> #{
        'need_recharge' => 50000,
        'rewards' => [
            [
                101001004,
                 8000000
            ],
             [
                101001005,
                 4000000
            ],
             [
                102006004,
                 100
            ],
             [
                102014002,
                 100
            ],
             [
                102016002,
                 1000
            ]
        ]
    }
};

get(_N) -> false.
get_list() ->
	[101].