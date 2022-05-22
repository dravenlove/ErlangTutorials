%%--- coding:utf-8 ---
-module(tb_hero_star_cost).
-export([get/1,get_list/0]).
get(10100)-> #{
    'hero_id' => 101,
    'star' => 0,
    'cost_id' => 101001002,
    'cost_num' => 200
};
get(10101)-> #{
    'hero_id' => 101,
    'star' => 1,
    'cost_id' => 101001002,
    'cost_num' => 400
};
get(10102)-> #{
    'hero_id' => 101,
    'star' => 2,
    'cost_id' => 101001002,
    'cost_num' => 600
};
get(10103)-> #{
    'hero_id' => 101,
    'star' => 3,
    'cost_id' => 101001002,
    'cost_num' => 800
};
get(10104)-> #{
    'hero_id' => 101,
    'star' => 4,
    'cost_id' => 101001002,
    'cost_num' => 1000
};
get(10105)-> #{
    'hero_id' => 101,
    'star' => 5,
    'cost_id' => 101001002,
    'cost_num' => 2000
};
get(10200)-> #{
    'hero_id' => 102,
    'star' => 0,
    'cost_id' => 101001002,
    'cost_num' => 200
};
get(10301)-> #{
    'hero_id' => 103,
    'star' => 1,
    'cost_id' => 101001002,
    'cost_num' => 400
};
get(10402)-> #{
    'hero_id' => 104,
    'star' => 2,
    'cost_id' => 101001002,
    'cost_num' => 600
};
get(10503)-> #{
    'hero_id' => 105,
    'star' => 3,
    'cost_id' => 101001002,
    'cost_num' => 800
};
get(10604)-> #{
    'hero_id' => 106,
    'star' => 4,
    'cost_id' => 101001002,
    'cost_num' => 1000
};
get(10705)-> #{
    'hero_id' => 107,
    'star' => 5,
    'cost_id' => 101001002,
    'cost_num' => 2000
};

get(_N) -> false.
get_list() ->
	[10100,10101,10102,10103,10104,10105,10200,10301,10402,10503,10604,10705].
