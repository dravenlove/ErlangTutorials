%%--- coding:utf-8 ---
-module(tb_daily_task).
-export([get/1,get_list/0]).
get(20060101)-> #{
    'type' => 1002,
    'cond_type' => 6,
    'sort' => 1,
    'final_value' => 3000,
    'cond_id' => 4,
    'lord_mansion' => 1,
    'reward_id' => 20060101
};
get(20060102)-> #{
    'type' => 1002,
    'cond_type' => 6,
    'sort' => 2,
    'final_value' => 3000,
    'cond_id' => 3,
    'lord_mansion' => 1,
    'reward_id' => 20060102
};
get(20060103)-> #{
    'type' => 1002,
    'cond_type' => 6,
    'sort' => 3,
    'final_value' => 3000,
    'cond_id' => 2,
    'lord_mansion' => 1,
    'reward_id' => 20060103
};
get(20060104)-> #{
    'type' => 1002,
    'cond_type' => 6,
    'sort' => 4,
    'final_value' => 3000,
    'cond_id' => 1,
    'lord_mansion' => 1,
    'reward_id' => 20060104
};
get(20350105)-> #{
    'type' => 1002,
    'cond_type' => 35,
    'sort' => 5,
    'final_value' => 2000,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20350105
};
get(20350206)-> #{
    'type' => 1002,
    'cond_type' => 35,
    'sort' => 6,
    'final_value' => 5000,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20350206
};
get(20350307)-> #{
    'type' => 1002,
    'cond_type' => 35,
    'sort' => 7,
    'final_value' => 10000,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20350307
};
get(20350408)-> #{
    'type' => 1002,
    'cond_type' => 35,
    'sort' => 8,
    'final_value' => 20000,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20350408
};
get(20110109)-> #{
    'type' => 1002,
    'cond_type' => 11,
    'sort' => 9,
    'final_value' => 5,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20110109
};
get(20190110)-> #{
    'type' => 1002,
    'cond_type' => 19,
    'sort' => 10,
    'final_value' => 2,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20190110
};
get(20100111)-> #{
    'type' => 1002,
    'cond_type' => 10,
    'sort' => 11,
    'final_value' => 2,
    'cond_id' => 105,
    'lord_mansion' => 1,
    'reward_id' => 20100111
};
get(20170112)-> #{
    'type' => 1002,
    'cond_type' => 17,
    'sort' => 12,
    'final_value' => 3,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20170112
};
get(20070113)-> #{
    'type' => 1002,
    'cond_type' => 7,
    'sort' => 13,
    'final_value' => 1,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20070113
};
get(20460114)-> #{
    'type' => 1002,
    'cond_type' => 46,
    'sort' => 14,
    'final_value' => 3,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20460114
};
get(20100115)-> #{
    'type' => 1002,
    'cond_type' => 10,
    'sort' => 15,
    'final_value' => 1,
    'cond_id' => 102,
    'lord_mansion' => 1,
    'reward_id' => 20100115
};
get(20100116)-> #{
    'type' => 1002,
    'cond_type' => 10,
    'sort' => 16,
    'final_value' => 1,
    'cond_id' => 101,
    'lord_mansion' => 1,
    'reward_id' => 20100116
};
get(20410117)-> #{
    'type' => 1002,
    'cond_type' => 41,
    'sort' => 17,
    'final_value' => 3,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20410117
};
get(20090118)-> #{
    'type' => 1002,
    'cond_type' => 9,
    'sort' => 18,
    'final_value' => 3,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20090118
};
get(20180119)-> #{
    'type' => 1002,
    'cond_type' => 18,
    'sort' => 19,
    'final_value' => 10,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20180119
};
get(20470120)-> #{
    'type' => 1002,
    'cond_type' => 47,
    'sort' => 20,
    'final_value' => 100,
    'cond_id' => 101001002,
    'lord_mansion' => 1,
    'reward_id' => 20470120
};
get(20100121)-> #{
    'type' => 1002,
    'cond_type' => 10,
    'sort' => 21,
    'final_value' => 1,
    'cond_id' => 106,
    'lord_mansion' => 1,
    'reward_id' => 20100121
};
get(20150122)-> #{
    'type' => 1002,
    'cond_type' => 15,
    'sort' => 22,
    'final_value' => 2,
    'cond_id' => 0,
    'lord_mansion' => 1,
    'reward_id' => 20150122
};

get(_N) -> false.
get_list() ->
	[20060101,20060102,20060103,20060104,20350105,20350206,20350307,20350408,20110109,20190110,20100111,20170112,20070113,20460114,20100115,20100116,20410117,20090118,20180119,20470120,20100121,20150122].
