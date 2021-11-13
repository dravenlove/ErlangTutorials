%%--- coding:utf-8 ---
-module(tb_hero_skill_type).
-export([get/1,get_list/0]).
get(1)-> #{
    'def_number' => 1,
    'number' => 4
};
get(2)-> #{
    'def_number' => 1,
    'number' => 5
};
get(3)-> #{
    'def_number' => 1,
    'number' => 5
};
get(4)-> #{
    'def_number' => 1,
    'number' => 5
};
get(5)-> #{
    'def_number' => 1,
    'number' => 5
};
get(6)-> #{
    'def_number' => 1,
    'number' => 6
};
get(7)-> #{
    'def_number' => 1,
    'number' => 7
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7].
