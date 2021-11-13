%%--- coding:utf-8 ---
-module(tb_open_server_small_box).
-export([get/1,get_list/0]).
get(110101)-> #{
    'serial_number' => 101,
    'need_days' => 0,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};
get(110102)-> #{
    'serial_number' => 101,
    'need_days' => 1,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};
get(110103)-> #{
    'serial_number' => 101,
    'need_days' => 2,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};
get(110104)-> #{
    'serial_number' => 101,
    'need_days' => 3,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};
get(110105)-> #{
    'serial_number' => 101,
    'need_days' => 4,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};
get(110106)-> #{
    'serial_number' => 101,
    'need_days' => 5,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};
get(110107)-> #{
    'serial_number' => 101,
    'need_days' => 6,
    'rewards' => [
        [
            102003001,
             2
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[110101,110102,110103,110104,110105,110106,110107].
