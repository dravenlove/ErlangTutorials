%%--- coding:utf-8 ---
-module(tb_hero_skill_list).
-export([get/1,get_list/0]).
get(100111)-> #{
    'id' => 1001,
    'hero_type' => 1,
    'hero_sex' => 1,
    'skill' => [
        101104,
         101105,
         101107,
         101108,
         101109,
         101113,
         101114
    ]
};
get(100112)-> #{
    'id' => 1001,
    'hero_type' => 1,
    'hero_sex' => 2,
    'skill' => [
        101104,
         101105,
         101107,
         101108,
         101109,
         101113,
         101114,
         101106
    ]
};
get(100121)-> #{
    'id' => 1001,
    'hero_type' => 2,
    'hero_sex' => 1,
    'skill' => [
        101101,
         101102,
         101103,
         101107,
         101110,
         101112
    ]
};
get(100122)-> #{
    'id' => 1001,
    'hero_type' => 2,
    'hero_sex' => 2,
    'skill' => [
        101101,
         101102,
         101103,
         101107,
         101110,
         101112,
         101106
    ]
};
get(100131)-> #{
    'id' => 1001,
    'hero_type' => 3,
    'hero_sex' => 1,
    'skill' => [
        101101,
         101102,
         101103,
         101104,
         101105,
         101107,
         101108,
         101109,
         101111,
         101112,
         101113,
         101114
    ]
};
get(100132)-> #{
    'id' => 1001,
    'hero_type' => 3,
    'hero_sex' => 2,
    'skill' => [
        101101,
         101102,
         101103,
         101104,
         101105,
         101106,
         101107,
         101108,
         101109,
         101111,
         101112,
         101113,
         101114
    ]
};

get(_N) -> false.
get_list() ->
	[100111,100112,100121,100122,100131,100132].
