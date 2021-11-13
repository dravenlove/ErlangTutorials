%%--- coding:utf-8 ---
-module(tb_pub_level_and_time).
-export([get/1,get_list/0]).
get(1)-> #{
    'num' => 0
};
get(2)-> #{
    'num' => 1
};
get(3)-> #{
    'num' => 2
};
get(4)-> #{
    'num' => 3
};
get(5)-> #{
    'num' => 4
};
get(6)-> #{
    'num' => 5
};
get(7)-> #{
    'num' => 6
};
get(8)-> #{
    'num' => 7
};
get(9)-> #{
    'num' => 8
};
get(10)-> #{
    'num' => 9
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10].
