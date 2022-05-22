%%--- coding:utf-8 ---
-module(tb_hero_skill).
-export([get/1,get_list/0]).
get(101101)-> #{
    'type' => 1,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007001,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 2,
    'hero_spirit' => 90.0
};
get(101102)-> #{
    'type' => 1,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007002,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 2,
    'hero_strength' => 85.0
};
get(101103)-> #{
    'type' => 1,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007003,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 2,
    'hero_strength' => 90.0
};
get(101104)-> #{
    'type' => 1,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007004,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 1,
    'hero_leadership' => 90.0
};
get(101105)-> #{
    'type' => 1,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007005,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 1,
    'hero_intelect' => 90.0
};
get(101106)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 2,
    'fragment_id' => 102007006,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101107)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007007,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101108)-> #{
    'type' => 1,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007008,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 1,
    'hero_intelect' => 85.0
};
get(101109)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007009,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_intelect' => 90.0
};
get(101110)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007010,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_strength' => 90.0
};
get(101111)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007011,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_spirit' => 95.0
};
get(101112)-> #{
    'type' => 1,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007012,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 2,
    'hero_strength' => 95.0
};
get(101113)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007013,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_leadership' => 95.0
};
get(101114)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007014,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_intelect' => 95.0
};
get(101115)-> #{
    'type' => 1,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007015,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 1,
    'hero_spirit' => 90.0
};
get(101116)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007016,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_strength' => 95.0,
    'hero_leadership' => 90.0
};
get(101117)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007017,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_spirit' => 85.0,
    'hero_leadership' => 85.0
};
get(101118)-> #{
    'type' => 1,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007018,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 1
};
get(101119)-> #{
    'type' => 1,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007019,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 2
};
get(101120)-> #{
    'type' => 1,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007020,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 2,
    'hero_strength' => 98.0
};
get(101121)-> #{
    'type' => 1,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007021,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'skill_type' => 1,
    'hero_intelect' => 98.0
};
get(101122)-> #{
    'type' => 1,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007022,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_strength' => 90.0,
    'hero_intelect' => 90.0
};
get(201201)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007101,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101201)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007102,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201202)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007103,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101202)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007104,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201203)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007105,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201204)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007106,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101203)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007107,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201205)-> #{
    'type' => 2,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007108,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101301)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007201,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101302)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007202,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201301)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007203,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201302)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007204,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201303)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007205,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201304)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007206,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101303)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007207,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201305)-> #{
    'type' => 3,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007208,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201401)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007301,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201402)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007302,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201403)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007303,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101401)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007304,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201404)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007305,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101402)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007306,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101403)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007307,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201405)-> #{
    'type' => 4,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007308,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201501)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007401,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101501)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007402,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201502)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007403,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201503)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007404,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201504)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007405,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101502)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007406,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(101503)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007407,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201505)-> #{
    'type' => 5,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007408,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201601)-> #{
    'type' => 6,
    'hero_type' => 4,
    'sex' => 0,
    'fragment_id' => 102007501,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_intelect' => 90.0
};
get(201602)-> #{
    'type' => 6,
    'hero_type' => 5,
    'sex' => 0,
    'fragment_id' => 102007502,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_strength' => 90.0
};
get(201603)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007503,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_leadership' => 85.0
};
get(201604)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007504,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_spirit' => 90.0,
    'hero_leadership' => 90.0
};
get(201605)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007505,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'max_level' => 6
};
get(201606)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007506,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'max_level' => 6
};
get(201607)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007507,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'max_level' => 6
};
get(201608)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007508,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'max_level' => 6
};
get(201609)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007509,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 20
};
get(201610)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007510,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 20
};
get(201611)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007511,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 20
};
get(201612)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007512,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 20
};
get(201613)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007513,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_intelect' => 85.0,
    'hero_spirit' => 90.0
};
get(201614)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007514,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_strength' => 85.0,
    'hero_leadership' => 90.0
};
get(201615)-> #{
    'type' => 6,
    'hero_type' => 3,
    'sex' => 0,
    'fragment_id' => 102007515,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25
};
get(201616)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007516,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_intelect' => 90.0,
    'hero_leadership' => 90.0
};
get(201617)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007517,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_spirit' => 98.0
};
get(201618)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007518,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_leadership' => 98.0
};
get(201619)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007519,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_intelect' => 98.0
};
get(201620)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007520,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_spirit' => 95.0
};
get(201621)-> #{
    'type' => 6,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007521,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 50000,
    'max_level' => 25,
    'hero_strength' => 95.0,
    'hero_intelect' => 95.0
};
get(201701)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007601,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201702)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007602,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201703)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007603,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201704)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007604,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201705)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007605,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201706)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007606,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201707)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007607,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};
get(201708)-> #{
    'type' => 7,
    'hero_type' => 0,
    'sex' => 0,
    'fragment_id' => 102007608,
    'resource_id' => 101001003,
    'reset_id' => 102006004,
    'fragment_num' => 5,
    'resource_num' => 150000,
    'max_level' => 25
};

get(_N) -> false.
get_list() ->
	[101101,101102,101103,101104,101105,101106,101107,101108,101109,101110,101111,101112,101113,101114,101115,101116,101117,101118,101119,101120,101121,101122,201201,101201,201202,101202,201203,201204,101203,201205,101301,101302,201301,201302,201303,201304,101303,201305,201401,201402,201403,101401,201404,101402,101403,201405,201501,101501,201502,201503,201504,101502,101503,201505,201601,201602,201603,201604,201605,201606,201607,201608,201609,201610,201611,201612,201613,201614,201615,201616,201617,201618,201619,201620,201621,201701,201702,201703,201704,201705,201706,201707,201708].
