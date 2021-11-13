%%--- coding:utf-8 ---
-module(tb_hero_star_prop).
-export([get/1,get_list/0]).
get(10100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(10900)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(10901)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(10902)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(10903)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(10904)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(10905)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(10906)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(10907)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(10908)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(10909)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(10910)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(10911)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(10912)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(10913)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(10914)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(10915)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(10916)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(10917)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(10918)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11000)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11001)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11002)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11003)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11004)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11005)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11006)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11007)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11008)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11009)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11010)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11011)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11012)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11013)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11014)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11015)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11016)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11017)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11018)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(11900)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(11901)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(11902)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(11903)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(11904)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(11905)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(11906)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(11907)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(11908)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(11909)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(11910)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(11911)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(11912)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(11913)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(11914)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(11915)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(11916)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(11917)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(11918)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(12000)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(12001)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(12002)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(12003)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(12004)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(12005)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(12006)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(12007)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(12008)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(12009)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(12010)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(12011)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(12012)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(12013)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(12014)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(12015)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(12016)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(12017)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(12018)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(12100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(12101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(12102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(12103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(12104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(12105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(12106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(12107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(12108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(12109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(12110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(12111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(12112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(12113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(12114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(12115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(12116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(12117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(12118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(12200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(12201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(12202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(12203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(12204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(12205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(12206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(12207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(12208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(12209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(12210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(12211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(12212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(12213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(12214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(12215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(12216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(12217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(12218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(12300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(12301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(12302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(12303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(12304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(12305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(12306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(12307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(12308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(12309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(12310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(12311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(12312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(12313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(12314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(12315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(12316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(12317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(12318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(20900)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(20901)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(20902)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(20903)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(20904)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(20905)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(20906)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(20907)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(20908)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(20909)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(20910)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(20911)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(20912)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(20913)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(20914)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(20915)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(20916)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(20917)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(20918)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(21000)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(21001)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(21002)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(21003)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(21004)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(21005)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(21006)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(21007)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(21008)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(21009)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(21010)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(21011)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(21012)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(21013)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(21014)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(21015)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(21016)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(21017)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(21018)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(21100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(21101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(21102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(21103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(21104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(21105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(21106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(21107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(21108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(21109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(21110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(21111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(21112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(21113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(21114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(21115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(21116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(21117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(21118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(21200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(21201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(21202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(21203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(21204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(21205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(21206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(21207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(21208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(21209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(21210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(21211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(21212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(21213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(21214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(21215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(21216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(21217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(21218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(21300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(21301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(21302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(21303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(21304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(21305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(21306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(21307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(21308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(21309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(21310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(21311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(21312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(21313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(21314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(21315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(21316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(21317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(21318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(21400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(21401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(21402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(21403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(21404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(21405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(21406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(21407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(21408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(21409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(21410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(21411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(21412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(21413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(21414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(21415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(21416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(21417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(21418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(21500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(21501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(21502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(21503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(21504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(21505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(21506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(21507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(21508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(21509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(21510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(21511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(21512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(21513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(21514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(21515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(21516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(21517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(21518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(30900)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(30901)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(30902)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(30903)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(30904)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(30905)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(30906)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(30907)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(30908)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(30909)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(30910)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(30911)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(30912)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(30913)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(30914)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(30915)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(30916)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(30917)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(30918)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31000)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31001)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31002)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31003)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31004)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31005)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31006)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31007)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31008)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31009)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31010)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31011)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31012)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31013)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31014)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31015)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31016)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31017)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31018)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(31800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(31801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(31802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(31803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(31804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(31805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(31806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(31807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(31808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(31809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(31810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(31811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(31812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(31813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(31814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(31815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(31816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(31817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(31818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(40900)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(40901)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(40902)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(40903)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(40904)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(40905)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(40906)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(40907)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(40908)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(40909)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(40910)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(40911)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(40912)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(40913)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(40914)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(40915)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(40916)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(40917)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(40918)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(41000)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(41001)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(41002)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(41003)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(41004)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(41005)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(41006)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(41007)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(41008)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(41009)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(41010)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(41011)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(41012)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(41013)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(41014)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(41015)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(41016)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(41017)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(41018)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(41100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(41101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(41102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(41103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(41104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(41105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(41106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(41107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(41108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(41109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(41110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(41111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(41112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(41113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(41114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(41115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(41116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(41117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(41118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(41200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(41201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(41202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(41203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(41204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(41205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(41206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(41207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(41208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(41209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(41210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(41211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(41212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(41213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(41214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(41215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(41216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(41217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(41218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(41300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(41301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(41302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(41303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(41304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(41305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(41306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(41307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(41308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(41309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(41310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(41311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(41312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(41313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(41314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(41315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(41316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(41317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(41318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(41400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(41401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(41402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(41403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(41404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(41405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(41406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(41407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(41408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(41409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(41410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(41411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(41412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(41413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(41414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(41415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(41416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(41417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(41418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(41500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(41501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(41502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(41503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(41504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(41505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(41506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(41507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(41508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(41509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(41510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(41511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(41512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(41513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(41514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(41515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(41516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(41517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(41518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50500)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50501)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50502)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50503)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50504)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50505)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50506)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50507)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50508)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50509)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50510)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50511)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50512)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50513)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50514)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50515)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50516)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50517)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50518)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50600)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50601)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50602)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50603)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50604)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50605)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50606)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50607)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50608)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50609)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50610)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50611)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50612)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50613)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50614)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50615)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50616)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50617)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50618)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50700)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50701)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50702)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50703)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50704)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50705)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50706)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50707)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50708)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50709)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50710)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50711)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50712)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50713)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50714)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50715)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50716)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50717)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50718)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50800)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50801)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50802)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50803)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50804)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50805)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50806)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50807)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50808)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50809)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50810)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50811)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50812)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50813)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50814)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50815)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50816)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50817)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50818)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(50900)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(50901)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(50902)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(50903)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(50904)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(50905)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(50906)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(50907)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(50908)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(50909)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(50910)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(50911)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(50912)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(50913)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(50914)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(50915)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(50916)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(50917)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(50918)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(51000)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(51001)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(51002)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(51003)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(51004)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(51005)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(51006)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(51007)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(51008)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(51009)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(51010)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(51011)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(51012)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(51013)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(51014)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(51015)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(51016)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(51017)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(51018)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(51100)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(51101)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(51102)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(51103)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(51104)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(51105)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(51106)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(51107)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(51108)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(51109)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(51110)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(51111)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(51112)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(51113)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(51114)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(51115)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(51116)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(51117)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(51118)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(51200)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(51201)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(51202)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(51203)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(51204)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(51205)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(51206)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(51207)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(51208)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(51209)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(51210)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(51211)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(51212)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(51213)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(51214)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(51215)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(51216)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(51217)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(51218)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(51300)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(51301)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(51302)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(51303)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(51304)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(51305)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(51306)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(51307)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(51308)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(51309)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(51310)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(51311)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(51312)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(51313)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(51314)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(51315)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(51316)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(51317)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(51318)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};
get(51400)-> #{
    'star' => 0,
    'qianjun_base_attack_rate' => 0.0,
    'qianjun_base_defence_rate' => 0.0,
    'houjun_base_attack_rate' => 0.0,
    'houjun_base_defence_rate' => 0.0
};
get(51401)-> #{
    'star' => 1,
    'qianjun_base_attack_rate' => 0.1,
    'qianjun_base_defence_rate' => 0.1,
    'houjun_base_attack_rate' => 0.1,
    'houjun_base_defence_rate' => 0.1
};
get(51402)-> #{
    'star' => 2,
    'qianjun_base_attack_rate' => 0.2,
    'qianjun_base_defence_rate' => 0.2,
    'houjun_base_attack_rate' => 0.2,
    'houjun_base_defence_rate' => 0.2
};
get(51403)-> #{
    'star' => 3,
    'qianjun_base_attack_rate' => 0.3,
    'qianjun_base_defence_rate' => 0.3,
    'houjun_base_attack_rate' => 0.3,
    'houjun_base_defence_rate' => 0.3
};
get(51404)-> #{
    'star' => 4,
    'qianjun_base_attack_rate' => 0.4,
    'qianjun_base_defence_rate' => 0.4,
    'houjun_base_attack_rate' => 0.4,
    'houjun_base_defence_rate' => 0.4
};
get(51405)-> #{
    'star' => 5,
    'qianjun_base_attack_rate' => 0.5,
    'qianjun_base_defence_rate' => 0.5,
    'houjun_base_attack_rate' => 0.5,
    'houjun_base_defence_rate' => 0.5
};
get(51406)-> #{
    'star' => 6,
    'qianjun_base_attack_rate' => 0.8,
    'qianjun_base_defence_rate' => 0.8,
    'houjun_base_attack_rate' => 0.8,
    'houjun_base_defence_rate' => 0.8
};
get(51407)-> #{
    'star' => 7,
    'qianjun_base_attack_rate' => 0.95,
    'qianjun_base_defence_rate' => 0.95,
    'houjun_base_attack_rate' => 0.95,
    'houjun_base_defence_rate' => 0.95
};
get(51408)-> #{
    'star' => 8,
    'qianjun_base_attack_rate' => 1.1,
    'qianjun_base_defence_rate' => 1.1,
    'houjun_base_attack_rate' => 1.1,
    'houjun_base_defence_rate' => 1.1
};
get(51409)-> #{
    'star' => 9,
    'qianjun_base_attack_rate' => 1.25,
    'qianjun_base_defence_rate' => 1.25,
    'houjun_base_attack_rate' => 1.25,
    'houjun_base_defence_rate' => 1.25
};
get(51410)-> #{
    'star' => 10,
    'qianjun_base_attack_rate' => 1.4,
    'qianjun_base_defence_rate' => 1.4,
    'houjun_base_attack_rate' => 1.4,
    'houjun_base_defence_rate' => 1.4
};
get(51411)-> #{
    'star' => 11,
    'qianjun_base_attack_rate' => 1.55,
    'qianjun_base_defence_rate' => 1.55,
    'houjun_base_attack_rate' => 1.55,
    'houjun_base_defence_rate' => 1.55
};
get(51412)-> #{
    'star' => 12,
    'qianjun_base_attack_rate' => 2.0,
    'qianjun_base_defence_rate' => 2.0,
    'houjun_base_attack_rate' => 2.0,
    'houjun_base_defence_rate' => 2.0
};
get(51413)-> #{
    'star' => 13,
    'qianjun_base_attack_rate' => 2.2,
    'qianjun_base_defence_rate' => 2.2,
    'houjun_base_attack_rate' => 2.2,
    'houjun_base_defence_rate' => 2.2
};
get(51414)-> #{
    'star' => 14,
    'qianjun_base_attack_rate' => 2.4,
    'qianjun_base_defence_rate' => 2.4,
    'houjun_base_attack_rate' => 2.4,
    'houjun_base_defence_rate' => 2.4
};
get(51415)-> #{
    'star' => 15,
    'qianjun_base_attack_rate' => 2.6,
    'qianjun_base_defence_rate' => 2.6,
    'houjun_base_attack_rate' => 2.6,
    'houjun_base_defence_rate' => 2.6
};
get(51416)-> #{
    'star' => 16,
    'qianjun_base_attack_rate' => 2.8,
    'qianjun_base_defence_rate' => 2.8,
    'houjun_base_attack_rate' => 2.8,
    'houjun_base_defence_rate' => 2.8
};
get(51417)-> #{
    'star' => 17,
    'qianjun_base_attack_rate' => 3.0,
    'qianjun_base_defence_rate' => 3.0,
    'houjun_base_attack_rate' => 3.0,
    'houjun_base_defence_rate' => 3.0
};
get(51418)-> #{
    'star' => 18,
    'qianjun_base_attack_rate' => 3.6,
    'qianjun_base_defence_rate' => 3.6,
    'houjun_base_attack_rate' => 3.6,
    'houjun_base_defence_rate' => 3.6
};

get(_N) -> false.
get_list() ->
	[10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10114,10115,10116,10117,10118,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10300,10301,10302,10303,10304,10305,10306,10307,10308,10309,10310,10311,10312,10313,10314,10315,10316,10317,10318,10400,10401,10402,10403,10404,10405,10406,10407,10408,10409,10410,10411,10412,10413,10414,10415,10416,10417,10418,10500,10501,10502,10503,10504,10505,10506,10507,10508,10509,10510,10511,10512,10513,10514,10515,10516,10517,10518,10600,10601,10602,10603,10604,10605,10606,10607,10608,10609,10610,10611,10612,10613,10614,10615,10616,10617,10618,10700,10701,10702,10703,10704,10705,10706,10707,10708,10709,10710,10711,10712,10713,10714,10715,10716,10717,10718,10800,10801,10802,10803,10804,10805,10806,10807,10808,10809,10810,10811,10812,10813,10814,10815,10816,10817,10818,10900,10901,10902,10903,10904,10905,10906,10907,10908,10909,10910,10911,10912,10913,10914,10915,10916,10917,10918,11000,11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11100,11101,11102,11103,11104,11105,11106,11107,11108,11109,11110,11111,11112,11113,11114,11115,11116,11117,11118,11200,11201,11202,11203,11204,11205,11206,11207,11208,11209,11210,11211,11212,11213,11214,11215,11216,11217,11218,11300,11301,11302,11303,11304,11305,11306,11307,11308,11309,11310,11311,11312,11313,11314,11315,11316,11317,11318,11400,11401,11402,11403,11404,11405,11406,11407,11408,11409,11410,11411,11412,11413,11414,11415,11416,11417,11418,11500,11501,11502,11503,11504,11505,11506,11507,11508,11509,11510,11511,11512,11513,11514,11515,11516,11517,11518,11600,11601,11602,11603,11604,11605,11606,11607,11608,11609,11610,11611,11612,11613,11614,11615,11616,11617,11618,11700,11701,11702,11703,11704,11705,11706,11707,11708,11709,11710,11711,11712,11713,11714,11715,11716,11717,11718,11800,11801,11802,11803,11804,11805,11806,11807,11808,11809,11810,11811,11812,11813,11814,11815,11816,11817,11818,11900,11901,11902,11903,11904,11905,11906,11907,11908,11909,11910,11911,11912,11913,11914,11915,11916,11917,11918,12000,12001,12002,12003,12004,12005,12006,12007,12008,12009,12010,12011,12012,12013,12014,12015,12016,12017,12018,12100,12101,12102,12103,12104,12105,12106,12107,12108,12109,12110,12111,12112,12113,12114,12115,12116,12117,12118,12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211,12212,12213,12214,12215,12216,12217,12218,12300,12301,12302,12303,12304,12305,12306,12307,12308,12309,12310,12311,12312,12313,12314,12315,12316,12317,12318,20100,20101,20102,20103,20104,20105,20106,20107,20108,20109,20110,20111,20112,20113,20114,20115,20116,20117,20118,20200,20201,20202,20203,20204,20205,20206,20207,20208,20209,20210,20211,20212,20213,20214,20215,20216,20217,20218,20300,20301,20302,20303,20304,20305,20306,20307,20308,20309,20310,20311,20312,20313,20314,20315,20316,20317,20318,20400,20401,20402,20403,20404,20405,20406,20407,20408,20409,20410,20411,20412,20413,20414,20415,20416,20417,20418,20500,20501,20502,20503,20504,20505,20506,20507,20508,20509,20510,20511,20512,20513,20514,20515,20516,20517,20518,20600,20601,20602,20603,20604,20605,20606,20607,20608,20609,20610,20611,20612,20613,20614,20615,20616,20617,20618,20700,20701,20702,20703,20704,20705,20706,20707,20708,20709,20710,20711,20712,20713,20714,20715,20716,20717,20718,20800,20801,20802,20803,20804,20805,20806,20807,20808,20809,20810,20811,20812,20813,20814,20815,20816,20817,20818,20900,20901,20902,20903,20904,20905,20906,20907,20908,20909,20910,20911,20912,20913,20914,20915,20916,20917,20918,21000,21001,21002,21003,21004,21005,21006,21007,21008,21009,21010,21011,21012,21013,21014,21015,21016,21017,21018,21100,21101,21102,21103,21104,21105,21106,21107,21108,21109,21110,21111,21112,21113,21114,21115,21116,21117,21118,21200,21201,21202,21203,21204,21205,21206,21207,21208,21209,21210,21211,21212,21213,21214,21215,21216,21217,21218,21300,21301,21302,21303,21304,21305,21306,21307,21308,21309,21310,21311,21312,21313,21314,21315,21316,21317,21318,21400,21401,21402,21403,21404,21405,21406,21407,21408,21409,21410,21411,21412,21413,21414,21415,21416,21417,21418,21500,21501,21502,21503,21504,21505,21506,21507,21508,21509,21510,21511,21512,21513,21514,21515,21516,21517,21518,30100,30101,30102,30103,30104,30105,30106,30107,30108,30109,30110,30111,30112,30113,30114,30115,30116,30117,30118,30200,30201,30202,30203,30204,30205,30206,30207,30208,30209,30210,30211,30212,30213,30214,30215,30216,30217,30218,30300,30301,30302,30303,30304,30305,30306,30307,30308,30309,30310,30311,30312,30313,30314,30315,30316,30317,30318,30400,30401,30402,30403,30404,30405,30406,30407,30408,30409,30410,30411,30412,30413,30414,30415,30416,30417,30418,30500,30501,30502,30503,30504,30505,30506,30507,30508,30509,30510,30511,30512,30513,30514,30515,30516,30517,30518,30600,30601,30602,30603,30604,30605,30606,30607,30608,30609,30610,30611,30612,30613,30614,30615,30616,30617,30618,30700,30701,30702,30703,30704,30705,30706,30707,30708,30709,30710,30711,30712,30713,30714,30715,30716,30717,30718,30800,30801,30802,30803,30804,30805,30806,30807,30808,30809,30810,30811,30812,30813,30814,30815,30816,30817,30818,30900,30901,30902,30903,30904,30905,30906,30907,30908,30909,30910,30911,30912,30913,30914,30915,30916,30917,30918,31000,31001,31002,31003,31004,31005,31006,31007,31008,31009,31010,31011,31012,31013,31014,31015,31016,31017,31018,31100,31101,31102,31103,31104,31105,31106,31107,31108,31109,31110,31111,31112,31113,31114,31115,31116,31117,31118,31200,31201,31202,31203,31204,31205,31206,31207,31208,31209,31210,31211,31212,31213,31214,31215,31216,31217,31218,31300,31301,31302,31303,31304,31305,31306,31307,31308,31309,31310,31311,31312,31313,31314,31315,31316,31317,31318,31400,31401,31402,31403,31404,31405,31406,31407,31408,31409,31410,31411,31412,31413,31414,31415,31416,31417,31418,31500,31501,31502,31503,31504,31505,31506,31507,31508,31509,31510,31511,31512,31513,31514,31515,31516,31517,31518,31600,31601,31602,31603,31604,31605,31606,31607,31608,31609,31610,31611,31612,31613,31614,31615,31616,31617,31618,31700,31701,31702,31703,31704,31705,31706,31707,31708,31709,31710,31711,31712,31713,31714,31715,31716,31717,31718,31800,31801,31802,31803,31804,31805,31806,31807,31808,31809,31810,31811,31812,31813,31814,31815,31816,31817,31818,40100,40101,40102,40103,40104,40105,40106,40107,40108,40109,40110,40111,40112,40113,40114,40115,40116,40117,40118,40200,40201,40202,40203,40204,40205,40206,40207,40208,40209,40210,40211,40212,40213,40214,40215,40216,40217,40218,40300,40301,40302,40303,40304,40305,40306,40307,40308,40309,40310,40311,40312,40313,40314,40315,40316,40317,40318,40400,40401,40402,40403,40404,40405,40406,40407,40408,40409,40410,40411,40412,40413,40414,40415,40416,40417,40418,40500,40501,40502,40503,40504,40505,40506,40507,40508,40509,40510,40511,40512,40513,40514,40515,40516,40517,40518,40600,40601,40602,40603,40604,40605,40606,40607,40608,40609,40610,40611,40612,40613,40614,40615,40616,40617,40618,40700,40701,40702,40703,40704,40705,40706,40707,40708,40709,40710,40711,40712,40713,40714,40715,40716,40717,40718,40800,40801,40802,40803,40804,40805,40806,40807,40808,40809,40810,40811,40812,40813,40814,40815,40816,40817,40818,40900,40901,40902,40903,40904,40905,40906,40907,40908,40909,40910,40911,40912,40913,40914,40915,40916,40917,40918,41000,41001,41002,41003,41004,41005,41006,41007,41008,41009,41010,41011,41012,41013,41014,41015,41016,41017,41018,41100,41101,41102,41103,41104,41105,41106,41107,41108,41109,41110,41111,41112,41113,41114,41115,41116,41117,41118,41200,41201,41202,41203,41204,41205,41206,41207,41208,41209,41210,41211,41212,41213,41214,41215,41216,41217,41218,41300,41301,41302,41303,41304,41305,41306,41307,41308,41309,41310,41311,41312,41313,41314,41315,41316,41317,41318,41400,41401,41402,41403,41404,41405,41406,41407,41408,41409,41410,41411,41412,41413,41414,41415,41416,41417,41418,41500,41501,41502,41503,41504,41505,41506,41507,41508,41509,41510,41511,41512,41513,41514,41515,41516,41517,41518,50100,50101,50102,50103,50104,50105,50106,50107,50108,50109,50110,50111,50112,50113,50114,50115,50116,50117,50118,50200,50201,50202,50203,50204,50205,50206,50207,50208,50209,50210,50211,50212,50213,50214,50215,50216,50217,50218,50300,50301,50302,50303,50304,50305,50306,50307,50308,50309,50310,50311,50312,50313,50314,50315,50316,50317,50318,50400,50401,50402,50403,50404,50405,50406,50407,50408,50409,50410,50411,50412,50413,50414,50415,50416,50417,50418,50500,50501,50502,50503,50504,50505,50506,50507,50508,50509,50510,50511,50512,50513,50514,50515,50516,50517,50518,50600,50601,50602,50603,50604,50605,50606,50607,50608,50609,50610,50611,50612,50613,50614,50615,50616,50617,50618,50700,50701,50702,50703,50704,50705,50706,50707,50708,50709,50710,50711,50712,50713,50714,50715,50716,50717,50718,50800,50801,50802,50803,50804,50805,50806,50807,50808,50809,50810,50811,50812,50813,50814,50815,50816,50817,50818,50900,50901,50902,50903,50904,50905,50906,50907,50908,50909,50910,50911,50912,50913,50914,50915,50916,50917,50918,51000,51001,51002,51003,51004,51005,51006,51007,51008,51009,51010,51011,51012,51013,51014,51015,51016,51017,51018,51100,51101,51102,51103,51104,51105,51106,51107,51108,51109,51110,51111,51112,51113,51114,51115,51116,51117,51118,51200,51201,51202,51203,51204,51205,51206,51207,51208,51209,51210,51211,51212,51213,51214,51215,51216,51217,51218,51300,51301,51302,51303,51304,51305,51306,51307,51308,51309,51310,51311,51312,51313,51314,51315,51316,51317,51318,51400,51401,51402,51403,51404,51405,51406,51407,51408,51409,51410,51411,51412,51413,51414,51415,51416,51417,51418].
