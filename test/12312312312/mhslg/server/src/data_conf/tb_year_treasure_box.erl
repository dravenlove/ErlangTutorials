%%--- coding:utf-8 ---
-module(tb_year_treasure_box).
-export([get/1,get_list/0]).
get(1)-> #{
    'num' => [
        1450,
         5329
    ],
    'gold_multiple' => 0.01,
    'silver_multiple' => 0.01,
    'cereals_multiple' => 0.01
};
get(2)-> #{
    'num' => [
        5330,
         9999
    ],
    'gold_multiple' => 0.02,
    'silver_multiple' => 0.02,
    'cereals_multiple' => 0.02
};
get(3)-> #{
    'num' => [
        10000,
         22999
    ],
    'gold_multiple' => 0.03,
    'silver_multiple' => 0.03,
    'cereals_multiple' => 0.03
};
get(4)-> #{
    'num' => [
        23000,
         46999
    ],
    'gold_multiple' => 0.04,
    'silver_multiple' => 0.04,
    'cereals_multiple' => 0.04
};
get(5)-> #{
    'num' => [
        47000,
         79999
    ],
    'gold_multiple' => 0.05,
    'silver_multiple' => 0.05,
    'cereals_multiple' => 0.05
};
get(6)-> #{
    'num' => [
        80000,
         137999
    ],
    'gold_multiple' => 0.06,
    'silver_multiple' => 0.06,
    'cereals_multiple' => 0.06
};
get(7)-> #{
    'num' => [
        138000,
         204999
    ],
    'gold_multiple' => 0.07,
    'silver_multiple' => 0.07,
    'cereals_multiple' => 0.07
};
get(8)-> #{
    'num' => [
        205000,
         339999
    ],
    'gold_multiple' => 0.08,
    'silver_multiple' => 0.08,
    'cereals_multiple' => 0.08
};
get(9)-> #{
    'num' => [
        340000,
         699999
    ],
    'gold_multiple' => 0.09,
    'silver_multiple' => 0.09,
    'cereals_multiple' => 0.09
};
get(10)-> #{
    'num' => [
        700000,
         99999999
    ],
    'gold_multiple' => 0.1,
    'silver_multiple' => 0.1,
    'cereals_multiple' => 0.1
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10].
