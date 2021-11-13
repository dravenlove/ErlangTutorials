%%--- coding:utf-8 ---
-module(tb_challenge_open).
-export([get/1,get_list/0]).
get(1)-> #{
    'season' => 0,
    'type' => 1,
    'open' => 13,
    'interval' => 6
};
get(2)-> #{
    'season' => 0,
    'type' => 2,
    'open' => 10,
    'interval' => 6
};
get(3)-> #{
    'season' => 1,
    'type' => 1,
    'open' => 13,
    'interval' => 6
};
get(4)-> #{
    'season' => 1,
    'type' => 2,
    'open' => 10,
    'interval' => 6
};
get(5)-> #{
    'season' => 2,
    'type' => 1,
    'open' => 13,
    'interval' => 6
};
get(6)-> #{
    'season' => 2,
    'type' => 2,
    'open' => 10,
    'interval' => 6
};
get(7)-> #{
    'season' => 3,
    'type' => 1,
    'open' => 13,
    'interval' => 6
};
get(8)-> #{
    'season' => 3,
    'type' => 2,
    'open' => 10,
    'interval' => 6
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8].
