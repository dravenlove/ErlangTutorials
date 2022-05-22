%%--- coding:utf-8 ---
-module(tb_incident_kind).
-export([get/1,get_list/0]).
get(1)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001002,
             50
        ]
    ]
};
get(2)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001002,
             100
        ]
    ],
    'two_award' => [
        [
            101001002,
             200
        ]
    ]
};
get(3)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001003,
             50
        ]
    ]
};
get(4)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001003,
             100
        ]
    ],
    'two_award' => [
        [
            101001003,
             200
        ]
    ]
};
get(5)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001004,
             50
        ]
    ]
};
get(6)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001004,
             100
        ]
    ],
    'two_award' => [
        [
            101001004,
             200
        ]
    ]
};
get(7)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001005,
             50
        ]
    ]
};
get(8)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001005,
             100
        ]
    ],
    'two_award' => [
        [
            101001005,
             200
        ]
    ]
};
get(9)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001006,
             50
        ]
    ]
};
get(10)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001006,
             100
        ]
    ],
    'two_award' => [
        [
            101001006,
             200
        ]
    ]
};
get(11)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001007,
             50
        ]
    ]
};
get(12)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001007,
             100
        ]
    ],
    'two_award' => [
        [
            101001007,
             200
        ]
    ]
};
get(13)-> #{
    'type' => 0,
    'one_award' => [
        [
            101001002,
             80
        ]
    ]
};
get(14)-> #{
    'type' => 1,
    'one_award' => [
        [
            101001002,
             160
        ]
    ],
    'two_award' => [
        [
            101001002,
             240
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14].
