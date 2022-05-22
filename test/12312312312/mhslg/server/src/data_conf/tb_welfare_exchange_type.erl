%%--- coding:utf-8 ---
-module(tb_welfare_exchange_type).
-export([get/1,get_list/0]).
get(1)-> #{
    'type' => 1,
    'trigger_type' => 1,
    'prop_id' => 101001003
};
get(2)-> #{
    'type' => 2,
    'trigger_type' => 2,
    'prop_id' => 101001004
};
get(3)-> #{
    'type' => 3,
    'trigger_type' => 3,
    'prop_id' => 101001005
};
get(4)-> #{
    'type' => 4,
    'trigger_type' => 4,
    'prop_id' => 101001006
};

get(_N) -> false.
get_list() ->
	[1,2,3,4].
