%%--- coding:utf-8 ---
-module(tb_online_gift).
-export([get/1,get_list/0]).
get(1)-> #{
    'reward_id' => 1001,
    'time' => 1800,
    'reward_num' => 1,
    'item_id' => 101001003,
    'num' => 10000
};
get(2)-> #{
    'reward_id' => 1001,
    'time' => 1800,
    'reward_num' => 2,
    'item_id' => 101001004,
    'num' => 10000
};
get(3)-> #{
    'reward_id' => 1001,
    'time' => 1800,
    'reward_num' => 3,
    'item_id' => 102004002,
    'num' => 2
};
get(4)-> #{
    'reward_id' => 1001,
    'time' => 1800,
    'reward_num' => 4,
    'item_id' => 102005024,
    'num' => 2
};
get(5)-> #{
    'reward_id' => 1002,
    'time' => 3600,
    'reward_num' => 1,
    'item_id' => 101001003,
    'num' => 10000
};
get(6)-> #{
    'reward_id' => 1002,
    'time' => 3600,
    'reward_num' => 2,
    'item_id' => 101001004,
    'num' => 10000
};
get(7)-> #{
    'reward_id' => 1002,
    'time' => 3600,
    'reward_num' => 3,
    'item_id' => 102004002,
    'num' => 3
};
get(8)-> #{
    'reward_id' => 1002,
    'time' => 3600,
    'reward_num' => 4,
    'item_id' => 102005024,
    'num' => 3
};
get(9)-> #{
    'reward_id' => 1003,
    'time' => 7200,
    'reward_num' => 1,
    'item_id' => 101001003,
    'num' => 10000
};
get(10)-> #{
    'reward_id' => 1003,
    'time' => 7200,
    'reward_num' => 2,
    'item_id' => 101001004,
    'num' => 10000
};
get(11)-> #{
    'reward_id' => 1003,
    'time' => 7200,
    'reward_num' => 3,
    'item_id' => 102004002,
    'num' => 5
};
get(12)-> #{
    'reward_id' => 1003,
    'time' => 7200,
    'reward_num' => 4,
    'item_id' => 102005024,
    'num' => 5
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12].
