%%--- coding:utf-8 ---
-module(tb_equip_up_score).
-export([get/1,get_list/0]).
get(1)-> #{
    'score' => 25
};
get(2)-> #{
    'score' => 50
};
get(3)-> #{
    'score' => 75
};
get(4)-> #{
    'score' => 100
};
get(5)-> #{
    'score' => 125
};
get(6)-> #{
    'score' => 175
};
get(7)-> #{
    'score' => 225
};
get(8)-> #{
    'score' => 275
};
get(9)-> #{
    'score' => 325
};
get(10)-> #{
    'score' => 375
};
get(11)-> #{
    'score' => 450
};
get(12)-> #{
    'score' => 525
};
get(13)-> #{
    'score' => 600
};
get(14)-> #{
    'score' => 675
};
get(15)-> #{
    'score' => 750
};
get(16)-> #{
    'score' => 850
};
get(17)-> #{
    'score' => 950
};
get(18)-> #{
    'score' => 1050
};
get(19)-> #{
    'score' => 1150
};
get(20)-> #{
    'score' => 1250
};
get(21)-> #{
    'score' => 1400
};
get(22)-> #{
    'score' => 1550
};
get(23)-> #{
    'score' => 1700
};
get(24)-> #{
    'score' => 1850
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24].
