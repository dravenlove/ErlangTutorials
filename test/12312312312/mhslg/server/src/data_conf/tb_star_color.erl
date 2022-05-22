%%--- coding:utf-8 ---
-module(tb_star_color).
-export([get/1,get_list/0]).
get(0)-> #{
    'color' => 3
};
get(1)-> #{
    'color' => 3
};
get(2)-> #{
    'color' => 3
};
get(3)-> #{
    'color' => 3
};
get(4)-> #{
    'color' => 3
};
get(5)-> #{
    'color' => 3
};
get(6)-> #{
    'color' => 4
};
get(7)-> #{
    'color' => 4
};
get(8)-> #{
    'color' => 4
};
get(9)-> #{
    'color' => 4
};
get(10)-> #{
    'color' => 4
};
get(11)-> #{
    'color' => 4
};
get(12)-> #{
    'color' => 5
};
get(13)-> #{
    'color' => 5
};
get(14)-> #{
    'color' => 5
};
get(15)-> #{
    'color' => 5
};
get(16)-> #{
    'color' => 5
};
get(17)-> #{
    'color' => 5
};
get(18)-> #{
    'color' => 6
};
get(19)-> #{
    'color' => 6
};
get(20)-> #{
    'color' => 6
};
get(21)-> #{
    'color' => 6
};
get(22)-> #{
    'color' => 6
};
get(23)-> #{
    'color' => 6
};

get(_N) -> false.
get_list() ->
	[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23].
