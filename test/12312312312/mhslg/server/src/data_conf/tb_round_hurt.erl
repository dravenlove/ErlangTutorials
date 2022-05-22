%%--- coding:utf-8 ---
-module(tb_round_hurt).
-export([get/1,get_list/0]).
get(3)-> #{
    'value' => 0.1
};
get(5)-> #{
    'value' => 0.2
};
get(6)-> #{
    'value' => 0.3
};
get(7)-> #{
    'value' => 0.4
};
get(8)-> #{
    'value' => 0.5
};
get(9)-> #{
    'value' => 0.6
};
get(10)-> #{
    'value' => 0.7
};
get(11)-> #{
    'value' => 0.8
};
get(12)-> #{
    'value' => 0.9
};
get(13)-> #{
    'value' => 1.0
};
get(14)-> #{
    'value' => 1.5
};
get(15)-> #{
    'value' => 2.0
};
get(16)-> #{
    'value' => 2.5
};
get(17)-> #{
    'value' => 3.0
};
get(18)-> #{
    'value' => 3.5
};
get(19)-> #{
    'value' => 4.0
};
get(20)-> #{
    'value' => 4.5
};
get(21)-> #{
    'value' => 5.0
};
get(22)-> #{
    'value' => 5.5
};
get(23)-> #{
    'value' => 6.0
};
get(24)-> #{
    'value' => 6.5
};
get(25)-> #{
    'value' => 7.0
};
get(26)-> #{
    'value' => 7.5
};
get(27)-> #{
    'value' => 8.0
};
get(28)-> #{
    'value' => 8.5
};
get(29)-> #{
    'value' => 9.0
};
get(30)-> #{
    'value' => 9.5
};

get(_N) -> false.
get_list() ->
	[3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30].
