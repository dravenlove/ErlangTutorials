%%--- coding:utf-8 ---
-module(tb_magic_tower_rank_reward).
-export([get/1,get_list/0]).
get(1)-> #{
    'rank_l' => 1,
    'rank_r' => 1,
    'reward' => [
        [
            102005001,
             1
        ],
         [
            102005002,
             2
        ],
         [
            102005003,
             3
        ],
         [
            102005004,
             4
        ],
         [
            102005005,
             5
        ]
    ]
};
get(2)-> #{
    'rank_l' => 2,
    'rank_r' => 2,
    'reward' => [
        [
            102005001,
             2
        ],
         [
            102005002,
             2
        ],
         [
            102005003,
             3
        ],
         [
            102005004,
             4
        ],
         [
            102005005,
             6
        ]
    ]
};
get(3)-> #{
    'rank_l' => 3,
    'rank_r' => 3,
    'reward' => [
        [
            102005001,
             3
        ],
         [
            102005002,
             2
        ],
         [
            102005003,
             3
        ],
         [
            102005004,
             4
        ],
         [
            102005005,
             7
        ]
    ]
};
get(4)-> #{
    'rank_l' => 4,
    'rank_r' => 10,
    'reward' => [
        [
            102005001,
             4
        ],
         [
            102005002,
             2
        ],
         [
            102005003,
             3
        ],
         [
            102005004,
             4
        ],
         [
            102005005,
             8
        ]
    ]
};
get(5)-> #{
    'rank_l' => 11,
    'rank_r' => 60,
    'reward' => [
        [
            102005001,
             5
        ],
         [
            102005002,
             2
        ],
         [
            102005003,
             3
        ],
         [
            102005004,
             4
        ],
         [
            102005005,
             9
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5].
