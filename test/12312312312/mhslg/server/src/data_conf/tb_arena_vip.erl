%%--- coding:utf-8 ---
-module(tb_arena_vip).
-export([get/1,get_list/0]).
get(0)-> #{
    'free_times' => 5,
    'buy_times' => 5
};
get(1)-> #{
    'free_times' => 5,
    'buy_times' => 6
};
get(2)-> #{
    'free_times' => 5,
    'buy_times' => 7
};
get(3)-> #{
    'free_times' => 5,
    'buy_times' => 8
};
get(4)-> #{
    'free_times' => 5,
    'buy_times' => 9
};
get(5)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(6)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(7)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(8)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(9)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(10)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(11)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(12)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(13)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(14)-> #{
    'free_times' => 5,
    'buy_times' => 10
};
get(15)-> #{
    'free_times' => 5,
    'buy_times' => 10
};

get(_N) -> false.
get_list() ->
	[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15].
