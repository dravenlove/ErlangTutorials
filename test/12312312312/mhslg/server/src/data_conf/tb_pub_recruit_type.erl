%%--- coding:utf-8 ---
-module(tb_pub_recruit_type).
-export([get/1,get_list/0]).
get(1)-> #{
    'use_prop_id' => 101001003,
    'use_prop_num' => 2000,
    'item_id' => 0,
    'item_num' => 0,
    'money_id' => 0,
    'money_num' => 0,
    'everyday_time' => 2,
    'pieces_num' => 5,
    'one' => <<"hero1"/utf8>>,
    'two' => <<"hero2"/utf8>>,
    'three' => <<"hero2"/utf8>>
};
get(2)-> #{
    'use_prop_id' => 101001002,
    'use_prop_num' => 360,
    'item_id' => 102004002,
    'item_num' => 10,
    'money_id' => 101001003,
    'money_num' => 5000,
    'pieces_num' => 15,
    'first' => <<"start"/utf8>>,
    'one' => <<"hero1"/utf8>>,
    'two' => <<"hero2"/utf8>>,
    'three' => <<"hero2"/utf8>>
};
get(3)-> #{
    'use_prop_id' => 101001002,
    'use_prop_num' => 1500,
    'item_id' => 102004003,
    'item_num' => 1,
    'money_id' => 101001003,
    'money_num' => 50000,
    'pieces_num' => 40,
    'one' => <<"hero3"/utf8>>,
    'two' => <<"hero1"/utf8>>,
    'three' => <<"hero2"/utf8>>,
    'four' => <<"hero2"/utf8>>,
    'five' => <<"hero2"/utf8>>,
    'special' => <<"hero4"/utf8>>,
    'trigger_num' => 3
};

get(_N) -> false.
get_list() ->
	[1,2,3].
