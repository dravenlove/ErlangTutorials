%%--- coding:utf-8 ---
-module(tb_city_mission).
-export([get/1,get_list/0]).
get(2)-> #{
    'bounty_mission' => [
        1,
         2,
         3,
         4,
         5
    ],
    'final_award' => [
        [
            101001002,
             100
        ],
         [
            101001003,
             10000
        ],
         [
            101001004,
             10000
        ],
         [
            101001005,
             10000
        ],
         [
            101001006,
             10000
        ]
    ]
};
get(3)-> #{
    'bounty_mission' => [
        2,
         3,
         4,
         5
    ],
    'final_award' => [
        [
            101001002,
             200
        ],
         [
            101001003,
             20000
        ],
         [
            101001004,
             20000
        ],
         [
            101001005,
             20000
        ],
         [
            101001006,
             20000
        ]
    ]
};
get(4)-> #{
    'bounty_mission' => [
        3,
         4,
         5
    ],
    'final_award' => [
        [
            101001002,
             300
        ],
         [
            101001003,
             30000
        ],
         [
            101001004,
             30000
        ],
         [
            101001005,
             30000
        ],
         [
            101001006,
             30000
        ]
    ]
};
get(5)-> #{
    'bounty_mission' => [
        4,
         5
    ],
    'final_award' => [
        [
            101001002,
             400
        ],
         [
            101001003,
             40000
        ],
         [
            101001004,
             40000
        ],
         [
            101001005,
             40000
        ],
         [
            101001006,
             40000
        ]
    ]
};
get(6)-> #{
    'bounty_mission' => [
        1
    ],
    'final_award' => [
        [
            101001002,
             500
        ],
         [
            101001003,
             50000
        ],
         [
            101001004,
             50000
        ],
         [
            101001005,
             150000
        ],
         [
            101001006,
             50000
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[2,3,4,5,6].
