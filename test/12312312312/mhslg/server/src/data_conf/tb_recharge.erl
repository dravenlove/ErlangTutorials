%%--- coding:utf-8 ---
-module(tb_recharge).
-export([get/1,get_list/0]).
get(100101)-> #{
    'type' => 1,
    'sub_type' => 1,
    'order' => 1,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 6.0,
    'gold' => 60,
    'redbag_acount' => [
        1,
         3
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem01"/utf8>>,
    'include_recharge' => 1
};
get(100201)-> #{
    'type' => 1,
    'sub_type' => 2,
    'order' => 2,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 30.0,
    'gold' => 300,
    'redbag_acount' => [
        8,
         12
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem02"/utf8>>,
    'include_recharge' => 1
};
get(100301)-> #{
    'type' => 1,
    'sub_type' => 3,
    'order' => 3,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 68.0,
    'gold' => 680,
    'redbag_acount' => [
        15,
         25
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem03"/utf8>>,
    'include_recharge' => 1
};
get(100401)-> #{
    'type' => 1,
    'sub_type' => 4,
    'order' => 4,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 128.0,
    'gold' => 1280,
    'redbag_acount' => [
        30,
         40
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem04"/utf8>>,
    'include_recharge' => 1
};
get(100501)-> #{
    'type' => 1,
    'sub_type' => 5,
    'order' => 5,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 328.0,
    'gold' => 3280,
    'redbag_acount' => [
        70,
         90
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem05"/utf8>>,
    'include_recharge' => 1
};
get(100601)-> #{
    'type' => 1,
    'sub_type' => 6,
    'order' => 6,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 648.0,
    'gold' => 6480,
    'redbag_acount' => [
        100,
         140
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem06"/utf8>>,
    'include_recharge' => 1
};
get(100701)-> #{
    'type' => 1,
    'sub_type' => 7,
    'order' => 7,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 998.0,
    'gold' => 9980,
    'redbag_acount' => [
        180,
         220
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem07"/utf8>>,
    'include_recharge' => 1
};
get(100801)-> #{
    'type' => 1,
    'sub_type' => 8,
    'order' => 8,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 1998.0,
    'gold' => 19980,
    'redbag_acount' => [
        260,
         340
    ],
    'buy_limit_type' => 0,
    'icon' => <<"top_up_icon_gem08"/utf8>>,
    'include_recharge' => 1
};
get(200101)-> #{
    'type' => 2,
    'sub_type' => 1,
    'order' => 1,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 288.0,
    'gift_reward' => <<"permanent_card_gift"/utf8>>,
    'buy_limit_type' => 6,
    'daily_times' => 1,
    'include_recharge' => 0
};
get(300101)-> #{
    'type' => 3,
    'sub_type' => 1,
    'order' => 1,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 6.0,
    'buy_limit_type' => 1,
    'daily_times' => 3,
    'include_recharge' => 0
};
get(300201)-> #{
    'type' => 3,
    'sub_type' => 2,
    'order' => 2,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 30.0,
    'buy_limit_type' => 1,
    'daily_times' => 1,
    'include_recharge' => 0
};
get(400101)-> #{
    'type' => 4,
    'sub_type' => 1,
    'order' => 1,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 128.0,
    'buy_limit_type' => 0,
    'include_recharge' => 0
};
get(400201)-> #{
    'type' => 4,
    'sub_type' => 2,
    'order' => 2,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 328.0,
    'buy_limit_type' => 0,
    'include_recharge' => 0
};
get(400301)-> #{
    'type' => 4,
    'sub_type' => 3,
    'order' => 3,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 648.0,
    'buy_limit_type' => 0,
    'include_recharge' => 0
};
get(500101)-> #{
    'type' => 5,
    'sub_type' => 1,
    'order' => 1,
    'money_unit' => <<"￥"/utf8>>,
    'money_type' => 1,
    'money' => 30.0,
    'buy_limit_type' => 0,
    'include_recharge' => 0
};

get(_N) -> false.
get_list() ->
	[100101,100201,100301,100401,100501,100601,100701,100801,200101,300101,300201,400101,400201,400301,500101].
