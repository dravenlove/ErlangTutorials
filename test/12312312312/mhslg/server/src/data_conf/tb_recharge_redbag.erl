%%--- coding:utf-8 ---
-module(tb_recharge_redbag).
-export([get/1,get_list/0]).
get(1)-> #{
    'reward_id' => 101001003,
    'time' => 10000,
    'reward_num' => 100
};
get(2)-> #{
    'reward_id' => 101001004,
    'time' => 20000,
    'reward_num' => 100
};
get(3)-> #{
    'reward_id' => 101001005,
    'time' => 20000,
    'reward_num' => 100
};
get(4)-> #{
    'reward_id' => 101001006,
    'time' => 20000,
    'reward_num' => 100
};
get(5)-> #{
    'reward_id' => 102004002,
    'time' => 1,
    'reward_num' => 100
};
get(6)-> #{
    'reward_id' => 102013001,
    'time' => 1,
    'reward_num' => 100
};
get(7)-> #{
    'reward_id' => 102014001,
    'time' => 1,
    'reward_num' => 100
};
get(8)-> #{
    'reward_id' => 102015001,
    'time' => 1,
    'reward_num' => 100
};
get(9)-> #{
    'reward_id' => 102016001,
    'time' => 1,
    'reward_num' => 100
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9].
