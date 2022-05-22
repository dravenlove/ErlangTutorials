%%--- coding:utf-8 ---
-module(tb_genesis_church_robot).
-export([get/1,get_list/0]).
get(110)-> #{
    'level' => 1,
    'type' => 1,
    'season' => 0,
    'robot_id' => [
        1061001
    ],
    'robot_weight' => [
        1
    ]
};
get(111)-> #{
    'level' => 1,
    'type' => 1,
    'season' => 1,
    'robot_id' => [
        1061002
    ],
    'robot_weight' => [
        1
    ]
};
get(112)-> #{
    'level' => 1,
    'type' => 1,
    'season' => 2,
    'robot_id' => [
        1061003
    ],
    'robot_weight' => [
        1
    ]
};
get(113)-> #{
    'level' => 1,
    'type' => 1,
    'season' => 3,
    'robot_id' => [
        1061004
    ],
    'robot_weight' => [
        1
    ]
};
get(120)-> #{
    'level' => 1,
    'type' => 2,
    'season' => 0,
    'robot_id' => [
        1062002,
         1062003,
         1062004,
         1062005
    ],
    'robot_weight' => [
        1,
         2,
         3,
         4
    ]
};
get(121)-> #{
    'level' => 1,
    'type' => 2,
    'season' => 1,
    'robot_id' => [
        1062002,
         1062003,
         1062004,
         1062005
    ],
    'robot_weight' => [
        1,
         2,
         3,
         4
    ]
};
get(122)-> #{
    'level' => 1,
    'type' => 2,
    'season' => 2,
    'robot_id' => [
        1062002,
         1062003,
         1062004,
         1062005
    ],
    'robot_weight' => [
        1,
         2,
         3,
         4
    ]
};
get(123)-> #{
    'level' => 1,
    'type' => 2,
    'season' => 3,
    'robot_id' => [
        1062002,
         1062003,
         1062004,
         1062005
    ],
    'robot_weight' => [
        1,
         2,
         3,
         4
    ]
};
get(210)-> #{
    'level' => 2,
    'type' => 1,
    'season' => 0,
    'robot_id' => [
        1061005
    ],
    'robot_weight' => [
        1
    ]
};
get(211)-> #{
    'level' => 2,
    'type' => 1,
    'season' => 1,
    'robot_id' => [
        1061005
    ],
    'robot_weight' => [
        1
    ]
};
get(212)-> #{
    'level' => 2,
    'type' => 1,
    'season' => 2,
    'robot_id' => [
        1061005
    ],
    'robot_weight' => [
        1
    ]
};
get(213)-> #{
    'level' => 2,
    'type' => 1,
    'season' => 3,
    'robot_id' => [
        1061005
    ],
    'robot_weight' => [
        1
    ]
};

get(_N) -> false.
get_list() ->
	[110,111,112,113,120,121,122,123,210,211,212,213].
