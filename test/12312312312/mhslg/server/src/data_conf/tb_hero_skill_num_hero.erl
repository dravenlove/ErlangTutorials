%%--- coding:utf-8 ---
-module(tb_hero_skill_num_hero).
-export([get/1,get_list/0]).
get(101)-> #{
    'cond_type' => 2,
    'star' => 6
};
get(102)-> #{
    'cond_type' => 2,
    'star' => 12
};
get(103)-> #{
    'cond_type' => 2,
    'star' => 18
};
get(104)-> #{
    'cond_type' => 3,
    'man_tech' => [
        8021,
         1
    ],
    'woman_tech' => [
        5011,
         1
    ]
};
get(201)-> #{
    'cond_type' => 1,
    'level' => 20
};
get(202)-> #{
    'cond_type' => 1,
    'level' => 40
};
get(203)-> #{
    'cond_type' => 1,
    'level' => 65
};
get(204)-> #{
    'cond_type' => 3,
    'man_tech' => [
        8021,
         1
    ],
    'woman_tech' => [
        5011,
         1
    ]
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,201,202,203,204].
