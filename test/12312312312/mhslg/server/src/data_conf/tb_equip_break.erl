%%--- coding:utf-8 ---
-module(tb_equip_break).
-export([get/1,get_list/0]).
get(1070010011)-> #{
    'score' => 120,
    'break_wait_time' => 28800,
    'success_rate' => 55,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001003,
             150000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 100
    }
};
get(1070010012)-> #{
    'score' => 260,
    'add_skill' => 1040011001,
    'break_wait_time' => 36000,
    'success_rate' => 45,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001003,
             225000
        ],
         [
            101001006,
             450000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070010013)-> #{
    'score' => 420,
    'break_wait_time' => 43200,
    'success_rate' => 35,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001003,
             300000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'hero_leadership' => 2,
        'power' => 200
    }
};
get(1070010014)-> #{
    'score' => 600,
    'add_skill' => 1040012001,
    'break_wait_time' => 50400,
    'success_rate' => 25,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            101001003,
             375000
        ],
         [
            101001006,
             750000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070010015)-> #{
    'score' => 800,
    'special_effect' => 101011,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 450
    }
};
get(1070010021)-> #{
    'score' => 120,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001003,
             125000
        ],
         [
            101001006,
             250000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 50
    }
};
get(1070010022)-> #{
    'score' => 260,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 100
    }
};
get(1070010023)-> #{
    'score' => 420,
    'special_effect' => 101021,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001003,
             275000
        ],
         [
            101001006,
             550000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070010024)-> #{
    'score' => 600,
    'special_effect' => 101022,
    'break_wait_time' => 45600,
    'success_rate' => 35,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            101001003,
             350000
        ],
         [
            101001006,
             700000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070010025)-> #{
    'score' => 800,
    'add_skill' => 1040021001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 350
    }
};
get(1070010031)-> #{
    'score' => 120,
    'break_wait_time' => 14400,
    'success_rate' => 80,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001006,
             150000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 50
    }
};
get(1070010032)-> #{
    'score' => 260,
    'break_wait_time' => 21600,
    'success_rate' => 70,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 100
    }
};
get(1070010033)-> #{
    'score' => 420,
    'break_wait_time' => 28800,
    'success_rate' => 60,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001006,
             450000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 150
    }
};
get(1070010034)-> #{
    'score' => 600,
    'special_effect' => 101031,
    'break_wait_time' => 36000,
    'success_rate' => 60,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 200
    }
};
get(1070010035)-> #{
    'score' => 800,
    'special_effect' => 101032,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070010041)-> #{
    'score' => 120,
    'special_effect' => 101041,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001003,
             125000
        ],
         [
            101001006,
             250000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 100
    }
};
get(1070010042)-> #{
    'score' => 220,
    'add_skill' => 1040041001,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070010043)-> #{
    'score' => 360,
    'special_effect' => 101042,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001003,
             275000
        ],
         [
            101001006,
             550000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 200
    }
};
get(1070010044)-> #{
    'score' => 520,
    'add_skill' => 1040042001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070010045)-> #{
    'fail_back_rate' => 50
};
get(1070010051)-> #{
    'score' => 120,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001003,
             125000
        ],
         [
            101001006,
             250000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 50
    }
};
get(1070010052)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 100
    }
};
get(1070010053)-> #{
    'score' => 360,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001003,
             275000
        ],
         [
            101001006,
             550000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'fangshi_base_attack' => 40,
        'power' => 250
    }
};
get(1070010054)-> #{
    'score' => 520,
    'add_skill' => 1040051001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070010055)-> #{
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 450
    }
};
get(1070010061)-> #{
    'score' => 120,
    'success_rate' => 65,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001003,
             125000
        ],
         [
            101001006,
             250000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 50
    }
};
get(1070010062)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_infantry_hurt_inc_rate' => 0.15,
        'power' => 150
    }
};
get(1070010063)-> #{
    'score' => 360,
    'add_skill' => 1040061001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001003,
             275000
        ],
         [
            101001006,
             550000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070010064)-> #{
    'score' => 520,
    'add_skill' => 1040062001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070010065)-> #{
    'fail_back_rate' => 50
};
get(1070010071)-> #{
    'score' => 100,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011001,
             20
        ],
         [
            101001003,
             125000
        ],
         [
            101001006,
             250000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_base_attack' => 10,
        'power' => 50
    }
};
get(1070010072)-> #{
    'score' => 220,
    'add_skill' => 1040071001,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011001,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070010073)-> #{
    'score' => 360,
    'add_skill' => 1040072001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011001,
             60
        ],
         [
            101001003,
             275000
        ],
         [
            101001006,
             550000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070010074)-> #{
    'score' => 520,
    'add_skill' => 1040073001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070010075)-> #{
    'score' => 700,
    'add_skill' => 1040074001,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 5,
        'hero_leadership' => 3,
        'power' => 450
    }
};
get(1070010081)-> #{
    'score' => 150,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011001,
             30
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_base_attack' => 20,
        'power' => 50
    }
};
get(1070010082)-> #{
    'score' => 350,
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_base_attack' => 30,
        'power' => 100
    }
};
get(1070010083)-> #{
    'fail_back_rate' => 50
};
get(1070010084)-> #{
    'fail_back_rate' => 50
};
get(1070010085)-> #{
    'fail_back_rate' => 50
};
get(1070010091)-> #{
    'score' => 150,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011001,
             30
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_base_attack' => 20,
        'power' => 50
    }
};
get(1070010092)-> #{
    'score' => 350,
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_base_attack' => 30,
        'power' => 100
    }
};
get(1070010093)-> #{
    'fail_back_rate' => 50
};
get(1070010094)-> #{
    'fail_back_rate' => 50
};
get(1070010095)-> #{
    'fail_back_rate' => 50
};
get(1070010101)-> #{
    'score' => 150,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011001,
             30
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'fangshi_base_attack' => 30,
        'power' => 50
    }
};
get(1070010102)-> #{
    'score' => 350,
    'fail_back_rate' => 50,
    'props' => #{
        'fangshi_base_attack' => 40,
        'power' => 100
    }
};
get(1070010103)-> #{
    'fail_back_rate' => 50
};
get(1070010104)-> #{
    'fail_back_rate' => 50
};
get(1070010105)-> #{
    'fail_back_rate' => 50
};
get(1070010111)-> #{
    'score' => 150,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011001,
             30
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'gongbing_base_attack' => 30,
        'power' => 50
    }
};
get(1070010112)-> #{
    'score' => 350,
    'fail_back_rate' => 50,
    'props' => #{
        'gongbing_base_attack' => 40,
        'power' => 100
    }
};
get(1070010113)-> #{
    'fail_back_rate' => 50
};
get(1070010114)-> #{
    'fail_back_rate' => 50
};
get(1070010115)-> #{
    'fail_back_rate' => 50
};
get(1070010121)-> #{
    'score' => 180,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 200
    }
};
get(1070010122)-> #{
    'score' => 390,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             120
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 250
    }
};
get(1070010123)-> #{
    'score' => 610,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             160
        ],
         [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 300
    }
};
get(1070010124)-> #{
    'score' => 830,
    'special_effect' => 101051,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             200
        ],
         [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 350
    }
};
get(1070010125)-> #{
    'score' => 1050,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'fangshi_hurt_inc_rate' => 0.15,
        'power' => 450
    }
};
get(1070010131)-> #{
    'score' => 180,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            102012013,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 100
    }
};
get(1070010132)-> #{
    'score' => 390,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             120
        ],
         [
            102012013,
             120
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_attack' => 40,
        'houjun_base_attack' => 50,
        'power' => 150
    }
};
get(1070010133)-> #{
    'score' => 610,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             160
        ],
         [
            102012013,
             160
        ],
         [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'nv_spirit' => 2,
        'power' => 200
    }
};
get(1070010134)-> #{
    'score' => 830,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             200
        ],
         [
            102012013,
             200
        ],
         [
            101001005,
             2400000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_hero_skill_hurt_inc_rate' => 0.1,
        'power' => 250
    }
};
get(1070010135)-> #{
    'score' => 1050,
    'add_skill' => 1040131001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070010141)-> #{
    'score' => 180,
    'add_skill' => 1040141001,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070010142)-> #{
    'score' => 390,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             120
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 250
    }
};
get(1070010143)-> #{
    'score' => 610,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             160
        ],
         [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_hero_skill_hurt_red_rate' => -0.05,
        'power' => 300
    }
};
get(1070010144)-> #{
    'score' => 830,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             200
        ],
         [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 350
    }
};
get(1070010145)-> #{
    'score' => 1050,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_hero_skill_hurt_inc_rate' => 0.05,
        'power' => 450
    }
};
get(1070010151)-> #{
    'score' => 180,
    'special_effect' => 101061,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            102012015,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 150
    }
};
get(1070010152)-> #{
    'score' => 390,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             120
        ],
         [
            102012015,
             120
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'power' => 250
    }
};
get(1070010153)-> #{
    'score' => 610,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             160
        ],
         [
            102012015,
             160
        ],
         [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 300
    }
};
get(1070010154)-> #{
    'score' => 830,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             200
        ],
         [
            102012015,
             200
        ],
         [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 350
    }
};
get(1070010155)-> #{
    'score' => 1050,
    'add_skill' => 1040151001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 450
    }
};
get(1070010161)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            102012016,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_though_hurt_inc_rate' => 0.3,
        'bingzhong_though_hurt_inc_rate' => 0.3,
        'power' => 200
    }
};
get(1070010162)-> #{
    'score' => 300,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             120
        ],
         [
            102012016,
             120
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_alchemist_hurt_inc_rate' => 0.3,
        'bingzhong_alchemist_hurt_inc_rate' => 0.3,
        'power' => 250
    }
};
get(1070010163)-> #{
    'score' => 460,
    'add_skill' => 1040161001,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             160
        ],
         [
            102012016,
             160
        ],
         [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 300
    }
};
get(1070010164)-> #{
    'score' => 730,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             200
        ],
         [
            102012016,
             200
        ],
         [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_though_hurt_red_rate' => -0.3,
        'bingzhong_defence' => 100,
        'power' => 350
    }
};
get(1070010165)-> #{
    'score' => 910,
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_alchemist_hurt_red_rate' => -0.3,
        'bingzhong_defence' => 100,
        'power' => 400
    }
};
get(1070010171)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             80
        ],
         [
            102012017,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_cavalry_hurt_inc_rate' => 0.1,
        'bingzhong_cavalry_hurt_inc_rate' => 0.1,
        'hero_strength' => 1,
        'power' => 200
    }
};
get(1070010172)-> #{
    'score' => 300,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             120
        ],
         [
            102012017,
             120
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'power' => 250
    }
};
get(1070010173)-> #{
    'score' => 460,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             160
        ],
         [
            102012017,
             160
        ],
         [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_cavalry_hurt_inc_rate' => 0.1,
        'bingzhong_cavalry_hurt_inc_rate' => 0.1,
        'hero_strength' => 2,
        'power' => 300
    }
};
get(1070010174)-> #{
    'score' => 730,
    'add_skill' => 1040171001,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011001,
             200
        ],
         [
            102012017,
             200
        ],
         [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 350
    }
};
get(1070010175)-> #{
    'score' => 910,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_cavalry_hurt_inc_rate' => 0.2,
        'bingzhong_cavalry_hurt_inc_rate' => 0.2,
        'hero_strength' => 3,
        'power' => 450
    }
};
get(1070020011)-> #{
    'score' => 120,
    'break_wait_time' => 14400,
    'success_rate' => 80,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            101001004,
             50000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_attack' => 10,
        'hero_leadership' => 1,
        'power' => 50
    }
};
get(1070020012)-> #{
    'score' => 220,
    'add_skill' => 1040181001,
    'break_wait_time' => 21600,
    'success_rate' => 70,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            101001004,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 100
    }
};
get(1070020013)-> #{
    'score' => 360,
    'break_wait_time' => 28800,
    'success_rate' => 60,
    'consume' => [
        [
            102011002,
             80
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'power' => 150
    }
};
get(1070020014)-> #{
    'score' => 520,
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_base_defence' => 20,
        'hero_intelect' => 1,
        'power' => 250
    }
};
get(1070020015)-> #{
    'fail_back_rate' => 50
};
get(1070020021)-> #{
    'score' => 120,
    'add_skill' => 1040191001,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            101001004,
             80000
        ],
         [
            101001005,
             80000
        ]
    ],
    'fail_back_rate' => 50
};
get(1070020022)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            101001004,
             160000
        ],
         [
            101001005,
             160000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_attack' => 20,
        'qianjun_speed' => 3,
        'power' => 100
    }
};
get(1070020023)-> #{
    'score' => 360,
    'add_skill' => 1040192001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011002,
             60
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_troops' => 50,
        'power' => 150
    }
};
get(1070020024)-> #{
    'score' => 520,
    'break_wait_time' => 0,
    'success_rate' => 0,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_spirit' => 1,
        'power' => 200
    }
};
get(1070020025)-> #{
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 50
    }
};
get(1070020031)-> #{
    'score' => 120,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            101001004,
             80000
        ],
         [
            101001005,
             80000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'hero_leadership' => 2
    }
};
get(1070020032)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            101001004,
             160000
        ],
         [
            101001005,
             160000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'march_speed_multi' => 0.1,
        'power' => 150
    }
};
get(1070020033)-> #{
    'score' => 360,
    'add_skill' => 1040201001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011002,
             60
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070020034)-> #{
    'score' => 520,
    'break_wait_time' => 0,
    'success_rate' => 0,
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_base_attack' => 30,
        'power' => 250
    }
};
get(1070020035)-> #{
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070020041)-> #{
    'score' => 120,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            101001004,
             80000
        ],
         [
            101001005,
             80000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_base_attack' => 10
    }
};
get(1070020042)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            101001004,
             160000
        ],
         [
            101001005,
             160000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_infantry_hurt_inc_rate' => 0.1,
        'power' => 100
    }
};
get(1070020043)-> #{
    'score' => 360,
    'add_skill' => 1040211001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011002,
             60
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070020044)-> #{
    'score' => 520,
    'add_skill' => 1040212001,
    'break_wait_time' => 0,
    'success_rate' => 0,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070020045)-> #{
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 50
    }
};
get(1070020051)-> #{
    'score' => 120,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            101001004,
             80000
        ],
         [
            101001005,
             80000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'march_speed_multi' => 0.1
    }
};
get(1070020052)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            101001004,
             160000
        ],
         [
            101001005,
             160000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_speed' => 6,
        'power' => 100
    }
};
get(1070020053)-> #{
    'score' => 360,
    'add_skill' => 1040221001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011002,
             60
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070020054)-> #{
    'score' => 520,
    'add_skill' => 1040222001,
    'break_wait_time' => 0,
    'success_rate' => 0,
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_speed' => 6,
        'power' => 200
    }
};
get(1070020055)-> #{
    'score' => 120,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 50
    }
};
get(1070020061)-> #{
    'score' => 120,
    'break_wait_time' => 14400,
    'success_rate' => 80,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            101001004,
             50000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_attack' => 10,
        'wuhoujun_attack' => 10,
        'power' => 50
    }
};
get(1070020062)-> #{
    'score' => 260,
    'break_wait_time' => 21600,
    'success_rate' => 70,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            101001004,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'wuqianjun_speed' => 3,
        'power' => 100
    }
};
get(1070020063)-> #{
    'score' => 420,
    'add_skill' => 1040231001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070020064)-> #{
    'fail_back_rate' => 50
};
get(1070020065)-> #{
    'fail_back_rate' => 50
};
get(1070020071)-> #{
    'score' => 150,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             80
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_spirit' => 1,
        'power' => 100
    }
};
get(1070020072)-> #{
    'score' => 300,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             120
        ],
         [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_attack' => 50,
        'qibing_troops' => 30,
        'power' => 150
    }
};
get(1070020073)-> #{
    'score' => 480,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             160
        ],
         [
            101001004,
             720000
        ],
         [
            101001005,
             720000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_defence' => 40,
        'qibing_troops' => 30,
        'power' => 200
    }
};
get(1070020074)-> #{
    'score' => 680,
    'add_skill' => 1040241001,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             200
        ],
         [
            101001004,
             960000
        ],
         [
            101001005,
             960000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 300
    }
};
get(1070020075)-> #{
    'score' => 900,
    'add_skill' => 1040242001,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 350
    }
};
get(1070020081)-> #{
    'score' => 150,
    'break_wait_time' => 21600,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             20
        ],
         [
            102012025,
             40
        ],
         [
            101001004,
             120000
        ],
         [
            101001005,
             120000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 100
    }
};
get(1070020082)-> #{
    'score' => 300,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             40
        ],
         [
            102012025,
             60
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_defence' => 80,
        'power' => 150
    }
};
get(1070020083)-> #{
    'score' => 500,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             60
        ],
         [
            102012025,
             80
        ],
         [
            101001004,
             360000
        ],
         [
            101001005,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'gongbing_attack' => 100,
        'power' => 200
    }
};
get(1070020084)-> #{
    'score' => 750,
    'add_skill' => 1040251001,
    'break_wait_time' => 64800,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             80
        ],
         [
            102012025,
             100
        ],
         [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'bubing_troops_skill_hurt_red_rate' => -0.15,
        'power' => 300
    }
};
get(1070020085)-> #{
    'score' => 1050,
    'add_skill' => 1040252001,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'bubing_cavalry_hurt_inc_rate' => 0.35,
        'power' => 350
    }
};
get(1070020091)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             80
        ],
         [
            102012026,
             80
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'hero_leadership' => 1,
        'power' => 200
    }
};
get(1070020092)-> #{
    'score' => 300,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             120
        ],
         [
            102012026,
             120
        ],
         [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_speed' => 3,
        'wenqianjun_speed' => 3,
        'power' => 250
    }
};
get(1070020093)-> #{
    'score' => 480,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             160
        ],
         [
            102012026,
             160
        ],
         [
            101001004,
             720000
        ],
         [
            101001005,
             720000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'hero_spirit' => 2,
        'power' => 300
    }
};
get(1070020094)-> #{
    'score' => 680,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             200
        ],
         [
            102012026,
             200
        ],
         [
            101001004,
             960000
        ],
         [
            101001005,
             960000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'march_speed_multi' => 0.15,
        'power' => 350
    }
};
get(1070020095)-> #{
    'score' => 900,
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_speed' => 5,
        'wenhoujun_speed' => 5,
        'power' => 450
    }
};
get(1070020101)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             80
        ],
         [
            102012027,
             80
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'hero_leadership' => 1,
        'power' => 200
    }
};
get(1070020102)-> #{
    'score' => 300,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             120
        ],
         [
            102012027,
             120
        ],
         [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_attack' => 40,
        'bubing_troops' => 50,
        'power' => 200
    }
};
get(1070020103)-> #{
    'score' => 480,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             160
        ],
         [
            102012027,
             160
        ],
         [
            101001004,
             720000
        ],
         [
            101001005,
             720000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_defence' => 40,
        'bubing_troops' => 50,
        'power' => 250
    }
};
get(1070020104)-> #{
    'score' => 680,
    'add_skill' => 1040271001,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102011002,
             200
        ],
         [
            102012027,
             200
        ],
         [
            101001004,
             960000
        ],
         [
            101001005,
             960000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 350
    }
};
get(1070020105)-> #{
    'score' => 900,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'hero_leadership' => 2,
        'power' => 450
    }
};
get(1070030011)-> #{
    'score' => 100,
    'break_wait_time' => 19200,
    'success_rate' => 55,
    'consume' => [
        [
            102011003,
             40
        ],
         [
            101001005,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 50
    }
};
get(1070030012)-> #{
    'score' => 220,
    'break_wait_time' => 26400,
    'success_rate' => 50,
    'consume' => [
        [
            102011003,
             60
        ],
         [
            101001005,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 100
    }
};
get(1070030013)-> #{
    'score' => 360,
    'break_wait_time' => 33600,
    'success_rate' => 45,
    'consume' => [
        [
            102011003,
             80
        ],
         [
            101001005,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 150
    }
};
get(1070030014)-> #{
    'score' => 520,
    'special_effect' => 101071,
    'break_wait_time' => 40800,
    'success_rate' => 40,
    'consume' => [
        [
            102011003,
             100
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 200
    }
};
get(1070030015)-> #{
    'score' => 700,
    'special_effect' => 101072,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070030021)-> #{
    'score' => 150,
    'break_wait_time' => 28800,
    'success_rate' => 55,
    'consume' => [
        [
            102011003,
             40
        ],
         [
            102012029,
             80
        ],
         [
            101001004,
             120000
        ],
         [
            101001005,
             120000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 50
    }
};
get(1070030022)-> #{
    'score' => 270,
    'add_skill' => 1040291001,
    'break_wait_time' => 36000,
    'success_rate' => 50,
    'consume' => [
        [
            102011003,
             60
        ],
         [
            102012029,
             120
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 100
    }
};
get(1070030023)-> #{
    'score' => 410,
    'break_wait_time' => 43200,
    'success_rate' => 45,
    'consume' => [
        [
            102011003,
             80
        ],
         [
            102012029,
             160
        ],
         [
            101001004,
             360000
        ],
         [
            101001005,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'power' => 150
    }
};
get(1070030024)-> #{
    'score' => 580,
    'add_skill' => 1040292001,
    'break_wait_time' => 50400,
    'success_rate' => 40,
    'consume' => [
        [
            102011003,
             100
        ],
         [
            102012029,
             200
        ],
         [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070030025)-> #{
    'score' => 800,
    'special_effect' => 101081,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070030031)-> #{
    'score' => 100,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011003,
             40
        ],
         [
            101001005,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 50
    }
};
get(1070030032)-> #{
    'score' => 220,
    'break_wait_time' => 26400,
    'success_rate' => 60,
    'consume' => [
        [
            102011003,
             60
        ],
         [
            101001005,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 100
    }
};
get(1070030033)-> #{
    'score' => 360,
    'break_wait_time' => 33600,
    'success_rate' => 50,
    'consume' => [
        [
            102011003,
             80
        ],
         [
            101001005,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 150
    }
};
get(1070030034)-> #{
    'score' => 520,
    'special_effect' => 101091,
    'break_wait_time' => 40800,
    'success_rate' => 40,
    'consume' => [
        [
            102011003,
             100
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 200
    }
};
get(1070030035)-> #{
    'score' => 700,
    'special_effect' => 101092,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070030041)-> #{
    'score' => 100,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011003,
             20
        ],
         [
            101001005,
             100000
        ],
         [
            101001006,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 50
    }
};
get(1070030042)-> #{
    'score' => 220,
    'special_effect' => 101101,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011003,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 100
    }
};
get(1070030043)-> #{
    'score' => 360,
    'add_skill' => 1040311001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011003,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070030044)-> #{
    'score' => 520,
    'special_effect' => 101102,
    'break_wait_time' => 81600,
    'success_rate' => 100,
    'consume' => [
        [
            102011003,
             200
        ],
         [
            101001005,
             1000000
        ],
         [
            101001006,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070030045)-> #{
    'score' => 700,
    'add_skill' => 1040312001,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'hero_leadership' => 2,
        'power' => 250
    }
};
get(1070030051)-> #{
    'score' => 100,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011003,
             40
        ],
         [
            101001005,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 50
    }
};
get(1070030052)-> #{
    'score' => 300,
    'add_skill' => 1040321001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070030053)-> #{
    'fail_back_rate' => 50
};
get(1070030054)-> #{
    'fail_back_rate' => 50
};
get(1070030055)-> #{
    'fail_back_rate' => 50
};
get(1070030061)-> #{
    'score' => 100,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011003,
             40
        ],
         [
            101001005,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 50
    }
};
get(1070030062)-> #{
    'score' => 260,
    'add_skill' => 1040331001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070030063)-> #{
    'fail_back_rate' => 50
};
get(1070030064)-> #{
    'fail_back_rate' => 50
};
get(1070030065)-> #{
    'fail_back_rate' => 50
};
get(1070030071)-> #{
    'score' => 150,
    'break_wait_time' => 21600,
    'success_rate' => 100,
    'consume' => [
        [
            102012034,
             20
        ],
         [
            101001005,
             120000
        ],
         [
            101001006,
             120000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_base_defence' => 20,
        'power' => 50
    }
};
get(1070030072)-> #{
    'score' => 360,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012034,
             40
        ],
         [
            101001005,
             240000
        ],
         [
            101001006,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_base_attack' => 30,
        'power' => 100
    }
};
get(1070030073)-> #{
    'score' => 590,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012034,
             80
        ],
         [
            101001005,
             360000
        ],
         [
            101001006,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_speed' => 10,
        'power' => 150
    }
};
get(1070030074)-> #{
    'score' => 840,
    'special_effect' => 101111,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012034,
             120
        ],
         [
            101001005,
             480000
        ],
         [
            101001006,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_troops' => 100,
        'power' => 200
    }
};
get(1070030075)-> #{
    'score' => 1110,
    'special_effect' => 101112,
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_troops' => 200,
        'power' => 250
    }
};
get(1070030081)-> #{
    'score' => 100,
    'break_wait_time' => 0,
    'success_rate' => 100,
    'consume' => [
        [
            102012035,
             40
        ],
         [
            102011003,
             40
        ],
         [
            101001005,
             240000
        ],
         [
            101001006,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 50
    }
};
get(1070030082)-> #{
    'score' => 220,
    'break_wait_time' => 0,
    'success_rate' => 100,
    'consume' => [
        [
            102012035,
             60
        ],
         [
            102011003,
             60
        ],
         [
            101001005,
             360000
        ],
         [
            101001006,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_defence' => 50,
        'houjun_defence' => 40,
        'power' => 100
    }
};
get(1070030083)-> #{
    'score' => 360,
    'break_wait_time' => 0,
    'success_rate' => 100,
    'consume' => [
        [
            102012035,
             80
        ],
         [
            102011003,
             80
        ],
         [
            101001005,
             480000
        ],
         [
            101001006,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_attack' => 50,
        'houjun_attack' => 70,
        'power' => 150
    }
};
get(1070030084)-> #{
    'score' => 520,
    'break_wait_time' => 0,
    'success_rate' => 100,
    'consume' => [
        [
            102012035,
             100
        ],
         [
            102011003,
             100
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 200
    }
};
get(1070030085)-> #{
    'score' => 700,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_hero_skill_hurt_inc_rate' => 0.15,
        'power' => 250
    }
};
get(1070030091)-> #{
    'score' => 150,
    'add_skill' => 1040361001,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102012036,
             80
        ],
         [
            102011003,
             80
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070030092)-> #{
    'score' => 270,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012036,
             120
        ],
         [
            102011003,
             120
        ],
         [
            101001005,
             450000
        ],
         [
            101001006,
             450000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'hero_leadership' => 1,
        'power' => 200
    }
};
get(1070030093)-> #{
    'score' => 410,
    'add_skill' => 1040362001,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102012036,
             160
        ],
         [
            102011003,
             160
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070030094)-> #{
    'score' => 580,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012036,
             200
        ],
         [
            102011003,
             200
        ],
         [
            101001005,
             750000
        ],
         [
            101001006,
             750000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'hero_spirit' => 3,
        'power' => 350
    }
};
get(1070030095)-> #{
    'score' => 800,
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_speed' => 5,
        'chuanqi_speed' => 10,
        'power' => 400
    }
};
get(1070030101)-> #{
    'score' => 150,
    'add_skill' => 1040371001,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102012037,
             80
        ],
         [
            102011003,
             80
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070030102)-> #{
    'score' => 270,
    'special_effect' => 101121,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012037,
             120
        ],
         [
            102011003,
             120
        ],
         [
            101001005,
             450000
        ],
         [
            101001006,
             450000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 200
    }
};
get(1070030103)-> #{
    'score' => 410,
    'add_skill' => 1040372001,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102012037,
             160
        ],
         [
            102011003,
             160
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070030104)-> #{
    'score' => 580,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012037,
             200
        ],
         [
            102011003,
             200
        ],
         [
            101001005,
             750000
        ],
         [
            101001006,
             750000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'bingzhong_troops' => 300,
        'power' => 350
    }
};
get(1070030105)-> #{
    'score' => 800,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'bingzhong_troops' => 300,
        'power' => 400
    }
};
get(1070030111)-> #{
    'score' => 150,
    'special_effect' => 101131,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102012038,
             80
        ],
         [
            102011003,
             80
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'power' => 150
    }
};
get(1070030112)-> #{
    'score' => 270,
    'special_effect' => 101132,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012038,
             120
        ],
         [
            102011003,
             120
        ],
         [
            101001005,
             450000
        ],
         [
            101001006,
             450000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 200
    }
};
get(1070030113)-> #{
    'score' => 410,
    'add_skill' => 1040381001,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102012038,
             160
        ],
         [
            102011003,
             160
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070030114)-> #{
    'score' => 580,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012038,
             200
        ],
         [
            102011003,
             200
        ],
         [
            101001005,
             750000
        ],
         [
            101001006,
             750000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_troops_skill_hurt_inc' => 0.15,
        'power' => 350
    }
};
get(1070030115)-> #{
    'score' => 800,
    'add_skill' => 1040382001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070040011)-> #{
    'score' => 100,
    'break_wait_time' => 24000,
    'success_rate' => 70,
    'consume' => [
        [
            102011004,
             40
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'power' => 50
    }
};
get(1070040012)-> #{
    'score' => 220,
    'break_wait_time' => 31200,
    'success_rate' => 60,
    'consume' => [
        [
            102011004,
             60
        ],
         [
            101001003,
             600000
        ],
         [
            101001004,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 100
    }
};
get(1070040013)-> #{
    'score' => 360,
    'special_effect' => 101141,
    'break_wait_time' => 38400,
    'success_rate' => 50,
    'consume' => [
        [
            102011004,
             80
        ],
         [
            101001003,
             800000
        ],
         [
            101001004,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 150
    }
};
get(1070040014)-> #{
    'score' => 520,
    'special_effect' => 101142,
    'break_wait_time' => 45600,
    'success_rate' => 40,
    'consume' => [
        [
            102011004,
             100
        ],
         [
            101001003,
             1000000
        ],
         [
            101001004,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'hero_leadership' => 3,
        'power' => 300
    }
};
get(1070040015)-> #{
    'score' => 800,
    'special_effect' => 101143,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070040021)-> #{
    'score' => 100,
    'special_effect' => 101151,
    'break_wait_time' => 24000,
    'success_rate' => 65,
    'consume' => [
        [
            102011004,
             20
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 50
    }
};
get(1070040022)-> #{
    'score' => 220,
    'special_effect' => 101152,
    'break_wait_time' => 31200,
    'success_rate' => 55,
    'consume' => [
        [
            102011004,
             40
        ],
         [
            101001003,
             300000
        ],
         [
            101001004,
             150000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070040023)-> #{
    'score' => 360,
    'add_skill' => 1040401001,
    'break_wait_time' => 38400,
    'success_rate' => 45,
    'consume' => [
        [
            102011004,
             60
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070040024)-> #{
    'score' => 520,
    'special_effect' => 101153,
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => -0.1,
        'power' => 200
    }
};
get(1070040025)-> #{
    'fail_back_rate' => 50
};
get(1070040031)-> #{
    'score' => 100,
    'break_wait_time' => 16800,
    'success_rate' => 80,
    'consume' => [
        [
            102011004,
             20
        ],
         [
            101001003,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 50
    }
};
get(1070040032)-> #{
    'score' => 250,
    'add_skill' => 1040411001,
    'break_wait_time' => 24000,
    'success_rate' => 70,
    'consume' => [
        [
            102011004,
             40
        ],
         [
            101001003,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070040033)-> #{
    'score' => 420,
    'add_skill' => 1040412001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070040034)-> #{
    'fail_back_rate' => 50
};
get(1070040035)-> #{
    'fail_back_rate' => 50
};
get(1070040041)-> #{
    'score' => 100,
    'break_wait_time' => 16800,
    'success_rate' => 80,
    'consume' => [
        [
            102011004,
             20
        ],
         [
            101001003,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 50
    }
};
get(1070040042)-> #{
    'score' => 250,
    'add_skill' => 1040421001,
    'break_wait_time' => 24000,
    'success_rate' => 70,
    'consume' => [
        [
            102011004,
             40
        ],
         [
            101001003,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070040043)-> #{
    'score' => 420,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 200
    }
};
get(1070040044)-> #{
    'fail_back_rate' => 50
};
get(1070040045)-> #{
    'fail_back_rate' => 50
};
get(1070040051)-> #{
    'score' => 100,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011004,
             40
        ],
         [
            101001003,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_defence' => 20,
        'houjun_defence' => 10,
        'power' => 50
    }
};
get(1070040052)-> #{
    'score' => 250,
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => -0.1,
        'power' => 100
    }
};
get(1070040053)-> #{
    'fail_back_rate' => 50
};
get(1070040054)-> #{
    'fail_back_rate' => 50
};
get(1070040055)-> #{
    'fail_back_rate' => 50
};
get(1070040061)-> #{
    'score' => 100,
    'break_wait_time' => 19200,
    'success_rate' => 70,
    'consume' => [
        [
            102011004,
             40
        ],
         [
            101001003,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'march_speed_multi' => 0.05,
        'power' => 50
    }
};
get(1070040062)-> #{
    'score' => 250,
    'add_skill' => 1040441001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070040063)-> #{
    'fail_back_rate' => 50
};
get(1070040064)-> #{
    'fail_back_rate' => 50
};
get(1070040065)-> #{
    'fail_back_rate' => 50
};
get(1070040071)-> #{
    'score' => 150,
    'break_wait_time' => 21600,
    'success_rate' => 100,
    'consume' => [
        [
            102012045,
             20
        ],
         [
            101001003,
             100000
        ],
         [
            101001004,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_defence' => 20,
        'power' => 100
    }
};
get(1070040072)-> #{
    'score' => 360,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012045,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_attack' => 30,
        'power' => 150
    }
};
get(1070040073)-> #{
    'score' => 590,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012045,
             80
        ],
         [
            101001003,
             300000
        ],
         [
            101001004,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_speed' => 10,
        'power' => 200
    }
};
get(1070040074)-> #{
    'score' => 840,
    'special_effect' => 101161,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012045,
             120
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_troops' => 100,
        'power' => 300
    }
};
get(1070040075)-> #{
    'score' => 1110,
    'special_effect' => 101162,
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_troops' => 200,
        'power' => 300
    }
};
get(1070040081)-> #{
    'score' => 150,
    'break_wait_time' => 21600,
    'success_rate' => 100,
    'consume' => [
        [
            102012046,
             20
        ],
         [
            102011004,
             20
        ],
         [
            101001003,
             100000
        ],
         [
            101001004,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 100
    }
};
get(1070040082)-> #{
    'score' => 330,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012046,
             40
        ],
         [
            102011004,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 150
    }
};
get(1070040083)-> #{
    'score' => 540,
    'add_skill' => 1040461001,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012046,
             60
        ],
         [
            102011004,
             60
        ],
         [
            101001003,
             300000
        ],
         [
            101001004,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070040084)-> #{
    'score' => 780,
    'break_wait_time' => 64800,
    'success_rate' => 100,
    'consume' => [
        [
            102012046,
             100
        ],
         [
            102011004,
             80
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'nan_spirit' => 1,
        'power' => 250
    }
};
get(1070040085)-> #{
    'score' => 1050,
    'add_skill' => 1040462001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 350
    }
};
get(1070040091)-> #{
    'score' => 180,
    'break_wait_time' => 36000,
    'success_rate' => 0,
    'consume' => [
        [
            102012047,
             80
        ],
         [
            102011004,
             40
        ],
         [
            101001005,
             150000
        ],
         [
            101001006,
             150000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 100
    }
};
get(1070040092)-> #{
    'score' => 370,
    'break_wait_time' => 43200,
    'success_rate' => 0,
    'consume' => [
        [
            102012047,
             120
        ],
         [
            102011004,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => -0.1,
        'power' => 150
    }
};
get(1070040093)-> #{
    'score' => 580,
    'add_skill' => 1040471001,
    'break_wait_time' => 50400,
    'success_rate' => 0,
    'consume' => [
        [
            102012047,
             160
        ],
         [
            102011004,
             80
        ],
         [
            101001005,
             450000
        ],
         [
            101001006,
             450000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070040094)-> #{
    'score' => 820,
    'break_wait_time' => 57600,
    'success_rate' => 0,
    'consume' => [
        [
            102012047,
             200
        ],
         [
            102011004,
             100
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_leadership' => 3,
        'power' => 250
    }
};
get(1070040095)-> #{
    'score' => 1080,
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_hurt_inc_rate' => 0.2,
        'power' => 350
    }
};
get(1070040101)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 0,
    'consume' => [
        [
            102012048,
             80
        ],
         [
            102011004,
             80
        ],
         [
            101001005,
             360000
        ],
         [
            101001006,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 150
    }
};
get(1070040102)-> #{
    'score' => 330,
    'break_wait_time' => 43200,
    'success_rate' => 0,
    'consume' => [
        [
            102012048,
             120
        ],
         [
            102011004,
             120
        ],
         [
            101001005,
             540000
        ],
         [
            101001006,
             540000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 200
    }
};
get(1070040103)-> #{
    'score' => 540,
    'special_effect' => 101171,
    'break_wait_time' => 50400,
    'success_rate' => 0,
    'consume' => [
        [
            102012048,
             160
        ],
         [
            102011004,
             160
        ],
         [
            101001005,
             720000
        ],
         [
            101001006,
             720000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'power' => 250
    }
};
get(1070040104)-> #{
    'score' => 780,
    'break_wait_time' => 57600,
    'success_rate' => 0,
    'consume' => [
        [
            102012048,
             200
        ],
         [
            102011004,
             200
        ],
         [
            101001005,
             900000
        ],
         [
            101001006,
             900000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_leadership' => 2,
        'power' => 300
    }
};
get(1070040105)-> #{
    'score' => 1050,
    'add_skill' => 1040481001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070040111)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 0,
    'consume' => [
        [
            102012049,
             80
        ],
         [
            102011004,
             80
        ],
         [
            101001005,
             360000
        ],
         [
            101001006,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 150
    }
};
get(1070040112)-> #{
    'score' => 330,
    'break_wait_time' => 43200,
    'success_rate' => 0,
    'consume' => [
        [
            102012049,
             120
        ],
         [
            102011004,
             120
        ],
         [
            101001005,
             540000
        ],
         [
            101001006,
             540000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_woman_hurt_red_rate' => -0.2,
        'hero_leadership' => 1,
        'power' => 200
    }
};
get(1070040113)-> #{
    'score' => 540,
    'break_wait_time' => 50400,
    'success_rate' => 0,
    'consume' => [
        [
            102012049,
             160
        ],
         [
            102011004,
             160
        ],
         [
            101001005,
             720000
        ],
         [
            101001006,
             720000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 250
    }
};
get(1070040114)-> #{
    'score' => 780,
    'break_wait_time' => 57600,
    'success_rate' => 0,
    'consume' => [
        [
            102012049,
             200
        ],
         [
            102011004,
             200
        ],
         [
            101001005,
             900000
        ],
         [
            101001006,
             900000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_woman_hurt_inc_rate' => 0.2,
        'bingzhong_woman_hurt_inc_rate' => 0.2,
        'power' => 300
    }
};
get(1070040115)-> #{
    'score' => 1050,
    'add_skill' => 1040491001,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 400
    }
};
get(1070050011)-> #{
    'score' => 100,
    'break_wait_time' => 26400,
    'success_rate' => 65,
    'consume' => [
        [
            102011005,
             20
        ],
         [
            101001005,
             100000
        ],
         [
            101001006,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 50
    }
};
get(1070050012)-> #{
    'score' => 220,
    'break_wait_time' => 33600,
    'success_rate' => 55,
    'consume' => [
        [
            102011005,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 100
    }
};
get(1070050013)-> #{
    'score' => 360,
    'break_wait_time' => 40800,
    'success_rate' => 45,
    'consume' => [
        [
            102011005,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 150
    }
};
get(1070050014)-> #{
    'score' => 520,
    'break_wait_time' => 48000,
    'success_rate' => 35,
    'consume' => [
        [
            102011005,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 200
    }
};
get(1070050015)-> #{
    'score' => 700,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 250
    }
};
get(1070050021)-> #{
    'score' => 100,
    'break_wait_time' => 26400,
    'success_rate' => 65,
    'consume' => [
        [
            102011005,
             20
        ],
         [
            101001005,
             100000
        ],
         [
            101001006,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 50
    }
};
get(1070050022)-> #{
    'score' => 220,
    'break_wait_time' => 33600,
    'success_rate' => 55,
    'consume' => [
        [
            102011005,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 100
    }
};
get(1070050023)-> #{
    'score' => 360,
    'break_wait_time' => 40800,
    'success_rate' => 45,
    'consume' => [
        [
            102011005,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 150
    }
};
get(1070050024)-> #{
    'score' => 520,
    'break_wait_time' => 48000,
    'success_rate' => 35,
    'consume' => [
        [
            102011005,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 200
    }
};
get(1070050025)-> #{
    'score' => 700,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 250
    }
};
get(1070050031)-> #{
    'score' => 100,
    'break_wait_time' => 26400,
    'success_rate' => 65,
    'consume' => [
        [
            102011005,
             20
        ],
         [
            101001005,
             100000
        ],
         [
            101001006,
             100000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 50
    }
};
get(1070050032)-> #{
    'score' => 220,
    'break_wait_time' => 33600,
    'success_rate' => 55,
    'consume' => [
        [
            102011005,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 100
    }
};
get(1070050033)-> #{
    'score' => 360,
    'break_wait_time' => 40800,
    'success_rate' => 45,
    'consume' => [
        [
            102011005,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 150
    }
};
get(1070050034)-> #{
    'score' => 520,
    'break_wait_time' => 48000,
    'success_rate' => 35,
    'consume' => [
        [
            102011005,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 200
    }
};
get(1070050035)-> #{
    'score' => 700,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 250
    }
};
get(1070050041)-> #{
    'score' => 150,
    'break_wait_time' => 21600,
    'success_rate' => 100,
    'consume' => [
        [
            102012053,
             20
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_generalist_hurt_inc_rate' => 0.1,
        'bingzhong_generalist_hurt_inc_rate' => 0.1,
        'wu_generalist_hurt_inc_rate' => 0.1,
        'power' => 100
    }
};
get(1070050042)-> #{
    'score' => 360,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012053,
             40
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_general_hurt_inc_rate' => 0.1,
        'bingzhong_general_hurt_inc_rate' => 0.1,
        'wen_general_hurt_inc_rate' => 0.1,
        'power' => 150
    }
};
get(1070050043)-> #{
    'score' => 590,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012053,
             80
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_civilian_hurt_inc_rate' => 0.1,
        'bingzhong_civilian_hurt_inc_rate' => 0.1,
        'quan_civilian_hurt_inc_rate' => 0.1,
        'power' => 200
    }
};
get(1070050044)-> #{
    'score' => 840,
    'special_effect' => 101181,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012053,
             100
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 350
    }
};
get(1070050045)-> #{
    'score' => 1110,
    'special_effect' => 101182,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070050051)-> #{
    'score' => 150,
    'add_skill' => 1040541001,
    'break_wait_time' => 21600,
    'success_rate' => 100,
    'consume' => [
        [
            102012054,
             40
        ],
         [
            102011005,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070050052)-> #{
    'score' => 330,
    'add_skill' => 1040542001,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012054,
             60
        ],
         [
            102011005,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070050053)-> #{
    'score' => 540,
    'add_skill' => 1040543001,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012054,
             80
        ],
         [
            102011005,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070050054)-> #{
    'score' => 780,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012054,
             100
        ],
         [
            102011005,
             100
        ],
         [
            101001005,
             500000
        ],
         [
            101001006,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1,
        'power' => 250
    }
};
get(1070050055)-> #{
    'score' => 1050,
    'add_skill' => 1040544001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070050061)-> #{
    'score' => 150,
    'break_wait_time' => 33200,
    'success_rate' => 100,
    'consume' => [
        [
            102012055,
             80
        ],
         [
            102011005,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 100
    }
};
get(1070050062)-> #{
    'score' => 330,
    'break_wait_time' => 40400,
    'success_rate' => 100,
    'consume' => [
        [
            102012055,
             120
        ],
         [
            102011005,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'power' => 150
    }
};
get(1070050063)-> #{
    'score' => 540,
    'break_wait_time' => 47600,
    'success_rate' => 100,
    'consume' => [
        [
            102012055,
             160
        ],
         [
            102011005,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'houjun_troops' => 200,
        'power' => 200
    }
};
get(1070050064)-> #{
    'score' => 780,
    'break_wait_time' => 54800,
    'success_rate' => 100,
    'consume' => [
        [
            102012055,
             200
        ],
         [
            102011005,
             100
        ],
         [
            101001005,
             500000
        ],
         [
            101001006,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'qianjun_troops' => 300,
        'power' => 250
    }
};
get(1070050065)-> #{
    'score' => 1050,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'houjun_troops' => 300,
        'power' => 400
    }
};
get(1070050071)-> #{
    'score' => 150,
    'break_wait_time' => 36000,
    'success_rate' => 100,
    'consume' => [
        [
            102012056,
             80
        ],
         [
            102011005,
             40
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'bubing_troops' => 400,
        'power' => 100
    }
};
get(1070050072)-> #{
    'score' => 330,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012056,
             120
        ],
         [
            102011005,
             60
        ],
         [
            101001005,
             300000
        ],
         [
            101001006,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'qibing_troops' => 400,
        'power' => 150
    }
};
get(1070050073)-> #{
    'score' => 540,
    'break_wait_time' => 50400,
    'success_rate' => 100,
    'consume' => [
        [
            102012056,
             160
        ],
         [
            102011005,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'gongbing_troops' => 400,
        'power' => 200
    }
};
get(1070050074)-> #{
    'score' => 780,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012056,
             200
        ],
         [
            102011005,
             100
        ],
         [
            101001005,
             500000
        ],
         [
            101001006,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'fangshi_troops' => 400,
        'power' => 250
    }
};
get(1070050075)-> #{
    'score' => 1050,
    'add_skill' => 1040561001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070050081)-> #{
    'score' => 150,
    'break_wait_time' => 33200,
    'success_rate' => 100,
    'consume' => [
        [
            102012057,
             80
        ],
         [
            102011005,
             40
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'hero_spirit' => 2,
        'power' => 100
    }
};
get(1070050082)-> #{
    'score' => 330,
    'break_wait_time' => 40400,
    'success_rate' => 100,
    'consume' => [
        [
            102012057,
             120
        ],
         [
            102011005,
             60
        ],
         [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_hero_skill_hurt_inc_rate' => 0.15,
        'power' => 150
    }
};
get(1070050083)-> #{
    'score' => 540,
    'break_wait_time' => 47600,
    'success_rate' => 100,
    'consume' => [
        [
            102012057,
             160
        ],
         [
            102011005,
             80
        ],
         [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_troops_skill_hurt_inc_rate' => 0.15,
        'power' => 200
    }
};
get(1070050084)-> #{
    'score' => 780,
    'break_wait_time' => 54800,
    'success_rate' => 100,
    'consume' => [
        [
            102012057,
             200
        ],
         [
            102011005,
             100
        ],
         [
            101001005,
             2000000
        ],
         [
            101001006,
             2000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 2,
        'power' => 250
    }
};
get(1070050085)-> #{
    'score' => 1050,
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_attack' => 300,
        'chuanqibingzhong_attack' => 300,
        'power' => 400
    }
};
get(1070050091)-> #{
    'score' => 150,
    'break_wait_time' => 33200,
    'success_rate' => 100,
    'consume' => [
        [
            102012058,
             80
        ],
         [
            102011005,
             40
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'power' => 100
    }
};
get(1070050092)-> #{
    'score' => 330,
    'break_wait_time' => 40400,
    'success_rate' => 100,
    'consume' => [
        [
            102012058,
             120
        ],
         [
            102011005,
             60
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'power' => 150
    }
};
get(1070050093)-> #{
    'score' => 540,
    'break_wait_time' => 47600,
    'success_rate' => 100,
    'consume' => [
        [
            102012058,
             160
        ],
         [
            102011005,
             80
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'march_speed_multi' => 0.15,
        'power' => 200
    }
};
get(1070050094)-> #{
    'score' => 780,
    'add_skill' => 1040581001,
    'break_wait_time' => 54800,
    'success_rate' => 100,
    'consume' => [
        [
            102012058,
             200
        ],
         [
            102011005,
             100
        ],
         [
            101001005,
             1000000
        ],
         [
            101001006,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_troops_skill_hurt_inc_rate' => 0.1,
        'power' => 250
    }
};
get(1070050095)-> #{
    'score' => 1050,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'power' => 400
    }
};
get(1070011011)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             20
        ],
         [
            101001003,
             100000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'wu_strength' => 1,
        'power' => 150
    }
};
get(1070011012)-> #{
    'score' => 440,
    'add_skill' => 1040591001,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             40
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070011013)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             80
        ],
         [
            101001003,
             300000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'wu_strength' => 2,
        'power' => 250
    }
};
get(1070011014)-> #{
    'score' => 1040,
    'special_effect' => 101191,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             160
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070011015)-> #{
    'score' => 1400,
    'add_skill' => 1040592001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070021011)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             20
        ],
         [
            101001004,
             60000
        ],
         [
            101001005,
             60000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'quan_leadership' => 1,
        'power' => 150
    }
};
get(1070021012)-> #{
    'score' => 440,
    'add_skill' => 1040601001,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             40
        ],
         [
            101001004,
             120000
        ],
         [
            101001005,
             120000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070021013)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             80
        ],
         [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 3,
        'quan_leadership' => 2,
        'power' => 250
    }
};
get(1070021014)-> #{
    'score' => 1040,
    'special_effect' => 101201,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             160
        ],
         [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070021015)-> #{
    'score' => 1400,
    'add_skill' => 1040602001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070031011)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             20
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'wen_intelect' => 1,
        'power' => 150
    }
};
get(1070031012)-> #{
    'score' => 440,
    'add_skill' => 1040611001,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             40
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070031013)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             80
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'wen_intelect' => 2,
        'power' => 250
    }
};
get(1070031014)-> #{
    'score' => 1040,
    'special_effect' => 101211,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             160
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070031015)-> #{
    'score' => 1400,
    'add_skill' => 1040612001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070041011)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             20
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'nv_spirit' => 1,
        'power' => 150
    }
};
get(1070041012)-> #{
    'score' => 440,
    'add_skill' => 1040621001,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             40
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070041013)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             80
        ],
         [
            101001003,
             600000
        ],
         [
            101001004,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 3,
        'nv_spirit' => 2,
        'power' => 250
    }
};
get(1070041014)-> #{
    'score' => 1040,
    'special_effect' => 101221,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             160
        ],
         [
            101001003,
             800000
        ],
         [
            101001004,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070041015)-> #{
    'score' => 1400,
    'add_skill' => 1040622001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070051011)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             20
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_leadership' => 3,
        'power' => 150
    }
};
get(1070051012)-> #{
    'score' => 440,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             40
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => -0.1,
        'power' => 200
    }
};
get(1070051013)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             80
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'hero_spirit' => 3,
        'power' => 250
    }
};
get(1070051014)-> #{
    'score' => 1040,
    'special_effect' => 101232,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012206,
             160
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070051015)-> #{
    'score' => 1400,
    'add_skill' => 1040631001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070011021)-> #{
    'score' => 150,
    'break_wait_time' => 31200,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             100000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 50
    }
};
get(1070011022)-> #{
    'score' => 340,
    'break_wait_time' => 38400,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_attack' => 20,
        'power' => 100
    }
};
get(1070011023)-> #{
    'score' => 560,
    'break_wait_time' => 45600,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'power' => 150
    }
};
get(1070011024)-> #{
    'score' => 810,
    'add_skill' => 1040641001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070011025)-> #{
    'fail_back_rate' => 50
};
get(1070021021)-> #{
    'score' => 150,
    'break_wait_time' => 31200,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             120000
        ],
         [
            101001005,
             120000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 50
    }
};
get(1070021022)-> #{
    'score' => 340,
    'break_wait_time' => 38400,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             240000
        ],
         [
            101001005,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_base_defence' => 20,
        'power' => 100
    }
};
get(1070021023)-> #{
    'score' => 560,
    'break_wait_time' => 45600,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             480000
        ],
         [
            101001005,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'hero_leadership' => 1,
        'power' => 150
    }
};
get(1070021024)-> #{
    'score' => 810,
    'add_skill' => 1040651001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070021025)-> #{
    'fail_back_rate' => 50
};
get(1070031021)-> #{
    'score' => 150,
    'break_wait_time' => 31200,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 50
    }
};
get(1070031022)-> #{
    'score' => 340,
    'break_wait_time' => 38400,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_base_attack' => 20,
        'power' => 100
    }
};
get(1070031023)-> #{
    'score' => 560,
    'break_wait_time' => 45600,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'hero_leadership' => 1,
        'power' => 150
    }
};
get(1070031024)-> #{
    'score' => 810,
    'add_skill' => 1040661001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070031025)-> #{
    'fail_back_rate' => 50
};
get(1070041021)-> #{
    'score' => 150,
    'break_wait_time' => 31200,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             200000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 50
    }
};
get(1070041022)-> #{
    'score' => 340,
    'break_wait_time' => 38400,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_base_defence' => 20,
        'power' => 100
    }
};
get(1070041023)-> #{
    'score' => 560,
    'break_wait_time' => 45600,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             800000
        ],
         [
            101001004,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'hero_spirit' => 1,
        'power' => 150
    }
};
get(1070041024)-> #{
    'score' => 810,
    'add_skill' => 1040671001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070041025)-> #{
    'fail_back_rate' => 50
};
get(1070051021)-> #{
    'score' => 150,
    'break_wait_time' => 31200,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 50
    }
};
get(1070051022)-> #{
    'score' => 340,
    'break_wait_time' => 38400,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 100
    }
};
get(1070051023)-> #{
    'score' => 560,
    'break_wait_time' => 45600,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070051024)-> #{
    'score' => 810,
    'add_skill' => 1040681001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070051025)-> #{
    'fail_back_rate' => 50
};
get(1070011031)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012221,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_intelect' => 1,
        'power' => 150
    }
};
get(1070011032)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012221,
             120
        ],
         [
            101001003,
             300000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_infantry_hurt_inc_rate' => 0.15,
        'bingzhong_infantry_hurt_inc_rate' => 0.15,
        'power' => 200
    }
};
get(1070011033)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012221,
             160
        ],
         [
            101001003,
             400000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_intelect' => 2,
        'power' => 250
    }
};
get(1070011034)-> #{
    'score' => 1040,
    'add_skill' => 1040691001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012221,
             200
        ],
         [
            101001003,
             500000
        ],
         [
            101001006,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070011035)-> #{
    'score' => 1400,
    'add_skill' => 1040692001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070021031)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012222,
             80
        ],
         [
            101001004,
             200000
        ],
         [
            101001005,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'hero_intelect' => 1,
        'power' => 150
    }
};
get(1070021032)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012222,
             120
        ],
         [
            101001004,
             300000
        ],
         [
            101001005,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_cavalry_hurt_inc_rate' => 0.15,
        'bingzhong_cavalry_hurt_inc_rate' => 0.15,
        'power' => 200
    }
};
get(1070021033)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012222,
             160
        ],
         [
            101001004,
             400000
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 3,
        'hero_intelect' => 2,
        'power' => 250
    }
};
get(1070021034)-> #{
    'score' => 1040,
    'add_skill' => 1040701001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012222,
             200
        ],
         [
            101001004,
             500000
        ],
         [
            101001005,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070021035)-> #{
    'score' => 1400,
    'add_skill' => 1040702001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070031031)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012223,
             80
        ],
         [
            101001005,
             240000
        ],
         [
            101001006,
             240000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'power' => 150
    }
};
get(1070031032)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012223,
             120
        ],
         [
            101001005,
             360000
        ],
         [
            101001006,
             360000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_though_hurt_inc_rate' => 0.15,
        'bingzhong_though_hurt_inc_rate' => 0.15,
        'power' => 200
    }
};
get(1070031033)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012223,
             160
        ],
         [
            101001005,
             480000
        ],
         [
            101001006,
             480000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 5,
        'power' => 250
    }
};
get(1070031034)-> #{
    'score' => 1040,
    'add_skill' => 1040711001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012223,
             200
        ],
         [
            101001005,
             600000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070031035)-> #{
    'score' => 1400,
    'add_skill' => 1040712001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070041031)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012224,
             80
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'hero_intelect' => 1,
        'power' => 150
    }
};
get(1070041032)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012224,
             120
        ],
         [
            101001003,
             300000
        ],
         [
            101001004,
             300000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_alchemist_hurt_inc_rate' => 0.15,
        'bingzhong_alchemist_hurt_inc_rate' => 0.15,
        'power' => 200
    }
};
get(1070041033)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012224,
             160
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 3,
        'hero_intelect' => 2,
        'power' => 250
    }
};
get(1070041034)-> #{
    'score' => 1040,
    'add_skill' => 1040721001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012224,
             200
        ],
         [
            101001003,
             500000
        ],
         [
            101001004,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070041035)-> #{
    'score' => 1400,
    'add_skill' => 1040722001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070051031)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012225,
             80
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_leadership' => 3,
        'power' => 150
    }
};
get(1070051032)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012225,
             120
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => -0.15,
        'power' => 200
    }
};
get(1070051033)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012225,
             160
        ],
         [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 3,
        'hero_intelect' => 3,
        'power' => 250
    }
};
get(1070051034)-> #{
    'score' => 1040,
    'add_skill' => 1040731001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012225,
             200
        ],
         [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070051035)-> #{
    'score' => 1400,
    'add_skill' => 1040732001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070011041)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             20
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'power' => 150
    }
};
get(1070011042)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             40
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bubing_speed' => 10,
        'power' => 200
    }
};
get(1070011043)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             80
        ],
         [
            101001003,
             800000
        ],
         [
            101001004,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 5,
        'power' => 250
    }
};
get(1070011044)-> #{
    'score' => 1040,
    'special_effect' => 101251,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             120
        ],
         [
            101001003,
             1200000
        ],
         [
            101001004,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070011045)-> #{
    'score' => 1400,
    'add_skill' => 1040741001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070021041)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             20
        ],
         [
            101001004,
             200000
        ],
         [
            101001005,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_leadership' => 1,
        'power' => 150
    }
};
get(1070021042)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             40
        ],
         [
            101001004,
             400000
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qibing_speed' => 10,
        'power' => 200
    }
};
get(1070021043)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             80
        ],
         [
            101001004,
             800000
        ],
         [
            101001005,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_leadership' => 3,
        'power' => 250
    }
};
get(1070021044)-> #{
    'score' => 1040,
    'special_effect' => 101261,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             120
        ],
         [
            101001004,
             1600000
        ],
         [
            101001005,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070021045)-> #{
    'score' => 1400,
    'add_skill' => 1040751001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070031041)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             20
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_intelect' => 2,
        'power' => 150
    }
};
get(1070031042)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             40
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'gongbing_speed' => 10,
        'power' => 200
    }
};
get(1070031043)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             80
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_intelect' => 3,
        'power' => 250
    }
};
get(1070031044)-> #{
    'score' => 1040,
    'special_effect' => 101271,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             120
        ],
         [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070031045)-> #{
    'score' => 1400,
    'add_skill' => 1040761001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070041041)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             20
        ],
         [
            101001003,
             200000
        ],
         [
            101001004,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_spirit' => 2,
        'power' => 150
    }
};
get(1070041042)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             40
        ],
         [
            101001003,
             400000
        ],
         [
            101001004,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'fangshi_speed' => 10,
        'power' => 200
    }
};
get(1070041043)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             80
        ],
         [
            101001003,
             800000
        ],
         [
            101001004,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_spirit' => 3,
        'power' => 250
    }
};
get(1070041044)-> #{
    'score' => 1040,
    'special_effect' => 101281,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             120
        ],
         [
            101001003,
             1600000
        ],
         [
            101001004,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070041045)-> #{
    'score' => 1400,
    'add_skill' => 1040771001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070051041)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             20
        ],
         [
            101001005,
             200000
        ],
         [
            101001006,
             200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_leadership' => 2,
        'power' => 150
    }
};
get(1070051042)-> #{
    'score' => 440,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             40
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'bingzhong_speed' => 5,
        'power' => 200
    }
};
get(1070051043)-> #{
    'score' => 720,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             80
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_leadership' => 3,
        'power' => 250
    }
};
get(1070051044)-> #{
    'score' => 1040,
    'special_effect' => 101291,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012236,
             120
        ],
         [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070051045)-> #{
    'score' => 1400,
    'add_skill' => 1040781001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070011051)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             40
        ],
         [
            101001003,
             250000
        ],
         [
            101001006,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'power' => 150
    }
};
get(1070011052)-> #{
    'score' => 440,
    'special_effect' => 101301,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             80
        ],
         [
            101001003,
             500000
        ],
         [
            101001006,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_crit_rate' => 0.2,
        'power' => 200
    }
};
get(1070011053)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             160
        ],
         [
            101001003,
             1000000
        ],
         [
            101001006,
             2000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'hero_spirit' => 3,
        'power' => 250
    }
};
get(1070011054)-> #{
    'score' => 1040,
    'special_effect' => 101302,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             320
        ],
         [
            101001003,
             2000000
        ],
         [
            101001006,
             4000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070011055)-> #{
    'score' => 1400,
    'special_effect' => 101303,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'power' => 400
    }
};
get(1070021051)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             40
        ],
         [
            101001004,
             500000
        ],
         [
            101001005,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 3,
        'power' => 150
    }
};
get(1070021052)-> #{
    'score' => 440,
    'special_effect' => 101311,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             80
        ],
         [
            101001004,
             1000000
        ],
         [
            101001005,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_parry_rate' => 0.2,
        'power' => 200
    }
};
get(1070021053)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             160
        ],
         [
            101001004,
             2000000
        ],
         [
            101001005,
             2000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'hero_leadership' => 2,
        'power' => 250
    }
};
get(1070021054)-> #{
    'score' => 1040,
    'add_skill' => 1040801001,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             320
        ],
         [
            101001004,
             4000000
        ],
         [
            101001005,
             4000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070021055)-> #{
    'score' => 1400,
    'special_effect' => 101312,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 1,
        'power' => 400
    }
};
get(1070031051)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             40
        ],
         [
            101001005,
             500000
        ],
         [
            101001006,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'power' => 150
    }
};
get(1070031052)-> #{
    'score' => 440,
    'special_effect' => 101321,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             80
        ],
         [
            101001005,
             1000000
        ],
         [
            101001006,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_crit_rate' => 0.2,
        'power' => 200
    }
};
get(1070031053)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             160
        ],
         [
            101001005,
             2000000
        ],
         [
            101001006,
             2000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'hero_leadership' => 3,
        'power' => 250
    }
};
get(1070031054)-> #{
    'score' => 1040,
    'special_effect' => 101322,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             320
        ],
         [
            101001005,
             4000000
        ],
         [
            101001006,
             4000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070031055)-> #{
    'score' => 1400,
    'special_effect' => 101323,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'power' => 400
    }
};
get(1070041051)-> #{
    'score' => 200,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             40
        ],
         [
            101001003,
             500000
        ],
         [
            101001004,
             500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 3,
        'power' => 150
    }
};
get(1070041052)-> #{
    'score' => 440,
    'special_effect' => 101331,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             80
        ],
         [
            101001003,
             1000000
        ],
         [
            101001004,
             1000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_parry_rate' => 0.2,
        'power' => 200
    }
};
get(1070041053)-> #{
    'score' => 720,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             160
        ],
         [
            101001003,
             2000000
        ],
         [
            101001004,
             2000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'hero_spirit' => 2,
        'power' => 250
    }
};
get(1070041054)-> #{
    'score' => 1040,
    'add_skill' => 1040821001,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             320
        ],
         [
            101001003,
             4000000
        ],
         [
            101001004,
             4000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070041055)-> #{
    'score' => 1400,
    'special_effect' => 101332,
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 1,
        'power' => 400
    }
};
get(1070051051)-> #{
    'score' => 200,
    'add_skill' => 1040831001,
    'break_wait_time' => 28800,
    'success_rate' => 100,
    'consume' => [
        [
            102012245,
             100
        ],
         [
            101001005,
             750000
        ],
         [
            101001006,
             750000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 150
    }
};
get(1070051052)-> #{
    'score' => 440,
    'special_effect' => 101341,
    'break_wait_time' => 43200,
    'success_rate' => 100,
    'consume' => [
        [
            102012245,
             150
        ],
         [
            101001005,
             1500000
        ],
         [
            101001006,
             1500000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070051053)-> #{
    'score' => 720,
    'add_skill' => 1040832001,
    'break_wait_time' => 57600,
    'success_rate' => 100,
    'consume' => [
        [
            102012245,
             200
        ],
         [
            101001005,
             2250000
        ],
         [
            101001006,
             2250000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 250
    }
};
get(1070051054)-> #{
    'score' => 1040,
    'special_effect' => 101342,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012245,
             250
        ],
         [
            101001005,
             3000000
        ],
         [
            101001006,
             3000000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070051055)-> #{
    'score' => 1400,
    'add_skill' => 1040833001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070011061)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             50
        ],
         [
            101001003,
             300000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'nv_strength' => 2,
        'power' => 150
    }
};
get(1070011062)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             100
        ],
         [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'bingzhong_former_hurt_red_rate' => -0.2,
        'power' => 200
    }
};
get(1070011063)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             900000
        ],
         [
            101001006,
             1800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'nv_spirit' => 2,
        'power' => 250
    }
};
get(1070011064)-> #{
    'score' => 1040,
    'add_skill' => 1040841001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 300
    }
};
get(1070011065)-> #{
    'score' => 1400,
    'add_skill' => 1040842001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070021061)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             50
        ],
         [
            101001004,
             400000
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'nv_leadership' => 2,
        'power' => 150
    }
};
get(1070021062)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             100
        ],
         [
            101001004,
             800000
        ],
         [
            101001005,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'hero_man_hurt_inc_rate' => 0.2,
        'bingzhong_man_hurt_inc_rate' => 0.2,
        'power' => 200
    }
};
get(1070021063)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             150
        ],
         [
            101001004,
             1200000
        ],
         [
            101001005,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'nv_strength' => 2,
        'power' => 250
    }
};
get(1070021064)-> #{
    'score' => 1040,
    'special_effect' => 101351,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             200
        ],
         [
            101001004,
             1600000
        ],
         [
            101001005,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 300
    }
};
get(1070021065)-> #{
    'score' => 1400,
    'add_skill' => 1040851001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070031061)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             50
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'nv_intelect' => 2,
        'power' => 150
    }
};
get(1070031062)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             100
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'bingzhong_later_hurt_red_rate' => -0.2,
        'power' => 200
    }
};
get(1070031063)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             150
        ],
         [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'nv_leadership' => 2,
        'power' => 250
    }
};
get(1070031064)-> #{
    'score' => 1040,
    'special_effect' => 101361,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             200
        ],
         [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 300
    }
};
get(1070031065)-> #{
    'score' => 1400,
    'add_skill' => 1040861001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070041061)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             50
        ],
         [
            101001004,
             400000
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'nv_spirit' => 2,
        'power' => 150
    }
};
get(1070041062)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             100
        ],
         [
            101001004,
             800000
        ],
         [
            101001005,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'bingzhong_man_hurt_red_rate' => -0.2,
        'power' => 200
    }
};
get(1070041063)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             150
        ],
         [
            101001004,
             1200000
        ],
         [
            101001005,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'nv_intelect' => 2,
        'power' => 250
    }
};
get(1070041064)-> #{
    'score' => 1040,
    'special_effect' => 101371,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             200
        ],
         [
            101001004,
             1600000
        ],
         [
            101001005,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 2,
        'power' => 300
    }
};
get(1070041065)-> #{
    'score' => 1400,
    'add_skill' => 1040871001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070051061)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             50
        ],
         [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'hero_spirit' => 2,
        'nv_leadership' => 1,
        'power' => 150
    }
};
get(1070051062)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             100
        ],
         [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'hero_leadership' => 2,
        'nv_spirit' => 1,
        'power' => 200
    }
};
get(1070051063)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             150
        ],
         [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'hero_spirit' => 2,
        'nv_intelect' => 1,
        'nv_strength' => 1,
        'power' => 250
    }
};
get(1070051064)-> #{
    'score' => 1040,
    'add_skill' => 1040881001,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            102012246,
             200
        ],
         [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 300
    }
};
get(1070051065)-> #{
    'score' => 1400,
    'add_skill' => 1040882001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070011071)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             300000
        ],
         [
            101001006,
             600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'wu_leadership' => 2,
        'power' => 150
    }
};
get(1070011072)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             600000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_attack' => 500,
        'bingzhong_hero_skill_hurt_red_rate' => -0.1,
        'power' => 200
    }
};
get(1070011073)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             900000
        ],
         [
            101001006,
             1800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'nan_intelect' => 1,
        'hero_cavalry_hurt_inc_rate' => 0.35,
        'bingzhong_cavalry_hurt_inc_rate' => 0.35,
        'power' => 250
    }
};
get(1070011074)-> #{
    'score' => 1040,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            101001003,
             1200000
        ],
         [
            101001006,
             2400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'nan_strength' => 3,
        'power' => 300
    }
};
get(1070011075)-> #{
    'score' => 1400,
    'add_skill' => 1040891001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070021071)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             400000
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 2,
        'nan_strength' => 2,
        'power' => 150
    }
};
get(1070021072)-> #{
    'score' => 440,
    'add_skill' => 1040901001,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             800000
        ],
         [
            101001005,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'qianjun_attack' => 500,
        'power' => 200
    }
};
get(1070021073)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             1200000
        ],
         [
            101001005,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 1,
        'nan_intelect' => 1,
        'hero_infantry_hurt_inc_rate' => 0.35,
        'bingzhong_infantry_hurt_inc_rate' => 0.35,
        'power' => 250
    }
};
get(1070021074)-> #{
    'score' => 1040,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             1600000
        ],
         [
            101001005,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 3,
        'nan_leadership' => 3,
        'power' => 300
    }
};
get(1070021075)-> #{
    'score' => 1400,
    'add_skill' => 1040902001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070031071)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'nan_leadership' => 2,
        'power' => 150
    }
};
get(1070031072)-> #{
    'score' => 440,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_attack' => 500,
        'bingzhong_hero_skill_hurt_red_rate' => -0.1,
        'power' => 200
    }
};
get(1070031073)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'nan_strength' => 1,
        'bingzhong_woman_hurt_red_rate' => -0.2,
        'power' => 250
    }
};
get(1070031074)-> #{
    'score' => 1040,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 3,
        'nan_intelect' => 3,
        'power' => 300
    }
};
get(1070031075)-> #{
    'score' => 1400,
    'add_skill' => 1040911001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070041071)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             400000
        ],
         [
            101001005,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 2,
        'nan_leadership' => 2,
        'power' => 150
    }
};
get(1070041072)-> #{
    'score' => 440,
    'add_skill' => 1040921001,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             800000
        ],
         [
            101001005,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'houjun_attack' => 500,
        'power' => 200
    }
};
get(1070041073)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             1200000
        ],
         [
            101001005,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 1,
        'nan_strength' => 1,
        'bingzhong_woman_hurt_red_rate' => -0.2,
        'power' => 250
    }
};
get(1070041074)-> #{
    'score' => 1040,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            101001004,
             1600000
        ],
         [
            101001005,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_spirit' => 3,
        'nan_spirit' => 3,
        'power' => 300
    }
};
get(1070041075)-> #{
    'score' => 1400,
    'add_skill' => 1040922001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};
get(1070051071)-> #{
    'score' => 200,
    'break_wait_time' => 72000,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             400000
        ],
         [
            101001006,
             400000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_intelect' => 2,
        'nan_intelect' => 2,
        'power' => 150
    }
};
get(1070051072)-> #{
    'score' => 440,
    'add_skill' => 1040931001,
    'break_wait_time' => 86400,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             800000
        ],
         [
            101001006,
             800000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 200
    }
};
get(1070051073)-> #{
    'score' => 720,
    'break_wait_time' => 100800,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             1200000
        ],
         [
            101001006,
             1200000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_strength' => 3,
        'nan_strength' => 3,
        'houjun_defence' => 300,
        'power' => 250
    }
};
get(1070051074)-> #{
    'score' => 1040,
    'break_wait_time' => 115200,
    'success_rate' => 100,
    'consume' => [
        [
            101001005,
             1600000
        ],
         [
            101001006,
             1600000
        ]
    ],
    'fail_back_rate' => 50,
    'props' => #{
        'hero_leadership' => 3,
        'nan_leadership' => 3,
        'qianjun_defence' => 300,
        'power' => 300
    }
};
get(1070051075)-> #{
    'score' => 1400,
    'add_skill' => 1040932001,
    'fail_back_rate' => 50,
    'props' => #{
        'power' => 400
    }
};

get(_N) -> false.
get_list() ->
	[1070010011,1070010012,1070010013,1070010014,1070010015,1070010021,1070010022,1070010023,1070010024,1070010025,1070010031,1070010032,1070010033,1070010034,1070010035,1070010041,1070010042,1070010043,1070010044,1070010045,1070010051,1070010052,1070010053,1070010054,1070010055,1070010061,1070010062,1070010063,1070010064,1070010065,1070010071,1070010072,1070010073,1070010074,1070010075,1070010081,1070010082,1070010083,1070010084,1070010085,1070010091,1070010092,1070010093,1070010094,1070010095,1070010101,1070010102,1070010103,1070010104,1070010105,1070010111,1070010112,1070010113,1070010114,1070010115,1070010121,1070010122,1070010123,1070010124,1070010125,1070010131,1070010132,1070010133,1070010134,1070010135,1070010141,1070010142,1070010143,1070010144,1070010145,1070010151,1070010152,1070010153,1070010154,1070010155,1070010161,1070010162,1070010163,1070010164,1070010165,1070010171,1070010172,1070010173,1070010174,1070010175,1070020011,1070020012,1070020013,1070020014,1070020015,1070020021,1070020022,1070020023,1070020024,1070020025,1070020031,1070020032,1070020033,1070020034,1070020035,1070020041,1070020042,1070020043,1070020044,1070020045,1070020051,1070020052,1070020053,1070020054,1070020055,1070020061,1070020062,1070020063,1070020064,1070020065,1070020071,1070020072,1070020073,1070020074,1070020075,1070020081,1070020082,1070020083,1070020084,1070020085,1070020091,1070020092,1070020093,1070020094,1070020095,1070020101,1070020102,1070020103,1070020104,1070020105,1070030011,1070030012,1070030013,1070030014,1070030015,1070030021,1070030022,1070030023,1070030024,1070030025,1070030031,1070030032,1070030033,1070030034,1070030035,1070030041,1070030042,1070030043,1070030044,1070030045,1070030051,1070030052,1070030053,1070030054,1070030055,1070030061,1070030062,1070030063,1070030064,1070030065,1070030071,1070030072,1070030073,1070030074,1070030075,1070030081,1070030082,1070030083,1070030084,1070030085,1070030091,1070030092,1070030093,1070030094,1070030095,1070030101,1070030102,1070030103,1070030104,1070030105,1070030111,1070030112,1070030113,1070030114,1070030115,1070040011,1070040012,1070040013,1070040014,1070040015,1070040021,1070040022,1070040023,1070040024,1070040025,1070040031,1070040032,1070040033,1070040034,1070040035,1070040041,1070040042,1070040043,1070040044,1070040045,1070040051,1070040052,1070040053,1070040054,1070040055,1070040061,1070040062,1070040063,1070040064,1070040065,1070040071,1070040072,1070040073,1070040074,1070040075,1070040081,1070040082,1070040083,1070040084,1070040085,1070040091,1070040092,1070040093,1070040094,1070040095,1070040101,1070040102,1070040103,1070040104,1070040105,1070040111,1070040112,1070040113,1070040114,1070040115,1070050011,1070050012,1070050013,1070050014,1070050015,1070050021,1070050022,1070050023,1070050024,1070050025,1070050031,1070050032,1070050033,1070050034,1070050035,1070050041,1070050042,1070050043,1070050044,1070050045,1070050051,1070050052,1070050053,1070050054,1070050055,1070050061,1070050062,1070050063,1070050064,1070050065,1070050071,1070050072,1070050073,1070050074,1070050075,1070050081,1070050082,1070050083,1070050084,1070050085,1070050091,1070050092,1070050093,1070050094,1070050095,1070011011,1070011012,1070011013,1070011014,1070011015,1070021011,1070021012,1070021013,1070021014,1070021015,1070031011,1070031012,1070031013,1070031014,1070031015,1070041011,1070041012,1070041013,1070041014,1070041015,1070051011,1070051012,1070051013,1070051014,1070051015,1070011021,1070011022,1070011023,1070011024,1070011025,1070021021,1070021022,1070021023,1070021024,1070021025,1070031021,1070031022,1070031023,1070031024,1070031025,1070041021,1070041022,1070041023,1070041024,1070041025,1070051021,1070051022,1070051023,1070051024,1070051025,1070011031,1070011032,1070011033,1070011034,1070011035,1070021031,1070021032,1070021033,1070021034,1070021035,1070031031,1070031032,1070031033,1070031034,1070031035,1070041031,1070041032,1070041033,1070041034,1070041035,1070051031,1070051032,1070051033,1070051034,1070051035,1070011041,1070011042,1070011043,1070011044,1070011045,1070021041,1070021042,1070021043,1070021044,1070021045,1070031041,1070031042,1070031043,1070031044,1070031045,1070041041,1070041042,1070041043,1070041044,1070041045,1070051041,1070051042,1070051043,1070051044,1070051045,1070011051,1070011052,1070011053,1070011054,1070011055,1070021051,1070021052,1070021053,1070021054,1070021055,1070031051,1070031052,1070031053,1070031054,1070031055,1070041051,1070041052,1070041053,1070041054,1070041055,1070051051,1070051052,1070051053,1070051054,1070051055,1070011061,1070011062,1070011063,1070011064,1070011065,1070021061,1070021062,1070021063,1070021064,1070021065,1070031061,1070031062,1070031063,1070031064,1070031065,1070041061,1070041062,1070041063,1070041064,1070041065,1070051061,1070051062,1070051063,1070051064,1070051065,1070011071,1070011072,1070011073,1070011074,1070011075,1070021071,1070021072,1070021073,1070021074,1070021075,1070031071,1070031072,1070031073,1070031074,1070031075,1070041071,1070041072,1070041073,1070041074,1070041075,1070051071,1070051072,1070051073,1070051074,1070051075].
