%%--- coding:utf-8 ---
-module(tb_equip_wash_score).
-export([get/1,get_list/0]).
get(1)-> #{
    'score' => 50
};
get(2)-> #{
    'score' => 70
};
get(3)-> #{
    'score' => 100
};
get(4)-> #{
    'score' => 140
};
get(5)-> #{
    'score' => 200
};
get(6)-> #{
    'score' => 200
};
get(7)-> #{
    'score' => 200
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7].
