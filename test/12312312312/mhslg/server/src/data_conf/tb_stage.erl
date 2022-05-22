%%--- coding:utf-8 ---
-module(tb_stage).
-export([get/1,get_list/0]).
get(1001)-> #{
    'chapter_id' => 1,
    'index' => 1,
    'prev_stage_id' => 0,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010001,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019001,
             480
        ]
    ]
};
get(1002)-> #{
    'chapter_id' => 1,
    'index' => 2,
    'prev_stage_id' => 1001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010002,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019001,
             480
        ]
    ]
};
get(1003)-> #{
    'chapter_id' => 1,
    'index' => 3,
    'prev_stage_id' => 1002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010003,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019001,
             480
        ]
    ]
};
get(1004)-> #{
    'chapter_id' => 1,
    'index' => 4,
    'prev_stage_id' => 1003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010004,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019003,
             480
        ]
    ]
};
get(1005)-> #{
    'chapter_id' => 1,
    'index' => 5,
    'prev_stage_id' => 1004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010005,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019003,
             480
        ]
    ]
};
get(1006)-> #{
    'chapter_id' => 1,
    'index' => 6,
    'prev_stage_id' => 1005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010006,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019003,
             480
        ]
    ]
};
get(1007)-> #{
    'chapter_id' => 1,
    'index' => 7,
    'prev_stage_id' => 1006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010007,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019005,
             480
        ]
    ]
};
get(1008)-> #{
    'chapter_id' => 1,
    'index' => 8,
    'prev_stage_id' => 1007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010008,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019005,
             480
        ]
    ]
};
get(1009)-> #{
    'chapter_id' => 1,
    'index' => 9,
    'prev_stage_id' => 1008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010009,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019005,
             480
        ]
    ]
};
get(1010)-> #{
    'chapter_id' => 1,
    'index' => 10,
    'prev_stage_id' => 1009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010010,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019007,
             480
        ]
    ]
};
get(1011)-> #{
    'chapter_id' => 1,
    'index' => 11,
    'prev_stage_id' => 1010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010011,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019007,
             480
        ]
    ]
};
get(1012)-> #{
    'chapter_id' => 1,
    'index' => 12,
    'prev_stage_id' => 1011,
    'is_boss' => 1,
    'max_hero' => 4,
    'robot_id' => 1010012,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1100
        ],
         [
            102008001,
             1
        ],
         [
            102019007,
             480
        ]
    ]
};
get(2001)-> #{
    'chapter_id' => 2,
    'index' => 1,
    'prev_stage_id' => 1012,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010013,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019009,
             540
        ]
    ]
};
get(2002)-> #{
    'chapter_id' => 2,
    'index' => 2,
    'prev_stage_id' => 2001,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010014,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019009,
             540
        ]
    ]
};
get(2003)-> #{
    'chapter_id' => 2,
    'index' => 3,
    'prev_stage_id' => 2002,
    'is_boss' => 1,
    'max_hero' => 4,
    'robot_id' => 1010015,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019009,
             540
        ]
    ]
};
get(2004)-> #{
    'chapter_id' => 2,
    'index' => 4,
    'prev_stage_id' => 2003,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010016,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019011,
             540
        ]
    ]
};
get(2005)-> #{
    'chapter_id' => 2,
    'index' => 5,
    'prev_stage_id' => 2004,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010017,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019011,
             540
        ]
    ]
};
get(2006)-> #{
    'chapter_id' => 2,
    'index' => 6,
    'prev_stage_id' => 2005,
    'is_boss' => 1,
    'max_hero' => 4,
    'robot_id' => 1010018,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019011,
             540
        ]
    ]
};
get(2007)-> #{
    'chapter_id' => 2,
    'index' => 7,
    'prev_stage_id' => 2006,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010019,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019013,
             540
        ]
    ]
};
get(2008)-> #{
    'chapter_id' => 2,
    'index' => 8,
    'prev_stage_id' => 2007,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010020,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019013,
             540
        ]
    ]
};
get(2009)-> #{
    'chapter_id' => 2,
    'index' => 9,
    'prev_stage_id' => 2008,
    'is_boss' => 1,
    'max_hero' => 4,
    'robot_id' => 1010021,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019013,
             540
        ]
    ]
};
get(2010)-> #{
    'chapter_id' => 2,
    'index' => 10,
    'prev_stage_id' => 2009,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010022,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019015,
             540
        ]
    ]
};
get(2011)-> #{
    'chapter_id' => 2,
    'index' => 11,
    'prev_stage_id' => 2010,
    'is_boss' => 0,
    'max_hero' => 4,
    'robot_id' => 1010023,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019015,
             540
        ]
    ]
};
get(2012)-> #{
    'chapter_id' => 2,
    'index' => 12,
    'prev_stage_id' => 2011,
    'is_boss' => 1,
    'max_hero' => 4,
    'robot_id' => 1010024,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1210
        ],
         [
            102008001,
             1
        ],
         [
            102019015,
             540
        ]
    ]
};
get(3001)-> #{
    'chapter_id' => 3,
    'index' => 1,
    'prev_stage_id' => 2012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010025,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019007,
             600
        ]
    ]
};
get(3002)-> #{
    'chapter_id' => 3,
    'index' => 2,
    'prev_stage_id' => 3001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010026,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019007,
             600
        ]
    ]
};
get(3003)-> #{
    'chapter_id' => 3,
    'index' => 3,
    'prev_stage_id' => 3002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010027,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019007,
             600
        ]
    ]
};
get(3004)-> #{
    'chapter_id' => 3,
    'index' => 4,
    'prev_stage_id' => 3003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010028,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019003,
             600
        ]
    ]
};
get(3005)-> #{
    'chapter_id' => 3,
    'index' => 5,
    'prev_stage_id' => 3004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010029,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019003,
             600
        ]
    ]
};
get(3006)-> #{
    'chapter_id' => 3,
    'index' => 6,
    'prev_stage_id' => 3005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010030,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019003,
             600
        ]
    ]
};
get(3007)-> #{
    'chapter_id' => 3,
    'index' => 7,
    'prev_stage_id' => 3006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010031,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019005,
             600
        ]
    ]
};
get(3008)-> #{
    'chapter_id' => 3,
    'index' => 8,
    'prev_stage_id' => 3007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010032,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019005,
             600
        ]
    ]
};
get(3009)-> #{
    'chapter_id' => 3,
    'index' => 9,
    'prev_stage_id' => 3008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010033,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019005,
             600
        ]
    ]
};
get(3010)-> #{
    'chapter_id' => 3,
    'index' => 10,
    'prev_stage_id' => 3009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010034,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019001,
             600
        ]
    ]
};
get(3011)-> #{
    'chapter_id' => 3,
    'index' => 11,
    'prev_stage_id' => 3010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010035,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019001,
             600
        ]
    ]
};
get(3012)-> #{
    'chapter_id' => 3,
    'index' => 12,
    'prev_stage_id' => 3011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010036,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1320
        ],
         [
            102008001,
             1
        ],
         [
            102019001,
             600
        ]
    ]
};
get(4001)-> #{
    'chapter_id' => 4,
    'index' => 1,
    'prev_stage_id' => 3012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010037,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019015,
             660
        ]
    ]
};
get(4002)-> #{
    'chapter_id' => 4,
    'index' => 2,
    'prev_stage_id' => 4001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010038,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019015,
             660
        ]
    ]
};
get(4003)-> #{
    'chapter_id' => 4,
    'index' => 3,
    'prev_stage_id' => 4002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010039,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019015,
             660
        ]
    ]
};
get(4004)-> #{
    'chapter_id' => 4,
    'index' => 4,
    'prev_stage_id' => 4003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010040,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019013,
             660
        ]
    ]
};
get(4005)-> #{
    'chapter_id' => 4,
    'index' => 5,
    'prev_stage_id' => 4004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010041,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019013,
             660
        ]
    ]
};
get(4006)-> #{
    'chapter_id' => 4,
    'index' => 6,
    'prev_stage_id' => 4005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010042,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019013,
             660
        ]
    ]
};
get(4007)-> #{
    'chapter_id' => 4,
    'index' => 7,
    'prev_stage_id' => 4006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010043,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019011,
             660
        ]
    ]
};
get(4008)-> #{
    'chapter_id' => 4,
    'index' => 8,
    'prev_stage_id' => 4007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010044,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019011,
             660
        ]
    ]
};
get(4009)-> #{
    'chapter_id' => 4,
    'index' => 9,
    'prev_stage_id' => 4008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010045,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019011,
             660
        ]
    ]
};
get(4010)-> #{
    'chapter_id' => 4,
    'index' => 10,
    'prev_stage_id' => 4009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010046,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019009,
             660
        ]
    ]
};
get(4011)-> #{
    'chapter_id' => 4,
    'index' => 11,
    'prev_stage_id' => 4010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010047,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019009,
             660
        ]
    ]
};
get(4012)-> #{
    'chapter_id' => 4,
    'index' => 12,
    'prev_stage_id' => 4011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010048,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1430
        ],
         [
            102008001,
             1
        ],
         [
            102019009,
             660
        ]
    ]
};
get(5001)-> #{
    'chapter_id' => 5,
    'index' => 1,
    'prev_stage_id' => 4012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010049,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019002,
             480
        ],
         [
            102019001,
             55
        ]
    ]
};
get(5002)-> #{
    'chapter_id' => 5,
    'index' => 2,
    'prev_stage_id' => 5001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010050,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019002,
             480
        ],
         [
            102019001,
             55
        ]
    ]
};
get(5003)-> #{
    'chapter_id' => 5,
    'index' => 3,
    'prev_stage_id' => 5002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010051,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019002,
             480
        ],
         [
            102019001,
             55
        ]
    ]
};
get(5004)-> #{
    'chapter_id' => 5,
    'index' => 4,
    'prev_stage_id' => 5003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010052,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019004,
             480
        ],
         [
            102019003,
             55
        ]
    ]
};
get(5005)-> #{
    'chapter_id' => 5,
    'index' => 5,
    'prev_stage_id' => 5004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010053,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019004,
             480
        ],
         [
            102019003,
             55
        ]
    ]
};
get(5006)-> #{
    'chapter_id' => 5,
    'index' => 6,
    'prev_stage_id' => 5005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010054,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019004,
             480
        ],
         [
            102019003,
             55
        ]
    ]
};
get(5007)-> #{
    'chapter_id' => 5,
    'index' => 7,
    'prev_stage_id' => 5006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010055,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019006,
             480
        ],
         [
            102019005,
             55
        ]
    ]
};
get(5008)-> #{
    'chapter_id' => 5,
    'index' => 8,
    'prev_stage_id' => 5007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010056,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019006,
             480
        ],
         [
            102019005,
             55
        ]
    ]
};
get(5009)-> #{
    'chapter_id' => 5,
    'index' => 9,
    'prev_stage_id' => 5008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010057,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019006,
             480
        ],
         [
            102019005,
             55
        ]
    ]
};
get(5010)-> #{
    'chapter_id' => 5,
    'index' => 10,
    'prev_stage_id' => 5009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010058,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019008,
             480
        ],
         [
            102019007,
             55
        ]
    ]
};
get(5011)-> #{
    'chapter_id' => 5,
    'index' => 11,
    'prev_stage_id' => 5010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010059,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019008,
             480
        ],
         [
            102019007,
             55
        ]
    ]
};
get(5012)-> #{
    'chapter_id' => 5,
    'index' => 12,
    'prev_stage_id' => 5011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010060,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1540
        ],
         [
            102008001,
             1
        ],
         [
            102019008,
             480
        ],
         [
            102019007,
             55
        ]
    ]
};
get(6001)-> #{
    'chapter_id' => 6,
    'index' => 1,
    'prev_stage_id' => 5012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010061,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019010,
             540
        ],
         [
            102019009,
             55
        ]
    ]
};
get(6002)-> #{
    'chapter_id' => 6,
    'index' => 2,
    'prev_stage_id' => 6001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010062,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019010,
             540
        ],
         [
            102019009,
             55
        ]
    ]
};
get(6003)-> #{
    'chapter_id' => 6,
    'index' => 3,
    'prev_stage_id' => 6002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010063,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019010,
             540
        ],
         [
            102019009,
             55
        ]
    ]
};
get(6004)-> #{
    'chapter_id' => 6,
    'index' => 4,
    'prev_stage_id' => 6003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010064,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019012,
             540
        ],
         [
            102019011,
             55
        ]
    ]
};
get(6005)-> #{
    'chapter_id' => 6,
    'index' => 5,
    'prev_stage_id' => 6004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010065,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019012,
             540
        ],
         [
            102019011,
             55
        ]
    ]
};
get(6006)-> #{
    'chapter_id' => 6,
    'index' => 6,
    'prev_stage_id' => 6005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010066,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019012,
             540
        ],
         [
            102019011,
             55
        ]
    ]
};
get(6007)-> #{
    'chapter_id' => 6,
    'index' => 7,
    'prev_stage_id' => 6006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010067,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019014,
             540
        ],
         [
            102019013,
             55
        ]
    ]
};
get(6008)-> #{
    'chapter_id' => 6,
    'index' => 8,
    'prev_stage_id' => 6007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010068,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019014,
             540
        ],
         [
            102019013,
             55
        ]
    ]
};
get(6009)-> #{
    'chapter_id' => 6,
    'index' => 9,
    'prev_stage_id' => 6008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010069,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019014,
             540
        ],
         [
            102019013,
             55
        ]
    ]
};
get(6010)-> #{
    'chapter_id' => 6,
    'index' => 10,
    'prev_stage_id' => 6009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010070,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019016,
             540
        ],
         [
            102019015,
             55
        ]
    ]
};
get(6011)-> #{
    'chapter_id' => 6,
    'index' => 11,
    'prev_stage_id' => 6010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010071,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019016,
             540
        ],
         [
            102019015,
             55
        ]
    ]
};
get(6012)-> #{
    'chapter_id' => 6,
    'index' => 12,
    'prev_stage_id' => 6011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010072,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1650
        ],
         [
            102008001,
             1
        ],
         [
            102019016,
             540
        ],
         [
            102019015,
             55
        ]
    ]
};
get(7001)-> #{
    'chapter_id' => 7,
    'index' => 1,
    'prev_stage_id' => 6012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010073,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019008,
             600
        ],
         [
            102019007,
             55
        ]
    ]
};
get(7002)-> #{
    'chapter_id' => 7,
    'index' => 2,
    'prev_stage_id' => 7001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010074,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019008,
             600
        ],
         [
            102019007,
             55
        ]
    ]
};
get(7003)-> #{
    'chapter_id' => 7,
    'index' => 3,
    'prev_stage_id' => 7002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010075,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019008,
             600
        ],
         [
            102019007,
             55
        ]
    ]
};
get(7004)-> #{
    'chapter_id' => 7,
    'index' => 4,
    'prev_stage_id' => 7003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010076,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019006,
             600
        ],
         [
            102019003,
             55
        ]
    ]
};
get(7005)-> #{
    'chapter_id' => 7,
    'index' => 5,
    'prev_stage_id' => 7004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010077,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019006,
             600
        ],
         [
            102019003,
             55
        ]
    ]
};
get(7006)-> #{
    'chapter_id' => 7,
    'index' => 6,
    'prev_stage_id' => 7005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010078,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019006,
             600
        ],
         [
            102019003,
             55
        ]
    ]
};
get(7007)-> #{
    'chapter_id' => 7,
    'index' => 7,
    'prev_stage_id' => 7006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010079,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019004,
             600
        ],
         [
            102019005,
             55
        ]
    ]
};
get(7008)-> #{
    'chapter_id' => 7,
    'index' => 8,
    'prev_stage_id' => 7007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010080,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019004,
             600
        ],
         [
            102019005,
             55
        ]
    ]
};
get(7009)-> #{
    'chapter_id' => 7,
    'index' => 9,
    'prev_stage_id' => 7008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010081,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019004,
             600
        ],
         [
            102019005,
             55
        ]
    ]
};
get(7010)-> #{
    'chapter_id' => 7,
    'index' => 10,
    'prev_stage_id' => 7009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010082,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019002,
             600
        ],
         [
            102019001,
             55
        ]
    ]
};
get(7011)-> #{
    'chapter_id' => 7,
    'index' => 11,
    'prev_stage_id' => 7010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010083,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019002,
             600
        ],
         [
            102019001,
             55
        ]
    ]
};
get(7012)-> #{
    'chapter_id' => 7,
    'index' => 12,
    'prev_stage_id' => 7011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010084,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1760
        ],
         [
            102008001,
             1
        ],
         [
            102019002,
             600
        ],
         [
            102019001,
             55
        ]
    ]
};
get(8001)-> #{
    'chapter_id' => 8,
    'index' => 1,
    'prev_stage_id' => 7012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010085,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019016,
             660
        ],
         [
            102019015,
             55
        ]
    ]
};
get(8002)-> #{
    'chapter_id' => 8,
    'index' => 2,
    'prev_stage_id' => 8001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010086,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019016,
             660
        ],
         [
            102019015,
             55
        ]
    ]
};
get(8003)-> #{
    'chapter_id' => 8,
    'index' => 3,
    'prev_stage_id' => 8002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010087,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019016,
             660
        ],
         [
            102019015,
             55
        ]
    ]
};
get(8004)-> #{
    'chapter_id' => 8,
    'index' => 4,
    'prev_stage_id' => 8003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010088,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019014,
             660
        ],
         [
            102019013,
             55
        ]
    ]
};
get(8005)-> #{
    'chapter_id' => 8,
    'index' => 5,
    'prev_stage_id' => 8004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010089,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019014,
             660
        ],
         [
            102019013,
             55
        ]
    ]
};
get(8006)-> #{
    'chapter_id' => 8,
    'index' => 6,
    'prev_stage_id' => 8005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010090,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019014,
             660
        ],
         [
            102019013,
             55
        ]
    ]
};
get(8007)-> #{
    'chapter_id' => 8,
    'index' => 7,
    'prev_stage_id' => 8006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010091,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019012,
             660
        ],
         [
            102019011,
             55
        ]
    ]
};
get(8008)-> #{
    'chapter_id' => 8,
    'index' => 8,
    'prev_stage_id' => 8007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010092,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019012,
             660
        ],
         [
            102019011,
             55
        ]
    ]
};
get(8009)-> #{
    'chapter_id' => 8,
    'index' => 9,
    'prev_stage_id' => 8008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010093,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019012,
             660
        ],
         [
            102019011,
             55
        ]
    ]
};
get(8010)-> #{
    'chapter_id' => 8,
    'index' => 10,
    'prev_stage_id' => 8009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010094,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019010,
             660
        ],
         [
            102019009,
             55
        ]
    ]
};
get(8011)-> #{
    'chapter_id' => 8,
    'index' => 11,
    'prev_stage_id' => 8010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010095,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019010,
             660
        ],
         [
            102019009,
             55
        ]
    ]
};
get(8012)-> #{
    'chapter_id' => 8,
    'index' => 12,
    'prev_stage_id' => 8011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010096,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1870
        ],
         [
            102008001,
             1
        ],
         [
            102019010,
             660
        ],
         [
            102019009,
             55
        ]
    ]
};
get(9001)-> #{
    'chapter_id' => 9,
    'index' => 1,
    'prev_stage_id' => 8012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010097,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019017,
             480
        ],
         [
            102019002,
             55
        ]
    ]
};
get(9002)-> #{
    'chapter_id' => 9,
    'index' => 2,
    'prev_stage_id' => 9001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010098,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019017,
             480
        ],
         [
            102019002,
             55
        ]
    ]
};
get(9003)-> #{
    'chapter_id' => 9,
    'index' => 3,
    'prev_stage_id' => 9002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010099,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019017,
             480
        ],
         [
            102019002,
             55
        ]
    ]
};
get(9004)-> #{
    'chapter_id' => 9,
    'index' => 4,
    'prev_stage_id' => 9003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010100,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019019,
             480
        ],
         [
            102019004,
             55
        ]
    ]
};
get(9005)-> #{
    'chapter_id' => 9,
    'index' => 5,
    'prev_stage_id' => 9004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010101,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019019,
             480
        ],
         [
            102019004,
             55
        ]
    ]
};
get(9006)-> #{
    'chapter_id' => 9,
    'index' => 6,
    'prev_stage_id' => 9005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010102,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019019,
             480
        ],
         [
            102019004,
             55
        ]
    ]
};
get(9007)-> #{
    'chapter_id' => 9,
    'index' => 7,
    'prev_stage_id' => 9006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010103,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019021,
             480
        ],
         [
            102019006,
             55
        ]
    ]
};
get(9008)-> #{
    'chapter_id' => 9,
    'index' => 8,
    'prev_stage_id' => 9007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010104,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019021,
             480
        ],
         [
            102019006,
             55
        ]
    ]
};
get(9009)-> #{
    'chapter_id' => 9,
    'index' => 9,
    'prev_stage_id' => 9008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010105,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019021,
             480
        ],
         [
            102019006,
             55
        ]
    ]
};
get(9010)-> #{
    'chapter_id' => 9,
    'index' => 10,
    'prev_stage_id' => 9009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010106,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019023,
             480
        ],
         [
            102019008,
             55
        ]
    ]
};
get(9011)-> #{
    'chapter_id' => 9,
    'index' => 11,
    'prev_stage_id' => 9010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010107,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019023,
             480
        ],
         [
            102019008,
             55
        ]
    ]
};
get(9012)-> #{
    'chapter_id' => 9,
    'index' => 12,
    'prev_stage_id' => 9011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010108,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             1980
        ],
         [
            102008001,
             1
        ],
         [
            102019023,
             480
        ],
         [
            102019008,
             55
        ]
    ]
};
get(10001)-> #{
    'chapter_id' => 10,
    'index' => 1,
    'prev_stage_id' => 9012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010109,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019025,
             540
        ],
         [
            102019010,
             55
        ]
    ]
};
get(10002)-> #{
    'chapter_id' => 10,
    'index' => 2,
    'prev_stage_id' => 10001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010110,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019025,
             540
        ],
         [
            102019010,
             55
        ]
    ]
};
get(10003)-> #{
    'chapter_id' => 10,
    'index' => 3,
    'prev_stage_id' => 10002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010111,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019025,
             540
        ],
         [
            102019010,
             55
        ]
    ]
};
get(10004)-> #{
    'chapter_id' => 10,
    'index' => 4,
    'prev_stage_id' => 10003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010112,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019027,
             540
        ],
         [
            102019012,
             55
        ]
    ]
};
get(10005)-> #{
    'chapter_id' => 10,
    'index' => 5,
    'prev_stage_id' => 10004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010113,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019027,
             540
        ],
         [
            102019012,
             55
        ]
    ]
};
get(10006)-> #{
    'chapter_id' => 10,
    'index' => 6,
    'prev_stage_id' => 10005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010114,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019027,
             540
        ],
         [
            102019012,
             55
        ]
    ]
};
get(10007)-> #{
    'chapter_id' => 10,
    'index' => 7,
    'prev_stage_id' => 10006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010115,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019029,
             540
        ],
         [
            102019014,
             55
        ]
    ]
};
get(10008)-> #{
    'chapter_id' => 10,
    'index' => 8,
    'prev_stage_id' => 10007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010116,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019029,
             540
        ],
         [
            102019014,
             55
        ]
    ]
};
get(10009)-> #{
    'chapter_id' => 10,
    'index' => 9,
    'prev_stage_id' => 10008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010117,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019029,
             540
        ],
         [
            102019014,
             55
        ]
    ]
};
get(10010)-> #{
    'chapter_id' => 10,
    'index' => 10,
    'prev_stage_id' => 10009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010118,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019031,
             540
        ],
         [
            102019016,
             55
        ]
    ]
};
get(10011)-> #{
    'chapter_id' => 10,
    'index' => 11,
    'prev_stage_id' => 10010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010119,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019031,
             540
        ],
         [
            102019016,
             55
        ]
    ]
};
get(10012)-> #{
    'chapter_id' => 10,
    'index' => 12,
    'prev_stage_id' => 10011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010120,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2090
        ],
         [
            102008001,
             1
        ],
         [
            102019031,
             540
        ],
         [
            102019016,
             55
        ]
    ]
};
get(11001)-> #{
    'chapter_id' => 11,
    'index' => 1,
    'prev_stage_id' => 10012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010121,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019023,
             600
        ],
         [
            102019008,
             55
        ]
    ]
};
get(11002)-> #{
    'chapter_id' => 11,
    'index' => 2,
    'prev_stage_id' => 11001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010122,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019023,
             600
        ],
         [
            102019008,
             55
        ]
    ]
};
get(11003)-> #{
    'chapter_id' => 11,
    'index' => 3,
    'prev_stage_id' => 11002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010123,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019023,
             600
        ],
         [
            102019008,
             55
        ]
    ]
};
get(11004)-> #{
    'chapter_id' => 11,
    'index' => 4,
    'prev_stage_id' => 11003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010124,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019021,
             600
        ],
         [
            102019006,
             55
        ]
    ]
};
get(11005)-> #{
    'chapter_id' => 11,
    'index' => 5,
    'prev_stage_id' => 11004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010125,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019021,
             600
        ],
         [
            102019006,
             55
        ]
    ]
};
get(11006)-> #{
    'chapter_id' => 11,
    'index' => 6,
    'prev_stage_id' => 11005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010126,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019021,
             600
        ],
         [
            102019006,
             55
        ]
    ]
};
get(11007)-> #{
    'chapter_id' => 11,
    'index' => 7,
    'prev_stage_id' => 11006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010127,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019019,
             600
        ],
         [
            102019004,
             55
        ]
    ]
};
get(11008)-> #{
    'chapter_id' => 11,
    'index' => 8,
    'prev_stage_id' => 11007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010128,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019019,
             600
        ],
         [
            102019004,
             55
        ]
    ]
};
get(11009)-> #{
    'chapter_id' => 11,
    'index' => 9,
    'prev_stage_id' => 11008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010129,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019019,
             600
        ],
         [
            102019004,
             55
        ]
    ]
};
get(11010)-> #{
    'chapter_id' => 11,
    'index' => 10,
    'prev_stage_id' => 11009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010130,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019017,
             600
        ],
         [
            102019002,
             55
        ]
    ]
};
get(11011)-> #{
    'chapter_id' => 11,
    'index' => 11,
    'prev_stage_id' => 11010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010131,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019017,
             600
        ],
         [
            102019002,
             55
        ]
    ]
};
get(11012)-> #{
    'chapter_id' => 11,
    'index' => 12,
    'prev_stage_id' => 11011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010132,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2200
        ],
         [
            102008001,
             1
        ],
         [
            102019017,
             600
        ],
         [
            102019002,
             55
        ]
    ]
};
get(12001)-> #{
    'chapter_id' => 12,
    'index' => 1,
    'prev_stage_id' => 11012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010133,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019031,
             660
        ],
         [
            102019016,
             55
        ]
    ]
};
get(12002)-> #{
    'chapter_id' => 12,
    'index' => 2,
    'prev_stage_id' => 12001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010134,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019031,
             660
        ],
         [
            102019016,
             55
        ]
    ]
};
get(12003)-> #{
    'chapter_id' => 12,
    'index' => 3,
    'prev_stage_id' => 12002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010135,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019031,
             660
        ],
         [
            102019016,
             55
        ]
    ]
};
get(12004)-> #{
    'chapter_id' => 12,
    'index' => 4,
    'prev_stage_id' => 12003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010136,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019029,
             660
        ],
         [
            102019014,
             55
        ]
    ]
};
get(12005)-> #{
    'chapter_id' => 12,
    'index' => 5,
    'prev_stage_id' => 12004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010137,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019029,
             660
        ],
         [
            102019014,
             55
        ]
    ]
};
get(12006)-> #{
    'chapter_id' => 12,
    'index' => 6,
    'prev_stage_id' => 12005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010138,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019029,
             660
        ],
         [
            102019014,
             55
        ]
    ]
};
get(12007)-> #{
    'chapter_id' => 12,
    'index' => 7,
    'prev_stage_id' => 12006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010139,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019027,
             660
        ],
         [
            102019012,
             55
        ]
    ]
};
get(12008)-> #{
    'chapter_id' => 12,
    'index' => 8,
    'prev_stage_id' => 12007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010140,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019027,
             660
        ],
         [
            102019012,
             55
        ]
    ]
};
get(12009)-> #{
    'chapter_id' => 12,
    'index' => 9,
    'prev_stage_id' => 12008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010141,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019027,
             660
        ],
         [
            102019012,
             55
        ]
    ]
};
get(12010)-> #{
    'chapter_id' => 12,
    'index' => 10,
    'prev_stage_id' => 12009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010142,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019025,
             660
        ],
         [
            102019010,
             55
        ]
    ]
};
get(12011)-> #{
    'chapter_id' => 12,
    'index' => 11,
    'prev_stage_id' => 12010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010143,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019025,
             660
        ],
         [
            102019010,
             55
        ]
    ]
};
get(12012)-> #{
    'chapter_id' => 12,
    'index' => 12,
    'prev_stage_id' => 12011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010144,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2310
        ],
         [
            102008001,
             1
        ],
         [
            102019025,
             660
        ],
         [
            102019010,
             55
        ]
    ]
};
get(13001)-> #{
    'chapter_id' => 13,
    'index' => 1,
    'prev_stage_id' => 12012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010145,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019018,
             480
        ],
         [
            102019017,
             55
        ]
    ]
};
get(13002)-> #{
    'chapter_id' => 13,
    'index' => 2,
    'prev_stage_id' => 13001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010146,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019018,
             480
        ],
         [
            102019017,
             55
        ]
    ]
};
get(13003)-> #{
    'chapter_id' => 13,
    'index' => 3,
    'prev_stage_id' => 13002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010147,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019018,
             480
        ],
         [
            102019017,
             55
        ]
    ]
};
get(13004)-> #{
    'chapter_id' => 13,
    'index' => 4,
    'prev_stage_id' => 13003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010148,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019020,
             480
        ],
         [
            102019019,
             55
        ]
    ]
};
get(13005)-> #{
    'chapter_id' => 13,
    'index' => 5,
    'prev_stage_id' => 13004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010149,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019020,
             480
        ],
         [
            102019019,
             55
        ]
    ]
};
get(13006)-> #{
    'chapter_id' => 13,
    'index' => 6,
    'prev_stage_id' => 13005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010150,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019020,
             480
        ],
         [
            102019019,
             55
        ]
    ]
};
get(13007)-> #{
    'chapter_id' => 13,
    'index' => 7,
    'prev_stage_id' => 13006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010151,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019022,
             480
        ],
         [
            102019021,
             55
        ]
    ]
};
get(13008)-> #{
    'chapter_id' => 13,
    'index' => 8,
    'prev_stage_id' => 13007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010152,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019022,
             480
        ],
         [
            102019021,
             55
        ]
    ]
};
get(13009)-> #{
    'chapter_id' => 13,
    'index' => 9,
    'prev_stage_id' => 13008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010153,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019022,
             480
        ],
         [
            102019021,
             55
        ]
    ]
};
get(13010)-> #{
    'chapter_id' => 13,
    'index' => 10,
    'prev_stage_id' => 13009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010154,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019024,
             480
        ],
         [
            102019023,
             55
        ]
    ]
};
get(13011)-> #{
    'chapter_id' => 13,
    'index' => 11,
    'prev_stage_id' => 13010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010155,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019024,
             480
        ],
         [
            102019023,
             55
        ]
    ]
};
get(13012)-> #{
    'chapter_id' => 13,
    'index' => 12,
    'prev_stage_id' => 13011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010156,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2420
        ],
         [
            102008001,
             1
        ],
         [
            102019024,
             480
        ],
         [
            102019023,
             55
        ]
    ]
};
get(14001)-> #{
    'chapter_id' => 14,
    'index' => 1,
    'prev_stage_id' => 13012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010157,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019026,
             540
        ],
         [
            102019025,
             55
        ]
    ]
};
get(14002)-> #{
    'chapter_id' => 14,
    'index' => 2,
    'prev_stage_id' => 14001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010158,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019026,
             540
        ],
         [
            102019025,
             55
        ]
    ]
};
get(14003)-> #{
    'chapter_id' => 14,
    'index' => 3,
    'prev_stage_id' => 14002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010159,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019026,
             540
        ],
         [
            102019025,
             55
        ]
    ]
};
get(14004)-> #{
    'chapter_id' => 14,
    'index' => 4,
    'prev_stage_id' => 14003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010160,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019028,
             540
        ],
         [
            102019027,
             55
        ]
    ]
};
get(14005)-> #{
    'chapter_id' => 14,
    'index' => 5,
    'prev_stage_id' => 14004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010161,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019028,
             540
        ],
         [
            102019027,
             55
        ]
    ]
};
get(14006)-> #{
    'chapter_id' => 14,
    'index' => 6,
    'prev_stage_id' => 14005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010162,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019028,
             540
        ],
         [
            102019027,
             55
        ]
    ]
};
get(14007)-> #{
    'chapter_id' => 14,
    'index' => 7,
    'prev_stage_id' => 14006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010163,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019030,
             540
        ],
         [
            102019029,
             55
        ]
    ]
};
get(14008)-> #{
    'chapter_id' => 14,
    'index' => 8,
    'prev_stage_id' => 14007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010164,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019030,
             540
        ],
         [
            102019029,
             55
        ]
    ]
};
get(14009)-> #{
    'chapter_id' => 14,
    'index' => 9,
    'prev_stage_id' => 14008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010165,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019030,
             540
        ],
         [
            102019029,
             55
        ]
    ]
};
get(14010)-> #{
    'chapter_id' => 14,
    'index' => 10,
    'prev_stage_id' => 14009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010166,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019032,
             540
        ],
         [
            102019031,
             55
        ]
    ]
};
get(14011)-> #{
    'chapter_id' => 14,
    'index' => 11,
    'prev_stage_id' => 14010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010167,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019032,
             540
        ],
         [
            102019031,
             55
        ]
    ]
};
get(14012)-> #{
    'chapter_id' => 14,
    'index' => 12,
    'prev_stage_id' => 14011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010168,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2530
        ],
         [
            102008001,
             1
        ],
         [
            102019032,
             540
        ],
         [
            102019031,
             55
        ]
    ]
};
get(15001)-> #{
    'chapter_id' => 15,
    'index' => 1,
    'prev_stage_id' => 14012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010169,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019024,
             600
        ],
         [
            102019023,
             55
        ]
    ]
};
get(15002)-> #{
    'chapter_id' => 15,
    'index' => 2,
    'prev_stage_id' => 15001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010170,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019024,
             600
        ],
         [
            102019023,
             55
        ]
    ]
};
get(15003)-> #{
    'chapter_id' => 15,
    'index' => 3,
    'prev_stage_id' => 15002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010171,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019024,
             600
        ],
         [
            102019023,
             55
        ]
    ]
};
get(15004)-> #{
    'chapter_id' => 15,
    'index' => 4,
    'prev_stage_id' => 15003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010172,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019022,
             600
        ],
         [
            102019021,
             55
        ]
    ]
};
get(15005)-> #{
    'chapter_id' => 15,
    'index' => 5,
    'prev_stage_id' => 15004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010173,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019022,
             600
        ],
         [
            102019021,
             55
        ]
    ]
};
get(15006)-> #{
    'chapter_id' => 15,
    'index' => 6,
    'prev_stage_id' => 15005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010174,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019022,
             600
        ],
         [
            102019021,
             55
        ]
    ]
};
get(15007)-> #{
    'chapter_id' => 15,
    'index' => 7,
    'prev_stage_id' => 15006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010175,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019020,
             600
        ],
         [
            102019019,
             55
        ]
    ]
};
get(15008)-> #{
    'chapter_id' => 15,
    'index' => 8,
    'prev_stage_id' => 15007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010176,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019020,
             600
        ],
         [
            102019019,
             55
        ]
    ]
};
get(15009)-> #{
    'chapter_id' => 15,
    'index' => 9,
    'prev_stage_id' => 15008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010177,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019020,
             600
        ],
         [
            102019019,
             55
        ]
    ]
};
get(15010)-> #{
    'chapter_id' => 15,
    'index' => 10,
    'prev_stage_id' => 15009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010178,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019018,
             600
        ],
         [
            102019017,
             55
        ]
    ]
};
get(15011)-> #{
    'chapter_id' => 15,
    'index' => 11,
    'prev_stage_id' => 15010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010179,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019018,
             600
        ],
         [
            102019017,
             55
        ]
    ]
};
get(15012)-> #{
    'chapter_id' => 15,
    'index' => 12,
    'prev_stage_id' => 15011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010180,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2640
        ],
         [
            102008001,
             1
        ],
         [
            102019018,
             600
        ],
         [
            102019017,
             55
        ]
    ]
};
get(16001)-> #{
    'chapter_id' => 16,
    'index' => 1,
    'prev_stage_id' => 15012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010181,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019032,
             660
        ],
         [
            102019031,
             55
        ]
    ]
};
get(16002)-> #{
    'chapter_id' => 16,
    'index' => 2,
    'prev_stage_id' => 16001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010182,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019032,
             660
        ],
         [
            102019031,
             55
        ]
    ]
};
get(16003)-> #{
    'chapter_id' => 16,
    'index' => 3,
    'prev_stage_id' => 16002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010183,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019032,
             660
        ],
         [
            102019031,
             55
        ]
    ]
};
get(16004)-> #{
    'chapter_id' => 16,
    'index' => 4,
    'prev_stage_id' => 16003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010184,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019030,
             660
        ],
         [
            102019029,
             55
        ]
    ]
};
get(16005)-> #{
    'chapter_id' => 16,
    'index' => 5,
    'prev_stage_id' => 16004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010185,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019030,
             660
        ],
         [
            102019029,
             55
        ]
    ]
};
get(16006)-> #{
    'chapter_id' => 16,
    'index' => 6,
    'prev_stage_id' => 16005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010186,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019030,
             660
        ],
         [
            102019029,
             55
        ]
    ]
};
get(16007)-> #{
    'chapter_id' => 16,
    'index' => 7,
    'prev_stage_id' => 16006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010187,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019028,
             660
        ],
         [
            102019027,
             55
        ]
    ]
};
get(16008)-> #{
    'chapter_id' => 16,
    'index' => 8,
    'prev_stage_id' => 16007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010188,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019028,
             660
        ],
         [
            102019027,
             55
        ]
    ]
};
get(16009)-> #{
    'chapter_id' => 16,
    'index' => 9,
    'prev_stage_id' => 16008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010189,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019028,
             660
        ],
         [
            102019027,
             55
        ]
    ]
};
get(16010)-> #{
    'chapter_id' => 16,
    'index' => 10,
    'prev_stage_id' => 16009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010190,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019026,
             660
        ],
         [
            102019025,
             55
        ]
    ]
};
get(16011)-> #{
    'chapter_id' => 16,
    'index' => 11,
    'prev_stage_id' => 16010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010191,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019026,
             660
        ],
         [
            102019025,
             55
        ]
    ]
};
get(16012)-> #{
    'chapter_id' => 16,
    'index' => 12,
    'prev_stage_id' => 16011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010192,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2750
        ],
         [
            102008001,
             1
        ],
         [
            102019026,
             660
        ],
         [
            102019025,
             55
        ]
    ]
};
get(17001)-> #{
    'chapter_id' => 17,
    'index' => 1,
    'prev_stage_id' => 16012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010193,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019033,
             480
        ],
         [
            102019018,
             55
        ]
    ]
};
get(17002)-> #{
    'chapter_id' => 17,
    'index' => 2,
    'prev_stage_id' => 17001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010194,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019033,
             480
        ],
         [
            102019018,
             55
        ]
    ]
};
get(17003)-> #{
    'chapter_id' => 17,
    'index' => 3,
    'prev_stage_id' => 17002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010195,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019033,
             480
        ],
         [
            102019018,
             55
        ]
    ]
};
get(17004)-> #{
    'chapter_id' => 17,
    'index' => 4,
    'prev_stage_id' => 17003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010196,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019035,
             480
        ],
         [
            102019020,
             55
        ]
    ]
};
get(17005)-> #{
    'chapter_id' => 17,
    'index' => 5,
    'prev_stage_id' => 17004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010197,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019035,
             480
        ],
         [
            102019020,
             55
        ]
    ]
};
get(17006)-> #{
    'chapter_id' => 17,
    'index' => 6,
    'prev_stage_id' => 17005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010198,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019035,
             480
        ],
         [
            102019020,
             55
        ]
    ]
};
get(17007)-> #{
    'chapter_id' => 17,
    'index' => 7,
    'prev_stage_id' => 17006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010199,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019037,
             480
        ],
         [
            102019022,
             55
        ]
    ]
};
get(17008)-> #{
    'chapter_id' => 17,
    'index' => 8,
    'prev_stage_id' => 17007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010200,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019037,
             480
        ],
         [
            102019022,
             55
        ]
    ]
};
get(17009)-> #{
    'chapter_id' => 17,
    'index' => 9,
    'prev_stage_id' => 17008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010201,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019037,
             480
        ],
         [
            102019022,
             55
        ]
    ]
};
get(17010)-> #{
    'chapter_id' => 17,
    'index' => 10,
    'prev_stage_id' => 17009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010202,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019039,
             480
        ],
         [
            102019024,
             55
        ]
    ]
};
get(17011)-> #{
    'chapter_id' => 17,
    'index' => 11,
    'prev_stage_id' => 17010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010203,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019039,
             480
        ],
         [
            102019024,
             55
        ]
    ]
};
get(17012)-> #{
    'chapter_id' => 17,
    'index' => 12,
    'prev_stage_id' => 17011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010204,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2860
        ],
         [
            102008001,
             1
        ],
         [
            102019039,
             480
        ],
         [
            102019024,
             55
        ]
    ]
};
get(18001)-> #{
    'chapter_id' => 18,
    'index' => 1,
    'prev_stage_id' => 17012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010205,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019041,
             540
        ],
         [
            102019026,
             55
        ]
    ]
};
get(18002)-> #{
    'chapter_id' => 18,
    'index' => 2,
    'prev_stage_id' => 18001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010206,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019041,
             540
        ],
         [
            102019026,
             55
        ]
    ]
};
get(18003)-> #{
    'chapter_id' => 18,
    'index' => 3,
    'prev_stage_id' => 18002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010207,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019041,
             540
        ],
         [
            102019026,
             55
        ]
    ]
};
get(18004)-> #{
    'chapter_id' => 18,
    'index' => 4,
    'prev_stage_id' => 18003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010208,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019043,
             540
        ],
         [
            102019028,
             55
        ]
    ]
};
get(18005)-> #{
    'chapter_id' => 18,
    'index' => 5,
    'prev_stage_id' => 18004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010209,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019043,
             540
        ],
         [
            102019028,
             55
        ]
    ]
};
get(18006)-> #{
    'chapter_id' => 18,
    'index' => 6,
    'prev_stage_id' => 18005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010210,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019043,
             540
        ],
         [
            102019028,
             55
        ]
    ]
};
get(18007)-> #{
    'chapter_id' => 18,
    'index' => 7,
    'prev_stage_id' => 18006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010211,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019045,
             540
        ],
         [
            102019030,
             55
        ]
    ]
};
get(18008)-> #{
    'chapter_id' => 18,
    'index' => 8,
    'prev_stage_id' => 18007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010212,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019045,
             540
        ],
         [
            102019030,
             55
        ]
    ]
};
get(18009)-> #{
    'chapter_id' => 18,
    'index' => 9,
    'prev_stage_id' => 18008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010213,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019045,
             540
        ],
         [
            102019030,
             55
        ]
    ]
};
get(18010)-> #{
    'chapter_id' => 18,
    'index' => 10,
    'prev_stage_id' => 18009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010214,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019047,
             540
        ],
         [
            102019032,
             55
        ]
    ]
};
get(18011)-> #{
    'chapter_id' => 18,
    'index' => 11,
    'prev_stage_id' => 18010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010215,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019047,
             540
        ],
         [
            102019032,
             55
        ]
    ]
};
get(18012)-> #{
    'chapter_id' => 18,
    'index' => 12,
    'prev_stage_id' => 18011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010216,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             2970
        ],
         [
            102008001,
             1
        ],
         [
            102019047,
             540
        ],
         [
            102019032,
             55
        ]
    ]
};
get(19001)-> #{
    'chapter_id' => 19,
    'index' => 1,
    'prev_stage_id' => 18012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010217,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019039,
             600
        ],
         [
            102019024,
             55
        ]
    ]
};
get(19002)-> #{
    'chapter_id' => 19,
    'index' => 2,
    'prev_stage_id' => 19001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010218,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019039,
             600
        ],
         [
            102019024,
             55
        ]
    ]
};
get(19003)-> #{
    'chapter_id' => 19,
    'index' => 3,
    'prev_stage_id' => 19002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010219,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019039,
             600
        ],
         [
            102019024,
             55
        ]
    ]
};
get(19004)-> #{
    'chapter_id' => 19,
    'index' => 4,
    'prev_stage_id' => 19003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010220,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019037,
             600
        ],
         [
            102019022,
             55
        ]
    ]
};
get(19005)-> #{
    'chapter_id' => 19,
    'index' => 5,
    'prev_stage_id' => 19004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010221,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019037,
             600
        ],
         [
            102019022,
             55
        ]
    ]
};
get(19006)-> #{
    'chapter_id' => 19,
    'index' => 6,
    'prev_stage_id' => 19005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010222,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019037,
             600
        ],
         [
            102019022,
             55
        ]
    ]
};
get(19007)-> #{
    'chapter_id' => 19,
    'index' => 7,
    'prev_stage_id' => 19006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010223,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019035,
             600
        ],
         [
            102019020,
             55
        ]
    ]
};
get(19008)-> #{
    'chapter_id' => 19,
    'index' => 8,
    'prev_stage_id' => 19007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010224,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019035,
             600
        ],
         [
            102019020,
             55
        ]
    ]
};
get(19009)-> #{
    'chapter_id' => 19,
    'index' => 9,
    'prev_stage_id' => 19008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010225,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019035,
             600
        ],
         [
            102019020,
             55
        ]
    ]
};
get(19010)-> #{
    'chapter_id' => 19,
    'index' => 10,
    'prev_stage_id' => 19009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010226,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019033,
             600
        ],
         [
            102019018,
             55
        ]
    ]
};
get(19011)-> #{
    'chapter_id' => 19,
    'index' => 11,
    'prev_stage_id' => 19010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010227,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019033,
             600
        ],
         [
            102019018,
             55
        ]
    ]
};
get(19012)-> #{
    'chapter_id' => 19,
    'index' => 12,
    'prev_stage_id' => 19011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010228,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3080
        ],
         [
            102008001,
             1
        ],
         [
            102019033,
             600
        ],
         [
            102019018,
             55
        ]
    ]
};
get(20001)-> #{
    'chapter_id' => 20,
    'index' => 1,
    'prev_stage_id' => 19012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010229,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019047,
             660
        ],
         [
            102019032,
             55
        ]
    ]
};
get(20002)-> #{
    'chapter_id' => 20,
    'index' => 2,
    'prev_stage_id' => 20001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010230,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019047,
             660
        ],
         [
            102019032,
             55
        ]
    ]
};
get(20003)-> #{
    'chapter_id' => 20,
    'index' => 3,
    'prev_stage_id' => 20002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010231,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019047,
             660
        ],
         [
            102019032,
             55
        ]
    ]
};
get(20004)-> #{
    'chapter_id' => 20,
    'index' => 4,
    'prev_stage_id' => 20003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010232,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019045,
             660
        ],
         [
            102019030,
             55
        ]
    ]
};
get(20005)-> #{
    'chapter_id' => 20,
    'index' => 5,
    'prev_stage_id' => 20004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010233,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019045,
             660
        ],
         [
            102019030,
             55
        ]
    ]
};
get(20006)-> #{
    'chapter_id' => 20,
    'index' => 6,
    'prev_stage_id' => 20005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010234,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019045,
             660
        ],
         [
            102019030,
             55
        ]
    ]
};
get(20007)-> #{
    'chapter_id' => 20,
    'index' => 7,
    'prev_stage_id' => 20006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010235,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019043,
             660
        ],
         [
            102019028,
             55
        ]
    ]
};
get(20008)-> #{
    'chapter_id' => 20,
    'index' => 8,
    'prev_stage_id' => 20007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010236,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019043,
             660
        ],
         [
            102019028,
             55
        ]
    ]
};
get(20009)-> #{
    'chapter_id' => 20,
    'index' => 9,
    'prev_stage_id' => 20008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010237,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019043,
             660
        ],
         [
            102019028,
             55
        ]
    ]
};
get(20010)-> #{
    'chapter_id' => 20,
    'index' => 10,
    'prev_stage_id' => 20009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010238,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019041,
             660
        ],
         [
            102019026,
             55
        ]
    ]
};
get(20011)-> #{
    'chapter_id' => 20,
    'index' => 11,
    'prev_stage_id' => 20010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010239,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019041,
             660
        ],
         [
            102019026,
             55
        ]
    ]
};
get(20012)-> #{
    'chapter_id' => 20,
    'index' => 12,
    'prev_stage_id' => 20011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010240,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3190
        ],
         [
            102008001,
             1
        ],
         [
            102019041,
             660
        ],
         [
            102019026,
             55
        ]
    ]
};
get(21001)-> #{
    'chapter_id' => 21,
    'index' => 1,
    'prev_stage_id' => 20012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010241,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             480
        ],
         [
            102019033,
             55
        ]
    ]
};
get(21002)-> #{
    'chapter_id' => 21,
    'index' => 2,
    'prev_stage_id' => 21001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010242,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             480
        ],
         [
            102019033,
             55
        ]
    ]
};
get(21003)-> #{
    'chapter_id' => 21,
    'index' => 3,
    'prev_stage_id' => 21002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010243,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             480
        ],
         [
            102019033,
             55
        ]
    ]
};
get(21004)-> #{
    'chapter_id' => 21,
    'index' => 4,
    'prev_stage_id' => 21003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010244,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             480
        ],
         [
            102019035,
             55
        ]
    ]
};
get(21005)-> #{
    'chapter_id' => 21,
    'index' => 5,
    'prev_stage_id' => 21004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010245,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             480
        ],
         [
            102019035,
             55
        ]
    ]
};
get(21006)-> #{
    'chapter_id' => 21,
    'index' => 6,
    'prev_stage_id' => 21005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010246,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             480
        ],
         [
            102019035,
             55
        ]
    ]
};
get(21007)-> #{
    'chapter_id' => 21,
    'index' => 7,
    'prev_stage_id' => 21006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010247,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             480
        ],
         [
            102019037,
             55
        ]
    ]
};
get(21008)-> #{
    'chapter_id' => 21,
    'index' => 8,
    'prev_stage_id' => 21007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010248,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             480
        ],
         [
            102019037,
             55
        ]
    ]
};
get(21009)-> #{
    'chapter_id' => 21,
    'index' => 9,
    'prev_stage_id' => 21008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010249,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             480
        ],
         [
            102019037,
             55
        ]
    ]
};
get(21010)-> #{
    'chapter_id' => 21,
    'index' => 10,
    'prev_stage_id' => 21009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010250,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             480
        ],
         [
            102019039,
             55
        ]
    ]
};
get(21011)-> #{
    'chapter_id' => 21,
    'index' => 11,
    'prev_stage_id' => 21010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010251,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             480
        ],
         [
            102019039,
             55
        ]
    ]
};
get(21012)-> #{
    'chapter_id' => 21,
    'index' => 12,
    'prev_stage_id' => 21011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010252,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3300
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             480
        ],
         [
            102019039,
             55
        ]
    ]
};
get(22001)-> #{
    'chapter_id' => 22,
    'index' => 1,
    'prev_stage_id' => 21012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010253,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             540
        ],
         [
            102019041,
             55
        ]
    ]
};
get(22002)-> #{
    'chapter_id' => 22,
    'index' => 2,
    'prev_stage_id' => 22001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010254,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             540
        ],
         [
            102019041,
             55
        ]
    ]
};
get(22003)-> #{
    'chapter_id' => 22,
    'index' => 3,
    'prev_stage_id' => 22002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010255,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             540
        ],
         [
            102019041,
             55
        ]
    ]
};
get(22004)-> #{
    'chapter_id' => 22,
    'index' => 4,
    'prev_stage_id' => 22003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010256,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             540
        ],
         [
            102019043,
             55
        ]
    ]
};
get(22005)-> #{
    'chapter_id' => 22,
    'index' => 5,
    'prev_stage_id' => 22004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010257,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             540
        ],
         [
            102019043,
             55
        ]
    ]
};
get(22006)-> #{
    'chapter_id' => 22,
    'index' => 6,
    'prev_stage_id' => 22005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010258,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             540
        ],
         [
            102019043,
             55
        ]
    ]
};
get(22007)-> #{
    'chapter_id' => 22,
    'index' => 7,
    'prev_stage_id' => 22006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010259,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             540
        ],
         [
            102019045,
             55
        ]
    ]
};
get(22008)-> #{
    'chapter_id' => 22,
    'index' => 8,
    'prev_stage_id' => 22007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010260,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             540
        ],
         [
            102019045,
             55
        ]
    ]
};
get(22009)-> #{
    'chapter_id' => 22,
    'index' => 9,
    'prev_stage_id' => 22008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010261,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             540
        ],
         [
            102019045,
             55
        ]
    ]
};
get(22010)-> #{
    'chapter_id' => 22,
    'index' => 10,
    'prev_stage_id' => 22009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010262,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             540
        ],
         [
            102019047,
             55
        ]
    ]
};
get(22011)-> #{
    'chapter_id' => 22,
    'index' => 11,
    'prev_stage_id' => 22010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010263,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             540
        ],
         [
            102019047,
             55
        ]
    ]
};
get(22012)-> #{
    'chapter_id' => 22,
    'index' => 12,
    'prev_stage_id' => 22011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010264,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3410
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             540
        ],
         [
            102019047,
             55
        ]
    ]
};
get(23001)-> #{
    'chapter_id' => 23,
    'index' => 1,
    'prev_stage_id' => 22012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010265,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             600
        ],
         [
            102019039,
             55
        ]
    ]
};
get(23002)-> #{
    'chapter_id' => 23,
    'index' => 2,
    'prev_stage_id' => 23001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010266,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             600
        ],
         [
            102019039,
             55
        ]
    ]
};
get(23003)-> #{
    'chapter_id' => 23,
    'index' => 3,
    'prev_stage_id' => 23002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010267,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             600
        ],
         [
            102019039,
             55
        ]
    ]
};
get(23004)-> #{
    'chapter_id' => 23,
    'index' => 4,
    'prev_stage_id' => 23003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010268,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             600
        ],
         [
            102019037,
             55
        ]
    ]
};
get(23005)-> #{
    'chapter_id' => 23,
    'index' => 5,
    'prev_stage_id' => 23004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010269,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             600
        ],
         [
            102019037,
             55
        ]
    ]
};
get(23006)-> #{
    'chapter_id' => 23,
    'index' => 6,
    'prev_stage_id' => 23005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010270,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             600
        ],
         [
            102019037,
             55
        ]
    ]
};
get(23007)-> #{
    'chapter_id' => 23,
    'index' => 7,
    'prev_stage_id' => 23006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010271,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             600
        ],
         [
            102019035,
             55
        ]
    ]
};
get(23008)-> #{
    'chapter_id' => 23,
    'index' => 8,
    'prev_stage_id' => 23007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010272,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             600
        ],
         [
            102019035,
             55
        ]
    ]
};
get(23009)-> #{
    'chapter_id' => 23,
    'index' => 9,
    'prev_stage_id' => 23008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010273,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             600
        ],
         [
            102019035,
             55
        ]
    ]
};
get(23010)-> #{
    'chapter_id' => 23,
    'index' => 10,
    'prev_stage_id' => 23009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010274,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             600
        ],
         [
            102019033,
             55
        ]
    ]
};
get(23011)-> #{
    'chapter_id' => 23,
    'index' => 11,
    'prev_stage_id' => 23010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010275,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             600
        ],
         [
            102019033,
             55
        ]
    ]
};
get(23012)-> #{
    'chapter_id' => 23,
    'index' => 12,
    'prev_stage_id' => 23011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010276,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3520
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             600
        ],
         [
            102019033,
             55
        ]
    ]
};
get(24001)-> #{
    'chapter_id' => 24,
    'index' => 1,
    'prev_stage_id' => 23012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010277,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(24002)-> #{
    'chapter_id' => 24,
    'index' => 2,
    'prev_stage_id' => 24001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010278,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(24003)-> #{
    'chapter_id' => 24,
    'index' => 3,
    'prev_stage_id' => 24002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010279,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(24004)-> #{
    'chapter_id' => 24,
    'index' => 4,
    'prev_stage_id' => 24003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010280,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(24005)-> #{
    'chapter_id' => 24,
    'index' => 5,
    'prev_stage_id' => 24004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010281,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(24006)-> #{
    'chapter_id' => 24,
    'index' => 6,
    'prev_stage_id' => 24005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010282,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(24007)-> #{
    'chapter_id' => 24,
    'index' => 7,
    'prev_stage_id' => 24006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010283,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(24008)-> #{
    'chapter_id' => 24,
    'index' => 8,
    'prev_stage_id' => 24007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010284,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(24009)-> #{
    'chapter_id' => 24,
    'index' => 9,
    'prev_stage_id' => 24008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010285,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(24010)-> #{
    'chapter_id' => 24,
    'index' => 10,
    'prev_stage_id' => 24009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010286,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(24011)-> #{
    'chapter_id' => 24,
    'index' => 11,
    'prev_stage_id' => 24010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010287,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(24012)-> #{
    'chapter_id' => 24,
    'index' => 12,
    'prev_stage_id' => 24011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010288,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3630
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(25001)-> #{
    'chapter_id' => 25,
    'index' => 1,
    'prev_stage_id' => 24012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010289,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             660
        ],
         [
            102019033,
             55
        ]
    ]
};
get(25002)-> #{
    'chapter_id' => 25,
    'index' => 2,
    'prev_stage_id' => 25001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010290,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             660
        ],
         [
            102019033,
             55
        ]
    ]
};
get(25003)-> #{
    'chapter_id' => 25,
    'index' => 3,
    'prev_stage_id' => 25002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010291,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             660
        ],
         [
            102019033,
             55
        ]
    ]
};
get(25004)-> #{
    'chapter_id' => 25,
    'index' => 4,
    'prev_stage_id' => 25003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010292,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             660
        ],
         [
            102019035,
             55
        ]
    ]
};
get(25005)-> #{
    'chapter_id' => 25,
    'index' => 5,
    'prev_stage_id' => 25004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010293,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             660
        ],
         [
            102019035,
             55
        ]
    ]
};
get(25006)-> #{
    'chapter_id' => 25,
    'index' => 6,
    'prev_stage_id' => 25005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010294,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             660
        ],
         [
            102019035,
             55
        ]
    ]
};
get(25007)-> #{
    'chapter_id' => 25,
    'index' => 7,
    'prev_stage_id' => 25006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010295,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             660
        ],
         [
            102019037,
             55
        ]
    ]
};
get(25008)-> #{
    'chapter_id' => 25,
    'index' => 8,
    'prev_stage_id' => 25007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010296,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             660
        ],
         [
            102019037,
             55
        ]
    ]
};
get(25009)-> #{
    'chapter_id' => 25,
    'index' => 9,
    'prev_stage_id' => 25008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010297,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             660
        ],
         [
            102019037,
             55
        ]
    ]
};
get(25010)-> #{
    'chapter_id' => 25,
    'index' => 10,
    'prev_stage_id' => 25009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010298,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             660
        ],
         [
            102019039,
             55
        ]
    ]
};
get(25011)-> #{
    'chapter_id' => 25,
    'index' => 11,
    'prev_stage_id' => 25010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010299,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             660
        ],
         [
            102019039,
             55
        ]
    ]
};
get(25012)-> #{
    'chapter_id' => 25,
    'index' => 12,
    'prev_stage_id' => 25011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010300,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3740
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             660
        ],
         [
            102019039,
             55
        ]
    ]
};
get(26001)-> #{
    'chapter_id' => 26,
    'index' => 1,
    'prev_stage_id' => 25012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010301,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(26002)-> #{
    'chapter_id' => 26,
    'index' => 2,
    'prev_stage_id' => 26001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010302,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(26003)-> #{
    'chapter_id' => 26,
    'index' => 3,
    'prev_stage_id' => 26002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010303,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(26004)-> #{
    'chapter_id' => 26,
    'index' => 4,
    'prev_stage_id' => 26003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010304,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(26005)-> #{
    'chapter_id' => 26,
    'index' => 5,
    'prev_stage_id' => 26004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010305,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(26006)-> #{
    'chapter_id' => 26,
    'index' => 6,
    'prev_stage_id' => 26005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010306,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(26007)-> #{
    'chapter_id' => 26,
    'index' => 7,
    'prev_stage_id' => 26006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010307,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(26008)-> #{
    'chapter_id' => 26,
    'index' => 8,
    'prev_stage_id' => 26007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010308,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(26009)-> #{
    'chapter_id' => 26,
    'index' => 9,
    'prev_stage_id' => 26008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010309,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(26010)-> #{
    'chapter_id' => 26,
    'index' => 10,
    'prev_stage_id' => 26009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010310,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(26011)-> #{
    'chapter_id' => 26,
    'index' => 11,
    'prev_stage_id' => 26010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010311,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(26012)-> #{
    'chapter_id' => 26,
    'index' => 12,
    'prev_stage_id' => 26011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010312,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3850
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(27001)-> #{
    'chapter_id' => 27,
    'index' => 1,
    'prev_stage_id' => 26012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010313,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             660
        ],
         [
            102019039,
             55
        ]
    ]
};
get(27002)-> #{
    'chapter_id' => 27,
    'index' => 2,
    'prev_stage_id' => 27001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010314,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             660
        ],
         [
            102019039,
             55
        ]
    ]
};
get(27003)-> #{
    'chapter_id' => 27,
    'index' => 3,
    'prev_stage_id' => 27002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010315,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019040,
             660
        ],
         [
            102019039,
             55
        ]
    ]
};
get(27004)-> #{
    'chapter_id' => 27,
    'index' => 4,
    'prev_stage_id' => 27003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010316,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             660
        ],
         [
            102019037,
             55
        ]
    ]
};
get(27005)-> #{
    'chapter_id' => 27,
    'index' => 5,
    'prev_stage_id' => 27004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010317,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             660
        ],
         [
            102019037,
             55
        ]
    ]
};
get(27006)-> #{
    'chapter_id' => 27,
    'index' => 6,
    'prev_stage_id' => 27005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010318,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019038,
             660
        ],
         [
            102019037,
             55
        ]
    ]
};
get(27007)-> #{
    'chapter_id' => 27,
    'index' => 7,
    'prev_stage_id' => 27006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010319,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             660
        ],
         [
            102019035,
             55
        ]
    ]
};
get(27008)-> #{
    'chapter_id' => 27,
    'index' => 8,
    'prev_stage_id' => 27007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010320,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             660
        ],
         [
            102019035,
             55
        ]
    ]
};
get(27009)-> #{
    'chapter_id' => 27,
    'index' => 9,
    'prev_stage_id' => 27008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010321,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019036,
             660
        ],
         [
            102019035,
             55
        ]
    ]
};
get(27010)-> #{
    'chapter_id' => 27,
    'index' => 10,
    'prev_stage_id' => 27009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010322,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             660
        ],
         [
            102019033,
             55
        ]
    ]
};
get(27011)-> #{
    'chapter_id' => 27,
    'index' => 11,
    'prev_stage_id' => 27010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010323,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             660
        ],
         [
            102019033,
             55
        ]
    ]
};
get(27012)-> #{
    'chapter_id' => 27,
    'index' => 12,
    'prev_stage_id' => 27011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010324,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             3960
        ],
         [
            102008001,
             1
        ],
         [
            102019034,
             660
        ],
         [
            102019033,
             55
        ]
    ]
};
get(28001)-> #{
    'chapter_id' => 28,
    'index' => 1,
    'prev_stage_id' => 27012,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010325,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(28002)-> #{
    'chapter_id' => 28,
    'index' => 2,
    'prev_stage_id' => 28001,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010326,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(28003)-> #{
    'chapter_id' => 28,
    'index' => 3,
    'prev_stage_id' => 28002,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010327,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019048,
             660
        ],
         [
            102019047,
             55
        ]
    ]
};
get(28004)-> #{
    'chapter_id' => 28,
    'index' => 4,
    'prev_stage_id' => 28003,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010328,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(28005)-> #{
    'chapter_id' => 28,
    'index' => 5,
    'prev_stage_id' => 28004,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010329,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(28006)-> #{
    'chapter_id' => 28,
    'index' => 6,
    'prev_stage_id' => 28005,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010330,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019046,
             660
        ],
         [
            102019045,
             55
        ]
    ]
};
get(28007)-> #{
    'chapter_id' => 28,
    'index' => 7,
    'prev_stage_id' => 28006,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010331,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(28008)-> #{
    'chapter_id' => 28,
    'index' => 8,
    'prev_stage_id' => 28007,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010332,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(28009)-> #{
    'chapter_id' => 28,
    'index' => 9,
    'prev_stage_id' => 28008,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010333,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019044,
             660
        ],
         [
            102019043,
             55
        ]
    ]
};
get(28010)-> #{
    'chapter_id' => 28,
    'index' => 10,
    'prev_stage_id' => 28009,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010334,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(28011)-> #{
    'chapter_id' => 28,
    'index' => 11,
    'prev_stage_id' => 28010,
    'is_boss' => 0,
    'max_hero' => 3,
    'robot_id' => 1010335,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};
get(28012)-> #{
    'chapter_id' => 28,
    'index' => 12,
    'prev_stage_id' => 28011,
    'is_boss' => 1,
    'max_hero' => 3,
    'robot_id' => 1010336,
    'first_reward' => [
        [
            101001002,
             20
        ]
    ],
    'pass_reward' => [
        [
            101001003,
             4070
        ],
         [
            102008001,
             1
        ],
         [
            102019042,
             660
        ],
         [
            102019041,
             55
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011,3012,4001,4002,4003,4004,4005,4006,4007,4008,4009,4010,4011,4012,5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,12001,12002,12003,12004,12005,12006,12007,12008,12009,12010,12011,12012,13001,13002,13003,13004,13005,13006,13007,13008,13009,13010,13011,13012,14001,14002,14003,14004,14005,14006,14007,14008,14009,14010,14011,14012,15001,15002,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,16001,16002,16003,16004,16005,16006,16007,16008,16009,16010,16011,16012,17001,17002,17003,17004,17005,17006,17007,17008,17009,17010,17011,17012,18001,18002,18003,18004,18005,18006,18007,18008,18009,18010,18011,18012,19001,19002,19003,19004,19005,19006,19007,19008,19009,19010,19011,19012,20001,20002,20003,20004,20005,20006,20007,20008,20009,20010,20011,20012,21001,21002,21003,21004,21005,21006,21007,21008,21009,21010,21011,21012,22001,22002,22003,22004,22005,22006,22007,22008,22009,22010,22011,22012,23001,23002,23003,23004,23005,23006,23007,23008,23009,23010,23011,23012,24001,24002,24003,24004,24005,24006,24007,24008,24009,24010,24011,24012,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,26001,26002,26003,26004,26005,26006,26007,26008,26009,26010,26011,26012,27001,27002,27003,27004,27005,27006,27007,27008,27009,27010,27011,27012,28001,28002,28003,28004,28005,28006,28007,28008,28009,28010,28011,28012].
