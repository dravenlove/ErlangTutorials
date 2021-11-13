%%--- coding:utf-8 ---
-module(tb_holy_spirit_hall_base).
-export([get/1,get_list/0]).
get(101)-> #{
    'name' => <<"3615"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 1,
    'troops_type' => 0
};
get(102)-> #{
    'name' => <<"3616"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 2,
    'troops_type' => 0
};
get(103)-> #{
    'name' => <<"3617"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 3,
    'troops_type' => 0
};
get(104)-> #{
    'name' => <<"3618"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 0,
    'troops_type' => 1
};
get(105)-> #{
    'name' => <<"3619"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 0,
    'troops_type' => 2
};
get(106)-> #{
    'name' => <<"3620"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 0,
    'troops_type' => 3
};
get(107)-> #{
    'name' => <<"3621"/utf8>>,
    'open_num' => 2,
    'first_place_cost' => 50,
    'second_place_cost' => 50,
    'third_place_cost' => 100,
    'open_sum' => 5,
    'hero_type' => 0,
    'troops_type' => 4
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107].
