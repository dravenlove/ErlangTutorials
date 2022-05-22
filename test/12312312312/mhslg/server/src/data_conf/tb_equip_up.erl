%%--- coding:utf-8 ---
-module(tb_equip_up).
-export([get/1,get_list/0]).
get(100001)-> #{
    'sub_type' => 1,
    'up_lvl' => 1,
    'equip_intensify_cost_first' => [
        102021001,
         1
    ],
    'equip_intensify_cost_second' => [
        102021006,
         1
    ],
    'first_rate' => 90,
    'fail_add_rate' => 10,
    'qianjun_attack' => 45
};
get(100002)-> #{
    'sub_type' => 1,
    'up_lvl' => 2,
    'equip_intensify_cost_first' => [
        102021001,
         2
    ],
    'equip_intensify_cost_second' => [
        102021006,
         2
    ],
    'first_rate' => 70,
    'fail_add_rate' => 10,
    'qianjun_attack' => 90
};
get(100003)-> #{
    'sub_type' => 1,
    'up_lvl' => 3,
    'equip_intensify_cost_first' => [
        102021001,
         4
    ],
    'equip_intensify_cost_second' => [
        102021006,
         4
    ],
    'first_rate' => 50,
    'fail_add_rate' => 10,
    'qianjun_attack' => 150
};
get(100004)-> #{
    'sub_type' => 1,
    'up_lvl' => 4,
    'equip_intensify_cost_first' => [
        102021001,
         6
    ],
    'equip_intensify_cost_second' => [
        102021006,
         6
    ],
    'first_rate' => 30,
    'fail_add_rate' => 10,
    'qianjun_attack' => 210
};
get(100005)-> #{
    'sub_type' => 1,
    'up_lvl' => 5,
    'equip_intensify_cost_first' => [
        102021001,
         8
    ],
    'equip_intensify_cost_second' => [
        102021006,
         8
    ],
    'first_rate' => 20,
    'fail_add_rate' => 8,
    'qianjun_attack' => 285
};
get(100006)-> #{
    'sub_type' => 1,
    'up_lvl' => 6,
    'equip_intensify_cost_first' => [
        102021001,
         10
    ],
    'equip_intensify_cost_second' => [
        102021006,
         10
    ],
    'first_rate' => 10,
    'fail_add_rate' => 6,
    'qianjun_attack' => 360
};
get(100007)-> #{
    'sub_type' => 1,
    'up_lvl' => 7,
    'equip_intensify_cost_first' => [
        102021001,
         12
    ],
    'equip_intensify_cost_second' => [
        102021006,
         12
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_attack' => 450
};
get(100008)-> #{
    'sub_type' => 1,
    'up_lvl' => 8,
    'equip_intensify_cost_first' => [
        102021001,
         15
    ],
    'equip_intensify_cost_second' => [
        102021006,
         15
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_attack' => 540
};
get(100009)-> #{
    'sub_type' => 1,
    'up_lvl' => 9,
    'equip_intensify_cost_first' => [
        102021011,
         4
    ],
    'equip_intensify_cost_second' => [
        102021016,
         4
    ],
    'first_rate' => 20,
    'fail_add_rate' => 6,
    'qianjun_attack' => 645
};
get(100010)-> #{
    'sub_type' => 1,
    'up_lvl' => 10,
    'equip_intensify_cost_first' => [
        102021011,
         6
    ],
    'equip_intensify_cost_second' => [
        102021016,
         6
    ],
    'first_rate' => 12,
    'fail_add_rate' => 4,
    'qianjun_attack' => 750
};
get(100011)-> #{
    'sub_type' => 1,
    'up_lvl' => 11,
    'equip_intensify_cost_first' => [
        102021011,
         8
    ],
    'equip_intensify_cost_second' => [
        102021016,
         8
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_attack' => 870
};
get(100012)-> #{
    'sub_type' => 1,
    'up_lvl' => 12,
    'equip_intensify_cost_first' => [
        102021011,
         10
    ],
    'equip_intensify_cost_second' => [
        102021016,
         10
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_attack' => 990,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100013)-> #{
    'sub_type' => 1,
    'up_lvl' => 13,
    'equip_intensify_cost_first' => [
        102021021,
         2
    ],
    'equip_intensify_cost_second' => [
        102021026,
         2
    ],
    'first_rate' => 15,
    'fail_add_rate' => 3,
    'qianjun_attack' => 1125,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100014)-> #{
    'sub_type' => 1,
    'up_lvl' => 14,
    'equip_intensify_cost_first' => [
        102021021,
         4
    ],
    'equip_intensify_cost_second' => [
        102021026,
         4
    ],
    'first_rate' => 10,
    'fail_add_rate' => 3,
    'qianjun_attack' => 1260,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100015)-> #{
    'sub_type' => 1,
    'up_lvl' => 15,
    'equip_intensify_cost_first' => [
        102021021,
         6
    ],
    'equip_intensify_cost_second' => [
        102021026,
         6
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_attack' => 1410,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100016)-> #{
    'sub_type' => 1,
    'up_lvl' => 16,
    'equip_intensify_cost_first' => [
        102021021,
         8
    ],
    'equip_intensify_cost_second' => [
        102021026,
         8
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_attack' => 1560,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100017)-> #{
    'sub_type' => 1,
    'up_lvl' => 17,
    'equip_intensify_cost_first' => [
        102021031,
         1
    ],
    'equip_intensify_cost_second' => [
        102021036,
         1
    ],
    'first_rate' => 10,
    'fail_add_rate' => 2,
    'qianjun_attack' => 1725,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100018)-> #{
    'sub_type' => 1,
    'up_lvl' => 18,
    'equip_intensify_cost_first' => [
        102021031,
         2
    ],
    'equip_intensify_cost_second' => [
        102021036,
         2
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_attack' => 1890,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100019)-> #{
    'sub_type' => 1,
    'up_lvl' => 19,
    'equip_intensify_cost_first' => [
        102021031,
         3
    ],
    'equip_intensify_cost_second' => [
        102021036,
         3
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_attack' => 2070,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(100020)-> #{
    'sub_type' => 1,
    'up_lvl' => 20,
    'equip_intensify_cost_first' => [
        102021031,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_attack' => 2250,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01,
    'qianjun_crit_red_rate' => 0.01
};
get(100021)-> #{
    'sub_type' => 1,
    'up_lvl' => 21,
    'equip_intensify_cost_first' => [
        102021031,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_attack' => 2430,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01,
    'qianjun_crit_red_rate' => 0.01
};
get(100022)-> #{
    'sub_type' => 1,
    'up_lvl' => 22,
    'equip_intensify_cost_first' => [
        102021031,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_attack' => 2610,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01,
    'qianjun_crit_red_rate' => 0.01
};
get(100023)-> #{
    'sub_type' => 1,
    'up_lvl' => 23,
    'equip_intensify_cost_first' => [
        102021031,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_attack' => 2790,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01,
    'qianjun_crit_red_rate' => 0.01
};
get(100024)-> #{
    'sub_type' => 1,
    'up_lvl' => 24,
    'equip_intensify_cost_first' => [
        102021031,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_attack' => 2970,
    'hero_strength' => 1,
    'hero_hero_skill_hurt_inc_rate' => 0.01,
    'qianjun_hurt_inc_rate' => 0.05,
    'qianjun_crit_red_rate' => 0.01
};
get(200001)-> #{
    'sub_type' => 2,
    'up_lvl' => 1,
    'equip_intensify_cost_first' => [
        102021002,
         1
    ],
    'equip_intensify_cost_second' => [
        102021006,
         1
    ],
    'first_rate' => 90,
    'fail_add_rate' => 10,
    'qianjun_troops' => 60
};
get(200002)-> #{
    'sub_type' => 2,
    'up_lvl' => 2,
    'equip_intensify_cost_first' => [
        102021002,
         2
    ],
    'equip_intensify_cost_second' => [
        102021006,
         2
    ],
    'first_rate' => 70,
    'fail_add_rate' => 10,
    'qianjun_troops' => 120
};
get(200003)-> #{
    'sub_type' => 2,
    'up_lvl' => 3,
    'equip_intensify_cost_first' => [
        102021002,
         4
    ],
    'equip_intensify_cost_second' => [
        102021006,
         4
    ],
    'first_rate' => 50,
    'fail_add_rate' => 10,
    'qianjun_troops' => 195
};
get(200004)-> #{
    'sub_type' => 2,
    'up_lvl' => 4,
    'equip_intensify_cost_first' => [
        102021002,
         6
    ],
    'equip_intensify_cost_second' => [
        102021006,
         6
    ],
    'first_rate' => 30,
    'fail_add_rate' => 10,
    'qianjun_troops' => 270
};
get(200005)-> #{
    'sub_type' => 2,
    'up_lvl' => 5,
    'equip_intensify_cost_first' => [
        102021002,
         8
    ],
    'equip_intensify_cost_second' => [
        102021006,
         8
    ],
    'first_rate' => 20,
    'fail_add_rate' => 8,
    'qianjun_troops' => 360
};
get(200006)-> #{
    'sub_type' => 2,
    'up_lvl' => 6,
    'equip_intensify_cost_first' => [
        102021002,
         10
    ],
    'equip_intensify_cost_second' => [
        102021006,
         10
    ],
    'first_rate' => 10,
    'fail_add_rate' => 6,
    'qianjun_troops' => 450
};
get(200007)-> #{
    'sub_type' => 2,
    'up_lvl' => 7,
    'equip_intensify_cost_first' => [
        102021002,
         12
    ],
    'equip_intensify_cost_second' => [
        102021006,
         12
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_troops' => 570
};
get(200008)-> #{
    'sub_type' => 2,
    'up_lvl' => 8,
    'equip_intensify_cost_first' => [
        102021002,
         15
    ],
    'equip_intensify_cost_second' => [
        102021006,
         15
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_troops' => 690
};
get(200009)-> #{
    'sub_type' => 2,
    'up_lvl' => 9,
    'equip_intensify_cost_first' => [
        102021012,
         4
    ],
    'equip_intensify_cost_second' => [
        102021016,
         4
    ],
    'first_rate' => 20,
    'fail_add_rate' => 6,
    'qianjun_troops' => 825
};
get(200010)-> #{
    'sub_type' => 2,
    'up_lvl' => 10,
    'equip_intensify_cost_first' => [
        102021012,
         6
    ],
    'equip_intensify_cost_second' => [
        102021016,
         6
    ],
    'first_rate' => 12,
    'fail_add_rate' => 4,
    'qianjun_troops' => 960
};
get(200011)-> #{
    'sub_type' => 2,
    'up_lvl' => 11,
    'equip_intensify_cost_first' => [
        102021012,
         8
    ],
    'equip_intensify_cost_second' => [
        102021016,
         8
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_troops' => 1125
};
get(200012)-> #{
    'sub_type' => 2,
    'up_lvl' => 12,
    'equip_intensify_cost_first' => [
        102021012,
         10
    ],
    'equip_intensify_cost_second' => [
        102021016,
         10
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_troops' => 1290,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200013)-> #{
    'sub_type' => 2,
    'up_lvl' => 13,
    'equip_intensify_cost_first' => [
        102021022,
         2
    ],
    'equip_intensify_cost_second' => [
        102021026,
         2
    ],
    'first_rate' => 15,
    'fail_add_rate' => 3,
    'qianjun_troops' => 1470,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200014)-> #{
    'sub_type' => 2,
    'up_lvl' => 14,
    'equip_intensify_cost_first' => [
        102021022,
         4
    ],
    'equip_intensify_cost_second' => [
        102021026,
         4
    ],
    'first_rate' => 10,
    'fail_add_rate' => 3,
    'qianjun_troops' => 1650,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200015)-> #{
    'sub_type' => 2,
    'up_lvl' => 15,
    'equip_intensify_cost_first' => [
        102021022,
         6
    ],
    'equip_intensify_cost_second' => [
        102021026,
         6
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_troops' => 1865,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200016)-> #{
    'sub_type' => 2,
    'up_lvl' => 16,
    'equip_intensify_cost_first' => [
        102021022,
         8
    ],
    'equip_intensify_cost_second' => [
        102021026,
         8
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_troops' => 2080,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200017)-> #{
    'sub_type' => 2,
    'up_lvl' => 17,
    'equip_intensify_cost_first' => [
        102021032,
         1
    ],
    'equip_intensify_cost_second' => [
        102021036,
         1
    ],
    'first_rate' => 10,
    'fail_add_rate' => 2,
    'qianjun_troops' => 2300,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200018)-> #{
    'sub_type' => 2,
    'up_lvl' => 18,
    'equip_intensify_cost_first' => [
        102021032,
         2
    ],
    'equip_intensify_cost_second' => [
        102021036,
         2
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_troops' => 2520,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200019)-> #{
    'sub_type' => 2,
    'up_lvl' => 19,
    'equip_intensify_cost_first' => [
        102021032,
         3
    ],
    'equip_intensify_cost_second' => [
        102021036,
         3
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_troops' => 2760,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(200020)-> #{
    'sub_type' => 2,
    'up_lvl' => 20,
    'equip_intensify_cost_first' => [
        102021032,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_troops' => 3000,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'qianjun_parry_rate' => 0.01
};
get(200021)-> #{
    'sub_type' => 2,
    'up_lvl' => 21,
    'equip_intensify_cost_first' => [
        102021032,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_troops' => 3240,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'qianjun_parry_rate' => 0.01
};
get(200022)-> #{
    'sub_type' => 2,
    'up_lvl' => 22,
    'equip_intensify_cost_first' => [
        102021032,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_troops' => 3480,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'qianjun_parry_rate' => 0.01
};
get(200023)-> #{
    'sub_type' => 2,
    'up_lvl' => 23,
    'equip_intensify_cost_first' => [
        102021032,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_troops' => 3720,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'qianjun_parry_rate' => 0.01
};
get(200024)-> #{
    'sub_type' => 2,
    'up_lvl' => 24,
    'equip_intensify_cost_first' => [
        102021032,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_troops' => 3960,
    'hero_leadership' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'qianjun_hurt_red_rate' => 0.05,
    'qianjun_parry_rate' => 0.01
};
get(300001)-> #{
    'sub_type' => 3,
    'up_lvl' => 1,
    'equip_intensify_cost_first' => [
        102021003,
         1
    ],
    'equip_intensify_cost_second' => [
        102021006,
         1
    ],
    'first_rate' => 90,
    'fail_add_rate' => 10,
    'houjun_attack' => 45
};
get(300002)-> #{
    'sub_type' => 3,
    'up_lvl' => 2,
    'equip_intensify_cost_first' => [
        102021003,
         2
    ],
    'equip_intensify_cost_second' => [
        102021006,
         2
    ],
    'first_rate' => 70,
    'fail_add_rate' => 10,
    'houjun_attack' => 90
};
get(300003)-> #{
    'sub_type' => 3,
    'up_lvl' => 3,
    'equip_intensify_cost_first' => [
        102021003,
         4
    ],
    'equip_intensify_cost_second' => [
        102021006,
         4
    ],
    'first_rate' => 50,
    'fail_add_rate' => 10,
    'houjun_attack' => 150
};
get(300004)-> #{
    'sub_type' => 3,
    'up_lvl' => 4,
    'equip_intensify_cost_first' => [
        102021003,
         6
    ],
    'equip_intensify_cost_second' => [
        102021006,
         6
    ],
    'first_rate' => 30,
    'fail_add_rate' => 10,
    'houjun_attack' => 210
};
get(300005)-> #{
    'sub_type' => 3,
    'up_lvl' => 5,
    'equip_intensify_cost_first' => [
        102021003,
         8
    ],
    'equip_intensify_cost_second' => [
        102021006,
         8
    ],
    'first_rate' => 20,
    'fail_add_rate' => 8,
    'houjun_attack' => 285
};
get(300006)-> #{
    'sub_type' => 3,
    'up_lvl' => 6,
    'equip_intensify_cost_first' => [
        102021003,
         10
    ],
    'equip_intensify_cost_second' => [
        102021006,
         10
    ],
    'first_rate' => 10,
    'fail_add_rate' => 6,
    'houjun_attack' => 360
};
get(300007)-> #{
    'sub_type' => 3,
    'up_lvl' => 7,
    'equip_intensify_cost_first' => [
        102021003,
         12
    ],
    'equip_intensify_cost_second' => [
        102021006,
         12
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_attack' => 450
};
get(300008)-> #{
    'sub_type' => 3,
    'up_lvl' => 8,
    'equip_intensify_cost_first' => [
        102021003,
         15
    ],
    'equip_intensify_cost_second' => [
        102021006,
         15
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_attack' => 540
};
get(300009)-> #{
    'sub_type' => 3,
    'up_lvl' => 9,
    'equip_intensify_cost_first' => [
        102021013,
         4
    ],
    'equip_intensify_cost_second' => [
        102021016,
         4
    ],
    'first_rate' => 20,
    'fail_add_rate' => 6,
    'houjun_attack' => 645
};
get(300010)-> #{
    'sub_type' => 3,
    'up_lvl' => 10,
    'equip_intensify_cost_first' => [
        102021013,
         6
    ],
    'equip_intensify_cost_second' => [
        102021016,
         6
    ],
    'first_rate' => 12,
    'fail_add_rate' => 4,
    'houjun_attack' => 750
};
get(300011)-> #{
    'sub_type' => 3,
    'up_lvl' => 11,
    'equip_intensify_cost_first' => [
        102021013,
         8
    ],
    'equip_intensify_cost_second' => [
        102021016,
         8
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_attack' => 870
};
get(300012)-> #{
    'sub_type' => 3,
    'up_lvl' => 12,
    'equip_intensify_cost_first' => [
        102021013,
         10
    ],
    'equip_intensify_cost_second' => [
        102021016,
         10
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'houjun_attack' => 990,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300013)-> #{
    'sub_type' => 3,
    'up_lvl' => 13,
    'equip_intensify_cost_first' => [
        102021023,
         2
    ],
    'equip_intensify_cost_second' => [
        102021026,
         2
    ],
    'first_rate' => 15,
    'fail_add_rate' => 3,
    'houjun_attack' => 1125,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300014)-> #{
    'sub_type' => 3,
    'up_lvl' => 14,
    'equip_intensify_cost_first' => [
        102021023,
         4
    ],
    'equip_intensify_cost_second' => [
        102021026,
         4
    ],
    'first_rate' => 10,
    'fail_add_rate' => 3,
    'houjun_attack' => 1260,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300015)-> #{
    'sub_type' => 3,
    'up_lvl' => 15,
    'equip_intensify_cost_first' => [
        102021023,
         6
    ],
    'equip_intensify_cost_second' => [
        102021026,
         6
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_attack' => 1410,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300016)-> #{
    'sub_type' => 3,
    'up_lvl' => 16,
    'equip_intensify_cost_first' => [
        102021023,
         8
    ],
    'equip_intensify_cost_second' => [
        102021026,
         8
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'houjun_attack' => 1560,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300017)-> #{
    'sub_type' => 3,
    'up_lvl' => 17,
    'equip_intensify_cost_first' => [
        102021033,
         1
    ],
    'equip_intensify_cost_second' => [
        102021036,
         1
    ],
    'first_rate' => 10,
    'fail_add_rate' => 2,
    'houjun_attack' => 1725,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300018)-> #{
    'sub_type' => 3,
    'up_lvl' => 18,
    'equip_intensify_cost_first' => [
        102021033,
         2
    ],
    'equip_intensify_cost_second' => [
        102021036,
         2
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_attack' => 1890,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300019)-> #{
    'sub_type' => 3,
    'up_lvl' => 19,
    'equip_intensify_cost_first' => [
        102021033,
         3
    ],
    'equip_intensify_cost_second' => [
        102021036,
         3
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'houjun_attack' => 2070,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01
};
get(300020)-> #{
    'sub_type' => 3,
    'up_lvl' => 20,
    'equip_intensify_cost_first' => [
        102021033,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_attack' => 2250,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01,
    'houjun_crit_red_rate' => 0.01
};
get(300021)-> #{
    'sub_type' => 3,
    'up_lvl' => 21,
    'equip_intensify_cost_first' => [
        102021033,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_attack' => 2430,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01,
    'houjun_crit_red_rate' => 0.01
};
get(300022)-> #{
    'sub_type' => 3,
    'up_lvl' => 22,
    'equip_intensify_cost_first' => [
        102021033,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_attack' => 2610,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01,
    'houjun_crit_red_rate' => 0.01
};
get(300023)-> #{
    'sub_type' => 3,
    'up_lvl' => 23,
    'equip_intensify_cost_first' => [
        102021033,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_attack' => 2790,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01,
    'houjun_crit_red_rate' => 0.01
};
get(300024)-> #{
    'sub_type' => 3,
    'up_lvl' => 24,
    'equip_intensify_cost_first' => [
        102021033,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_attack' => 2970,
    'hero_intelect' => 1,
    'troops_skill_hurt_inc_rate' => 0.01,
    'houjun_hurt_inc_rate' => 0.05,
    'houjun_crit_red_rate' => 0.01
};
get(400001)-> #{
    'sub_type' => 4,
    'up_lvl' => 1,
    'equip_intensify_cost_first' => [
        102021004,
         1
    ],
    'equip_intensify_cost_second' => [
        102021006,
         1
    ],
    'first_rate' => 90,
    'fail_add_rate' => 10,
    'houjun_troops' => 60
};
get(400002)-> #{
    'sub_type' => 4,
    'up_lvl' => 2,
    'equip_intensify_cost_first' => [
        102021004,
         2
    ],
    'equip_intensify_cost_second' => [
        102021006,
         2
    ],
    'first_rate' => 70,
    'fail_add_rate' => 10,
    'houjun_troops' => 120
};
get(400003)-> #{
    'sub_type' => 4,
    'up_lvl' => 3,
    'equip_intensify_cost_first' => [
        102021004,
         4
    ],
    'equip_intensify_cost_second' => [
        102021006,
         4
    ],
    'first_rate' => 50,
    'fail_add_rate' => 10,
    'houjun_troops' => 195
};
get(400004)-> #{
    'sub_type' => 4,
    'up_lvl' => 4,
    'equip_intensify_cost_first' => [
        102021004,
         6
    ],
    'equip_intensify_cost_second' => [
        102021006,
         6
    ],
    'first_rate' => 30,
    'fail_add_rate' => 10,
    'houjun_troops' => 270
};
get(400005)-> #{
    'sub_type' => 4,
    'up_lvl' => 5,
    'equip_intensify_cost_first' => [
        102021004,
         8
    ],
    'equip_intensify_cost_second' => [
        102021006,
         8
    ],
    'first_rate' => 20,
    'fail_add_rate' => 8,
    'houjun_troops' => 360
};
get(400006)-> #{
    'sub_type' => 4,
    'up_lvl' => 6,
    'equip_intensify_cost_first' => [
        102021004,
         10
    ],
    'equip_intensify_cost_second' => [
        102021006,
         10
    ],
    'first_rate' => 10,
    'fail_add_rate' => 6,
    'houjun_troops' => 450
};
get(400007)-> #{
    'sub_type' => 4,
    'up_lvl' => 7,
    'equip_intensify_cost_first' => [
        102021004,
         12
    ],
    'equip_intensify_cost_second' => [
        102021006,
         12
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_troops' => 570
};
get(400008)-> #{
    'sub_type' => 4,
    'up_lvl' => 8,
    'equip_intensify_cost_first' => [
        102021004,
         15
    ],
    'equip_intensify_cost_second' => [
        102021006,
         15
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_troops' => 690
};
get(400009)-> #{
    'sub_type' => 4,
    'up_lvl' => 9,
    'equip_intensify_cost_first' => [
        102021014,
         4
    ],
    'equip_intensify_cost_second' => [
        102021016,
         4
    ],
    'first_rate' => 20,
    'fail_add_rate' => 6,
    'houjun_troops' => 825
};
get(400010)-> #{
    'sub_type' => 4,
    'up_lvl' => 10,
    'equip_intensify_cost_first' => [
        102021014,
         6
    ],
    'equip_intensify_cost_second' => [
        102021016,
         6
    ],
    'first_rate' => 12,
    'fail_add_rate' => 4,
    'houjun_troops' => 960
};
get(400011)-> #{
    'sub_type' => 4,
    'up_lvl' => 11,
    'equip_intensify_cost_first' => [
        102021014,
         8
    ],
    'equip_intensify_cost_second' => [
        102021016,
         8
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_troops' => 1125
};
get(400012)-> #{
    'sub_type' => 4,
    'up_lvl' => 12,
    'equip_intensify_cost_first' => [
        102021014,
         10
    ],
    'equip_intensify_cost_second' => [
        102021016,
         10
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'houjun_troops' => 1290,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400013)-> #{
    'sub_type' => 4,
    'up_lvl' => 13,
    'equip_intensify_cost_first' => [
        102021024,
         2
    ],
    'equip_intensify_cost_second' => [
        102021026,
         2
    ],
    'first_rate' => 15,
    'fail_add_rate' => 3,
    'houjun_troops' => 1470,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400014)-> #{
    'sub_type' => 4,
    'up_lvl' => 14,
    'equip_intensify_cost_first' => [
        102021024,
         4
    ],
    'equip_intensify_cost_second' => [
        102021026,
         4
    ],
    'first_rate' => 10,
    'fail_add_rate' => 3,
    'houjun_troops' => 1650,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400015)-> #{
    'sub_type' => 4,
    'up_lvl' => 15,
    'equip_intensify_cost_first' => [
        102021024,
         6
    ],
    'equip_intensify_cost_second' => [
        102021026,
         6
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_troops' => 1865,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400016)-> #{
    'sub_type' => 4,
    'up_lvl' => 16,
    'equip_intensify_cost_first' => [
        102021024,
         8
    ],
    'equip_intensify_cost_second' => [
        102021026,
         8
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'houjun_troops' => 2080,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400017)-> #{
    'sub_type' => 4,
    'up_lvl' => 17,
    'equip_intensify_cost_first' => [
        102021034,
         1
    ],
    'equip_intensify_cost_second' => [
        102021036,
         1
    ],
    'first_rate' => 10,
    'fail_add_rate' => 2,
    'houjun_troops' => 2300,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400018)-> #{
    'sub_type' => 4,
    'up_lvl' => 18,
    'equip_intensify_cost_first' => [
        102021034,
         2
    ],
    'equip_intensify_cost_second' => [
        102021036,
         2
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'houjun_troops' => 2520,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400019)-> #{
    'sub_type' => 4,
    'up_lvl' => 19,
    'equip_intensify_cost_first' => [
        102021034,
         3
    ],
    'equip_intensify_cost_second' => [
        102021036,
         3
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'houjun_troops' => 2760,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(400020)-> #{
    'sub_type' => 4,
    'up_lvl' => 20,
    'equip_intensify_cost_first' => [
        102021034,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_troops' => 3000,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'houjun_parry_rate' => 0.01
};
get(400021)-> #{
    'sub_type' => 4,
    'up_lvl' => 21,
    'equip_intensify_cost_first' => [
        102021034,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_troops' => 3240,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'houjun_parry_rate' => 0.01
};
get(400022)-> #{
    'sub_type' => 4,
    'up_lvl' => 22,
    'equip_intensify_cost_first' => [
        102021034,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_troops' => 3480,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'houjun_parry_rate' => 0.01
};
get(400023)-> #{
    'sub_type' => 4,
    'up_lvl' => 23,
    'equip_intensify_cost_first' => [
        102021034,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_troops' => 3720,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'houjun_parry_rate' => 0.01
};
get(400024)-> #{
    'sub_type' => 4,
    'up_lvl' => 24,
    'equip_intensify_cost_first' => [
        102021034,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'houjun_troops' => 3960,
    'hero_spirit' => 1,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01,
    'houjun_hurt_red_rate' => 0.05,
    'houjun_parry_rate' => 0.01
};
get(500001)-> #{
    'sub_type' => 5,
    'up_lvl' => 1,
    'equip_intensify_cost_first' => [
        102021005,
         1
    ],
    'equip_intensify_cost_second' => [
        102021006,
         1
    ],
    'first_rate' => 90,
    'fail_add_rate' => 10,
    'qianjun_defence' => 23,
    'houjun_defence' => 23
};
get(500002)-> #{
    'sub_type' => 5,
    'up_lvl' => 2,
    'equip_intensify_cost_first' => [
        102021005,
         2
    ],
    'equip_intensify_cost_second' => [
        102021006,
         2
    ],
    'first_rate' => 70,
    'fail_add_rate' => 10,
    'qianjun_defence' => 45,
    'houjun_defence' => 45
};
get(500003)-> #{
    'sub_type' => 5,
    'up_lvl' => 3,
    'equip_intensify_cost_first' => [
        102021005,
         4
    ],
    'equip_intensify_cost_second' => [
        102021006,
         4
    ],
    'first_rate' => 50,
    'fail_add_rate' => 10,
    'qianjun_defence' => 75,
    'houjun_defence' => 75
};
get(500004)-> #{
    'sub_type' => 5,
    'up_lvl' => 4,
    'equip_intensify_cost_first' => [
        102021005,
         6
    ],
    'equip_intensify_cost_second' => [
        102021006,
         6
    ],
    'first_rate' => 30,
    'fail_add_rate' => 10,
    'qianjun_defence' => 105,
    'houjun_defence' => 105
};
get(500005)-> #{
    'sub_type' => 5,
    'up_lvl' => 5,
    'equip_intensify_cost_first' => [
        102021005,
         8
    ],
    'equip_intensify_cost_second' => [
        102021006,
         8
    ],
    'first_rate' => 20,
    'fail_add_rate' => 8,
    'qianjun_defence' => 143,
    'houjun_defence' => 143
};
get(500006)-> #{
    'sub_type' => 5,
    'up_lvl' => 6,
    'equip_intensify_cost_first' => [
        102021005,
         10
    ],
    'equip_intensify_cost_second' => [
        102021006,
         10
    ],
    'first_rate' => 10,
    'fail_add_rate' => 6,
    'qianjun_defence' => 180,
    'houjun_defence' => 180
};
get(500007)-> #{
    'sub_type' => 5,
    'up_lvl' => 7,
    'equip_intensify_cost_first' => [
        102021005,
         12
    ],
    'equip_intensify_cost_second' => [
        102021006,
         12
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_defence' => 225,
    'houjun_defence' => 225
};
get(500008)-> #{
    'sub_type' => 5,
    'up_lvl' => 8,
    'equip_intensify_cost_first' => [
        102021005,
         15
    ],
    'equip_intensify_cost_second' => [
        102021006,
         15
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_defence' => 270,
    'houjun_defence' => 270
};
get(500009)-> #{
    'sub_type' => 5,
    'up_lvl' => 9,
    'equip_intensify_cost_first' => [
        102021015,
         4
    ],
    'equip_intensify_cost_second' => [
        102021016,
         4
    ],
    'first_rate' => 20,
    'fail_add_rate' => 6,
    'qianjun_defence' => 323,
    'houjun_defence' => 323
};
get(500010)-> #{
    'sub_type' => 5,
    'up_lvl' => 10,
    'equip_intensify_cost_first' => [
        102021015,
         6
    ],
    'equip_intensify_cost_second' => [
        102021016,
         6
    ],
    'first_rate' => 12,
    'fail_add_rate' => 4,
    'qianjun_defence' => 375,
    'houjun_defence' => 375
};
get(500011)-> #{
    'sub_type' => 5,
    'up_lvl' => 11,
    'equip_intensify_cost_first' => [
        102021015,
         8
    ],
    'equip_intensify_cost_second' => [
        102021016,
         8
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_defence' => 435,
    'houjun_defence' => 435
};
get(500012)-> #{
    'sub_type' => 5,
    'up_lvl' => 12,
    'equip_intensify_cost_first' => [
        102021015,
         10
    ],
    'equip_intensify_cost_second' => [
        102021016,
         10
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_defence' => 495,
    'houjun_defence' => 495,
    'qianjun_speed' => 5,
    'houjun_speed' => 5
};
get(500013)-> #{
    'sub_type' => 5,
    'up_lvl' => 13,
    'equip_intensify_cost_first' => [
        102021025,
         2
    ],
    'equip_intensify_cost_second' => [
        102021026,
         2
    ],
    'first_rate' => 15,
    'fail_add_rate' => 3,
    'qianjun_defence' => 563,
    'houjun_defence' => 563,
    'qianjun_speed' => 5,
    'houjun_speed' => 5
};
get(500014)-> #{
    'sub_type' => 5,
    'up_lvl' => 14,
    'equip_intensify_cost_first' => [
        102021025,
         4
    ],
    'equip_intensify_cost_second' => [
        102021026,
         4
    ],
    'first_rate' => 10,
    'fail_add_rate' => 3,
    'qianjun_defence' => 630,
    'houjun_defence' => 630,
    'qianjun_speed' => 5,
    'houjun_speed' => 5
};
get(500015)-> #{
    'sub_type' => 5,
    'up_lvl' => 15,
    'equip_intensify_cost_first' => [
        102021025,
         6
    ],
    'equip_intensify_cost_second' => [
        102021026,
         6
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_defence' => 705,
    'houjun_defence' => 705,
    'qianjun_speed' => 5,
    'houjun_speed' => 5
};
get(500016)-> #{
    'sub_type' => 5,
    'up_lvl' => 16,
    'equip_intensify_cost_first' => [
        102021025,
         8
    ],
    'equip_intensify_cost_second' => [
        102021026,
         8
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_defence' => 780,
    'houjun_defence' => 780,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03
};
get(500017)-> #{
    'sub_type' => 5,
    'up_lvl' => 17,
    'equip_intensify_cost_first' => [
        102021035,
         1
    ],
    'equip_intensify_cost_second' => [
        102021036,
         1
    ],
    'first_rate' => 10,
    'fail_add_rate' => 2,
    'qianjun_defence' => 863,
    'houjun_defence' => 863,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03
};
get(500018)-> #{
    'sub_type' => 5,
    'up_lvl' => 18,
    'equip_intensify_cost_first' => [
        102021035,
         2
    ],
    'equip_intensify_cost_second' => [
        102021036,
         2
    ],
    'first_rate' => 8,
    'fail_add_rate' => 2,
    'qianjun_defence' => 945,
    'houjun_defence' => 945,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03
};
get(500019)-> #{
    'sub_type' => 5,
    'up_lvl' => 19,
    'equip_intensify_cost_first' => [
        102021035,
         3
    ],
    'equip_intensify_cost_second' => [
        102021036,
         3
    ],
    'first_rate' => 6,
    'fail_add_rate' => 2,
    'qianjun_defence' => 1035,
    'houjun_defence' => 1035,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03
};
get(500020)-> #{
    'sub_type' => 5,
    'up_lvl' => 20,
    'equip_intensify_cost_first' => [
        102021035,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_defence' => 1125,
    'houjun_defence' => 1125,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03,
    'hurt_hurt_inc_rate' => 3.0
};
get(500021)-> #{
    'sub_type' => 5,
    'up_lvl' => 21,
    'equip_intensify_cost_first' => [
        102021035,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_defence' => 1215,
    'houjun_defence' => 1215,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03,
    'hurt_hurt_inc_rate' => 3.0
};
get(500022)-> #{
    'sub_type' => 5,
    'up_lvl' => 22,
    'equip_intensify_cost_first' => [
        102021035,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_defence' => 1305,
    'houjun_defence' => 1305,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03,
    'hurt_hurt_inc_rate' => 3.0
};
get(500023)-> #{
    'sub_type' => 5,
    'up_lvl' => 23,
    'equip_intensify_cost_first' => [
        102021035,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_defence' => 1395,
    'houjun_defence' => 1395,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03,
    'hurt_hurt_inc_rate' => 3.0
};
get(500024)-> #{
    'sub_type' => 5,
    'up_lvl' => 24,
    'equip_intensify_cost_first' => [
        102021035,
         5
    ],
    'equip_intensify_cost_second' => [
        102021036,
         5
    ],
    'first_rate' => 5,
    'fail_add_rate' => 2,
    'qianjun_defence' => 1485,
    'houjun_defence' => 1485,
    'qianjun_speed' => 5,
    'houjun_speed' => 5,
    'hurt_red_rate' => 0.03,
    'hurt_hurt_inc_rate' => 3.0,
    'crit_rate' => 0.03,
    'parry_rate' => 0.03
};

get(_N) -> false.
get_list() ->
	[100001,100002,100003,100004,100005,100006,100007,100008,100009,100010,100011,100012,100013,100014,100015,100016,100017,100018,100019,100020,100021,100022,100023,100024,200001,200002,200003,200004,200005,200006,200007,200008,200009,200010,200011,200012,200013,200014,200015,200016,200017,200018,200019,200020,200021,200022,200023,200024,300001,300002,300003,300004,300005,300006,300007,300008,300009,300010,300011,300012,300013,300014,300015,300016,300017,300018,300019,300020,300021,300022,300023,300024,400001,400002,400003,400004,400005,400006,400007,400008,400009,400010,400011,400012,400013,400014,400015,400016,400017,400018,400019,400020,400021,400022,400023,400024,500001,500002,500003,500004,500005,500006,500007,500008,500009,500010,500011,500012,500013,500014,500015,500016,500017,500018,500019,500020,500021,500022,500023,500024].
