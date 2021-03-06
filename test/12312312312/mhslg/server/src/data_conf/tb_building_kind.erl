%%--- coding:utf-8 ---
-module(tb_building_kind).
-export([get/1,get_list/0]).
get(1)-> #{
    'level' => [
        100,
         200,
         300,
         500,
         700,
         900,
         1200,
         1500,
         1800,
         2800
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            1,
             102
        ]
    ],
    'consume' => [
        [
            101001005,
             1250
        ],
         [
            101001006,
             2250
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(2)-> #{
    'level' => [
        100,
         200,
         300,
         500,
         700,
         900,
         1200,
         1500,
         1800,
         2800
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            1,
             102
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(3)-> #{
    'level' => [
        50,
         100,
         150,
         200,
         300,
         500,
         1000,
         1500,
         2000,
         3000
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            1,
             102
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(4)-> #{
    'level' => [
        400,
         800,
         1000,
         2000,
         4000,
         6000,
         8000,
         9000,
         10000,
         14000
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            2,
             6
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(5)-> #{
    'level' => [
        100000
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            2,
             18
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(6)-> #{
    'level' => [
        100000
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            2,
             31
        ]
    ],
    'consume' => [
        [
            101001005,
             1250
        ],
         [
            101001006,
             2250
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(7)-> #{
    'level' => [
        100000,
         120000,
         150000
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            2,
             58
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(8)-> #{
    'level' => [
        160,
         320,
         560,
         800,
         1120,
         1440,
         1920,
         2400,
         2880,
         4000
    ],
    'open_one' => [
        [
            2,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             6
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(9)-> #{
    'level' => [
        160,
         320,
         560,
         800,
         1120,
         1440,
         1920,
         2400,
         2880,
         4000
    ],
    'open_one' => [
        [
            1,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             4
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(10)-> #{
    'level' => [
        160,
         320,
         560,
         800,
         1120,
         1440,
         1920,
         2400,
         2880,
         4000
    ],
    'open_one' => [
        [
            2,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             3
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(11)-> #{
    'level' => [
        160,
         320,
         560,
         800,
         1120,
         1440,
         1920,
         2400,
         2880,
         4000
    ],
    'open_one' => [
        [
            3,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             2
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(12)-> #{
    'level' => [
        200,
         600,
         1000,
         1600,
         2300,
         3000,
         4000,
         5000,
         6000,
         9000
    ],
    'open_one' => [
        [
            11,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             26
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(13)-> #{
    'level' => [
        200,
         600,
         1000,
         1600,
         2300,
         3000,
         4000,
         5000,
         6000,
         9000
    ],
    'open_one' => [
        [
            9,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             16
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(14)-> #{
    'level' => [
        200,
         600,
         1000,
         1600,
         2300,
         3000,
         4000,
         5000,
         6000,
         9000
    ],
    'open_one' => [
        [
            8,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             13
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(15)-> #{
    'level' => [
        200,
         600,
         1000,
         1600,
         2300,
         3000,
         4000,
         5000,
         6000,
         9000
    ],
    'open_one' => [
        [
            8,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             8
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(16)-> #{
    'level' => [
        200,
         600,
         1000,
         1600,
         2300,
         3000,
         4000,
         5000,
         6000,
         9000
    ],
    'open_one' => [
        [
            10,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             11
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(17)-> #{
    'level' => [
        400,
         800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        [
            14,
             3
        ]
    ],
    'open_two' => [
        [
            2,
             38
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(18)-> #{
    'level' => [
        400,
         800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        [
            12,
             5
        ],
         [
            13,
             5
        ]
    ],
    'open_two' => [
        [
            2,
             42
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(19)-> #{
    'level' => [
        400,
         800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        [
            12,
             3
        ]
    ],
    'open_two' => [
        [
            2,
             46
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(20)-> #{
    'level' => [
        400,
         800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        [
            15,
             3
        ]
    ],
    'open_two' => [
        [
            2,
             36
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(21)-> #{
    'level' => [
        400,
         800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        [
            16,
             3
        ]
    ],
    'open_two' => [
        [
            2,
             34
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(22)-> #{
    'level' => [
        800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        [
            1,
             3
        ]
    ],
    'open_two' => [
        [
            2,
             5
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};
get(23)-> #{
    'level' => [
        400,
         800,
         1200,
         2000,
         2800,
         3600,
         5000,
         6600,
         8300,
         13000
    ],
    'open_one' => [
        
    ],
    'open_two' => [
        [
            2,
             63
        ]
    ],
    'consume' => [
        [
            101001005,
             2500
        ],
         [
            101001006,
             1000
        ]
    ],
    'time' => 300,
    'award' => [
        50,
         50
    ],
    'deduct' => 20
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23].
