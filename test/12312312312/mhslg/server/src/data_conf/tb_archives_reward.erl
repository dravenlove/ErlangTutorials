%%--- coding:utf-8 ---
-module(tb_archives_reward).
-export([get/1,get_list/0]).
get(1)-> #{
    'reward_id' => 100104,
    'reward_order' => 1,
    'reward' => [
        101001003,
         30000
    ]
};
get(2)-> #{
    'reward_id' => 100103,
    'reward_order' => 1,
    'reward' => [
        102004002,
         5
    ]
};
get(3)-> #{
    'reward_id' => 100201,
    'reward_order' => 1,
    'reward' => [
        101001006,
         25000
    ]
};
get(4)-> #{
    'reward_id' => 100202,
    'reward_order' => 1,
    'reward' => [
        101001004,
         25000
    ]
};
get(5)-> #{
    'reward_id' => 100302,
    'reward_order' => 1,
    'reward' => [
        101001003,
         50000
    ]
};
get(6)-> #{
    'reward_id' => 100301,
    'reward_order' => 1,
    'reward' => [
        101001003,
         20000
    ]
};
get(7)-> #{
    'reward_id' => 100102,
    'reward_order' => 1,
    'reward' => [
        101001003,
         20000
    ]
};
get(8)-> #{
    'reward_id' => 100101,
    'reward_order' => 1,
    'reward' => [
        101001003,
         10000
    ]
};
get(9)-> #{
    'reward_id' => 100401,
    'reward_order' => 1,
    'reward' => [
        101001002,
         20
    ]
};
get(10)-> #{
    'reward_id' => 100501,
    'reward_order' => 1,
    'reward' => [
        102004002,
         5
    ]
};
get(11)-> #{
    'reward_id' => 100303,
    'reward_order' => 1,
    'reward' => [
        101001003,
         100000
    ]
};
get(12)-> #{
    'reward_id' => 100402,
    'reward_order' => 1,
    'reward' => [
        102004002,
         5
    ]
};
get(13)-> #{
    'reward_id' => 100403,
    'reward_order' => 1,
    'reward' => [
        102004002,
         10
    ]
};
get(14)-> #{
    'reward_id' => 100105,
    'reward_order' => 1,
    'reward' => [
        102004002,
         5
    ]
};
get(15)-> #{
    'reward_id' => 100106,
    'reward_order' => 1,
    'reward' => [
        102004002,
         10
    ]
};
get(16)-> #{
    'reward_id' => 100601,
    'reward_order' => 1,
    'reward' => [
        102004002,
         10
    ]
};
get(17)-> #{
    'reward_id' => 100701,
    'reward_order' => 1,
    'reward' => [
        101001003,
         100000
    ]
};
get(18)-> #{
    'reward_id' => 100801,
    'reward_order' => 1,
    'reward' => [
        101001002,
         10
    ]
};
get(19)-> #{
    'reward_id' => 100901,
    'reward_order' => 1,
    'reward' => [
        101001005,
         10000
    ]
};
get(20)-> #{
    'reward_id' => 100902,
    'reward_order' => 1,
    'reward' => [
        101001005,
         30000
    ]
};
get(21)-> #{
    'reward_id' => 101001,
    'reward_order' => 1,
    'reward' => [
        101001002,
         10
    ]
};
get(22)-> #{
    'reward_id' => 101002,
    'reward_order' => 1,
    'reward' => [
        101001002,
         20
    ]
};
get(23)-> #{
    'reward_id' => 101003,
    'reward_order' => 1,
    'reward' => [
        101001002,
         10
    ]
};
get(24)-> #{
    'reward_id' => 101004,
    'reward_order' => 1,
    'reward' => [
        101001002,
         20
    ]
};
get(25)-> #{
    'reward_id' => 101101,
    'reward_order' => 1,
    'reward' => [
        102004002,
         10
    ]
};
get(26)-> #{
    'reward_id' => 100104,
    'reward_order' => 2,
    'reward' => [
        101001007,
         50
    ]
};
get(30)-> #{
    'reward_id' => 100302,
    'reward_order' => 2,
    'reward' => [
        102004002,
         5
    ]
};
get(32)-> #{
    'reward_id' => 100102,
    'reward_order' => 2,
    'reward' => [
        101001007,
         30
    ]
};
get(33)-> #{
    'reward_id' => 100101,
    'reward_order' => 2,
    'reward' => [
        101001007,
         20
    ]
};
get(34)-> #{
    'reward_id' => 100303,
    'reward_order' => 2,
    'reward' => [
        102004002,
         5
    ]
};
get(35)-> #{
    'reward_id' => 100801,
    'reward_order' => 2,
    'reward' => [
        101001006,
         20000
    ]
};
get(36)-> #{
    'reward_id' => 100901,
    'reward_order' => 2,
    'reward' => [
        101001006,
         10000
    ]
};
get(37)-> #{
    'reward_id' => 100902,
    'reward_order' => 2,
    'reward' => [
        101001006,
         30000
    ]
};
get(38)-> #{
    'reward_id' => 101001,
    'reward_order' => 2,
    'reward' => [
        102004002,
         10
    ]
};
get(39)-> #{
    'reward_id' => 101002,
    'reward_order' => 2,
    'reward' => [
        102004002,
         10
    ]
};
get(40)-> #{
    'reward_id' => 101003,
    'reward_order' => 2,
    'reward' => [
        102004002,
         10
    ]
};
get(41)-> #{
    'reward_id' => 101004,
    'reward_order' => 2,
    'reward' => [
        102004002,
         10
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,30,32,33,34,35,36,37,38,39,40,41].
