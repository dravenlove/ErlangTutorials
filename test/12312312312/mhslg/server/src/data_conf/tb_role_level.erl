%%--- coding:utf-8 ---
-module(tb_role_level).
-export([get/1,get_list/0]).
get(1)-> #{
    'open_num' => 2
};
get(2)-> #{
    'open_num' => 2
};
get(3)-> #{
    'open_num' => 2
};
get(4)-> #{
    'open_num' => 2
};
get(5)-> #{
    'open_num' => 2
};
get(6)-> #{
    'open_num' => 3
};
get(7)-> #{
    'open_num' => 3
};
get(8)-> #{
    'open_num' => 3
};
get(9)-> #{
    'open_num' => 3
};
get(10)-> #{
    'open_num' => 3
};
get(11)-> #{
    'open_num' => 4
};
get(12)-> #{
    'open_num' => 4
};
get(13)-> #{
    'open_num' => 4
};
get(14)-> #{
    'open_num' => 4
};
get(15)-> #{
    'open_num' => 4
};
get(16)-> #{
    'open_num' => 5
};
get(17)-> #{
    'open_num' => 5
};
get(18)-> #{
    'open_num' => 5
};
get(19)-> #{
    'open_num' => 5
};
get(20)-> #{
    'open_num' => 5
};
get(21)-> #{
    'open_num' => 5
};
get(22)-> #{
    'open_num' => 5
};
get(23)-> #{
    'open_num' => 5
};
get(24)-> #{
    'open_num' => 5
};
get(25)-> #{
    'open_num' => 5
};
get(26)-> #{
    'open_num' => 5
};
get(27)-> #{
    'open_num' => 5
};
get(28)-> #{
    'open_num' => 5
};
get(29)-> #{
    'open_num' => 5
};
get(30)-> #{
    'open_num' => 6
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30].
