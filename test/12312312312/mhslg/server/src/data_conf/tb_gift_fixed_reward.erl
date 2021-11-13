%%--- coding:utf-8 ---
-module(tb_gift_fixed_reward).
-export([get/1,get_list/0]).
get(10300101)-> #{
    'drop_id' => 103001,
    'item_id' => 101001003,
    'item_amount' => 100000
};
get(10300102)-> #{
    'drop_id' => 103001,
    'item_id' => 102005002,
    'item_amount' => 2
};
get(10300201)-> #{
    'drop_id' => 103002,
    'item_id' => 102005003,
    'item_amount' => 1
};
get(10300202)-> #{
    'drop_id' => 103002,
    'item_id' => 102005004,
    'item_amount' => 2
};
get(10300203)-> #{
    'drop_id' => 103002,
    'item_id' => 102005005,
    'item_amount' => 3
};
get(10300204)-> #{
    'drop_id' => 103002,
    'item_id' => 102005006,
    'item_amount' => 4
};

get(_N) -> false.
get_list() ->
	[10300101,10300102,10300201,10300202,10300203,10300204].
