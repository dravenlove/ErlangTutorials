%%--- coding:utf-8 ---
-module(tb_honour_top_match).
-export([get/1,get_list/0]).
get(111)-> #{
    'stage' => 1,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         4
    ]
};
get(112)-> #{
    'stage' => 1,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         3
    ]
};
get(121)-> #{
    'stage' => 1,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(122)-> #{
    'stage' => 1,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(131)-> #{
    'stage' => 1,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(211)-> #{
    'stage' => 2,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         4
    ]
};
get(212)-> #{
    'stage' => 2,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         3
    ]
};
get(221)-> #{
    'stage' => 2,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(222)-> #{
    'stage' => 2,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(231)-> #{
    'stage' => 2,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(311)-> #{
    'stage' => 3,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         4
    ]
};
get(312)-> #{
    'stage' => 3,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         3
    ]
};
get(321)-> #{
    'stage' => 3,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(322)-> #{
    'stage' => 3,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(331)-> #{
    'stage' => 3,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(411)-> #{
    'stage' => 4,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         4
    ]
};
get(412)-> #{
    'stage' => 4,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         3
    ]
};
get(421)-> #{
    'stage' => 4,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(422)-> #{
    'stage' => 4,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(431)-> #{
    'stage' => 4,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(511)-> #{
    'stage' => 5,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         4
    ]
};
get(512)-> #{
    'stage' => 5,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         3
    ]
};
get(521)-> #{
    'stage' => 5,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(522)-> #{
    'stage' => 5,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(531)-> #{
    'stage' => 5,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(611)-> #{
    'stage' => 6,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         4
    ]
};
get(612)-> #{
    'stage' => 6,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         3
    ]
};
get(621)-> #{
    'stage' => 6,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(622)-> #{
    'stage' => 6,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(631)-> #{
    'stage' => 6,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(711)-> #{
    'stage' => 7,
    'times' => 1,
    'report_id' => 1,
    'type' => 1,
    'condition1' => [
        1,
         8
    ]
};
get(712)-> #{
    'stage' => 7,
    'times' => 1,
    'report_id' => 2,
    'type' => 1,
    'condition1' => [
        2,
         7
    ]
};
get(713)-> #{
    'stage' => 7,
    'times' => 1,
    'report_id' => 3,
    'type' => 1,
    'condition1' => [
        3,
         6
    ]
};
get(714)-> #{
    'stage' => 7,
    'times' => 1,
    'report_id' => 4,
    'type' => 1,
    'condition1' => [
        4,
         5
    ]
};
get(721)-> #{
    'stage' => 7,
    'times' => 2,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             1
        ],
         [
            1,
             2,
             1
        ]
    ]
};
get(722)-> #{
    'stage' => 7,
    'times' => 2,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            1,
             3,
             1
        ],
         [
            1,
             4,
             1
        ]
    ]
};
get(723)-> #{
    'stage' => 7,
    'times' => 2,
    'report_id' => 3,
    'type' => 2,
    'condition2' => [
        [
            1,
             1,
             0
        ],
         [
            1,
             2,
             0
        ]
    ]
};
get(724)-> #{
    'stage' => 7,
    'times' => 2,
    'report_id' => 4,
    'type' => 2,
    'condition2' => [
        [
            1,
             3,
             0
        ],
         [
            1,
             4,
             0
        ]
    ]
};
get(731)-> #{
    'stage' => 7,
    'times' => 3,
    'report_id' => 1,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             1
        ],
         [
            2,
             2,
             1
        ]
    ]
};
get(732)-> #{
    'stage' => 7,
    'times' => 3,
    'report_id' => 2,
    'type' => 2,
    'condition2' => [
        [
            2,
             1,
             0
        ],
         [
            2,
             2,
             0
        ]
    ]
};
get(733)-> #{
    'stage' => 7,
    'times' => 3,
    'report_id' => 3,
    'type' => 2,
    'condition2' => [
        [
            2,
             3,
             1
        ],
         [
            2,
             4,
             1
        ]
    ]
};
get(734)-> #{
    'stage' => 7,
    'times' => 3,
    'report_id' => 4,
    'type' => 2,
    'condition2' => [
        [
            2,
             3,
             0
        ],
         [
            2,
             4,
             0
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[111,112,121,122,131,211,212,221,222,231,311,312,321,322,331,411,412,421,422,431,511,512,521,522,531,611,612,621,622,631,711,712,713,714,721,722,723,724,731,732,733,734].
