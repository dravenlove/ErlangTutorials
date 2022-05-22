%%--- coding:utf-8 ---
-module(tb_honour_top_guess).
-export([get/1,get_list/0]).
get(1)-> #{
    'left' => 0,
    'right' => 2000,
    'odds' => 10.0
};
get(2)-> #{
    'left' => 2001,
    'right' => 5000,
    'odds' => 9.0
};
get(3)-> #{
    'left' => 5001,
    'right' => 10000,
    'odds' => 8.0
};
get(4)-> #{
    'left' => 10001,
    'right' => 20000,
    'odds' => 7.0
};
get(5)-> #{
    'left' => 20001,
    'right' => 30000,
    'odds' => 6.0
};
get(6)-> #{
    'left' => 30001,
    'right' => 40000,
    'odds' => 5.0
};
get(7)-> #{
    'left' => 40001,
    'right' => 50000,
    'odds' => 4.0
};
get(8)-> #{
    'left' => 50001,
    'right' => 60000,
    'odds' => 3.0
};
get(9)-> #{
    'left' => 60001,
    'right' => 70000,
    'odds' => 2.0
};
get(10)-> #{
    'left' => 70001,
    'right' => 80000,
    'odds' => 1.8
};
get(11)-> #{
    'left' => 80001,
    'right' => 90000,
    'odds' => 1.7
};
get(12)-> #{
    'left' => 90001,
    'right' => 100000,
    'odds' => 1.6
};
get(13)-> #{
    'left' => 100001,
    'right' => 999999999,
    'odds' => 1.5
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13].
