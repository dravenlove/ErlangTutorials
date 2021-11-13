%%--- coding:utf-8 ---
-module(tb_hero_corps_stage).
-export([get/1,get_list/0]).
get(1000)-> #{
    'type' => 1,
    'stage' => 0,
    'need_item' => [
        [
            102019001,
             150
        ],
         [
            102019003,
             150
        ],
         [
            101001003,
             10000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         5
    ],
    'reset_reward_items' => [
        [
            102019001,
             150
        ],
         [
            102019003,
             150
        ]
    ],
    'bubing_attack' => 0.0,
    'bubing_defence' => 0.0
};
get(1001)-> #{
    'type' => 1,
    'stage' => 1,
    'need_item' => [
        [
            102019001,
             170
        ],
         [
            102019003,
             170
        ],
         [
            101001003,
             15000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         6
    ],
    'reset_reward_items' => [
        [
            102019001,
             320
        ],
         [
            102019003,
             320
        ]
    ],
    'bubing_attack' => 2.3,
    'bubing_defence' => 1.4
};
get(1002)-> #{
    'type' => 1,
    'stage' => 2,
    'need_item' => [
        [
            102019001,
             190
        ],
         [
            102019003,
             190
        ],
         [
            101001003,
             20000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         7
    ],
    'reset_reward_items' => [
        [
            102019001,
             510
        ],
         [
            102019003,
             510
        ]
    ],
    'bubing_attack' => 4.6,
    'bubing_defence' => 2.8
};
get(1003)-> #{
    'type' => 1,
    'stage' => 3,
    'need_item' => [
        [
            102019001,
             210
        ],
         [
            102019003,
             210
        ],
         [
            101001003,
             25000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         8
    ],
    'reset_reward_items' => [
        [
            102019001,
             720
        ],
         [
            102019003,
             720
        ]
    ],
    'bubing_attack' => 6.9,
    'bubing_defence' => 4.2
};
get(1004)-> #{
    'type' => 1,
    'stage' => 4,
    'need_item' => [
        [
            102019001,
             230
        ],
         [
            102019003,
             230
        ],
         [
            101001003,
             30000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         9
    ],
    'reset_reward_items' => [
        [
            102019001,
             950
        ],
         [
            102019003,
             950
        ]
    ],
    'bubing_attack' => 9.2,
    'bubing_defence' => 5.6
};
get(1005)-> #{
    'type' => 1,
    'stage' => 5,
    'need_item' => [
        [
            102019001,
             250
        ],
         [
            102019003,
             250
        ],
         [
            101001003,
             35000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         10
    ],
    'reset_reward_items' => [
        [
            102019001,
             1200
        ],
         [
            102019003,
             1200
        ]
    ],
    'bubing_attack' => 11.5,
    'bubing_defence' => 7.0
};
get(1006)-> #{
    'type' => 1,
    'stage' => 6,
    'need_item' => [
        [
            102019001,
             270
        ],
         [
            102019003,
             270
        ],
         [
            101001003,
             40000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         11
    ],
    'reset_reward_items' => [
        [
            102019001,
             1470
        ],
         [
            102019003,
             1470
        ]
    ],
    'bubing_attack' => 13.8,
    'bubing_defence' => 8.4
};
get(1007)-> #{
    'type' => 1,
    'stage' => 7,
    'need_item' => [
        [
            102019001,
             290
        ],
         [
            102019003,
             290
        ],
         [
            101001003,
             45000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         12
    ],
    'reset_reward_items' => [
        [
            102019001,
             1760
        ],
         [
            102019003,
             1760
        ]
    ],
    'bubing_attack' => 16.1,
    'bubing_defence' => 9.8
};
get(1008)-> #{
    'type' => 1,
    'stage' => 8,
    'need_item' => [
        [
            102019001,
             310
        ],
         [
            102019003,
             310
        ],
         [
            101001003,
             50000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         13
    ],
    'reset_reward_items' => [
        [
            102019001,
             2070
        ],
         [
            102019003,
             2070
        ]
    ],
    'bubing_attack' => 18.4,
    'bubing_defence' => 11.2
};
get(1009)-> #{
    'type' => 1,
    'stage' => 9,
    'need_item' => [
        [
            102019001,
             330
        ],
         [
            102019003,
             330
        ],
         [
            101001003,
             55000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         14
    ],
    'reset_reward_items' => [
        [
            102019001,
             2400
        ],
         [
            102019003,
             2400
        ]
    ],
    'bubing_attack' => 20.7,
    'bubing_defence' => 12.6
};
get(1010)-> #{
    'type' => 1,
    'stage' => 10,
    'need_item' => [
        [
            102019001,
             225
        ],
         [
            102019003,
             225
        ],
         [
            101001003,
             60000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         15
    ],
    'reset_reward_items' => [
        [
            102019001,
             2625
        ],
         [
            102019003,
             2625
        ]
    ],
    'bubing_attack' => 23.0,
    'bubing_defence' => 14.0
};
get(1011)-> #{
    'type' => 1,
    'stage' => 11,
    'need_item' => [
        [
            102019002,
             255
        ],
         [
            102019004,
             255
        ],
         [
            101001003,
             65000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         16
    ],
    'reset_reward_items' => [
        [
            102019002,
             2880
        ],
         [
            102019004,
             2880
        ]
    ],
    'bubing_attack' => 26.1,
    'bubing_defence' => 15.9
};
get(1012)-> #{
    'type' => 1,
    'stage' => 12,
    'need_item' => [
        [
            102019002,
             285
        ],
         [
            102019004,
             285
        ],
         [
            101001003,
             70000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         17
    ],
    'reset_reward_items' => [
        [
            102019002,
             3165
        ],
         [
            102019004,
             3165
        ]
    ],
    'bubing_attack' => 29.2,
    'bubing_defence' => 17.8
};
get(1013)-> #{
    'type' => 1,
    'stage' => 13,
    'need_item' => [
        [
            102019002,
             315
        ],
         [
            102019004,
             315
        ],
         [
            101001003,
             75000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         18
    ],
    'reset_reward_items' => [
        [
            102019002,
             3480
        ],
         [
            102019004,
             3480
        ]
    ],
    'bubing_attack' => 32.3,
    'bubing_defence' => 19.7
};
get(1014)-> #{
    'type' => 1,
    'stage' => 14,
    'need_item' => [
        [
            102019002,
             345
        ],
         [
            102019004,
             345
        ],
         [
            101001003,
             80000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         19
    ],
    'reset_reward_items' => [
        [
            102019002,
             3825
        ],
         [
            102019004,
             3825
        ]
    ],
    'bubing_attack' => 35.4,
    'bubing_defence' => 21.6
};
get(1015)-> #{
    'type' => 1,
    'stage' => 15,
    'need_item' => [
        [
            102019002,
             375
        ],
         [
            102019004,
             375
        ],
         [
            101001003,
             85000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         20
    ],
    'reset_reward_items' => [
        [
            102019002,
             4200
        ],
         [
            102019004,
             4200
        ]
    ],
    'bubing_attack' => 38.5,
    'bubing_defence' => 23.5
};
get(1016)-> #{
    'type' => 1,
    'stage' => 16,
    'need_item' => [
        [
            102019002,
             405
        ],
         [
            102019004,
             405
        ],
         [
            101001003,
             90000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         21
    ],
    'reset_reward_items' => [
        [
            102019002,
             4605
        ],
         [
            102019004,
             4605
        ]
    ],
    'bubing_attack' => 41.6,
    'bubing_defence' => 25.4
};
get(1017)-> #{
    'type' => 1,
    'stage' => 17,
    'need_item' => [
        [
            102019002,
             435
        ],
         [
            102019004,
             435
        ],
         [
            101001003,
             95000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         22
    ],
    'reset_reward_items' => [
        [
            102019002,
             5040
        ],
         [
            102019004,
             5040
        ]
    ],
    'bubing_attack' => 44.7,
    'bubing_defence' => 27.3
};
get(1018)-> #{
    'type' => 1,
    'stage' => 18,
    'need_item' => [
        [
            102019002,
             465
        ],
         [
            102019004,
             465
        ],
         [
            101001003,
             100000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         23
    ],
    'reset_reward_items' => [
        [
            102019002,
             5505
        ],
         [
            102019004,
             5505
        ]
    ],
    'bubing_attack' => 47.8,
    'bubing_defence' => 29.2
};
get(1019)-> #{
    'type' => 1,
    'stage' => 19,
    'need_item' => [
        [
            102019002,
             495
        ],
         [
            102019004,
             495
        ],
         [
            101001003,
             105000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         24
    ],
    'reset_reward_items' => [
        [
            102019002,
             6000
        ],
         [
            102019004,
             6000
        ]
    ],
    'bubing_attack' => 50.9,
    'bubing_defence' => 31.1
};
get(1020)-> #{
    'type' => 1,
    'stage' => 20,
    'need_item' => [
        [
            102019002,
             390
        ],
         [
            102019004,
             390
        ],
         [
            101001003,
             110000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         25
    ],
    'reset_reward_items' => [
        [
            102019002,
             6390
        ],
         [
            102019004,
             6390
        ]
    ],
    'bubing_attack' => 54.0,
    'bubing_defence' => 33.0
};
get(1021)-> #{
    'type' => 1,
    'stage' => 21,
    'need_item' => [
        [
            102019017,
             440
        ],
         [
            102019019,
             440
        ],
         [
            101001003,
             115000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         26
    ],
    'reset_reward_items' => [
        [
            102019017,
             6830
        ],
         [
            102019019,
             6830
        ]
    ],
    'bubing_attack' => 58.1,
    'bubing_defence' => 35.5
};
get(1022)-> #{
    'type' => 1,
    'stage' => 22,
    'need_item' => [
        [
            102019017,
             490
        ],
         [
            102019019,
             490
        ],
         [
            101001003,
             120000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         27
    ],
    'reset_reward_items' => [
        [
            102019017,
             7320
        ],
         [
            102019019,
             7320
        ]
    ],
    'bubing_attack' => 62.2,
    'bubing_defence' => 38.0
};
get(1023)-> #{
    'type' => 1,
    'stage' => 23,
    'need_item' => [
        [
            102019017,
             540
        ],
         [
            102019019,
             540
        ],
         [
            101001003,
             125000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         28
    ],
    'reset_reward_items' => [
        [
            102019017,
             7860
        ],
         [
            102019019,
             7860
        ]
    ],
    'bubing_attack' => 66.3,
    'bubing_defence' => 40.5
};
get(1024)-> #{
    'type' => 1,
    'stage' => 24,
    'need_item' => [
        [
            102019017,
             590
        ],
         [
            102019019,
             590
        ],
         [
            101001003,
             130000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         29
    ],
    'reset_reward_items' => [
        [
            102019017,
             8450
        ],
         [
            102019019,
             8450
        ]
    ],
    'bubing_attack' => 70.4,
    'bubing_defence' => 43.0
};
get(1025)-> #{
    'type' => 1,
    'stage' => 25,
    'need_item' => [
        [
            102019017,
             640
        ],
         [
            102019019,
             640
        ],
         [
            101001003,
             135000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         30
    ],
    'reset_reward_items' => [
        [
            102019017,
             9090
        ],
         [
            102019019,
             9090
        ]
    ],
    'bubing_attack' => 74.5,
    'bubing_defence' => 45.5
};
get(1026)-> #{
    'type' => 1,
    'stage' => 26,
    'need_item' => [
        [
            102019017,
             690
        ],
         [
            102019019,
             690
        ],
         [
            101001003,
             140000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         31
    ],
    'reset_reward_items' => [
        [
            102019017,
             9780
        ],
         [
            102019019,
             9780
        ]
    ],
    'bubing_attack' => 78.6,
    'bubing_defence' => 48.0
};
get(1027)-> #{
    'type' => 1,
    'stage' => 27,
    'need_item' => [
        [
            102019017,
             740
        ],
         [
            102019019,
             740
        ],
         [
            101001003,
             145000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         32
    ],
    'reset_reward_items' => [
        [
            102019017,
             10520
        ],
         [
            102019019,
             10520
        ]
    ],
    'bubing_attack' => 82.7,
    'bubing_defence' => 50.5
};
get(1028)-> #{
    'type' => 1,
    'stage' => 28,
    'need_item' => [
        [
            102019017,
             790
        ],
         [
            102019019,
             790
        ],
         [
            101001003,
             150000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         33
    ],
    'reset_reward_items' => [
        [
            102019017,
             11310
        ],
         [
            102019019,
             11310
        ]
    ],
    'bubing_attack' => 86.8,
    'bubing_defence' => 53.0
};
get(1029)-> #{
    'type' => 1,
    'stage' => 29,
    'need_item' => [
        [
            102019017,
             840
        ],
         [
            102019019,
             840
        ],
         [
            101001003,
             155000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         34
    ],
    'reset_reward_items' => [
        [
            102019017,
             12150
        ],
         [
            102019019,
             12150
        ]
    ],
    'bubing_attack' => 90.9,
    'bubing_defence' => 55.5
};
get(1030)-> #{
    'type' => 1,
    'stage' => 30,
    'need_item' => [
        [
            102019017,
             480
        ],
         [
            102019019,
             480
        ],
         [
            101001003,
             160000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         35
    ],
    'reset_reward_items' => [
        [
            102019017,
             12630
        ],
         [
            102019019,
             12630
        ]
    ],
    'bubing_attack' => 95.0,
    'bubing_defence' => 58.0
};
get(1031)-> #{
    'type' => 1,
    'stage' => 31,
    'need_item' => [
        [
            102019018,
             545
        ],
         [
            102019020,
             545
        ],
         [
            101001003,
             165000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         36
    ],
    'reset_reward_items' => [
        [
            102019018,
             13175
        ],
         [
            102019020,
             13175
        ]
    ],
    'bubing_attack' => 100.7,
    'bubing_defence' => 61.5
};
get(1032)-> #{
    'type' => 1,
    'stage' => 32,
    'need_item' => [
        [
            102019018,
             610
        ],
         [
            102019020,
             610
        ],
         [
            101001003,
             170000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         37
    ],
    'reset_reward_items' => [
        [
            102019018,
             13785
        ],
         [
            102019020,
             13785
        ]
    ],
    'bubing_attack' => 106.4,
    'bubing_defence' => 65.0
};
get(1033)-> #{
    'type' => 1,
    'stage' => 33,
    'need_item' => [
        [
            102019018,
             675
        ],
         [
            102019020,
             675
        ],
         [
            101001003,
             175000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         38
    ],
    'reset_reward_items' => [
        [
            102019018,
             14460
        ],
         [
            102019020,
             14460
        ]
    ],
    'bubing_attack' => 112.1,
    'bubing_defence' => 68.5
};
get(1034)-> #{
    'type' => 1,
    'stage' => 34,
    'need_item' => [
        [
            102019018,
             740
        ],
         [
            102019020,
             740
        ],
         [
            101001003,
             180000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         39
    ],
    'reset_reward_items' => [
        [
            102019018,
             15200
        ],
         [
            102019020,
             15200
        ]
    ],
    'bubing_attack' => 117.8,
    'bubing_defence' => 72.0
};
get(1035)-> #{
    'type' => 1,
    'stage' => 35,
    'need_item' => [
        [
            102019018,
             805
        ],
         [
            102019020,
             805
        ],
         [
            101001003,
             185000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         40
    ],
    'reset_reward_items' => [
        [
            102019018,
             16005
        ],
         [
            102019020,
             16005
        ]
    ],
    'bubing_attack' => 123.5,
    'bubing_defence' => 75.5
};
get(1036)-> #{
    'type' => 1,
    'stage' => 36,
    'need_item' => [
        [
            102019018,
             870
        ],
         [
            102019020,
             870
        ],
         [
            101001003,
             190000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         41
    ],
    'reset_reward_items' => [
        [
            102019018,
             16875
        ],
         [
            102019020,
             16875
        ]
    ],
    'bubing_attack' => 129.2,
    'bubing_defence' => 79.0
};
get(1037)-> #{
    'type' => 1,
    'stage' => 37,
    'need_item' => [
        [
            102019018,
             935
        ],
         [
            102019020,
             935
        ],
         [
            101001003,
             195000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         42
    ],
    'reset_reward_items' => [
        [
            102019018,
             17810
        ],
         [
            102019020,
             17810
        ]
    ],
    'bubing_attack' => 134.9,
    'bubing_defence' => 82.5
};
get(1038)-> #{
    'type' => 1,
    'stage' => 38,
    'need_item' => [
        [
            102019018,
             1000
        ],
         [
            102019020,
             1000
        ],
         [
            101001003,
             200000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         43
    ],
    'reset_reward_items' => [
        [
            102019018,
             18810
        ],
         [
            102019020,
             18810
        ]
    ],
    'bubing_attack' => 140.6,
    'bubing_defence' => 86.0
};
get(1039)-> #{
    'type' => 1,
    'stage' => 39,
    'need_item' => [
        [
            102019018,
             1065
        ],
         [
            102019020,
             1065
        ],
         [
            101001003,
             205000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         44
    ],
    'reset_reward_items' => [
        [
            102019018,
             19875
        ],
         [
            102019020,
             19875
        ]
    ],
    'bubing_attack' => 146.3,
    'bubing_defence' => 89.5
};
get(1040)-> #{
    'type' => 1,
    'stage' => 40,
    'need_item' => [
        [
            102019018,
             800
        ],
         [
            102019020,
             800
        ],
         [
            101001003,
             210000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         45
    ],
    'reset_reward_items' => [
        [
            102019018,
             20675
        ],
         [
            102019020,
             20675
        ]
    ],
    'bubing_attack' => 152.0,
    'bubing_defence' => 93.0
};
get(1041)-> #{
    'type' => 1,
    'stage' => 41,
    'need_item' => [
        [
            102019033,
             910
        ],
         [
            102019035,
             910
        ],
         [
            101001003,
             215000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         46
    ],
    'reset_reward_items' => [
        [
            102019033,
             21585
        ],
         [
            102019035,
             21585
        ]
    ],
    'bubing_attack' => 160.0,
    'bubing_defence' => 97.9
};
get(1042)-> #{
    'type' => 1,
    'stage' => 42,
    'need_item' => [
        [
            102019033,
             1020
        ],
         [
            102019035,
             1020
        ],
         [
            101001003,
             220000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         47
    ],
    'reset_reward_items' => [
        [
            102019033,
             22605
        ],
         [
            102019035,
             22605
        ]
    ],
    'bubing_attack' => 168.0,
    'bubing_defence' => 102.8
};
get(1043)-> #{
    'type' => 1,
    'stage' => 43,
    'need_item' => [
        [
            102019033,
             1130
        ],
         [
            102019035,
             1130
        ],
         [
            101001003,
             225000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         48
    ],
    'reset_reward_items' => [
        [
            102019033,
             23735
        ],
         [
            102019035,
             23735
        ]
    ],
    'bubing_attack' => 176.0,
    'bubing_defence' => 107.7
};
get(1044)-> #{
    'type' => 1,
    'stage' => 44,
    'need_item' => [
        [
            102019033,
             1240
        ],
         [
            102019035,
             1240
        ],
         [
            101001003,
             230000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         49
    ],
    'reset_reward_items' => [
        [
            102019033,
             24975
        ],
         [
            102019035,
             24975
        ]
    ],
    'bubing_attack' => 184.0,
    'bubing_defence' => 112.6
};
get(1045)-> #{
    'type' => 1,
    'stage' => 45,
    'need_item' => [
        [
            102019033,
             1350
        ],
         [
            102019035,
             1350
        ],
         [
            101001003,
             235000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         50
    ],
    'reset_reward_items' => [
        [
            102019033,
             26325
        ],
         [
            102019035,
             26325
        ]
    ],
    'bubing_attack' => 192.0,
    'bubing_defence' => 117.5
};
get(1046)-> #{
    'type' => 1,
    'stage' => 46,
    'need_item' => [
        [
            102019033,
             1460
        ],
         [
            102019035,
             1460
        ],
         [
            101001003,
             240000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         51
    ],
    'reset_reward_items' => [
        [
            102019033,
             27785
        ],
         [
            102019035,
             27785
        ]
    ],
    'bubing_attack' => 200.0,
    'bubing_defence' => 122.4
};
get(1047)-> #{
    'type' => 1,
    'stage' => 47,
    'need_item' => [
        [
            102019033,
             1570
        ],
         [
            102019035,
             1570
        ],
         [
            101001003,
             245000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         52
    ],
    'reset_reward_items' => [
        [
            102019033,
             29355
        ],
         [
            102019035,
             29355
        ]
    ],
    'bubing_attack' => 208.0,
    'bubing_defence' => 127.3
};
get(1048)-> #{
    'type' => 1,
    'stage' => 48,
    'need_item' => [
        [
            102019033,
             1680
        ],
         [
            102019035,
             1680
        ],
         [
            101001003,
             250000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         53
    ],
    'reset_reward_items' => [
        [
            102019033,
             31035
        ],
         [
            102019035,
             31035
        ]
    ],
    'bubing_attack' => 216.0,
    'bubing_defence' => 132.2
};
get(1049)-> #{
    'type' => 1,
    'stage' => 49,
    'need_item' => [
        [
            102019033,
             1790
        ],
         [
            102019035,
             1790
        ],
         [
            101001003,
             255000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         54
    ],
    'reset_reward_items' => [
        [
            102019033,
             32825
        ],
         [
            102019035,
             32825
        ]
    ],
    'bubing_attack' => 224.0,
    'bubing_defence' => 137.1
};
get(1050)-> #{
    'type' => 1,
    'stage' => 50,
    'need_item' => [
        [
            102019033,
             1620
        ],
         [
            102019035,
             1620
        ],
         [
            101001003,
             260000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         55
    ],
    'reset_reward_items' => [
        [
            102019033,
             34445
        ],
         [
            102019035,
             34445
        ]
    ],
    'bubing_attack' => 232.0,
    'bubing_defence' => 142.0
};
get(1051)-> #{
    'type' => 1,
    'stage' => 51,
    'need_item' => [
        [
            102019034,
             1660
        ],
         [
            102019036,
             1660
        ],
         [
            101001003,
             265000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         56
    ],
    'reset_reward_items' => [
        [
            102019034,
             36105
        ],
         [
            102019036,
             36105
        ]
    ],
    'bubing_attack' => 244.0,
    'bubing_defence' => 149.4
};
get(1052)-> #{
    'type' => 1,
    'stage' => 52,
    'need_item' => [
        [
            102019034,
             1700
        ],
         [
            102019036,
             1700
        ],
         [
            101001003,
             270000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         57
    ],
    'reset_reward_items' => [
        [
            102019034,
             37805
        ],
         [
            102019036,
             37805
        ]
    ],
    'bubing_attack' => 256.0,
    'bubing_defence' => 156.8
};
get(1053)-> #{
    'type' => 1,
    'stage' => 53,
    'need_item' => [
        [
            102019034,
             1740
        ],
         [
            102019036,
             1740
        ],
         [
            101001003,
             275000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         58
    ],
    'reset_reward_items' => [
        [
            102019034,
             39545
        ],
         [
            102019036,
             39545
        ]
    ],
    'bubing_attack' => 268.0,
    'bubing_defence' => 164.2
};
get(1054)-> #{
    'type' => 1,
    'stage' => 54,
    'need_item' => [
        [
            102019034,
             1780
        ],
         [
            102019036,
             1780
        ],
         [
            101001003,
             280000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         59
    ],
    'reset_reward_items' => [
        [
            102019034,
             41325
        ],
         [
            102019036,
             41325
        ]
    ],
    'bubing_attack' => 280.0,
    'bubing_defence' => 171.6
};
get(1055)-> #{
    'type' => 1,
    'stage' => 55,
    'need_item' => [
        [
            102019034,
             1820
        ],
         [
            102019036,
             1820
        ],
         [
            101001003,
             285000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         60
    ],
    'reset_reward_items' => [
        [
            102019034,
             43145
        ],
         [
            102019036,
             43145
        ]
    ],
    'bubing_attack' => 292.0,
    'bubing_defence' => 179.0
};
get(1056)-> #{
    'type' => 1,
    'stage' => 56,
    'need_item' => [
        [
            102019034,
             1860
        ],
         [
            102019036,
             1860
        ],
         [
            101001003,
             290000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         61
    ],
    'reset_reward_items' => [
        [
            102019034,
             45005
        ],
         [
            102019036,
             45005
        ]
    ],
    'bubing_attack' => 304.0,
    'bubing_defence' => 186.4
};
get(1057)-> #{
    'type' => 1,
    'stage' => 57,
    'need_item' => [
        [
            102019034,
             1900
        ],
         [
            102019036,
             1900
        ],
         [
            101001003,
             295000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         62
    ],
    'reset_reward_items' => [
        [
            102019034,
             46905
        ],
         [
            102019036,
             46905
        ]
    ],
    'bubing_attack' => 316.0,
    'bubing_defence' => 193.8
};
get(1058)-> #{
    'type' => 1,
    'stage' => 58,
    'need_item' => [
        [
            102019034,
             1940
        ],
         [
            102019036,
             1940
        ],
         [
            101001003,
             300000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         63
    ],
    'reset_reward_items' => [
        [
            102019034,
             48845
        ],
         [
            102019036,
             48845
        ]
    ],
    'bubing_attack' => 328.0,
    'bubing_defence' => 201.2
};
get(1059)-> #{
    'type' => 1,
    'stage' => 59,
    'need_item' => [
        [
            102019034,
             1980
        ],
         [
            102019036,
             1980
        ],
         [
            101001003,
             305000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         64
    ],
    'reset_reward_items' => [
        [
            102019034,
             50825
        ],
         [
            102019036,
             50825
        ]
    ],
    'bubing_attack' => 340.0,
    'bubing_defence' => 208.6
};
get(1060)-> #{
    'type' => 1,
    'stage' => 60,
    'need_item' => [
        [
            102019034,
             0
        ],
         [
            102019036,
             0
        ],
         [
            101001003,
             310000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         65
    ],
    'reset_reward_items' => [
        [
            102019034,
             50825
        ],
         [
            102019036,
             50825
        ]
    ],
    'bubing_attack' => 352.0,
    'bubing_defence' => 216.0
};
get(2000)-> #{
    'type' => 2,
    'stage' => 0,
    'need_item' => [
        [
            102019005,
             150
        ],
         [
            102019007,
             150
        ],
         [
            101001003,
             10000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         5
    ],
    'reset_reward_items' => [
        [
            102019005,
             50975
        ],
         [
            102019007,
             50975
        ]
    ],
    'qibing_attack' => 0.0,
    'qibing_defence' => 0.0
};
get(2001)-> #{
    'type' => 2,
    'stage' => 1,
    'need_item' => [
        [
            102019005,
             170
        ],
         [
            102019007,
             170
        ],
         [
            101001003,
             15000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         6
    ],
    'reset_reward_items' => [
        [
            102019005,
             51145
        ],
         [
            102019007,
             51145
        ]
    ],
    'qibing_attack' => 2.5,
    'qibing_defence' => 1.2
};
get(2002)-> #{
    'type' => 2,
    'stage' => 2,
    'need_item' => [
        [
            102019005,
             190
        ],
         [
            102019007,
             190
        ],
         [
            101001003,
             20000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         7
    ],
    'reset_reward_items' => [
        [
            102019005,
             51335
        ],
         [
            102019007,
             51335
        ]
    ],
    'qibing_attack' => 5.0,
    'qibing_defence' => 2.4
};
get(2003)-> #{
    'type' => 2,
    'stage' => 3,
    'need_item' => [
        [
            102019005,
             210
        ],
         [
            102019007,
             210
        ],
         [
            101001003,
             25000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         8
    ],
    'reset_reward_items' => [
        [
            102019005,
             51545
        ],
         [
            102019007,
             51545
        ]
    ],
    'qibing_attack' => 7.5,
    'qibing_defence' => 3.6
};
get(2004)-> #{
    'type' => 2,
    'stage' => 4,
    'need_item' => [
        [
            102019005,
             230
        ],
         [
            102019007,
             230
        ],
         [
            101001003,
             30000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         9
    ],
    'reset_reward_items' => [
        [
            102019005,
             51775
        ],
         [
            102019007,
             51775
        ]
    ],
    'qibing_attack' => 10.0,
    'qibing_defence' => 4.8
};
get(2005)-> #{
    'type' => 2,
    'stage' => 5,
    'need_item' => [
        [
            102019005,
             250
        ],
         [
            102019007,
             250
        ],
         [
            101001003,
             35000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         10
    ],
    'reset_reward_items' => [
        [
            102019005,
             52025
        ],
         [
            102019007,
             52025
        ]
    ],
    'qibing_attack' => 12.5,
    'qibing_defence' => 6.0
};
get(2006)-> #{
    'type' => 2,
    'stage' => 6,
    'need_item' => [
        [
            102019005,
             270
        ],
         [
            102019007,
             270
        ],
         [
            101001003,
             40000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         11
    ],
    'reset_reward_items' => [
        [
            102019005,
             52295
        ],
         [
            102019007,
             52295
        ]
    ],
    'qibing_attack' => 15.0,
    'qibing_defence' => 7.2
};
get(2007)-> #{
    'type' => 2,
    'stage' => 7,
    'need_item' => [
        [
            102019005,
             290
        ],
         [
            102019007,
             290
        ],
         [
            101001003,
             45000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         12
    ],
    'reset_reward_items' => [
        [
            102019005,
             52585
        ],
         [
            102019007,
             52585
        ]
    ],
    'qibing_attack' => 17.5,
    'qibing_defence' => 8.4
};
get(2008)-> #{
    'type' => 2,
    'stage' => 8,
    'need_item' => [
        [
            102019005,
             310
        ],
         [
            102019007,
             310
        ],
         [
            101001003,
             50000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         13
    ],
    'reset_reward_items' => [
        [
            102019005,
             52895
        ],
         [
            102019007,
             52895
        ]
    ],
    'qibing_attack' => 20.0,
    'qibing_defence' => 9.6
};
get(2009)-> #{
    'type' => 2,
    'stage' => 9,
    'need_item' => [
        [
            102019005,
             330
        ],
         [
            102019007,
             330
        ],
         [
            101001003,
             55000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         14
    ],
    'reset_reward_items' => [
        [
            102019005,
             53225
        ],
         [
            102019007,
             53225
        ]
    ],
    'qibing_attack' => 22.5,
    'qibing_defence' => 10.8
};
get(2010)-> #{
    'type' => 2,
    'stage' => 10,
    'need_item' => [
        [
            102019005,
             225
        ],
         [
            102019007,
             225
        ],
         [
            101001003,
             60000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         15
    ],
    'reset_reward_items' => [
        [
            102019005,
             53450
        ],
         [
            102019007,
             53450
        ]
    ],
    'qibing_attack' => 25.0,
    'qibing_defence' => 12.0
};
get(2011)-> #{
    'type' => 2,
    'stage' => 11,
    'need_item' => [
        [
            102019006,
             255
        ],
         [
            102019008,
             255
        ],
         [
            101001003,
             65000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         16
    ],
    'reset_reward_items' => [
        [
            102019006,
             53705
        ],
         [
            102019008,
             53705
        ]
    ],
    'qibing_attack' => 28.3,
    'qibing_defence' => 13.6
};
get(2012)-> #{
    'type' => 2,
    'stage' => 12,
    'need_item' => [
        [
            102019006,
             285
        ],
         [
            102019008,
             285
        ],
         [
            101001003,
             70000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         17
    ],
    'reset_reward_items' => [
        [
            102019006,
             53990
        ],
         [
            102019008,
             53990
        ]
    ],
    'qibing_attack' => 31.6,
    'qibing_defence' => 15.2
};
get(2013)-> #{
    'type' => 2,
    'stage' => 13,
    'need_item' => [
        [
            102019006,
             315
        ],
         [
            102019008,
             315
        ],
         [
            101001003,
             75000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         18
    ],
    'reset_reward_items' => [
        [
            102019006,
             54305
        ],
         [
            102019008,
             54305
        ]
    ],
    'qibing_attack' => 34.9,
    'qibing_defence' => 16.8
};
get(2014)-> #{
    'type' => 2,
    'stage' => 14,
    'need_item' => [
        [
            102019006,
             345
        ],
         [
            102019008,
             345
        ],
         [
            101001003,
             80000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         19
    ],
    'reset_reward_items' => [
        [
            102019006,
             54650
        ],
         [
            102019008,
             54650
        ]
    ],
    'qibing_attack' => 38.2,
    'qibing_defence' => 18.4
};
get(2015)-> #{
    'type' => 2,
    'stage' => 15,
    'need_item' => [
        [
            102019006,
             375
        ],
         [
            102019008,
             375
        ],
         [
            101001003,
             85000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         20
    ],
    'reset_reward_items' => [
        [
            102019006,
             55025
        ],
         [
            102019008,
             55025
        ]
    ],
    'qibing_attack' => 41.5,
    'qibing_defence' => 20.0
};
get(2016)-> #{
    'type' => 2,
    'stage' => 16,
    'need_item' => [
        [
            102019006,
             405
        ],
         [
            102019008,
             405
        ],
         [
            101001003,
             90000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         21
    ],
    'reset_reward_items' => [
        [
            102019006,
             55430
        ],
         [
            102019008,
             55430
        ]
    ],
    'qibing_attack' => 44.8,
    'qibing_defence' => 21.6
};
get(2017)-> #{
    'type' => 2,
    'stage' => 17,
    'need_item' => [
        [
            102019006,
             435
        ],
         [
            102019008,
             435
        ],
         [
            101001003,
             95000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         22
    ],
    'reset_reward_items' => [
        [
            102019006,
             55865
        ],
         [
            102019008,
             55865
        ]
    ],
    'qibing_attack' => 48.1,
    'qibing_defence' => 23.2
};
get(2018)-> #{
    'type' => 2,
    'stage' => 18,
    'need_item' => [
        [
            102019006,
             465
        ],
         [
            102019008,
             465
        ],
         [
            101001003,
             100000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         23
    ],
    'reset_reward_items' => [
        [
            102019006,
             56330
        ],
         [
            102019008,
             56330
        ]
    ],
    'qibing_attack' => 51.4,
    'qibing_defence' => 24.8
};
get(2019)-> #{
    'type' => 2,
    'stage' => 19,
    'need_item' => [
        [
            102019006,
             495
        ],
         [
            102019008,
             495
        ],
         [
            101001003,
             105000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         24
    ],
    'reset_reward_items' => [
        [
            102019006,
             56825
        ],
         [
            102019008,
             56825
        ]
    ],
    'qibing_attack' => 54.7,
    'qibing_defence' => 26.4
};
get(2020)-> #{
    'type' => 2,
    'stage' => 20,
    'need_item' => [
        [
            102019006,
             390
        ],
         [
            102019008,
             390
        ],
         [
            101001003,
             110000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         25
    ],
    'reset_reward_items' => [
        [
            102019006,
             57215
        ],
         [
            102019008,
             57215
        ]
    ],
    'qibing_attack' => 58.0,
    'qibing_defence' => 28.0
};
get(2021)-> #{
    'type' => 2,
    'stage' => 21,
    'need_item' => [
        [
            102019021,
             440
        ],
         [
            102019023,
             440
        ],
         [
            101001003,
             115000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         26
    ],
    'reset_reward_items' => [
        [
            102019021,
             57655
        ],
         [
            102019023,
             57655
        ]
    ],
    'qibing_attack' => 62.4,
    'qibing_defence' => 30.1
};
get(2022)-> #{
    'type' => 2,
    'stage' => 22,
    'need_item' => [
        [
            102019021,
             490
        ],
         [
            102019023,
             490
        ],
         [
            101001003,
             120000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         27
    ],
    'reset_reward_items' => [
        [
            102019021,
             58145
        ],
         [
            102019023,
             58145
        ]
    ],
    'qibing_attack' => 66.8,
    'qibing_defence' => 32.2
};
get(2023)-> #{
    'type' => 2,
    'stage' => 23,
    'need_item' => [
        [
            102019021,
             540
        ],
         [
            102019023,
             540
        ],
         [
            101001003,
             125000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         28
    ],
    'reset_reward_items' => [
        [
            102019021,
             58685
        ],
         [
            102019023,
             58685
        ]
    ],
    'qibing_attack' => 71.2,
    'qibing_defence' => 34.3
};
get(2024)-> #{
    'type' => 2,
    'stage' => 24,
    'need_item' => [
        [
            102019021,
             590
        ],
         [
            102019023,
             590
        ],
         [
            101001003,
             130000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         29
    ],
    'reset_reward_items' => [
        [
            102019021,
             59275
        ],
         [
            102019023,
             59275
        ]
    ],
    'qibing_attack' => 75.6,
    'qibing_defence' => 36.4
};
get(2025)-> #{
    'type' => 2,
    'stage' => 25,
    'need_item' => [
        [
            102019021,
             640
        ],
         [
            102019023,
             640
        ],
         [
            101001003,
             135000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         30
    ],
    'reset_reward_items' => [
        [
            102019021,
             59915
        ],
         [
            102019023,
             59915
        ]
    ],
    'qibing_attack' => 80.0,
    'qibing_defence' => 38.5
};
get(2026)-> #{
    'type' => 2,
    'stage' => 26,
    'need_item' => [
        [
            102019021,
             690
        ],
         [
            102019023,
             690
        ],
         [
            101001003,
             140000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         31
    ],
    'reset_reward_items' => [
        [
            102019021,
             60605
        ],
         [
            102019023,
             60605
        ]
    ],
    'qibing_attack' => 84.4,
    'qibing_defence' => 40.6
};
get(2027)-> #{
    'type' => 2,
    'stage' => 27,
    'need_item' => [
        [
            102019021,
             740
        ],
         [
            102019023,
             740
        ],
         [
            101001003,
             145000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         32
    ],
    'reset_reward_items' => [
        [
            102019021,
             61345
        ],
         [
            102019023,
             61345
        ]
    ],
    'qibing_attack' => 88.8,
    'qibing_defence' => 42.7
};
get(2028)-> #{
    'type' => 2,
    'stage' => 28,
    'need_item' => [
        [
            102019021,
             790
        ],
         [
            102019023,
             790
        ],
         [
            101001003,
             150000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         33
    ],
    'reset_reward_items' => [
        [
            102019021,
             62135
        ],
         [
            102019023,
             62135
        ]
    ],
    'qibing_attack' => 93.2,
    'qibing_defence' => 44.8
};
get(2029)-> #{
    'type' => 2,
    'stage' => 29,
    'need_item' => [
        [
            102019021,
             840
        ],
         [
            102019023,
             840
        ],
         [
            101001003,
             155000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         34
    ],
    'reset_reward_items' => [
        [
            102019021,
             62975
        ],
         [
            102019023,
             62975
        ]
    ],
    'qibing_attack' => 97.6,
    'qibing_defence' => 46.9
};
get(2030)-> #{
    'type' => 2,
    'stage' => 30,
    'need_item' => [
        [
            102019021,
             480
        ],
         [
            102019023,
             480
        ],
         [
            101001003,
             160000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         35
    ],
    'reset_reward_items' => [
        [
            102019021,
             63455
        ],
         [
            102019023,
             63455
        ]
    ],
    'qibing_attack' => 102.0,
    'qibing_defence' => 49.0
};
get(2031)-> #{
    'type' => 2,
    'stage' => 31,
    'need_item' => [
        [
            102019022,
             545
        ],
         [
            102019024,
             545
        ],
         [
            101001003,
             165000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         36
    ],
    'reset_reward_items' => [
        [
            102019022,
             64000
        ],
         [
            102019024,
             64000
        ]
    ],
    'qibing_attack' => 108.2,
    'qibing_defence' => 51.9
};
get(2032)-> #{
    'type' => 2,
    'stage' => 32,
    'need_item' => [
        [
            102019022,
             610
        ],
         [
            102019024,
             610
        ],
         [
            101001003,
             170000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         37
    ],
    'reset_reward_items' => [
        [
            102019022,
             64610
        ],
         [
            102019024,
             64610
        ]
    ],
    'qibing_attack' => 114.4,
    'qibing_defence' => 54.8
};
get(2033)-> #{
    'type' => 2,
    'stage' => 33,
    'need_item' => [
        [
            102019022,
             675
        ],
         [
            102019024,
             675
        ],
         [
            101001003,
             175000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         38
    ],
    'reset_reward_items' => [
        [
            102019022,
             65285
        ],
         [
            102019024,
             65285
        ]
    ],
    'qibing_attack' => 120.6,
    'qibing_defence' => 57.7
};
get(2034)-> #{
    'type' => 2,
    'stage' => 34,
    'need_item' => [
        [
            102019022,
             740
        ],
         [
            102019024,
             740
        ],
         [
            101001003,
             180000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         39
    ],
    'reset_reward_items' => [
        [
            102019022,
             66025
        ],
         [
            102019024,
             66025
        ]
    ],
    'qibing_attack' => 126.8,
    'qibing_defence' => 60.6
};
get(2035)-> #{
    'type' => 2,
    'stage' => 35,
    'need_item' => [
        [
            102019022,
             805
        ],
         [
            102019024,
             805
        ],
         [
            101001003,
             185000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         40
    ],
    'reset_reward_items' => [
        [
            102019022,
             66830
        ],
         [
            102019024,
             66830
        ]
    ],
    'qibing_attack' => 133.0,
    'qibing_defence' => 63.5
};
get(2036)-> #{
    'type' => 2,
    'stage' => 36,
    'need_item' => [
        [
            102019022,
             870
        ],
         [
            102019024,
             870
        ],
         [
            101001003,
             190000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         41
    ],
    'reset_reward_items' => [
        [
            102019022,
             67700
        ],
         [
            102019024,
             67700
        ]
    ],
    'qibing_attack' => 139.2,
    'qibing_defence' => 66.4
};
get(2037)-> #{
    'type' => 2,
    'stage' => 37,
    'need_item' => [
        [
            102019022,
             935
        ],
         [
            102019024,
             935
        ],
         [
            101001003,
             195000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         42
    ],
    'reset_reward_items' => [
        [
            102019022,
             68635
        ],
         [
            102019024,
             68635
        ]
    ],
    'qibing_attack' => 145.4,
    'qibing_defence' => 69.3
};
get(2038)-> #{
    'type' => 2,
    'stage' => 38,
    'need_item' => [
        [
            102019022,
             1000
        ],
         [
            102019024,
             1000
        ],
         [
            101001003,
             200000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         43
    ],
    'reset_reward_items' => [
        [
            102019022,
             69635
        ],
         [
            102019024,
             69635
        ]
    ],
    'qibing_attack' => 151.6,
    'qibing_defence' => 72.2
};
get(2039)-> #{
    'type' => 2,
    'stage' => 39,
    'need_item' => [
        [
            102019022,
             1065
        ],
         [
            102019024,
             1065
        ],
         [
            101001003,
             205000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         44
    ],
    'reset_reward_items' => [
        [
            102019022,
             70700
        ],
         [
            102019024,
             70700
        ]
    ],
    'qibing_attack' => 157.8,
    'qibing_defence' => 75.1
};
get(2040)-> #{
    'type' => 2,
    'stage' => 40,
    'need_item' => [
        [
            102019022,
             800
        ],
         [
            102019024,
             800
        ],
         [
            101001003,
             210000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         45
    ],
    'reset_reward_items' => [
        [
            102019022,
             71500
        ],
         [
            102019024,
             71500
        ]
    ],
    'qibing_attack' => 164.0,
    'qibing_defence' => 78.0
};
get(2041)-> #{
    'type' => 2,
    'stage' => 41,
    'need_item' => [
        [
            102019037,
             910
        ],
         [
            102019039,
             910
        ],
         [
            101001003,
             215000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         46
    ],
    'reset_reward_items' => [
        [
            102019037,
             72410
        ],
         [
            102019039,
             72410
        ]
    ],
    'qibing_attack' => 172.7,
    'qibing_defence' => 82.1
};
get(2042)-> #{
    'type' => 2,
    'stage' => 42,
    'need_item' => [
        [
            102019037,
             1020
        ],
         [
            102019039,
             1020
        ],
         [
            101001003,
             220000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         47
    ],
    'reset_reward_items' => [
        [
            102019037,
             73430
        ],
         [
            102019039,
             73430
        ]
    ],
    'qibing_attack' => 181.4,
    'qibing_defence' => 86.2
};
get(2043)-> #{
    'type' => 2,
    'stage' => 43,
    'need_item' => [
        [
            102019037,
             1130
        ],
         [
            102019039,
             1130
        ],
         [
            101001003,
             225000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         48
    ],
    'reset_reward_items' => [
        [
            102019037,
             74560
        ],
         [
            102019039,
             74560
        ]
    ],
    'qibing_attack' => 190.1,
    'qibing_defence' => 90.3
};
get(2044)-> #{
    'type' => 2,
    'stage' => 44,
    'need_item' => [
        [
            102019037,
             1240
        ],
         [
            102019039,
             1240
        ],
         [
            101001003,
             230000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         49
    ],
    'reset_reward_items' => [
        [
            102019037,
             75800
        ],
         [
            102019039,
             75800
        ]
    ],
    'qibing_attack' => 198.8,
    'qibing_defence' => 94.4
};
get(2045)-> #{
    'type' => 2,
    'stage' => 45,
    'need_item' => [
        [
            102019037,
             1350
        ],
         [
            102019039,
             1350
        ],
         [
            101001003,
             235000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         50
    ],
    'reset_reward_items' => [
        [
            102019037,
             77150
        ],
         [
            102019039,
             77150
        ]
    ],
    'qibing_attack' => 207.5,
    'qibing_defence' => 98.5
};
get(2046)-> #{
    'type' => 2,
    'stage' => 46,
    'need_item' => [
        [
            102019037,
             1460
        ],
         [
            102019039,
             1460
        ],
         [
            101001003,
             240000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         51
    ],
    'reset_reward_items' => [
        [
            102019037,
             78610
        ],
         [
            102019039,
             78610
        ]
    ],
    'qibing_attack' => 216.2,
    'qibing_defence' => 102.6
};
get(2047)-> #{
    'type' => 2,
    'stage' => 47,
    'need_item' => [
        [
            102019037,
             1570
        ],
         [
            102019039,
             1570
        ],
         [
            101001003,
             245000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         52
    ],
    'reset_reward_items' => [
        [
            102019037,
             80180
        ],
         [
            102019039,
             80180
        ]
    ],
    'qibing_attack' => 224.9,
    'qibing_defence' => 106.7
};
get(2048)-> #{
    'type' => 2,
    'stage' => 48,
    'need_item' => [
        [
            102019037,
             1680
        ],
         [
            102019039,
             1680
        ],
         [
            101001003,
             250000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         53
    ],
    'reset_reward_items' => [
        [
            102019037,
             81860
        ],
         [
            102019039,
             81860
        ]
    ],
    'qibing_attack' => 233.6,
    'qibing_defence' => 110.8
};
get(2049)-> #{
    'type' => 2,
    'stage' => 49,
    'need_item' => [
        [
            102019037,
             1790
        ],
         [
            102019039,
             1790
        ],
         [
            101001003,
             255000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         54
    ],
    'reset_reward_items' => [
        [
            102019037,
             83650
        ],
         [
            102019039,
             83650
        ]
    ],
    'qibing_attack' => 242.3,
    'qibing_defence' => 114.9
};
get(2050)-> #{
    'type' => 2,
    'stage' => 50,
    'need_item' => [
        [
            102019037,
             1620
        ],
         [
            102019039,
             1620
        ],
         [
            101001003,
             260000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         55
    ],
    'reset_reward_items' => [
        [
            102019037,
             85270
        ],
         [
            102019039,
             85270
        ]
    ],
    'qibing_attack' => 251.0,
    'qibing_defence' => 119.0
};
get(2051)-> #{
    'type' => 2,
    'stage' => 51,
    'need_item' => [
        [
            102019038,
             1660
        ],
         [
            102019040,
             1660
        ],
         [
            101001003,
             265000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         56
    ],
    'reset_reward_items' => [
        [
            102019038,
             86930
        ],
         [
            102019040,
             86930
        ]
    ],
    'qibing_attack' => 264.1,
    'qibing_defence' => 125.2
};
get(2052)-> #{
    'type' => 2,
    'stage' => 52,
    'need_item' => [
        [
            102019038,
             1700
        ],
         [
            102019040,
             1700
        ],
         [
            101001003,
             270000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         57
    ],
    'reset_reward_items' => [
        [
            102019038,
             88630
        ],
         [
            102019040,
             88630
        ]
    ],
    'qibing_attack' => 277.2,
    'qibing_defence' => 131.4
};
get(2053)-> #{
    'type' => 2,
    'stage' => 53,
    'need_item' => [
        [
            102019038,
             1740
        ],
         [
            102019040,
             1740
        ],
         [
            101001003,
             275000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         58
    ],
    'reset_reward_items' => [
        [
            102019038,
             90370
        ],
         [
            102019040,
             90370
        ]
    ],
    'qibing_attack' => 290.3,
    'qibing_defence' => 137.6
};
get(2054)-> #{
    'type' => 2,
    'stage' => 54,
    'need_item' => [
        [
            102019038,
             1780
        ],
         [
            102019040,
             1780
        ],
         [
            101001003,
             280000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         59
    ],
    'reset_reward_items' => [
        [
            102019038,
             92150
        ],
         [
            102019040,
             92150
        ]
    ],
    'qibing_attack' => 303.4,
    'qibing_defence' => 143.8
};
get(2055)-> #{
    'type' => 2,
    'stage' => 55,
    'need_item' => [
        [
            102019038,
             1820
        ],
         [
            102019040,
             1820
        ],
         [
            101001003,
             285000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         60
    ],
    'reset_reward_items' => [
        [
            102019038,
             93970
        ],
         [
            102019040,
             93970
        ]
    ],
    'qibing_attack' => 316.5,
    'qibing_defence' => 150.0
};
get(2056)-> #{
    'type' => 2,
    'stage' => 56,
    'need_item' => [
        [
            102019038,
             1860
        ],
         [
            102019040,
             1860
        ],
         [
            101001003,
             290000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         61
    ],
    'reset_reward_items' => [
        [
            102019038,
             95830
        ],
         [
            102019040,
             95830
        ]
    ],
    'qibing_attack' => 329.6,
    'qibing_defence' => 156.2
};
get(2057)-> #{
    'type' => 2,
    'stage' => 57,
    'need_item' => [
        [
            102019038,
             1900
        ],
         [
            102019040,
             1900
        ],
         [
            101001003,
             295000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         62
    ],
    'reset_reward_items' => [
        [
            102019038,
             97730
        ],
         [
            102019040,
             97730
        ]
    ],
    'qibing_attack' => 342.7,
    'qibing_defence' => 162.4
};
get(2058)-> #{
    'type' => 2,
    'stage' => 58,
    'need_item' => [
        [
            102019038,
             1940
        ],
         [
            102019040,
             1940
        ],
         [
            101001003,
             300000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         63
    ],
    'reset_reward_items' => [
        [
            102019038,
             99670
        ],
         [
            102019040,
             99670
        ]
    ],
    'qibing_attack' => 355.8,
    'qibing_defence' => 168.6
};
get(2059)-> #{
    'type' => 2,
    'stage' => 59,
    'need_item' => [
        [
            102019038,
             1980
        ],
         [
            102019040,
             1980
        ],
         [
            101001003,
             305000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         64
    ],
    'reset_reward_items' => [
        [
            102019038,
             101650
        ],
         [
            102019040,
             101650
        ]
    ],
    'qibing_attack' => 368.9,
    'qibing_defence' => 174.8
};
get(2060)-> #{
    'type' => 2,
    'stage' => 60,
    'need_item' => [
        [
            102019038,
             0
        ],
         [
            102019040,
             0
        ],
         [
            101001003,
             310000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         65
    ],
    'reset_reward_items' => [
        [
            102019038,
             101650
        ],
         [
            102019040,
             101650
        ]
    ],
    'qibing_attack' => 382.0,
    'qibing_defence' => 181.0
};
get(3000)-> #{
    'type' => 3,
    'stage' => 0,
    'need_item' => [
        [
            102019009,
             150
        ],
         [
            102019011,
             150
        ],
         [
            101001003,
             10000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         5
    ],
    'reset_reward_items' => [
        [
            102019009,
             101800
        ],
         [
            102019011,
             101800
        ]
    ],
    'gongbing_attack' => 0.0,
    'gongbing_defence' => 0.0
};
get(3001)-> #{
    'type' => 3,
    'stage' => 1,
    'need_item' => [
        [
            102019009,
             170
        ],
         [
            102019011,
             170
        ],
         [
            101001003,
             15000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         6
    ],
    'reset_reward_items' => [
        [
            102019009,
             101970
        ],
         [
            102019011,
             101970
        ]
    ],
    'gongbing_attack' => 3.5,
    'gongbing_defence' => 0.7
};
get(3002)-> #{
    'type' => 3,
    'stage' => 2,
    'need_item' => [
        [
            102019009,
             190
        ],
         [
            102019011,
             190
        ],
         [
            101001003,
             20000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         7
    ],
    'reset_reward_items' => [
        [
            102019009,
             102160
        ],
         [
            102019011,
             102160
        ]
    ],
    'gongbing_attack' => 7.0,
    'gongbing_defence' => 1.4
};
get(3003)-> #{
    'type' => 3,
    'stage' => 3,
    'need_item' => [
        [
            102019009,
             210
        ],
         [
            102019011,
             210
        ],
         [
            101001003,
             25000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         8
    ],
    'reset_reward_items' => [
        [
            102019009,
             102370
        ],
         [
            102019011,
             102370
        ]
    ],
    'gongbing_attack' => 10.5,
    'gongbing_defence' => 2.1
};
get(3004)-> #{
    'type' => 3,
    'stage' => 4,
    'need_item' => [
        [
            102019009,
             230
        ],
         [
            102019011,
             230
        ],
         [
            101001003,
             30000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         9
    ],
    'reset_reward_items' => [
        [
            102019009,
             102600
        ],
         [
            102019011,
             102600
        ]
    ],
    'gongbing_attack' => 14.0,
    'gongbing_defence' => 2.8
};
get(3005)-> #{
    'type' => 3,
    'stage' => 5,
    'need_item' => [
        [
            102019009,
             250
        ],
         [
            102019011,
             250
        ],
         [
            101001003,
             35000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         10
    ],
    'reset_reward_items' => [
        [
            102019009,
             102850
        ],
         [
            102019011,
             102850
        ]
    ],
    'gongbing_attack' => 17.5,
    'gongbing_defence' => 3.5
};
get(3006)-> #{
    'type' => 3,
    'stage' => 6,
    'need_item' => [
        [
            102019009,
             270
        ],
         [
            102019011,
             270
        ],
         [
            101001003,
             40000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         11
    ],
    'reset_reward_items' => [
        [
            102019009,
             103120
        ],
         [
            102019011,
             103120
        ]
    ],
    'gongbing_attack' => 21.0,
    'gongbing_defence' => 4.2
};
get(3007)-> #{
    'type' => 3,
    'stage' => 7,
    'need_item' => [
        [
            102019009,
             290
        ],
         [
            102019011,
             290
        ],
         [
            101001003,
             45000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         12
    ],
    'reset_reward_items' => [
        [
            102019009,
             103410
        ],
         [
            102019011,
             103410
        ]
    ],
    'gongbing_attack' => 24.5,
    'gongbing_defence' => 4.9
};
get(3008)-> #{
    'type' => 3,
    'stage' => 8,
    'need_item' => [
        [
            102019009,
             310
        ],
         [
            102019011,
             310
        ],
         [
            101001003,
             50000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         13
    ],
    'reset_reward_items' => [
        [
            102019009,
             103720
        ],
         [
            102019011,
             103720
        ]
    ],
    'gongbing_attack' => 28.0,
    'gongbing_defence' => 5.6
};
get(3009)-> #{
    'type' => 3,
    'stage' => 9,
    'need_item' => [
        [
            102019009,
             330
        ],
         [
            102019011,
             330
        ],
         [
            101001003,
             55000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         14
    ],
    'reset_reward_items' => [
        [
            102019009,
             104050
        ],
         [
            102019011,
             104050
        ]
    ],
    'gongbing_attack' => 31.5,
    'gongbing_defence' => 6.3
};
get(3010)-> #{
    'type' => 3,
    'stage' => 10,
    'need_item' => [
        [
            102019009,
             225
        ],
         [
            102019011,
             225
        ],
         [
            101001003,
             60000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         15
    ],
    'reset_reward_items' => [
        [
            102019009,
             104275
        ],
         [
            102019011,
             104275
        ]
    ],
    'gongbing_attack' => 35.0,
    'gongbing_defence' => 7.0
};
get(3011)-> #{
    'type' => 3,
    'stage' => 11,
    'need_item' => [
        [
            102019010,
             255
        ],
         [
            102019012,
             255
        ],
         [
            101001003,
             65000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         16
    ],
    'reset_reward_items' => [
        [
            102019010,
             104530
        ],
         [
            102019012,
             104530
        ]
    ],
    'gongbing_attack' => 39.7,
    'gongbing_defence' => 7.9
};
get(3012)-> #{
    'type' => 3,
    'stage' => 12,
    'need_item' => [
        [
            102019010,
             285
        ],
         [
            102019012,
             285
        ],
         [
            101001003,
             70000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         17
    ],
    'reset_reward_items' => [
        [
            102019010,
             104815
        ],
         [
            102019012,
             104815
        ]
    ],
    'gongbing_attack' => 44.4,
    'gongbing_defence' => 8.8
};
get(3013)-> #{
    'type' => 3,
    'stage' => 13,
    'need_item' => [
        [
            102019010,
             315
        ],
         [
            102019012,
             315
        ],
         [
            101001003,
             75000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         18
    ],
    'reset_reward_items' => [
        [
            102019010,
             105130
        ],
         [
            102019012,
             105130
        ]
    ],
    'gongbing_attack' => 49.1,
    'gongbing_defence' => 9.7
};
get(3014)-> #{
    'type' => 3,
    'stage' => 14,
    'need_item' => [
        [
            102019010,
             345
        ],
         [
            102019012,
             345
        ],
         [
            101001003,
             80000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         19
    ],
    'reset_reward_items' => [
        [
            102019010,
             105475
        ],
         [
            102019012,
             105475
        ]
    ],
    'gongbing_attack' => 53.8,
    'gongbing_defence' => 10.6
};
get(3015)-> #{
    'type' => 3,
    'stage' => 15,
    'need_item' => [
        [
            102019010,
             375
        ],
         [
            102019012,
             375
        ],
         [
            101001003,
             85000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         20
    ],
    'reset_reward_items' => [
        [
            102019010,
             105850
        ],
         [
            102019012,
             105850
        ]
    ],
    'gongbing_attack' => 58.5,
    'gongbing_defence' => 11.5
};
get(3016)-> #{
    'type' => 3,
    'stage' => 16,
    'need_item' => [
        [
            102019010,
             405
        ],
         [
            102019012,
             405
        ],
         [
            101001003,
             90000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         21
    ],
    'reset_reward_items' => [
        [
            102019010,
             106255
        ],
         [
            102019012,
             106255
        ]
    ],
    'gongbing_attack' => 63.2,
    'gongbing_defence' => 12.4
};
get(3017)-> #{
    'type' => 3,
    'stage' => 17,
    'need_item' => [
        [
            102019010,
             435
        ],
         [
            102019012,
             435
        ],
         [
            101001003,
             95000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         22
    ],
    'reset_reward_items' => [
        [
            102019010,
             106690
        ],
         [
            102019012,
             106690
        ]
    ],
    'gongbing_attack' => 67.9,
    'gongbing_defence' => 13.3
};
get(3018)-> #{
    'type' => 3,
    'stage' => 18,
    'need_item' => [
        [
            102019010,
             465
        ],
         [
            102019012,
             465
        ],
         [
            101001003,
             100000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         23
    ],
    'reset_reward_items' => [
        [
            102019010,
             107155
        ],
         [
            102019012,
             107155
        ]
    ],
    'gongbing_attack' => 72.6,
    'gongbing_defence' => 14.2
};
get(3019)-> #{
    'type' => 3,
    'stage' => 19,
    'need_item' => [
        [
            102019010,
             495
        ],
         [
            102019012,
             495
        ],
         [
            101001003,
             105000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         24
    ],
    'reset_reward_items' => [
        [
            102019010,
             107650
        ],
         [
            102019012,
             107650
        ]
    ],
    'gongbing_attack' => 77.3,
    'gongbing_defence' => 15.1
};
get(3020)-> #{
    'type' => 3,
    'stage' => 20,
    'need_item' => [
        [
            102019010,
             390
        ],
         [
            102019012,
             390
        ],
         [
            101001003,
             110000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         25
    ],
    'reset_reward_items' => [
        [
            102019010,
             108040
        ],
         [
            102019012,
             108040
        ]
    ],
    'gongbing_attack' => 82.0,
    'gongbing_defence' => 16.0
};
get(3021)-> #{
    'type' => 3,
    'stage' => 21,
    'need_item' => [
        [
            102019025,
             440
        ],
         [
            102019027,
             440
        ],
         [
            101001003,
             115000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         26
    ],
    'reset_reward_items' => [
        [
            102019025,
             108480
        ],
         [
            102019027,
             108480
        ]
    ],
    'gongbing_attack' => 88.3,
    'gongbing_defence' => 17.2
};
get(3022)-> #{
    'type' => 3,
    'stage' => 22,
    'need_item' => [
        [
            102019025,
             490
        ],
         [
            102019027,
             490
        ],
         [
            101001003,
             120000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         27
    ],
    'reset_reward_items' => [
        [
            102019025,
             108970
        ],
         [
            102019027,
             108970
        ]
    ],
    'gongbing_attack' => 94.6,
    'gongbing_defence' => 18.4
};
get(3023)-> #{
    'type' => 3,
    'stage' => 23,
    'need_item' => [
        [
            102019025,
             540
        ],
         [
            102019027,
             540
        ],
         [
            101001003,
             125000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         28
    ],
    'reset_reward_items' => [
        [
            102019025,
             109510
        ],
         [
            102019027,
             109510
        ]
    ],
    'gongbing_attack' => 100.9,
    'gongbing_defence' => 19.6
};
get(3024)-> #{
    'type' => 3,
    'stage' => 24,
    'need_item' => [
        [
            102019025,
             590
        ],
         [
            102019027,
             590
        ],
         [
            101001003,
             130000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         29
    ],
    'reset_reward_items' => [
        [
            102019025,
             110100
        ],
         [
            102019027,
             110100
        ]
    ],
    'gongbing_attack' => 107.2,
    'gongbing_defence' => 20.8
};
get(3025)-> #{
    'type' => 3,
    'stage' => 25,
    'need_item' => [
        [
            102019025,
             640
        ],
         [
            102019027,
             640
        ],
         [
            101001003,
             135000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         30
    ],
    'reset_reward_items' => [
        [
            102019025,
             110740
        ],
         [
            102019027,
             110740
        ]
    ],
    'gongbing_attack' => 113.5,
    'gongbing_defence' => 22.0
};
get(3026)-> #{
    'type' => 3,
    'stage' => 26,
    'need_item' => [
        [
            102019025,
             690
        ],
         [
            102019027,
             690
        ],
         [
            101001003,
             140000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         31
    ],
    'reset_reward_items' => [
        [
            102019025,
             111430
        ],
         [
            102019027,
             111430
        ]
    ],
    'gongbing_attack' => 119.8,
    'gongbing_defence' => 23.2
};
get(3027)-> #{
    'type' => 3,
    'stage' => 27,
    'need_item' => [
        [
            102019025,
             740
        ],
         [
            102019027,
             740
        ],
         [
            101001003,
             145000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         32
    ],
    'reset_reward_items' => [
        [
            102019025,
             112170
        ],
         [
            102019027,
             112170
        ]
    ],
    'gongbing_attack' => 126.1,
    'gongbing_defence' => 24.4
};
get(3028)-> #{
    'type' => 3,
    'stage' => 28,
    'need_item' => [
        [
            102019025,
             790
        ],
         [
            102019027,
             790
        ],
         [
            101001003,
             150000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         33
    ],
    'reset_reward_items' => [
        [
            102019025,
             112960
        ],
         [
            102019027,
             112960
        ]
    ],
    'gongbing_attack' => 132.4,
    'gongbing_defence' => 25.6
};
get(3029)-> #{
    'type' => 3,
    'stage' => 29,
    'need_item' => [
        [
            102019025,
             840
        ],
         [
            102019027,
             840
        ],
         [
            101001003,
             155000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         34
    ],
    'reset_reward_items' => [
        [
            102019025,
             113800
        ],
         [
            102019027,
             113800
        ]
    ],
    'gongbing_attack' => 138.7,
    'gongbing_defence' => 26.8
};
get(3030)-> #{
    'type' => 3,
    'stage' => 30,
    'need_item' => [
        [
            102019025,
             480
        ],
         [
            102019027,
             480
        ],
         [
            101001003,
             160000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         35
    ],
    'reset_reward_items' => [
        [
            102019025,
             114280
        ],
         [
            102019027,
             114280
        ]
    ],
    'gongbing_attack' => 145.0,
    'gongbing_defence' => 28.0
};
get(3031)-> #{
    'type' => 3,
    'stage' => 31,
    'need_item' => [
        [
            102019026,
             545
        ],
         [
            102019028,
             545
        ],
         [
            101001003,
             165000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         36
    ],
    'reset_reward_items' => [
        [
            102019026,
             114825
        ],
         [
            102019028,
             114825
        ]
    ],
    'gongbing_attack' => 153.8,
    'gongbing_defence' => 29.7
};
get(3032)-> #{
    'type' => 3,
    'stage' => 32,
    'need_item' => [
        [
            102019026,
             610
        ],
         [
            102019028,
             610
        ],
         [
            101001003,
             170000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         37
    ],
    'reset_reward_items' => [
        [
            102019026,
             115435
        ],
         [
            102019028,
             115435
        ]
    ],
    'gongbing_attack' => 162.6,
    'gongbing_defence' => 31.4
};
get(3033)-> #{
    'type' => 3,
    'stage' => 33,
    'need_item' => [
        [
            102019026,
             675
        ],
         [
            102019028,
             675
        ],
         [
            101001003,
             175000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         38
    ],
    'reset_reward_items' => [
        [
            102019026,
             116110
        ],
         [
            102019028,
             116110
        ]
    ],
    'gongbing_attack' => 171.4,
    'gongbing_defence' => 33.1
};
get(3034)-> #{
    'type' => 3,
    'stage' => 34,
    'need_item' => [
        [
            102019026,
             740
        ],
         [
            102019028,
             740
        ],
         [
            101001003,
             180000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         39
    ],
    'reset_reward_items' => [
        [
            102019026,
             116850
        ],
         [
            102019028,
             116850
        ]
    ],
    'gongbing_attack' => 180.2,
    'gongbing_defence' => 34.8
};
get(3035)-> #{
    'type' => 3,
    'stage' => 35,
    'need_item' => [
        [
            102019026,
             805
        ],
         [
            102019028,
             805
        ],
         [
            101001003,
             185000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         40
    ],
    'reset_reward_items' => [
        [
            102019026,
             117655
        ],
         [
            102019028,
             117655
        ]
    ],
    'gongbing_attack' => 189.0,
    'gongbing_defence' => 36.5
};
get(3036)-> #{
    'type' => 3,
    'stage' => 36,
    'need_item' => [
        [
            102019026,
             870
        ],
         [
            102019028,
             870
        ],
         [
            101001003,
             190000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         41
    ],
    'reset_reward_items' => [
        [
            102019026,
             118525
        ],
         [
            102019028,
             118525
        ]
    ],
    'gongbing_attack' => 197.8,
    'gongbing_defence' => 38.2
};
get(3037)-> #{
    'type' => 3,
    'stage' => 37,
    'need_item' => [
        [
            102019026,
             935
        ],
         [
            102019028,
             935
        ],
         [
            101001003,
             195000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         42
    ],
    'reset_reward_items' => [
        [
            102019026,
             119460
        ],
         [
            102019028,
             119460
        ]
    ],
    'gongbing_attack' => 206.6,
    'gongbing_defence' => 39.9
};
get(3038)-> #{
    'type' => 3,
    'stage' => 38,
    'need_item' => [
        [
            102019026,
             1000
        ],
         [
            102019028,
             1000
        ],
         [
            101001003,
             200000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         43
    ],
    'reset_reward_items' => [
        [
            102019026,
             120460
        ],
         [
            102019028,
             120460
        ]
    ],
    'gongbing_attack' => 215.4,
    'gongbing_defence' => 41.6
};
get(3039)-> #{
    'type' => 3,
    'stage' => 39,
    'need_item' => [
        [
            102019026,
             1065
        ],
         [
            102019028,
             1065
        ],
         [
            101001003,
             205000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         44
    ],
    'reset_reward_items' => [
        [
            102019026,
             121525
        ],
         [
            102019028,
             121525
        ]
    ],
    'gongbing_attack' => 224.2,
    'gongbing_defence' => 43.3
};
get(3040)-> #{
    'type' => 3,
    'stage' => 40,
    'need_item' => [
        [
            102019026,
             800
        ],
         [
            102019028,
             800
        ],
         [
            101001003,
             210000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         45
    ],
    'reset_reward_items' => [
        [
            102019026,
             122325
        ],
         [
            102019028,
             122325
        ]
    ],
    'gongbing_attack' => 233.0,
    'gongbing_defence' => 45.0
};
get(3041)-> #{
    'type' => 3,
    'stage' => 41,
    'need_item' => [
        [
            102019041,
             910
        ],
         [
            102019043,
             910
        ],
         [
            101001003,
             215000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         46
    ],
    'reset_reward_items' => [
        [
            102019041,
             123235
        ],
         [
            102019043,
             123235
        ]
    ],
    'gongbing_attack' => 245.3,
    'gongbing_defence' => 47.4
};
get(3042)-> #{
    'type' => 3,
    'stage' => 42,
    'need_item' => [
        [
            102019041,
             1020
        ],
         [
            102019043,
             1020
        ],
         [
            101001003,
             220000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         47
    ],
    'reset_reward_items' => [
        [
            102019041,
             124255
        ],
         [
            102019043,
             124255
        ]
    ],
    'gongbing_attack' => 257.6,
    'gongbing_defence' => 49.8
};
get(3043)-> #{
    'type' => 3,
    'stage' => 43,
    'need_item' => [
        [
            102019041,
             1130
        ],
         [
            102019043,
             1130
        ],
         [
            101001003,
             225000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         48
    ],
    'reset_reward_items' => [
        [
            102019041,
             125385
        ],
         [
            102019043,
             125385
        ]
    ],
    'gongbing_attack' => 269.9,
    'gongbing_defence' => 52.2
};
get(3044)-> #{
    'type' => 3,
    'stage' => 44,
    'need_item' => [
        [
            102019041,
             1240
        ],
         [
            102019043,
             1240
        ],
         [
            101001003,
             230000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         49
    ],
    'reset_reward_items' => [
        [
            102019041,
             126625
        ],
         [
            102019043,
             126625
        ]
    ],
    'gongbing_attack' => 282.2,
    'gongbing_defence' => 54.6
};
get(3045)-> #{
    'type' => 3,
    'stage' => 45,
    'need_item' => [
        [
            102019041,
             1350
        ],
         [
            102019043,
             1350
        ],
         [
            101001003,
             235000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         50
    ],
    'reset_reward_items' => [
        [
            102019041,
             127975
        ],
         [
            102019043,
             127975
        ]
    ],
    'gongbing_attack' => 294.5,
    'gongbing_defence' => 57.0
};
get(3046)-> #{
    'type' => 3,
    'stage' => 46,
    'need_item' => [
        [
            102019041,
             1460
        ],
         [
            102019043,
             1460
        ],
         [
            101001003,
             240000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         51
    ],
    'reset_reward_items' => [
        [
            102019041,
             129435
        ],
         [
            102019043,
             129435
        ]
    ],
    'gongbing_attack' => 306.8,
    'gongbing_defence' => 59.4
};
get(3047)-> #{
    'type' => 3,
    'stage' => 47,
    'need_item' => [
        [
            102019041,
             1570
        ],
         [
            102019043,
             1570
        ],
         [
            101001003,
             245000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         52
    ],
    'reset_reward_items' => [
        [
            102019041,
             131005
        ],
         [
            102019043,
             131005
        ]
    ],
    'gongbing_attack' => 319.1,
    'gongbing_defence' => 61.8
};
get(3048)-> #{
    'type' => 3,
    'stage' => 48,
    'need_item' => [
        [
            102019041,
             1680
        ],
         [
            102019043,
             1680
        ],
         [
            101001003,
             250000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         53
    ],
    'reset_reward_items' => [
        [
            102019041,
             132685
        ],
         [
            102019043,
             132685
        ]
    ],
    'gongbing_attack' => 331.4,
    'gongbing_defence' => 64.2
};
get(3049)-> #{
    'type' => 3,
    'stage' => 49,
    'need_item' => [
        [
            102019041,
             1790
        ],
         [
            102019043,
             1790
        ],
         [
            101001003,
             255000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         54
    ],
    'reset_reward_items' => [
        [
            102019041,
             134475
        ],
         [
            102019043,
             134475
        ]
    ],
    'gongbing_attack' => 343.7,
    'gongbing_defence' => 66.6
};
get(3050)-> #{
    'type' => 3,
    'stage' => 50,
    'need_item' => [
        [
            102019041,
             1620
        ],
         [
            102019043,
             1620
        ],
         [
            101001003,
             260000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         55
    ],
    'reset_reward_items' => [
        [
            102019041,
             136095
        ],
         [
            102019043,
             136095
        ]
    ],
    'gongbing_attack' => 356.0,
    'gongbing_defence' => 69.0
};
get(3051)-> #{
    'type' => 3,
    'stage' => 51,
    'need_item' => [
        [
            102019042,
             1660
        ],
         [
            102019044,
             1660
        ],
         [
            101001003,
             265000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         56
    ],
    'reset_reward_items' => [
        [
            102019042,
             137755
        ],
         [
            102019044,
             137755
        ]
    ],
    'gongbing_attack' => 374.5,
    'gongbing_defence' => 72.6
};
get(3052)-> #{
    'type' => 3,
    'stage' => 52,
    'need_item' => [
        [
            102019042,
             1700
        ],
         [
            102019044,
             1700
        ],
         [
            101001003,
             270000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         57
    ],
    'reset_reward_items' => [
        [
            102019042,
             139455
        ],
         [
            102019044,
             139455
        ]
    ],
    'gongbing_attack' => 393.0,
    'gongbing_defence' => 76.2
};
get(3053)-> #{
    'type' => 3,
    'stage' => 53,
    'need_item' => [
        [
            102019042,
             1740
        ],
         [
            102019044,
             1740
        ],
         [
            101001003,
             275000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         58
    ],
    'reset_reward_items' => [
        [
            102019042,
             141195
        ],
         [
            102019044,
             141195
        ]
    ],
    'gongbing_attack' => 411.5,
    'gongbing_defence' => 79.8
};
get(3054)-> #{
    'type' => 3,
    'stage' => 54,
    'need_item' => [
        [
            102019042,
             1780
        ],
         [
            102019044,
             1780
        ],
         [
            101001003,
             280000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         59
    ],
    'reset_reward_items' => [
        [
            102019042,
             142975
        ],
         [
            102019044,
             142975
        ]
    ],
    'gongbing_attack' => 430.0,
    'gongbing_defence' => 83.4
};
get(3055)-> #{
    'type' => 3,
    'stage' => 55,
    'need_item' => [
        [
            102019042,
             1820
        ],
         [
            102019044,
             1820
        ],
         [
            101001003,
             285000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         60
    ],
    'reset_reward_items' => [
        [
            102019042,
             144795
        ],
         [
            102019044,
             144795
        ]
    ],
    'gongbing_attack' => 448.5,
    'gongbing_defence' => 87.0
};
get(3056)-> #{
    'type' => 3,
    'stage' => 56,
    'need_item' => [
        [
            102019042,
             1860
        ],
         [
            102019044,
             1860
        ],
         [
            101001003,
             290000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         61
    ],
    'reset_reward_items' => [
        [
            102019042,
             146655
        ],
         [
            102019044,
             146655
        ]
    ],
    'gongbing_attack' => 467.0,
    'gongbing_defence' => 90.6
};
get(3057)-> #{
    'type' => 3,
    'stage' => 57,
    'need_item' => [
        [
            102019042,
             1900
        ],
         [
            102019044,
             1900
        ],
         [
            101001003,
             295000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         62
    ],
    'reset_reward_items' => [
        [
            102019042,
             148555
        ],
         [
            102019044,
             148555
        ]
    ],
    'gongbing_attack' => 485.5,
    'gongbing_defence' => 94.2
};
get(3058)-> #{
    'type' => 3,
    'stage' => 58,
    'need_item' => [
        [
            102019042,
             1940
        ],
         [
            102019044,
             1940
        ],
         [
            101001003,
             300000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         63
    ],
    'reset_reward_items' => [
        [
            102019042,
             150495
        ],
         [
            102019044,
             150495
        ]
    ],
    'gongbing_attack' => 504.0,
    'gongbing_defence' => 97.8
};
get(3059)-> #{
    'type' => 3,
    'stage' => 59,
    'need_item' => [
        [
            102019042,
             1980
        ],
         [
            102019044,
             1980
        ],
         [
            101001003,
             305000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         64
    ],
    'reset_reward_items' => [
        [
            102019042,
             152475
        ],
         [
            102019044,
             152475
        ]
    ],
    'gongbing_attack' => 522.5,
    'gongbing_defence' => 101.4
};
get(3060)-> #{
    'type' => 3,
    'stage' => 60,
    'need_item' => [
        [
            102019042,
             0
        ],
         [
            102019044,
             0
        ],
         [
            101001003,
             310000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         65
    ],
    'reset_reward_items' => [
        [
            102019042,
             152475
        ],
         [
            102019044,
             152475
        ]
    ],
    'gongbing_attack' => 541.0,
    'gongbing_defence' => 105.0
};
get(4000)-> #{
    'type' => 4,
    'stage' => 0,
    'need_item' => [
        [
            102019013,
             150
        ],
         [
            102019015,
             150
        ],
         [
            101001003,
             10000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         5
    ],
    'reset_reward_items' => [
        [
            102019013,
             152625
        ],
         [
            102019015,
             152625
        ]
    ],
    'fangshi_attack' => 0.0,
    'fangshi_defence' => 0.0
};
get(4001)-> #{
    'type' => 4,
    'stage' => 1,
    'need_item' => [
        [
            102019013,
             170
        ],
         [
            102019015,
             170
        ],
         [
            101001003,
             15000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         6
    ],
    'reset_reward_items' => [
        [
            102019013,
             152795
        ],
         [
            102019015,
             152795
        ]
    ],
    'fangshi_attack' => 3.6,
    'fangshi_defence' => 0.6
};
get(4002)-> #{
    'type' => 4,
    'stage' => 2,
    'need_item' => [
        [
            102019013,
             190
        ],
         [
            102019015,
             190
        ],
         [
            101001003,
             20000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         7
    ],
    'reset_reward_items' => [
        [
            102019013,
             152985
        ],
         [
            102019015,
             152985
        ]
    ],
    'fangshi_attack' => 7.2,
    'fangshi_defence' => 1.2
};
get(4003)-> #{
    'type' => 4,
    'stage' => 3,
    'need_item' => [
        [
            102019013,
             210
        ],
         [
            102019015,
             210
        ],
         [
            101001003,
             25000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         8
    ],
    'reset_reward_items' => [
        [
            102019013,
             153195
        ],
         [
            102019015,
             153195
        ]
    ],
    'fangshi_attack' => 10.8,
    'fangshi_defence' => 1.8
};
get(4004)-> #{
    'type' => 4,
    'stage' => 4,
    'need_item' => [
        [
            102019013,
             230
        ],
         [
            102019015,
             230
        ],
         [
            101001003,
             30000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         9
    ],
    'reset_reward_items' => [
        [
            102019013,
             153425
        ],
         [
            102019015,
             153425
        ]
    ],
    'fangshi_attack' => 14.4,
    'fangshi_defence' => 2.4
};
get(4005)-> #{
    'type' => 4,
    'stage' => 5,
    'need_item' => [
        [
            102019013,
             250
        ],
         [
            102019015,
             250
        ],
         [
            101001003,
             35000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         10
    ],
    'reset_reward_items' => [
        [
            102019013,
             153675
        ],
         [
            102019015,
             153675
        ]
    ],
    'fangshi_attack' => 18.0,
    'fangshi_defence' => 3.0
};
get(4006)-> #{
    'type' => 4,
    'stage' => 6,
    'need_item' => [
        [
            102019013,
             270
        ],
         [
            102019015,
             270
        ],
         [
            101001003,
             40000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         11
    ],
    'reset_reward_items' => [
        [
            102019013,
             153945
        ],
         [
            102019015,
             153945
        ]
    ],
    'fangshi_attack' => 21.6,
    'fangshi_defence' => 3.6
};
get(4007)-> #{
    'type' => 4,
    'stage' => 7,
    'need_item' => [
        [
            102019013,
             290
        ],
         [
            102019015,
             290
        ],
         [
            101001003,
             45000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         12
    ],
    'reset_reward_items' => [
        [
            102019013,
             154235
        ],
         [
            102019015,
             154235
        ]
    ],
    'fangshi_attack' => 25.2,
    'fangshi_defence' => 4.2
};
get(4008)-> #{
    'type' => 4,
    'stage' => 8,
    'need_item' => [
        [
            102019013,
             310
        ],
         [
            102019015,
             310
        ],
         [
            101001003,
             50000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         13
    ],
    'reset_reward_items' => [
        [
            102019013,
             154545
        ],
         [
            102019015,
             154545
        ]
    ],
    'fangshi_attack' => 28.8,
    'fangshi_defence' => 4.8
};
get(4009)-> #{
    'type' => 4,
    'stage' => 9,
    'need_item' => [
        [
            102019013,
             330
        ],
         [
            102019015,
             330
        ],
         [
            101001003,
             55000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         14
    ],
    'reset_reward_items' => [
        [
            102019013,
             154875
        ],
         [
            102019015,
             154875
        ]
    ],
    'fangshi_attack' => 32.4,
    'fangshi_defence' => 5.4
};
get(4010)-> #{
    'type' => 4,
    'stage' => 10,
    'need_item' => [
        [
            102019013,
             225
        ],
         [
            102019015,
             225
        ],
         [
            101001003,
             60000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         15
    ],
    'reset_reward_items' => [
        [
            102019013,
             155100
        ],
         [
            102019015,
             155100
        ]
    ],
    'fangshi_attack' => 36.0,
    'fangshi_defence' => 6.0
};
get(4011)-> #{
    'type' => 4,
    'stage' => 11,
    'need_item' => [
        [
            102019014,
             255
        ],
         [
            102019016,
             255
        ],
         [
            101001003,
             65000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         16
    ],
    'reset_reward_items' => [
        [
            102019014,
             155355
        ],
         [
            102019016,
             155355
        ]
    ],
    'fangshi_attack' => 40.8,
    'fangshi_defence' => 6.8
};
get(4012)-> #{
    'type' => 4,
    'stage' => 12,
    'need_item' => [
        [
            102019014,
             285
        ],
         [
            102019016,
             285
        ],
         [
            101001003,
             70000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         17
    ],
    'reset_reward_items' => [
        [
            102019014,
             155640
        ],
         [
            102019016,
             155640
        ]
    ],
    'fangshi_attack' => 45.6,
    'fangshi_defence' => 7.6
};
get(4013)-> #{
    'type' => 4,
    'stage' => 13,
    'need_item' => [
        [
            102019014,
             315
        ],
         [
            102019016,
             315
        ],
         [
            101001003,
             75000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         18
    ],
    'reset_reward_items' => [
        [
            102019014,
             155955
        ],
         [
            102019016,
             155955
        ]
    ],
    'fangshi_attack' => 50.4,
    'fangshi_defence' => 8.4
};
get(4014)-> #{
    'type' => 4,
    'stage' => 14,
    'need_item' => [
        [
            102019014,
             345
        ],
         [
            102019016,
             345
        ],
         [
            101001003,
             80000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         19
    ],
    'reset_reward_items' => [
        [
            102019014,
             156300
        ],
         [
            102019016,
             156300
        ]
    ],
    'fangshi_attack' => 55.2,
    'fangshi_defence' => 9.2
};
get(4015)-> #{
    'type' => 4,
    'stage' => 15,
    'need_item' => [
        [
            102019014,
             375
        ],
         [
            102019016,
             375
        ],
         [
            101001003,
             85000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         20
    ],
    'reset_reward_items' => [
        [
            102019014,
             156675
        ],
         [
            102019016,
             156675
        ]
    ],
    'fangshi_attack' => 60.0,
    'fangshi_defence' => 10.0
};
get(4016)-> #{
    'type' => 4,
    'stage' => 16,
    'need_item' => [
        [
            102019014,
             405
        ],
         [
            102019016,
             405
        ],
         [
            101001003,
             90000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         21
    ],
    'reset_reward_items' => [
        [
            102019014,
             157080
        ],
         [
            102019016,
             157080
        ]
    ],
    'fangshi_attack' => 64.8,
    'fangshi_defence' => 10.8
};
get(4017)-> #{
    'type' => 4,
    'stage' => 17,
    'need_item' => [
        [
            102019014,
             435
        ],
         [
            102019016,
             435
        ],
         [
            101001003,
             95000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         22
    ],
    'reset_reward_items' => [
        [
            102019014,
             157515
        ],
         [
            102019016,
             157515
        ]
    ],
    'fangshi_attack' => 69.6,
    'fangshi_defence' => 11.6
};
get(4018)-> #{
    'type' => 4,
    'stage' => 18,
    'need_item' => [
        [
            102019014,
             465
        ],
         [
            102019016,
             465
        ],
         [
            101001003,
             100000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         23
    ],
    'reset_reward_items' => [
        [
            102019014,
             157980
        ],
         [
            102019016,
             157980
        ]
    ],
    'fangshi_attack' => 74.4,
    'fangshi_defence' => 12.4
};
get(4019)-> #{
    'type' => 4,
    'stage' => 19,
    'need_item' => [
        [
            102019014,
             495
        ],
         [
            102019016,
             495
        ],
         [
            101001003,
             105000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         24
    ],
    'reset_reward_items' => [
        [
            102019014,
             158475
        ],
         [
            102019016,
             158475
        ]
    ],
    'fangshi_attack' => 79.2,
    'fangshi_defence' => 13.2
};
get(4020)-> #{
    'type' => 4,
    'stage' => 20,
    'need_item' => [
        [
            102019014,
             390
        ],
         [
            102019016,
             390
        ],
         [
            101001003,
             110000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         25
    ],
    'reset_reward_items' => [
        [
            102019014,
             158865
        ],
         [
            102019016,
             158865
        ]
    ],
    'fangshi_attack' => 84.0,
    'fangshi_defence' => 14.0
};
get(4021)-> #{
    'type' => 4,
    'stage' => 21,
    'need_item' => [
        [
            102019029,
             440
        ],
         [
            102019031,
             440
        ],
         [
            101001003,
             115000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         26
    ],
    'reset_reward_items' => [
        [
            102019029,
             159305
        ],
         [
            102019031,
             159305
        ]
    ],
    'fangshi_attack' => 90.4,
    'fangshi_defence' => 15.1
};
get(4022)-> #{
    'type' => 4,
    'stage' => 22,
    'need_item' => [
        [
            102019029,
             490
        ],
         [
            102019031,
             490
        ],
         [
            101001003,
             120000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         27
    ],
    'reset_reward_items' => [
        [
            102019029,
             159795
        ],
         [
            102019031,
             159795
        ]
    ],
    'fangshi_attack' => 96.8,
    'fangshi_defence' => 16.2
};
get(4023)-> #{
    'type' => 4,
    'stage' => 23,
    'need_item' => [
        [
            102019029,
             540
        ],
         [
            102019031,
             540
        ],
         [
            101001003,
             125000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         28
    ],
    'reset_reward_items' => [
        [
            102019029,
             160335
        ],
         [
            102019031,
             160335
        ]
    ],
    'fangshi_attack' => 103.2,
    'fangshi_defence' => 17.3
};
get(4024)-> #{
    'type' => 4,
    'stage' => 24,
    'need_item' => [
        [
            102019029,
             590
        ],
         [
            102019031,
             590
        ],
         [
            101001003,
             130000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         29
    ],
    'reset_reward_items' => [
        [
            102019029,
             160925
        ],
         [
            102019031,
             160925
        ]
    ],
    'fangshi_attack' => 109.6,
    'fangshi_defence' => 18.4
};
get(4025)-> #{
    'type' => 4,
    'stage' => 25,
    'need_item' => [
        [
            102019029,
             640
        ],
         [
            102019031,
             640
        ],
         [
            101001003,
             135000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         30
    ],
    'reset_reward_items' => [
        [
            102019029,
             161565
        ],
         [
            102019031,
             161565
        ]
    ],
    'fangshi_attack' => 116.0,
    'fangshi_defence' => 19.5
};
get(4026)-> #{
    'type' => 4,
    'stage' => 26,
    'need_item' => [
        [
            102019029,
             690
        ],
         [
            102019031,
             690
        ],
         [
            101001003,
             140000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         31
    ],
    'reset_reward_items' => [
        [
            102019029,
             162255
        ],
         [
            102019031,
             162255
        ]
    ],
    'fangshi_attack' => 122.4,
    'fangshi_defence' => 20.6
};
get(4027)-> #{
    'type' => 4,
    'stage' => 27,
    'need_item' => [
        [
            102019029,
             740
        ],
         [
            102019031,
             740
        ],
         [
            101001003,
             145000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         32
    ],
    'reset_reward_items' => [
        [
            102019029,
             162995
        ],
         [
            102019031,
             162995
        ]
    ],
    'fangshi_attack' => 128.8,
    'fangshi_defence' => 21.7
};
get(4028)-> #{
    'type' => 4,
    'stage' => 28,
    'need_item' => [
        [
            102019029,
             790
        ],
         [
            102019031,
             790
        ],
         [
            101001003,
             150000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         33
    ],
    'reset_reward_items' => [
        [
            102019029,
             163785
        ],
         [
            102019031,
             163785
        ]
    ],
    'fangshi_attack' => 135.2,
    'fangshi_defence' => 22.8
};
get(4029)-> #{
    'type' => 4,
    'stage' => 29,
    'need_item' => [
        [
            102019029,
             840
        ],
         [
            102019031,
             840
        ],
         [
            101001003,
             155000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         34
    ],
    'reset_reward_items' => [
        [
            102019029,
             164625
        ],
         [
            102019031,
             164625
        ]
    ],
    'fangshi_attack' => 141.6,
    'fangshi_defence' => 23.9
};
get(4030)-> #{
    'type' => 4,
    'stage' => 30,
    'need_item' => [
        [
            102019029,
             480
        ],
         [
            102019031,
             480
        ],
         [
            101001003,
             160000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         35
    ],
    'reset_reward_items' => [
        [
            102019029,
             165105
        ],
         [
            102019031,
             165105
        ]
    ],
    'fangshi_attack' => 148.0,
    'fangshi_defence' => 25.0
};
get(4031)-> #{
    'type' => 4,
    'stage' => 31,
    'need_item' => [
        [
            102019030,
             545
        ],
         [
            102019032,
             545
        ],
         [
            101001003,
             165000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         36
    ],
    'reset_reward_items' => [
        [
            102019030,
             165650
        ],
         [
            102019032,
             165650
        ]
    ],
    'fangshi_attack' => 157.0,
    'fangshi_defence' => 26.5
};
get(4032)-> #{
    'type' => 4,
    'stage' => 32,
    'need_item' => [
        [
            102019030,
             610
        ],
         [
            102019032,
             610
        ],
         [
            101001003,
             170000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         37
    ],
    'reset_reward_items' => [
        [
            102019030,
             166260
        ],
         [
            102019032,
             166260
        ]
    ],
    'fangshi_attack' => 166.0,
    'fangshi_defence' => 28.0
};
get(4033)-> #{
    'type' => 4,
    'stage' => 33,
    'need_item' => [
        [
            102019030,
             675
        ],
         [
            102019032,
             675
        ],
         [
            101001003,
             175000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         38
    ],
    'reset_reward_items' => [
        [
            102019030,
             166935
        ],
         [
            102019032,
             166935
        ]
    ],
    'fangshi_attack' => 175.0,
    'fangshi_defence' => 29.5
};
get(4034)-> #{
    'type' => 4,
    'stage' => 34,
    'need_item' => [
        [
            102019030,
             740
        ],
         [
            102019032,
             740
        ],
         [
            101001003,
             180000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         39
    ],
    'reset_reward_items' => [
        [
            102019030,
             167675
        ],
         [
            102019032,
             167675
        ]
    ],
    'fangshi_attack' => 184.0,
    'fangshi_defence' => 31.0
};
get(4035)-> #{
    'type' => 4,
    'stage' => 35,
    'need_item' => [
        [
            102019030,
             805
        ],
         [
            102019032,
             805
        ],
         [
            101001003,
             185000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         40
    ],
    'reset_reward_items' => [
        [
            102019030,
             168480
        ],
         [
            102019032,
             168480
        ]
    ],
    'fangshi_attack' => 193.0,
    'fangshi_defence' => 32.5
};
get(4036)-> #{
    'type' => 4,
    'stage' => 36,
    'need_item' => [
        [
            102019030,
             870
        ],
         [
            102019032,
             870
        ],
         [
            101001003,
             190000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         41
    ],
    'reset_reward_items' => [
        [
            102019030,
             169350
        ],
         [
            102019032,
             169350
        ]
    ],
    'fangshi_attack' => 202.0,
    'fangshi_defence' => 34.0
};
get(4037)-> #{
    'type' => 4,
    'stage' => 37,
    'need_item' => [
        [
            102019030,
             935
        ],
         [
            102019032,
             935
        ],
         [
            101001003,
             195000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         42
    ],
    'reset_reward_items' => [
        [
            102019030,
             170285
        ],
         [
            102019032,
             170285
        ]
    ],
    'fangshi_attack' => 211.0,
    'fangshi_defence' => 35.5
};
get(4038)-> #{
    'type' => 4,
    'stage' => 38,
    'need_item' => [
        [
            102019030,
             1000
        ],
         [
            102019032,
             1000
        ],
         [
            101001003,
             200000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         43
    ],
    'reset_reward_items' => [
        [
            102019030,
             171285
        ],
         [
            102019032,
             171285
        ]
    ],
    'fangshi_attack' => 220.0,
    'fangshi_defence' => 37.0
};
get(4039)-> #{
    'type' => 4,
    'stage' => 39,
    'need_item' => [
        [
            102019030,
             1065
        ],
         [
            102019032,
             1065
        ],
         [
            101001003,
             205000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         44
    ],
    'reset_reward_items' => [
        [
            102019030,
             172350
        ],
         [
            102019032,
             172350
        ]
    ],
    'fangshi_attack' => 229.0,
    'fangshi_defence' => 38.5
};
get(4040)-> #{
    'type' => 4,
    'stage' => 40,
    'need_item' => [
        [
            102019030,
             800
        ],
         [
            102019032,
             800
        ],
         [
            101001003,
             210000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         45
    ],
    'reset_reward_items' => [
        [
            102019030,
             173150
        ],
         [
            102019032,
             173150
        ]
    ],
    'fangshi_attack' => 238.0,
    'fangshi_defence' => 40.0
};
get(4041)-> #{
    'type' => 4,
    'stage' => 41,
    'need_item' => [
        [
            102019045,
             910
        ],
         [
            102019047,
             910
        ],
         [
            101001003,
             215000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         46
    ],
    'reset_reward_items' => [
        [
            102019045,
             174060
        ],
         [
            102019047,
             174060
        ]
    ],
    'fangshi_attack' => 250.6,
    'fangshi_defence' => 42.1
};
get(4042)-> #{
    'type' => 4,
    'stage' => 42,
    'need_item' => [
        [
            102019045,
             1020
        ],
         [
            102019047,
             1020
        ],
         [
            101001003,
             220000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         47
    ],
    'reset_reward_items' => [
        [
            102019045,
             175080
        ],
         [
            102019047,
             175080
        ]
    ],
    'fangshi_attack' => 263.2,
    'fangshi_defence' => 44.2
};
get(4043)-> #{
    'type' => 4,
    'stage' => 43,
    'need_item' => [
        [
            102019045,
             1130
        ],
         [
            102019047,
             1130
        ],
         [
            101001003,
             225000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         48
    ],
    'reset_reward_items' => [
        [
            102019045,
             176210
        ],
         [
            102019047,
             176210
        ]
    ],
    'fangshi_attack' => 275.8,
    'fangshi_defence' => 46.3
};
get(4044)-> #{
    'type' => 4,
    'stage' => 44,
    'need_item' => [
        [
            102019045,
             1240
        ],
         [
            102019047,
             1240
        ],
         [
            101001003,
             230000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         49
    ],
    'reset_reward_items' => [
        [
            102019045,
             177450
        ],
         [
            102019047,
             177450
        ]
    ],
    'fangshi_attack' => 288.4,
    'fangshi_defence' => 48.4
};
get(4045)-> #{
    'type' => 4,
    'stage' => 45,
    'need_item' => [
        [
            102019045,
             1350
        ],
         [
            102019047,
             1350
        ],
         [
            101001003,
             235000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         50
    ],
    'reset_reward_items' => [
        [
            102019045,
             178800
        ],
         [
            102019047,
             178800
        ]
    ],
    'fangshi_attack' => 301.0,
    'fangshi_defence' => 50.5
};
get(4046)-> #{
    'type' => 4,
    'stage' => 46,
    'need_item' => [
        [
            102019045,
             1460
        ],
         [
            102019047,
             1460
        ],
         [
            101001003,
             240000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         51
    ],
    'reset_reward_items' => [
        [
            102019045,
             180260
        ],
         [
            102019047,
             180260
        ]
    ],
    'fangshi_attack' => 313.6,
    'fangshi_defence' => 52.6
};
get(4047)-> #{
    'type' => 4,
    'stage' => 47,
    'need_item' => [
        [
            102019045,
             1570
        ],
         [
            102019047,
             1570
        ],
         [
            101001003,
             245000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         52
    ],
    'reset_reward_items' => [
        [
            102019045,
             181830
        ],
         [
            102019047,
             181830
        ]
    ],
    'fangshi_attack' => 326.2,
    'fangshi_defence' => 54.7
};
get(4048)-> #{
    'type' => 4,
    'stage' => 48,
    'need_item' => [
        [
            102019045,
             1680
        ],
         [
            102019047,
             1680
        ],
         [
            101001003,
             250000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         53
    ],
    'reset_reward_items' => [
        [
            102019045,
             183510
        ],
         [
            102019047,
             183510
        ]
    ],
    'fangshi_attack' => 338.8,
    'fangshi_defence' => 56.8
};
get(4049)-> #{
    'type' => 4,
    'stage' => 49,
    'need_item' => [
        [
            102019045,
             1790
        ],
         [
            102019047,
             1790
        ],
         [
            101001003,
             255000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         54
    ],
    'reset_reward_items' => [
        [
            102019045,
             185300
        ],
         [
            102019047,
             185300
        ]
    ],
    'fangshi_attack' => 351.4,
    'fangshi_defence' => 58.9
};
get(4050)-> #{
    'type' => 4,
    'stage' => 50,
    'need_item' => [
        [
            102019045,
             1620
        ],
         [
            102019047,
             1620
        ],
         [
            101001003,
             260000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         55
    ],
    'reset_reward_items' => [
        [
            102019045,
             186920
        ],
         [
            102019047,
             186920
        ]
    ],
    'fangshi_attack' => 364.0,
    'fangshi_defence' => 61.0
};
get(4051)-> #{
    'type' => 4,
    'stage' => 51,
    'need_item' => [
        [
            102019046,
             1660
        ],
         [
            102019048,
             1660
        ],
         [
            101001003,
             265000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         56
    ],
    'reset_reward_items' => [
        [
            102019046,
             188580
        ],
         [
            102019048,
             188580
        ]
    ],
    'fangshi_attack' => 382.9,
    'fangshi_defence' => 64.2
};
get(4052)-> #{
    'type' => 4,
    'stage' => 52,
    'need_item' => [
        [
            102019046,
             1700
        ],
         [
            102019048,
             1700
        ],
         [
            101001003,
             270000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         57
    ],
    'reset_reward_items' => [
        [
            102019046,
             190280
        ],
         [
            102019048,
             190280
        ]
    ],
    'fangshi_attack' => 401.8,
    'fangshi_defence' => 67.4
};
get(4053)-> #{
    'type' => 4,
    'stage' => 53,
    'need_item' => [
        [
            102019046,
             1740
        ],
         [
            102019048,
             1740
        ],
         [
            101001003,
             275000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         58
    ],
    'reset_reward_items' => [
        [
            102019046,
             192020
        ],
         [
            102019048,
             192020
        ]
    ],
    'fangshi_attack' => 420.7,
    'fangshi_defence' => 70.6
};
get(4054)-> #{
    'type' => 4,
    'stage' => 54,
    'need_item' => [
        [
            102019046,
             1780
        ],
         [
            102019048,
             1780
        ],
         [
            101001003,
             280000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         59
    ],
    'reset_reward_items' => [
        [
            102019046,
             193800
        ],
         [
            102019048,
             193800
        ]
    ],
    'fangshi_attack' => 439.6,
    'fangshi_defence' => 73.8
};
get(4055)-> #{
    'type' => 4,
    'stage' => 55,
    'need_item' => [
        [
            102019046,
             1820
        ],
         [
            102019048,
             1820
        ],
         [
            101001003,
             285000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         60
    ],
    'reset_reward_items' => [
        [
            102019046,
             195620
        ],
         [
            102019048,
             195620
        ]
    ],
    'fangshi_attack' => 458.5,
    'fangshi_defence' => 77.0
};
get(4056)-> #{
    'type' => 4,
    'stage' => 56,
    'need_item' => [
        [
            102019046,
             1860
        ],
         [
            102019048,
             1860
        ],
         [
            101001003,
             290000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         61
    ],
    'reset_reward_items' => [
        [
            102019046,
             197480
        ],
         [
            102019048,
             197480
        ]
    ],
    'fangshi_attack' => 477.4,
    'fangshi_defence' => 80.2
};
get(4057)-> #{
    'type' => 4,
    'stage' => 57,
    'need_item' => [
        [
            102019046,
             1900
        ],
         [
            102019048,
             1900
        ],
         [
            101001003,
             295000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         62
    ],
    'reset_reward_items' => [
        [
            102019046,
             199380
        ],
         [
            102019048,
             199380
        ]
    ],
    'fangshi_attack' => 496.3,
    'fangshi_defence' => 83.4
};
get(4058)-> #{
    'type' => 4,
    'stage' => 58,
    'need_item' => [
        [
            102019046,
             1940
        ],
         [
            102019048,
             1940
        ],
         [
            101001003,
             300000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         63
    ],
    'reset_reward_items' => [
        [
            102019046,
             201320
        ],
         [
            102019048,
             201320
        ]
    ],
    'fangshi_attack' => 515.2,
    'fangshi_defence' => 86.6
};
get(4059)-> #{
    'type' => 4,
    'stage' => 59,
    'need_item' => [
        [
            102019046,
             1980
        ],
         [
            102019048,
             1980
        ],
         [
            101001003,
             305000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         64
    ],
    'reset_reward_items' => [
        [
            102019046,
             203300
        ],
         [
            102019048,
             203300
        ]
    ],
    'fangshi_attack' => 534.1,
    'fangshi_defence' => 89.8
};
get(4060)-> #{
    'type' => 4,
    'stage' => 60,
    'need_item' => [
        [
            102019046,
             0
        ],
         [
            102019048,
             0
        ],
         [
            101001003,
             310000
        ]
    ],
    'reset_cost_item' => [
        102006003,
         65
    ],
    'reset_reward_items' => [
        [
            102019046,
             203300
        ],
         [
            102019048,
             203300
        ]
    ],
    'fangshi_attack' => 553.0,
    'fangshi_defence' => 93.0
};

get(_N) -> false.
get_list() ->
	[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,3000,3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,3028,3029,3030,3031,3032,3033,3034,3035,3036,3037,3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051,3052,3053,3054,3055,3056,3057,3058,3059,3060,4000,4001,4002,4003,4004,4005,4006,4007,4008,4009,4010,4011,4012,4013,4014,4015,4016,4017,4018,4019,4020,4021,4022,4023,4024,4025,4026,4027,4028,4029,4030,4031,4032,4033,4034,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4053,4054,4055,4056,4057,4058,4059,4060].
