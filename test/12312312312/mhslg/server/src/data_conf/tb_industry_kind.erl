%%--- coding:utf-8 ---
-module(tb_industry_kind).
-export([get/1,get_list/0]).
get(101)-> #{
    'kind' => 1,
    'level' => 1,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             150
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         3000
    ],
    'robot' => 1000001,
    'force' => 6200
};
get(102)-> #{
    'kind' => 1,
    'level' => 2,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             250
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         4500
    ],
    'robot' => 1000000,
    'force' => 7900
};
get(103)-> #{
    'kind' => 1,
    'level' => 3,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             400
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         9000
    ],
    'robot' => 1000000,
    'force' => 11800
};
get(104)-> #{
    'kind' => 1,
    'level' => 4,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             600
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         10500
    ],
    'robot' => 1000000,
    'force' => 18800
};
get(105)-> #{
    'kind' => 1,
    'level' => 5,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             800
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         12000
    ],
    'robot' => 1000000,
    'force' => 26200
};
get(106)-> #{
    'kind' => 1,
    'level' => 6,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             1000
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         16500
    ],
    'robot' => 1000000,
    'force' => 37800
};
get(107)-> #{
    'kind' => 1,
    'level' => 7,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             1200
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         18000
    ],
    'robot' => 1000000,
    'force' => 48200
};
get(108)-> #{
    'kind' => 1,
    'level' => 8,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             1500
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         19500
    ],
    'robot' => 1000000,
    'force' => 62400
};
get(109)-> #{
    'kind' => 1,
    'level' => 9,
    'award_type' => 1,
    'type' => 2,
    'base_award' => [
        [
            101001003,
             2000
        ]
    ],
    'consume' => [
        [
            102017003,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001003,
         21000
    ],
    'robot' => 1000000,
    'force' => 93600
};
get(204)-> #{
    'kind' => 2,
    'level' => 4,
    'award_type' => 0,
    'base_award' => [
        [
            101001003,
             900
        ]
    ],
    'robot' => 1000000,
    'force' => 24100
};
get(205)-> #{
    'kind' => 2,
    'level' => 5,
    'award_type' => 0,
    'base_award' => [
        [
            101001003,
             900
        ]
    ],
    'robot' => 1000000,
    'force' => 24100
};
get(206)-> #{
    'kind' => 2,
    'level' => 6,
    'award_type' => 0,
    'base_award' => [
        [
            101001003,
             1500
        ]
    ],
    'robot' => 1000000,
    'force' => 48200
};
get(207)-> #{
    'kind' => 2,
    'level' => 7,
    'award_type' => 0,
    'base_award' => [
        [
            101001003,
             1800
        ]
    ],
    'robot' => 1000000,
    'force' => 62400
};
get(208)-> #{
    'kind' => 2,
    'level' => 8,
    'award_type' => 0,
    'base_award' => [
        [
            101001003,
             2250
        ]
    ],
    'robot' => 1000000,
    'force' => 76700
};
get(209)-> #{
    'kind' => 2,
    'level' => 9,
    'award_type' => 0,
    'base_award' => [
        [
            101001003,
             3000
        ]
    ],
    'robot' => 1000000,
    'force' => 95300
};
get(301)-> #{
    'kind' => 3,
    'level' => 1,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             300
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         4000
    ],
    'robot' => 1000000,
    'force' => 6400
};
get(302)-> #{
    'kind' => 3,
    'level' => 2,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             500
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         6000
    ],
    'robot' => 1000000,
    'force' => 8200
};
get(303)-> #{
    'kind' => 3,
    'level' => 3,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             800
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         12000
    ],
    'robot' => 1000000,
    'force' => 12200
};
get(304)-> #{
    'kind' => 3,
    'level' => 4,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             1200
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         14000
    ],
    'robot' => 1000000,
    'force' => 19900
};
get(305)-> #{
    'kind' => 3,
    'level' => 5,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             1600
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         16000
    ],
    'robot' => 1000000,
    'force' => 27100
};
get(306)-> #{
    'kind' => 3,
    'level' => 6,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             2000
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         22000
    ],
    'robot' => 1000000,
    'force' => 39300
};
get(307)-> #{
    'kind' => 3,
    'level' => 7,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             2400
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         24000
    ],
    'robot' => 1000000,
    'force' => 50000
};
get(308)-> #{
    'kind' => 3,
    'level' => 8,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             3000
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         26000
    ],
    'robot' => 1000000,
    'force' => 62400
};
get(309)-> #{
    'kind' => 3,
    'level' => 9,
    'award_type' => 1,
    'type' => 3,
    'base_award' => [
        [
            101001004,
             4000
        ]
    ],
    'consume' => [
        [
            102017004,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001004,
         28000
    ],
    'robot' => 1000000,
    'force' => 93600
};
get(401)-> #{
    'kind' => 4,
    'level' => 1,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             300
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         4000
    ],
    'robot' => 1000000,
    'force' => 6400
};
get(402)-> #{
    'kind' => 4,
    'level' => 2,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             500
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         6000
    ],
    'robot' => 1000000,
    'force' => 8200
};
get(403)-> #{
    'kind' => 4,
    'level' => 3,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             800
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         12000
    ],
    'robot' => 1000000,
    'force' => 12200
};
get(404)-> #{
    'kind' => 4,
    'level' => 4,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             1200
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         14000
    ],
    'robot' => 1000000,
    'force' => 19900
};
get(405)-> #{
    'kind' => 4,
    'level' => 5,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             1600
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         16000
    ],
    'robot' => 1000000,
    'force' => 27100
};
get(406)-> #{
    'kind' => 4,
    'level' => 6,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             2000
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         22000
    ],
    'robot' => 1000000,
    'force' => 39300
};
get(407)-> #{
    'kind' => 4,
    'level' => 7,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             2400
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         24000
    ],
    'robot' => 1000000,
    'force' => 50000
};
get(408)-> #{
    'kind' => 4,
    'level' => 8,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             3000
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         26000
    ],
    'robot' => 1000000,
    'force' => 62400
};
get(409)-> #{
    'kind' => 4,
    'level' => 9,
    'award_type' => 1,
    'type' => 4,
    'base_award' => [
        [
            101001005,
             4000
        ]
    ],
    'consume' => [
        [
            102017005,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001005,
         28000
    ],
    'robot' => 1000000,
    'force' => 93600
};
get(502)-> #{
    'kind' => 5,
    'level' => 2,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             500
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         6000
    ],
    'robot' => 1000000,
    'force' => 8200
};
get(503)-> #{
    'kind' => 5,
    'level' => 3,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             800
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         12000
    ],
    'robot' => 1000000,
    'force' => 12200
};
get(504)-> #{
    'kind' => 5,
    'level' => 4,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             1200
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         14000
    ],
    'robot' => 1000000,
    'force' => 19900
};
get(505)-> #{
    'kind' => 5,
    'level' => 5,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             1600
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         16000
    ],
    'robot' => 1000000,
    'force' => 27100
};
get(506)-> #{
    'kind' => 5,
    'level' => 6,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             2000
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         22000
    ],
    'robot' => 1000000,
    'force' => 39300
};
get(507)-> #{
    'kind' => 5,
    'level' => 7,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             2400
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         24000
    ],
    'robot' => 1000000,
    'force' => 50000
};
get(508)-> #{
    'kind' => 5,
    'level' => 8,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             3000
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         26000
    ],
    'robot' => 1000000,
    'force' => 62400
};
get(509)-> #{
    'kind' => 5,
    'level' => 9,
    'award_type' => 1,
    'type' => 5,
    'base_award' => [
        [
            101001006,
             4000
        ]
    ],
    'consume' => [
        [
            102017006,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        101001006,
         28000
    ],
    'robot' => 1000000,
    'force' => 93600
};
get(601)-> #{
    'kind' => 6,
    'level' => 1,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             300
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            1,
             2
        ],
         [
            1,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 6600
};
get(602)-> #{
    'kind' => 6,
    'level' => 2,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             500
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            1,
             2
        ],
         [
            1,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 8400
};
get(603)-> #{
    'kind' => 6,
    'level' => 3,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             800
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            2,
             3
        ],
         [
            2,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 13000
};
get(604)-> #{
    'kind' => 6,
    'level' => 4,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             1200
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            2,
             3
        ],
         [
            3,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 20600
};
get(605)-> #{
    'kind' => 6,
    'level' => 5,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             1600
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            3,
             4
        ],
         [
            4,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 29800
};
get(606)-> #{
    'kind' => 6,
    'level' => 6,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             2000
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            4,
             5
        ],
         [
            5,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 40800
};
get(607)-> #{
    'kind' => 6,
    'level' => 7,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             2400
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            5,
             6
        ],
         [
            6,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 51700
};
get(608)-> #{
    'kind' => 6,
    'level' => 8,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             3000
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            6,
             7
        ],
         [
            7,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 66500
};
get(609)-> #{
    'kind' => 6,
    'level' => 9,
    'award_type' => 2,
    'type' => 6,
    'base_award' => [
        [
            101001004,
             4000
        ]
    ],
    'consume' => [
        [
            102017001,
             1
        ]
    ],
    'time' => 600,
    'award' => [
        [
            7,
             8
        ],
         [
            8,
             1
        ]
    ],
    'robot' => 1000000,
    'force' => 81500
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107,108,109,204,205,206,207,208,209,301,302,303,304,305,306,307,308,309,401,402,403,404,405,406,407,408,409,502,503,504,505,506,507,508,509,601,602,603,604,605,606,607,608,609].
