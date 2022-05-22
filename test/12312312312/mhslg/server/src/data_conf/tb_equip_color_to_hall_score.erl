%%--- coding:utf-8 ---
-module(tb_equip_color_to_hall_score).
-export([get/1,get_list/0]).
get(1)-> #{
    'hall_score' => 15
};
get(2)-> #{
    'hall_score' => 50
};
get(3)-> #{
    'hall_score' => 150
};
get(4)-> #{
    'hall_score' => 250
};
get(5)-> #{
    'hall_score' => 400
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5].
