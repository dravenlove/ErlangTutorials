%%--- coding:utf-8 ---
-module(tb_hero).
-export([get/1,get_list/0]).
get(101)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005001,
    'act_num' => 10,
    'awaken_id' => 102022001,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005001,
    'star_reset_id' => 102006002,
    'hero_strength' => 57,
    'hero_intelect' => 85,
    'hero_spirit' => 90,
    'hero_leadership' => 75,
    'head_id' => 101,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(102)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005002,
    'act_num' => 10,
    'awaken_id' => 102022002,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005002,
    'star_reset_id' => 102006002,
    'hero_strength' => 78,
    'hero_intelect' => 66,
    'hero_spirit' => 68,
    'hero_leadership' => 71,
    'head_id' => 102,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 1.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101104,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         7
    ]
};
get(103)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005003,
    'act_num' => 10,
    'awaken_id' => 102022003,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005003,
    'star_reset_id' => 102006002,
    'hero_strength' => 64,
    'hero_intelect' => 92,
    'hero_spirit' => 89,
    'hero_leadership' => 80,
    'head_id' => 103,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(104)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005004,
    'act_num' => 10,
    'awaken_id' => 102022004,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005004,
    'star_reset_id' => 102006002,
    'hero_strength' => 88,
    'hero_intelect' => 82,
    'hero_spirit' => 85,
    'hero_leadership' => 86,
    'head_id' => 104,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 3.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101103,
                 101102,
                 101104,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         6,
         7
    ]
};
get(105)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 1,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005005,
    'act_num' => 10,
    'awaken_id' => 102022005,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005005,
    'star_reset_id' => 102006002,
    'hero_strength' => 99,
    'hero_intelect' => 65,
    'hero_spirit' => 61,
    'hero_leadership' => 76,
    'head_id' => 105,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(106)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005006,
    'act_num' => 10,
    'awaken_id' => 102022006,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005006,
    'star_reset_id' => 102006002,
    'hero_strength' => 82,
    'hero_intelect' => 70,
    'hero_spirit' => 64,
    'hero_leadership' => 90,
    'head_id' => 106,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -4.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 1.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101103,
                 101102,
                 101104,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         5
    ]
};
get(107)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005007,
    'act_num' => 10,
    'awaken_id' => 102022007,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005007,
    'star_reset_id' => 102006002,
    'hero_strength' => 52,
    'hero_intelect' => 93,
    'hero_spirit' => 84,
    'hero_leadership' => 73,
    'head_id' => 107,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         7
    ]
};
get(108)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005008,
    'act_num' => 10,
    'awaken_id' => 102022008,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005008,
    'star_reset_id' => 102006002,
    'hero_strength' => 84,
    'hero_intelect' => 74,
    'hero_spirit' => 72,
    'hero_leadership' => 83,
    'head_id' => 108,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101103,
                 101102,
                 101104,
                 101107,
                 101108
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(109)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005009,
    'act_num' => 10,
    'awaken_id' => 102022009,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005009,
    'star_reset_id' => 102006002,
    'hero_strength' => 83,
    'hero_intelect' => 67,
    'hero_spirit' => 68,
    'hero_leadership' => 76,
    'head_id' => 109,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -3.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101103,
                 101102,
                 101104,
                 101107,
                 101108
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(110)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005010,
    'act_num' => 10,
    'awaken_id' => 102022010,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005010,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 63,
    'hero_spirit' => 58,
    'hero_leadership' => 78,
    'head_id' => 110,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         6
    ]
};
get(111)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005011,
    'act_num' => 10,
    'awaken_id' => 102022011,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005011,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 70,
    'hero_spirit' => 74,
    'hero_leadership' => 83,
    'head_id' => 111,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -3.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         6
    ]
};
get(112)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005012,
    'act_num' => 10,
    'awaken_id' => 102022012,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005012,
    'star_reset_id' => 102006002,
    'hero_strength' => 65,
    'hero_intelect' => 91,
    'hero_spirit' => 76,
    'hero_leadership' => 90,
    'head_id' => 112,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 1.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         7
    ]
};
get(113)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005013,
    'act_num' => 10,
    'awaken_id' => 102022013,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005013,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 74,
    'hero_spirit' => 73,
    'hero_leadership' => 84,
    'head_id' => 113,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         6
    ]
};
get(114)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005014,
    'act_num' => 10,
    'awaken_id' => 102022014,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005014,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 63,
    'hero_spirit' => 89,
    'hero_leadership' => 78,
    'head_id' => 114,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         6
    ]
};
get(115)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 1,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005015,
    'act_num' => 10,
    'awaken_id' => 102022015,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005015,
    'star_reset_id' => 102006002,
    'hero_strength' => 95,
    'hero_intelect' => 68,
    'hero_spirit' => 70,
    'hero_leadership' => 81,
    'head_id' => 115,
    'qianjun_base_attack' => 3.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         4
    ]
};
get(116)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005016,
    'act_num' => 10,
    'awaken_id' => 102022016,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005016,
    'star_reset_id' => 102006002,
    'hero_strength' => 51,
    'hero_intelect' => 92,
    'hero_spirit' => 72,
    'hero_leadership' => 69,
    'head_id' => 116,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101114,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(117)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005017,
    'act_num' => 10,
    'awaken_id' => 102022017,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005017,
    'star_reset_id' => 102006002,
    'hero_strength' => 82,
    'hero_intelect' => 72,
    'hero_spirit' => 74,
    'hero_leadership' => 81,
    'head_id' => 117,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101103,
                 101102,
                 101104,
                 101107,
                 101108
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         5
    ]
};
get(118)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005018,
    'act_num' => 10,
    'awaken_id' => 102022018,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005018,
    'star_reset_id' => 102006002,
    'hero_strength' => 86,
    'hero_intelect' => 81,
    'hero_spirit' => 76,
    'hero_leadership' => 89,
    'head_id' => 118,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101103,
                 101102,
                 101104,
                 101107,
                 101108
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         6,
         7
    ]
};
get(119)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005019,
    'act_num' => 10,
    'awaken_id' => 102022019,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005019,
    'star_reset_id' => 102006002,
    'hero_strength' => 91,
    'hero_intelect' => 65,
    'hero_spirit' => 60,
    'hero_leadership' => 81,
    'head_id' => 119,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         6
    ]
};
get(120)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005020,
    'act_num' => 10,
    'awaken_id' => 102022020,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005020,
    'star_reset_id' => 102006002,
    'hero_strength' => 55,
    'hero_intelect' => 84,
    'hero_spirit' => 84,
    'hero_leadership' => 66,
    'head_id' => 120,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         6,
         7
    ]
};
get(121)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005021,
    'act_num' => 10,
    'awaken_id' => 102022021,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005021,
    'star_reset_id' => 102006002,
    'hero_strength' => 80,
    'hero_intelect' => 78,
    'hero_spirit' => 83,
    'hero_leadership' => 84,
    'head_id' => 121,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101103,
                 101102,
                 101105,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         5
    ]
};
get(122)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005022,
    'act_num' => 10,
    'awaken_id' => 102022022,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005022,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 64,
    'hero_spirit' => 56,
    'hero_leadership' => 79,
    'head_id' => 122,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(123)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 1,
    'is_destiny' => 0,
    'is_genius' => 0,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005023,
    'act_num' => 10,
    'awaken_id' => 102022023,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005023,
    'star_reset_id' => 102006002,
    'hero_strength' => 83,
    'hero_intelect' => 73,
    'hero_spirit' => 81,
    'hero_leadership' => 79,
    'head_id' => 123,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101103,
                 101102,
                 101105,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         7
    ]
};
get(201)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005024,
    'act_num' => 10,
    'awaken_id' => 102022024,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005024,
    'star_reset_id' => 102006002,
    'hero_strength' => 97,
    'hero_intelect' => 72,
    'hero_spirit' => 90,
    'hero_leadership' => 89,
    'head_id' => 201,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         6
    ]
};
get(202)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005025,
    'act_num' => 10,
    'awaken_id' => 102022025,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005025,
    'star_reset_id' => 102006002,
    'hero_strength' => 96,
    'hero_intelect' => 61,
    'hero_spirit' => 67,
    'hero_leadership' => 80,
    'head_id' => 202,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101112,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(203)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005026,
    'act_num' => 10,
    'awaken_id' => 102022026,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005026,
    'star_reset_id' => 102006002,
    'hero_strength' => 99,
    'hero_intelect' => 71,
    'hero_spirit' => 74,
    'hero_leadership' => 90,
    'head_id' => 203,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101112,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         5
    ]
};
get(204)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005027,
    'act_num' => 10,
    'awaken_id' => 102022027,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005027,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 87,
    'hero_spirit' => 82,
    'hero_leadership' => 92,
    'head_id' => 204,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101103,
                 101102,
                 101105,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(205)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005028,
    'act_num' => 10,
    'awaken_id' => 102022028,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ],
         [
            201503,
             5
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005028,
    'star_reset_id' => 102006002,
    'hero_strength' => 90,
    'hero_intelect' => 92,
    'hero_spirit' => 87,
    'hero_leadership' => 94,
    'head_id' => 205,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101103,
                 101102,
                 101105,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         7
    ]
};
get(206)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005029,
    'act_num' => 10,
    'awaken_id' => 102022029,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005029,
    'star_reset_id' => 102006002,
    'hero_strength' => 51,
    'hero_intelect' => 95,
    'hero_spirit' => 91,
    'hero_leadership' => 65,
    'head_id' => 206,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         7
    ]
};
get(207)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005030,
    'act_num' => 10,
    'awaken_id' => 102022030,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005030,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 80,
    'hero_spirit' => 75,
    'hero_leadership' => 92,
    'head_id' => 207,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101112,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(208)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005031,
    'act_num' => 10,
    'awaken_id' => 102022031,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005031,
    'star_reset_id' => 102006002,
    'hero_strength' => 96,
    'hero_intelect' => 73,
    'hero_spirit' => 85,
    'hero_leadership' => 86,
    'head_id' => 208,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         6,
         7
    ]
};
get(209)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005032,
    'act_num' => 10,
    'awaken_id' => 102022032,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005032,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 76,
    'hero_spirit' => 70,
    'hero_leadership' => 87,
    'head_id' => 209,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         7
    ]
};
get(210)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005033,
    'act_num' => 10,
    'awaken_id' => 102022033,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005033,
    'star_reset_id' => 102006002,
    'hero_strength' => 87,
    'hero_intelect' => 93,
    'hero_spirit' => 83,
    'hero_leadership' => 96,
    'head_id' => 210,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101103,
                 101102,
                 101105,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         5
    ]
};
get(211)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005034,
    'act_num' => 10,
    'awaken_id' => 102022034,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005034,
    'star_reset_id' => 102006002,
    'hero_strength' => 58,
    'hero_intelect' => 94,
    'hero_spirit' => 80,
    'hero_leadership' => 82,
    'head_id' => 211,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         5
    ]
};
get(212)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005035,
    'act_num' => 10,
    'awaken_id' => 102022035,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005035,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 75,
    'hero_spirit' => 83,
    'hero_leadership' => 90,
    'head_id' => 212,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         6
    ]
};
get(213)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005036,
    'act_num' => 10,
    'awaken_id' => 102022036,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005036,
    'star_reset_id' => 102006002,
    'hero_strength' => 94,
    'hero_intelect' => 75,
    'hero_spirit' => 82,
    'hero_leadership' => 91,
    'head_id' => 213,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 1.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(214)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005037,
    'act_num' => 10,
    'awaken_id' => 102022037,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005037,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 77,
    'hero_spirit' => 80,
    'hero_leadership' => 88,
    'head_id' => 214,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(215)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 2,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005038,
    'act_num' => 10,
    'awaken_id' => 102022038,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005038,
    'star_reset_id' => 102006002,
    'hero_strength' => 67,
    'hero_intelect' => 95,
    'hero_spirit' => 84,
    'hero_leadership' => 85,
    'head_id' => 215,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(301)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005039,
    'act_num' => 10,
    'awaken_id' => 102022039,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005039,
    'star_reset_id' => 102006002,
    'hero_strength' => 97,
    'hero_intelect' => 81,
    'hero_spirit' => 93,
    'hero_leadership' => 93,
    'head_id' => 301,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(302)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005040,
    'act_num' => 10,
    'awaken_id' => 102022040,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005040,
    'star_reset_id' => 102006002,
    'hero_strength' => 96,
    'hero_intelect' => 86,
    'hero_spirit' => 92,
    'hero_leadership' => 90,
    'head_id' => 302,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101112,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         6
    ]
};
get(303)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005041,
    'act_num' => 10,
    'awaken_id' => 102022041,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005041,
    'star_reset_id' => 102006002,
    'hero_strength' => 100,
    'hero_intelect' => 63,
    'hero_spirit' => 86,
    'hero_leadership' => 89,
    'head_id' => 303,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         6
    ]
};
get(304)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005042,
    'act_num' => 10,
    'awaken_id' => 102022042,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005042,
    'star_reset_id' => 102006002,
    'hero_strength' => 59,
    'hero_intelect' => 100,
    'hero_spirit' => 98,
    'hero_leadership' => 97,
    'head_id' => 304,
    'qianjun_base_attack' => 3.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101114,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(305)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005043,
    'act_num' => 10,
    'awaken_id' => 102022043,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005043,
    'star_reset_id' => 102006002,
    'hero_strength' => 61,
    'hero_intelect' => 97,
    'hero_spirit' => 80,
    'hero_leadership' => 95,
    'head_id' => 305,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101114,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         7
    ]
};
get(306)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005044,
    'act_num' => 10,
    'awaken_id' => 102022044,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005044,
    'star_reset_id' => 102006002,
    'hero_strength' => 95,
    'hero_intelect' => 84,
    'hero_spirit' => 85,
    'hero_leadership' => 93,
    'head_id' => 306,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101112,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        5,
         6,
         7
    ]
};
get(307)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005045,
    'act_num' => 10,
    'awaken_id' => 102022045,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005045,
    'star_reset_id' => 102006002,
    'hero_strength' => 56,
    'hero_intelect' => 98,
    'hero_spirit' => 91,
    'hero_leadership' => 92,
    'head_id' => 307,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101108,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         6,
         7
    ]
};
get(308)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005046,
    'act_num' => 10,
    'awaken_id' => 102022046,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005046,
    'star_reset_id' => 102006002,
    'hero_strength' => 97,
    'hero_intelect' => 80,
    'hero_spirit' => 90,
    'hero_leadership' => 96,
    'head_id' => 308,
    'qianjun_base_attack' => 6.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         6,
         7
    ]
};
get(309)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005047,
    'act_num' => 10,
    'awaken_id' => 102022047,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005047,
    'star_reset_id' => 102006002,
    'hero_strength' => 65,
    'hero_intelect' => 98,
    'hero_spirit' => 77,
    'hero_leadership' => 99,
    'head_id' => 309,
    'qianjun_base_attack' => -1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101114,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         7
    ]
};
get(310)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005048,
    'act_num' => 10,
    'awaken_id' => 102022048,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005048,
    'star_reset_id' => 102006002,
    'hero_strength' => 74,
    'hero_intelect' => 98,
    'hero_spirit' => 99,
    'hero_leadership' => 95,
    'head_id' => 310,
    'qianjun_base_attack' => 111.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => -1.0,
    'houjun_base_attack' => 112.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101113,
                 101114,
                 101107,
                 101104,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         5
    ]
};
get(311)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005049,
    'act_num' => 10,
    'awaken_id' => 102022049,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005049,
    'star_reset_id' => 102006002,
    'hero_strength' => 96,
    'hero_intelect' => 89,
    'hero_spirit' => 85,
    'hero_leadership' => 97,
    'head_id' => 311,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101110,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         7
    ]
};
get(312)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005050,
    'act_num' => 10,
    'awaken_id' => 102022050,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005050,
    'star_reset_id' => 102006002,
    'hero_strength' => 64,
    'hero_intelect' => 99,
    'hero_spirit' => 91,
    'hero_leadership' => 100,
    'head_id' => 312,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101114,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        5,
         6,
         7
    ]
};
get(313)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005051,
    'act_num' => 10,
    'awaken_id' => 102022051,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005051,
    'star_reset_id' => 102006002,
    'hero_strength' => 70,
    'hero_intelect' => 70,
    'hero_spirit' => 70,
    'hero_leadership' => 70,
    'head_id' => 313,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         6
    ]
};
get(314)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005052,
    'act_num' => 10,
    'awaken_id' => 102022052,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005052,
    'star_reset_id' => 102006002,
    'hero_strength' => 78,
    'hero_intelect' => 97,
    'hero_spirit' => 97,
    'hero_leadership' => 98,
    'head_id' => 314,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101113,
                 101107,
                 101111,
                 101116,
                 101118
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(315)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005053,
    'act_num' => 10,
    'awaken_id' => 102022053,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005053,
    'star_reset_id' => 102006002,
    'hero_strength' => 98,
    'hero_intelect' => 71,
    'hero_spirit' => 88,
    'hero_leadership' => 97,
    'head_id' => 315,
    'qianjun_base_attack' => 62.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 54.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101116,
                 101103,
                 101112,
                 101107,
                 101120
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         6
    ]
};
get(316)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005054,
    'act_num' => 10,
    'awaken_id' => 102022054,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005054,
    'star_reset_id' => 102006002,
    'hero_strength' => 79,
    'hero_intelect' => 91,
    'hero_spirit' => 97,
    'hero_leadership' => 88,
    'head_id' => 316,
    'qianjun_base_attack' => 4.0,
    'qianjun_base_defence' => -1.0,
    'qianjun_base_speed' => -1.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101107,
                 101114,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(317)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005055,
    'act_num' => 10,
    'awaken_id' => 102022055,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005055,
    'star_reset_id' => 102006002,
    'hero_strength' => 99,
    'hero_intelect' => 87,
    'hero_spirit' => 78,
    'hero_leadership' => 77,
    'head_id' => 317,
    'qianjun_base_attack' => 6.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101116,
                 101119,
                 101117,
                 101107,
                 101120
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(318)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005056,
    'act_num' => 10,
    'awaken_id' => 102022056,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005056,
    'star_reset_id' => 102006002,
    'hero_strength' => 88,
    'hero_intelect' => 95,
    'hero_spirit' => 86,
    'hero_leadership' => 96,
    'head_id' => 318,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101118,
                 101114,
                 101107,
                 101105,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         6
    ]
};
get(401)-> #{
    'sex' => 2,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005057,
    'act_num' => 10,
    'awaken_id' => 102022057,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005057,
    'star_reset_id' => 102006002,
    'hero_strength' => 91,
    'hero_intelect' => 82,
    'hero_spirit' => 94,
    'hero_leadership' => 86,
    'head_id' => 401,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101106,
                 101107,
                 101111,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(402)-> #{
    'sex' => 2,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005058,
    'act_num' => 10,
    'awaken_id' => 102022058,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005058,
    'star_reset_id' => 102006002,
    'hero_strength' => 56,
    'hero_intelect' => 91,
    'hero_spirit' => 100,
    'hero_leadership' => 78,
    'head_id' => 402,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101106,
                 101105,
                 101111,
                 101104,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         7
    ]
};
get(403)-> #{
    'sex' => 2,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005059,
    'act_num' => 10,
    'awaken_id' => 102022059,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005059,
    'star_reset_id' => 102006002,
    'hero_strength' => 97,
    'hero_intelect' => 84,
    'hero_spirit' => 98,
    'hero_leadership' => 90,
    'head_id' => 403,
    'qianjun_base_attack' => 7.0,
    'qianjun_base_defence' => -1.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 1.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101116,
                 101112,
                 101119,
                 101122,
                 101120
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         6
    ]
};
get(404)-> #{
    'sex' => 2,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005060,
    'act_num' => 10,
    'awaken_id' => 102022060,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005060,
    'star_reset_id' => 102006002,
    'hero_strength' => 57,
    'hero_intelect' => 94,
    'hero_spirit' => 100,
    'hero_leadership' => 85,
    'head_id' => 404,
    'qianjun_base_attack' => 52.0,
    'qianjun_base_defence' => 20.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 46.0,
    'houjun_base_defence' => 20.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101106,
                 101111,
                 101104,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         5
    ]
};
get(405)-> #{
    'sex' => 2,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005061,
    'act_num' => 10,
    'awaken_id' => 102022061,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005061,
    'star_reset_id' => 102006002,
    'hero_strength' => 95,
    'hero_intelect' => 74,
    'hero_spirit' => 89,
    'hero_leadership' => 91,
    'head_id' => 405,
    'qianjun_base_attack' => 152.0,
    'qianjun_base_defence' => 50.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         4
    ]
};
get(406)-> #{
    'sex' => 2,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005062,
    'act_num' => 10,
    'awaken_id' => 102022062,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005062,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 83,
    'hero_spirit' => 92,
    'hero_leadership' => 88,
    'head_id' => 406,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101103,
                 101107,
                 101112
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         6
    ]
};
get(407)-> #{
    'sex' => 2,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005063,
    'act_num' => 10,
    'awaken_id' => 102022063,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005063,
    'star_reset_id' => 102006002,
    'hero_strength' => 55,
    'hero_intelect' => 98,
    'hero_spirit' => 84,
    'hero_leadership' => 87,
    'head_id' => 407,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => -1.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101111,
                 101114,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         7
    ]
};
get(408)-> #{
    'sex' => 2,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 1,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005064,
    'act_num' => 10,
    'awaken_id' => 102022064,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005064,
    'star_reset_id' => 102006002,
    'hero_strength' => 51,
    'hero_intelect' => 90,
    'hero_spirit' => 95,
    'hero_leadership' => 84,
    'head_id' => 408,
    'qianjun_base_attack' => -2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101106,
                 101105,
                 101111,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         5
    ]
};
get(409)-> #{
    'sex' => 2,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005065,
    'act_num' => 10,
    'awaken_id' => 102022065,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005065,
    'star_reset_id' => 102006002,
    'hero_strength' => 59,
    'hero_intelect' => 90,
    'hero_spirit' => 100,
    'hero_leadership' => 91,
    'head_id' => 409,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101106,
                 101108,
                 101111,
                 101115,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         7
    ]
};
get(410)-> #{
    'sex' => 2,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005066,
    'act_num' => 10,
    'awaken_id' => 102022066,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005066,
    'star_reset_id' => 102006002,
    'hero_strength' => 56,
    'hero_intelect' => 97,
    'hero_spirit' => 99,
    'hero_leadership' => 75,
    'head_id' => 410,
    'qianjun_base_attack' => 26.0,
    'qianjun_base_defence' => 10.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => -1.0,
    'houjun_base_attack' => 26.0,
    'houjun_base_defence' => 10.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 4.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101106,
                 101120,
                 101122,
                 101110,
                 101121
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(411)-> #{
    'sex' => 2,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005067,
    'act_num' => 10,
    'awaken_id' => 102022067,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005067,
    'star_reset_id' => 102006002,
    'hero_strength' => 94,
    'hero_intelect' => 78,
    'hero_spirit' => 96,
    'hero_leadership' => 96,
    'head_id' => 411,
    'qianjun_base_attack' => 21.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 15.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101112,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         6,
         7
    ]
};
get(412)-> #{
    'sex' => 2,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005068,
    'act_num' => 10,
    'awaken_id' => 102022068,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005068,
    'star_reset_id' => 102006002,
    'hero_strength' => 71,
    'hero_intelect' => 89,
    'hero_spirit' => 94,
    'hero_leadership' => 93,
    'head_id' => 412,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -1.0,
    'houjun_base_defence' => 1.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101106,
                 101104,
                 101111,
                 101113,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(413)-> #{
    'sex' => 2,
    'hero_type' => 2,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005069,
    'act_num' => 10,
    'awaken_id' => 102022069,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005069,
    'star_reset_id' => 102006002,
    'hero_strength' => 90,
    'hero_intelect' => 86,
    'hero_spirit' => 95,
    'hero_leadership' => 79,
    'head_id' => 413,
    'qianjun_base_attack' => 99.0,
    'qianjun_base_defence' => 60.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 82.0,
    'houjun_base_defence' => 61.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101101,
                 101102,
                 101120,
                 101110,
                 101107
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         7
    ]
};
get(414)-> #{
    'sex' => 2,
    'hero_type' => 3,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005070,
    'act_num' => 10,
    'awaken_id' => 102022070,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005070,
    'star_reset_id' => 102006002,
    'hero_strength' => 61,
    'hero_intelect' => 91,
    'hero_spirit' => 99,
    'hero_leadership' => 83,
    'head_id' => 414,
    'qianjun_base_attack' => 90.0,
    'qianjun_base_defence' => 61.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 67.0,
    'houjun_base_defence' => 51.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         6
    ]
};
get(415)-> #{
    'sex' => 2,
    'hero_type' => 1,
    'quality' => 3,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005071,
    'act_num' => 10,
    'awaken_id' => 102022071,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005071,
    'star_reset_id' => 102006002,
    'hero_strength' => 54,
    'hero_intelect' => 93,
    'hero_spirit' => 90,
    'hero_leadership' => 98,
    'head_id' => 415,
    'qianjun_base_attack' => 24.0,
    'qianjun_base_defence' => 57.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 23.0,
    'houjun_base_defence' => 58.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         5,
         7
    ]
};
get(501)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005072,
    'act_num' => 50,
    'awaken_id' => 102022072,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005072,
    'star_reset_id' => 102006002,
    'hero_strength' => 70,
    'hero_intelect' => 97,
    'hero_spirit' => 93,
    'hero_leadership' => 94,
    'head_id' => 501,
    'qianjun_base_attack' => 1.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101105,
                 101114,
                 101121,
                 101118
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(502)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005073,
    'act_num' => 50,
    'awaken_id' => 102022073,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005073,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 86,
    'hero_spirit' => 88,
    'hero_leadership' => 93,
    'head_id' => 502,
    'qianjun_base_attack' => 17.0,
    'qianjun_base_defence' => 14.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 20.0,
    'houjun_base_attack' => 15.0,
    'houjun_base_defence' => 14.0,
    'houjun_base_speed' => -1.0,
    'houjun_base_troops' => 20.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101110,
                 101119
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        4,
         5,
         6
    ]
};
get(503)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005074,
    'act_num' => 50,
    'awaken_id' => 102022074,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005074,
    'star_reset_id' => 102006002,
    'hero_strength' => 99,
    'hero_intelect' => 75,
    'hero_spirit' => 96,
    'hero_leadership' => 89,
    'head_id' => 503,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101102,
                 101103,
                 101107,
                 101110,
                 101119
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         7
    ]
};
get(504)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005075,
    'act_num' => 50,
    'awaken_id' => 102022075,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005075,
    'star_reset_id' => 102006002,
    'hero_strength' => 93,
    'hero_intelect' => 94,
    'hero_spirit' => 81,
    'hero_leadership' => 99,
    'head_id' => 504,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101122,
                 101110,
                 101116,
                 101120,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         5
    ]
};
get(505)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005076,
    'act_num' => 50,
    'awaken_id' => 102022076,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005076,
    'star_reset_id' => 102006002,
    'hero_strength' => 96,
    'hero_intelect' => 90,
    'hero_spirit' => 99,
    'hero_leadership' => 81,
    'head_id' => 505,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101122,
                 101107,
                 101120,
                 101117,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         6
    ]
};
get(506)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005077,
    'act_num' => 50,
    'awaken_id' => 102022077,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005077,
    'star_reset_id' => 102006002,
    'hero_strength' => 90,
    'hero_intelect' => 96,
    'hero_spirit' => 92,
    'hero_leadership' => 92,
    'head_id' => 506,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101122,
                 101114,
                 101118,
                 101121,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         4,
         7
    ]
};
get(507)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005078,
    'act_num' => 50,
    'awaken_id' => 102022078,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005078,
    'star_reset_id' => 102006002,
    'hero_strength' => 88,
    'hero_intelect' => 92,
    'hero_spirit' => 100,
    'hero_leadership' => 60,
    'head_id' => 507,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101111,
                 101107,
                 101115,
                 101110,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         4
    ]
};
get(508)-> #{
    'sex' => 1,
    'hero_type' => 2,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005079,
    'act_num' => 50,
    'awaken_id' => 102022079,
    'awaken_num' => 1,
    'skill_list' => [
        200201001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005079,
    'star_reset_id' => 102006002,
    'hero_strength' => 100,
    'hero_intelect' => 60,
    'hero_spirit' => 88,
    'hero_leadership' => 92,
    'head_id' => 508,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101120,
                 101110,
                 101103,
                 101107,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         4,
         7
    ]
};
get(509)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005080,
    'act_num' => 50,
    'awaken_id' => 102022080,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005080,
    'star_reset_id' => 102006002,
    'hero_strength' => 60,
    'hero_intelect' => 88,
    'hero_spirit' => 92,
    'hero_leadership' => 100,
    'head_id' => 509,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => -2.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101105,
                 101114,
                 101118,
                 101121,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         6,
         7
    ]
};
get(510)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005081,
    'act_num' => 50,
    'awaken_id' => 102022081,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005081,
    'star_reset_id' => 102006002,
    'hero_strength' => 92,
    'hero_intelect' => 100,
    'hero_spirit' => 60,
    'hero_leadership' => 88,
    'head_id' => 510,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101121,
                 101114,
                 101104,
                 101105,
                 101118
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         6,
         7
    ]
};
get(511)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 4,
    'act_id' => 102005082,
    'act_num' => 50,
    'awaken_id' => 102022082,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100201001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005082,
    'star_reset_id' => 102006002,
    'hero_strength' => 77,
    'hero_intelect' => 100,
    'hero_spirit' => 95,
    'hero_leadership' => 64,
    'head_id' => 511,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101114,
                 101118,
                 101121,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         7
    ]
};
get(512)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 4,
    'act_id' => 102005083,
    'act_num' => 50,
    'awaken_id' => 102022083,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100101001,
         100401001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005083,
    'star_reset_id' => 102006002,
    'hero_strength' => 63,
    'hero_intelect' => 99,
    'hero_spirit' => 87,
    'hero_leadership' => 93,
    'head_id' => 512,
    'qianjun_base_attack' => 2.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 1.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101121,
                 101114,
                 101104,
                 101105,
                 101118
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        3,
         6,
         7
    ]
};
get(513)-> #{
    'sex' => 1,
    'hero_type' => 3,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 2,
    'back_corps' => 3,
    'act_id' => 102005084,
    'act_num' => 50,
    'awaken_id' => 102022084,
    'awaken_num' => 1,
    'skill_list' => [
        200301001,
         100201001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005084,
    'star_reset_id' => 102006002,
    'hero_strength' => 85,
    'hero_intelect' => 96,
    'hero_spirit' => 76,
    'hero_leadership' => 82,
    'head_id' => 513,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101104,
                 101114,
                 101118,
                 101121,
                 101109
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25016"/utf8>>,
            'skills' => [
                101202,
                 201201,
                 201203,
                 101201,
                 201202
            ]
        },
        '2' => #{
            'name' => <<"25017"/utf8>>,
            'skills' => [
                201204,
                 101202,
                 201205,
                 201203,
                 101203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         5,
         6
    ]
};
get(514)-> #{
    'sex' => 1,
    'hero_type' => 1,
    'quality' => 5,
    'is_destiny' => 1,
    'is_genius' => 1,
    'is_basics' => 0,
    'front_corps' => 1,
    'back_corps' => 3,
    'act_id' => 102005085,
    'act_num' => 50,
    'awaken_id' => 102022085,
    'awaken_num' => 1,
    'skill_list' => [
        200101001,
         100101001,
         100301001
    ],
    'fixed_skill_list' => [
        [
            201702,
             20
        ]
    ],
    'max_level' => 200,
    'max_star' => 18,
    'star_item_id' => 102005085,
    'star_reset_id' => 102006002,
    'hero_strength' => 66,
    'hero_intelect' => 93,
    'hero_spirit' => 83,
    'hero_leadership' => 80,
    'head_id' => 514,
    'qianjun_base_attack' => 0.0,
    'qianjun_base_defence' => 0.0,
    'qianjun_base_speed' => 0.0,
    'qianjun_base_troops' => 0.0,
    'houjun_base_attack' => 0.0,
    'houjun_base_defence' => 0.0,
    'houjun_base_speed' => 0.0,
    'houjun_base_troops' => 0.0,
    'recommended_skill_1' => #{
        '1' => #{
            'name' => <<"25005"/utf8>>,
            'skills' => [
                101121,
                 101114,
                 101104,
                 101105,
                 101118
            ]
        }
    },
    'recommended_skill_2' => #{
        '1' => #{
            'name' => <<"25006"/utf8>>,
            'skills' => [
                201201,
                 101201,
                 201202,
                 101202,
                 201203
            ]
        }
    },
    'recommended_skill_3' => #{
        '1' => #{
            'name' => <<"25007"/utf8>>,
            'skills' => [
                101301,
                 101302,
                 201301,
                 201302,
                 201303
            ]
        }
    },
    'recommended_skill_4' => #{
        '1' => #{
            'name' => <<"25008"/utf8>>,
            'skills' => [
                201401,
                 201402,
                 201403,
                 101401,
                 201404
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                101401,
                 201404,
                 101402,
                 101403,
                 201405
            ]
        }
    },
    'recommended_skill_5' => #{
        '1' => #{
            'name' => <<"25010"/utf8>>,
            'skills' => [
                201501,
                 101501,
                 201502,
                 201503,
                 201504
            ]
        },
        '2' => #{
            'name' => <<"25009"/utf8>>,
            'skills' => [
                201503,
                 201504,
                 101502,
                 101503,
                 201505
            ]
        }
    },
    'recommended_skill_6' => #{
        '1' => #{
            'name' => <<"25011"/utf8>>,
            'skills' => [
                201601,
                 201602,
                 201603,
                 201604,
                 201605
            ]
        },
        '2' => #{
            'name' => <<"25012"/utf8>>,
            'skills' => [
                201605,
                 201606,
                 201607,
                 201608,
                 201609
            ]
        }
    },
    'formation' => [
        2,
         3,
         4
    ]
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,501,502,503,504,505,506,507,508,509,510,511,512,513,514].
