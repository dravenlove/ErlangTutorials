%%--- coding:utf-8 ---
-module(tb_gift_hybrid_fixed_reward).
-export([get/1,get_list/0]).
get(105100101)-> #{
    'drop_id' => 1051001,
    'item_id' => 102002013,
    'item_amount' => 10
};
get(105100201)-> #{
    'drop_id' => 1051002,
    'item_id' => 102002013,
    'item_amount' => 12
};
get(105100301)-> #{
    'drop_id' => 1051003,
    'item_id' => 102002013,
    'item_amount' => 14
};
get(105100401)-> #{
    'drop_id' => 1051004,
    'item_id' => 102002013,
    'item_amount' => 30
};
get(105100501)-> #{
    'drop_id' => 1051005,
    'item_id' => 102002013,
    'item_amount' => 35
};
get(105100601)-> #{
    'drop_id' => 1051006,
    'item_id' => 102002013,
    'item_amount' => 40
};
get(105100701)-> #{
    'drop_id' => 1051007,
    'item_id' => 102002013,
    'item_amount' => 50
};
get(105100801)-> #{
    'drop_id' => 1051008,
    'item_id' => 102002013,
    'item_amount' => 90
};
get(105100901)-> #{
    'drop_id' => 1051009,
    'item_id' => 102002013,
    'item_amount' => 110
};
get(105101001)-> #{
    'drop_id' => 1051010,
    'item_id' => 102002013,
    'item_amount' => 140
};
get(105101101)-> #{
    'drop_id' => 1051011,
    'item_id' => 102002013,
    'item_amount' => 170
};
get(105101201)-> #{
    'drop_id' => 1051012,
    'item_id' => 102002013,
    'item_amount' => 200
};

get(_N) -> false.
get_list() ->
	[105100101,105100201,105100301,105100401,105100501,105100601,105100701,105100801,105100901,105101001,105101101,105101201].
