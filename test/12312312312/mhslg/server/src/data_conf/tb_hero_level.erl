%%--- coding:utf-8 ---
-module(tb_hero_level).
-export([get/1,get_list/0]).
get(1)-> #{
    'exp' => 70,
    'reset_cost_item' => [
        102006001,
         5
    ],
    'reset_reward_items' => [
        [
            102008001,
             10
        ]
    ],
    'bubing_base_attack' => 0.0,
    'qibing_base_attack' => 0.0,
    'gongbing_base_attack' => 0.0,
    'fangshi_base_attack' => 0.0,
    'bubing_base_defence' => 0.0,
    'qibing_base_defence' => 0.0,
    'gongbing_base_defence' => 0.0,
    'fangshi_base_defence' => 0.0,
    'bubing_base_troops' => 0.0,
    'qibing_base_troops' => 0.0,
    'gongbing_base_troops' => 0.0,
    'fangshi_base_troops' => 0.0
};
get(2)-> #{
    'exp' => 140,
    'reset_cost_item' => [
        102006001,
         6
    ],
    'reset_reward_items' => [
        [
            102008001,
             11
        ]
    ],
    'bubing_base_attack' => 2.0,
    'qibing_base_attack' => 2.2,
    'gongbing_base_attack' => 2.5,
    'fangshi_base_attack' => 2.5,
    'bubing_base_defence' => 1.0,
    'qibing_base_defence' => 0.8,
    'gongbing_base_defence' => 0.7,
    'fangshi_base_defence' => 0.7,
    'bubing_base_troops' => 15.0,
    'qibing_base_troops' => 15.0,
    'gongbing_base_troops' => 10.0,
    'fangshi_base_troops' => 10.0
};
get(3)-> #{
    'exp' => 160,
    'reset_cost_item' => [
        102006001,
         7
    ],
    'reset_reward_items' => [
        [
            102008001,
             12
        ]
    ],
    'bubing_base_attack' => 4.0,
    'qibing_base_attack' => 4.4,
    'gongbing_base_attack' => 5.0,
    'fangshi_base_attack' => 5.0,
    'bubing_base_defence' => 2.0,
    'qibing_base_defence' => 1.6,
    'gongbing_base_defence' => 1.4,
    'fangshi_base_defence' => 1.4,
    'bubing_base_troops' => 30.0,
    'qibing_base_troops' => 30.0,
    'gongbing_base_troops' => 20.0,
    'fangshi_base_troops' => 20.0
};
get(4)-> #{
    'exp' => 180,
    'reset_cost_item' => [
        102006001,
         8
    ],
    'reset_reward_items' => [
        [
            102008001,
             13
        ]
    ],
    'bubing_base_attack' => 6.0,
    'qibing_base_attack' => 6.6,
    'gongbing_base_attack' => 7.5,
    'fangshi_base_attack' => 7.5,
    'bubing_base_defence' => 3.0,
    'qibing_base_defence' => 2.4,
    'gongbing_base_defence' => 2.1,
    'fangshi_base_defence' => 2.1,
    'bubing_base_troops' => 45.0,
    'qibing_base_troops' => 45.0,
    'gongbing_base_troops' => 30.0,
    'fangshi_base_troops' => 30.0
};
get(5)-> #{
    'exp' => 230,
    'reset_cost_item' => [
        102006001,
         9
    ],
    'reset_reward_items' => [
        [
            102008001,
             14
        ]
    ],
    'bubing_base_attack' => 8.0,
    'qibing_base_attack' => 8.8,
    'gongbing_base_attack' => 10.0,
    'fangshi_base_attack' => 10.0,
    'bubing_base_defence' => 4.0,
    'qibing_base_defence' => 3.2,
    'gongbing_base_defence' => 2.8,
    'fangshi_base_defence' => 2.8,
    'bubing_base_troops' => 60.0,
    'qibing_base_troops' => 60.0,
    'gongbing_base_troops' => 40.0,
    'fangshi_base_troops' => 40.0
};
get(6)-> #{
    'exp' => 270,
    'reset_cost_item' => [
        102006001,
         10
    ],
    'reset_reward_items' => [
        [
            102008001,
             15
        ]
    ],
    'bubing_base_attack' => 10.0,
    'qibing_base_attack' => 11.0,
    'gongbing_base_attack' => 12.5,
    'fangshi_base_attack' => 12.5,
    'bubing_base_defence' => 5.0,
    'qibing_base_defence' => 4.0,
    'gongbing_base_defence' => 3.5,
    'fangshi_base_defence' => 3.5,
    'bubing_base_troops' => 75.0,
    'qibing_base_troops' => 75.0,
    'gongbing_base_troops' => 50.0,
    'fangshi_base_troops' => 50.0
};
get(7)-> #{
    'exp' => 255,
    'reset_cost_item' => [
        102006001,
         11
    ],
    'reset_reward_items' => [
        [
            102008001,
             16
        ]
    ],
    'bubing_base_attack' => 12.0,
    'qibing_base_attack' => 13.2,
    'gongbing_base_attack' => 15.0,
    'fangshi_base_attack' => 15.0,
    'bubing_base_defence' => 6.0,
    'qibing_base_defence' => 4.8,
    'gongbing_base_defence' => 4.2,
    'fangshi_base_defence' => 4.2,
    'bubing_base_troops' => 90.0,
    'qibing_base_troops' => 90.0,
    'gongbing_base_troops' => 60.0,
    'fangshi_base_troops' => 60.0
};
get(8)-> #{
    'exp' => 300,
    'reset_cost_item' => [
        102006001,
         12
    ],
    'reset_reward_items' => [
        [
            102008001,
             17
        ]
    ],
    'bubing_base_attack' => 14.0,
    'qibing_base_attack' => 15.4,
    'gongbing_base_attack' => 17.5,
    'fangshi_base_attack' => 17.5,
    'bubing_base_defence' => 7.0,
    'qibing_base_defence' => 5.6,
    'gongbing_base_defence' => 4.9,
    'fangshi_base_defence' => 4.9,
    'bubing_base_troops' => 105.0,
    'qibing_base_troops' => 105.0,
    'gongbing_base_troops' => 70.0,
    'fangshi_base_troops' => 70.0
};
get(9)-> #{
    'exp' => 285,
    'reset_cost_item' => [
        102006001,
         13
    ],
    'reset_reward_items' => [
        [
            102008001,
             18
        ]
    ],
    'bubing_base_attack' => 16.0,
    'qibing_base_attack' => 17.6,
    'gongbing_base_attack' => 20.0,
    'fangshi_base_attack' => 20.0,
    'bubing_base_defence' => 8.0,
    'qibing_base_defence' => 6.4,
    'gongbing_base_defence' => 5.6,
    'fangshi_base_defence' => 5.6,
    'bubing_base_troops' => 120.0,
    'qibing_base_troops' => 120.0,
    'gongbing_base_troops' => 80.0,
    'fangshi_base_troops' => 80.0
};
get(10)-> #{
    'exp' => 640,
    'reset_cost_item' => [
        102006001,
         14
    ],
    'reset_reward_items' => [
        [
            102008001,
             19
        ]
    ],
    'bubing_base_attack' => 18.0,
    'qibing_base_attack' => 19.8,
    'gongbing_base_attack' => 22.5,
    'fangshi_base_attack' => 22.5,
    'bubing_base_defence' => 9.0,
    'qibing_base_defence' => 7.2,
    'gongbing_base_defence' => 6.3,
    'fangshi_base_defence' => 6.3,
    'bubing_base_troops' => 135.0,
    'qibing_base_troops' => 135.0,
    'gongbing_base_troops' => 90.0,
    'fangshi_base_troops' => 90.0
};
get(11)-> #{
    'exp' => 660,
    'reset_cost_item' => [
        102006001,
         15
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             100
        ]
    ],
    'bubing_base_attack' => 20.0,
    'qibing_base_attack' => 22.0,
    'gongbing_base_attack' => 25.0,
    'fangshi_base_attack' => 25.0,
    'bubing_base_defence' => 10.0,
    'qibing_base_defence' => 8.0,
    'gongbing_base_defence' => 7.0,
    'fangshi_base_defence' => 7.0,
    'bubing_base_troops' => 150.0,
    'qibing_base_troops' => 150.0,
    'gongbing_base_troops' => 100.0,
    'fangshi_base_troops' => 100.0
};
get(12)-> #{
    'exp' => 680,
    'reset_cost_item' => [
        102006001,
         16
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             101
        ]
    ],
    'bubing_base_attack' => 22.0,
    'qibing_base_attack' => 24.2,
    'gongbing_base_attack' => 27.5,
    'fangshi_base_attack' => 27.5,
    'bubing_base_defence' => 11.0,
    'qibing_base_defence' => 8.8,
    'gongbing_base_defence' => 7.7,
    'fangshi_base_defence' => 7.7,
    'bubing_base_troops' => 165.0,
    'qibing_base_troops' => 165.0,
    'gongbing_base_troops' => 110.0,
    'fangshi_base_troops' => 110.0
};
get(13)-> #{
    'exp' => 700,
    'reset_cost_item' => [
        102006001,
         17
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             102
        ]
    ],
    'bubing_base_attack' => 24.0,
    'qibing_base_attack' => 26.4,
    'gongbing_base_attack' => 30.0,
    'fangshi_base_attack' => 30.0,
    'bubing_base_defence' => 12.0,
    'qibing_base_defence' => 9.6,
    'gongbing_base_defence' => 8.4,
    'fangshi_base_defence' => 8.4,
    'bubing_base_troops' => 180.0,
    'qibing_base_troops' => 180.0,
    'gongbing_base_troops' => 120.0,
    'fangshi_base_troops' => 120.0
};
get(14)-> #{
    'exp' => 720,
    'reset_cost_item' => [
        102006001,
         18
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             103
        ]
    ],
    'bubing_base_attack' => 26.0,
    'qibing_base_attack' => 28.6,
    'gongbing_base_attack' => 32.5,
    'fangshi_base_attack' => 32.5,
    'bubing_base_defence' => 13.0,
    'qibing_base_defence' => 10.4,
    'gongbing_base_defence' => 9.1,
    'fangshi_base_defence' => 9.1,
    'bubing_base_troops' => 195.0,
    'qibing_base_troops' => 195.0,
    'gongbing_base_troops' => 130.0,
    'fangshi_base_troops' => 130.0
};
get(15)-> #{
    'exp' => 740,
    'reset_cost_item' => [
        102006001,
         19
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             104
        ]
    ],
    'bubing_base_attack' => 28.0,
    'qibing_base_attack' => 30.8,
    'gongbing_base_attack' => 35.0,
    'fangshi_base_attack' => 35.0,
    'bubing_base_defence' => 14.0,
    'qibing_base_defence' => 11.2,
    'gongbing_base_defence' => 9.8,
    'fangshi_base_defence' => 9.8,
    'bubing_base_troops' => 210.0,
    'qibing_base_troops' => 210.0,
    'gongbing_base_troops' => 140.0,
    'fangshi_base_troops' => 140.0
};
get(16)-> #{
    'exp' => 760,
    'reset_cost_item' => [
        102006001,
         20
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             105
        ]
    ],
    'bubing_base_attack' => 30.0,
    'qibing_base_attack' => 33.0,
    'gongbing_base_attack' => 37.5,
    'fangshi_base_attack' => 37.5,
    'bubing_base_defence' => 15.0,
    'qibing_base_defence' => 12.0,
    'gongbing_base_defence' => 10.5,
    'fangshi_base_defence' => 10.5,
    'bubing_base_troops' => 225.0,
    'qibing_base_troops' => 225.0,
    'gongbing_base_troops' => 150.0,
    'fangshi_base_troops' => 150.0
};
get(17)-> #{
    'exp' => 780,
    'reset_cost_item' => [
        102006001,
         21
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             106
        ]
    ],
    'bubing_base_attack' => 32.0,
    'qibing_base_attack' => 35.2,
    'gongbing_base_attack' => 40.0,
    'fangshi_base_attack' => 40.0,
    'bubing_base_defence' => 16.0,
    'qibing_base_defence' => 12.8,
    'gongbing_base_defence' => 11.2,
    'fangshi_base_defence' => 11.2,
    'bubing_base_troops' => 240.0,
    'qibing_base_troops' => 240.0,
    'gongbing_base_troops' => 160.0,
    'fangshi_base_troops' => 160.0
};
get(18)-> #{
    'exp' => 800,
    'reset_cost_item' => [
        102006001,
         22
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             107
        ]
    ],
    'bubing_base_attack' => 34.0,
    'qibing_base_attack' => 37.4,
    'gongbing_base_attack' => 42.5,
    'fangshi_base_attack' => 42.5,
    'bubing_base_defence' => 17.0,
    'qibing_base_defence' => 13.6,
    'gongbing_base_defence' => 11.9,
    'fangshi_base_defence' => 11.9,
    'bubing_base_troops' => 255.0,
    'qibing_base_troops' => 255.0,
    'gongbing_base_troops' => 170.0,
    'fangshi_base_troops' => 170.0
};
get(19)-> #{
    'exp' => 820,
    'reset_cost_item' => [
        102006001,
         23
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             108
        ]
    ],
    'bubing_base_attack' => 36.0,
    'qibing_base_attack' => 39.6,
    'gongbing_base_attack' => 45.0,
    'fangshi_base_attack' => 45.0,
    'bubing_base_defence' => 18.0,
    'qibing_base_defence' => 14.4,
    'gongbing_base_defence' => 12.6,
    'fangshi_base_defence' => 12.6,
    'bubing_base_troops' => 270.0,
    'qibing_base_troops' => 270.0,
    'gongbing_base_troops' => 180.0,
    'fangshi_base_troops' => 180.0
};
get(20)-> #{
    'exp' => 1260,
    'reset_cost_item' => [
        102006001,
         24
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             109
        ]
    ],
    'bubing_base_attack' => 38.0,
    'qibing_base_attack' => 41.8,
    'gongbing_base_attack' => 47.5,
    'fangshi_base_attack' => 47.5,
    'bubing_base_defence' => 19.0,
    'qibing_base_defence' => 15.2,
    'gongbing_base_defence' => 13.3,
    'fangshi_base_defence' => 13.3,
    'bubing_base_troops' => 285.0,
    'qibing_base_troops' => 285.0,
    'gongbing_base_troops' => 190.0,
    'fangshi_base_troops' => 190.0
};
get(21)-> #{
    'exp' => 1290,
    'reset_cost_item' => [
        102006001,
         25
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             110
        ]
    ],
    'bubing_base_attack' => 40.0,
    'qibing_base_attack' => 44.0,
    'gongbing_base_attack' => 50.0,
    'fangshi_base_attack' => 50.0,
    'bubing_base_defence' => 20.0,
    'qibing_base_defence' => 16.0,
    'gongbing_base_defence' => 14.0,
    'fangshi_base_defence' => 14.0,
    'bubing_base_troops' => 300.0,
    'qibing_base_troops' => 300.0,
    'gongbing_base_troops' => 200.0,
    'fangshi_base_troops' => 200.0
};
get(22)-> #{
    'exp' => 1320,
    'reset_cost_item' => [
        102006001,
         26
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             111
        ]
    ],
    'bubing_base_attack' => 42.0,
    'qibing_base_attack' => 46.2,
    'gongbing_base_attack' => 52.5,
    'fangshi_base_attack' => 52.5,
    'bubing_base_defence' => 21.0,
    'qibing_base_defence' => 16.8,
    'gongbing_base_defence' => 14.7,
    'fangshi_base_defence' => 14.7,
    'bubing_base_troops' => 315.0,
    'qibing_base_troops' => 315.0,
    'gongbing_base_troops' => 210.0,
    'fangshi_base_troops' => 210.0
};
get(23)-> #{
    'exp' => 1350,
    'reset_cost_item' => [
        102006001,
         27
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             112
        ]
    ],
    'bubing_base_attack' => 44.0,
    'qibing_base_attack' => 48.4,
    'gongbing_base_attack' => 55.0,
    'fangshi_base_attack' => 55.0,
    'bubing_base_defence' => 22.0,
    'qibing_base_defence' => 17.6,
    'gongbing_base_defence' => 15.4,
    'fangshi_base_defence' => 15.4,
    'bubing_base_troops' => 330.0,
    'qibing_base_troops' => 330.0,
    'gongbing_base_troops' => 220.0,
    'fangshi_base_troops' => 220.0
};
get(24)-> #{
    'exp' => 1380,
    'reset_cost_item' => [
        102006001,
         28
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             113
        ]
    ],
    'bubing_base_attack' => 46.0,
    'qibing_base_attack' => 50.6,
    'gongbing_base_attack' => 57.5,
    'fangshi_base_attack' => 57.5,
    'bubing_base_defence' => 23.0,
    'qibing_base_defence' => 18.4,
    'gongbing_base_defence' => 16.1,
    'fangshi_base_defence' => 16.1,
    'bubing_base_troops' => 345.0,
    'qibing_base_troops' => 345.0,
    'gongbing_base_troops' => 230.0,
    'fangshi_base_troops' => 230.0
};
get(25)-> #{
    'exp' => 1710,
    'reset_cost_item' => [
        102006001,
         29
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             114
        ]
    ],
    'bubing_base_attack' => 48.0,
    'qibing_base_attack' => 52.8,
    'gongbing_base_attack' => 60.0,
    'fangshi_base_attack' => 60.0,
    'bubing_base_defence' => 24.0,
    'qibing_base_defence' => 19.2,
    'gongbing_base_defence' => 16.8,
    'fangshi_base_defence' => 16.8,
    'bubing_base_troops' => 360.0,
    'qibing_base_troops' => 360.0,
    'gongbing_base_troops' => 240.0,
    'fangshi_base_troops' => 240.0
};
get(26)-> #{
    'exp' => 1740,
    'reset_cost_item' => [
        102006001,
         30
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             115
        ]
    ],
    'bubing_base_attack' => 50.0,
    'qibing_base_attack' => 55.0,
    'gongbing_base_attack' => 62.5,
    'fangshi_base_attack' => 62.5,
    'bubing_base_defence' => 25.0,
    'qibing_base_defence' => 20.0,
    'gongbing_base_defence' => 17.5,
    'fangshi_base_defence' => 17.5,
    'bubing_base_troops' => 375.0,
    'qibing_base_troops' => 375.0,
    'gongbing_base_troops' => 250.0,
    'fangshi_base_troops' => 250.0
};
get(27)-> #{
    'exp' => 1770,
    'reset_cost_item' => [
        102006001,
         31
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             116
        ]
    ],
    'bubing_base_attack' => 52.0,
    'qibing_base_attack' => 57.2,
    'gongbing_base_attack' => 65.0,
    'fangshi_base_attack' => 65.0,
    'bubing_base_defence' => 26.0,
    'qibing_base_defence' => 20.8,
    'gongbing_base_defence' => 18.2,
    'fangshi_base_defence' => 18.2,
    'bubing_base_troops' => 390.0,
    'qibing_base_troops' => 390.0,
    'gongbing_base_troops' => 260.0,
    'fangshi_base_troops' => 260.0
};
get(28)-> #{
    'exp' => 1800,
    'reset_cost_item' => [
        102006001,
         32
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             117
        ]
    ],
    'bubing_base_attack' => 54.0,
    'qibing_base_attack' => 59.4,
    'gongbing_base_attack' => 67.5,
    'fangshi_base_attack' => 67.5,
    'bubing_base_defence' => 27.0,
    'qibing_base_defence' => 21.6,
    'gongbing_base_defence' => 18.9,
    'fangshi_base_defence' => 18.9,
    'bubing_base_troops' => 405.0,
    'qibing_base_troops' => 405.0,
    'gongbing_base_troops' => 270.0,
    'fangshi_base_troops' => 270.0
};
get(29)-> #{
    'exp' => 1830,
    'reset_cost_item' => [
        102006001,
         33
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             118
        ]
    ],
    'bubing_base_attack' => 56.0,
    'qibing_base_attack' => 61.6,
    'gongbing_base_attack' => 70.0,
    'fangshi_base_attack' => 70.0,
    'bubing_base_defence' => 28.0,
    'qibing_base_defence' => 22.4,
    'gongbing_base_defence' => 19.6,
    'fangshi_base_defence' => 19.6,
    'bubing_base_troops' => 420.0,
    'qibing_base_troops' => 420.0,
    'gongbing_base_troops' => 280.0,
    'fangshi_base_troops' => 280.0
};
get(30)-> #{
    'exp' => 2480,
    'reset_cost_item' => [
        102006001,
         34
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             119
        ]
    ],
    'bubing_base_attack' => 58.0,
    'qibing_base_attack' => 63.8,
    'gongbing_base_attack' => 72.5,
    'fangshi_base_attack' => 72.5,
    'bubing_base_defence' => 29.0,
    'qibing_base_defence' => 23.2,
    'gongbing_base_defence' => 20.3,
    'fangshi_base_defence' => 20.3,
    'bubing_base_troops' => 435.0,
    'qibing_base_troops' => 435.0,
    'gongbing_base_troops' => 290.0,
    'fangshi_base_troops' => 290.0
};
get(31)-> #{
    'exp' => 2520,
    'reset_cost_item' => [
        102006001,
         35
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             120
        ]
    ],
    'bubing_base_attack' => 60.0,
    'qibing_base_attack' => 66.0,
    'gongbing_base_attack' => 75.0,
    'fangshi_base_attack' => 75.0,
    'bubing_base_defence' => 30.0,
    'qibing_base_defence' => 24.0,
    'gongbing_base_defence' => 21.0,
    'fangshi_base_defence' => 21.0,
    'bubing_base_troops' => 450.0,
    'qibing_base_troops' => 450.0,
    'gongbing_base_troops' => 300.0,
    'fangshi_base_troops' => 300.0
};
get(32)-> #{
    'exp' => 2560,
    'reset_cost_item' => [
        102006001,
         36
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             121
        ]
    ],
    'bubing_base_attack' => 62.0,
    'qibing_base_attack' => 68.2,
    'gongbing_base_attack' => 77.5,
    'fangshi_base_attack' => 77.5,
    'bubing_base_defence' => 31.0,
    'qibing_base_defence' => 24.8,
    'gongbing_base_defence' => 21.7,
    'fangshi_base_defence' => 21.7,
    'bubing_base_troops' => 465.0,
    'qibing_base_troops' => 465.0,
    'gongbing_base_troops' => 310.0,
    'fangshi_base_troops' => 310.0
};
get(33)-> #{
    'exp' => 2600,
    'reset_cost_item' => [
        102006001,
         37
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             122
        ]
    ],
    'bubing_base_attack' => 64.0,
    'qibing_base_attack' => 70.4,
    'gongbing_base_attack' => 80.0,
    'fangshi_base_attack' => 80.0,
    'bubing_base_defence' => 32.0,
    'qibing_base_defence' => 25.6,
    'gongbing_base_defence' => 22.4,
    'fangshi_base_defence' => 22.4,
    'bubing_base_troops' => 480.0,
    'qibing_base_troops' => 480.0,
    'gongbing_base_troops' => 320.0,
    'fangshi_base_troops' => 320.0
};
get(34)-> #{
    'exp' => 2640,
    'reset_cost_item' => [
        102006001,
         38
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             123
        ]
    ],
    'bubing_base_attack' => 66.0,
    'qibing_base_attack' => 72.6,
    'gongbing_base_attack' => 82.5,
    'fangshi_base_attack' => 82.5,
    'bubing_base_defence' => 33.0,
    'qibing_base_defence' => 26.4,
    'gongbing_base_defence' => 23.1,
    'fangshi_base_defence' => 23.1,
    'bubing_base_troops' => 495.0,
    'qibing_base_troops' => 495.0,
    'gongbing_base_troops' => 330.0,
    'fangshi_base_troops' => 330.0
};
get(35)-> #{
    'exp' => 3080,
    'reset_cost_item' => [
        102006001,
         39
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             124
        ]
    ],
    'bubing_base_attack' => 68.0,
    'qibing_base_attack' => 74.8,
    'gongbing_base_attack' => 85.0,
    'fangshi_base_attack' => 85.0,
    'bubing_base_defence' => 34.0,
    'qibing_base_defence' => 27.2,
    'gongbing_base_defence' => 23.8,
    'fangshi_base_defence' => 23.8,
    'bubing_base_troops' => 510.0,
    'qibing_base_troops' => 510.0,
    'gongbing_base_troops' => 340.0,
    'fangshi_base_troops' => 340.0
};
get(36)-> #{
    'exp' => 3120,
    'reset_cost_item' => [
        102006001,
         40
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             125
        ]
    ],
    'bubing_base_attack' => 70.0,
    'qibing_base_attack' => 77.0,
    'gongbing_base_attack' => 87.5,
    'fangshi_base_attack' => 87.5,
    'bubing_base_defence' => 35.0,
    'qibing_base_defence' => 28.0,
    'gongbing_base_defence' => 24.5,
    'fangshi_base_defence' => 24.5,
    'bubing_base_troops' => 525.0,
    'qibing_base_troops' => 525.0,
    'gongbing_base_troops' => 350.0,
    'fangshi_base_troops' => 350.0
};
get(37)-> #{
    'exp' => 3160,
    'reset_cost_item' => [
        102006001,
         41
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             126
        ]
    ],
    'bubing_base_attack' => 72.0,
    'qibing_base_attack' => 79.2,
    'gongbing_base_attack' => 90.0,
    'fangshi_base_attack' => 90.0,
    'bubing_base_defence' => 36.0,
    'qibing_base_defence' => 28.8,
    'gongbing_base_defence' => 25.2,
    'fangshi_base_defence' => 25.2,
    'bubing_base_troops' => 540.0,
    'qibing_base_troops' => 540.0,
    'gongbing_base_troops' => 360.0,
    'fangshi_base_troops' => 360.0
};
get(38)-> #{
    'exp' => 3200,
    'reset_cost_item' => [
        102006001,
         42
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             127
        ]
    ],
    'bubing_base_attack' => 74.0,
    'qibing_base_attack' => 81.4,
    'gongbing_base_attack' => 92.5,
    'fangshi_base_attack' => 92.5,
    'bubing_base_defence' => 37.0,
    'qibing_base_defence' => 29.6,
    'gongbing_base_defence' => 25.9,
    'fangshi_base_defence' => 25.9,
    'bubing_base_troops' => 555.0,
    'qibing_base_troops' => 555.0,
    'gongbing_base_troops' => 370.0,
    'fangshi_base_troops' => 370.0
};
get(39)-> #{
    'exp' => 3240,
    'reset_cost_item' => [
        102006001,
         43
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             128
        ]
    ],
    'bubing_base_attack' => 76.0,
    'qibing_base_attack' => 83.6,
    'gongbing_base_attack' => 95.0,
    'fangshi_base_attack' => 95.0,
    'bubing_base_defence' => 38.0,
    'qibing_base_defence' => 30.4,
    'gongbing_base_defence' => 26.6,
    'fangshi_base_defence' => 26.6,
    'bubing_base_troops' => 570.0,
    'qibing_base_troops' => 570.0,
    'gongbing_base_troops' => 380.0,
    'fangshi_base_troops' => 380.0
};
get(40)-> #{
    'exp' => 4100,
    'reset_cost_item' => [
        102006001,
         44
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             129
        ]
    ],
    'bubing_base_attack' => 78.0,
    'qibing_base_attack' => 85.8,
    'gongbing_base_attack' => 97.5,
    'fangshi_base_attack' => 97.5,
    'bubing_base_defence' => 39.0,
    'qibing_base_defence' => 31.2,
    'gongbing_base_defence' => 27.3,
    'fangshi_base_defence' => 27.3,
    'bubing_base_troops' => 585.0,
    'qibing_base_troops' => 585.0,
    'gongbing_base_troops' => 390.0,
    'fangshi_base_troops' => 390.0
};
get(41)-> #{
    'exp' => 4150,
    'reset_cost_item' => [
        102006001,
         45
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             130
        ]
    ],
    'bubing_base_attack' => 80.0,
    'qibing_base_attack' => 88.0,
    'gongbing_base_attack' => 100.0,
    'fangshi_base_attack' => 100.0,
    'bubing_base_defence' => 40.0,
    'qibing_base_defence' => 32.0,
    'gongbing_base_defence' => 28.0,
    'fangshi_base_defence' => 28.0,
    'bubing_base_troops' => 600.0,
    'qibing_base_troops' => 600.0,
    'gongbing_base_troops' => 400.0,
    'fangshi_base_troops' => 400.0
};
get(42)-> #{
    'exp' => 4200,
    'reset_cost_item' => [
        102006001,
         46
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             131
        ]
    ],
    'bubing_base_attack' => 82.0,
    'qibing_base_attack' => 90.2,
    'gongbing_base_attack' => 102.5,
    'fangshi_base_attack' => 102.5,
    'bubing_base_defence' => 41.0,
    'qibing_base_defence' => 32.8,
    'gongbing_base_defence' => 28.7,
    'fangshi_base_defence' => 28.7,
    'bubing_base_troops' => 615.0,
    'qibing_base_troops' => 615.0,
    'gongbing_base_troops' => 410.0,
    'fangshi_base_troops' => 410.0
};
get(43)-> #{
    'exp' => 4250,
    'reset_cost_item' => [
        102006001,
         47
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             132
        ]
    ],
    'bubing_base_attack' => 84.0,
    'qibing_base_attack' => 92.4,
    'gongbing_base_attack' => 105.0,
    'fangshi_base_attack' => 105.0,
    'bubing_base_defence' => 42.0,
    'qibing_base_defence' => 33.6,
    'gongbing_base_defence' => 29.4,
    'fangshi_base_defence' => 29.4,
    'bubing_base_troops' => 630.0,
    'qibing_base_troops' => 630.0,
    'gongbing_base_troops' => 420.0,
    'fangshi_base_troops' => 420.0
};
get(44)-> #{
    'exp' => 4300,
    'reset_cost_item' => [
        102006001,
         48
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             133
        ]
    ],
    'bubing_base_attack' => 86.0,
    'qibing_base_attack' => 94.6,
    'gongbing_base_attack' => 107.5,
    'fangshi_base_attack' => 107.5,
    'bubing_base_defence' => 43.0,
    'qibing_base_defence' => 34.4,
    'gongbing_base_defence' => 30.1,
    'fangshi_base_defence' => 30.1,
    'bubing_base_troops' => 645.0,
    'qibing_base_troops' => 645.0,
    'gongbing_base_troops' => 430.0,
    'fangshi_base_troops' => 430.0
};
get(45)-> #{
    'exp' => 4850,
    'reset_cost_item' => [
        102006001,
         49
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             134
        ]
    ],
    'bubing_base_attack' => 88.0,
    'qibing_base_attack' => 96.8,
    'gongbing_base_attack' => 110.0,
    'fangshi_base_attack' => 110.0,
    'bubing_base_defence' => 44.0,
    'qibing_base_defence' => 35.2,
    'gongbing_base_defence' => 30.8,
    'fangshi_base_defence' => 30.8,
    'bubing_base_troops' => 660.0,
    'qibing_base_troops' => 660.0,
    'gongbing_base_troops' => 440.0,
    'fangshi_base_troops' => 440.0
};
get(46)-> #{
    'exp' => 4900,
    'reset_cost_item' => [
        102006001,
         50
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             135
        ]
    ],
    'bubing_base_attack' => 90.0,
    'qibing_base_attack' => 99.0,
    'gongbing_base_attack' => 112.5,
    'fangshi_base_attack' => 112.5,
    'bubing_base_defence' => 45.0,
    'qibing_base_defence' => 36.0,
    'gongbing_base_defence' => 31.5,
    'fangshi_base_defence' => 31.5,
    'bubing_base_troops' => 675.0,
    'qibing_base_troops' => 675.0,
    'gongbing_base_troops' => 450.0,
    'fangshi_base_troops' => 450.0
};
get(47)-> #{
    'exp' => 4950,
    'reset_cost_item' => [
        102006001,
         51
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             136
        ]
    ],
    'bubing_base_attack' => 92.0,
    'qibing_base_attack' => 101.2,
    'gongbing_base_attack' => 115.0,
    'fangshi_base_attack' => 115.0,
    'bubing_base_defence' => 46.0,
    'qibing_base_defence' => 36.8,
    'gongbing_base_defence' => 32.2,
    'fangshi_base_defence' => 32.2,
    'bubing_base_troops' => 690.0,
    'qibing_base_troops' => 690.0,
    'gongbing_base_troops' => 460.0,
    'fangshi_base_troops' => 460.0
};
get(48)-> #{
    'exp' => 5000,
    'reset_cost_item' => [
        102006001,
         52
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             137
        ]
    ],
    'bubing_base_attack' => 94.0,
    'qibing_base_attack' => 103.4,
    'gongbing_base_attack' => 117.5,
    'fangshi_base_attack' => 117.5,
    'bubing_base_defence' => 47.0,
    'qibing_base_defence' => 37.6,
    'gongbing_base_defence' => 32.9,
    'fangshi_base_defence' => 32.9,
    'bubing_base_troops' => 705.0,
    'qibing_base_troops' => 705.0,
    'gongbing_base_troops' => 470.0,
    'fangshi_base_troops' => 470.0
};
get(49)-> #{
    'exp' => 5050,
    'reset_cost_item' => [
        102006001,
         53
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             138
        ]
    ],
    'bubing_base_attack' => 96.0,
    'qibing_base_attack' => 105.6,
    'gongbing_base_attack' => 120.0,
    'fangshi_base_attack' => 120.0,
    'bubing_base_defence' => 48.0,
    'qibing_base_defence' => 38.4,
    'gongbing_base_defence' => 33.6,
    'fangshi_base_defence' => 33.6,
    'bubing_base_troops' => 720.0,
    'qibing_base_troops' => 720.0,
    'gongbing_base_troops' => 480.0,
    'fangshi_base_troops' => 480.0
};
get(50)-> #{
    'exp' => 7140,
    'reset_cost_item' => [
        102006001,
         54
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             139
        ]
    ],
    'bubing_base_attack' => 98.0,
    'qibing_base_attack' => 107.8,
    'gongbing_base_attack' => 122.5,
    'fangshi_base_attack' => 122.5,
    'bubing_base_defence' => 49.0,
    'qibing_base_defence' => 39.2,
    'gongbing_base_defence' => 34.3,
    'fangshi_base_defence' => 34.3,
    'bubing_base_troops' => 735.0,
    'qibing_base_troops' => 735.0,
    'gongbing_base_troops' => 490.0,
    'fangshi_base_troops' => 490.0
};
get(51)-> #{
    'exp' => 7210,
    'reset_cost_item' => [
        102006001,
         55
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             140
        ]
    ],
    'bubing_base_attack' => 102.0,
    'qibing_base_attack' => 112.2,
    'gongbing_base_attack' => 127.5,
    'fangshi_base_attack' => 127.5,
    'bubing_base_defence' => 51.0,
    'qibing_base_defence' => 40.8,
    'gongbing_base_defence' => 35.7,
    'fangshi_base_defence' => 35.7,
    'bubing_base_troops' => 755.0,
    'qibing_base_troops' => 755.0,
    'gongbing_base_troops' => 505.0,
    'fangshi_base_troops' => 505.0
};
get(52)-> #{
    'exp' => 7280,
    'reset_cost_item' => [
        102006001,
         56
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             141
        ]
    ],
    'bubing_base_attack' => 106.0,
    'qibing_base_attack' => 116.6,
    'gongbing_base_attack' => 132.5,
    'fangshi_base_attack' => 132.5,
    'bubing_base_defence' => 53.0,
    'qibing_base_defence' => 42.4,
    'gongbing_base_defence' => 37.1,
    'fangshi_base_defence' => 37.1,
    'bubing_base_troops' => 775.0,
    'qibing_base_troops' => 775.0,
    'gongbing_base_troops' => 520.0,
    'fangshi_base_troops' => 520.0
};
get(53)-> #{
    'exp' => 7350,
    'reset_cost_item' => [
        102006001,
         57
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             142
        ]
    ],
    'bubing_base_attack' => 110.0,
    'qibing_base_attack' => 121.0,
    'gongbing_base_attack' => 137.5,
    'fangshi_base_attack' => 137.5,
    'bubing_base_defence' => 55.0,
    'qibing_base_defence' => 44.0,
    'gongbing_base_defence' => 38.5,
    'fangshi_base_defence' => 38.5,
    'bubing_base_troops' => 795.0,
    'qibing_base_troops' => 795.0,
    'gongbing_base_troops' => 535.0,
    'fangshi_base_troops' => 535.0
};
get(54)-> #{
    'exp' => 7420,
    'reset_cost_item' => [
        102006001,
         58
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             143
        ]
    ],
    'bubing_base_attack' => 114.0,
    'qibing_base_attack' => 125.4,
    'gongbing_base_attack' => 142.5,
    'fangshi_base_attack' => 142.5,
    'bubing_base_defence' => 57.0,
    'qibing_base_defence' => 45.6,
    'gongbing_base_defence' => 39.9,
    'fangshi_base_defence' => 39.9,
    'bubing_base_troops' => 815.0,
    'qibing_base_troops' => 815.0,
    'gongbing_base_troops' => 550.0,
    'fangshi_base_troops' => 550.0
};
get(55)-> #{
    'exp' => 8190,
    'reset_cost_item' => [
        102006001,
         59
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             144
        ]
    ],
    'bubing_base_attack' => 118.0,
    'qibing_base_attack' => 129.8,
    'gongbing_base_attack' => 147.5,
    'fangshi_base_attack' => 147.5,
    'bubing_base_defence' => 59.0,
    'qibing_base_defence' => 47.2,
    'gongbing_base_defence' => 41.3,
    'fangshi_base_defence' => 41.3,
    'bubing_base_troops' => 835.0,
    'qibing_base_troops' => 835.0,
    'gongbing_base_troops' => 565.0,
    'fangshi_base_troops' => 565.0
};
get(56)-> #{
    'exp' => 8260,
    'reset_cost_item' => [
        102006001,
         60
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             145
        ]
    ],
    'bubing_base_attack' => 122.0,
    'qibing_base_attack' => 134.2,
    'gongbing_base_attack' => 152.5,
    'fangshi_base_attack' => 152.5,
    'bubing_base_defence' => 61.0,
    'qibing_base_defence' => 48.8,
    'gongbing_base_defence' => 42.7,
    'fangshi_base_defence' => 42.7,
    'bubing_base_troops' => 855.0,
    'qibing_base_troops' => 855.0,
    'gongbing_base_troops' => 580.0,
    'fangshi_base_troops' => 580.0
};
get(57)-> #{
    'exp' => 8330,
    'reset_cost_item' => [
        102006001,
         61
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             146
        ]
    ],
    'bubing_base_attack' => 126.0,
    'qibing_base_attack' => 138.6,
    'gongbing_base_attack' => 157.5,
    'fangshi_base_attack' => 157.5,
    'bubing_base_defence' => 63.0,
    'qibing_base_defence' => 50.4,
    'gongbing_base_defence' => 44.1,
    'fangshi_base_defence' => 44.1,
    'bubing_base_troops' => 875.0,
    'qibing_base_troops' => 875.0,
    'gongbing_base_troops' => 595.0,
    'fangshi_base_troops' => 595.0
};
get(58)-> #{
    'exp' => 8400,
    'reset_cost_item' => [
        102006001,
         62
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             147
        ]
    ],
    'bubing_base_attack' => 130.0,
    'qibing_base_attack' => 143.0,
    'gongbing_base_attack' => 162.5,
    'fangshi_base_attack' => 162.5,
    'bubing_base_defence' => 65.0,
    'qibing_base_defence' => 52.0,
    'gongbing_base_defence' => 45.5,
    'fangshi_base_defence' => 45.5,
    'bubing_base_troops' => 895.0,
    'qibing_base_troops' => 895.0,
    'gongbing_base_troops' => 610.0,
    'fangshi_base_troops' => 610.0
};
get(59)-> #{
    'exp' => 8470,
    'reset_cost_item' => [
        102006001,
         63
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             148
        ]
    ],
    'bubing_base_attack' => 134.0,
    'qibing_base_attack' => 147.4,
    'gongbing_base_attack' => 167.5,
    'fangshi_base_attack' => 167.5,
    'bubing_base_defence' => 67.0,
    'qibing_base_defence' => 53.6,
    'gongbing_base_defence' => 46.9,
    'fangshi_base_defence' => 46.9,
    'bubing_base_troops' => 915.0,
    'qibing_base_troops' => 915.0,
    'gongbing_base_troops' => 625.0,
    'fangshi_base_troops' => 625.0
};
get(60)-> #{
    'exp' => 8540,
    'reset_cost_item' => [
        102006001,
         64
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             149
        ]
    ],
    'bubing_base_attack' => 138.0,
    'qibing_base_attack' => 151.8,
    'gongbing_base_attack' => 172.5,
    'fangshi_base_attack' => 172.5,
    'bubing_base_defence' => 69.0,
    'qibing_base_defence' => 55.2,
    'gongbing_base_defence' => 48.3,
    'fangshi_base_defence' => 48.3,
    'bubing_base_troops' => 935.0,
    'qibing_base_troops' => 935.0,
    'gongbing_base_troops' => 640.0,
    'fangshi_base_troops' => 640.0
};
get(61)-> #{
    'exp' => 8610,
    'reset_cost_item' => [
        102006001,
         65
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             150
        ]
    ],
    'bubing_base_attack' => 142.0,
    'qibing_base_attack' => 156.2,
    'gongbing_base_attack' => 177.5,
    'fangshi_base_attack' => 177.5,
    'bubing_base_defence' => 71.0,
    'qibing_base_defence' => 56.8,
    'gongbing_base_defence' => 49.7,
    'fangshi_base_defence' => 49.7,
    'bubing_base_troops' => 955.0,
    'qibing_base_troops' => 955.0,
    'gongbing_base_troops' => 655.0,
    'fangshi_base_troops' => 655.0
};
get(62)-> #{
    'exp' => 8680,
    'reset_cost_item' => [
        102006001,
         66
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             151
        ]
    ],
    'bubing_base_attack' => 146.0,
    'qibing_base_attack' => 160.6,
    'gongbing_base_attack' => 182.5,
    'fangshi_base_attack' => 182.5,
    'bubing_base_defence' => 73.0,
    'qibing_base_defence' => 58.4,
    'gongbing_base_defence' => 51.1,
    'fangshi_base_defence' => 51.1,
    'bubing_base_troops' => 975.0,
    'qibing_base_troops' => 975.0,
    'gongbing_base_troops' => 670.0,
    'fangshi_base_troops' => 670.0
};
get(63)-> #{
    'exp' => 8750,
    'reset_cost_item' => [
        102006001,
         67
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             152
        ]
    ],
    'bubing_base_attack' => 150.0,
    'qibing_base_attack' => 165.0,
    'gongbing_base_attack' => 187.5,
    'fangshi_base_attack' => 187.5,
    'bubing_base_defence' => 75.0,
    'qibing_base_defence' => 60.0,
    'gongbing_base_defence' => 52.5,
    'fangshi_base_defence' => 52.5,
    'bubing_base_troops' => 995.0,
    'qibing_base_troops' => 995.0,
    'gongbing_base_troops' => 685.0,
    'fangshi_base_troops' => 685.0
};
get(64)-> #{
    'exp' => 8820,
    'reset_cost_item' => [
        102006001,
         68
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             153
        ]
    ],
    'bubing_base_attack' => 154.0,
    'qibing_base_attack' => 169.4,
    'gongbing_base_attack' => 192.5,
    'fangshi_base_attack' => 192.5,
    'bubing_base_defence' => 77.0,
    'qibing_base_defence' => 61.6,
    'gongbing_base_defence' => 53.9,
    'fangshi_base_defence' => 53.9,
    'bubing_base_troops' => 1015.0,
    'qibing_base_troops' => 1015.0,
    'gongbing_base_troops' => 700.0,
    'fangshi_base_troops' => 700.0
};
get(65)-> #{
    'exp' => 8890,
    'reset_cost_item' => [
        102006001,
         69
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             154
        ]
    ],
    'bubing_base_attack' => 158.0,
    'qibing_base_attack' => 173.8,
    'gongbing_base_attack' => 197.5,
    'fangshi_base_attack' => 197.5,
    'bubing_base_defence' => 79.0,
    'qibing_base_defence' => 63.2,
    'gongbing_base_defence' => 55.3,
    'fangshi_base_defence' => 55.3,
    'bubing_base_troops' => 1035.0,
    'qibing_base_troops' => 1035.0,
    'gongbing_base_troops' => 715.0,
    'fangshi_base_troops' => 715.0
};
get(66)-> #{
    'exp' => 8960,
    'reset_cost_item' => [
        102006001,
         70
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             155
        ]
    ],
    'bubing_base_attack' => 162.0,
    'qibing_base_attack' => 178.2,
    'gongbing_base_attack' => 202.5,
    'fangshi_base_attack' => 202.5,
    'bubing_base_defence' => 81.0,
    'qibing_base_defence' => 64.8,
    'gongbing_base_defence' => 56.7,
    'fangshi_base_defence' => 56.7,
    'bubing_base_troops' => 1055.0,
    'qibing_base_troops' => 1055.0,
    'gongbing_base_troops' => 730.0,
    'fangshi_base_troops' => 730.0
};
get(67)-> #{
    'exp' => 9030,
    'reset_cost_item' => [
        102006001,
         71
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             156
        ]
    ],
    'bubing_base_attack' => 166.0,
    'qibing_base_attack' => 182.6,
    'gongbing_base_attack' => 207.5,
    'fangshi_base_attack' => 207.5,
    'bubing_base_defence' => 83.0,
    'qibing_base_defence' => 66.4,
    'gongbing_base_defence' => 58.1,
    'fangshi_base_defence' => 58.1,
    'bubing_base_troops' => 1075.0,
    'qibing_base_troops' => 1075.0,
    'gongbing_base_troops' => 745.0,
    'fangshi_base_troops' => 745.0
};
get(68)-> #{
    'exp' => 9100,
    'reset_cost_item' => [
        102006001,
         72
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             157
        ]
    ],
    'bubing_base_attack' => 170.0,
    'qibing_base_attack' => 187.0,
    'gongbing_base_attack' => 212.5,
    'fangshi_base_attack' => 212.5,
    'bubing_base_defence' => 85.0,
    'qibing_base_defence' => 68.0,
    'gongbing_base_defence' => 59.5,
    'fangshi_base_defence' => 59.5,
    'bubing_base_troops' => 1095.0,
    'qibing_base_troops' => 1095.0,
    'gongbing_base_troops' => 760.0,
    'fangshi_base_troops' => 760.0
};
get(69)-> #{
    'exp' => 9170,
    'reset_cost_item' => [
        102006001,
         73
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             158
        ]
    ],
    'bubing_base_attack' => 174.0,
    'qibing_base_attack' => 191.4,
    'gongbing_base_attack' => 217.5,
    'fangshi_base_attack' => 217.5,
    'bubing_base_defence' => 87.0,
    'qibing_base_defence' => 69.6,
    'gongbing_base_defence' => 60.9,
    'fangshi_base_defence' => 60.9,
    'bubing_base_troops' => 1115.0,
    'qibing_base_troops' => 1115.0,
    'gongbing_base_troops' => 775.0,
    'fangshi_base_troops' => 775.0
};
get(70)-> #{
    'exp' => 9240,
    'reset_cost_item' => [
        102006001,
         74
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             159
        ]
    ],
    'bubing_base_attack' => 178.0,
    'qibing_base_attack' => 195.8,
    'gongbing_base_attack' => 222.5,
    'fangshi_base_attack' => 222.5,
    'bubing_base_defence' => 89.0,
    'qibing_base_defence' => 71.2,
    'gongbing_base_defence' => 62.3,
    'fangshi_base_defence' => 62.3,
    'bubing_base_troops' => 1135.0,
    'qibing_base_troops' => 1135.0,
    'gongbing_base_troops' => 790.0,
    'fangshi_base_troops' => 790.0
};
get(71)-> #{
    'exp' => 9310,
    'reset_cost_item' => [
        102006001,
         75
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             160
        ]
    ],
    'bubing_base_attack' => 182.0,
    'qibing_base_attack' => 200.2,
    'gongbing_base_attack' => 227.5,
    'fangshi_base_attack' => 227.5,
    'bubing_base_defence' => 91.0,
    'qibing_base_defence' => 72.8,
    'gongbing_base_defence' => 63.7,
    'fangshi_base_defence' => 63.7,
    'bubing_base_troops' => 1155.0,
    'qibing_base_troops' => 1155.0,
    'gongbing_base_troops' => 805.0,
    'fangshi_base_troops' => 805.0
};
get(72)-> #{
    'exp' => 9380,
    'reset_cost_item' => [
        102006001,
         76
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             161
        ]
    ],
    'bubing_base_attack' => 186.0,
    'qibing_base_attack' => 204.6,
    'gongbing_base_attack' => 232.5,
    'fangshi_base_attack' => 232.5,
    'bubing_base_defence' => 93.0,
    'qibing_base_defence' => 74.4,
    'gongbing_base_defence' => 65.1,
    'fangshi_base_defence' => 65.1,
    'bubing_base_troops' => 1175.0,
    'qibing_base_troops' => 1175.0,
    'gongbing_base_troops' => 820.0,
    'fangshi_base_troops' => 820.0
};
get(73)-> #{
    'exp' => 9450,
    'reset_cost_item' => [
        102006001,
         77
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             162
        ]
    ],
    'bubing_base_attack' => 190.0,
    'qibing_base_attack' => 209.0,
    'gongbing_base_attack' => 237.5,
    'fangshi_base_attack' => 237.5,
    'bubing_base_defence' => 95.0,
    'qibing_base_defence' => 76.0,
    'gongbing_base_defence' => 66.5,
    'fangshi_base_defence' => 66.5,
    'bubing_base_troops' => 1195.0,
    'qibing_base_troops' => 1195.0,
    'gongbing_base_troops' => 835.0,
    'fangshi_base_troops' => 835.0
};
get(74)-> #{
    'exp' => 9520,
    'reset_cost_item' => [
        102006001,
         78
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             163
        ]
    ],
    'bubing_base_attack' => 194.0,
    'qibing_base_attack' => 213.4,
    'gongbing_base_attack' => 242.5,
    'fangshi_base_attack' => 242.5,
    'bubing_base_defence' => 97.0,
    'qibing_base_defence' => 77.6,
    'gongbing_base_defence' => 67.9,
    'fangshi_base_defence' => 67.9,
    'bubing_base_troops' => 1215.0,
    'qibing_base_troops' => 1215.0,
    'gongbing_base_troops' => 850.0,
    'fangshi_base_troops' => 850.0
};
get(75)-> #{
    'exp' => 9590,
    'reset_cost_item' => [
        102006001,
         79
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             164
        ]
    ],
    'bubing_base_attack' => 198.0,
    'qibing_base_attack' => 217.8,
    'gongbing_base_attack' => 247.5,
    'fangshi_base_attack' => 247.5,
    'bubing_base_defence' => 99.0,
    'qibing_base_defence' => 79.2,
    'gongbing_base_defence' => 69.3,
    'fangshi_base_defence' => 69.3,
    'bubing_base_troops' => 1235.0,
    'qibing_base_troops' => 1235.0,
    'gongbing_base_troops' => 865.0,
    'fangshi_base_troops' => 865.0
};
get(76)-> #{
    'exp' => 9660,
    'reset_cost_item' => [
        102006001,
         80
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             165
        ]
    ],
    'bubing_base_attack' => 202.0,
    'qibing_base_attack' => 222.2,
    'gongbing_base_attack' => 252.5,
    'fangshi_base_attack' => 252.5,
    'bubing_base_defence' => 101.0,
    'qibing_base_defence' => 80.8,
    'gongbing_base_defence' => 70.7,
    'fangshi_base_defence' => 70.7,
    'bubing_base_troops' => 1255.0,
    'qibing_base_troops' => 1255.0,
    'gongbing_base_troops' => 880.0,
    'fangshi_base_troops' => 880.0
};
get(77)-> #{
    'exp' => 9730,
    'reset_cost_item' => [
        102006001,
         81
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             166
        ]
    ],
    'bubing_base_attack' => 206.0,
    'qibing_base_attack' => 226.6,
    'gongbing_base_attack' => 257.5,
    'fangshi_base_attack' => 257.5,
    'bubing_base_defence' => 103.0,
    'qibing_base_defence' => 82.4,
    'gongbing_base_defence' => 72.1,
    'fangshi_base_defence' => 72.1,
    'bubing_base_troops' => 1275.0,
    'qibing_base_troops' => 1275.0,
    'gongbing_base_troops' => 895.0,
    'fangshi_base_troops' => 895.0
};
get(78)-> #{
    'exp' => 9800,
    'reset_cost_item' => [
        102006001,
         82
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             167
        ]
    ],
    'bubing_base_attack' => 210.0,
    'qibing_base_attack' => 231.0,
    'gongbing_base_attack' => 262.5,
    'fangshi_base_attack' => 262.5,
    'bubing_base_defence' => 105.0,
    'qibing_base_defence' => 84.0,
    'gongbing_base_defence' => 73.5,
    'fangshi_base_defence' => 73.5,
    'bubing_base_troops' => 1295.0,
    'qibing_base_troops' => 1295.0,
    'gongbing_base_troops' => 910.0,
    'fangshi_base_troops' => 910.0
};
get(79)-> #{
    'exp' => 9870,
    'reset_cost_item' => [
        102006001,
         83
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             168
        ]
    ],
    'bubing_base_attack' => 214.0,
    'qibing_base_attack' => 235.4,
    'gongbing_base_attack' => 267.5,
    'fangshi_base_attack' => 267.5,
    'bubing_base_defence' => 107.0,
    'qibing_base_defence' => 85.6,
    'gongbing_base_defence' => 74.9,
    'fangshi_base_defence' => 74.9,
    'bubing_base_troops' => 1315.0,
    'qibing_base_troops' => 1315.0,
    'gongbing_base_troops' => 925.0,
    'fangshi_base_troops' => 925.0
};
get(80)-> #{
    'exp' => 9940,
    'reset_cost_item' => [
        102006001,
         84
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             169
        ]
    ],
    'bubing_base_attack' => 218.0,
    'qibing_base_attack' => 239.8,
    'gongbing_base_attack' => 272.5,
    'fangshi_base_attack' => 272.5,
    'bubing_base_defence' => 109.0,
    'qibing_base_defence' => 87.1999999999999,
    'gongbing_base_defence' => 76.3,
    'fangshi_base_defence' => 76.3,
    'bubing_base_troops' => 1335.0,
    'qibing_base_troops' => 1335.0,
    'gongbing_base_troops' => 940.0,
    'fangshi_base_troops' => 940.0
};
get(81)-> #{
    'exp' => 12380,
    'reset_cost_item' => [
        102006001,
         85
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             170
        ]
    ],
    'bubing_base_attack' => 222.0,
    'qibing_base_attack' => 244.2,
    'gongbing_base_attack' => 277.5,
    'fangshi_base_attack' => 277.5,
    'bubing_base_defence' => 111.0,
    'qibing_base_defence' => 88.7999999999999,
    'gongbing_base_defence' => 77.7,
    'fangshi_base_defence' => 77.7,
    'bubing_base_troops' => 1355.0,
    'qibing_base_troops' => 1355.0,
    'gongbing_base_troops' => 955.0,
    'fangshi_base_troops' => 955.0
};
get(82)-> #{
    'exp' => 12470,
    'reset_cost_item' => [
        102006001,
         86
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             171
        ]
    ],
    'bubing_base_attack' => 226.0,
    'qibing_base_attack' => 248.6,
    'gongbing_base_attack' => 282.5,
    'fangshi_base_attack' => 282.5,
    'bubing_base_defence' => 113.0,
    'qibing_base_defence' => 90.3999999999999,
    'gongbing_base_defence' => 79.1,
    'fangshi_base_defence' => 79.1,
    'bubing_base_troops' => 1375.0,
    'qibing_base_troops' => 1375.0,
    'gongbing_base_troops' => 970.0,
    'fangshi_base_troops' => 970.0
};
get(83)-> #{
    'exp' => 12560,
    'reset_cost_item' => [
        102006001,
         87
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             172
        ]
    ],
    'bubing_base_attack' => 230.0,
    'qibing_base_attack' => 253.0,
    'gongbing_base_attack' => 287.5,
    'fangshi_base_attack' => 287.5,
    'bubing_base_defence' => 115.0,
    'qibing_base_defence' => 91.9999999999999,
    'gongbing_base_defence' => 80.5,
    'fangshi_base_defence' => 80.5,
    'bubing_base_troops' => 1395.0,
    'qibing_base_troops' => 1395.0,
    'gongbing_base_troops' => 985.0,
    'fangshi_base_troops' => 985.0
};
get(84)-> #{
    'exp' => 12650,
    'reset_cost_item' => [
        102006001,
         88
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             173
        ]
    ],
    'bubing_base_attack' => 234.0,
    'qibing_base_attack' => 257.4,
    'gongbing_base_attack' => 292.5,
    'fangshi_base_attack' => 292.5,
    'bubing_base_defence' => 117.0,
    'qibing_base_defence' => 93.5999999999999,
    'gongbing_base_defence' => 81.9,
    'fangshi_base_defence' => 81.9,
    'bubing_base_troops' => 1415.0,
    'qibing_base_troops' => 1415.0,
    'gongbing_base_troops' => 1000.0,
    'fangshi_base_troops' => 1000.0
};
get(85)-> #{
    'exp' => 12740,
    'reset_cost_item' => [
        102006001,
         89
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             174
        ]
    ],
    'bubing_base_attack' => 238.0,
    'qibing_base_attack' => 261.8,
    'gongbing_base_attack' => 297.5,
    'fangshi_base_attack' => 297.5,
    'bubing_base_defence' => 119.0,
    'qibing_base_defence' => 95.1999999999999,
    'gongbing_base_defence' => 83.3,
    'fangshi_base_defence' => 83.3,
    'bubing_base_troops' => 1435.0,
    'qibing_base_troops' => 1435.0,
    'gongbing_base_troops' => 1015.0,
    'fangshi_base_troops' => 1015.0
};
get(86)-> #{
    'exp' => 12830,
    'reset_cost_item' => [
        102006001,
         90
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             175
        ]
    ],
    'bubing_base_attack' => 242.0,
    'qibing_base_attack' => 266.2,
    'gongbing_base_attack' => 302.5,
    'fangshi_base_attack' => 302.5,
    'bubing_base_defence' => 121.0,
    'qibing_base_defence' => 96.7999999999999,
    'gongbing_base_defence' => 84.7,
    'fangshi_base_defence' => 84.7,
    'bubing_base_troops' => 1455.0,
    'qibing_base_troops' => 1455.0,
    'gongbing_base_troops' => 1030.0,
    'fangshi_base_troops' => 1030.0
};
get(87)-> #{
    'exp' => 12920,
    'reset_cost_item' => [
        102006001,
         91
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             176
        ]
    ],
    'bubing_base_attack' => 246.0,
    'qibing_base_attack' => 270.6,
    'gongbing_base_attack' => 307.5,
    'fangshi_base_attack' => 307.5,
    'bubing_base_defence' => 123.0,
    'qibing_base_defence' => 98.3999999999999,
    'gongbing_base_defence' => 86.1000000000001,
    'fangshi_base_defence' => 86.1000000000001,
    'bubing_base_troops' => 1475.0,
    'qibing_base_troops' => 1475.0,
    'gongbing_base_troops' => 1045.0,
    'fangshi_base_troops' => 1045.0
};
get(88)-> #{
    'exp' => 13010,
    'reset_cost_item' => [
        102006001,
         92
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             177
        ]
    ],
    'bubing_base_attack' => 250.0,
    'qibing_base_attack' => 275.0,
    'gongbing_base_attack' => 312.5,
    'fangshi_base_attack' => 312.5,
    'bubing_base_defence' => 125.0,
    'qibing_base_defence' => 99.9999999999999,
    'gongbing_base_defence' => 87.5000000000001,
    'fangshi_base_defence' => 87.5000000000001,
    'bubing_base_troops' => 1495.0,
    'qibing_base_troops' => 1495.0,
    'gongbing_base_troops' => 1060.0,
    'fangshi_base_troops' => 1060.0
};
get(89)-> #{
    'exp' => 13100,
    'reset_cost_item' => [
        102006001,
         93
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             178
        ]
    ],
    'bubing_base_attack' => 254.0,
    'qibing_base_attack' => 279.4,
    'gongbing_base_attack' => 317.5,
    'fangshi_base_attack' => 317.5,
    'bubing_base_defence' => 127.0,
    'qibing_base_defence' => 101.6,
    'gongbing_base_defence' => 88.9000000000001,
    'fangshi_base_defence' => 88.9000000000001,
    'bubing_base_troops' => 1515.0,
    'qibing_base_troops' => 1515.0,
    'gongbing_base_troops' => 1075.0,
    'fangshi_base_troops' => 1075.0
};
get(90)-> #{
    'exp' => 100000,
    'reset_cost_item' => [
        102006001,
         94
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             179
        ]
    ],
    'bubing_base_attack' => 258.0,
    'qibing_base_attack' => 283.8,
    'gongbing_base_attack' => 322.5,
    'fangshi_base_attack' => 322.5,
    'bubing_base_defence' => 129.0,
    'qibing_base_defence' => 103.2,
    'gongbing_base_defence' => 90.3000000000001,
    'fangshi_base_defence' => 90.3000000000001,
    'bubing_base_troops' => 1535.0,
    'qibing_base_troops' => 1535.0,
    'gongbing_base_troops' => 1090.0,
    'fangshi_base_troops' => 1090.0
};
get(91)-> #{
    'exp' => 105000,
    'reset_cost_item' => [
        102006001,
         95
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             180
        ]
    ],
    'bubing_base_attack' => 262.0,
    'qibing_base_attack' => 288.2,
    'gongbing_base_attack' => 327.5,
    'fangshi_base_attack' => 327.5,
    'bubing_base_defence' => 131.0,
    'qibing_base_defence' => 104.8,
    'gongbing_base_defence' => 91.7000000000001,
    'fangshi_base_defence' => 91.7000000000001,
    'bubing_base_troops' => 1555.0,
    'qibing_base_troops' => 1555.0,
    'gongbing_base_troops' => 1105.0,
    'fangshi_base_troops' => 1105.0
};
get(92)-> #{
    'exp' => 110000,
    'reset_cost_item' => [
        102006001,
         96
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             181
        ]
    ],
    'bubing_base_attack' => 266.0,
    'qibing_base_attack' => 292.6,
    'gongbing_base_attack' => 332.5,
    'fangshi_base_attack' => 332.5,
    'bubing_base_defence' => 133.0,
    'qibing_base_defence' => 106.4,
    'gongbing_base_defence' => 93.1000000000001,
    'fangshi_base_defence' => 93.1000000000001,
    'bubing_base_troops' => 1575.0,
    'qibing_base_troops' => 1575.0,
    'gongbing_base_troops' => 1120.0,
    'fangshi_base_troops' => 1120.0
};
get(93)-> #{
    'exp' => 115000,
    'reset_cost_item' => [
        102006001,
         97
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             182
        ]
    ],
    'bubing_base_attack' => 270.0,
    'qibing_base_attack' => 297.0,
    'gongbing_base_attack' => 337.5,
    'fangshi_base_attack' => 337.5,
    'bubing_base_defence' => 135.0,
    'qibing_base_defence' => 108.0,
    'gongbing_base_defence' => 94.5000000000001,
    'fangshi_base_defence' => 94.5000000000001,
    'bubing_base_troops' => 1595.0,
    'qibing_base_troops' => 1595.0,
    'gongbing_base_troops' => 1135.0,
    'fangshi_base_troops' => 1135.0
};
get(94)-> #{
    'exp' => 120000,
    'reset_cost_item' => [
        102006001,
         98
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             183
        ]
    ],
    'bubing_base_attack' => 274.0,
    'qibing_base_attack' => 301.4,
    'gongbing_base_attack' => 342.5,
    'fangshi_base_attack' => 342.5,
    'bubing_base_defence' => 137.0,
    'qibing_base_defence' => 109.6,
    'gongbing_base_defence' => 95.9000000000001,
    'fangshi_base_defence' => 95.9000000000001,
    'bubing_base_troops' => 1615.0,
    'qibing_base_troops' => 1615.0,
    'gongbing_base_troops' => 1150.0,
    'fangshi_base_troops' => 1150.0
};
get(95)-> #{
    'exp' => 125000,
    'reset_cost_item' => [
        102006001,
         99
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             184
        ]
    ],
    'bubing_base_attack' => 278.0,
    'qibing_base_attack' => 305.8,
    'gongbing_base_attack' => 347.5,
    'fangshi_base_attack' => 347.5,
    'bubing_base_defence' => 139.0,
    'qibing_base_defence' => 111.2,
    'gongbing_base_defence' => 97.3000000000001,
    'fangshi_base_defence' => 97.3000000000001,
    'bubing_base_troops' => 1635.0,
    'qibing_base_troops' => 1635.0,
    'gongbing_base_troops' => 1165.0,
    'fangshi_base_troops' => 1165.0
};
get(96)-> #{
    'exp' => 130000,
    'reset_cost_item' => [
        102006001,
         100
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             185
        ]
    ],
    'bubing_base_attack' => 282.0,
    'qibing_base_attack' => 310.2,
    'gongbing_base_attack' => 352.5,
    'fangshi_base_attack' => 352.5,
    'bubing_base_defence' => 141.0,
    'qibing_base_defence' => 112.8,
    'gongbing_base_defence' => 98.7000000000001,
    'fangshi_base_defence' => 98.7000000000001,
    'bubing_base_troops' => 1655.0,
    'qibing_base_troops' => 1655.0,
    'gongbing_base_troops' => 1180.0,
    'fangshi_base_troops' => 1180.0
};
get(97)-> #{
    'exp' => 135000,
    'reset_cost_item' => [
        102006001,
         101
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             186
        ]
    ],
    'bubing_base_attack' => 286.0,
    'qibing_base_attack' => 314.6,
    'gongbing_base_attack' => 357.5,
    'fangshi_base_attack' => 357.5,
    'bubing_base_defence' => 143.0,
    'qibing_base_defence' => 114.4,
    'gongbing_base_defence' => 100.1,
    'fangshi_base_defence' => 100.1,
    'bubing_base_troops' => 1675.0,
    'qibing_base_troops' => 1675.0,
    'gongbing_base_troops' => 1195.0,
    'fangshi_base_troops' => 1195.0
};
get(98)-> #{
    'exp' => 140000,
    'reset_cost_item' => [
        102006001,
         102
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             187
        ]
    ],
    'bubing_base_attack' => 290.0,
    'qibing_base_attack' => 319.0,
    'gongbing_base_attack' => 362.5,
    'fangshi_base_attack' => 362.5,
    'bubing_base_defence' => 145.0,
    'qibing_base_defence' => 116.0,
    'gongbing_base_defence' => 101.5,
    'fangshi_base_defence' => 101.5,
    'bubing_base_troops' => 1695.0,
    'qibing_base_troops' => 1695.0,
    'gongbing_base_troops' => 1210.0,
    'fangshi_base_troops' => 1210.0
};
get(99)-> #{
    'exp' => 145000,
    'reset_cost_item' => [
        102006001,
         103
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             188
        ]
    ],
    'bubing_base_attack' => 294.0,
    'qibing_base_attack' => 323.4,
    'gongbing_base_attack' => 367.5,
    'fangshi_base_attack' => 367.5,
    'bubing_base_defence' => 147.0,
    'qibing_base_defence' => 117.6,
    'gongbing_base_defence' => 102.9,
    'fangshi_base_defence' => 102.9,
    'bubing_base_troops' => 1715.0,
    'qibing_base_troops' => 1715.0,
    'gongbing_base_troops' => 1225.0,
    'fangshi_base_troops' => 1225.0
};
get(100)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         104
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             189
        ]
    ],
    'bubing_base_attack' => 298.0,
    'qibing_base_attack' => 327.8,
    'gongbing_base_attack' => 372.5,
    'fangshi_base_attack' => 372.5,
    'bubing_base_defence' => 149.0,
    'qibing_base_defence' => 119.2,
    'gongbing_base_defence' => 104.3,
    'fangshi_base_defence' => 104.3,
    'bubing_base_troops' => 1735.0,
    'qibing_base_troops' => 1735.0,
    'gongbing_base_troops' => 1240.0,
    'fangshi_base_troops' => 1240.0
};
get(101)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         105
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             190
        ]
    ],
    'bubing_base_attack' => 302.0,
    'qibing_base_attack' => 332.2,
    'gongbing_base_attack' => 377.5,
    'fangshi_base_attack' => 377.5,
    'bubing_base_defence' => 151.0,
    'qibing_base_defence' => 120.8,
    'gongbing_base_defence' => 105.7,
    'fangshi_base_defence' => 105.7,
    'bubing_base_troops' => 1755.0,
    'qibing_base_troops' => 1755.0,
    'gongbing_base_troops' => 1255.0,
    'fangshi_base_troops' => 1255.0
};
get(102)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         106
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             191
        ]
    ],
    'bubing_base_attack' => 306.0,
    'qibing_base_attack' => 336.6,
    'gongbing_base_attack' => 382.5,
    'fangshi_base_attack' => 382.5,
    'bubing_base_defence' => 153.0,
    'qibing_base_defence' => 122.4,
    'gongbing_base_defence' => 107.1,
    'fangshi_base_defence' => 107.1,
    'bubing_base_troops' => 1775.0,
    'qibing_base_troops' => 1775.0,
    'gongbing_base_troops' => 1270.0,
    'fangshi_base_troops' => 1270.0
};
get(103)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         107
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             192
        ]
    ],
    'bubing_base_attack' => 310.0,
    'qibing_base_attack' => 341.0,
    'gongbing_base_attack' => 387.5,
    'fangshi_base_attack' => 387.5,
    'bubing_base_defence' => 155.0,
    'qibing_base_defence' => 124.0,
    'gongbing_base_defence' => 108.5,
    'fangshi_base_defence' => 108.5,
    'bubing_base_troops' => 1795.0,
    'qibing_base_troops' => 1795.0,
    'gongbing_base_troops' => 1285.0,
    'fangshi_base_troops' => 1285.0
};
get(104)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         108
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             193
        ]
    ],
    'bubing_base_attack' => 314.0,
    'qibing_base_attack' => 345.4,
    'gongbing_base_attack' => 392.5,
    'fangshi_base_attack' => 392.5,
    'bubing_base_defence' => 157.0,
    'qibing_base_defence' => 125.6,
    'gongbing_base_defence' => 109.9,
    'fangshi_base_defence' => 109.9,
    'bubing_base_troops' => 1815.0,
    'qibing_base_troops' => 1815.0,
    'gongbing_base_troops' => 1300.0,
    'fangshi_base_troops' => 1300.0
};
get(105)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         109
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             194
        ]
    ],
    'bubing_base_attack' => 318.0,
    'qibing_base_attack' => 349.8,
    'gongbing_base_attack' => 397.5,
    'fangshi_base_attack' => 397.5,
    'bubing_base_defence' => 159.0,
    'qibing_base_defence' => 127.2,
    'gongbing_base_defence' => 111.3,
    'fangshi_base_defence' => 111.3,
    'bubing_base_troops' => 1835.0,
    'qibing_base_troops' => 1835.0,
    'gongbing_base_troops' => 1315.0,
    'fangshi_base_troops' => 1315.0
};
get(106)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         110
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             195
        ]
    ],
    'bubing_base_attack' => 322.0,
    'qibing_base_attack' => 354.2,
    'gongbing_base_attack' => 402.5,
    'fangshi_base_attack' => 402.5,
    'bubing_base_defence' => 161.0,
    'qibing_base_defence' => 128.8,
    'gongbing_base_defence' => 112.7,
    'fangshi_base_defence' => 112.7,
    'bubing_base_troops' => 1855.0,
    'qibing_base_troops' => 1855.0,
    'gongbing_base_troops' => 1330.0,
    'fangshi_base_troops' => 1330.0
};
get(107)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         111
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             196
        ]
    ],
    'bubing_base_attack' => 326.0,
    'qibing_base_attack' => 358.6,
    'gongbing_base_attack' => 407.5,
    'fangshi_base_attack' => 407.5,
    'bubing_base_defence' => 163.0,
    'qibing_base_defence' => 130.4,
    'gongbing_base_defence' => 114.1,
    'fangshi_base_defence' => 114.1,
    'bubing_base_troops' => 1875.0,
    'qibing_base_troops' => 1875.0,
    'gongbing_base_troops' => 1345.0,
    'fangshi_base_troops' => 1345.0
};
get(108)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         112
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             197
        ]
    ],
    'bubing_base_attack' => 330.0,
    'qibing_base_attack' => 363.0,
    'gongbing_base_attack' => 412.5,
    'fangshi_base_attack' => 412.5,
    'bubing_base_defence' => 165.0,
    'qibing_base_defence' => 132.0,
    'gongbing_base_defence' => 115.5,
    'fangshi_base_defence' => 115.5,
    'bubing_base_troops' => 1895.0,
    'qibing_base_troops' => 1895.0,
    'gongbing_base_troops' => 1360.0,
    'fangshi_base_troops' => 1360.0
};
get(109)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         113
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             198
        ]
    ],
    'bubing_base_attack' => 334.0,
    'qibing_base_attack' => 367.4,
    'gongbing_base_attack' => 417.5,
    'fangshi_base_attack' => 417.5,
    'bubing_base_defence' => 167.0,
    'qibing_base_defence' => 133.6,
    'gongbing_base_defence' => 116.9,
    'fangshi_base_defence' => 116.9,
    'bubing_base_troops' => 1915.0,
    'qibing_base_troops' => 1915.0,
    'gongbing_base_troops' => 1375.0,
    'fangshi_base_troops' => 1375.0
};
get(110)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         114
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             199
        ]
    ],
    'bubing_base_attack' => 338.0,
    'qibing_base_attack' => 371.8,
    'gongbing_base_attack' => 422.5,
    'fangshi_base_attack' => 422.5,
    'bubing_base_defence' => 169.0,
    'qibing_base_defence' => 135.2,
    'gongbing_base_defence' => 118.3,
    'fangshi_base_defence' => 118.3,
    'bubing_base_troops' => 1935.0,
    'qibing_base_troops' => 1935.0,
    'gongbing_base_troops' => 1390.0,
    'fangshi_base_troops' => 1390.0
};
get(111)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         115
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             200
        ]
    ],
    'bubing_base_attack' => 342.0,
    'qibing_base_attack' => 376.2,
    'gongbing_base_attack' => 427.5,
    'fangshi_base_attack' => 427.5,
    'bubing_base_defence' => 171.0,
    'qibing_base_defence' => 136.8,
    'gongbing_base_defence' => 119.7,
    'fangshi_base_defence' => 119.7,
    'bubing_base_troops' => 1955.0,
    'qibing_base_troops' => 1955.0,
    'gongbing_base_troops' => 1405.0,
    'fangshi_base_troops' => 1405.0
};
get(112)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         116
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             201
        ]
    ],
    'bubing_base_attack' => 346.0,
    'qibing_base_attack' => 380.6,
    'gongbing_base_attack' => 432.5,
    'fangshi_base_attack' => 432.5,
    'bubing_base_defence' => 173.0,
    'qibing_base_defence' => 138.4,
    'gongbing_base_defence' => 121.1,
    'fangshi_base_defence' => 121.1,
    'bubing_base_troops' => 1975.0,
    'qibing_base_troops' => 1975.0,
    'gongbing_base_troops' => 1420.0,
    'fangshi_base_troops' => 1420.0
};
get(113)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         117
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             202
        ]
    ],
    'bubing_base_attack' => 350.0,
    'qibing_base_attack' => 384.999999999999,
    'gongbing_base_attack' => 437.5,
    'fangshi_base_attack' => 437.5,
    'bubing_base_defence' => 175.0,
    'qibing_base_defence' => 140.0,
    'gongbing_base_defence' => 122.5,
    'fangshi_base_defence' => 122.5,
    'bubing_base_troops' => 1995.0,
    'qibing_base_troops' => 1995.0,
    'gongbing_base_troops' => 1435.0,
    'fangshi_base_troops' => 1435.0
};
get(114)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         118
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             203
        ]
    ],
    'bubing_base_attack' => 354.0,
    'qibing_base_attack' => 389.399999999999,
    'gongbing_base_attack' => 442.5,
    'fangshi_base_attack' => 442.5,
    'bubing_base_defence' => 177.0,
    'qibing_base_defence' => 141.6,
    'gongbing_base_defence' => 123.9,
    'fangshi_base_defence' => 123.9,
    'bubing_base_troops' => 2015.0,
    'qibing_base_troops' => 2015.0,
    'gongbing_base_troops' => 1450.0,
    'fangshi_base_troops' => 1450.0
};
get(115)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         119
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             204
        ]
    ],
    'bubing_base_attack' => 358.0,
    'qibing_base_attack' => 393.799999999999,
    'gongbing_base_attack' => 447.5,
    'fangshi_base_attack' => 447.5,
    'bubing_base_defence' => 179.0,
    'qibing_base_defence' => 143.2,
    'gongbing_base_defence' => 125.3,
    'fangshi_base_defence' => 125.3,
    'bubing_base_troops' => 2035.0,
    'qibing_base_troops' => 2035.0,
    'gongbing_base_troops' => 1465.0,
    'fangshi_base_troops' => 1465.0
};
get(116)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         120
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             205
        ]
    ],
    'bubing_base_attack' => 362.0,
    'qibing_base_attack' => 398.199999999999,
    'gongbing_base_attack' => 452.5,
    'fangshi_base_attack' => 452.5,
    'bubing_base_defence' => 181.0,
    'qibing_base_defence' => 144.8,
    'gongbing_base_defence' => 126.7,
    'fangshi_base_defence' => 126.7,
    'bubing_base_troops' => 2055.0,
    'qibing_base_troops' => 2055.0,
    'gongbing_base_troops' => 1480.0,
    'fangshi_base_troops' => 1480.0
};
get(117)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         121
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             206
        ]
    ],
    'bubing_base_attack' => 366.0,
    'qibing_base_attack' => 402.599999999999,
    'gongbing_base_attack' => 457.5,
    'fangshi_base_attack' => 457.5,
    'bubing_base_defence' => 183.0,
    'qibing_base_defence' => 146.4,
    'gongbing_base_defence' => 128.1,
    'fangshi_base_defence' => 128.1,
    'bubing_base_troops' => 2075.0,
    'qibing_base_troops' => 2075.0,
    'gongbing_base_troops' => 1495.0,
    'fangshi_base_troops' => 1495.0
};
get(118)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         122
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             207
        ]
    ],
    'bubing_base_attack' => 370.0,
    'qibing_base_attack' => 406.999999999999,
    'gongbing_base_attack' => 462.5,
    'fangshi_base_attack' => 462.5,
    'bubing_base_defence' => 185.0,
    'qibing_base_defence' => 148.0,
    'gongbing_base_defence' => 129.5,
    'fangshi_base_defence' => 129.5,
    'bubing_base_troops' => 2095.0,
    'qibing_base_troops' => 2095.0,
    'gongbing_base_troops' => 1510.0,
    'fangshi_base_troops' => 1510.0
};
get(119)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         123
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             208
        ]
    ],
    'bubing_base_attack' => 374.0,
    'qibing_base_attack' => 411.399999999999,
    'gongbing_base_attack' => 467.5,
    'fangshi_base_attack' => 467.5,
    'bubing_base_defence' => 187.0,
    'qibing_base_defence' => 149.6,
    'gongbing_base_defence' => 130.9,
    'fangshi_base_defence' => 130.9,
    'bubing_base_troops' => 2115.0,
    'qibing_base_troops' => 2115.0,
    'gongbing_base_troops' => 1525.0,
    'fangshi_base_troops' => 1525.0
};
get(120)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         124
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             209
        ]
    ],
    'bubing_base_attack' => 378.0,
    'qibing_base_attack' => 415.799999999999,
    'gongbing_base_attack' => 472.5,
    'fangshi_base_attack' => 472.5,
    'bubing_base_defence' => 189.0,
    'qibing_base_defence' => 151.2,
    'gongbing_base_defence' => 132.3,
    'fangshi_base_defence' => 132.3,
    'bubing_base_troops' => 2135.0,
    'qibing_base_troops' => 2135.0,
    'gongbing_base_troops' => 1540.0,
    'fangshi_base_troops' => 1540.0
};
get(121)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         125
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             210
        ]
    ],
    'bubing_base_attack' => 382.0,
    'qibing_base_attack' => 420.199999999999,
    'gongbing_base_attack' => 477.5,
    'fangshi_base_attack' => 477.5,
    'bubing_base_defence' => 191.0,
    'qibing_base_defence' => 152.8,
    'gongbing_base_defence' => 133.7,
    'fangshi_base_defence' => 133.7,
    'bubing_base_troops' => 2155.0,
    'qibing_base_troops' => 2155.0,
    'gongbing_base_troops' => 1555.0,
    'fangshi_base_troops' => 1555.0
};
get(122)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         126
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             211
        ]
    ],
    'bubing_base_attack' => 386.0,
    'qibing_base_attack' => 424.599999999999,
    'gongbing_base_attack' => 482.5,
    'fangshi_base_attack' => 482.5,
    'bubing_base_defence' => 193.0,
    'qibing_base_defence' => 154.4,
    'gongbing_base_defence' => 135.1,
    'fangshi_base_defence' => 135.1,
    'bubing_base_troops' => 2175.0,
    'qibing_base_troops' => 2175.0,
    'gongbing_base_troops' => 1570.0,
    'fangshi_base_troops' => 1570.0
};
get(123)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         127
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             212
        ]
    ],
    'bubing_base_attack' => 390.0,
    'qibing_base_attack' => 428.999999999999,
    'gongbing_base_attack' => 487.5,
    'fangshi_base_attack' => 487.5,
    'bubing_base_defence' => 195.0,
    'qibing_base_defence' => 156.0,
    'gongbing_base_defence' => 136.5,
    'fangshi_base_defence' => 136.5,
    'bubing_base_troops' => 2195.0,
    'qibing_base_troops' => 2195.0,
    'gongbing_base_troops' => 1585.0,
    'fangshi_base_troops' => 1585.0
};
get(124)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         128
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             213
        ]
    ],
    'bubing_base_attack' => 394.0,
    'qibing_base_attack' => 433.399999999999,
    'gongbing_base_attack' => 492.5,
    'fangshi_base_attack' => 492.5,
    'bubing_base_defence' => 197.0,
    'qibing_base_defence' => 157.6,
    'gongbing_base_defence' => 137.9,
    'fangshi_base_defence' => 137.9,
    'bubing_base_troops' => 2215.0,
    'qibing_base_troops' => 2215.0,
    'gongbing_base_troops' => 1600.0,
    'fangshi_base_troops' => 1600.0
};
get(125)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         129
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             214
        ]
    ],
    'bubing_base_attack' => 398.0,
    'qibing_base_attack' => 437.799999999999,
    'gongbing_base_attack' => 497.5,
    'fangshi_base_attack' => 497.5,
    'bubing_base_defence' => 199.0,
    'qibing_base_defence' => 159.2,
    'gongbing_base_defence' => 139.3,
    'fangshi_base_defence' => 139.3,
    'bubing_base_troops' => 2235.0,
    'qibing_base_troops' => 2235.0,
    'gongbing_base_troops' => 1615.0,
    'fangshi_base_troops' => 1615.0
};
get(126)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         130
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             215
        ]
    ],
    'bubing_base_attack' => 402.0,
    'qibing_base_attack' => 442.199999999999,
    'gongbing_base_attack' => 502.5,
    'fangshi_base_attack' => 502.5,
    'bubing_base_defence' => 201.0,
    'qibing_base_defence' => 160.8,
    'gongbing_base_defence' => 140.7,
    'fangshi_base_defence' => 140.7,
    'bubing_base_troops' => 2255.0,
    'qibing_base_troops' => 2255.0,
    'gongbing_base_troops' => 1630.0,
    'fangshi_base_troops' => 1630.0
};
get(127)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         131
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             216
        ]
    ],
    'bubing_base_attack' => 406.0,
    'qibing_base_attack' => 446.599999999999,
    'gongbing_base_attack' => 507.5,
    'fangshi_base_attack' => 507.5,
    'bubing_base_defence' => 203.0,
    'qibing_base_defence' => 162.4,
    'gongbing_base_defence' => 142.1,
    'fangshi_base_defence' => 142.1,
    'bubing_base_troops' => 2275.0,
    'qibing_base_troops' => 2275.0,
    'gongbing_base_troops' => 1645.0,
    'fangshi_base_troops' => 1645.0
};
get(128)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         132
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             217
        ]
    ],
    'bubing_base_attack' => 410.0,
    'qibing_base_attack' => 450.999999999999,
    'gongbing_base_attack' => 512.5,
    'fangshi_base_attack' => 512.5,
    'bubing_base_defence' => 205.0,
    'qibing_base_defence' => 164.0,
    'gongbing_base_defence' => 143.5,
    'fangshi_base_defence' => 143.5,
    'bubing_base_troops' => 2295.0,
    'qibing_base_troops' => 2295.0,
    'gongbing_base_troops' => 1660.0,
    'fangshi_base_troops' => 1660.0
};
get(129)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         133
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             218
        ]
    ],
    'bubing_base_attack' => 414.0,
    'qibing_base_attack' => 455.399999999999,
    'gongbing_base_attack' => 517.5,
    'fangshi_base_attack' => 517.5,
    'bubing_base_defence' => 207.0,
    'qibing_base_defence' => 165.6,
    'gongbing_base_defence' => 144.9,
    'fangshi_base_defence' => 144.9,
    'bubing_base_troops' => 2315.0,
    'qibing_base_troops' => 2315.0,
    'gongbing_base_troops' => 1675.0,
    'fangshi_base_troops' => 1675.0
};
get(130)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         134
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             219
        ]
    ],
    'bubing_base_attack' => 418.0,
    'qibing_base_attack' => 459.799999999999,
    'gongbing_base_attack' => 522.5,
    'fangshi_base_attack' => 522.5,
    'bubing_base_defence' => 209.0,
    'qibing_base_defence' => 167.2,
    'gongbing_base_defence' => 146.3,
    'fangshi_base_defence' => 146.3,
    'bubing_base_troops' => 2335.0,
    'qibing_base_troops' => 2335.0,
    'gongbing_base_troops' => 1690.0,
    'fangshi_base_troops' => 1690.0
};
get(131)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         135
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             220
        ]
    ],
    'bubing_base_attack' => 422.0,
    'qibing_base_attack' => 464.199999999999,
    'gongbing_base_attack' => 527.5,
    'fangshi_base_attack' => 527.5,
    'bubing_base_defence' => 211.0,
    'qibing_base_defence' => 168.8,
    'gongbing_base_defence' => 147.7,
    'fangshi_base_defence' => 147.7,
    'bubing_base_troops' => 2355.0,
    'qibing_base_troops' => 2355.0,
    'gongbing_base_troops' => 1705.0,
    'fangshi_base_troops' => 1705.0
};
get(132)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         136
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             221
        ]
    ],
    'bubing_base_attack' => 426.0,
    'qibing_base_attack' => 468.599999999999,
    'gongbing_base_attack' => 532.5,
    'fangshi_base_attack' => 532.5,
    'bubing_base_defence' => 213.0,
    'qibing_base_defence' => 170.4,
    'gongbing_base_defence' => 149.1,
    'fangshi_base_defence' => 149.1,
    'bubing_base_troops' => 2375.0,
    'qibing_base_troops' => 2375.0,
    'gongbing_base_troops' => 1720.0,
    'fangshi_base_troops' => 1720.0
};
get(133)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         137
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             222
        ]
    ],
    'bubing_base_attack' => 430.0,
    'qibing_base_attack' => 472.999999999999,
    'gongbing_base_attack' => 537.5,
    'fangshi_base_attack' => 537.5,
    'bubing_base_defence' => 215.0,
    'qibing_base_defence' => 172.0,
    'gongbing_base_defence' => 150.5,
    'fangshi_base_defence' => 150.5,
    'bubing_base_troops' => 2395.0,
    'qibing_base_troops' => 2395.0,
    'gongbing_base_troops' => 1735.0,
    'fangshi_base_troops' => 1735.0
};
get(134)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         138
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             223
        ]
    ],
    'bubing_base_attack' => 434.0,
    'qibing_base_attack' => 477.399999999999,
    'gongbing_base_attack' => 542.5,
    'fangshi_base_attack' => 542.5,
    'bubing_base_defence' => 217.0,
    'qibing_base_defence' => 173.6,
    'gongbing_base_defence' => 151.9,
    'fangshi_base_defence' => 151.9,
    'bubing_base_troops' => 2415.0,
    'qibing_base_troops' => 2415.0,
    'gongbing_base_troops' => 1750.0,
    'fangshi_base_troops' => 1750.0
};
get(135)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         139
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             224
        ]
    ],
    'bubing_base_attack' => 438.0,
    'qibing_base_attack' => 481.799999999999,
    'gongbing_base_attack' => 547.5,
    'fangshi_base_attack' => 547.5,
    'bubing_base_defence' => 219.0,
    'qibing_base_defence' => 175.2,
    'gongbing_base_defence' => 153.3,
    'fangshi_base_defence' => 153.3,
    'bubing_base_troops' => 2435.0,
    'qibing_base_troops' => 2435.0,
    'gongbing_base_troops' => 1765.0,
    'fangshi_base_troops' => 1765.0
};
get(136)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         140
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             225
        ]
    ],
    'bubing_base_attack' => 442.0,
    'qibing_base_attack' => 486.199999999999,
    'gongbing_base_attack' => 552.5,
    'fangshi_base_attack' => 552.5,
    'bubing_base_defence' => 221.0,
    'qibing_base_defence' => 176.8,
    'gongbing_base_defence' => 154.7,
    'fangshi_base_defence' => 154.7,
    'bubing_base_troops' => 2455.0,
    'qibing_base_troops' => 2455.0,
    'gongbing_base_troops' => 1780.0,
    'fangshi_base_troops' => 1780.0
};
get(137)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         141
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             226
        ]
    ],
    'bubing_base_attack' => 446.0,
    'qibing_base_attack' => 490.599999999999,
    'gongbing_base_attack' => 557.5,
    'fangshi_base_attack' => 557.5,
    'bubing_base_defence' => 223.0,
    'qibing_base_defence' => 178.4,
    'gongbing_base_defence' => 156.1,
    'fangshi_base_defence' => 156.1,
    'bubing_base_troops' => 2475.0,
    'qibing_base_troops' => 2475.0,
    'gongbing_base_troops' => 1795.0,
    'fangshi_base_troops' => 1795.0
};
get(138)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         142
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             227
        ]
    ],
    'bubing_base_attack' => 450.0,
    'qibing_base_attack' => 494.999999999999,
    'gongbing_base_attack' => 562.5,
    'fangshi_base_attack' => 562.5,
    'bubing_base_defence' => 225.0,
    'qibing_base_defence' => 180.0,
    'gongbing_base_defence' => 157.5,
    'fangshi_base_defence' => 157.5,
    'bubing_base_troops' => 2495.0,
    'qibing_base_troops' => 2495.0,
    'gongbing_base_troops' => 1810.0,
    'fangshi_base_troops' => 1810.0
};
get(139)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         143
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             228
        ]
    ],
    'bubing_base_attack' => 454.0,
    'qibing_base_attack' => 499.399999999999,
    'gongbing_base_attack' => 567.5,
    'fangshi_base_attack' => 567.5,
    'bubing_base_defence' => 227.0,
    'qibing_base_defence' => 181.6,
    'gongbing_base_defence' => 158.9,
    'fangshi_base_defence' => 158.9,
    'bubing_base_troops' => 2515.0,
    'qibing_base_troops' => 2515.0,
    'gongbing_base_troops' => 1825.0,
    'fangshi_base_troops' => 1825.0
};
get(140)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         144
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             229
        ]
    ],
    'bubing_base_attack' => 458.0,
    'qibing_base_attack' => 503.799999999999,
    'gongbing_base_attack' => 572.5,
    'fangshi_base_attack' => 572.5,
    'bubing_base_defence' => 229.0,
    'qibing_base_defence' => 183.2,
    'gongbing_base_defence' => 160.3,
    'fangshi_base_defence' => 160.3,
    'bubing_base_troops' => 2535.0,
    'qibing_base_troops' => 2535.0,
    'gongbing_base_troops' => 1840.0,
    'fangshi_base_troops' => 1840.0
};
get(141)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         145
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             230
        ]
    ],
    'bubing_base_attack' => 462.0,
    'qibing_base_attack' => 508.199999999999,
    'gongbing_base_attack' => 577.5,
    'fangshi_base_attack' => 577.5,
    'bubing_base_defence' => 231.0,
    'qibing_base_defence' => 184.8,
    'gongbing_base_defence' => 161.7,
    'fangshi_base_defence' => 161.7,
    'bubing_base_troops' => 2555.0,
    'qibing_base_troops' => 2555.0,
    'gongbing_base_troops' => 1855.0,
    'fangshi_base_troops' => 1855.0
};
get(142)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         146
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             231
        ]
    ],
    'bubing_base_attack' => 466.0,
    'qibing_base_attack' => 512.599999999999,
    'gongbing_base_attack' => 582.5,
    'fangshi_base_attack' => 582.5,
    'bubing_base_defence' => 233.0,
    'qibing_base_defence' => 186.4,
    'gongbing_base_defence' => 163.1,
    'fangshi_base_defence' => 163.1,
    'bubing_base_troops' => 2575.0,
    'qibing_base_troops' => 2575.0,
    'gongbing_base_troops' => 1870.0,
    'fangshi_base_troops' => 1870.0
};
get(143)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         147
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             232
        ]
    ],
    'bubing_base_attack' => 470.0,
    'qibing_base_attack' => 516.999999999999,
    'gongbing_base_attack' => 587.5,
    'fangshi_base_attack' => 587.5,
    'bubing_base_defence' => 235.0,
    'qibing_base_defence' => 188.0,
    'gongbing_base_defence' => 164.5,
    'fangshi_base_defence' => 164.5,
    'bubing_base_troops' => 2595.0,
    'qibing_base_troops' => 2595.0,
    'gongbing_base_troops' => 1885.0,
    'fangshi_base_troops' => 1885.0
};
get(144)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         148
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             233
        ]
    ],
    'bubing_base_attack' => 474.0,
    'qibing_base_attack' => 521.399999999999,
    'gongbing_base_attack' => 592.5,
    'fangshi_base_attack' => 592.5,
    'bubing_base_defence' => 237.0,
    'qibing_base_defence' => 189.6,
    'gongbing_base_defence' => 165.9,
    'fangshi_base_defence' => 165.9,
    'bubing_base_troops' => 2615.0,
    'qibing_base_troops' => 2615.0,
    'gongbing_base_troops' => 1900.0,
    'fangshi_base_troops' => 1900.0
};
get(145)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         149
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             234
        ]
    ],
    'bubing_base_attack' => 478.0,
    'qibing_base_attack' => 525.799999999999,
    'gongbing_base_attack' => 597.5,
    'fangshi_base_attack' => 597.5,
    'bubing_base_defence' => 239.0,
    'qibing_base_defence' => 191.2,
    'gongbing_base_defence' => 167.3,
    'fangshi_base_defence' => 167.3,
    'bubing_base_troops' => 2635.0,
    'qibing_base_troops' => 2635.0,
    'gongbing_base_troops' => 1915.0,
    'fangshi_base_troops' => 1915.0
};
get(146)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         150
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             235
        ]
    ],
    'bubing_base_attack' => 482.0,
    'qibing_base_attack' => 530.199999999999,
    'gongbing_base_attack' => 602.5,
    'fangshi_base_attack' => 602.5,
    'bubing_base_defence' => 241.0,
    'qibing_base_defence' => 192.8,
    'gongbing_base_defence' => 168.7,
    'fangshi_base_defence' => 168.7,
    'bubing_base_troops' => 2655.0,
    'qibing_base_troops' => 2655.0,
    'gongbing_base_troops' => 1930.0,
    'fangshi_base_troops' => 1930.0
};
get(147)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         151
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             236
        ]
    ],
    'bubing_base_attack' => 486.0,
    'qibing_base_attack' => 534.599999999999,
    'gongbing_base_attack' => 607.5,
    'fangshi_base_attack' => 607.5,
    'bubing_base_defence' => 243.0,
    'qibing_base_defence' => 194.4,
    'gongbing_base_defence' => 170.1,
    'fangshi_base_defence' => 170.1,
    'bubing_base_troops' => 2675.0,
    'qibing_base_troops' => 2675.0,
    'gongbing_base_troops' => 1945.0,
    'fangshi_base_troops' => 1945.0
};
get(148)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         152
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             237
        ]
    ],
    'bubing_base_attack' => 490.0,
    'qibing_base_attack' => 538.999999999999,
    'gongbing_base_attack' => 612.5,
    'fangshi_base_attack' => 612.5,
    'bubing_base_defence' => 245.0,
    'qibing_base_defence' => 196.0,
    'gongbing_base_defence' => 171.5,
    'fangshi_base_defence' => 171.5,
    'bubing_base_troops' => 2695.0,
    'qibing_base_troops' => 2695.0,
    'gongbing_base_troops' => 1960.0,
    'fangshi_base_troops' => 1960.0
};
get(149)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         153
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             238
        ]
    ],
    'bubing_base_attack' => 494.0,
    'qibing_base_attack' => 543.399999999999,
    'gongbing_base_attack' => 617.5,
    'fangshi_base_attack' => 617.5,
    'bubing_base_defence' => 247.0,
    'qibing_base_defence' => 197.6,
    'gongbing_base_defence' => 172.9,
    'fangshi_base_defence' => 172.9,
    'bubing_base_troops' => 2715.0,
    'qibing_base_troops' => 2715.0,
    'gongbing_base_troops' => 1975.0,
    'fangshi_base_troops' => 1975.0
};
get(150)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         154
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             239
        ]
    ],
    'bubing_base_attack' => 498.0,
    'qibing_base_attack' => 547.799999999999,
    'gongbing_base_attack' => 622.5,
    'fangshi_base_attack' => 622.5,
    'bubing_base_defence' => 249.0,
    'qibing_base_defence' => 199.2,
    'gongbing_base_defence' => 174.3,
    'fangshi_base_defence' => 174.3,
    'bubing_base_troops' => 2735.0,
    'qibing_base_troops' => 2735.0,
    'gongbing_base_troops' => 1990.0,
    'fangshi_base_troops' => 1990.0
};
get(151)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         155
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             240
        ]
    ],
    'bubing_base_attack' => 502.0,
    'qibing_base_attack' => 552.199999999999,
    'gongbing_base_attack' => 627.5,
    'fangshi_base_attack' => 627.5,
    'bubing_base_defence' => 251.0,
    'qibing_base_defence' => 200.8,
    'gongbing_base_defence' => 175.7,
    'fangshi_base_defence' => 175.7,
    'bubing_base_troops' => 2755.0,
    'qibing_base_troops' => 2755.0,
    'gongbing_base_troops' => 2005.0,
    'fangshi_base_troops' => 2005.0
};
get(152)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         156
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             241
        ]
    ],
    'bubing_base_attack' => 506.0,
    'qibing_base_attack' => 556.599999999999,
    'gongbing_base_attack' => 632.5,
    'fangshi_base_attack' => 632.5,
    'bubing_base_defence' => 253.0,
    'qibing_base_defence' => 202.4,
    'gongbing_base_defence' => 177.1,
    'fangshi_base_defence' => 177.1,
    'bubing_base_troops' => 2775.0,
    'qibing_base_troops' => 2775.0,
    'gongbing_base_troops' => 2020.0,
    'fangshi_base_troops' => 2020.0
};
get(153)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         157
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             242
        ]
    ],
    'bubing_base_attack' => 510.0,
    'qibing_base_attack' => 560.999999999999,
    'gongbing_base_attack' => 637.5,
    'fangshi_base_attack' => 637.5,
    'bubing_base_defence' => 255.0,
    'qibing_base_defence' => 204.0,
    'gongbing_base_defence' => 178.5,
    'fangshi_base_defence' => 178.5,
    'bubing_base_troops' => 2795.0,
    'qibing_base_troops' => 2795.0,
    'gongbing_base_troops' => 2035.0,
    'fangshi_base_troops' => 2035.0
};
get(154)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         158
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             243
        ]
    ],
    'bubing_base_attack' => 514.0,
    'qibing_base_attack' => 565.399999999999,
    'gongbing_base_attack' => 642.5,
    'fangshi_base_attack' => 642.5,
    'bubing_base_defence' => 257.0,
    'qibing_base_defence' => 205.6,
    'gongbing_base_defence' => 179.9,
    'fangshi_base_defence' => 179.9,
    'bubing_base_troops' => 2815.0,
    'qibing_base_troops' => 2815.0,
    'gongbing_base_troops' => 2050.0,
    'fangshi_base_troops' => 2050.0
};
get(155)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         159
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             244
        ]
    ],
    'bubing_base_attack' => 518.0,
    'qibing_base_attack' => 569.799999999999,
    'gongbing_base_attack' => 647.5,
    'fangshi_base_attack' => 647.5,
    'bubing_base_defence' => 259.0,
    'qibing_base_defence' => 207.2,
    'gongbing_base_defence' => 181.3,
    'fangshi_base_defence' => 181.3,
    'bubing_base_troops' => 2835.0,
    'qibing_base_troops' => 2835.0,
    'gongbing_base_troops' => 2065.0,
    'fangshi_base_troops' => 2065.0
};
get(156)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         160
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             245
        ]
    ],
    'bubing_base_attack' => 522.0,
    'qibing_base_attack' => 574.199999999999,
    'gongbing_base_attack' => 652.5,
    'fangshi_base_attack' => 652.5,
    'bubing_base_defence' => 261.0,
    'qibing_base_defence' => 208.8,
    'gongbing_base_defence' => 182.7,
    'fangshi_base_defence' => 182.7,
    'bubing_base_troops' => 2855.0,
    'qibing_base_troops' => 2855.0,
    'gongbing_base_troops' => 2080.0,
    'fangshi_base_troops' => 2080.0
};
get(157)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         161
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             246
        ]
    ],
    'bubing_base_attack' => 526.0,
    'qibing_base_attack' => 578.599999999999,
    'gongbing_base_attack' => 657.5,
    'fangshi_base_attack' => 657.5,
    'bubing_base_defence' => 263.0,
    'qibing_base_defence' => 210.4,
    'gongbing_base_defence' => 184.1,
    'fangshi_base_defence' => 184.1,
    'bubing_base_troops' => 2875.0,
    'qibing_base_troops' => 2875.0,
    'gongbing_base_troops' => 2095.0,
    'fangshi_base_troops' => 2095.0
};
get(158)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         162
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             247
        ]
    ],
    'bubing_base_attack' => 530.0,
    'qibing_base_attack' => 582.999999999999,
    'gongbing_base_attack' => 662.5,
    'fangshi_base_attack' => 662.5,
    'bubing_base_defence' => 265.0,
    'qibing_base_defence' => 212.0,
    'gongbing_base_defence' => 185.5,
    'fangshi_base_defence' => 185.5,
    'bubing_base_troops' => 2895.0,
    'qibing_base_troops' => 2895.0,
    'gongbing_base_troops' => 2110.0,
    'fangshi_base_troops' => 2110.0
};
get(159)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         163
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             248
        ]
    ],
    'bubing_base_attack' => 534.0,
    'qibing_base_attack' => 587.399999999999,
    'gongbing_base_attack' => 667.5,
    'fangshi_base_attack' => 667.5,
    'bubing_base_defence' => 267.0,
    'qibing_base_defence' => 213.6,
    'gongbing_base_defence' => 186.9,
    'fangshi_base_defence' => 186.9,
    'bubing_base_troops' => 2915.0,
    'qibing_base_troops' => 2915.0,
    'gongbing_base_troops' => 2125.0,
    'fangshi_base_troops' => 2125.0
};
get(160)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         164
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             249
        ]
    ],
    'bubing_base_attack' => 538.0,
    'qibing_base_attack' => 591.799999999998,
    'gongbing_base_attack' => 672.5,
    'fangshi_base_attack' => 672.5,
    'bubing_base_defence' => 269.0,
    'qibing_base_defence' => 215.2,
    'gongbing_base_defence' => 188.3,
    'fangshi_base_defence' => 188.3,
    'bubing_base_troops' => 2935.0,
    'qibing_base_troops' => 2935.0,
    'gongbing_base_troops' => 2140.0,
    'fangshi_base_troops' => 2140.0
};
get(161)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         165
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             250
        ]
    ],
    'bubing_base_attack' => 542.0,
    'qibing_base_attack' => 596.199999999998,
    'gongbing_base_attack' => 677.5,
    'fangshi_base_attack' => 677.5,
    'bubing_base_defence' => 271.0,
    'qibing_base_defence' => 216.8,
    'gongbing_base_defence' => 189.7,
    'fangshi_base_defence' => 189.7,
    'bubing_base_troops' => 2955.0,
    'qibing_base_troops' => 2955.0,
    'gongbing_base_troops' => 2155.0,
    'fangshi_base_troops' => 2155.0
};
get(162)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         166
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             251
        ]
    ],
    'bubing_base_attack' => 546.0,
    'qibing_base_attack' => 600.599999999998,
    'gongbing_base_attack' => 682.5,
    'fangshi_base_attack' => 682.5,
    'bubing_base_defence' => 273.0,
    'qibing_base_defence' => 218.399999999999,
    'gongbing_base_defence' => 191.1,
    'fangshi_base_defence' => 191.1,
    'bubing_base_troops' => 2975.0,
    'qibing_base_troops' => 2975.0,
    'gongbing_base_troops' => 2170.0,
    'fangshi_base_troops' => 2170.0
};
get(163)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         167
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             252
        ]
    ],
    'bubing_base_attack' => 550.0,
    'qibing_base_attack' => 604.999999999998,
    'gongbing_base_attack' => 687.5,
    'fangshi_base_attack' => 687.5,
    'bubing_base_defence' => 275.0,
    'qibing_base_defence' => 219.999999999999,
    'gongbing_base_defence' => 192.5,
    'fangshi_base_defence' => 192.5,
    'bubing_base_troops' => 2995.0,
    'qibing_base_troops' => 2995.0,
    'gongbing_base_troops' => 2185.0,
    'fangshi_base_troops' => 2185.0
};
get(164)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         168
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             253
        ]
    ],
    'bubing_base_attack' => 554.0,
    'qibing_base_attack' => 609.399999999998,
    'gongbing_base_attack' => 692.5,
    'fangshi_base_attack' => 692.5,
    'bubing_base_defence' => 277.0,
    'qibing_base_defence' => 221.599999999999,
    'gongbing_base_defence' => 193.9,
    'fangshi_base_defence' => 193.9,
    'bubing_base_troops' => 3015.0,
    'qibing_base_troops' => 3015.0,
    'gongbing_base_troops' => 2200.0,
    'fangshi_base_troops' => 2200.0
};
get(165)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         169
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             254
        ]
    ],
    'bubing_base_attack' => 558.0,
    'qibing_base_attack' => 613.799999999998,
    'gongbing_base_attack' => 697.5,
    'fangshi_base_attack' => 697.5,
    'bubing_base_defence' => 279.0,
    'qibing_base_defence' => 223.199999999999,
    'gongbing_base_defence' => 195.3,
    'fangshi_base_defence' => 195.3,
    'bubing_base_troops' => 3035.0,
    'qibing_base_troops' => 3035.0,
    'gongbing_base_troops' => 2215.0,
    'fangshi_base_troops' => 2215.0
};
get(166)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         170
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             255
        ]
    ],
    'bubing_base_attack' => 562.0,
    'qibing_base_attack' => 618.199999999998,
    'gongbing_base_attack' => 702.5,
    'fangshi_base_attack' => 702.5,
    'bubing_base_defence' => 281.0,
    'qibing_base_defence' => 224.799999999999,
    'gongbing_base_defence' => 196.700000000001,
    'fangshi_base_defence' => 196.700000000001,
    'bubing_base_troops' => 3055.0,
    'qibing_base_troops' => 3055.0,
    'gongbing_base_troops' => 2230.0,
    'fangshi_base_troops' => 2230.0
};
get(167)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         171
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             256
        ]
    ],
    'bubing_base_attack' => 566.0,
    'qibing_base_attack' => 622.599999999998,
    'gongbing_base_attack' => 707.5,
    'fangshi_base_attack' => 707.5,
    'bubing_base_defence' => 283.0,
    'qibing_base_defence' => 226.399999999999,
    'gongbing_base_defence' => 198.100000000001,
    'fangshi_base_defence' => 198.100000000001,
    'bubing_base_troops' => 3075.0,
    'qibing_base_troops' => 3075.0,
    'gongbing_base_troops' => 2245.0,
    'fangshi_base_troops' => 2245.0
};
get(168)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         172
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             257
        ]
    ],
    'bubing_base_attack' => 570.0,
    'qibing_base_attack' => 626.999999999998,
    'gongbing_base_attack' => 712.5,
    'fangshi_base_attack' => 712.5,
    'bubing_base_defence' => 285.0,
    'qibing_base_defence' => 227.999999999999,
    'gongbing_base_defence' => 199.500000000001,
    'fangshi_base_defence' => 199.500000000001,
    'bubing_base_troops' => 3095.0,
    'qibing_base_troops' => 3095.0,
    'gongbing_base_troops' => 2260.0,
    'fangshi_base_troops' => 2260.0
};
get(169)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         173
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             258
        ]
    ],
    'bubing_base_attack' => 574.0,
    'qibing_base_attack' => 631.399999999998,
    'gongbing_base_attack' => 717.5,
    'fangshi_base_attack' => 717.5,
    'bubing_base_defence' => 287.0,
    'qibing_base_defence' => 229.599999999999,
    'gongbing_base_defence' => 200.900000000001,
    'fangshi_base_defence' => 200.900000000001,
    'bubing_base_troops' => 3115.0,
    'qibing_base_troops' => 3115.0,
    'gongbing_base_troops' => 2275.0,
    'fangshi_base_troops' => 2275.0
};
get(170)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         174
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             259
        ]
    ],
    'bubing_base_attack' => 578.0,
    'qibing_base_attack' => 635.799999999998,
    'gongbing_base_attack' => 722.5,
    'fangshi_base_attack' => 722.5,
    'bubing_base_defence' => 289.0,
    'qibing_base_defence' => 231.199999999999,
    'gongbing_base_defence' => 202.300000000001,
    'fangshi_base_defence' => 202.300000000001,
    'bubing_base_troops' => 3135.0,
    'qibing_base_troops' => 3135.0,
    'gongbing_base_troops' => 2290.0,
    'fangshi_base_troops' => 2290.0
};
get(171)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         175
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             260
        ]
    ],
    'bubing_base_attack' => 582.0,
    'qibing_base_attack' => 640.199999999998,
    'gongbing_base_attack' => 727.5,
    'fangshi_base_attack' => 727.5,
    'bubing_base_defence' => 291.0,
    'qibing_base_defence' => 232.799999999999,
    'gongbing_base_defence' => 203.700000000001,
    'fangshi_base_defence' => 203.700000000001,
    'bubing_base_troops' => 3155.0,
    'qibing_base_troops' => 3155.0,
    'gongbing_base_troops' => 2305.0,
    'fangshi_base_troops' => 2305.0
};
get(172)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         176
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             261
        ]
    ],
    'bubing_base_attack' => 586.0,
    'qibing_base_attack' => 644.599999999998,
    'gongbing_base_attack' => 732.5,
    'fangshi_base_attack' => 732.5,
    'bubing_base_defence' => 293.0,
    'qibing_base_defence' => 234.399999999999,
    'gongbing_base_defence' => 205.100000000001,
    'fangshi_base_defence' => 205.100000000001,
    'bubing_base_troops' => 3175.0,
    'qibing_base_troops' => 3175.0,
    'gongbing_base_troops' => 2320.0,
    'fangshi_base_troops' => 2320.0
};
get(173)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         177
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             262
        ]
    ],
    'bubing_base_attack' => 590.0,
    'qibing_base_attack' => 648.999999999998,
    'gongbing_base_attack' => 737.5,
    'fangshi_base_attack' => 737.5,
    'bubing_base_defence' => 295.0,
    'qibing_base_defence' => 235.999999999999,
    'gongbing_base_defence' => 206.500000000001,
    'fangshi_base_defence' => 206.500000000001,
    'bubing_base_troops' => 3195.0,
    'qibing_base_troops' => 3195.0,
    'gongbing_base_troops' => 2335.0,
    'fangshi_base_troops' => 2335.0
};
get(174)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         178
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             263
        ]
    ],
    'bubing_base_attack' => 594.0,
    'qibing_base_attack' => 653.399999999998,
    'gongbing_base_attack' => 742.5,
    'fangshi_base_attack' => 742.5,
    'bubing_base_defence' => 297.0,
    'qibing_base_defence' => 237.599999999999,
    'gongbing_base_defence' => 207.900000000001,
    'fangshi_base_defence' => 207.900000000001,
    'bubing_base_troops' => 3215.0,
    'qibing_base_troops' => 3215.0,
    'gongbing_base_troops' => 2350.0,
    'fangshi_base_troops' => 2350.0
};
get(175)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         179
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             264
        ]
    ],
    'bubing_base_attack' => 598.0,
    'qibing_base_attack' => 657.799999999998,
    'gongbing_base_attack' => 747.5,
    'fangshi_base_attack' => 747.5,
    'bubing_base_defence' => 299.0,
    'qibing_base_defence' => 239.199999999999,
    'gongbing_base_defence' => 209.300000000001,
    'fangshi_base_defence' => 209.300000000001,
    'bubing_base_troops' => 3235.0,
    'qibing_base_troops' => 3235.0,
    'gongbing_base_troops' => 2365.0,
    'fangshi_base_troops' => 2365.0
};
get(176)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         180
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             265
        ]
    ],
    'bubing_base_attack' => 602.0,
    'qibing_base_attack' => 662.199999999998,
    'gongbing_base_attack' => 752.5,
    'fangshi_base_attack' => 752.5,
    'bubing_base_defence' => 301.0,
    'qibing_base_defence' => 240.799999999999,
    'gongbing_base_defence' => 210.700000000001,
    'fangshi_base_defence' => 210.700000000001,
    'bubing_base_troops' => 3255.0,
    'qibing_base_troops' => 3255.0,
    'gongbing_base_troops' => 2380.0,
    'fangshi_base_troops' => 2380.0
};
get(177)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         181
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             266
        ]
    ],
    'bubing_base_attack' => 606.0,
    'qibing_base_attack' => 666.599999999998,
    'gongbing_base_attack' => 757.5,
    'fangshi_base_attack' => 757.5,
    'bubing_base_defence' => 303.0,
    'qibing_base_defence' => 242.399999999999,
    'gongbing_base_defence' => 212.100000000001,
    'fangshi_base_defence' => 212.100000000001,
    'bubing_base_troops' => 3275.0,
    'qibing_base_troops' => 3275.0,
    'gongbing_base_troops' => 2395.0,
    'fangshi_base_troops' => 2395.0
};
get(178)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         182
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             267
        ]
    ],
    'bubing_base_attack' => 610.0,
    'qibing_base_attack' => 670.999999999998,
    'gongbing_base_attack' => 762.5,
    'fangshi_base_attack' => 762.5,
    'bubing_base_defence' => 305.0,
    'qibing_base_defence' => 243.999999999999,
    'gongbing_base_defence' => 213.500000000001,
    'fangshi_base_defence' => 213.500000000001,
    'bubing_base_troops' => 3295.0,
    'qibing_base_troops' => 3295.0,
    'gongbing_base_troops' => 2410.0,
    'fangshi_base_troops' => 2410.0
};
get(179)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         183
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             268
        ]
    ],
    'bubing_base_attack' => 614.0,
    'qibing_base_attack' => 675.399999999998,
    'gongbing_base_attack' => 767.5,
    'fangshi_base_attack' => 767.5,
    'bubing_base_defence' => 307.0,
    'qibing_base_defence' => 245.599999999999,
    'gongbing_base_defence' => 214.900000000001,
    'fangshi_base_defence' => 214.900000000001,
    'bubing_base_troops' => 3315.0,
    'qibing_base_troops' => 3315.0,
    'gongbing_base_troops' => 2425.0,
    'fangshi_base_troops' => 2425.0
};
get(180)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         184
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             269
        ]
    ],
    'bubing_base_attack' => 618.0,
    'qibing_base_attack' => 679.799999999998,
    'gongbing_base_attack' => 772.5,
    'fangshi_base_attack' => 772.5,
    'bubing_base_defence' => 309.0,
    'qibing_base_defence' => 247.199999999999,
    'gongbing_base_defence' => 216.300000000001,
    'fangshi_base_defence' => 216.300000000001,
    'bubing_base_troops' => 3335.0,
    'qibing_base_troops' => 3335.0,
    'gongbing_base_troops' => 2440.0,
    'fangshi_base_troops' => 2440.0
};
get(181)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         185
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             270
        ]
    ],
    'bubing_base_attack' => 622.0,
    'qibing_base_attack' => 684.199999999998,
    'gongbing_base_attack' => 777.5,
    'fangshi_base_attack' => 777.5,
    'bubing_base_defence' => 311.0,
    'qibing_base_defence' => 248.799999999999,
    'gongbing_base_defence' => 217.700000000001,
    'fangshi_base_defence' => 217.700000000001,
    'bubing_base_troops' => 3355.0,
    'qibing_base_troops' => 3355.0,
    'gongbing_base_troops' => 2455.0,
    'fangshi_base_troops' => 2455.0
};
get(182)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         186
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             271
        ]
    ],
    'bubing_base_attack' => 626.0,
    'qibing_base_attack' => 688.599999999998,
    'gongbing_base_attack' => 782.5,
    'fangshi_base_attack' => 782.5,
    'bubing_base_defence' => 313.0,
    'qibing_base_defence' => 250.399999999999,
    'gongbing_base_defence' => 219.100000000001,
    'fangshi_base_defence' => 219.100000000001,
    'bubing_base_troops' => 3375.0,
    'qibing_base_troops' => 3375.0,
    'gongbing_base_troops' => 2470.0,
    'fangshi_base_troops' => 2470.0
};
get(183)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         187
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             272
        ]
    ],
    'bubing_base_attack' => 630.0,
    'qibing_base_attack' => 692.999999999998,
    'gongbing_base_attack' => 787.5,
    'fangshi_base_attack' => 787.5,
    'bubing_base_defence' => 315.0,
    'qibing_base_defence' => 251.999999999999,
    'gongbing_base_defence' => 220.500000000001,
    'fangshi_base_defence' => 220.500000000001,
    'bubing_base_troops' => 3395.0,
    'qibing_base_troops' => 3395.0,
    'gongbing_base_troops' => 2485.0,
    'fangshi_base_troops' => 2485.0
};
get(184)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         188
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             273
        ]
    ],
    'bubing_base_attack' => 634.0,
    'qibing_base_attack' => 697.399999999998,
    'gongbing_base_attack' => 792.5,
    'fangshi_base_attack' => 792.5,
    'bubing_base_defence' => 317.0,
    'qibing_base_defence' => 253.599999999999,
    'gongbing_base_defence' => 221.900000000001,
    'fangshi_base_defence' => 221.900000000001,
    'bubing_base_troops' => 3415.0,
    'qibing_base_troops' => 3415.0,
    'gongbing_base_troops' => 2500.0,
    'fangshi_base_troops' => 2500.0
};
get(185)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         189
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             274
        ]
    ],
    'bubing_base_attack' => 638.0,
    'qibing_base_attack' => 701.799999999998,
    'gongbing_base_attack' => 797.5,
    'fangshi_base_attack' => 797.5,
    'bubing_base_defence' => 319.0,
    'qibing_base_defence' => 255.199999999999,
    'gongbing_base_defence' => 223.300000000001,
    'fangshi_base_defence' => 223.300000000001,
    'bubing_base_troops' => 3435.0,
    'qibing_base_troops' => 3435.0,
    'gongbing_base_troops' => 2515.0,
    'fangshi_base_troops' => 2515.0
};
get(186)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         190
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             275
        ]
    ],
    'bubing_base_attack' => 642.0,
    'qibing_base_attack' => 706.199999999998,
    'gongbing_base_attack' => 802.5,
    'fangshi_base_attack' => 802.5,
    'bubing_base_defence' => 321.0,
    'qibing_base_defence' => 256.799999999999,
    'gongbing_base_defence' => 224.700000000001,
    'fangshi_base_defence' => 224.700000000001,
    'bubing_base_troops' => 3455.0,
    'qibing_base_troops' => 3455.0,
    'gongbing_base_troops' => 2530.0,
    'fangshi_base_troops' => 2530.0
};
get(187)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         191
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             276
        ]
    ],
    'bubing_base_attack' => 646.0,
    'qibing_base_attack' => 710.599999999998,
    'gongbing_base_attack' => 807.5,
    'fangshi_base_attack' => 807.5,
    'bubing_base_defence' => 323.0,
    'qibing_base_defence' => 258.399999999999,
    'gongbing_base_defence' => 226.100000000001,
    'fangshi_base_defence' => 226.100000000001,
    'bubing_base_troops' => 3475.0,
    'qibing_base_troops' => 3475.0,
    'gongbing_base_troops' => 2545.0,
    'fangshi_base_troops' => 2545.0
};
get(188)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         192
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             277
        ]
    ],
    'bubing_base_attack' => 650.0,
    'qibing_base_attack' => 714.999999999998,
    'gongbing_base_attack' => 812.5,
    'fangshi_base_attack' => 812.5,
    'bubing_base_defence' => 325.0,
    'qibing_base_defence' => 259.999999999999,
    'gongbing_base_defence' => 227.500000000001,
    'fangshi_base_defence' => 227.500000000001,
    'bubing_base_troops' => 3495.0,
    'qibing_base_troops' => 3495.0,
    'gongbing_base_troops' => 2560.0,
    'fangshi_base_troops' => 2560.0
};
get(189)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         193
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             278
        ]
    ],
    'bubing_base_attack' => 654.0,
    'qibing_base_attack' => 719.399999999998,
    'gongbing_base_attack' => 817.5,
    'fangshi_base_attack' => 817.5,
    'bubing_base_defence' => 327.0,
    'qibing_base_defence' => 261.599999999999,
    'gongbing_base_defence' => 228.900000000001,
    'fangshi_base_defence' => 228.900000000001,
    'bubing_base_troops' => 3515.0,
    'qibing_base_troops' => 3515.0,
    'gongbing_base_troops' => 2575.0,
    'fangshi_base_troops' => 2575.0
};
get(190)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         194
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             279
        ]
    ],
    'bubing_base_attack' => 658.0,
    'qibing_base_attack' => 723.799999999998,
    'gongbing_base_attack' => 822.5,
    'fangshi_base_attack' => 822.5,
    'bubing_base_defence' => 329.0,
    'qibing_base_defence' => 263.199999999999,
    'gongbing_base_defence' => 230.300000000001,
    'fangshi_base_defence' => 230.300000000001,
    'bubing_base_troops' => 3535.0,
    'qibing_base_troops' => 3535.0,
    'gongbing_base_troops' => 2590.0,
    'fangshi_base_troops' => 2590.0
};
get(191)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         195
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             280
        ]
    ],
    'bubing_base_attack' => 662.0,
    'qibing_base_attack' => 728.199999999998,
    'gongbing_base_attack' => 827.5,
    'fangshi_base_attack' => 827.5,
    'bubing_base_defence' => 331.0,
    'qibing_base_defence' => 264.8,
    'gongbing_base_defence' => 231.700000000001,
    'fangshi_base_defence' => 231.700000000001,
    'bubing_base_troops' => 3555.0,
    'qibing_base_troops' => 3555.0,
    'gongbing_base_troops' => 2605.0,
    'fangshi_base_troops' => 2605.0
};
get(192)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         196
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             281
        ]
    ],
    'bubing_base_attack' => 666.0,
    'qibing_base_attack' => 732.599999999998,
    'gongbing_base_attack' => 832.5,
    'fangshi_base_attack' => 832.5,
    'bubing_base_defence' => 333.0,
    'qibing_base_defence' => 266.4,
    'gongbing_base_defence' => 233.100000000001,
    'fangshi_base_defence' => 233.100000000001,
    'bubing_base_troops' => 3575.0,
    'qibing_base_troops' => 3575.0,
    'gongbing_base_troops' => 2620.0,
    'fangshi_base_troops' => 2620.0
};
get(193)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         197
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             282
        ]
    ],
    'bubing_base_attack' => 670.0,
    'qibing_base_attack' => 736.999999999998,
    'gongbing_base_attack' => 837.5,
    'fangshi_base_attack' => 837.5,
    'bubing_base_defence' => 335.0,
    'qibing_base_defence' => 268.0,
    'gongbing_base_defence' => 234.500000000001,
    'fangshi_base_defence' => 234.500000000001,
    'bubing_base_troops' => 3595.0,
    'qibing_base_troops' => 3595.0,
    'gongbing_base_troops' => 2635.0,
    'fangshi_base_troops' => 2635.0
};
get(194)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         198
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             283
        ]
    ],
    'bubing_base_attack' => 674.0,
    'qibing_base_attack' => 741.399999999998,
    'gongbing_base_attack' => 842.5,
    'fangshi_base_attack' => 842.5,
    'bubing_base_defence' => 337.0,
    'qibing_base_defence' => 269.6,
    'gongbing_base_defence' => 235.900000000001,
    'fangshi_base_defence' => 235.900000000001,
    'bubing_base_troops' => 3615.0,
    'qibing_base_troops' => 3615.0,
    'gongbing_base_troops' => 2650.0,
    'fangshi_base_troops' => 2650.0
};
get(195)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         199
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             284
        ]
    ],
    'bubing_base_attack' => 678.0,
    'qibing_base_attack' => 745.799999999998,
    'gongbing_base_attack' => 847.5,
    'fangshi_base_attack' => 847.5,
    'bubing_base_defence' => 339.0,
    'qibing_base_defence' => 271.2,
    'gongbing_base_defence' => 237.300000000001,
    'fangshi_base_defence' => 237.300000000001,
    'bubing_base_troops' => 3635.0,
    'qibing_base_troops' => 3635.0,
    'gongbing_base_troops' => 2665.0,
    'fangshi_base_troops' => 2665.0
};
get(196)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         200
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             285
        ]
    ],
    'bubing_base_attack' => 682.0,
    'qibing_base_attack' => 750.199999999998,
    'gongbing_base_attack' => 852.5,
    'fangshi_base_attack' => 852.5,
    'bubing_base_defence' => 341.0,
    'qibing_base_defence' => 272.8,
    'gongbing_base_defence' => 238.700000000001,
    'fangshi_base_defence' => 238.700000000001,
    'bubing_base_troops' => 3655.0,
    'qibing_base_troops' => 3655.0,
    'gongbing_base_troops' => 2680.0,
    'fangshi_base_troops' => 2680.0
};
get(197)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         201
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             286
        ]
    ],
    'bubing_base_attack' => 686.0,
    'qibing_base_attack' => 754.599999999998,
    'gongbing_base_attack' => 857.5,
    'fangshi_base_attack' => 857.5,
    'bubing_base_defence' => 343.0,
    'qibing_base_defence' => 274.4,
    'gongbing_base_defence' => 240.100000000001,
    'fangshi_base_defence' => 240.100000000001,
    'bubing_base_troops' => 3675.0,
    'qibing_base_troops' => 3675.0,
    'gongbing_base_troops' => 2695.0,
    'fangshi_base_troops' => 2695.0
};
get(198)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         202
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             287
        ]
    ],
    'bubing_base_attack' => 690.0,
    'qibing_base_attack' => 758.999999999998,
    'gongbing_base_attack' => 862.5,
    'fangshi_base_attack' => 862.5,
    'bubing_base_defence' => 345.0,
    'qibing_base_defence' => 276.0,
    'gongbing_base_defence' => 241.500000000001,
    'fangshi_base_defence' => 241.500000000001,
    'bubing_base_troops' => 3695.0,
    'qibing_base_troops' => 3695.0,
    'gongbing_base_troops' => 2710.0,
    'fangshi_base_troops' => 2710.0
};
get(199)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         203
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             288
        ]
    ],
    'bubing_base_attack' => 694.0,
    'qibing_base_attack' => 763.399999999998,
    'gongbing_base_attack' => 867.5,
    'fangshi_base_attack' => 867.5,
    'bubing_base_defence' => 347.0,
    'qibing_base_defence' => 277.6,
    'gongbing_base_defence' => 242.900000000001,
    'fangshi_base_defence' => 242.900000000001,
    'bubing_base_troops' => 3715.0,
    'qibing_base_troops' => 3715.0,
    'gongbing_base_troops' => 2725.0,
    'fangshi_base_troops' => 2725.0
};
get(200)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         204
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             289
        ]
    ],
    'bubing_base_attack' => 698.0,
    'qibing_base_attack' => 767.799999999998,
    'gongbing_base_attack' => 872.5,
    'fangshi_base_attack' => 872.5,
    'bubing_base_defence' => 349.0,
    'qibing_base_defence' => 279.2,
    'gongbing_base_defence' => 244.300000000001,
    'fangshi_base_defence' => 244.300000000001,
    'bubing_base_troops' => 3735.0,
    'qibing_base_troops' => 3735.0,
    'gongbing_base_troops' => 2740.0,
    'fangshi_base_troops' => 2740.0
};
get(201)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         205
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             290
        ]
    ],
    'bubing_base_attack' => 702.0,
    'qibing_base_attack' => 772.199999999998,
    'gongbing_base_attack' => 877.5,
    'fangshi_base_attack' => 877.5,
    'bubing_base_defence' => 351.0,
    'qibing_base_defence' => 280.8,
    'gongbing_base_defence' => 245.700000000001,
    'fangshi_base_defence' => 245.700000000001,
    'bubing_base_troops' => 3755.0,
    'qibing_base_troops' => 3755.0,
    'gongbing_base_troops' => 2755.0,
    'fangshi_base_troops' => 2755.0
};
get(202)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         206
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             291
        ]
    ],
    'bubing_base_attack' => 706.0,
    'qibing_base_attack' => 776.599999999998,
    'gongbing_base_attack' => 882.5,
    'fangshi_base_attack' => 882.5,
    'bubing_base_defence' => 353.0,
    'qibing_base_defence' => 282.4,
    'gongbing_base_defence' => 247.100000000001,
    'fangshi_base_defence' => 247.100000000001,
    'bubing_base_troops' => 3775.0,
    'qibing_base_troops' => 3775.0,
    'gongbing_base_troops' => 2770.0,
    'fangshi_base_troops' => 2770.0
};
get(203)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         207
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             292
        ]
    ],
    'bubing_base_attack' => 710.0,
    'qibing_base_attack' => 780.999999999998,
    'gongbing_base_attack' => 887.5,
    'fangshi_base_attack' => 887.5,
    'bubing_base_defence' => 355.0,
    'qibing_base_defence' => 284.0,
    'gongbing_base_defence' => 248.500000000001,
    'fangshi_base_defence' => 248.500000000001,
    'bubing_base_troops' => 3795.0,
    'qibing_base_troops' => 3795.0,
    'gongbing_base_troops' => 2785.0,
    'fangshi_base_troops' => 2785.0
};
get(204)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         208
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             293
        ]
    ],
    'bubing_base_attack' => 714.0,
    'qibing_base_attack' => 785.399999999997,
    'gongbing_base_attack' => 892.5,
    'fangshi_base_attack' => 892.5,
    'bubing_base_defence' => 357.0,
    'qibing_base_defence' => 285.6,
    'gongbing_base_defence' => 249.900000000001,
    'fangshi_base_defence' => 249.900000000001,
    'bubing_base_troops' => 3815.0,
    'qibing_base_troops' => 3815.0,
    'gongbing_base_troops' => 2800.0,
    'fangshi_base_troops' => 2800.0
};
get(205)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         209
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             294
        ]
    ],
    'bubing_base_attack' => 718.0,
    'qibing_base_attack' => 789.799999999997,
    'gongbing_base_attack' => 897.5,
    'fangshi_base_attack' => 897.5,
    'bubing_base_defence' => 359.0,
    'qibing_base_defence' => 287.2,
    'gongbing_base_defence' => 251.300000000001,
    'fangshi_base_defence' => 251.300000000001,
    'bubing_base_troops' => 3835.0,
    'qibing_base_troops' => 3835.0,
    'gongbing_base_troops' => 2815.0,
    'fangshi_base_troops' => 2815.0
};
get(206)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         210
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             295
        ]
    ],
    'bubing_base_attack' => 722.0,
    'qibing_base_attack' => 794.199999999997,
    'gongbing_base_attack' => 902.5,
    'fangshi_base_attack' => 902.5,
    'bubing_base_defence' => 361.0,
    'qibing_base_defence' => 288.8,
    'gongbing_base_defence' => 252.700000000001,
    'fangshi_base_defence' => 252.700000000001,
    'bubing_base_troops' => 3855.0,
    'qibing_base_troops' => 3855.0,
    'gongbing_base_troops' => 2830.0,
    'fangshi_base_troops' => 2830.0
};
get(207)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         211
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             296
        ]
    ],
    'bubing_base_attack' => 726.0,
    'qibing_base_attack' => 798.599999999997,
    'gongbing_base_attack' => 907.5,
    'fangshi_base_attack' => 907.5,
    'bubing_base_defence' => 363.0,
    'qibing_base_defence' => 290.4,
    'gongbing_base_defence' => 254.100000000001,
    'fangshi_base_defence' => 254.100000000001,
    'bubing_base_troops' => 3875.0,
    'qibing_base_troops' => 3875.0,
    'gongbing_base_troops' => 2845.0,
    'fangshi_base_troops' => 2845.0
};
get(208)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         212
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             297
        ]
    ],
    'bubing_base_attack' => 730.0,
    'qibing_base_attack' => 802.999999999997,
    'gongbing_base_attack' => 912.5,
    'fangshi_base_attack' => 912.5,
    'bubing_base_defence' => 365.0,
    'qibing_base_defence' => 292.0,
    'gongbing_base_defence' => 255.500000000001,
    'fangshi_base_defence' => 255.500000000001,
    'bubing_base_troops' => 3895.0,
    'qibing_base_troops' => 3895.0,
    'gongbing_base_troops' => 2860.0,
    'fangshi_base_troops' => 2860.0
};
get(209)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         213
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             298
        ]
    ],
    'bubing_base_attack' => 734.0,
    'qibing_base_attack' => 807.399999999997,
    'gongbing_base_attack' => 917.5,
    'fangshi_base_attack' => 917.5,
    'bubing_base_defence' => 367.0,
    'qibing_base_defence' => 293.6,
    'gongbing_base_defence' => 256.900000000001,
    'fangshi_base_defence' => 256.900000000001,
    'bubing_base_troops' => 3915.0,
    'qibing_base_troops' => 3915.0,
    'gongbing_base_troops' => 2875.0,
    'fangshi_base_troops' => 2875.0
};
get(210)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         214
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             299
        ]
    ],
    'bubing_base_attack' => 738.0,
    'qibing_base_attack' => 811.799999999997,
    'gongbing_base_attack' => 922.5,
    'fangshi_base_attack' => 922.5,
    'bubing_base_defence' => 369.0,
    'qibing_base_defence' => 295.2,
    'gongbing_base_defence' => 258.300000000001,
    'fangshi_base_defence' => 258.300000000001,
    'bubing_base_troops' => 3935.0,
    'qibing_base_troops' => 3935.0,
    'gongbing_base_troops' => 2890.0,
    'fangshi_base_troops' => 2890.0
};
get(211)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         215
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             300
        ]
    ],
    'bubing_base_attack' => 742.0,
    'qibing_base_attack' => 816.199999999997,
    'gongbing_base_attack' => 927.5,
    'fangshi_base_attack' => 927.5,
    'bubing_base_defence' => 371.0,
    'qibing_base_defence' => 296.8,
    'gongbing_base_defence' => 259.700000000001,
    'fangshi_base_defence' => 259.700000000001,
    'bubing_base_troops' => 3955.0,
    'qibing_base_troops' => 3955.0,
    'gongbing_base_troops' => 2905.0,
    'fangshi_base_troops' => 2905.0
};
get(212)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         216
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             301
        ]
    ],
    'bubing_base_attack' => 746.0,
    'qibing_base_attack' => 820.599999999997,
    'gongbing_base_attack' => 932.5,
    'fangshi_base_attack' => 932.5,
    'bubing_base_defence' => 373.0,
    'qibing_base_defence' => 298.4,
    'gongbing_base_defence' => 261.100000000001,
    'fangshi_base_defence' => 261.100000000001,
    'bubing_base_troops' => 3975.0,
    'qibing_base_troops' => 3975.0,
    'gongbing_base_troops' => 2920.0,
    'fangshi_base_troops' => 2920.0
};
get(213)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         217
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             302
        ]
    ],
    'bubing_base_attack' => 750.0,
    'qibing_base_attack' => 824.999999999997,
    'gongbing_base_attack' => 937.5,
    'fangshi_base_attack' => 937.5,
    'bubing_base_defence' => 375.0,
    'qibing_base_defence' => 300.0,
    'gongbing_base_defence' => 262.500000000001,
    'fangshi_base_defence' => 262.500000000001,
    'bubing_base_troops' => 3995.0,
    'qibing_base_troops' => 3995.0,
    'gongbing_base_troops' => 2935.0,
    'fangshi_base_troops' => 2935.0
};
get(214)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         218
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             303
        ]
    ],
    'bubing_base_attack' => 754.0,
    'qibing_base_attack' => 829.399999999997,
    'gongbing_base_attack' => 942.5,
    'fangshi_base_attack' => 942.5,
    'bubing_base_defence' => 377.0,
    'qibing_base_defence' => 301.6,
    'gongbing_base_defence' => 263.900000000001,
    'fangshi_base_defence' => 263.900000000001,
    'bubing_base_troops' => 4015.0,
    'qibing_base_troops' => 4015.0,
    'gongbing_base_troops' => 2950.0,
    'fangshi_base_troops' => 2950.0
};
get(215)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         219
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             304
        ]
    ],
    'bubing_base_attack' => 758.0,
    'qibing_base_attack' => 833.799999999997,
    'gongbing_base_attack' => 947.5,
    'fangshi_base_attack' => 947.5,
    'bubing_base_defence' => 379.0,
    'qibing_base_defence' => 303.2,
    'gongbing_base_defence' => 265.300000000001,
    'fangshi_base_defence' => 265.300000000001,
    'bubing_base_troops' => 4035.0,
    'qibing_base_troops' => 4035.0,
    'gongbing_base_troops' => 2965.0,
    'fangshi_base_troops' => 2965.0
};
get(216)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         220
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             305
        ]
    ],
    'bubing_base_attack' => 762.0,
    'qibing_base_attack' => 838.199999999997,
    'gongbing_base_attack' => 952.5,
    'fangshi_base_attack' => 952.5,
    'bubing_base_defence' => 381.0,
    'qibing_base_defence' => 304.8,
    'gongbing_base_defence' => 266.700000000001,
    'fangshi_base_defence' => 266.700000000001,
    'bubing_base_troops' => 4055.0,
    'qibing_base_troops' => 4055.0,
    'gongbing_base_troops' => 2980.0,
    'fangshi_base_troops' => 2980.0
};
get(217)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         221
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             306
        ]
    ],
    'bubing_base_attack' => 766.0,
    'qibing_base_attack' => 842.599999999997,
    'gongbing_base_attack' => 957.5,
    'fangshi_base_attack' => 957.5,
    'bubing_base_defence' => 383.0,
    'qibing_base_defence' => 306.4,
    'gongbing_base_defence' => 268.100000000001,
    'fangshi_base_defence' => 268.100000000001,
    'bubing_base_troops' => 4075.0,
    'qibing_base_troops' => 4075.0,
    'gongbing_base_troops' => 2995.0,
    'fangshi_base_troops' => 2995.0
};
get(218)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         222
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             307
        ]
    ],
    'bubing_base_attack' => 770.0,
    'qibing_base_attack' => 846.999999999997,
    'gongbing_base_attack' => 962.5,
    'fangshi_base_attack' => 962.5,
    'bubing_base_defence' => 385.0,
    'qibing_base_defence' => 308.0,
    'gongbing_base_defence' => 269.500000000001,
    'fangshi_base_defence' => 269.500000000001,
    'bubing_base_troops' => 4095.0,
    'qibing_base_troops' => 4095.0,
    'gongbing_base_troops' => 3010.0,
    'fangshi_base_troops' => 3010.0
};
get(219)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         223
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             308
        ]
    ],
    'bubing_base_attack' => 774.0,
    'qibing_base_attack' => 851.399999999997,
    'gongbing_base_attack' => 967.5,
    'fangshi_base_attack' => 967.5,
    'bubing_base_defence' => 387.0,
    'qibing_base_defence' => 309.6,
    'gongbing_base_defence' => 270.9,
    'fangshi_base_defence' => 270.9,
    'bubing_base_troops' => 4115.0,
    'qibing_base_troops' => 4115.0,
    'gongbing_base_troops' => 3025.0,
    'fangshi_base_troops' => 3025.0
};
get(220)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         224
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             309
        ]
    ],
    'bubing_base_attack' => 778.0,
    'qibing_base_attack' => 855.799999999997,
    'gongbing_base_attack' => 972.5,
    'fangshi_base_attack' => 972.5,
    'bubing_base_defence' => 389.0,
    'qibing_base_defence' => 311.2,
    'gongbing_base_defence' => 272.3,
    'fangshi_base_defence' => 272.3,
    'bubing_base_troops' => 4135.0,
    'qibing_base_troops' => 4135.0,
    'gongbing_base_troops' => 3040.0,
    'fangshi_base_troops' => 3040.0
};
get(221)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         225
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             310
        ]
    ],
    'bubing_base_attack' => 782.0,
    'qibing_base_attack' => 860.199999999997,
    'gongbing_base_attack' => 977.5,
    'fangshi_base_attack' => 977.5,
    'bubing_base_defence' => 391.0,
    'qibing_base_defence' => 312.8,
    'gongbing_base_defence' => 273.7,
    'fangshi_base_defence' => 273.7,
    'bubing_base_troops' => 4155.0,
    'qibing_base_troops' => 4155.0,
    'gongbing_base_troops' => 3055.0,
    'fangshi_base_troops' => 3055.0
};
get(222)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         226
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             311
        ]
    ],
    'bubing_base_attack' => 786.0,
    'qibing_base_attack' => 864.599999999997,
    'gongbing_base_attack' => 982.5,
    'fangshi_base_attack' => 982.5,
    'bubing_base_defence' => 393.0,
    'qibing_base_defence' => 314.4,
    'gongbing_base_defence' => 275.1,
    'fangshi_base_defence' => 275.1,
    'bubing_base_troops' => 4175.0,
    'qibing_base_troops' => 4175.0,
    'gongbing_base_troops' => 3070.0,
    'fangshi_base_troops' => 3070.0
};
get(223)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         227
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             312
        ]
    ],
    'bubing_base_attack' => 790.0,
    'qibing_base_attack' => 868.999999999997,
    'gongbing_base_attack' => 987.5,
    'fangshi_base_attack' => 987.5,
    'bubing_base_defence' => 395.0,
    'qibing_base_defence' => 316.0,
    'gongbing_base_defence' => 276.5,
    'fangshi_base_defence' => 276.5,
    'bubing_base_troops' => 4195.0,
    'qibing_base_troops' => 4195.0,
    'gongbing_base_troops' => 3085.0,
    'fangshi_base_troops' => 3085.0
};
get(224)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         228
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             313
        ]
    ],
    'bubing_base_attack' => 794.0,
    'qibing_base_attack' => 873.399999999997,
    'gongbing_base_attack' => 992.5,
    'fangshi_base_attack' => 992.5,
    'bubing_base_defence' => 397.0,
    'qibing_base_defence' => 317.6,
    'gongbing_base_defence' => 277.9,
    'fangshi_base_defence' => 277.9,
    'bubing_base_troops' => 4215.0,
    'qibing_base_troops' => 4215.0,
    'gongbing_base_troops' => 3100.0,
    'fangshi_base_troops' => 3100.0
};
get(225)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         229
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             314
        ]
    ],
    'bubing_base_attack' => 798.0,
    'qibing_base_attack' => 877.799999999997,
    'gongbing_base_attack' => 997.5,
    'fangshi_base_attack' => 997.5,
    'bubing_base_defence' => 399.0,
    'qibing_base_defence' => 319.2,
    'gongbing_base_defence' => 279.3,
    'fangshi_base_defence' => 279.3,
    'bubing_base_troops' => 4235.0,
    'qibing_base_troops' => 4235.0,
    'gongbing_base_troops' => 3115.0,
    'fangshi_base_troops' => 3115.0
};
get(226)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         230
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             315
        ]
    ],
    'bubing_base_attack' => 802.0,
    'qibing_base_attack' => 882.199999999997,
    'gongbing_base_attack' => 1002.5,
    'fangshi_base_attack' => 1002.5,
    'bubing_base_defence' => 401.0,
    'qibing_base_defence' => 320.8,
    'gongbing_base_defence' => 280.7,
    'fangshi_base_defence' => 280.7,
    'bubing_base_troops' => 4255.0,
    'qibing_base_troops' => 4255.0,
    'gongbing_base_troops' => 3130.0,
    'fangshi_base_troops' => 3130.0
};
get(227)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         231
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             316
        ]
    ],
    'bubing_base_attack' => 806.0,
    'qibing_base_attack' => 886.599999999997,
    'gongbing_base_attack' => 1007.5,
    'fangshi_base_attack' => 1007.5,
    'bubing_base_defence' => 403.0,
    'qibing_base_defence' => 322.4,
    'gongbing_base_defence' => 282.1,
    'fangshi_base_defence' => 282.1,
    'bubing_base_troops' => 4275.0,
    'qibing_base_troops' => 4275.0,
    'gongbing_base_troops' => 3145.0,
    'fangshi_base_troops' => 3145.0
};
get(228)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         232
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             317
        ]
    ],
    'bubing_base_attack' => 810.0,
    'qibing_base_attack' => 890.999999999997,
    'gongbing_base_attack' => 1012.5,
    'fangshi_base_attack' => 1012.5,
    'bubing_base_defence' => 405.0,
    'qibing_base_defence' => 324.0,
    'gongbing_base_defence' => 283.5,
    'fangshi_base_defence' => 283.5,
    'bubing_base_troops' => 4295.0,
    'qibing_base_troops' => 4295.0,
    'gongbing_base_troops' => 3160.0,
    'fangshi_base_troops' => 3160.0
};
get(229)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         233
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             318
        ]
    ],
    'bubing_base_attack' => 814.0,
    'qibing_base_attack' => 895.399999999997,
    'gongbing_base_attack' => 1017.5,
    'fangshi_base_attack' => 1017.5,
    'bubing_base_defence' => 407.0,
    'qibing_base_defence' => 325.6,
    'gongbing_base_defence' => 284.9,
    'fangshi_base_defence' => 284.9,
    'bubing_base_troops' => 4315.0,
    'qibing_base_troops' => 4315.0,
    'gongbing_base_troops' => 3175.0,
    'fangshi_base_troops' => 3175.0
};
get(230)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         234
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             319
        ]
    ],
    'bubing_base_attack' => 818.0,
    'qibing_base_attack' => 899.799999999997,
    'gongbing_base_attack' => 1022.5,
    'fangshi_base_attack' => 1022.5,
    'bubing_base_defence' => 409.0,
    'qibing_base_defence' => 327.2,
    'gongbing_base_defence' => 286.3,
    'fangshi_base_defence' => 286.3,
    'bubing_base_troops' => 4335.0,
    'qibing_base_troops' => 4335.0,
    'gongbing_base_troops' => 3190.0,
    'fangshi_base_troops' => 3190.0
};
get(231)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         235
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             320
        ]
    ],
    'bubing_base_attack' => 822.0,
    'qibing_base_attack' => 904.199999999997,
    'gongbing_base_attack' => 1027.5,
    'fangshi_base_attack' => 1027.5,
    'bubing_base_defence' => 411.0,
    'qibing_base_defence' => 328.8,
    'gongbing_base_defence' => 287.7,
    'fangshi_base_defence' => 287.7,
    'bubing_base_troops' => 4355.0,
    'qibing_base_troops' => 4355.0,
    'gongbing_base_troops' => 3205.0,
    'fangshi_base_troops' => 3205.0
};
get(232)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         236
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             321
        ]
    ],
    'bubing_base_attack' => 826.0,
    'qibing_base_attack' => 908.599999999997,
    'gongbing_base_attack' => 1032.5,
    'fangshi_base_attack' => 1032.5,
    'bubing_base_defence' => 413.0,
    'qibing_base_defence' => 330.4,
    'gongbing_base_defence' => 289.1,
    'fangshi_base_defence' => 289.1,
    'bubing_base_troops' => 4375.0,
    'qibing_base_troops' => 4375.0,
    'gongbing_base_troops' => 3220.0,
    'fangshi_base_troops' => 3220.0
};
get(233)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         237
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             322
        ]
    ],
    'bubing_base_attack' => 830.0,
    'qibing_base_attack' => 912.999999999997,
    'gongbing_base_attack' => 1037.5,
    'fangshi_base_attack' => 1037.5,
    'bubing_base_defence' => 415.0,
    'qibing_base_defence' => 332.0,
    'gongbing_base_defence' => 290.5,
    'fangshi_base_defence' => 290.5,
    'bubing_base_troops' => 4395.0,
    'qibing_base_troops' => 4395.0,
    'gongbing_base_troops' => 3235.0,
    'fangshi_base_troops' => 3235.0
};
get(234)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         238
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             323
        ]
    ],
    'bubing_base_attack' => 834.0,
    'qibing_base_attack' => 917.399999999997,
    'gongbing_base_attack' => 1042.5,
    'fangshi_base_attack' => 1042.5,
    'bubing_base_defence' => 417.0,
    'qibing_base_defence' => 333.6,
    'gongbing_base_defence' => 291.9,
    'fangshi_base_defence' => 291.9,
    'bubing_base_troops' => 4415.0,
    'qibing_base_troops' => 4415.0,
    'gongbing_base_troops' => 3250.0,
    'fangshi_base_troops' => 3250.0
};
get(235)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         239
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             324
        ]
    ],
    'bubing_base_attack' => 838.0,
    'qibing_base_attack' => 921.799999999997,
    'gongbing_base_attack' => 1047.5,
    'fangshi_base_attack' => 1047.5,
    'bubing_base_defence' => 419.0,
    'qibing_base_defence' => 335.200000000001,
    'gongbing_base_defence' => 293.3,
    'fangshi_base_defence' => 293.3,
    'bubing_base_troops' => 4435.0,
    'qibing_base_troops' => 4435.0,
    'gongbing_base_troops' => 3265.0,
    'fangshi_base_troops' => 3265.0
};
get(236)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         240
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             325
        ]
    ],
    'bubing_base_attack' => 842.0,
    'qibing_base_attack' => 926.199999999997,
    'gongbing_base_attack' => 1052.5,
    'fangshi_base_attack' => 1052.5,
    'bubing_base_defence' => 421.0,
    'qibing_base_defence' => 336.800000000001,
    'gongbing_base_defence' => 294.7,
    'fangshi_base_defence' => 294.7,
    'bubing_base_troops' => 4455.0,
    'qibing_base_troops' => 4455.0,
    'gongbing_base_troops' => 3280.0,
    'fangshi_base_troops' => 3280.0
};
get(237)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         241
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             326
        ]
    ],
    'bubing_base_attack' => 846.0,
    'qibing_base_attack' => 930.599999999997,
    'gongbing_base_attack' => 1057.5,
    'fangshi_base_attack' => 1057.5,
    'bubing_base_defence' => 423.0,
    'qibing_base_defence' => 338.400000000001,
    'gongbing_base_defence' => 296.1,
    'fangshi_base_defence' => 296.1,
    'bubing_base_troops' => 4475.0,
    'qibing_base_troops' => 4475.0,
    'gongbing_base_troops' => 3295.0,
    'fangshi_base_troops' => 3295.0
};
get(238)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         242
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             327
        ]
    ],
    'bubing_base_attack' => 850.0,
    'qibing_base_attack' => 934.999999999997,
    'gongbing_base_attack' => 1062.5,
    'fangshi_base_attack' => 1062.5,
    'bubing_base_defence' => 425.0,
    'qibing_base_defence' => 340.000000000001,
    'gongbing_base_defence' => 297.5,
    'fangshi_base_defence' => 297.5,
    'bubing_base_troops' => 4495.0,
    'qibing_base_troops' => 4495.0,
    'gongbing_base_troops' => 3310.0,
    'fangshi_base_troops' => 3310.0
};
get(239)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         243
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             328
        ]
    ],
    'bubing_base_attack' => 854.0,
    'qibing_base_attack' => 939.399999999997,
    'gongbing_base_attack' => 1067.5,
    'fangshi_base_attack' => 1067.5,
    'bubing_base_defence' => 427.0,
    'qibing_base_defence' => 341.600000000001,
    'gongbing_base_defence' => 298.9,
    'fangshi_base_defence' => 298.9,
    'bubing_base_troops' => 4515.0,
    'qibing_base_troops' => 4515.0,
    'gongbing_base_troops' => 3325.0,
    'fangshi_base_troops' => 3325.0
};
get(240)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         244
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             329
        ]
    ],
    'bubing_base_attack' => 858.0,
    'qibing_base_attack' => 943.799999999997,
    'gongbing_base_attack' => 1072.5,
    'fangshi_base_attack' => 1072.5,
    'bubing_base_defence' => 429.0,
    'qibing_base_defence' => 343.200000000001,
    'gongbing_base_defence' => 300.3,
    'fangshi_base_defence' => 300.3,
    'bubing_base_troops' => 4535.0,
    'qibing_base_troops' => 4535.0,
    'gongbing_base_troops' => 3340.0,
    'fangshi_base_troops' => 3340.0
};
get(241)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         245
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             330
        ]
    ],
    'bubing_base_attack' => 862.0,
    'qibing_base_attack' => 948.199999999997,
    'gongbing_base_attack' => 1077.5,
    'fangshi_base_attack' => 1077.5,
    'bubing_base_defence' => 431.0,
    'qibing_base_defence' => 344.800000000001,
    'gongbing_base_defence' => 301.7,
    'fangshi_base_defence' => 301.7,
    'bubing_base_troops' => 4555.0,
    'qibing_base_troops' => 4555.0,
    'gongbing_base_troops' => 3355.0,
    'fangshi_base_troops' => 3355.0
};
get(242)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         246
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             331
        ]
    ],
    'bubing_base_attack' => 866.0,
    'qibing_base_attack' => 952.599999999997,
    'gongbing_base_attack' => 1082.5,
    'fangshi_base_attack' => 1082.5,
    'bubing_base_defence' => 433.0,
    'qibing_base_defence' => 346.400000000001,
    'gongbing_base_defence' => 303.1,
    'fangshi_base_defence' => 303.1,
    'bubing_base_troops' => 4575.0,
    'qibing_base_troops' => 4575.0,
    'gongbing_base_troops' => 3370.0,
    'fangshi_base_troops' => 3370.0
};
get(243)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         247
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             332
        ]
    ],
    'bubing_base_attack' => 870.0,
    'qibing_base_attack' => 956.999999999997,
    'gongbing_base_attack' => 1087.5,
    'fangshi_base_attack' => 1087.5,
    'bubing_base_defence' => 435.0,
    'qibing_base_defence' => 348.000000000001,
    'gongbing_base_defence' => 304.5,
    'fangshi_base_defence' => 304.5,
    'bubing_base_troops' => 4595.0,
    'qibing_base_troops' => 4595.0,
    'gongbing_base_troops' => 3385.0,
    'fangshi_base_troops' => 3385.0
};
get(244)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         248
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             333
        ]
    ],
    'bubing_base_attack' => 874.0,
    'qibing_base_attack' => 961.399999999997,
    'gongbing_base_attack' => 1092.5,
    'fangshi_base_attack' => 1092.5,
    'bubing_base_defence' => 437.0,
    'qibing_base_defence' => 349.600000000001,
    'gongbing_base_defence' => 305.9,
    'fangshi_base_defence' => 305.9,
    'bubing_base_troops' => 4615.0,
    'qibing_base_troops' => 4615.0,
    'gongbing_base_troops' => 3400.0,
    'fangshi_base_troops' => 3400.0
};
get(245)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         249
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             334
        ]
    ],
    'bubing_base_attack' => 878.0,
    'qibing_base_attack' => 965.799999999997,
    'gongbing_base_attack' => 1097.5,
    'fangshi_base_attack' => 1097.5,
    'bubing_base_defence' => 439.0,
    'qibing_base_defence' => 351.200000000001,
    'gongbing_base_defence' => 307.3,
    'fangshi_base_defence' => 307.3,
    'bubing_base_troops' => 4635.0,
    'qibing_base_troops' => 4635.0,
    'gongbing_base_troops' => 3415.0,
    'fangshi_base_troops' => 3415.0
};
get(246)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         250
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             335
        ]
    ],
    'bubing_base_attack' => 882.0,
    'qibing_base_attack' => 970.199999999997,
    'gongbing_base_attack' => 1102.5,
    'fangshi_base_attack' => 1102.5,
    'bubing_base_defence' => 441.0,
    'qibing_base_defence' => 352.800000000001,
    'gongbing_base_defence' => 308.7,
    'fangshi_base_defence' => 308.7,
    'bubing_base_troops' => 4655.0,
    'qibing_base_troops' => 4655.0,
    'gongbing_base_troops' => 3430.0,
    'fangshi_base_troops' => 3430.0
};
get(247)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         251
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             336
        ]
    ],
    'bubing_base_attack' => 886.0,
    'qibing_base_attack' => 974.599999999997,
    'gongbing_base_attack' => 1107.5,
    'fangshi_base_attack' => 1107.5,
    'bubing_base_defence' => 443.0,
    'qibing_base_defence' => 354.400000000001,
    'gongbing_base_defence' => 310.1,
    'fangshi_base_defence' => 310.1,
    'bubing_base_troops' => 4675.0,
    'qibing_base_troops' => 4675.0,
    'gongbing_base_troops' => 3445.0,
    'fangshi_base_troops' => 3445.0
};
get(248)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         252
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             337
        ]
    ],
    'bubing_base_attack' => 890.0,
    'qibing_base_attack' => 978.999999999996,
    'gongbing_base_attack' => 1112.5,
    'fangshi_base_attack' => 1112.5,
    'bubing_base_defence' => 445.0,
    'qibing_base_defence' => 356.000000000001,
    'gongbing_base_defence' => 311.5,
    'fangshi_base_defence' => 311.5,
    'bubing_base_troops' => 4695.0,
    'qibing_base_troops' => 4695.0,
    'gongbing_base_troops' => 3460.0,
    'fangshi_base_troops' => 3460.0
};
get(249)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         253
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             338
        ]
    ],
    'bubing_base_attack' => 894.0,
    'qibing_base_attack' => 983.399999999996,
    'gongbing_base_attack' => 1117.5,
    'fangshi_base_attack' => 1117.5,
    'bubing_base_defence' => 447.0,
    'qibing_base_defence' => 357.600000000001,
    'gongbing_base_defence' => 312.9,
    'fangshi_base_defence' => 312.9,
    'bubing_base_troops' => 4715.0,
    'qibing_base_troops' => 4715.0,
    'gongbing_base_troops' => 3475.0,
    'fangshi_base_troops' => 3475.0
};
get(250)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         254
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             339
        ]
    ],
    'bubing_base_attack' => 898.0,
    'qibing_base_attack' => 987.799999999996,
    'gongbing_base_attack' => 1122.5,
    'fangshi_base_attack' => 1122.5,
    'bubing_base_defence' => 449.0,
    'qibing_base_defence' => 359.200000000001,
    'gongbing_base_defence' => 314.3,
    'fangshi_base_defence' => 314.3,
    'bubing_base_troops' => 4735.0,
    'qibing_base_troops' => 4735.0,
    'gongbing_base_troops' => 3490.0,
    'fangshi_base_troops' => 3490.0
};
get(251)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         255
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             340
        ]
    ],
    'bubing_base_attack' => 902.0,
    'qibing_base_attack' => 992.199999999996,
    'gongbing_base_attack' => 1127.5,
    'fangshi_base_attack' => 1127.5,
    'bubing_base_defence' => 451.0,
    'qibing_base_defence' => 360.800000000001,
    'gongbing_base_defence' => 315.7,
    'fangshi_base_defence' => 315.7,
    'bubing_base_troops' => 4755.0,
    'qibing_base_troops' => 4755.0,
    'gongbing_base_troops' => 3505.0,
    'fangshi_base_troops' => 3505.0
};
get(252)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         256
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             341
        ]
    ],
    'bubing_base_attack' => 906.0,
    'qibing_base_attack' => 996.599999999996,
    'gongbing_base_attack' => 1132.5,
    'fangshi_base_attack' => 1132.5,
    'bubing_base_defence' => 453.0,
    'qibing_base_defence' => 362.400000000001,
    'gongbing_base_defence' => 317.1,
    'fangshi_base_defence' => 317.1,
    'bubing_base_troops' => 4775.0,
    'qibing_base_troops' => 4775.0,
    'gongbing_base_troops' => 3520.0,
    'fangshi_base_troops' => 3520.0
};
get(253)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         257
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             342
        ]
    ],
    'bubing_base_attack' => 910.0,
    'qibing_base_attack' => 1001.0,
    'gongbing_base_attack' => 1137.5,
    'fangshi_base_attack' => 1137.5,
    'bubing_base_defence' => 455.0,
    'qibing_base_defence' => 364.000000000001,
    'gongbing_base_defence' => 318.5,
    'fangshi_base_defence' => 318.5,
    'bubing_base_troops' => 4795.0,
    'qibing_base_troops' => 4795.0,
    'gongbing_base_troops' => 3535.0,
    'fangshi_base_troops' => 3535.0
};
get(254)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         258
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             343
        ]
    ],
    'bubing_base_attack' => 914.0,
    'qibing_base_attack' => 1005.4,
    'gongbing_base_attack' => 1142.5,
    'fangshi_base_attack' => 1142.5,
    'bubing_base_defence' => 457.0,
    'qibing_base_defence' => 365.600000000001,
    'gongbing_base_defence' => 319.9,
    'fangshi_base_defence' => 319.9,
    'bubing_base_troops' => 4815.0,
    'qibing_base_troops' => 4815.0,
    'gongbing_base_troops' => 3550.0,
    'fangshi_base_troops' => 3550.0
};
get(255)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         259
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             344
        ]
    ],
    'bubing_base_attack' => 918.0,
    'qibing_base_attack' => 1009.8,
    'gongbing_base_attack' => 1147.5,
    'fangshi_base_attack' => 1147.5,
    'bubing_base_defence' => 459.0,
    'qibing_base_defence' => 367.200000000001,
    'gongbing_base_defence' => 321.3,
    'fangshi_base_defence' => 321.3,
    'bubing_base_troops' => 4835.0,
    'qibing_base_troops' => 4835.0,
    'gongbing_base_troops' => 3565.0,
    'fangshi_base_troops' => 3565.0
};
get(256)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         260
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             345
        ]
    ],
    'bubing_base_attack' => 922.0,
    'qibing_base_attack' => 1014.2,
    'gongbing_base_attack' => 1152.5,
    'fangshi_base_attack' => 1152.5,
    'bubing_base_defence' => 461.0,
    'qibing_base_defence' => 368.800000000001,
    'gongbing_base_defence' => 322.7,
    'fangshi_base_defence' => 322.7,
    'bubing_base_troops' => 4855.0,
    'qibing_base_troops' => 4855.0,
    'gongbing_base_troops' => 3580.0,
    'fangshi_base_troops' => 3580.0
};
get(257)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         261
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             346
        ]
    ],
    'bubing_base_attack' => 926.0,
    'qibing_base_attack' => 1018.6,
    'gongbing_base_attack' => 1157.5,
    'fangshi_base_attack' => 1157.5,
    'bubing_base_defence' => 463.0,
    'qibing_base_defence' => 370.400000000001,
    'gongbing_base_defence' => 324.1,
    'fangshi_base_defence' => 324.1,
    'bubing_base_troops' => 4875.0,
    'qibing_base_troops' => 4875.0,
    'gongbing_base_troops' => 3595.0,
    'fangshi_base_troops' => 3595.0
};
get(258)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         262
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             347
        ]
    ],
    'bubing_base_attack' => 930.0,
    'qibing_base_attack' => 1023.0,
    'gongbing_base_attack' => 1162.5,
    'fangshi_base_attack' => 1162.5,
    'bubing_base_defence' => 465.0,
    'qibing_base_defence' => 372.000000000001,
    'gongbing_base_defence' => 325.5,
    'fangshi_base_defence' => 325.5,
    'bubing_base_troops' => 4895.0,
    'qibing_base_troops' => 4895.0,
    'gongbing_base_troops' => 3610.0,
    'fangshi_base_troops' => 3610.0
};
get(259)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         263
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             348
        ]
    ],
    'bubing_base_attack' => 934.0,
    'qibing_base_attack' => 1027.4,
    'gongbing_base_attack' => 1167.5,
    'fangshi_base_attack' => 1167.5,
    'bubing_base_defence' => 467.0,
    'qibing_base_defence' => 373.600000000001,
    'gongbing_base_defence' => 326.9,
    'fangshi_base_defence' => 326.9,
    'bubing_base_troops' => 4915.0,
    'qibing_base_troops' => 4915.0,
    'gongbing_base_troops' => 3625.0,
    'fangshi_base_troops' => 3625.0
};
get(260)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         264
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             349
        ]
    ],
    'bubing_base_attack' => 938.0,
    'qibing_base_attack' => 1031.8,
    'gongbing_base_attack' => 1172.5,
    'fangshi_base_attack' => 1172.5,
    'bubing_base_defence' => 469.0,
    'qibing_base_defence' => 375.200000000001,
    'gongbing_base_defence' => 328.3,
    'fangshi_base_defence' => 328.3,
    'bubing_base_troops' => 4935.0,
    'qibing_base_troops' => 4935.0,
    'gongbing_base_troops' => 3640.0,
    'fangshi_base_troops' => 3640.0
};
get(261)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         265
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             350
        ]
    ],
    'bubing_base_attack' => 942.0,
    'qibing_base_attack' => 1036.2,
    'gongbing_base_attack' => 1177.5,
    'fangshi_base_attack' => 1177.5,
    'bubing_base_defence' => 471.0,
    'qibing_base_defence' => 376.800000000001,
    'gongbing_base_defence' => 329.7,
    'fangshi_base_defence' => 329.7,
    'bubing_base_troops' => 4955.0,
    'qibing_base_troops' => 4955.0,
    'gongbing_base_troops' => 3655.0,
    'fangshi_base_troops' => 3655.0
};
get(262)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         266
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             351
        ]
    ],
    'bubing_base_attack' => 946.0,
    'qibing_base_attack' => 1040.6,
    'gongbing_base_attack' => 1182.5,
    'fangshi_base_attack' => 1182.5,
    'bubing_base_defence' => 473.0,
    'qibing_base_defence' => 378.400000000001,
    'gongbing_base_defence' => 331.1,
    'fangshi_base_defence' => 331.1,
    'bubing_base_troops' => 4975.0,
    'qibing_base_troops' => 4975.0,
    'gongbing_base_troops' => 3670.0,
    'fangshi_base_troops' => 3670.0
};
get(263)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         267
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             352
        ]
    ],
    'bubing_base_attack' => 950.0,
    'qibing_base_attack' => 1045.0,
    'gongbing_base_attack' => 1187.5,
    'fangshi_base_attack' => 1187.5,
    'bubing_base_defence' => 475.0,
    'qibing_base_defence' => 380.000000000001,
    'gongbing_base_defence' => 332.499999999999,
    'fangshi_base_defence' => 332.499999999999,
    'bubing_base_troops' => 4995.0,
    'qibing_base_troops' => 4995.0,
    'gongbing_base_troops' => 3685.0,
    'fangshi_base_troops' => 3685.0
};
get(264)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         268
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             353
        ]
    ],
    'bubing_base_attack' => 954.0,
    'qibing_base_attack' => 1049.4,
    'gongbing_base_attack' => 1192.5,
    'fangshi_base_attack' => 1192.5,
    'bubing_base_defence' => 477.0,
    'qibing_base_defence' => 381.600000000001,
    'gongbing_base_defence' => 333.899999999999,
    'fangshi_base_defence' => 333.899999999999,
    'bubing_base_troops' => 5015.0,
    'qibing_base_troops' => 5015.0,
    'gongbing_base_troops' => 3700.0,
    'fangshi_base_troops' => 3700.0
};
get(265)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         269
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             354
        ]
    ],
    'bubing_base_attack' => 958.0,
    'qibing_base_attack' => 1053.8,
    'gongbing_base_attack' => 1197.5,
    'fangshi_base_attack' => 1197.5,
    'bubing_base_defence' => 479.0,
    'qibing_base_defence' => 383.200000000001,
    'gongbing_base_defence' => 335.299999999999,
    'fangshi_base_defence' => 335.299999999999,
    'bubing_base_troops' => 5035.0,
    'qibing_base_troops' => 5035.0,
    'gongbing_base_troops' => 3715.0,
    'fangshi_base_troops' => 3715.0
};
get(266)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         270
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             355
        ]
    ],
    'bubing_base_attack' => 962.0,
    'qibing_base_attack' => 1058.2,
    'gongbing_base_attack' => 1202.5,
    'fangshi_base_attack' => 1202.5,
    'bubing_base_defence' => 481.0,
    'qibing_base_defence' => 384.800000000001,
    'gongbing_base_defence' => 336.699999999999,
    'fangshi_base_defence' => 336.699999999999,
    'bubing_base_troops' => 5055.0,
    'qibing_base_troops' => 5055.0,
    'gongbing_base_troops' => 3730.0,
    'fangshi_base_troops' => 3730.0
};
get(267)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         271
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             356
        ]
    ],
    'bubing_base_attack' => 966.0,
    'qibing_base_attack' => 1062.6,
    'gongbing_base_attack' => 1207.5,
    'fangshi_base_attack' => 1207.5,
    'bubing_base_defence' => 483.0,
    'qibing_base_defence' => 386.400000000001,
    'gongbing_base_defence' => 338.099999999999,
    'fangshi_base_defence' => 338.099999999999,
    'bubing_base_troops' => 5075.0,
    'qibing_base_troops' => 5075.0,
    'gongbing_base_troops' => 3745.0,
    'fangshi_base_troops' => 3745.0
};
get(268)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         272
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             357
        ]
    ],
    'bubing_base_attack' => 970.0,
    'qibing_base_attack' => 1067.0,
    'gongbing_base_attack' => 1212.5,
    'fangshi_base_attack' => 1212.5,
    'bubing_base_defence' => 485.0,
    'qibing_base_defence' => 388.000000000001,
    'gongbing_base_defence' => 339.499999999999,
    'fangshi_base_defence' => 339.499999999999,
    'bubing_base_troops' => 5095.0,
    'qibing_base_troops' => 5095.0,
    'gongbing_base_troops' => 3760.0,
    'fangshi_base_troops' => 3760.0
};
get(269)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         273
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             358
        ]
    ],
    'bubing_base_attack' => 974.0,
    'qibing_base_attack' => 1071.4,
    'gongbing_base_attack' => 1217.5,
    'fangshi_base_attack' => 1217.5,
    'bubing_base_defence' => 487.0,
    'qibing_base_defence' => 389.600000000001,
    'gongbing_base_defence' => 340.899999999999,
    'fangshi_base_defence' => 340.899999999999,
    'bubing_base_troops' => 5115.0,
    'qibing_base_troops' => 5115.0,
    'gongbing_base_troops' => 3775.0,
    'fangshi_base_troops' => 3775.0
};
get(270)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         274
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             359
        ]
    ],
    'bubing_base_attack' => 978.0,
    'qibing_base_attack' => 1075.8,
    'gongbing_base_attack' => 1222.5,
    'fangshi_base_attack' => 1222.5,
    'bubing_base_defence' => 489.0,
    'qibing_base_defence' => 391.200000000001,
    'gongbing_base_defence' => 342.299999999999,
    'fangshi_base_defence' => 342.299999999999,
    'bubing_base_troops' => 5135.0,
    'qibing_base_troops' => 5135.0,
    'gongbing_base_troops' => 3790.0,
    'fangshi_base_troops' => 3790.0
};
get(271)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         275
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             360
        ]
    ],
    'bubing_base_attack' => 982.0,
    'qibing_base_attack' => 1080.2,
    'gongbing_base_attack' => 1227.5,
    'fangshi_base_attack' => 1227.5,
    'bubing_base_defence' => 491.0,
    'qibing_base_defence' => 392.800000000001,
    'gongbing_base_defence' => 343.699999999999,
    'fangshi_base_defence' => 343.699999999999,
    'bubing_base_troops' => 5155.0,
    'qibing_base_troops' => 5155.0,
    'gongbing_base_troops' => 3805.0,
    'fangshi_base_troops' => 3805.0
};
get(272)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         276
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             361
        ]
    ],
    'bubing_base_attack' => 986.0,
    'qibing_base_attack' => 1084.6,
    'gongbing_base_attack' => 1232.5,
    'fangshi_base_attack' => 1232.5,
    'bubing_base_defence' => 493.0,
    'qibing_base_defence' => 394.400000000001,
    'gongbing_base_defence' => 345.099999999999,
    'fangshi_base_defence' => 345.099999999999,
    'bubing_base_troops' => 5175.0,
    'qibing_base_troops' => 5175.0,
    'gongbing_base_troops' => 3820.0,
    'fangshi_base_troops' => 3820.0
};
get(273)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         277
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             362
        ]
    ],
    'bubing_base_attack' => 990.0,
    'qibing_base_attack' => 1089.0,
    'gongbing_base_attack' => 1237.5,
    'fangshi_base_attack' => 1237.5,
    'bubing_base_defence' => 495.0,
    'qibing_base_defence' => 396.000000000001,
    'gongbing_base_defence' => 346.499999999999,
    'fangshi_base_defence' => 346.499999999999,
    'bubing_base_troops' => 5195.0,
    'qibing_base_troops' => 5195.0,
    'gongbing_base_troops' => 3835.0,
    'fangshi_base_troops' => 3835.0
};
get(274)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         278
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             363
        ]
    ],
    'bubing_base_attack' => 994.0,
    'qibing_base_attack' => 1093.4,
    'gongbing_base_attack' => 1242.5,
    'fangshi_base_attack' => 1242.5,
    'bubing_base_defence' => 497.0,
    'qibing_base_defence' => 397.600000000001,
    'gongbing_base_defence' => 347.899999999999,
    'fangshi_base_defence' => 347.899999999999,
    'bubing_base_troops' => 5215.0,
    'qibing_base_troops' => 5215.0,
    'gongbing_base_troops' => 3850.0,
    'fangshi_base_troops' => 3850.0
};
get(275)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         279
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             364
        ]
    ],
    'bubing_base_attack' => 998.0,
    'qibing_base_attack' => 1097.8,
    'gongbing_base_attack' => 1247.5,
    'fangshi_base_attack' => 1247.5,
    'bubing_base_defence' => 499.0,
    'qibing_base_defence' => 399.200000000001,
    'gongbing_base_defence' => 349.299999999999,
    'fangshi_base_defence' => 349.299999999999,
    'bubing_base_troops' => 5235.0,
    'qibing_base_troops' => 5235.0,
    'gongbing_base_troops' => 3865.0,
    'fangshi_base_troops' => 3865.0
};
get(276)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         280
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             365
        ]
    ],
    'bubing_base_attack' => 1002.0,
    'qibing_base_attack' => 1102.2,
    'gongbing_base_attack' => 1252.5,
    'fangshi_base_attack' => 1252.5,
    'bubing_base_defence' => 501.0,
    'qibing_base_defence' => 400.800000000001,
    'gongbing_base_defence' => 350.699999999999,
    'fangshi_base_defence' => 350.699999999999,
    'bubing_base_troops' => 5255.0,
    'qibing_base_troops' => 5255.0,
    'gongbing_base_troops' => 3880.0,
    'fangshi_base_troops' => 3880.0
};
get(277)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         281
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             366
        ]
    ],
    'bubing_base_attack' => 1006.0,
    'qibing_base_attack' => 1106.6,
    'gongbing_base_attack' => 1257.5,
    'fangshi_base_attack' => 1257.5,
    'bubing_base_defence' => 503.0,
    'qibing_base_defence' => 402.400000000001,
    'gongbing_base_defence' => 352.099999999999,
    'fangshi_base_defence' => 352.099999999999,
    'bubing_base_troops' => 5275.0,
    'qibing_base_troops' => 5275.0,
    'gongbing_base_troops' => 3895.0,
    'fangshi_base_troops' => 3895.0
};
get(278)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         282
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             367
        ]
    ],
    'bubing_base_attack' => 1010.0,
    'qibing_base_attack' => 1111.0,
    'gongbing_base_attack' => 1262.5,
    'fangshi_base_attack' => 1262.5,
    'bubing_base_defence' => 505.0,
    'qibing_base_defence' => 404.000000000001,
    'gongbing_base_defence' => 353.499999999999,
    'fangshi_base_defence' => 353.499999999999,
    'bubing_base_troops' => 5295.0,
    'qibing_base_troops' => 5295.0,
    'gongbing_base_troops' => 3910.0,
    'fangshi_base_troops' => 3910.0
};
get(279)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         283
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             368
        ]
    ],
    'bubing_base_attack' => 1014.0,
    'qibing_base_attack' => 1115.4,
    'gongbing_base_attack' => 1267.5,
    'fangshi_base_attack' => 1267.5,
    'bubing_base_defence' => 507.0,
    'qibing_base_defence' => 405.600000000002,
    'gongbing_base_defence' => 354.899999999999,
    'fangshi_base_defence' => 354.899999999999,
    'bubing_base_troops' => 5315.0,
    'qibing_base_troops' => 5315.0,
    'gongbing_base_troops' => 3925.0,
    'fangshi_base_troops' => 3925.0
};
get(280)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         284
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             369
        ]
    ],
    'bubing_base_attack' => 1018.0,
    'qibing_base_attack' => 1119.8,
    'gongbing_base_attack' => 1272.5,
    'fangshi_base_attack' => 1272.5,
    'bubing_base_defence' => 509.0,
    'qibing_base_defence' => 407.200000000002,
    'gongbing_base_defence' => 356.299999999999,
    'fangshi_base_defence' => 356.299999999999,
    'bubing_base_troops' => 5335.0,
    'qibing_base_troops' => 5335.0,
    'gongbing_base_troops' => 3940.0,
    'fangshi_base_troops' => 3940.0
};
get(281)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         285
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             370
        ]
    ],
    'bubing_base_attack' => 1022.0,
    'qibing_base_attack' => 1124.2,
    'gongbing_base_attack' => 1277.5,
    'fangshi_base_attack' => 1277.5,
    'bubing_base_defence' => 511.0,
    'qibing_base_defence' => 408.800000000002,
    'gongbing_base_defence' => 357.699999999999,
    'fangshi_base_defence' => 357.699999999999,
    'bubing_base_troops' => 5355.0,
    'qibing_base_troops' => 5355.0,
    'gongbing_base_troops' => 3955.0,
    'fangshi_base_troops' => 3955.0
};
get(282)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         286
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             371
        ]
    ],
    'bubing_base_attack' => 1026.0,
    'qibing_base_attack' => 1128.6,
    'gongbing_base_attack' => 1282.5,
    'fangshi_base_attack' => 1282.5,
    'bubing_base_defence' => 513.0,
    'qibing_base_defence' => 410.400000000002,
    'gongbing_base_defence' => 359.099999999999,
    'fangshi_base_defence' => 359.099999999999,
    'bubing_base_troops' => 5375.0,
    'qibing_base_troops' => 5375.0,
    'gongbing_base_troops' => 3970.0,
    'fangshi_base_troops' => 3970.0
};
get(283)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         287
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             372
        ]
    ],
    'bubing_base_attack' => 1030.0,
    'qibing_base_attack' => 1133.0,
    'gongbing_base_attack' => 1287.5,
    'fangshi_base_attack' => 1287.5,
    'bubing_base_defence' => 515.0,
    'qibing_base_defence' => 412.000000000002,
    'gongbing_base_defence' => 360.499999999999,
    'fangshi_base_defence' => 360.499999999999,
    'bubing_base_troops' => 5395.0,
    'qibing_base_troops' => 5395.0,
    'gongbing_base_troops' => 3985.0,
    'fangshi_base_troops' => 3985.0
};
get(284)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         288
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             373
        ]
    ],
    'bubing_base_attack' => 1034.0,
    'qibing_base_attack' => 1137.4,
    'gongbing_base_attack' => 1292.5,
    'fangshi_base_attack' => 1292.5,
    'bubing_base_defence' => 517.0,
    'qibing_base_defence' => 413.600000000002,
    'gongbing_base_defence' => 361.899999999999,
    'fangshi_base_defence' => 361.899999999999,
    'bubing_base_troops' => 5415.0,
    'qibing_base_troops' => 5415.0,
    'gongbing_base_troops' => 4000.0,
    'fangshi_base_troops' => 4000.0
};
get(285)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         289
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             374
        ]
    ],
    'bubing_base_attack' => 1038.0,
    'qibing_base_attack' => 1141.8,
    'gongbing_base_attack' => 1297.5,
    'fangshi_base_attack' => 1297.5,
    'bubing_base_defence' => 519.0,
    'qibing_base_defence' => 415.200000000002,
    'gongbing_base_defence' => 363.299999999999,
    'fangshi_base_defence' => 363.299999999999,
    'bubing_base_troops' => 5435.0,
    'qibing_base_troops' => 5435.0,
    'gongbing_base_troops' => 4015.0,
    'fangshi_base_troops' => 4015.0
};
get(286)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         290
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             375
        ]
    ],
    'bubing_base_attack' => 1042.0,
    'qibing_base_attack' => 1146.2,
    'gongbing_base_attack' => 1302.5,
    'fangshi_base_attack' => 1302.5,
    'bubing_base_defence' => 521.0,
    'qibing_base_defence' => 416.800000000002,
    'gongbing_base_defence' => 364.699999999999,
    'fangshi_base_defence' => 364.699999999999,
    'bubing_base_troops' => 5455.0,
    'qibing_base_troops' => 5455.0,
    'gongbing_base_troops' => 4030.0,
    'fangshi_base_troops' => 4030.0
};
get(287)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         291
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             376
        ]
    ],
    'bubing_base_attack' => 1046.0,
    'qibing_base_attack' => 1150.6,
    'gongbing_base_attack' => 1307.5,
    'fangshi_base_attack' => 1307.5,
    'bubing_base_defence' => 523.0,
    'qibing_base_defence' => 418.400000000002,
    'gongbing_base_defence' => 366.099999999999,
    'fangshi_base_defence' => 366.099999999999,
    'bubing_base_troops' => 5475.0,
    'qibing_base_troops' => 5475.0,
    'gongbing_base_troops' => 4045.0,
    'fangshi_base_troops' => 4045.0
};
get(288)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         292
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             377
        ]
    ],
    'bubing_base_attack' => 1050.0,
    'qibing_base_attack' => 1155.0,
    'gongbing_base_attack' => 1312.5,
    'fangshi_base_attack' => 1312.5,
    'bubing_base_defence' => 525.0,
    'qibing_base_defence' => 420.000000000002,
    'gongbing_base_defence' => 367.499999999999,
    'fangshi_base_defence' => 367.499999999999,
    'bubing_base_troops' => 5495.0,
    'qibing_base_troops' => 5495.0,
    'gongbing_base_troops' => 4060.0,
    'fangshi_base_troops' => 4060.0
};
get(289)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         293
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             378
        ]
    ],
    'bubing_base_attack' => 1054.0,
    'qibing_base_attack' => 1159.4,
    'gongbing_base_attack' => 1317.5,
    'fangshi_base_attack' => 1317.5,
    'bubing_base_defence' => 527.0,
    'qibing_base_defence' => 421.600000000002,
    'gongbing_base_defence' => 368.899999999999,
    'fangshi_base_defence' => 368.899999999999,
    'bubing_base_troops' => 5515.0,
    'qibing_base_troops' => 5515.0,
    'gongbing_base_troops' => 4075.0,
    'fangshi_base_troops' => 4075.0
};
get(290)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         294
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             379
        ]
    ],
    'bubing_base_attack' => 1058.0,
    'qibing_base_attack' => 1163.8,
    'gongbing_base_attack' => 1322.5,
    'fangshi_base_attack' => 1322.5,
    'bubing_base_defence' => 529.0,
    'qibing_base_defence' => 423.200000000002,
    'gongbing_base_defence' => 370.299999999999,
    'fangshi_base_defence' => 370.299999999999,
    'bubing_base_troops' => 5535.0,
    'qibing_base_troops' => 5535.0,
    'gongbing_base_troops' => 4090.0,
    'fangshi_base_troops' => 4090.0
};
get(291)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         295
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             380
        ]
    ],
    'bubing_base_attack' => 1062.0,
    'qibing_base_attack' => 1168.2,
    'gongbing_base_attack' => 1327.5,
    'fangshi_base_attack' => 1327.5,
    'bubing_base_defence' => 531.0,
    'qibing_base_defence' => 424.800000000002,
    'gongbing_base_defence' => 371.699999999999,
    'fangshi_base_defence' => 371.699999999999,
    'bubing_base_troops' => 5555.0,
    'qibing_base_troops' => 5555.0,
    'gongbing_base_troops' => 4105.0,
    'fangshi_base_troops' => 4105.0
};
get(292)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         296
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             381
        ]
    ],
    'bubing_base_attack' => 1066.0,
    'qibing_base_attack' => 1172.6,
    'gongbing_base_attack' => 1332.5,
    'fangshi_base_attack' => 1332.5,
    'bubing_base_defence' => 533.0,
    'qibing_base_defence' => 426.400000000002,
    'gongbing_base_defence' => 373.099999999999,
    'fangshi_base_defence' => 373.099999999999,
    'bubing_base_troops' => 5575.0,
    'qibing_base_troops' => 5575.0,
    'gongbing_base_troops' => 4120.0,
    'fangshi_base_troops' => 4120.0
};
get(293)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         297
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             382
        ]
    ],
    'bubing_base_attack' => 1070.0,
    'qibing_base_attack' => 1177.0,
    'gongbing_base_attack' => 1337.5,
    'fangshi_base_attack' => 1337.5,
    'bubing_base_defence' => 535.0,
    'qibing_base_defence' => 428.000000000002,
    'gongbing_base_defence' => 374.499999999999,
    'fangshi_base_defence' => 374.499999999999,
    'bubing_base_troops' => 5595.0,
    'qibing_base_troops' => 5595.0,
    'gongbing_base_troops' => 4135.0,
    'fangshi_base_troops' => 4135.0
};
get(294)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         298
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             383
        ]
    ],
    'bubing_base_attack' => 1074.0,
    'qibing_base_attack' => 1181.4,
    'gongbing_base_attack' => 1342.5,
    'fangshi_base_attack' => 1342.5,
    'bubing_base_defence' => 537.0,
    'qibing_base_defence' => 429.600000000002,
    'gongbing_base_defence' => 375.899999999999,
    'fangshi_base_defence' => 375.899999999999,
    'bubing_base_troops' => 5615.0,
    'qibing_base_troops' => 5615.0,
    'gongbing_base_troops' => 4150.0,
    'fangshi_base_troops' => 4150.0
};
get(295)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         299
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             384
        ]
    ],
    'bubing_base_attack' => 1078.0,
    'qibing_base_attack' => 1185.8,
    'gongbing_base_attack' => 1347.5,
    'fangshi_base_attack' => 1347.5,
    'bubing_base_defence' => 539.0,
    'qibing_base_defence' => 431.200000000002,
    'gongbing_base_defence' => 377.299999999999,
    'fangshi_base_defence' => 377.299999999999,
    'bubing_base_troops' => 5635.0,
    'qibing_base_troops' => 5635.0,
    'gongbing_base_troops' => 4165.0,
    'fangshi_base_troops' => 4165.0
};
get(296)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         300
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             385
        ]
    ],
    'bubing_base_attack' => 1082.0,
    'qibing_base_attack' => 1190.2,
    'gongbing_base_attack' => 1352.5,
    'fangshi_base_attack' => 1352.5,
    'bubing_base_defence' => 541.0,
    'qibing_base_defence' => 432.800000000002,
    'gongbing_base_defence' => 378.699999999999,
    'fangshi_base_defence' => 378.699999999999,
    'bubing_base_troops' => 5655.0,
    'qibing_base_troops' => 5655.0,
    'gongbing_base_troops' => 4180.0,
    'fangshi_base_troops' => 4180.0
};
get(297)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         301
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             386
        ]
    ],
    'bubing_base_attack' => 1086.0,
    'qibing_base_attack' => 1194.6,
    'gongbing_base_attack' => 1357.5,
    'fangshi_base_attack' => 1357.5,
    'bubing_base_defence' => 543.0,
    'qibing_base_defence' => 434.400000000002,
    'gongbing_base_defence' => 380.099999999999,
    'fangshi_base_defence' => 380.099999999999,
    'bubing_base_troops' => 5675.0,
    'qibing_base_troops' => 5675.0,
    'gongbing_base_troops' => 4195.0,
    'fangshi_base_troops' => 4195.0
};
get(298)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         302
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             387
        ]
    ],
    'bubing_base_attack' => 1090.0,
    'qibing_base_attack' => 1199.0,
    'gongbing_base_attack' => 1362.5,
    'fangshi_base_attack' => 1362.5,
    'bubing_base_defence' => 545.0,
    'qibing_base_defence' => 436.000000000002,
    'gongbing_base_defence' => 381.499999999999,
    'fangshi_base_defence' => 381.499999999999,
    'bubing_base_troops' => 5695.0,
    'qibing_base_troops' => 5695.0,
    'gongbing_base_troops' => 4210.0,
    'fangshi_base_troops' => 4210.0
};
get(299)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         303
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             388
        ]
    ],
    'bubing_base_attack' => 1094.0,
    'qibing_base_attack' => 1203.4,
    'gongbing_base_attack' => 1367.5,
    'fangshi_base_attack' => 1367.5,
    'bubing_base_defence' => 547.0,
    'qibing_base_defence' => 437.600000000002,
    'gongbing_base_defence' => 382.899999999999,
    'fangshi_base_defence' => 382.899999999999,
    'bubing_base_troops' => 5715.0,
    'qibing_base_troops' => 5715.0,
    'gongbing_base_troops' => 4225.0,
    'fangshi_base_troops' => 4225.0
};
get(300)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         304
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             389
        ]
    ],
    'bubing_base_attack' => 1098.0,
    'qibing_base_attack' => 1207.8,
    'gongbing_base_attack' => 1372.5,
    'fangshi_base_attack' => 1372.5,
    'bubing_base_defence' => 549.0,
    'qibing_base_defence' => 439.200000000002,
    'gongbing_base_defence' => 384.299999999999,
    'fangshi_base_defence' => 384.299999999999,
    'bubing_base_troops' => 5735.0,
    'qibing_base_troops' => 5735.0,
    'gongbing_base_troops' => 4240.0,
    'fangshi_base_troops' => 4240.0
};
get(301)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         305
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             390
        ]
    ],
    'bubing_base_attack' => 1102.0,
    'qibing_base_attack' => 1212.2,
    'gongbing_base_attack' => 1377.5,
    'fangshi_base_attack' => 1377.5,
    'bubing_base_defence' => 551.0,
    'qibing_base_defence' => 440.800000000002,
    'gongbing_base_defence' => 385.699999999999,
    'fangshi_base_defence' => 385.699999999999,
    'bubing_base_troops' => 5755.0,
    'qibing_base_troops' => 5755.0,
    'gongbing_base_troops' => 4255.0,
    'fangshi_base_troops' => 4255.0
};
get(302)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         306
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             391
        ]
    ],
    'bubing_base_attack' => 1106.0,
    'qibing_base_attack' => 1216.6,
    'gongbing_base_attack' => 1382.5,
    'fangshi_base_attack' => 1382.5,
    'bubing_base_defence' => 553.0,
    'qibing_base_defence' => 442.400000000002,
    'gongbing_base_defence' => 387.099999999999,
    'fangshi_base_defence' => 387.099999999999,
    'bubing_base_troops' => 5775.0,
    'qibing_base_troops' => 5775.0,
    'gongbing_base_troops' => 4270.0,
    'fangshi_base_troops' => 4270.0
};
get(303)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         307
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             392
        ]
    ],
    'bubing_base_attack' => 1110.0,
    'qibing_base_attack' => 1221.0,
    'gongbing_base_attack' => 1387.5,
    'fangshi_base_attack' => 1387.5,
    'bubing_base_defence' => 555.0,
    'qibing_base_defence' => 444.000000000002,
    'gongbing_base_defence' => 388.499999999999,
    'fangshi_base_defence' => 388.499999999999,
    'bubing_base_troops' => 5795.0,
    'qibing_base_troops' => 5795.0,
    'gongbing_base_troops' => 4285.0,
    'fangshi_base_troops' => 4285.0
};
get(304)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         308
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             393
        ]
    ],
    'bubing_base_attack' => 1114.0,
    'qibing_base_attack' => 1225.4,
    'gongbing_base_attack' => 1392.5,
    'fangshi_base_attack' => 1392.5,
    'bubing_base_defence' => 557.0,
    'qibing_base_defence' => 445.600000000002,
    'gongbing_base_defence' => 389.899999999999,
    'fangshi_base_defence' => 389.899999999999,
    'bubing_base_troops' => 5815.0,
    'qibing_base_troops' => 5815.0,
    'gongbing_base_troops' => 4300.0,
    'fangshi_base_troops' => 4300.0
};
get(305)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         309
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             394
        ]
    ],
    'bubing_base_attack' => 1118.0,
    'qibing_base_attack' => 1229.8,
    'gongbing_base_attack' => 1397.5,
    'fangshi_base_attack' => 1397.5,
    'bubing_base_defence' => 559.0,
    'qibing_base_defence' => 447.200000000002,
    'gongbing_base_defence' => 391.299999999999,
    'fangshi_base_defence' => 391.299999999999,
    'bubing_base_troops' => 5835.0,
    'qibing_base_troops' => 5835.0,
    'gongbing_base_troops' => 4315.0,
    'fangshi_base_troops' => 4315.0
};
get(306)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         310
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             395
        ]
    ],
    'bubing_base_attack' => 1122.0,
    'qibing_base_attack' => 1234.2,
    'gongbing_base_attack' => 1402.5,
    'fangshi_base_attack' => 1402.5,
    'bubing_base_defence' => 561.0,
    'qibing_base_defence' => 448.800000000002,
    'gongbing_base_defence' => 392.699999999999,
    'fangshi_base_defence' => 392.699999999999,
    'bubing_base_troops' => 5855.0,
    'qibing_base_troops' => 5855.0,
    'gongbing_base_troops' => 4330.0,
    'fangshi_base_troops' => 4330.0
};
get(307)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         311
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             396
        ]
    ],
    'bubing_base_attack' => 1126.0,
    'qibing_base_attack' => 1238.6,
    'gongbing_base_attack' => 1407.5,
    'fangshi_base_attack' => 1407.5,
    'bubing_base_defence' => 563.0,
    'qibing_base_defence' => 450.400000000002,
    'gongbing_base_defence' => 394.099999999998,
    'fangshi_base_defence' => 394.099999999998,
    'bubing_base_troops' => 5875.0,
    'qibing_base_troops' => 5875.0,
    'gongbing_base_troops' => 4345.0,
    'fangshi_base_troops' => 4345.0
};
get(308)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         312
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             397
        ]
    ],
    'bubing_base_attack' => 1130.0,
    'qibing_base_attack' => 1243.0,
    'gongbing_base_attack' => 1412.5,
    'fangshi_base_attack' => 1412.5,
    'bubing_base_defence' => 565.0,
    'qibing_base_defence' => 452.000000000002,
    'gongbing_base_defence' => 395.499999999998,
    'fangshi_base_defence' => 395.499999999998,
    'bubing_base_troops' => 5895.0,
    'qibing_base_troops' => 5895.0,
    'gongbing_base_troops' => 4360.0,
    'fangshi_base_troops' => 4360.0
};
get(309)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         313
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             398
        ]
    ],
    'bubing_base_attack' => 1134.0,
    'qibing_base_attack' => 1247.4,
    'gongbing_base_attack' => 1417.5,
    'fangshi_base_attack' => 1417.5,
    'bubing_base_defence' => 567.0,
    'qibing_base_defence' => 453.600000000002,
    'gongbing_base_defence' => 396.899999999998,
    'fangshi_base_defence' => 396.899999999998,
    'bubing_base_troops' => 5915.0,
    'qibing_base_troops' => 5915.0,
    'gongbing_base_troops' => 4375.0,
    'fangshi_base_troops' => 4375.0
};
get(310)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         314
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             399
        ]
    ],
    'bubing_base_attack' => 1138.0,
    'qibing_base_attack' => 1251.8,
    'gongbing_base_attack' => 1422.5,
    'fangshi_base_attack' => 1422.5,
    'bubing_base_defence' => 569.0,
    'qibing_base_defence' => 455.200000000002,
    'gongbing_base_defence' => 398.299999999998,
    'fangshi_base_defence' => 398.299999999998,
    'bubing_base_troops' => 5935.0,
    'qibing_base_troops' => 5935.0,
    'gongbing_base_troops' => 4390.0,
    'fangshi_base_troops' => 4390.0
};
get(311)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         315
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             400
        ]
    ],
    'bubing_base_attack' => 1142.0,
    'qibing_base_attack' => 1256.2,
    'gongbing_base_attack' => 1427.5,
    'fangshi_base_attack' => 1427.5,
    'bubing_base_defence' => 571.0,
    'qibing_base_defence' => 456.800000000002,
    'gongbing_base_defence' => 399.699999999998,
    'fangshi_base_defence' => 399.699999999998,
    'bubing_base_troops' => 5955.0,
    'qibing_base_troops' => 5955.0,
    'gongbing_base_troops' => 4405.0,
    'fangshi_base_troops' => 4405.0
};
get(312)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         316
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             401
        ]
    ],
    'bubing_base_attack' => 1146.0,
    'qibing_base_attack' => 1260.6,
    'gongbing_base_attack' => 1432.5,
    'fangshi_base_attack' => 1432.5,
    'bubing_base_defence' => 573.0,
    'qibing_base_defence' => 458.400000000002,
    'gongbing_base_defence' => 401.099999999998,
    'fangshi_base_defence' => 401.099999999998,
    'bubing_base_troops' => 5975.0,
    'qibing_base_troops' => 5975.0,
    'gongbing_base_troops' => 4420.0,
    'fangshi_base_troops' => 4420.0
};
get(313)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         317
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             402
        ]
    ],
    'bubing_base_attack' => 1150.0,
    'qibing_base_attack' => 1265.0,
    'gongbing_base_attack' => 1437.5,
    'fangshi_base_attack' => 1437.5,
    'bubing_base_defence' => 575.0,
    'qibing_base_defence' => 460.000000000002,
    'gongbing_base_defence' => 402.499999999998,
    'fangshi_base_defence' => 402.499999999998,
    'bubing_base_troops' => 5995.0,
    'qibing_base_troops' => 5995.0,
    'gongbing_base_troops' => 4435.0,
    'fangshi_base_troops' => 4435.0
};
get(314)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         318
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             403
        ]
    ],
    'bubing_base_attack' => 1154.0,
    'qibing_base_attack' => 1269.4,
    'gongbing_base_attack' => 1442.5,
    'fangshi_base_attack' => 1442.5,
    'bubing_base_defence' => 577.0,
    'qibing_base_defence' => 461.600000000002,
    'gongbing_base_defence' => 403.899999999998,
    'fangshi_base_defence' => 403.899999999998,
    'bubing_base_troops' => 6015.0,
    'qibing_base_troops' => 6015.0,
    'gongbing_base_troops' => 4450.0,
    'fangshi_base_troops' => 4450.0
};
get(315)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         319
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             404
        ]
    ],
    'bubing_base_attack' => 1158.0,
    'qibing_base_attack' => 1273.8,
    'gongbing_base_attack' => 1447.5,
    'fangshi_base_attack' => 1447.5,
    'bubing_base_defence' => 579.0,
    'qibing_base_defence' => 463.200000000002,
    'gongbing_base_defence' => 405.299999999998,
    'fangshi_base_defence' => 405.299999999998,
    'bubing_base_troops' => 6035.0,
    'qibing_base_troops' => 6035.0,
    'gongbing_base_troops' => 4465.0,
    'fangshi_base_troops' => 4465.0
};
get(316)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         320
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             405
        ]
    ],
    'bubing_base_attack' => 1162.0,
    'qibing_base_attack' => 1278.2,
    'gongbing_base_attack' => 1452.5,
    'fangshi_base_attack' => 1452.5,
    'bubing_base_defence' => 581.0,
    'qibing_base_defence' => 464.800000000002,
    'gongbing_base_defence' => 406.699999999998,
    'fangshi_base_defence' => 406.699999999998,
    'bubing_base_troops' => 6055.0,
    'qibing_base_troops' => 6055.0,
    'gongbing_base_troops' => 4480.0,
    'fangshi_base_troops' => 4480.0
};
get(317)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         321
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             406
        ]
    ],
    'bubing_base_attack' => 1166.0,
    'qibing_base_attack' => 1282.6,
    'gongbing_base_attack' => 1457.5,
    'fangshi_base_attack' => 1457.5,
    'bubing_base_defence' => 583.0,
    'qibing_base_defence' => 466.400000000002,
    'gongbing_base_defence' => 408.099999999998,
    'fangshi_base_defence' => 408.099999999998,
    'bubing_base_troops' => 6075.0,
    'qibing_base_troops' => 6075.0,
    'gongbing_base_troops' => 4495.0,
    'fangshi_base_troops' => 4495.0
};
get(318)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         322
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             407
        ]
    ],
    'bubing_base_attack' => 1170.0,
    'qibing_base_attack' => 1287.0,
    'gongbing_base_attack' => 1462.5,
    'fangshi_base_attack' => 1462.5,
    'bubing_base_defence' => 585.0,
    'qibing_base_defence' => 468.000000000002,
    'gongbing_base_defence' => 409.499999999998,
    'fangshi_base_defence' => 409.499999999998,
    'bubing_base_troops' => 6095.0,
    'qibing_base_troops' => 6095.0,
    'gongbing_base_troops' => 4510.0,
    'fangshi_base_troops' => 4510.0
};
get(319)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         323
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             408
        ]
    ],
    'bubing_base_attack' => 1174.0,
    'qibing_base_attack' => 1291.4,
    'gongbing_base_attack' => 1467.5,
    'fangshi_base_attack' => 1467.5,
    'bubing_base_defence' => 587.0,
    'qibing_base_defence' => 469.600000000002,
    'gongbing_base_defence' => 410.899999999998,
    'fangshi_base_defence' => 410.899999999998,
    'bubing_base_troops' => 6115.0,
    'qibing_base_troops' => 6115.0,
    'gongbing_base_troops' => 4525.0,
    'fangshi_base_troops' => 4525.0
};
get(320)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         324
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             409
        ]
    ],
    'bubing_base_attack' => 1178.0,
    'qibing_base_attack' => 1295.8,
    'gongbing_base_attack' => 1472.5,
    'fangshi_base_attack' => 1472.5,
    'bubing_base_defence' => 589.0,
    'qibing_base_defence' => 471.200000000002,
    'gongbing_base_defence' => 412.299999999998,
    'fangshi_base_defence' => 412.299999999998,
    'bubing_base_troops' => 6135.0,
    'qibing_base_troops' => 6135.0,
    'gongbing_base_troops' => 4540.0,
    'fangshi_base_troops' => 4540.0
};
get(321)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         325
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             410
        ]
    ],
    'bubing_base_attack' => 1182.0,
    'qibing_base_attack' => 1300.2,
    'gongbing_base_attack' => 1477.5,
    'fangshi_base_attack' => 1477.5,
    'bubing_base_defence' => 591.0,
    'qibing_base_defence' => 472.800000000002,
    'gongbing_base_defence' => 413.699999999998,
    'fangshi_base_defence' => 413.699999999998,
    'bubing_base_troops' => 6155.0,
    'qibing_base_troops' => 6155.0,
    'gongbing_base_troops' => 4555.0,
    'fangshi_base_troops' => 4555.0
};
get(322)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         326
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             411
        ]
    ],
    'bubing_base_attack' => 1186.0,
    'qibing_base_attack' => 1304.6,
    'gongbing_base_attack' => 1482.5,
    'fangshi_base_attack' => 1482.5,
    'bubing_base_defence' => 593.0,
    'qibing_base_defence' => 474.400000000002,
    'gongbing_base_defence' => 415.099999999998,
    'fangshi_base_defence' => 415.099999999998,
    'bubing_base_troops' => 6175.0,
    'qibing_base_troops' => 6175.0,
    'gongbing_base_troops' => 4570.0,
    'fangshi_base_troops' => 4570.0
};
get(323)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         327
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             412
        ]
    ],
    'bubing_base_attack' => 1190.0,
    'qibing_base_attack' => 1309.0,
    'gongbing_base_attack' => 1487.5,
    'fangshi_base_attack' => 1487.5,
    'bubing_base_defence' => 595.0,
    'qibing_base_defence' => 476.000000000003,
    'gongbing_base_defence' => 416.499999999998,
    'fangshi_base_defence' => 416.499999999998,
    'bubing_base_troops' => 6195.0,
    'qibing_base_troops' => 6195.0,
    'gongbing_base_troops' => 4585.0,
    'fangshi_base_troops' => 4585.0
};
get(324)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         328
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             413
        ]
    ],
    'bubing_base_attack' => 1194.0,
    'qibing_base_attack' => 1313.4,
    'gongbing_base_attack' => 1492.5,
    'fangshi_base_attack' => 1492.5,
    'bubing_base_defence' => 597.0,
    'qibing_base_defence' => 477.600000000003,
    'gongbing_base_defence' => 417.899999999998,
    'fangshi_base_defence' => 417.899999999998,
    'bubing_base_troops' => 6215.0,
    'qibing_base_troops' => 6215.0,
    'gongbing_base_troops' => 4600.0,
    'fangshi_base_troops' => 4600.0
};
get(325)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         329
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             414
        ]
    ],
    'bubing_base_attack' => 1198.0,
    'qibing_base_attack' => 1317.8,
    'gongbing_base_attack' => 1497.5,
    'fangshi_base_attack' => 1497.5,
    'bubing_base_defence' => 599.0,
    'qibing_base_defence' => 479.200000000003,
    'gongbing_base_defence' => 419.299999999998,
    'fangshi_base_defence' => 419.299999999998,
    'bubing_base_troops' => 6235.0,
    'qibing_base_troops' => 6235.0,
    'gongbing_base_troops' => 4615.0,
    'fangshi_base_troops' => 4615.0
};
get(326)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         330
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             415
        ]
    ],
    'bubing_base_attack' => 1202.0,
    'qibing_base_attack' => 1322.2,
    'gongbing_base_attack' => 1502.5,
    'fangshi_base_attack' => 1502.5,
    'bubing_base_defence' => 601.0,
    'qibing_base_defence' => 480.800000000003,
    'gongbing_base_defence' => 420.699999999998,
    'fangshi_base_defence' => 420.699999999998,
    'bubing_base_troops' => 6255.0,
    'qibing_base_troops' => 6255.0,
    'gongbing_base_troops' => 4630.0,
    'fangshi_base_troops' => 4630.0
};
get(327)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         331
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             416
        ]
    ],
    'bubing_base_attack' => 1206.0,
    'qibing_base_attack' => 1326.6,
    'gongbing_base_attack' => 1507.5,
    'fangshi_base_attack' => 1507.5,
    'bubing_base_defence' => 603.0,
    'qibing_base_defence' => 482.400000000003,
    'gongbing_base_defence' => 422.099999999998,
    'fangshi_base_defence' => 422.099999999998,
    'bubing_base_troops' => 6275.0,
    'qibing_base_troops' => 6275.0,
    'gongbing_base_troops' => 4645.0,
    'fangshi_base_troops' => 4645.0
};
get(328)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         332
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             417
        ]
    ],
    'bubing_base_attack' => 1210.0,
    'qibing_base_attack' => 1331.0,
    'gongbing_base_attack' => 1512.5,
    'fangshi_base_attack' => 1512.5,
    'bubing_base_defence' => 605.0,
    'qibing_base_defence' => 484.000000000003,
    'gongbing_base_defence' => 423.499999999998,
    'fangshi_base_defence' => 423.499999999998,
    'bubing_base_troops' => 6295.0,
    'qibing_base_troops' => 6295.0,
    'gongbing_base_troops' => 4660.0,
    'fangshi_base_troops' => 4660.0
};
get(329)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         333
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             418
        ]
    ],
    'bubing_base_attack' => 1214.0,
    'qibing_base_attack' => 1335.4,
    'gongbing_base_attack' => 1517.5,
    'fangshi_base_attack' => 1517.5,
    'bubing_base_defence' => 607.0,
    'qibing_base_defence' => 485.600000000003,
    'gongbing_base_defence' => 424.899999999998,
    'fangshi_base_defence' => 424.899999999998,
    'bubing_base_troops' => 6315.0,
    'qibing_base_troops' => 6315.0,
    'gongbing_base_troops' => 4675.0,
    'fangshi_base_troops' => 4675.0
};
get(330)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         334
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             419
        ]
    ],
    'bubing_base_attack' => 1218.0,
    'qibing_base_attack' => 1339.8,
    'gongbing_base_attack' => 1522.5,
    'fangshi_base_attack' => 1522.5,
    'bubing_base_defence' => 609.0,
    'qibing_base_defence' => 487.200000000003,
    'gongbing_base_defence' => 426.299999999998,
    'fangshi_base_defence' => 426.299999999998,
    'bubing_base_troops' => 6335.0,
    'qibing_base_troops' => 6335.0,
    'gongbing_base_troops' => 4690.0,
    'fangshi_base_troops' => 4690.0
};
get(331)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         335
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             420
        ]
    ],
    'bubing_base_attack' => 1222.0,
    'qibing_base_attack' => 1344.2,
    'gongbing_base_attack' => 1527.5,
    'fangshi_base_attack' => 1527.5,
    'bubing_base_defence' => 611.0,
    'qibing_base_defence' => 488.800000000003,
    'gongbing_base_defence' => 427.699999999998,
    'fangshi_base_defence' => 427.699999999998,
    'bubing_base_troops' => 6355.0,
    'qibing_base_troops' => 6355.0,
    'gongbing_base_troops' => 4705.0,
    'fangshi_base_troops' => 4705.0
};
get(332)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         336
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             421
        ]
    ],
    'bubing_base_attack' => 1226.0,
    'qibing_base_attack' => 1348.6,
    'gongbing_base_attack' => 1532.5,
    'fangshi_base_attack' => 1532.5,
    'bubing_base_defence' => 613.0,
    'qibing_base_defence' => 490.400000000003,
    'gongbing_base_defence' => 429.099999999998,
    'fangshi_base_defence' => 429.099999999998,
    'bubing_base_troops' => 6375.0,
    'qibing_base_troops' => 6375.0,
    'gongbing_base_troops' => 4720.0,
    'fangshi_base_troops' => 4720.0
};
get(333)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         337
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             422
        ]
    ],
    'bubing_base_attack' => 1230.0,
    'qibing_base_attack' => 1353.0,
    'gongbing_base_attack' => 1537.5,
    'fangshi_base_attack' => 1537.5,
    'bubing_base_defence' => 615.0,
    'qibing_base_defence' => 492.000000000003,
    'gongbing_base_defence' => 430.499999999998,
    'fangshi_base_defence' => 430.499999999998,
    'bubing_base_troops' => 6395.0,
    'qibing_base_troops' => 6395.0,
    'gongbing_base_troops' => 4735.0,
    'fangshi_base_troops' => 4735.0
};
get(334)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         338
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             423
        ]
    ],
    'bubing_base_attack' => 1234.0,
    'qibing_base_attack' => 1357.4,
    'gongbing_base_attack' => 1542.5,
    'fangshi_base_attack' => 1542.5,
    'bubing_base_defence' => 617.0,
    'qibing_base_defence' => 493.600000000003,
    'gongbing_base_defence' => 431.899999999998,
    'fangshi_base_defence' => 431.899999999998,
    'bubing_base_troops' => 6415.0,
    'qibing_base_troops' => 6415.0,
    'gongbing_base_troops' => 4750.0,
    'fangshi_base_troops' => 4750.0
};
get(335)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         339
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             424
        ]
    ],
    'bubing_base_attack' => 1238.0,
    'qibing_base_attack' => 1361.8,
    'gongbing_base_attack' => 1547.5,
    'fangshi_base_attack' => 1547.5,
    'bubing_base_defence' => 619.0,
    'qibing_base_defence' => 495.200000000003,
    'gongbing_base_defence' => 433.299999999998,
    'fangshi_base_defence' => 433.299999999998,
    'bubing_base_troops' => 6435.0,
    'qibing_base_troops' => 6435.0,
    'gongbing_base_troops' => 4765.0,
    'fangshi_base_troops' => 4765.0
};
get(336)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         340
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             425
        ]
    ],
    'bubing_base_attack' => 1242.0,
    'qibing_base_attack' => 1366.2,
    'gongbing_base_attack' => 1552.5,
    'fangshi_base_attack' => 1552.5,
    'bubing_base_defence' => 621.0,
    'qibing_base_defence' => 496.800000000003,
    'gongbing_base_defence' => 434.699999999998,
    'fangshi_base_defence' => 434.699999999998,
    'bubing_base_troops' => 6455.0,
    'qibing_base_troops' => 6455.0,
    'gongbing_base_troops' => 4780.0,
    'fangshi_base_troops' => 4780.0
};
get(337)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         341
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             426
        ]
    ],
    'bubing_base_attack' => 1246.0,
    'qibing_base_attack' => 1370.6,
    'gongbing_base_attack' => 1557.5,
    'fangshi_base_attack' => 1557.5,
    'bubing_base_defence' => 623.0,
    'qibing_base_defence' => 498.400000000003,
    'gongbing_base_defence' => 436.099999999998,
    'fangshi_base_defence' => 436.099999999998,
    'bubing_base_troops' => 6475.0,
    'qibing_base_troops' => 6475.0,
    'gongbing_base_troops' => 4795.0,
    'fangshi_base_troops' => 4795.0
};
get(338)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         342
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             427
        ]
    ],
    'bubing_base_attack' => 1250.0,
    'qibing_base_attack' => 1375.0,
    'gongbing_base_attack' => 1562.5,
    'fangshi_base_attack' => 1562.5,
    'bubing_base_defence' => 625.0,
    'qibing_base_defence' => 500.000000000003,
    'gongbing_base_defence' => 437.499999999998,
    'fangshi_base_defence' => 437.499999999998,
    'bubing_base_troops' => 6495.0,
    'qibing_base_troops' => 6495.0,
    'gongbing_base_troops' => 4810.0,
    'fangshi_base_troops' => 4810.0
};
get(339)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         343
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             428
        ]
    ],
    'bubing_base_attack' => 1254.0,
    'qibing_base_attack' => 1379.4,
    'gongbing_base_attack' => 1567.5,
    'fangshi_base_attack' => 1567.5,
    'bubing_base_defence' => 627.0,
    'qibing_base_defence' => 501.600000000003,
    'gongbing_base_defence' => 438.899999999998,
    'fangshi_base_defence' => 438.899999999998,
    'bubing_base_troops' => 6515.0,
    'qibing_base_troops' => 6515.0,
    'gongbing_base_troops' => 4825.0,
    'fangshi_base_troops' => 4825.0
};
get(340)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         344
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             429
        ]
    ],
    'bubing_base_attack' => 1258.0,
    'qibing_base_attack' => 1383.8,
    'gongbing_base_attack' => 1572.5,
    'fangshi_base_attack' => 1572.5,
    'bubing_base_defence' => 629.0,
    'qibing_base_defence' => 503.200000000003,
    'gongbing_base_defence' => 440.299999999998,
    'fangshi_base_defence' => 440.299999999998,
    'bubing_base_troops' => 6535.0,
    'qibing_base_troops' => 6535.0,
    'gongbing_base_troops' => 4840.0,
    'fangshi_base_troops' => 4840.0
};
get(341)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         345
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             430
        ]
    ],
    'bubing_base_attack' => 1262.0,
    'qibing_base_attack' => 1388.2,
    'gongbing_base_attack' => 1577.5,
    'fangshi_base_attack' => 1577.5,
    'bubing_base_defence' => 631.0,
    'qibing_base_defence' => 504.800000000003,
    'gongbing_base_defence' => 441.699999999998,
    'fangshi_base_defence' => 441.699999999998,
    'bubing_base_troops' => 6555.0,
    'qibing_base_troops' => 6555.0,
    'gongbing_base_troops' => 4855.0,
    'fangshi_base_troops' => 4855.0
};
get(342)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         346
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             431
        ]
    ],
    'bubing_base_attack' => 1266.0,
    'qibing_base_attack' => 1392.6,
    'gongbing_base_attack' => 1582.5,
    'fangshi_base_attack' => 1582.5,
    'bubing_base_defence' => 633.0,
    'qibing_base_defence' => 506.400000000003,
    'gongbing_base_defence' => 443.099999999998,
    'fangshi_base_defence' => 443.099999999998,
    'bubing_base_troops' => 6575.0,
    'qibing_base_troops' => 6575.0,
    'gongbing_base_troops' => 4870.0,
    'fangshi_base_troops' => 4870.0
};
get(343)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         347
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             432
        ]
    ],
    'bubing_base_attack' => 1270.0,
    'qibing_base_attack' => 1397.0,
    'gongbing_base_attack' => 1587.5,
    'fangshi_base_attack' => 1587.5,
    'bubing_base_defence' => 635.0,
    'qibing_base_defence' => 508.000000000003,
    'gongbing_base_defence' => 444.499999999998,
    'fangshi_base_defence' => 444.499999999998,
    'bubing_base_troops' => 6595.0,
    'qibing_base_troops' => 6595.0,
    'gongbing_base_troops' => 4885.0,
    'fangshi_base_troops' => 4885.0
};
get(344)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         348
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             433
        ]
    ],
    'bubing_base_attack' => 1274.0,
    'qibing_base_attack' => 1401.4,
    'gongbing_base_attack' => 1592.5,
    'fangshi_base_attack' => 1592.5,
    'bubing_base_defence' => 637.0,
    'qibing_base_defence' => 509.600000000003,
    'gongbing_base_defence' => 445.899999999998,
    'fangshi_base_defence' => 445.899999999998,
    'bubing_base_troops' => 6615.0,
    'qibing_base_troops' => 6615.0,
    'gongbing_base_troops' => 4900.0,
    'fangshi_base_troops' => 4900.0
};
get(345)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         349
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             434
        ]
    ],
    'bubing_base_attack' => 1278.0,
    'qibing_base_attack' => 1405.8,
    'gongbing_base_attack' => 1597.5,
    'fangshi_base_attack' => 1597.5,
    'bubing_base_defence' => 639.0,
    'qibing_base_defence' => 511.200000000003,
    'gongbing_base_defence' => 447.299999999998,
    'fangshi_base_defence' => 447.299999999998,
    'bubing_base_troops' => 6635.0,
    'qibing_base_troops' => 6635.0,
    'gongbing_base_troops' => 4915.0,
    'fangshi_base_troops' => 4915.0
};
get(346)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         350
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             435
        ]
    ],
    'bubing_base_attack' => 1282.0,
    'qibing_base_attack' => 1410.2,
    'gongbing_base_attack' => 1602.5,
    'fangshi_base_attack' => 1602.5,
    'bubing_base_defence' => 641.0,
    'qibing_base_defence' => 512.800000000003,
    'gongbing_base_defence' => 448.699999999998,
    'fangshi_base_defence' => 448.699999999998,
    'bubing_base_troops' => 6655.0,
    'qibing_base_troops' => 6655.0,
    'gongbing_base_troops' => 4930.0,
    'fangshi_base_troops' => 4930.0
};
get(347)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         351
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             436
        ]
    ],
    'bubing_base_attack' => 1286.0,
    'qibing_base_attack' => 1414.6,
    'gongbing_base_attack' => 1607.5,
    'fangshi_base_attack' => 1607.5,
    'bubing_base_defence' => 643.0,
    'qibing_base_defence' => 514.400000000003,
    'gongbing_base_defence' => 450.099999999998,
    'fangshi_base_defence' => 450.099999999998,
    'bubing_base_troops' => 6675.0,
    'qibing_base_troops' => 6675.0,
    'gongbing_base_troops' => 4945.0,
    'fangshi_base_troops' => 4945.0
};
get(348)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         352
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             437
        ]
    ],
    'bubing_base_attack' => 1290.0,
    'qibing_base_attack' => 1419.0,
    'gongbing_base_attack' => 1612.5,
    'fangshi_base_attack' => 1612.5,
    'bubing_base_defence' => 645.0,
    'qibing_base_defence' => 516.000000000003,
    'gongbing_base_defence' => 451.499999999998,
    'fangshi_base_defence' => 451.499999999998,
    'bubing_base_troops' => 6695.0,
    'qibing_base_troops' => 6695.0,
    'gongbing_base_troops' => 4960.0,
    'fangshi_base_troops' => 4960.0
};
get(349)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         353
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             438
        ]
    ],
    'bubing_base_attack' => 1294.0,
    'qibing_base_attack' => 1423.4,
    'gongbing_base_attack' => 1617.5,
    'fangshi_base_attack' => 1617.5,
    'bubing_base_defence' => 647.0,
    'qibing_base_defence' => 517.600000000003,
    'gongbing_base_defence' => 452.899999999998,
    'fangshi_base_defence' => 452.899999999998,
    'bubing_base_troops' => 6715.0,
    'qibing_base_troops' => 6715.0,
    'gongbing_base_troops' => 4975.0,
    'fangshi_base_troops' => 4975.0
};
get(350)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         354
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             439
        ]
    ],
    'bubing_base_attack' => 1298.0,
    'qibing_base_attack' => 1427.8,
    'gongbing_base_attack' => 1622.5,
    'fangshi_base_attack' => 1622.5,
    'bubing_base_defence' => 649.0,
    'qibing_base_defence' => 519.200000000003,
    'gongbing_base_defence' => 454.299999999998,
    'fangshi_base_defence' => 454.299999999998,
    'bubing_base_troops' => 6735.0,
    'qibing_base_troops' => 6735.0,
    'gongbing_base_troops' => 4990.0,
    'fangshi_base_troops' => 4990.0
};
get(351)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         355
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             440
        ]
    ],
    'bubing_base_attack' => 1302.0,
    'qibing_base_attack' => 1432.2,
    'gongbing_base_attack' => 1627.5,
    'fangshi_base_attack' => 1627.5,
    'bubing_base_defence' => 651.0,
    'qibing_base_defence' => 520.800000000003,
    'gongbing_base_defence' => 455.699999999997,
    'fangshi_base_defence' => 455.699999999997,
    'bubing_base_troops' => 6755.0,
    'qibing_base_troops' => 6755.0,
    'gongbing_base_troops' => 5005.0,
    'fangshi_base_troops' => 5005.0
};
get(352)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         356
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             441
        ]
    ],
    'bubing_base_attack' => 1306.0,
    'qibing_base_attack' => 1436.6,
    'gongbing_base_attack' => 1632.5,
    'fangshi_base_attack' => 1632.5,
    'bubing_base_defence' => 653.0,
    'qibing_base_defence' => 522.400000000003,
    'gongbing_base_defence' => 457.099999999997,
    'fangshi_base_defence' => 457.099999999997,
    'bubing_base_troops' => 6775.0,
    'qibing_base_troops' => 6775.0,
    'gongbing_base_troops' => 5020.0,
    'fangshi_base_troops' => 5020.0
};
get(353)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         357
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             442
        ]
    ],
    'bubing_base_attack' => 1310.0,
    'qibing_base_attack' => 1441.0,
    'gongbing_base_attack' => 1637.5,
    'fangshi_base_attack' => 1637.5,
    'bubing_base_defence' => 655.0,
    'qibing_base_defence' => 524.000000000003,
    'gongbing_base_defence' => 458.499999999997,
    'fangshi_base_defence' => 458.499999999997,
    'bubing_base_troops' => 6795.0,
    'qibing_base_troops' => 6795.0,
    'gongbing_base_troops' => 5035.0,
    'fangshi_base_troops' => 5035.0
};
get(354)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         358
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             443
        ]
    ],
    'bubing_base_attack' => 1314.0,
    'qibing_base_attack' => 1445.4,
    'gongbing_base_attack' => 1642.5,
    'fangshi_base_attack' => 1642.5,
    'bubing_base_defence' => 657.0,
    'qibing_base_defence' => 525.600000000003,
    'gongbing_base_defence' => 459.899999999997,
    'fangshi_base_defence' => 459.899999999997,
    'bubing_base_troops' => 6815.0,
    'qibing_base_troops' => 6815.0,
    'gongbing_base_troops' => 5050.0,
    'fangshi_base_troops' => 5050.0
};
get(355)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         359
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             444
        ]
    ],
    'bubing_base_attack' => 1318.0,
    'qibing_base_attack' => 1449.8,
    'gongbing_base_attack' => 1647.5,
    'fangshi_base_attack' => 1647.5,
    'bubing_base_defence' => 659.0,
    'qibing_base_defence' => 527.200000000003,
    'gongbing_base_defence' => 461.299999999997,
    'fangshi_base_defence' => 461.299999999997,
    'bubing_base_troops' => 6835.0,
    'qibing_base_troops' => 6835.0,
    'gongbing_base_troops' => 5065.0,
    'fangshi_base_troops' => 5065.0
};
get(356)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         360
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             445
        ]
    ],
    'bubing_base_attack' => 1322.0,
    'qibing_base_attack' => 1454.20000000001,
    'gongbing_base_attack' => 1652.5,
    'fangshi_base_attack' => 1652.5,
    'bubing_base_defence' => 661.0,
    'qibing_base_defence' => 528.800000000003,
    'gongbing_base_defence' => 462.699999999997,
    'fangshi_base_defence' => 462.699999999997,
    'bubing_base_troops' => 6855.0,
    'qibing_base_troops' => 6855.0,
    'gongbing_base_troops' => 5080.0,
    'fangshi_base_troops' => 5080.0
};
get(357)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         361
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             446
        ]
    ],
    'bubing_base_attack' => 1326.0,
    'qibing_base_attack' => 1458.60000000001,
    'gongbing_base_attack' => 1657.5,
    'fangshi_base_attack' => 1657.5,
    'bubing_base_defence' => 663.0,
    'qibing_base_defence' => 530.400000000003,
    'gongbing_base_defence' => 464.099999999997,
    'fangshi_base_defence' => 464.099999999997,
    'bubing_base_troops' => 6875.0,
    'qibing_base_troops' => 6875.0,
    'gongbing_base_troops' => 5095.0,
    'fangshi_base_troops' => 5095.0
};
get(358)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         362
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             447
        ]
    ],
    'bubing_base_attack' => 1330.0,
    'qibing_base_attack' => 1463.00000000001,
    'gongbing_base_attack' => 1662.5,
    'fangshi_base_attack' => 1662.5,
    'bubing_base_defence' => 665.0,
    'qibing_base_defence' => 532.000000000003,
    'gongbing_base_defence' => 465.499999999997,
    'fangshi_base_defence' => 465.499999999997,
    'bubing_base_troops' => 6895.0,
    'qibing_base_troops' => 6895.0,
    'gongbing_base_troops' => 5110.0,
    'fangshi_base_troops' => 5110.0
};
get(359)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         363
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             448
        ]
    ],
    'bubing_base_attack' => 1334.0,
    'qibing_base_attack' => 1467.40000000001,
    'gongbing_base_attack' => 1667.5,
    'fangshi_base_attack' => 1667.5,
    'bubing_base_defence' => 667.0,
    'qibing_base_defence' => 533.600000000003,
    'gongbing_base_defence' => 466.899999999997,
    'fangshi_base_defence' => 466.899999999997,
    'bubing_base_troops' => 6915.0,
    'qibing_base_troops' => 6915.0,
    'gongbing_base_troops' => 5125.0,
    'fangshi_base_troops' => 5125.0
};
get(360)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         364
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             449
        ]
    ],
    'bubing_base_attack' => 1338.0,
    'qibing_base_attack' => 1471.80000000001,
    'gongbing_base_attack' => 1672.5,
    'fangshi_base_attack' => 1672.5,
    'bubing_base_defence' => 669.0,
    'qibing_base_defence' => 535.200000000003,
    'gongbing_base_defence' => 468.299999999997,
    'fangshi_base_defence' => 468.299999999997,
    'bubing_base_troops' => 6935.0,
    'qibing_base_troops' => 6935.0,
    'gongbing_base_troops' => 5140.0,
    'fangshi_base_troops' => 5140.0
};
get(361)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         365
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             450
        ]
    ],
    'bubing_base_attack' => 1342.0,
    'qibing_base_attack' => 1476.20000000001,
    'gongbing_base_attack' => 1677.5,
    'fangshi_base_attack' => 1677.5,
    'bubing_base_defence' => 671.0,
    'qibing_base_defence' => 536.800000000003,
    'gongbing_base_defence' => 469.699999999997,
    'fangshi_base_defence' => 469.699999999997,
    'bubing_base_troops' => 6955.0,
    'qibing_base_troops' => 6955.0,
    'gongbing_base_troops' => 5155.0,
    'fangshi_base_troops' => 5155.0
};
get(362)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         366
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             451
        ]
    ],
    'bubing_base_attack' => 1346.0,
    'qibing_base_attack' => 1480.60000000001,
    'gongbing_base_attack' => 1682.5,
    'fangshi_base_attack' => 1682.5,
    'bubing_base_defence' => 673.0,
    'qibing_base_defence' => 538.400000000003,
    'gongbing_base_defence' => 471.099999999997,
    'fangshi_base_defence' => 471.099999999997,
    'bubing_base_troops' => 6975.0,
    'qibing_base_troops' => 6975.0,
    'gongbing_base_troops' => 5170.0,
    'fangshi_base_troops' => 5170.0
};
get(363)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         367
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             452
        ]
    ],
    'bubing_base_attack' => 1350.0,
    'qibing_base_attack' => 1485.00000000001,
    'gongbing_base_attack' => 1687.5,
    'fangshi_base_attack' => 1687.5,
    'bubing_base_defence' => 675.0,
    'qibing_base_defence' => 540.000000000003,
    'gongbing_base_defence' => 472.499999999997,
    'fangshi_base_defence' => 472.499999999997,
    'bubing_base_troops' => 6995.0,
    'qibing_base_troops' => 6995.0,
    'gongbing_base_troops' => 5185.0,
    'fangshi_base_troops' => 5185.0
};
get(364)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         368
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             453
        ]
    ],
    'bubing_base_attack' => 1354.0,
    'qibing_base_attack' => 1489.40000000001,
    'gongbing_base_attack' => 1692.5,
    'fangshi_base_attack' => 1692.5,
    'bubing_base_defence' => 677.0,
    'qibing_base_defence' => 541.600000000003,
    'gongbing_base_defence' => 473.899999999997,
    'fangshi_base_defence' => 473.899999999997,
    'bubing_base_troops' => 7015.0,
    'qibing_base_troops' => 7015.0,
    'gongbing_base_troops' => 5200.0,
    'fangshi_base_troops' => 5200.0
};
get(365)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         369
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             454
        ]
    ],
    'bubing_base_attack' => 1358.0,
    'qibing_base_attack' => 1493.80000000001,
    'gongbing_base_attack' => 1697.5,
    'fangshi_base_attack' => 1697.5,
    'bubing_base_defence' => 679.0,
    'qibing_base_defence' => 543.200000000003,
    'gongbing_base_defence' => 475.299999999997,
    'fangshi_base_defence' => 475.299999999997,
    'bubing_base_troops' => 7035.0,
    'qibing_base_troops' => 7035.0,
    'gongbing_base_troops' => 5215.0,
    'fangshi_base_troops' => 5215.0
};
get(366)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         370
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             455
        ]
    ],
    'bubing_base_attack' => 1362.0,
    'qibing_base_attack' => 1498.20000000001,
    'gongbing_base_attack' => 1702.5,
    'fangshi_base_attack' => 1702.5,
    'bubing_base_defence' => 681.0,
    'qibing_base_defence' => 544.800000000003,
    'gongbing_base_defence' => 476.699999999997,
    'fangshi_base_defence' => 476.699999999997,
    'bubing_base_troops' => 7055.0,
    'qibing_base_troops' => 7055.0,
    'gongbing_base_troops' => 5230.0,
    'fangshi_base_troops' => 5230.0
};
get(367)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         371
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             456
        ]
    ],
    'bubing_base_attack' => 1366.0,
    'qibing_base_attack' => 1502.60000000001,
    'gongbing_base_attack' => 1707.5,
    'fangshi_base_attack' => 1707.5,
    'bubing_base_defence' => 683.0,
    'qibing_base_defence' => 546.400000000004,
    'gongbing_base_defence' => 478.099999999997,
    'fangshi_base_defence' => 478.099999999997,
    'bubing_base_troops' => 7075.0,
    'qibing_base_troops' => 7075.0,
    'gongbing_base_troops' => 5245.0,
    'fangshi_base_troops' => 5245.0
};
get(368)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         372
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             457
        ]
    ],
    'bubing_base_attack' => 1370.0,
    'qibing_base_attack' => 1507.00000000001,
    'gongbing_base_attack' => 1712.5,
    'fangshi_base_attack' => 1712.5,
    'bubing_base_defence' => 685.0,
    'qibing_base_defence' => 548.000000000004,
    'gongbing_base_defence' => 479.499999999997,
    'fangshi_base_defence' => 479.499999999997,
    'bubing_base_troops' => 7095.0,
    'qibing_base_troops' => 7095.0,
    'gongbing_base_troops' => 5260.0,
    'fangshi_base_troops' => 5260.0
};
get(369)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         373
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             458
        ]
    ],
    'bubing_base_attack' => 1374.0,
    'qibing_base_attack' => 1511.40000000001,
    'gongbing_base_attack' => 1717.5,
    'fangshi_base_attack' => 1717.5,
    'bubing_base_defence' => 687.0,
    'qibing_base_defence' => 549.600000000004,
    'gongbing_base_defence' => 480.899999999997,
    'fangshi_base_defence' => 480.899999999997,
    'bubing_base_troops' => 7115.0,
    'qibing_base_troops' => 7115.0,
    'gongbing_base_troops' => 5275.0,
    'fangshi_base_troops' => 5275.0
};
get(370)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         374
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             459
        ]
    ],
    'bubing_base_attack' => 1378.0,
    'qibing_base_attack' => 1515.80000000001,
    'gongbing_base_attack' => 1722.5,
    'fangshi_base_attack' => 1722.5,
    'bubing_base_defence' => 689.0,
    'qibing_base_defence' => 551.200000000004,
    'gongbing_base_defence' => 482.299999999997,
    'fangshi_base_defence' => 482.299999999997,
    'bubing_base_troops' => 7135.0,
    'qibing_base_troops' => 7135.0,
    'gongbing_base_troops' => 5290.0,
    'fangshi_base_troops' => 5290.0
};
get(371)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         375
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             460
        ]
    ],
    'bubing_base_attack' => 1382.0,
    'qibing_base_attack' => 1520.20000000001,
    'gongbing_base_attack' => 1727.5,
    'fangshi_base_attack' => 1727.5,
    'bubing_base_defence' => 691.0,
    'qibing_base_defence' => 552.800000000004,
    'gongbing_base_defence' => 483.699999999997,
    'fangshi_base_defence' => 483.699999999997,
    'bubing_base_troops' => 7155.0,
    'qibing_base_troops' => 7155.0,
    'gongbing_base_troops' => 5305.0,
    'fangshi_base_troops' => 5305.0
};
get(372)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         376
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             461
        ]
    ],
    'bubing_base_attack' => 1386.0,
    'qibing_base_attack' => 1524.60000000001,
    'gongbing_base_attack' => 1732.5,
    'fangshi_base_attack' => 1732.5,
    'bubing_base_defence' => 693.0,
    'qibing_base_defence' => 554.400000000004,
    'gongbing_base_defence' => 485.099999999997,
    'fangshi_base_defence' => 485.099999999997,
    'bubing_base_troops' => 7175.0,
    'qibing_base_troops' => 7175.0,
    'gongbing_base_troops' => 5320.0,
    'fangshi_base_troops' => 5320.0
};
get(373)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         377
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             462
        ]
    ],
    'bubing_base_attack' => 1390.0,
    'qibing_base_attack' => 1529.00000000001,
    'gongbing_base_attack' => 1737.5,
    'fangshi_base_attack' => 1737.5,
    'bubing_base_defence' => 695.0,
    'qibing_base_defence' => 556.000000000004,
    'gongbing_base_defence' => 486.499999999997,
    'fangshi_base_defence' => 486.499999999997,
    'bubing_base_troops' => 7195.0,
    'qibing_base_troops' => 7195.0,
    'gongbing_base_troops' => 5335.0,
    'fangshi_base_troops' => 5335.0
};
get(374)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         378
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             463
        ]
    ],
    'bubing_base_attack' => 1394.0,
    'qibing_base_attack' => 1533.40000000001,
    'gongbing_base_attack' => 1742.5,
    'fangshi_base_attack' => 1742.5,
    'bubing_base_defence' => 697.0,
    'qibing_base_defence' => 557.600000000004,
    'gongbing_base_defence' => 487.899999999997,
    'fangshi_base_defence' => 487.899999999997,
    'bubing_base_troops' => 7215.0,
    'qibing_base_troops' => 7215.0,
    'gongbing_base_troops' => 5350.0,
    'fangshi_base_troops' => 5350.0
};
get(375)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         379
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             464
        ]
    ],
    'bubing_base_attack' => 1398.0,
    'qibing_base_attack' => 1537.80000000001,
    'gongbing_base_attack' => 1747.5,
    'fangshi_base_attack' => 1747.5,
    'bubing_base_defence' => 699.0,
    'qibing_base_defence' => 559.200000000004,
    'gongbing_base_defence' => 489.299999999997,
    'fangshi_base_defence' => 489.299999999997,
    'bubing_base_troops' => 7235.0,
    'qibing_base_troops' => 7235.0,
    'gongbing_base_troops' => 5365.0,
    'fangshi_base_troops' => 5365.0
};
get(376)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         380
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             465
        ]
    ],
    'bubing_base_attack' => 1402.0,
    'qibing_base_attack' => 1542.20000000001,
    'gongbing_base_attack' => 1752.5,
    'fangshi_base_attack' => 1752.5,
    'bubing_base_defence' => 701.0,
    'qibing_base_defence' => 560.800000000004,
    'gongbing_base_defence' => 490.699999999997,
    'fangshi_base_defence' => 490.699999999997,
    'bubing_base_troops' => 7255.0,
    'qibing_base_troops' => 7255.0,
    'gongbing_base_troops' => 5380.0,
    'fangshi_base_troops' => 5380.0
};
get(377)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         381
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             466
        ]
    ],
    'bubing_base_attack' => 1406.0,
    'qibing_base_attack' => 1546.60000000001,
    'gongbing_base_attack' => 1757.5,
    'fangshi_base_attack' => 1757.5,
    'bubing_base_defence' => 703.0,
    'qibing_base_defence' => 562.400000000004,
    'gongbing_base_defence' => 492.099999999997,
    'fangshi_base_defence' => 492.099999999997,
    'bubing_base_troops' => 7275.0,
    'qibing_base_troops' => 7275.0,
    'gongbing_base_troops' => 5395.0,
    'fangshi_base_troops' => 5395.0
};
get(378)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         382
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             467
        ]
    ],
    'bubing_base_attack' => 1410.0,
    'qibing_base_attack' => 1551.00000000001,
    'gongbing_base_attack' => 1762.5,
    'fangshi_base_attack' => 1762.5,
    'bubing_base_defence' => 705.0,
    'qibing_base_defence' => 564.000000000004,
    'gongbing_base_defence' => 493.499999999997,
    'fangshi_base_defence' => 493.499999999997,
    'bubing_base_troops' => 7295.0,
    'qibing_base_troops' => 7295.0,
    'gongbing_base_troops' => 5410.0,
    'fangshi_base_troops' => 5410.0
};
get(379)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         383
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             468
        ]
    ],
    'bubing_base_attack' => 1414.0,
    'qibing_base_attack' => 1555.40000000001,
    'gongbing_base_attack' => 1767.5,
    'fangshi_base_attack' => 1767.5,
    'bubing_base_defence' => 707.0,
    'qibing_base_defence' => 565.600000000004,
    'gongbing_base_defence' => 494.899999999997,
    'fangshi_base_defence' => 494.899999999997,
    'bubing_base_troops' => 7315.0,
    'qibing_base_troops' => 7315.0,
    'gongbing_base_troops' => 5425.0,
    'fangshi_base_troops' => 5425.0
};
get(380)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         384
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             469
        ]
    ],
    'bubing_base_attack' => 1418.0,
    'qibing_base_attack' => 1559.80000000001,
    'gongbing_base_attack' => 1772.5,
    'fangshi_base_attack' => 1772.5,
    'bubing_base_defence' => 709.0,
    'qibing_base_defence' => 567.200000000004,
    'gongbing_base_defence' => 496.299999999997,
    'fangshi_base_defence' => 496.299999999997,
    'bubing_base_troops' => 7335.0,
    'qibing_base_troops' => 7335.0,
    'gongbing_base_troops' => 5440.0,
    'fangshi_base_troops' => 5440.0
};
get(381)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         385
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             470
        ]
    ],
    'bubing_base_attack' => 1422.0,
    'qibing_base_attack' => 1564.20000000001,
    'gongbing_base_attack' => 1777.5,
    'fangshi_base_attack' => 1777.5,
    'bubing_base_defence' => 711.0,
    'qibing_base_defence' => 568.800000000004,
    'gongbing_base_defence' => 497.699999999997,
    'fangshi_base_defence' => 497.699999999997,
    'bubing_base_troops' => 7355.0,
    'qibing_base_troops' => 7355.0,
    'gongbing_base_troops' => 5455.0,
    'fangshi_base_troops' => 5455.0
};
get(382)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         386
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             471
        ]
    ],
    'bubing_base_attack' => 1426.0,
    'qibing_base_attack' => 1568.60000000001,
    'gongbing_base_attack' => 1782.5,
    'fangshi_base_attack' => 1782.5,
    'bubing_base_defence' => 713.0,
    'qibing_base_defence' => 570.400000000004,
    'gongbing_base_defence' => 499.099999999997,
    'fangshi_base_defence' => 499.099999999997,
    'bubing_base_troops' => 7375.0,
    'qibing_base_troops' => 7375.0,
    'gongbing_base_troops' => 5470.0,
    'fangshi_base_troops' => 5470.0
};
get(383)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         387
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             472
        ]
    ],
    'bubing_base_attack' => 1430.0,
    'qibing_base_attack' => 1573.00000000001,
    'gongbing_base_attack' => 1787.5,
    'fangshi_base_attack' => 1787.5,
    'bubing_base_defence' => 715.0,
    'qibing_base_defence' => 572.000000000004,
    'gongbing_base_defence' => 500.499999999997,
    'fangshi_base_defence' => 500.499999999997,
    'bubing_base_troops' => 7395.0,
    'qibing_base_troops' => 7395.0,
    'gongbing_base_troops' => 5485.0,
    'fangshi_base_troops' => 5485.0
};
get(384)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         388
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             473
        ]
    ],
    'bubing_base_attack' => 1434.0,
    'qibing_base_attack' => 1577.40000000001,
    'gongbing_base_attack' => 1792.5,
    'fangshi_base_attack' => 1792.5,
    'bubing_base_defence' => 717.0,
    'qibing_base_defence' => 573.600000000004,
    'gongbing_base_defence' => 501.899999999997,
    'fangshi_base_defence' => 501.899999999997,
    'bubing_base_troops' => 7415.0,
    'qibing_base_troops' => 7415.0,
    'gongbing_base_troops' => 5500.0,
    'fangshi_base_troops' => 5500.0
};
get(385)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         389
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             474
        ]
    ],
    'bubing_base_attack' => 1438.0,
    'qibing_base_attack' => 1581.80000000001,
    'gongbing_base_attack' => 1797.5,
    'fangshi_base_attack' => 1797.5,
    'bubing_base_defence' => 719.0,
    'qibing_base_defence' => 575.200000000004,
    'gongbing_base_defence' => 503.299999999997,
    'fangshi_base_defence' => 503.299999999997,
    'bubing_base_troops' => 7435.0,
    'qibing_base_troops' => 7435.0,
    'gongbing_base_troops' => 5515.0,
    'fangshi_base_troops' => 5515.0
};
get(386)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         390
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             475
        ]
    ],
    'bubing_base_attack' => 1442.0,
    'qibing_base_attack' => 1586.20000000001,
    'gongbing_base_attack' => 1802.5,
    'fangshi_base_attack' => 1802.5,
    'bubing_base_defence' => 721.0,
    'qibing_base_defence' => 576.800000000004,
    'gongbing_base_defence' => 504.699999999997,
    'fangshi_base_defence' => 504.699999999997,
    'bubing_base_troops' => 7455.0,
    'qibing_base_troops' => 7455.0,
    'gongbing_base_troops' => 5530.0,
    'fangshi_base_troops' => 5530.0
};
get(387)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         391
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             476
        ]
    ],
    'bubing_base_attack' => 1446.0,
    'qibing_base_attack' => 1590.60000000001,
    'gongbing_base_attack' => 1807.5,
    'fangshi_base_attack' => 1807.5,
    'bubing_base_defence' => 723.0,
    'qibing_base_defence' => 578.400000000004,
    'gongbing_base_defence' => 506.099999999997,
    'fangshi_base_defence' => 506.099999999997,
    'bubing_base_troops' => 7475.0,
    'qibing_base_troops' => 7475.0,
    'gongbing_base_troops' => 5545.0,
    'fangshi_base_troops' => 5545.0
};
get(388)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         392
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             477
        ]
    ],
    'bubing_base_attack' => 1450.0,
    'qibing_base_attack' => 1595.00000000001,
    'gongbing_base_attack' => 1812.5,
    'fangshi_base_attack' => 1812.5,
    'bubing_base_defence' => 725.0,
    'qibing_base_defence' => 580.000000000004,
    'gongbing_base_defence' => 507.499999999997,
    'fangshi_base_defence' => 507.499999999997,
    'bubing_base_troops' => 7495.0,
    'qibing_base_troops' => 7495.0,
    'gongbing_base_troops' => 5560.0,
    'fangshi_base_troops' => 5560.0
};
get(389)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         393
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             478
        ]
    ],
    'bubing_base_attack' => 1454.0,
    'qibing_base_attack' => 1599.40000000001,
    'gongbing_base_attack' => 1817.5,
    'fangshi_base_attack' => 1817.5,
    'bubing_base_defence' => 727.0,
    'qibing_base_defence' => 581.600000000004,
    'gongbing_base_defence' => 508.899999999997,
    'fangshi_base_defence' => 508.899999999997,
    'bubing_base_troops' => 7515.0,
    'qibing_base_troops' => 7515.0,
    'gongbing_base_troops' => 5575.0,
    'fangshi_base_troops' => 5575.0
};
get(390)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         394
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             479
        ]
    ],
    'bubing_base_attack' => 1458.0,
    'qibing_base_attack' => 1603.80000000001,
    'gongbing_base_attack' => 1822.5,
    'fangshi_base_attack' => 1822.5,
    'bubing_base_defence' => 729.0,
    'qibing_base_defence' => 583.200000000004,
    'gongbing_base_defence' => 510.299999999997,
    'fangshi_base_defence' => 510.299999999997,
    'bubing_base_troops' => 7535.0,
    'qibing_base_troops' => 7535.0,
    'gongbing_base_troops' => 5590.0,
    'fangshi_base_troops' => 5590.0
};
get(391)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         395
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             480
        ]
    ],
    'bubing_base_attack' => 1462.0,
    'qibing_base_attack' => 1608.20000000001,
    'gongbing_base_attack' => 1827.5,
    'fangshi_base_attack' => 1827.5,
    'bubing_base_defence' => 731.0,
    'qibing_base_defence' => 584.800000000004,
    'gongbing_base_defence' => 511.699999999997,
    'fangshi_base_defence' => 511.699999999997,
    'bubing_base_troops' => 7555.0,
    'qibing_base_troops' => 7555.0,
    'gongbing_base_troops' => 5605.0,
    'fangshi_base_troops' => 5605.0
};
get(392)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         396
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             481
        ]
    ],
    'bubing_base_attack' => 1466.0,
    'qibing_base_attack' => 1612.60000000001,
    'gongbing_base_attack' => 1832.5,
    'fangshi_base_attack' => 1832.5,
    'bubing_base_defence' => 733.0,
    'qibing_base_defence' => 586.400000000004,
    'gongbing_base_defence' => 513.099999999997,
    'fangshi_base_defence' => 513.099999999997,
    'bubing_base_troops' => 7575.0,
    'qibing_base_troops' => 7575.0,
    'gongbing_base_troops' => 5620.0,
    'fangshi_base_troops' => 5620.0
};
get(393)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         397
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             482
        ]
    ],
    'bubing_base_attack' => 1470.0,
    'qibing_base_attack' => 1617.00000000001,
    'gongbing_base_attack' => 1837.5,
    'fangshi_base_attack' => 1837.5,
    'bubing_base_defence' => 735.0,
    'qibing_base_defence' => 588.000000000004,
    'gongbing_base_defence' => 514.499999999997,
    'fangshi_base_defence' => 514.499999999997,
    'bubing_base_troops' => 7595.0,
    'qibing_base_troops' => 7595.0,
    'gongbing_base_troops' => 5635.0,
    'fangshi_base_troops' => 5635.0
};
get(394)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         398
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             483
        ]
    ],
    'bubing_base_attack' => 1474.0,
    'qibing_base_attack' => 1621.40000000001,
    'gongbing_base_attack' => 1842.5,
    'fangshi_base_attack' => 1842.5,
    'bubing_base_defence' => 737.0,
    'qibing_base_defence' => 589.600000000004,
    'gongbing_base_defence' => 515.899999999997,
    'fangshi_base_defence' => 515.899999999997,
    'bubing_base_troops' => 7615.0,
    'qibing_base_troops' => 7615.0,
    'gongbing_base_troops' => 5650.0,
    'fangshi_base_troops' => 5650.0
};
get(395)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         399
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             484
        ]
    ],
    'bubing_base_attack' => 1478.0,
    'qibing_base_attack' => 1625.80000000001,
    'gongbing_base_attack' => 1847.5,
    'fangshi_base_attack' => 1847.5,
    'bubing_base_defence' => 739.0,
    'qibing_base_defence' => 591.200000000004,
    'gongbing_base_defence' => 517.299999999997,
    'fangshi_base_defence' => 517.299999999997,
    'bubing_base_troops' => 7635.0,
    'qibing_base_troops' => 7635.0,
    'gongbing_base_troops' => 5665.0,
    'fangshi_base_troops' => 5665.0
};
get(396)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         400
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             485
        ]
    ],
    'bubing_base_attack' => 1482.0,
    'qibing_base_attack' => 1630.20000000001,
    'gongbing_base_attack' => 1852.5,
    'fangshi_base_attack' => 1852.5,
    'bubing_base_defence' => 741.0,
    'qibing_base_defence' => 592.800000000004,
    'gongbing_base_defence' => 518.699999999997,
    'fangshi_base_defence' => 518.699999999997,
    'bubing_base_troops' => 7655.0,
    'qibing_base_troops' => 7655.0,
    'gongbing_base_troops' => 5680.0,
    'fangshi_base_troops' => 5680.0
};
get(397)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         401
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             486
        ]
    ],
    'bubing_base_attack' => 1486.0,
    'qibing_base_attack' => 1634.60000000001,
    'gongbing_base_attack' => 1857.5,
    'fangshi_base_attack' => 1857.5,
    'bubing_base_defence' => 743.0,
    'qibing_base_defence' => 594.400000000004,
    'gongbing_base_defence' => 520.099999999997,
    'fangshi_base_defence' => 520.099999999997,
    'bubing_base_troops' => 7675.0,
    'qibing_base_troops' => 7675.0,
    'gongbing_base_troops' => 5695.0,
    'fangshi_base_troops' => 5695.0
};
get(398)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         402
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             487
        ]
    ],
    'bubing_base_attack' => 1490.0,
    'qibing_base_attack' => 1639.00000000001,
    'gongbing_base_attack' => 1862.5,
    'fangshi_base_attack' => 1862.5,
    'bubing_base_defence' => 745.0,
    'qibing_base_defence' => 596.000000000004,
    'gongbing_base_defence' => 521.499999999996,
    'fangshi_base_defence' => 521.499999999996,
    'bubing_base_troops' => 7695.0,
    'qibing_base_troops' => 7695.0,
    'gongbing_base_troops' => 5710.0,
    'fangshi_base_troops' => 5710.0
};
get(399)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         403
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             488
        ]
    ],
    'bubing_base_attack' => 1494.0,
    'qibing_base_attack' => 1643.40000000001,
    'gongbing_base_attack' => 1867.5,
    'fangshi_base_attack' => 1867.5,
    'bubing_base_defence' => 747.0,
    'qibing_base_defence' => 597.600000000004,
    'gongbing_base_defence' => 522.899999999996,
    'fangshi_base_defence' => 522.899999999996,
    'bubing_base_troops' => 7715.0,
    'qibing_base_troops' => 7715.0,
    'gongbing_base_troops' => 5725.0,
    'fangshi_base_troops' => 5725.0
};
get(400)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         404
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             489
        ]
    ],
    'bubing_base_attack' => 1498.0,
    'qibing_base_attack' => 1647.80000000001,
    'gongbing_base_attack' => 1872.5,
    'fangshi_base_attack' => 1872.5,
    'bubing_base_defence' => 749.0,
    'qibing_base_defence' => 599.200000000004,
    'gongbing_base_defence' => 524.299999999996,
    'fangshi_base_defence' => 524.299999999996,
    'bubing_base_troops' => 7735.0,
    'qibing_base_troops' => 7735.0,
    'gongbing_base_troops' => 5740.0,
    'fangshi_base_troops' => 5740.0
};
get(401)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         405
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             490
        ]
    ],
    'bubing_base_attack' => 1502.0,
    'qibing_base_attack' => 1652.20000000001,
    'gongbing_base_attack' => 1877.5,
    'fangshi_base_attack' => 1877.5,
    'bubing_base_defence' => 751.0,
    'qibing_base_defence' => 600.800000000004,
    'gongbing_base_defence' => 525.699999999996,
    'fangshi_base_defence' => 525.699999999996,
    'bubing_base_troops' => 7755.0,
    'qibing_base_troops' => 7755.0,
    'gongbing_base_troops' => 5755.0,
    'fangshi_base_troops' => 5755.0
};
get(402)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         406
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             491
        ]
    ],
    'bubing_base_attack' => 1506.0,
    'qibing_base_attack' => 1656.60000000001,
    'gongbing_base_attack' => 1882.5,
    'fangshi_base_attack' => 1882.5,
    'bubing_base_defence' => 753.0,
    'qibing_base_defence' => 602.400000000004,
    'gongbing_base_defence' => 527.099999999996,
    'fangshi_base_defence' => 527.099999999996,
    'bubing_base_troops' => 7775.0,
    'qibing_base_troops' => 7775.0,
    'gongbing_base_troops' => 5770.0,
    'fangshi_base_troops' => 5770.0
};
get(403)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         407
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             492
        ]
    ],
    'bubing_base_attack' => 1510.0,
    'qibing_base_attack' => 1661.00000000001,
    'gongbing_base_attack' => 1887.5,
    'fangshi_base_attack' => 1887.5,
    'bubing_base_defence' => 755.0,
    'qibing_base_defence' => 604.000000000004,
    'gongbing_base_defence' => 528.499999999996,
    'fangshi_base_defence' => 528.499999999996,
    'bubing_base_troops' => 7795.0,
    'qibing_base_troops' => 7795.0,
    'gongbing_base_troops' => 5785.0,
    'fangshi_base_troops' => 5785.0
};
get(404)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         408
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             493
        ]
    ],
    'bubing_base_attack' => 1514.0,
    'qibing_base_attack' => 1665.40000000001,
    'gongbing_base_attack' => 1892.5,
    'fangshi_base_attack' => 1892.5,
    'bubing_base_defence' => 757.0,
    'qibing_base_defence' => 605.600000000004,
    'gongbing_base_defence' => 529.899999999996,
    'fangshi_base_defence' => 529.899999999996,
    'bubing_base_troops' => 7815.0,
    'qibing_base_troops' => 7815.0,
    'gongbing_base_troops' => 5800.0,
    'fangshi_base_troops' => 5800.0
};
get(405)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         409
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             494
        ]
    ],
    'bubing_base_attack' => 1518.0,
    'qibing_base_attack' => 1669.80000000001,
    'gongbing_base_attack' => 1897.5,
    'fangshi_base_attack' => 1897.5,
    'bubing_base_defence' => 759.0,
    'qibing_base_defence' => 607.200000000004,
    'gongbing_base_defence' => 531.299999999996,
    'fangshi_base_defence' => 531.299999999996,
    'bubing_base_troops' => 7835.0,
    'qibing_base_troops' => 7835.0,
    'gongbing_base_troops' => 5815.0,
    'fangshi_base_troops' => 5815.0
};
get(406)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         410
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             495
        ]
    ],
    'bubing_base_attack' => 1522.0,
    'qibing_base_attack' => 1674.20000000001,
    'gongbing_base_attack' => 1902.5,
    'fangshi_base_attack' => 1902.5,
    'bubing_base_defence' => 761.0,
    'qibing_base_defence' => 608.800000000004,
    'gongbing_base_defence' => 532.699999999996,
    'fangshi_base_defence' => 532.699999999996,
    'bubing_base_troops' => 7855.0,
    'qibing_base_troops' => 7855.0,
    'gongbing_base_troops' => 5830.0,
    'fangshi_base_troops' => 5830.0
};
get(407)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         411
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             496
        ]
    ],
    'bubing_base_attack' => 1526.0,
    'qibing_base_attack' => 1678.60000000001,
    'gongbing_base_attack' => 1907.5,
    'fangshi_base_attack' => 1907.5,
    'bubing_base_defence' => 763.0,
    'qibing_base_defence' => 610.400000000004,
    'gongbing_base_defence' => 534.099999999996,
    'fangshi_base_defence' => 534.099999999996,
    'bubing_base_troops' => 7875.0,
    'qibing_base_troops' => 7875.0,
    'gongbing_base_troops' => 5845.0,
    'fangshi_base_troops' => 5845.0
};
get(408)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         412
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             497
        ]
    ],
    'bubing_base_attack' => 1530.0,
    'qibing_base_attack' => 1683.00000000001,
    'gongbing_base_attack' => 1912.5,
    'fangshi_base_attack' => 1912.5,
    'bubing_base_defence' => 765.0,
    'qibing_base_defence' => 612.000000000004,
    'gongbing_base_defence' => 535.499999999996,
    'fangshi_base_defence' => 535.499999999996,
    'bubing_base_troops' => 7895.0,
    'qibing_base_troops' => 7895.0,
    'gongbing_base_troops' => 5860.0,
    'fangshi_base_troops' => 5860.0
};
get(409)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         413
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             498
        ]
    ],
    'bubing_base_attack' => 1534.0,
    'qibing_base_attack' => 1687.40000000001,
    'gongbing_base_attack' => 1917.5,
    'fangshi_base_attack' => 1917.5,
    'bubing_base_defence' => 767.0,
    'qibing_base_defence' => 613.600000000004,
    'gongbing_base_defence' => 536.899999999996,
    'fangshi_base_defence' => 536.899999999996,
    'bubing_base_troops' => 7915.0,
    'qibing_base_troops' => 7915.0,
    'gongbing_base_troops' => 5875.0,
    'fangshi_base_troops' => 5875.0
};
get(410)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         414
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             499
        ]
    ],
    'bubing_base_attack' => 1538.0,
    'qibing_base_attack' => 1691.80000000001,
    'gongbing_base_attack' => 1922.5,
    'fangshi_base_attack' => 1922.5,
    'bubing_base_defence' => 769.0,
    'qibing_base_defence' => 615.200000000004,
    'gongbing_base_defence' => 538.299999999996,
    'fangshi_base_defence' => 538.299999999996,
    'bubing_base_troops' => 7935.0,
    'qibing_base_troops' => 7935.0,
    'gongbing_base_troops' => 5890.0,
    'fangshi_base_troops' => 5890.0
};
get(411)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         415
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             500
        ]
    ],
    'bubing_base_attack' => 1542.0,
    'qibing_base_attack' => 1696.20000000001,
    'gongbing_base_attack' => 1927.5,
    'fangshi_base_attack' => 1927.5,
    'bubing_base_defence' => 771.0,
    'qibing_base_defence' => 616.800000000005,
    'gongbing_base_defence' => 539.699999999996,
    'fangshi_base_defence' => 539.699999999996,
    'bubing_base_troops' => 7955.0,
    'qibing_base_troops' => 7955.0,
    'gongbing_base_troops' => 5905.0,
    'fangshi_base_troops' => 5905.0
};
get(412)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         416
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             501
        ]
    ],
    'bubing_base_attack' => 1546.0,
    'qibing_base_attack' => 1700.60000000001,
    'gongbing_base_attack' => 1932.5,
    'fangshi_base_attack' => 1932.5,
    'bubing_base_defence' => 773.0,
    'qibing_base_defence' => 618.400000000005,
    'gongbing_base_defence' => 541.099999999996,
    'fangshi_base_defence' => 541.099999999996,
    'bubing_base_troops' => 7975.0,
    'qibing_base_troops' => 7975.0,
    'gongbing_base_troops' => 5920.0,
    'fangshi_base_troops' => 5920.0
};
get(413)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         417
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             502
        ]
    ],
    'bubing_base_attack' => 1550.0,
    'qibing_base_attack' => 1705.00000000001,
    'gongbing_base_attack' => 1937.5,
    'fangshi_base_attack' => 1937.5,
    'bubing_base_defence' => 775.0,
    'qibing_base_defence' => 620.000000000005,
    'gongbing_base_defence' => 542.499999999996,
    'fangshi_base_defence' => 542.499999999996,
    'bubing_base_troops' => 7995.0,
    'qibing_base_troops' => 7995.0,
    'gongbing_base_troops' => 5935.0,
    'fangshi_base_troops' => 5935.0
};
get(414)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         418
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             503
        ]
    ],
    'bubing_base_attack' => 1554.0,
    'qibing_base_attack' => 1709.40000000001,
    'gongbing_base_attack' => 1942.5,
    'fangshi_base_attack' => 1942.5,
    'bubing_base_defence' => 777.0,
    'qibing_base_defence' => 621.600000000005,
    'gongbing_base_defence' => 543.899999999996,
    'fangshi_base_defence' => 543.899999999996,
    'bubing_base_troops' => 8015.0,
    'qibing_base_troops' => 8015.0,
    'gongbing_base_troops' => 5950.0,
    'fangshi_base_troops' => 5950.0
};
get(415)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         419
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             504
        ]
    ],
    'bubing_base_attack' => 1558.0,
    'qibing_base_attack' => 1713.80000000001,
    'gongbing_base_attack' => 1947.5,
    'fangshi_base_attack' => 1947.5,
    'bubing_base_defence' => 779.0,
    'qibing_base_defence' => 623.200000000005,
    'gongbing_base_defence' => 545.299999999996,
    'fangshi_base_defence' => 545.299999999996,
    'bubing_base_troops' => 8035.0,
    'qibing_base_troops' => 8035.0,
    'gongbing_base_troops' => 5965.0,
    'fangshi_base_troops' => 5965.0
};
get(416)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         420
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             505
        ]
    ],
    'bubing_base_attack' => 1562.0,
    'qibing_base_attack' => 1718.20000000001,
    'gongbing_base_attack' => 1952.5,
    'fangshi_base_attack' => 1952.5,
    'bubing_base_defence' => 781.0,
    'qibing_base_defence' => 624.800000000005,
    'gongbing_base_defence' => 546.699999999996,
    'fangshi_base_defence' => 546.699999999996,
    'bubing_base_troops' => 8055.0,
    'qibing_base_troops' => 8055.0,
    'gongbing_base_troops' => 5980.0,
    'fangshi_base_troops' => 5980.0
};
get(417)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         421
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             506
        ]
    ],
    'bubing_base_attack' => 1566.0,
    'qibing_base_attack' => 1722.60000000001,
    'gongbing_base_attack' => 1957.5,
    'fangshi_base_attack' => 1957.5,
    'bubing_base_defence' => 783.0,
    'qibing_base_defence' => 626.400000000005,
    'gongbing_base_defence' => 548.099999999996,
    'fangshi_base_defence' => 548.099999999996,
    'bubing_base_troops' => 8075.0,
    'qibing_base_troops' => 8075.0,
    'gongbing_base_troops' => 5995.0,
    'fangshi_base_troops' => 5995.0
};
get(418)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         422
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             507
        ]
    ],
    'bubing_base_attack' => 1570.0,
    'qibing_base_attack' => 1727.00000000001,
    'gongbing_base_attack' => 1962.5,
    'fangshi_base_attack' => 1962.5,
    'bubing_base_defence' => 785.0,
    'qibing_base_defence' => 628.000000000005,
    'gongbing_base_defence' => 549.499999999996,
    'fangshi_base_defence' => 549.499999999996,
    'bubing_base_troops' => 8095.0,
    'qibing_base_troops' => 8095.0,
    'gongbing_base_troops' => 6010.0,
    'fangshi_base_troops' => 6010.0
};
get(419)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         423
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             508
        ]
    ],
    'bubing_base_attack' => 1574.0,
    'qibing_base_attack' => 1731.40000000001,
    'gongbing_base_attack' => 1967.5,
    'fangshi_base_attack' => 1967.5,
    'bubing_base_defence' => 787.0,
    'qibing_base_defence' => 629.600000000005,
    'gongbing_base_defence' => 550.899999999996,
    'fangshi_base_defence' => 550.899999999996,
    'bubing_base_troops' => 8115.0,
    'qibing_base_troops' => 8115.0,
    'gongbing_base_troops' => 6025.0,
    'fangshi_base_troops' => 6025.0
};
get(420)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         424
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             509
        ]
    ],
    'bubing_base_attack' => 1578.0,
    'qibing_base_attack' => 1735.80000000001,
    'gongbing_base_attack' => 1972.5,
    'fangshi_base_attack' => 1972.5,
    'bubing_base_defence' => 789.0,
    'qibing_base_defence' => 631.200000000005,
    'gongbing_base_defence' => 552.299999999996,
    'fangshi_base_defence' => 552.299999999996,
    'bubing_base_troops' => 8135.0,
    'qibing_base_troops' => 8135.0,
    'gongbing_base_troops' => 6040.0,
    'fangshi_base_troops' => 6040.0
};
get(421)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         425
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             510
        ]
    ],
    'bubing_base_attack' => 1582.0,
    'qibing_base_attack' => 1740.20000000001,
    'gongbing_base_attack' => 1977.5,
    'fangshi_base_attack' => 1977.5,
    'bubing_base_defence' => 791.0,
    'qibing_base_defence' => 632.800000000005,
    'gongbing_base_defence' => 553.699999999996,
    'fangshi_base_defence' => 553.699999999996,
    'bubing_base_troops' => 8155.0,
    'qibing_base_troops' => 8155.0,
    'gongbing_base_troops' => 6055.0,
    'fangshi_base_troops' => 6055.0
};
get(422)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         426
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             511
        ]
    ],
    'bubing_base_attack' => 1586.0,
    'qibing_base_attack' => 1744.60000000001,
    'gongbing_base_attack' => 1982.5,
    'fangshi_base_attack' => 1982.5,
    'bubing_base_defence' => 793.0,
    'qibing_base_defence' => 634.400000000005,
    'gongbing_base_defence' => 555.099999999996,
    'fangshi_base_defence' => 555.099999999996,
    'bubing_base_troops' => 8175.0,
    'qibing_base_troops' => 8175.0,
    'gongbing_base_troops' => 6070.0,
    'fangshi_base_troops' => 6070.0
};
get(423)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         427
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             512
        ]
    ],
    'bubing_base_attack' => 1590.0,
    'qibing_base_attack' => 1749.00000000001,
    'gongbing_base_attack' => 1987.5,
    'fangshi_base_attack' => 1987.5,
    'bubing_base_defence' => 795.0,
    'qibing_base_defence' => 636.000000000005,
    'gongbing_base_defence' => 556.499999999996,
    'fangshi_base_defence' => 556.499999999996,
    'bubing_base_troops' => 8195.0,
    'qibing_base_troops' => 8195.0,
    'gongbing_base_troops' => 6085.0,
    'fangshi_base_troops' => 6085.0
};
get(424)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         428
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             513
        ]
    ],
    'bubing_base_attack' => 1594.0,
    'qibing_base_attack' => 1753.40000000001,
    'gongbing_base_attack' => 1992.5,
    'fangshi_base_attack' => 1992.5,
    'bubing_base_defence' => 797.0,
    'qibing_base_defence' => 637.600000000005,
    'gongbing_base_defence' => 557.899999999996,
    'fangshi_base_defence' => 557.899999999996,
    'bubing_base_troops' => 8215.0,
    'qibing_base_troops' => 8215.0,
    'gongbing_base_troops' => 6100.0,
    'fangshi_base_troops' => 6100.0
};
get(425)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         429
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             514
        ]
    ],
    'bubing_base_attack' => 1598.0,
    'qibing_base_attack' => 1757.80000000001,
    'gongbing_base_attack' => 1997.5,
    'fangshi_base_attack' => 1997.5,
    'bubing_base_defence' => 799.0,
    'qibing_base_defence' => 639.200000000005,
    'gongbing_base_defence' => 559.299999999996,
    'fangshi_base_defence' => 559.299999999996,
    'bubing_base_troops' => 8235.0,
    'qibing_base_troops' => 8235.0,
    'gongbing_base_troops' => 6115.0,
    'fangshi_base_troops' => 6115.0
};
get(426)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         430
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             515
        ]
    ],
    'bubing_base_attack' => 1602.0,
    'qibing_base_attack' => 1762.20000000001,
    'gongbing_base_attack' => 2002.5,
    'fangshi_base_attack' => 2002.5,
    'bubing_base_defence' => 801.0,
    'qibing_base_defence' => 640.800000000005,
    'gongbing_base_defence' => 560.699999999996,
    'fangshi_base_defence' => 560.699999999996,
    'bubing_base_troops' => 8255.0,
    'qibing_base_troops' => 8255.0,
    'gongbing_base_troops' => 6130.0,
    'fangshi_base_troops' => 6130.0
};
get(427)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         431
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             516
        ]
    ],
    'bubing_base_attack' => 1606.0,
    'qibing_base_attack' => 1766.60000000001,
    'gongbing_base_attack' => 2007.5,
    'fangshi_base_attack' => 2007.5,
    'bubing_base_defence' => 803.0,
    'qibing_base_defence' => 642.400000000005,
    'gongbing_base_defence' => 562.099999999996,
    'fangshi_base_defence' => 562.099999999996,
    'bubing_base_troops' => 8275.0,
    'qibing_base_troops' => 8275.0,
    'gongbing_base_troops' => 6145.0,
    'fangshi_base_troops' => 6145.0
};
get(428)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         432
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             517
        ]
    ],
    'bubing_base_attack' => 1610.0,
    'qibing_base_attack' => 1771.00000000001,
    'gongbing_base_attack' => 2012.5,
    'fangshi_base_attack' => 2012.5,
    'bubing_base_defence' => 805.0,
    'qibing_base_defence' => 644.000000000005,
    'gongbing_base_defence' => 563.499999999996,
    'fangshi_base_defence' => 563.499999999996,
    'bubing_base_troops' => 8295.0,
    'qibing_base_troops' => 8295.0,
    'gongbing_base_troops' => 6160.0,
    'fangshi_base_troops' => 6160.0
};
get(429)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         433
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             518
        ]
    ],
    'bubing_base_attack' => 1614.0,
    'qibing_base_attack' => 1775.40000000001,
    'gongbing_base_attack' => 2017.5,
    'fangshi_base_attack' => 2017.5,
    'bubing_base_defence' => 807.0,
    'qibing_base_defence' => 645.600000000005,
    'gongbing_base_defence' => 564.899999999996,
    'fangshi_base_defence' => 564.899999999996,
    'bubing_base_troops' => 8315.0,
    'qibing_base_troops' => 8315.0,
    'gongbing_base_troops' => 6175.0,
    'fangshi_base_troops' => 6175.0
};
get(430)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         434
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             519
        ]
    ],
    'bubing_base_attack' => 1618.0,
    'qibing_base_attack' => 1779.80000000001,
    'gongbing_base_attack' => 2022.5,
    'fangshi_base_attack' => 2022.5,
    'bubing_base_defence' => 809.0,
    'qibing_base_defence' => 647.200000000005,
    'gongbing_base_defence' => 566.299999999996,
    'fangshi_base_defence' => 566.299999999996,
    'bubing_base_troops' => 8335.0,
    'qibing_base_troops' => 8335.0,
    'gongbing_base_troops' => 6190.0,
    'fangshi_base_troops' => 6190.0
};
get(431)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         435
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             520
        ]
    ],
    'bubing_base_attack' => 1622.0,
    'qibing_base_attack' => 1784.20000000001,
    'gongbing_base_attack' => 2027.5,
    'fangshi_base_attack' => 2027.5,
    'bubing_base_defence' => 811.0,
    'qibing_base_defence' => 648.800000000005,
    'gongbing_base_defence' => 567.699999999996,
    'fangshi_base_defence' => 567.699999999996,
    'bubing_base_troops' => 8355.0,
    'qibing_base_troops' => 8355.0,
    'gongbing_base_troops' => 6205.0,
    'fangshi_base_troops' => 6205.0
};
get(432)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         436
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             521
        ]
    ],
    'bubing_base_attack' => 1626.0,
    'qibing_base_attack' => 1788.60000000001,
    'gongbing_base_attack' => 2032.5,
    'fangshi_base_attack' => 2032.5,
    'bubing_base_defence' => 813.0,
    'qibing_base_defence' => 650.400000000005,
    'gongbing_base_defence' => 569.099999999996,
    'fangshi_base_defence' => 569.099999999996,
    'bubing_base_troops' => 8375.0,
    'qibing_base_troops' => 8375.0,
    'gongbing_base_troops' => 6220.0,
    'fangshi_base_troops' => 6220.0
};
get(433)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         437
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             522
        ]
    ],
    'bubing_base_attack' => 1630.0,
    'qibing_base_attack' => 1793.00000000001,
    'gongbing_base_attack' => 2037.5,
    'fangshi_base_attack' => 2037.5,
    'bubing_base_defence' => 815.0,
    'qibing_base_defence' => 652.000000000005,
    'gongbing_base_defence' => 570.499999999996,
    'fangshi_base_defence' => 570.499999999996,
    'bubing_base_troops' => 8395.0,
    'qibing_base_troops' => 8395.0,
    'gongbing_base_troops' => 6235.0,
    'fangshi_base_troops' => 6235.0
};
get(434)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         438
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             523
        ]
    ],
    'bubing_base_attack' => 1634.0,
    'qibing_base_attack' => 1797.40000000001,
    'gongbing_base_attack' => 2042.5,
    'fangshi_base_attack' => 2042.5,
    'bubing_base_defence' => 817.0,
    'qibing_base_defence' => 653.600000000005,
    'gongbing_base_defence' => 571.899999999996,
    'fangshi_base_defence' => 571.899999999996,
    'bubing_base_troops' => 8415.0,
    'qibing_base_troops' => 8415.0,
    'gongbing_base_troops' => 6250.0,
    'fangshi_base_troops' => 6250.0
};
get(435)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         439
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             524
        ]
    ],
    'bubing_base_attack' => 1638.0,
    'qibing_base_attack' => 1801.80000000001,
    'gongbing_base_attack' => 2047.5,
    'fangshi_base_attack' => 2047.5,
    'bubing_base_defence' => 819.0,
    'qibing_base_defence' => 655.200000000005,
    'gongbing_base_defence' => 573.299999999996,
    'fangshi_base_defence' => 573.299999999996,
    'bubing_base_troops' => 8435.0,
    'qibing_base_troops' => 8435.0,
    'gongbing_base_troops' => 6265.0,
    'fangshi_base_troops' => 6265.0
};
get(436)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         440
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             525
        ]
    ],
    'bubing_base_attack' => 1642.0,
    'qibing_base_attack' => 1806.20000000001,
    'gongbing_base_attack' => 2052.5,
    'fangshi_base_attack' => 2052.5,
    'bubing_base_defence' => 821.0,
    'qibing_base_defence' => 656.800000000005,
    'gongbing_base_defence' => 574.699999999996,
    'fangshi_base_defence' => 574.699999999996,
    'bubing_base_troops' => 8455.0,
    'qibing_base_troops' => 8455.0,
    'gongbing_base_troops' => 6280.0,
    'fangshi_base_troops' => 6280.0
};
get(437)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         441
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             526
        ]
    ],
    'bubing_base_attack' => 1646.0,
    'qibing_base_attack' => 1810.60000000001,
    'gongbing_base_attack' => 2057.5,
    'fangshi_base_attack' => 2057.5,
    'bubing_base_defence' => 823.0,
    'qibing_base_defence' => 658.400000000005,
    'gongbing_base_defence' => 576.099999999996,
    'fangshi_base_defence' => 576.099999999996,
    'bubing_base_troops' => 8475.0,
    'qibing_base_troops' => 8475.0,
    'gongbing_base_troops' => 6295.0,
    'fangshi_base_troops' => 6295.0
};
get(438)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         442
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             527
        ]
    ],
    'bubing_base_attack' => 1650.0,
    'qibing_base_attack' => 1815.00000000001,
    'gongbing_base_attack' => 2062.5,
    'fangshi_base_attack' => 2062.5,
    'bubing_base_defence' => 825.0,
    'qibing_base_defence' => 660.000000000005,
    'gongbing_base_defence' => 577.499999999996,
    'fangshi_base_defence' => 577.499999999996,
    'bubing_base_troops' => 8495.0,
    'qibing_base_troops' => 8495.0,
    'gongbing_base_troops' => 6310.0,
    'fangshi_base_troops' => 6310.0
};
get(439)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         443
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             528
        ]
    ],
    'bubing_base_attack' => 1654.0,
    'qibing_base_attack' => 1819.40000000001,
    'gongbing_base_attack' => 2067.5,
    'fangshi_base_attack' => 2067.5,
    'bubing_base_defence' => 827.0,
    'qibing_base_defence' => 661.600000000005,
    'gongbing_base_defence' => 578.899999999996,
    'fangshi_base_defence' => 578.899999999996,
    'bubing_base_troops' => 8515.0,
    'qibing_base_troops' => 8515.0,
    'gongbing_base_troops' => 6325.0,
    'fangshi_base_troops' => 6325.0
};
get(440)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         444
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             529
        ]
    ],
    'bubing_base_attack' => 1658.0,
    'qibing_base_attack' => 1823.80000000001,
    'gongbing_base_attack' => 2072.5,
    'fangshi_base_attack' => 2072.5,
    'bubing_base_defence' => 829.0,
    'qibing_base_defence' => 663.200000000005,
    'gongbing_base_defence' => 580.299999999996,
    'fangshi_base_defence' => 580.299999999996,
    'bubing_base_troops' => 8535.0,
    'qibing_base_troops' => 8535.0,
    'gongbing_base_troops' => 6340.0,
    'fangshi_base_troops' => 6340.0
};
get(441)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         445
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             530
        ]
    ],
    'bubing_base_attack' => 1662.0,
    'qibing_base_attack' => 1828.20000000001,
    'gongbing_base_attack' => 2077.5,
    'fangshi_base_attack' => 2077.5,
    'bubing_base_defence' => 831.0,
    'qibing_base_defence' => 664.800000000005,
    'gongbing_base_defence' => 581.699999999996,
    'fangshi_base_defence' => 581.699999999996,
    'bubing_base_troops' => 8555.0,
    'qibing_base_troops' => 8555.0,
    'gongbing_base_troops' => 6355.0,
    'fangshi_base_troops' => 6355.0
};
get(442)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         446
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             531
        ]
    ],
    'bubing_base_attack' => 1666.0,
    'qibing_base_attack' => 1832.60000000001,
    'gongbing_base_attack' => 2082.5,
    'fangshi_base_attack' => 2082.5,
    'bubing_base_defence' => 833.0,
    'qibing_base_defence' => 666.400000000005,
    'gongbing_base_defence' => 583.099999999995,
    'fangshi_base_defence' => 583.099999999995,
    'bubing_base_troops' => 8575.0,
    'qibing_base_troops' => 8575.0,
    'gongbing_base_troops' => 6370.0,
    'fangshi_base_troops' => 6370.0
};
get(443)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         447
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             532
        ]
    ],
    'bubing_base_attack' => 1670.0,
    'qibing_base_attack' => 1837.00000000001,
    'gongbing_base_attack' => 2087.5,
    'fangshi_base_attack' => 2087.5,
    'bubing_base_defence' => 835.0,
    'qibing_base_defence' => 668.000000000005,
    'gongbing_base_defence' => 584.499999999995,
    'fangshi_base_defence' => 584.499999999995,
    'bubing_base_troops' => 8595.0,
    'qibing_base_troops' => 8595.0,
    'gongbing_base_troops' => 6385.0,
    'fangshi_base_troops' => 6385.0
};
get(444)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         448
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             533
        ]
    ],
    'bubing_base_attack' => 1674.0,
    'qibing_base_attack' => 1841.40000000001,
    'gongbing_base_attack' => 2092.5,
    'fangshi_base_attack' => 2092.5,
    'bubing_base_defence' => 837.0,
    'qibing_base_defence' => 669.600000000005,
    'gongbing_base_defence' => 585.899999999995,
    'fangshi_base_defence' => 585.899999999995,
    'bubing_base_troops' => 8615.0,
    'qibing_base_troops' => 8615.0,
    'gongbing_base_troops' => 6400.0,
    'fangshi_base_troops' => 6400.0
};
get(445)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         449
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             534
        ]
    ],
    'bubing_base_attack' => 1678.0,
    'qibing_base_attack' => 1845.80000000001,
    'gongbing_base_attack' => 2097.5,
    'fangshi_base_attack' => 2097.5,
    'bubing_base_defence' => 839.0,
    'qibing_base_defence' => 671.200000000005,
    'gongbing_base_defence' => 587.299999999995,
    'fangshi_base_defence' => 587.299999999995,
    'bubing_base_troops' => 8635.0,
    'qibing_base_troops' => 8635.0,
    'gongbing_base_troops' => 6415.0,
    'fangshi_base_troops' => 6415.0
};
get(446)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         450
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             535
        ]
    ],
    'bubing_base_attack' => 1682.0,
    'qibing_base_attack' => 1850.20000000001,
    'gongbing_base_attack' => 2102.5,
    'fangshi_base_attack' => 2102.5,
    'bubing_base_defence' => 841.0,
    'qibing_base_defence' => 672.800000000005,
    'gongbing_base_defence' => 588.699999999995,
    'fangshi_base_defence' => 588.699999999995,
    'bubing_base_troops' => 8655.0,
    'qibing_base_troops' => 8655.0,
    'gongbing_base_troops' => 6430.0,
    'fangshi_base_troops' => 6430.0
};
get(447)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         451
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             536
        ]
    ],
    'bubing_base_attack' => 1686.0,
    'qibing_base_attack' => 1854.60000000001,
    'gongbing_base_attack' => 2107.5,
    'fangshi_base_attack' => 2107.5,
    'bubing_base_defence' => 843.0,
    'qibing_base_defence' => 674.400000000005,
    'gongbing_base_defence' => 590.099999999995,
    'fangshi_base_defence' => 590.099999999995,
    'bubing_base_troops' => 8675.0,
    'qibing_base_troops' => 8675.0,
    'gongbing_base_troops' => 6445.0,
    'fangshi_base_troops' => 6445.0
};
get(448)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         452
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             537
        ]
    ],
    'bubing_base_attack' => 1690.0,
    'qibing_base_attack' => 1859.00000000001,
    'gongbing_base_attack' => 2112.5,
    'fangshi_base_attack' => 2112.5,
    'bubing_base_defence' => 845.0,
    'qibing_base_defence' => 676.000000000005,
    'gongbing_base_defence' => 591.499999999995,
    'fangshi_base_defence' => 591.499999999995,
    'bubing_base_troops' => 8695.0,
    'qibing_base_troops' => 8695.0,
    'gongbing_base_troops' => 6460.0,
    'fangshi_base_troops' => 6460.0
};
get(449)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         453
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             538
        ]
    ],
    'bubing_base_attack' => 1694.0,
    'qibing_base_attack' => 1863.40000000001,
    'gongbing_base_attack' => 2117.5,
    'fangshi_base_attack' => 2117.5,
    'bubing_base_defence' => 847.0,
    'qibing_base_defence' => 677.600000000005,
    'gongbing_base_defence' => 592.899999999995,
    'fangshi_base_defence' => 592.899999999995,
    'bubing_base_troops' => 8715.0,
    'qibing_base_troops' => 8715.0,
    'gongbing_base_troops' => 6475.0,
    'fangshi_base_troops' => 6475.0
};
get(450)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         454
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             539
        ]
    ],
    'bubing_base_attack' => 1698.0,
    'qibing_base_attack' => 1867.80000000001,
    'gongbing_base_attack' => 2122.5,
    'fangshi_base_attack' => 2122.5,
    'bubing_base_defence' => 849.0,
    'qibing_base_defence' => 679.200000000005,
    'gongbing_base_defence' => 594.299999999995,
    'fangshi_base_defence' => 594.299999999995,
    'bubing_base_troops' => 8735.0,
    'qibing_base_troops' => 8735.0,
    'gongbing_base_troops' => 6490.0,
    'fangshi_base_troops' => 6490.0
};
get(451)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         455
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             540
        ]
    ],
    'bubing_base_attack' => 1702.0,
    'qibing_base_attack' => 1872.20000000001,
    'gongbing_base_attack' => 2127.5,
    'fangshi_base_attack' => 2127.5,
    'bubing_base_defence' => 851.0,
    'qibing_base_defence' => 680.800000000005,
    'gongbing_base_defence' => 595.699999999995,
    'fangshi_base_defence' => 595.699999999995,
    'bubing_base_troops' => 8755.0,
    'qibing_base_troops' => 8755.0,
    'gongbing_base_troops' => 6505.0,
    'fangshi_base_troops' => 6505.0
};
get(452)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         456
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             541
        ]
    ],
    'bubing_base_attack' => 1706.0,
    'qibing_base_attack' => 1876.60000000001,
    'gongbing_base_attack' => 2132.5,
    'fangshi_base_attack' => 2132.5,
    'bubing_base_defence' => 853.0,
    'qibing_base_defence' => 682.400000000005,
    'gongbing_base_defence' => 597.099999999995,
    'fangshi_base_defence' => 597.099999999995,
    'bubing_base_troops' => 8775.0,
    'qibing_base_troops' => 8775.0,
    'gongbing_base_troops' => 6520.0,
    'fangshi_base_troops' => 6520.0
};
get(453)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         457
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             542
        ]
    ],
    'bubing_base_attack' => 1710.0,
    'qibing_base_attack' => 1881.00000000001,
    'gongbing_base_attack' => 2137.5,
    'fangshi_base_attack' => 2137.5,
    'bubing_base_defence' => 855.0,
    'qibing_base_defence' => 684.000000000005,
    'gongbing_base_defence' => 598.499999999995,
    'fangshi_base_defence' => 598.499999999995,
    'bubing_base_troops' => 8795.0,
    'qibing_base_troops' => 8795.0,
    'gongbing_base_troops' => 6535.0,
    'fangshi_base_troops' => 6535.0
};
get(454)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         458
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             543
        ]
    ],
    'bubing_base_attack' => 1714.0,
    'qibing_base_attack' => 1885.40000000001,
    'gongbing_base_attack' => 2142.5,
    'fangshi_base_attack' => 2142.5,
    'bubing_base_defence' => 857.0,
    'qibing_base_defence' => 685.600000000005,
    'gongbing_base_defence' => 599.899999999995,
    'fangshi_base_defence' => 599.899999999995,
    'bubing_base_troops' => 8815.0,
    'qibing_base_troops' => 8815.0,
    'gongbing_base_troops' => 6550.0,
    'fangshi_base_troops' => 6550.0
};
get(455)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         459
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             544
        ]
    ],
    'bubing_base_attack' => 1718.0,
    'qibing_base_attack' => 1889.80000000001,
    'gongbing_base_attack' => 2147.5,
    'fangshi_base_attack' => 2147.5,
    'bubing_base_defence' => 859.0,
    'qibing_base_defence' => 687.200000000006,
    'gongbing_base_defence' => 601.299999999995,
    'fangshi_base_defence' => 601.299999999995,
    'bubing_base_troops' => 8835.0,
    'qibing_base_troops' => 8835.0,
    'gongbing_base_troops' => 6565.0,
    'fangshi_base_troops' => 6565.0
};
get(456)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         460
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             545
        ]
    ],
    'bubing_base_attack' => 1722.0,
    'qibing_base_attack' => 1894.20000000001,
    'gongbing_base_attack' => 2152.5,
    'fangshi_base_attack' => 2152.5,
    'bubing_base_defence' => 861.0,
    'qibing_base_defence' => 688.800000000006,
    'gongbing_base_defence' => 602.699999999995,
    'fangshi_base_defence' => 602.699999999995,
    'bubing_base_troops' => 8855.0,
    'qibing_base_troops' => 8855.0,
    'gongbing_base_troops' => 6580.0,
    'fangshi_base_troops' => 6580.0
};
get(457)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         461
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             546
        ]
    ],
    'bubing_base_attack' => 1726.0,
    'qibing_base_attack' => 1898.60000000001,
    'gongbing_base_attack' => 2157.5,
    'fangshi_base_attack' => 2157.5,
    'bubing_base_defence' => 863.0,
    'qibing_base_defence' => 690.400000000006,
    'gongbing_base_defence' => 604.099999999995,
    'fangshi_base_defence' => 604.099999999995,
    'bubing_base_troops' => 8875.0,
    'qibing_base_troops' => 8875.0,
    'gongbing_base_troops' => 6595.0,
    'fangshi_base_troops' => 6595.0
};
get(458)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         462
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             547
        ]
    ],
    'bubing_base_attack' => 1730.0,
    'qibing_base_attack' => 1903.00000000001,
    'gongbing_base_attack' => 2162.5,
    'fangshi_base_attack' => 2162.5,
    'bubing_base_defence' => 865.0,
    'qibing_base_defence' => 692.000000000006,
    'gongbing_base_defence' => 605.499999999995,
    'fangshi_base_defence' => 605.499999999995,
    'bubing_base_troops' => 8895.0,
    'qibing_base_troops' => 8895.0,
    'gongbing_base_troops' => 6610.0,
    'fangshi_base_troops' => 6610.0
};
get(459)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         463
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             548
        ]
    ],
    'bubing_base_attack' => 1734.0,
    'qibing_base_attack' => 1907.40000000001,
    'gongbing_base_attack' => 2167.5,
    'fangshi_base_attack' => 2167.5,
    'bubing_base_defence' => 867.0,
    'qibing_base_defence' => 693.600000000006,
    'gongbing_base_defence' => 606.899999999995,
    'fangshi_base_defence' => 606.899999999995,
    'bubing_base_troops' => 8915.0,
    'qibing_base_troops' => 8915.0,
    'gongbing_base_troops' => 6625.0,
    'fangshi_base_troops' => 6625.0
};
get(460)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         464
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             549
        ]
    ],
    'bubing_base_attack' => 1738.0,
    'qibing_base_attack' => 1911.80000000001,
    'gongbing_base_attack' => 2172.5,
    'fangshi_base_attack' => 2172.5,
    'bubing_base_defence' => 869.0,
    'qibing_base_defence' => 695.200000000006,
    'gongbing_base_defence' => 608.299999999995,
    'fangshi_base_defence' => 608.299999999995,
    'bubing_base_troops' => 8935.0,
    'qibing_base_troops' => 8935.0,
    'gongbing_base_troops' => 6640.0,
    'fangshi_base_troops' => 6640.0
};
get(461)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         465
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             550
        ]
    ],
    'bubing_base_attack' => 1742.0,
    'qibing_base_attack' => 1916.20000000001,
    'gongbing_base_attack' => 2177.5,
    'fangshi_base_attack' => 2177.5,
    'bubing_base_defence' => 871.0,
    'qibing_base_defence' => 696.800000000006,
    'gongbing_base_defence' => 609.699999999995,
    'fangshi_base_defence' => 609.699999999995,
    'bubing_base_troops' => 8955.0,
    'qibing_base_troops' => 8955.0,
    'gongbing_base_troops' => 6655.0,
    'fangshi_base_troops' => 6655.0
};
get(462)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         466
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             551
        ]
    ],
    'bubing_base_attack' => 1746.0,
    'qibing_base_attack' => 1920.60000000001,
    'gongbing_base_attack' => 2182.5,
    'fangshi_base_attack' => 2182.5,
    'bubing_base_defence' => 873.0,
    'qibing_base_defence' => 698.400000000006,
    'gongbing_base_defence' => 611.099999999995,
    'fangshi_base_defence' => 611.099999999995,
    'bubing_base_troops' => 8975.0,
    'qibing_base_troops' => 8975.0,
    'gongbing_base_troops' => 6670.0,
    'fangshi_base_troops' => 6670.0
};
get(463)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         467
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             552
        ]
    ],
    'bubing_base_attack' => 1750.0,
    'qibing_base_attack' => 1925.00000000001,
    'gongbing_base_attack' => 2187.5,
    'fangshi_base_attack' => 2187.5,
    'bubing_base_defence' => 875.0,
    'qibing_base_defence' => 700.000000000006,
    'gongbing_base_defence' => 612.499999999995,
    'fangshi_base_defence' => 612.499999999995,
    'bubing_base_troops' => 8995.0,
    'qibing_base_troops' => 8995.0,
    'gongbing_base_troops' => 6685.0,
    'fangshi_base_troops' => 6685.0
};
get(464)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         468
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             553
        ]
    ],
    'bubing_base_attack' => 1754.0,
    'qibing_base_attack' => 1929.40000000001,
    'gongbing_base_attack' => 2192.5,
    'fangshi_base_attack' => 2192.5,
    'bubing_base_defence' => 877.0,
    'qibing_base_defence' => 701.600000000006,
    'gongbing_base_defence' => 613.899999999995,
    'fangshi_base_defence' => 613.899999999995,
    'bubing_base_troops' => 9015.0,
    'qibing_base_troops' => 9015.0,
    'gongbing_base_troops' => 6700.0,
    'fangshi_base_troops' => 6700.0
};
get(465)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         469
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             554
        ]
    ],
    'bubing_base_attack' => 1758.0,
    'qibing_base_attack' => 1933.80000000001,
    'gongbing_base_attack' => 2197.5,
    'fangshi_base_attack' => 2197.5,
    'bubing_base_defence' => 879.0,
    'qibing_base_defence' => 703.200000000006,
    'gongbing_base_defence' => 615.299999999995,
    'fangshi_base_defence' => 615.299999999995,
    'bubing_base_troops' => 9035.0,
    'qibing_base_troops' => 9035.0,
    'gongbing_base_troops' => 6715.0,
    'fangshi_base_troops' => 6715.0
};
get(466)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         470
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             555
        ]
    ],
    'bubing_base_attack' => 1762.0,
    'qibing_base_attack' => 1938.20000000002,
    'gongbing_base_attack' => 2202.5,
    'fangshi_base_attack' => 2202.5,
    'bubing_base_defence' => 881.0,
    'qibing_base_defence' => 704.800000000006,
    'gongbing_base_defence' => 616.699999999995,
    'fangshi_base_defence' => 616.699999999995,
    'bubing_base_troops' => 9055.0,
    'qibing_base_troops' => 9055.0,
    'gongbing_base_troops' => 6730.0,
    'fangshi_base_troops' => 6730.0
};
get(467)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         471
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             556
        ]
    ],
    'bubing_base_attack' => 1766.0,
    'qibing_base_attack' => 1942.60000000002,
    'gongbing_base_attack' => 2207.5,
    'fangshi_base_attack' => 2207.5,
    'bubing_base_defence' => 883.0,
    'qibing_base_defence' => 706.400000000006,
    'gongbing_base_defence' => 618.099999999995,
    'fangshi_base_defence' => 618.099999999995,
    'bubing_base_troops' => 9075.0,
    'qibing_base_troops' => 9075.0,
    'gongbing_base_troops' => 6745.0,
    'fangshi_base_troops' => 6745.0
};
get(468)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         472
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             557
        ]
    ],
    'bubing_base_attack' => 1770.0,
    'qibing_base_attack' => 1947.00000000002,
    'gongbing_base_attack' => 2212.5,
    'fangshi_base_attack' => 2212.5,
    'bubing_base_defence' => 885.0,
    'qibing_base_defence' => 708.000000000006,
    'gongbing_base_defence' => 619.499999999995,
    'fangshi_base_defence' => 619.499999999995,
    'bubing_base_troops' => 9095.0,
    'qibing_base_troops' => 9095.0,
    'gongbing_base_troops' => 6760.0,
    'fangshi_base_troops' => 6760.0
};
get(469)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         473
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             558
        ]
    ],
    'bubing_base_attack' => 1774.0,
    'qibing_base_attack' => 1951.40000000002,
    'gongbing_base_attack' => 2217.5,
    'fangshi_base_attack' => 2217.5,
    'bubing_base_defence' => 887.0,
    'qibing_base_defence' => 709.600000000006,
    'gongbing_base_defence' => 620.899999999995,
    'fangshi_base_defence' => 620.899999999995,
    'bubing_base_troops' => 9115.0,
    'qibing_base_troops' => 9115.0,
    'gongbing_base_troops' => 6775.0,
    'fangshi_base_troops' => 6775.0
};
get(470)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         474
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             559
        ]
    ],
    'bubing_base_attack' => 1778.0,
    'qibing_base_attack' => 1955.80000000002,
    'gongbing_base_attack' => 2222.5,
    'fangshi_base_attack' => 2222.5,
    'bubing_base_defence' => 889.0,
    'qibing_base_defence' => 711.200000000006,
    'gongbing_base_defence' => 622.299999999995,
    'fangshi_base_defence' => 622.299999999995,
    'bubing_base_troops' => 9135.0,
    'qibing_base_troops' => 9135.0,
    'gongbing_base_troops' => 6790.0,
    'fangshi_base_troops' => 6790.0
};
get(471)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         475
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             560
        ]
    ],
    'bubing_base_attack' => 1782.0,
    'qibing_base_attack' => 1960.20000000002,
    'gongbing_base_attack' => 2227.5,
    'fangshi_base_attack' => 2227.5,
    'bubing_base_defence' => 891.0,
    'qibing_base_defence' => 712.800000000006,
    'gongbing_base_defence' => 623.699999999995,
    'fangshi_base_defence' => 623.699999999995,
    'bubing_base_troops' => 9155.0,
    'qibing_base_troops' => 9155.0,
    'gongbing_base_troops' => 6805.0,
    'fangshi_base_troops' => 6805.0
};
get(472)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         476
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             561
        ]
    ],
    'bubing_base_attack' => 1786.0,
    'qibing_base_attack' => 1964.60000000002,
    'gongbing_base_attack' => 2232.5,
    'fangshi_base_attack' => 2232.5,
    'bubing_base_defence' => 893.0,
    'qibing_base_defence' => 714.400000000006,
    'gongbing_base_defence' => 625.099999999995,
    'fangshi_base_defence' => 625.099999999995,
    'bubing_base_troops' => 9175.0,
    'qibing_base_troops' => 9175.0,
    'gongbing_base_troops' => 6820.0,
    'fangshi_base_troops' => 6820.0
};
get(473)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         477
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             562
        ]
    ],
    'bubing_base_attack' => 1790.0,
    'qibing_base_attack' => 1969.00000000002,
    'gongbing_base_attack' => 2237.5,
    'fangshi_base_attack' => 2237.5,
    'bubing_base_defence' => 895.0,
    'qibing_base_defence' => 716.000000000006,
    'gongbing_base_defence' => 626.499999999995,
    'fangshi_base_defence' => 626.499999999995,
    'bubing_base_troops' => 9195.0,
    'qibing_base_troops' => 9195.0,
    'gongbing_base_troops' => 6835.0,
    'fangshi_base_troops' => 6835.0
};
get(474)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         478
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             563
        ]
    ],
    'bubing_base_attack' => 1794.0,
    'qibing_base_attack' => 1973.40000000002,
    'gongbing_base_attack' => 2242.5,
    'fangshi_base_attack' => 2242.5,
    'bubing_base_defence' => 897.0,
    'qibing_base_defence' => 717.600000000006,
    'gongbing_base_defence' => 627.899999999995,
    'fangshi_base_defence' => 627.899999999995,
    'bubing_base_troops' => 9215.0,
    'qibing_base_troops' => 9215.0,
    'gongbing_base_troops' => 6850.0,
    'fangshi_base_troops' => 6850.0
};
get(475)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         479
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             564
        ]
    ],
    'bubing_base_attack' => 1798.0,
    'qibing_base_attack' => 1977.80000000002,
    'gongbing_base_attack' => 2247.5,
    'fangshi_base_attack' => 2247.5,
    'bubing_base_defence' => 899.0,
    'qibing_base_defence' => 719.200000000006,
    'gongbing_base_defence' => 629.299999999995,
    'fangshi_base_defence' => 629.299999999995,
    'bubing_base_troops' => 9235.0,
    'qibing_base_troops' => 9235.0,
    'gongbing_base_troops' => 6865.0,
    'fangshi_base_troops' => 6865.0
};
get(476)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         480
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             565
        ]
    ],
    'bubing_base_attack' => 1802.0,
    'qibing_base_attack' => 1982.20000000002,
    'gongbing_base_attack' => 2252.5,
    'fangshi_base_attack' => 2252.5,
    'bubing_base_defence' => 901.0,
    'qibing_base_defence' => 720.800000000006,
    'gongbing_base_defence' => 630.699999999995,
    'fangshi_base_defence' => 630.699999999995,
    'bubing_base_troops' => 9255.0,
    'qibing_base_troops' => 9255.0,
    'gongbing_base_troops' => 6880.0,
    'fangshi_base_troops' => 6880.0
};
get(477)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         481
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             566
        ]
    ],
    'bubing_base_attack' => 1806.0,
    'qibing_base_attack' => 1986.60000000002,
    'gongbing_base_attack' => 2257.5,
    'fangshi_base_attack' => 2257.5,
    'bubing_base_defence' => 903.0,
    'qibing_base_defence' => 722.400000000006,
    'gongbing_base_defence' => 632.099999999995,
    'fangshi_base_defence' => 632.099999999995,
    'bubing_base_troops' => 9275.0,
    'qibing_base_troops' => 9275.0,
    'gongbing_base_troops' => 6895.0,
    'fangshi_base_troops' => 6895.0
};
get(478)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         482
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             567
        ]
    ],
    'bubing_base_attack' => 1810.0,
    'qibing_base_attack' => 1991.00000000002,
    'gongbing_base_attack' => 2262.5,
    'fangshi_base_attack' => 2262.5,
    'bubing_base_defence' => 905.0,
    'qibing_base_defence' => 724.000000000006,
    'gongbing_base_defence' => 633.499999999995,
    'fangshi_base_defence' => 633.499999999995,
    'bubing_base_troops' => 9295.0,
    'qibing_base_troops' => 9295.0,
    'gongbing_base_troops' => 6910.0,
    'fangshi_base_troops' => 6910.0
};
get(479)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         483
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             568
        ]
    ],
    'bubing_base_attack' => 1814.0,
    'qibing_base_attack' => 1995.40000000002,
    'gongbing_base_attack' => 2267.5,
    'fangshi_base_attack' => 2267.5,
    'bubing_base_defence' => 907.0,
    'qibing_base_defence' => 725.600000000006,
    'gongbing_base_defence' => 634.899999999995,
    'fangshi_base_defence' => 634.899999999995,
    'bubing_base_troops' => 9315.0,
    'qibing_base_troops' => 9315.0,
    'gongbing_base_troops' => 6925.0,
    'fangshi_base_troops' => 6925.0
};
get(480)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         484
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             569
        ]
    ],
    'bubing_base_attack' => 1818.0,
    'qibing_base_attack' => 1999.80000000002,
    'gongbing_base_attack' => 2272.5,
    'fangshi_base_attack' => 2272.5,
    'bubing_base_defence' => 909.0,
    'qibing_base_defence' => 727.200000000006,
    'gongbing_base_defence' => 636.299999999995,
    'fangshi_base_defence' => 636.299999999995,
    'bubing_base_troops' => 9335.0,
    'qibing_base_troops' => 9335.0,
    'gongbing_base_troops' => 6940.0,
    'fangshi_base_troops' => 6940.0
};
get(481)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         485
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             570
        ]
    ],
    'bubing_base_attack' => 1822.0,
    'qibing_base_attack' => 2004.20000000002,
    'gongbing_base_attack' => 2277.5,
    'fangshi_base_attack' => 2277.5,
    'bubing_base_defence' => 911.0,
    'qibing_base_defence' => 728.800000000006,
    'gongbing_base_defence' => 637.699999999995,
    'fangshi_base_defence' => 637.699999999995,
    'bubing_base_troops' => 9355.0,
    'qibing_base_troops' => 9355.0,
    'gongbing_base_troops' => 6955.0,
    'fangshi_base_troops' => 6955.0
};
get(482)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         486
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             571
        ]
    ],
    'bubing_base_attack' => 1826.0,
    'qibing_base_attack' => 2008.60000000002,
    'gongbing_base_attack' => 2282.5,
    'fangshi_base_attack' => 2282.5,
    'bubing_base_defence' => 913.0,
    'qibing_base_defence' => 730.400000000006,
    'gongbing_base_defence' => 639.099999999995,
    'fangshi_base_defence' => 639.099999999995,
    'bubing_base_troops' => 9375.0,
    'qibing_base_troops' => 9375.0,
    'gongbing_base_troops' => 6970.0,
    'fangshi_base_troops' => 6970.0
};
get(483)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         487
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             572
        ]
    ],
    'bubing_base_attack' => 1830.0,
    'qibing_base_attack' => 2013.00000000002,
    'gongbing_base_attack' => 2287.5,
    'fangshi_base_attack' => 2287.5,
    'bubing_base_defence' => 915.0,
    'qibing_base_defence' => 732.000000000006,
    'gongbing_base_defence' => 640.499999999995,
    'fangshi_base_defence' => 640.499999999995,
    'bubing_base_troops' => 9395.0,
    'qibing_base_troops' => 9395.0,
    'gongbing_base_troops' => 6985.0,
    'fangshi_base_troops' => 6985.0
};
get(484)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         488
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             573
        ]
    ],
    'bubing_base_attack' => 1834.0,
    'qibing_base_attack' => 2017.40000000002,
    'gongbing_base_attack' => 2292.5,
    'fangshi_base_attack' => 2292.5,
    'bubing_base_defence' => 917.0,
    'qibing_base_defence' => 733.600000000006,
    'gongbing_base_defence' => 641.899999999995,
    'fangshi_base_defence' => 641.899999999995,
    'bubing_base_troops' => 9415.0,
    'qibing_base_troops' => 9415.0,
    'gongbing_base_troops' => 7000.0,
    'fangshi_base_troops' => 7000.0
};
get(485)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         489
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             574
        ]
    ],
    'bubing_base_attack' => 1838.0,
    'qibing_base_attack' => 2021.80000000002,
    'gongbing_base_attack' => 2297.5,
    'fangshi_base_attack' => 2297.5,
    'bubing_base_defence' => 919.0,
    'qibing_base_defence' => 735.200000000006,
    'gongbing_base_defence' => 643.299999999995,
    'fangshi_base_defence' => 643.299999999995,
    'bubing_base_troops' => 9435.0,
    'qibing_base_troops' => 9435.0,
    'gongbing_base_troops' => 7015.0,
    'fangshi_base_troops' => 7015.0
};
get(486)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         490
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             575
        ]
    ],
    'bubing_base_attack' => 1842.0,
    'qibing_base_attack' => 2026.20000000002,
    'gongbing_base_attack' => 2302.5,
    'fangshi_base_attack' => 2302.5,
    'bubing_base_defence' => 921.0,
    'qibing_base_defence' => 736.800000000006,
    'gongbing_base_defence' => 644.699999999994,
    'fangshi_base_defence' => 644.699999999994,
    'bubing_base_troops' => 9455.0,
    'qibing_base_troops' => 9455.0,
    'gongbing_base_troops' => 7030.0,
    'fangshi_base_troops' => 7030.0
};
get(487)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         491
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             576
        ]
    ],
    'bubing_base_attack' => 1846.0,
    'qibing_base_attack' => 2030.60000000002,
    'gongbing_base_attack' => 2307.5,
    'fangshi_base_attack' => 2307.5,
    'bubing_base_defence' => 923.0,
    'qibing_base_defence' => 738.400000000006,
    'gongbing_base_defence' => 646.099999999994,
    'fangshi_base_defence' => 646.099999999994,
    'bubing_base_troops' => 9475.0,
    'qibing_base_troops' => 9475.0,
    'gongbing_base_troops' => 7045.0,
    'fangshi_base_troops' => 7045.0
};
get(488)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         492
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             577
        ]
    ],
    'bubing_base_attack' => 1850.0,
    'qibing_base_attack' => 2035.00000000002,
    'gongbing_base_attack' => 2312.5,
    'fangshi_base_attack' => 2312.5,
    'bubing_base_defence' => 925.0,
    'qibing_base_defence' => 740.000000000006,
    'gongbing_base_defence' => 647.499999999994,
    'fangshi_base_defence' => 647.499999999994,
    'bubing_base_troops' => 9495.0,
    'qibing_base_troops' => 9495.0,
    'gongbing_base_troops' => 7060.0,
    'fangshi_base_troops' => 7060.0
};
get(489)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         493
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             578
        ]
    ],
    'bubing_base_attack' => 1854.0,
    'qibing_base_attack' => 2039.40000000002,
    'gongbing_base_attack' => 2317.5,
    'fangshi_base_attack' => 2317.5,
    'bubing_base_defence' => 927.0,
    'qibing_base_defence' => 741.600000000006,
    'gongbing_base_defence' => 648.899999999994,
    'fangshi_base_defence' => 648.899999999994,
    'bubing_base_troops' => 9515.0,
    'qibing_base_troops' => 9515.0,
    'gongbing_base_troops' => 7075.0,
    'fangshi_base_troops' => 7075.0
};
get(490)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         494
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             579
        ]
    ],
    'bubing_base_attack' => 1858.0,
    'qibing_base_attack' => 2043.80000000002,
    'gongbing_base_attack' => 2322.5,
    'fangshi_base_attack' => 2322.5,
    'bubing_base_defence' => 929.0,
    'qibing_base_defence' => 743.200000000006,
    'gongbing_base_defence' => 650.299999999994,
    'fangshi_base_defence' => 650.299999999994,
    'bubing_base_troops' => 9535.0,
    'qibing_base_troops' => 9535.0,
    'gongbing_base_troops' => 7090.0,
    'fangshi_base_troops' => 7090.0
};
get(491)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         495
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             580
        ]
    ],
    'bubing_base_attack' => 1862.0,
    'qibing_base_attack' => 2048.20000000002,
    'gongbing_base_attack' => 2327.5,
    'fangshi_base_attack' => 2327.5,
    'bubing_base_defence' => 931.0,
    'qibing_base_defence' => 744.800000000006,
    'gongbing_base_defence' => 651.699999999994,
    'fangshi_base_defence' => 651.699999999994,
    'bubing_base_troops' => 9555.0,
    'qibing_base_troops' => 9555.0,
    'gongbing_base_troops' => 7105.0,
    'fangshi_base_troops' => 7105.0
};
get(492)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         496
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             581
        ]
    ],
    'bubing_base_attack' => 1866.0,
    'qibing_base_attack' => 2052.60000000002,
    'gongbing_base_attack' => 2332.5,
    'fangshi_base_attack' => 2332.5,
    'bubing_base_defence' => 933.0,
    'qibing_base_defence' => 746.400000000006,
    'gongbing_base_defence' => 653.099999999994,
    'fangshi_base_defence' => 653.099999999994,
    'bubing_base_troops' => 9575.0,
    'qibing_base_troops' => 9575.0,
    'gongbing_base_troops' => 7120.0,
    'fangshi_base_troops' => 7120.0
};
get(493)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         497
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             582
        ]
    ],
    'bubing_base_attack' => 1870.0,
    'qibing_base_attack' => 2057.00000000002,
    'gongbing_base_attack' => 2337.5,
    'fangshi_base_attack' => 2337.5,
    'bubing_base_defence' => 935.0,
    'qibing_base_defence' => 748.000000000006,
    'gongbing_base_defence' => 654.499999999994,
    'fangshi_base_defence' => 654.499999999994,
    'bubing_base_troops' => 9595.0,
    'qibing_base_troops' => 9595.0,
    'gongbing_base_troops' => 7135.0,
    'fangshi_base_troops' => 7135.0
};
get(494)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         498
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             583
        ]
    ],
    'bubing_base_attack' => 1874.0,
    'qibing_base_attack' => 2061.40000000002,
    'gongbing_base_attack' => 2342.5,
    'fangshi_base_attack' => 2342.5,
    'bubing_base_defence' => 937.0,
    'qibing_base_defence' => 749.600000000006,
    'gongbing_base_defence' => 655.899999999994,
    'fangshi_base_defence' => 655.899999999994,
    'bubing_base_troops' => 9615.0,
    'qibing_base_troops' => 9615.0,
    'gongbing_base_troops' => 7150.0,
    'fangshi_base_troops' => 7150.0
};
get(495)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         499
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             584
        ]
    ],
    'bubing_base_attack' => 1878.0,
    'qibing_base_attack' => 2065.80000000002,
    'gongbing_base_attack' => 2347.5,
    'fangshi_base_attack' => 2347.5,
    'bubing_base_defence' => 939.0,
    'qibing_base_defence' => 751.200000000006,
    'gongbing_base_defence' => 657.299999999994,
    'fangshi_base_defence' => 657.299999999994,
    'bubing_base_troops' => 9635.0,
    'qibing_base_troops' => 9635.0,
    'gongbing_base_troops' => 7165.0,
    'fangshi_base_troops' => 7165.0
};
get(496)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         500
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             585
        ]
    ],
    'bubing_base_attack' => 1882.0,
    'qibing_base_attack' => 2070.20000000002,
    'gongbing_base_attack' => 2352.5,
    'fangshi_base_attack' => 2352.5,
    'bubing_base_defence' => 941.0,
    'qibing_base_defence' => 752.800000000006,
    'gongbing_base_defence' => 658.699999999994,
    'fangshi_base_defence' => 658.699999999994,
    'bubing_base_troops' => 9655.0,
    'qibing_base_troops' => 9655.0,
    'gongbing_base_troops' => 7180.0,
    'fangshi_base_troops' => 7180.0
};
get(497)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         501
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             586
        ]
    ],
    'bubing_base_attack' => 1886.0,
    'qibing_base_attack' => 2074.60000000002,
    'gongbing_base_attack' => 2357.5,
    'fangshi_base_attack' => 2357.5,
    'bubing_base_defence' => 943.0,
    'qibing_base_defence' => 754.400000000006,
    'gongbing_base_defence' => 660.099999999994,
    'fangshi_base_defence' => 660.099999999994,
    'bubing_base_troops' => 9675.0,
    'qibing_base_troops' => 9675.0,
    'gongbing_base_troops' => 7195.0,
    'fangshi_base_troops' => 7195.0
};
get(498)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         502
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             587
        ]
    ],
    'bubing_base_attack' => 1890.0,
    'qibing_base_attack' => 2079.00000000002,
    'gongbing_base_attack' => 2362.5,
    'fangshi_base_attack' => 2362.5,
    'bubing_base_defence' => 945.0,
    'qibing_base_defence' => 756.000000000006,
    'gongbing_base_defence' => 661.499999999994,
    'fangshi_base_defence' => 661.499999999994,
    'bubing_base_troops' => 9695.0,
    'qibing_base_troops' => 9695.0,
    'gongbing_base_troops' => 7210.0,
    'fangshi_base_troops' => 7210.0
};
get(499)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         503
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             588
        ]
    ],
    'bubing_base_attack' => 1894.0,
    'qibing_base_attack' => 2083.40000000002,
    'gongbing_base_attack' => 2367.5,
    'fangshi_base_attack' => 2367.5,
    'bubing_base_defence' => 947.0,
    'qibing_base_defence' => 757.600000000007,
    'gongbing_base_defence' => 662.899999999994,
    'fangshi_base_defence' => 662.899999999994,
    'bubing_base_troops' => 9715.0,
    'qibing_base_troops' => 9715.0,
    'gongbing_base_troops' => 7225.0,
    'fangshi_base_troops' => 7225.0
};
get(500)-> #{
    'exp' => 150000,
    'reset_cost_item' => [
        102006001,
         504
    ],
    'reset_reward_items' => [
        [
            102008001,
             20
        ],
         [
            102008002,
             589
        ]
    ],
    'bubing_base_attack' => 1898.0,
    'qibing_base_attack' => 2087.80000000002,
    'gongbing_base_attack' => 2372.5,
    'fangshi_base_attack' => 2372.5,
    'bubing_base_defence' => 949.0,
    'qibing_base_defence' => 759.200000000007,
    'gongbing_base_defence' => 664.299999999994,
    'fangshi_base_defence' => 664.299999999994,
    'bubing_base_troops' => 9735.0,
    'qibing_base_troops' => 9735.0,
    'gongbing_base_troops' => 7240.0,
    'fangshi_base_troops' => 7240.0
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500].
