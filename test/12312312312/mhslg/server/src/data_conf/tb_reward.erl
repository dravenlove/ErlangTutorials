%%--- coding:utf-8 ---
-module(tb_reward).
-export([get/1,get_list/0]).
get(1)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 101001002,
    'item_amount' => 200
};
get(2)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 101001003,
    'item_amount' => 50000
};
get(3)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 101001004,
    'item_amount' => 100000
};
get(4)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 101001005,
    'item_amount' => 100000
};
get(5)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 101001006,
    'item_amount' => 100000
};
get(6)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 102013002,
    'item_amount' => 5
};
get(7)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 102017001,
    'item_amount' => 1
};
get(8)-> #{
    'reward_id' => <<"permanent_card_gift"/utf8>>,
    'item_id' => 102017002,
    'item_amount' => 1
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8].
