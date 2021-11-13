%%--- coding:utf-8 ---
-module(tb_genesis_church_hero_skill).
-export([get/1,get_list/0]).
get(111)-> #{
    'hero_type' => 1,
    'hero_sex' => 1,
    'skill_type' => 1,
    'skill' => [
        101108,
         101109,
         101105,
         101114,
         101107,
         101104
    ]
};
get(112)-> #{
    'hero_type' => 1,
    'hero_sex' => 1,
    'skill_type' => 2,
    'skill' => [
        201601,
         201603,
         201609,
         201610,
         201611,
         201612
    ]
};
get(121)-> #{
    'hero_type' => 1,
    'hero_sex' => 2,
    'skill_type' => 1,
    'skill' => [
        101108,
         101109,
         101105,
         101114,
         101107,
         101106
    ]
};
get(122)-> #{
    'hero_type' => 1,
    'hero_sex' => 2,
    'skill_type' => 2,
    'skill' => [
        201601,
         201603,
         201609,
         201610,
         201611,
         201612
    ]
};
get(211)-> #{
    'hero_type' => 2,
    'hero_sex' => 1,
    'skill_type' => 1,
    'skill' => [
        101101,
         101103,
         101110,
         101107,
         101102,
         101113
    ]
};
get(212)-> #{
    'hero_type' => 2,
    'hero_sex' => 1,
    'skill_type' => 2,
    'skill' => [
        201602,
         201603,
         201609,
         201610,
         201611,
         201612
    ]
};
get(221)-> #{
    'hero_type' => 2,
    'hero_sex' => 2,
    'skill_type' => 1,
    'skill' => [
        101101,
         101103,
         101110,
         101107,
         101102,
         101106
    ]
};
get(222)-> #{
    'hero_type' => 2,
    'hero_sex' => 2,
    'skill_type' => 2,
    'skill' => [
        201602,
         201603,
         201609,
         201610,
         201611,
         201612
    ]
};
get(311)-> #{
    'hero_type' => 3,
    'hero_sex' => 1,
    'skill_type' => 1,
    'skill' => [
        101107,
         101108,
         101109,
         101110,
         101102,
         101113
    ]
};
get(312)-> #{
    'hero_type' => 3,
    'hero_sex' => 1,
    'skill_type' => 2,
    'skill' => [
        201601,
         201603,
         201609,
         201610,
         201611,
         201612
    ]
};
get(321)-> #{
    'hero_type' => 3,
    'hero_sex' => 2,
    'skill_type' => 1,
    'skill' => [
        101107,
         101108,
         101109,
         101106,
         101102,
         101113
    ]
};
get(322)-> #{
    'hero_type' => 3,
    'hero_sex' => 2,
    'skill_type' => 2,
    'skill' => [
        201601,
         201603,
         201609,
         201610,
         201611,
         201612
    ]
};
get(103)-> #{
    'hero_type' => 1,
    'hero_sex' => 0,
    'skill_type' => 3,
    'skill' => [
        201201,
         201202,
         201203,
         201204,
         201205
    ]
};
get(203)-> #{
    'hero_type' => 2,
    'hero_sex' => 0,
    'skill_type' => 3,
    'skill' => [
        201301,
         201302,
         201303,
         201304,
         201305
    ]
};
get(303)-> #{
    'hero_type' => 3,
    'hero_sex' => 0,
    'skill_type' => 3,
    'skill' => [
        201401,
         201402,
         201403,
         201404,
         201405
    ]
};
get(403)-> #{
    'hero_type' => 4,
    'hero_sex' => 0,
    'skill_type' => 3,
    'skill' => [
        201501,
         201502,
         201503,
         201504,
         201505
    ]
};

get(_N) -> false.
get_list() ->
	[111,112,121,122,211,212,221,222,311,312,321,322,103,203,303,403].
