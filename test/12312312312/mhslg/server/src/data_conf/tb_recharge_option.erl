%%--- coding:utf-8 ---
-module(tb_recharge_option).
-export([get/1,get_list/0]).
get(1)-> #{
    'item_id' => 106005001,
    'amount' => 1,
    'sort_id' => 1,
    'put_on_time' => [
        0,
         22
    ]
};
get(2)-> #{
    'item_id' => 106006001,
    'amount' => 1,
    'sort_id' => 2,
    'put_on_time' => [
        0,
         28
    ]
};
get(3)-> #{
    'item_id' => 106007001,
    'amount' => 1,
    'sort_id' => 3,
    'put_on_time' => [
        0,
         36
    ]
};
get(4)-> #{
    'item_id' => 102005051,
    'amount' => 5,
    'sort_id' => 4,
    'put_on_time' => [
        0,
         22
    ]
};
get(5)-> #{
    'item_id' => 106002001,
    'amount' => 1,
    'sort_id' => 5,
    'put_on_time' => [
        0,
         1
    ]
};
get(6)-> #{
    'item_id' => 102003001,
    'amount' => 1,
    'sort_id' => 6,
    'put_on_time' => [
        0,
         1
    ]
};
get(7)-> #{
    'item_id' => 102002006,
    'amount' => 10,
    'sort_id' => 7,
    'put_on_time' => [
        0,
         1
    ]
};
get(8)-> #{
    'item_id' => 102002007,
    'amount' => 10,
    'sort_id' => 8,
    'put_on_time' => [
        0,
         15
    ]
};
get(9)-> #{
    'item_id' => 102002008,
    'amount' => 10,
    'sort_id' => 9,
    'put_on_time' => [
        0,
         30
    ]
};
get(10)-> #{
    'item_id' => 102002009,
    'amount' => 10,
    'sort_id' => 10,
    'put_on_time' => [
        0,
         18
    ]
};
get(11)-> #{
    'item_id' => 102002010,
    'amount' => 10,
    'sort_id' => 11,
    'put_on_time' => [
        1,
         1
    ]
};
get(12)-> #{
    'item_id' => 102002011,
    'amount' => 75,
    'sort_id' => 12,
    'put_on_time' => [
        2,
         1
    ]
};
get(13)-> #{
    'item_id' => 102002012,
    'amount' => 10,
    'sort_id' => 13,
    'put_on_time' => [
        3,
         1
    ]
};
get(14)-> #{
    'item_id' => 106008001,
    'amount' => 1,
    'sort_id' => 14,
    'put_on_time' => [
        0,
         18
    ]
};
get(15)-> #{
    'item_id' => 106009001,
    'amount' => 1,
    'sort_id' => 15,
    'put_on_time' => [
        0,
         18
    ]
};
get(16)-> #{
    'item_id' => 106003001,
    'amount' => 1,
    'sort_id' => 16,
    'put_on_time' => [
        0,
         1
    ]
};
get(17)-> #{
    'item_id' => 106004001,
    'amount' => 1,
    'sort_id' => 17,
    'put_on_time' => [
        0,
         1
    ]
};
get(18)-> #{
    'item_id' => 102008004,
    'amount' => 3,
    'sort_id' => 18,
    'put_on_time' => [
        0,
         1
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18].
