%%--- coding:utf-8 ---
-module(tb_season_activity_country).
-export([get/1,get_list/0]).
get(1)-> #{
    'country' => [
        2,
         3,
         4,
         5
    ]
};
get(2)-> #{
    'country' => [
        2,
         3,
         4,
         6
    ]
};
get(3)-> #{
    'country' => [
        2,
         3,
         4,
         7
    ]
};
get(4)-> #{
    'country' => [
        2,
         3,
         4,
         8
    ]
};
get(5)-> #{
    'country' => [
        2,
         3,
         4,
         9
    ]
};
get(6)-> #{
    'country' => [
        2,
         3,
         4,
         10
    ]
};
get(7)-> #{
    'country' => [
        2,
         3,
         4,
         11
    ]
};
get(8)-> #{
    'country' => [
        2,
         3,
         4,
         12
    ]
};
get(9)-> #{
    'country' => [
        2,
         3,
         4,
         13
    ]
};
get(10)-> #{
    'country' => [
        2,
         3,
         4,
         14
    ]
};
get(11)-> #{
    'country' => [
        2,
         3,
         4,
         15
    ]
};
get(12)-> #{
    'country' => [
        2,
         3,
         4,
         16
    ]
};
get(13)-> #{
    'country' => [
        2,
         3,
         4,
         17
    ]
};
get(14)-> #{
    'country' => [
        2,
         3,
         4,
         18
    ]
};
get(15)-> #{
    'country' => [
        2,
         3,
         4,
         19
    ]
};
get(16)-> #{
    'country' => [
        2,
         3,
         4,
         20
    ]
};
get(17)-> #{
    'country' => [
        2,
         3,
         4,
         21
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17].
