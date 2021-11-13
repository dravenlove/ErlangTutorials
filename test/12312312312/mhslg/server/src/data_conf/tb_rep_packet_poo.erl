%%--- coding:utf-8 ---
-module(tb_rep_packet_poo).
-export([get/1,get_list/0]).
get(1)-> #{
    'item_id' => 101001003,
    'item_num' => 1000,
    'weight' => 150
};
get(2)-> #{
    'item_id' => 101001004,
    'item_num' => 2000,
    'weight' => 150
};
get(3)-> #{
    'item_id' => 101001005,
    'item_num' => 2000,
    'weight' => 150
};
get(4)-> #{
    'item_id' => 101001006,
    'item_num' => 2000,
    'weight' => 150
};
get(5)-> #{
    'item_id' => 102013001,
    'item_num' => 1,
    'weight' => 15
};
get(6)-> #{
    'item_id' => 102015001,
    'item_num' => 1,
    'weight' => 15
};
get(7)-> #{
    'item_id' => 102014001,
    'item_num' => 1,
    'weight' => 30
};
get(8)-> #{
    'item_id' => 102016001,
    'item_num' => 1,
    'weight' => 30
};
get(9)-> #{
    'item_id' => 102004002,
    'item_num' => 1,
    'weight' => 10
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9].
