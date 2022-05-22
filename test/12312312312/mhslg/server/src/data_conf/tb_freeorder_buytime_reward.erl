%%--- coding:utf-8 ---
-module(tb_freeorder_buytime_reward).
-export([get/1,get_list/0]).
get(1)-> #{
    'index' => 101,
    'reward_id' => 10101,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(2)-> #{
    'index' => 101,
    'reward_id' => 10102,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(3)-> #{
    'index' => 101,
    'reward_id' => 10103,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(4)-> #{
    'index' => 102,
    'reward_id' => 10201,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(5)-> #{
    'index' => 102,
    'reward_id' => 10202,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(6)-> #{
    'index' => 102,
    'reward_id' => 10203,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(7)-> #{
    'index' => 103,
    'reward_id' => 10301,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(8)-> #{
    'index' => 103,
    'reward_id' => 10302,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(9)-> #{
    'index' => 103,
    'reward_id' => 10303,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(10)-> #{
    'index' => 104,
    'reward_id' => 10401,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(11)-> #{
    'index' => 104,
    'reward_id' => 10402,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(12)-> #{
    'index' => 104,
    'reward_id' => 10403,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(13)-> #{
    'index' => 105,
    'reward_id' => 10501,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(14)-> #{
    'index' => 105,
    'reward_id' => 10502,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(15)-> #{
    'index' => 105,
    'reward_id' => 10503,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(16)-> #{
    'index' => 106,
    'reward_id' => 10601,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(17)-> #{
    'index' => 106,
    'reward_id' => 10602,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(18)-> #{
    'index' => 106,
    'reward_id' => 10603,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(19)-> #{
    'index' => 107,
    'reward_id' => 10701,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(20)-> #{
    'index' => 107,
    'reward_id' => 10702,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(21)-> #{
    'index' => 107,
    'reward_id' => 10703,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(22)-> #{
    'index' => 108,
    'reward_id' => 10801,
    'num' => 1,
    'total_buy_time' => 30,
    'goods' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(23)-> #{
    'index' => 108,
    'reward_id' => 10802,
    'num' => 2,
    'total_buy_time' => 80,
    'goods' => [
        101001003,
         800000
    ],
    'item_id' => 101001003
};
get(24)-> #{
    'index' => 108,
    'reward_id' => 10803,
    'num' => 3,
    'total_buy_time' => 130,
    'goods' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24].
