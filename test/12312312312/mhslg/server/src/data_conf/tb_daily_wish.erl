%%--- coding:utf-8 ---
-module(tb_daily_wish).
-export([get/1,get_list/0]).
get(111)-> #{
    'type' => 1,
    'time_id' => 1,
    'sort_id' => 1,
    'reward' => [
        101001002,
         100
    ],
    'item_id' => 101001002
};
get(121)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 1,
    'reward' => [
        101001003,
         5000
    ],
    'item_id' => 101001003
};
get(122)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 2,
    'reward' => [
        101001003,
         5000
    ],
    'item_id' => 101001003
};
get(123)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 3,
    'reward' => [
        101001004,
         10000
    ],
    'item_id' => 101001004
};
get(124)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 4,
    'reward' => [
        101001004,
         10000
    ],
    'item_id' => 101001004
};
get(125)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 5,
    'reward' => [
        101001005,
         10000
    ],
    'item_id' => 101001005
};
get(126)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 6,
    'reward' => [
        101001005,
         10000
    ],
    'item_id' => 101001005
};
get(127)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 7,
    'reward' => [
        101001006,
         10000
    ],
    'item_id' => 101001006
};
get(128)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 8,
    'reward' => [
        101001006,
         10000
    ],
    'item_id' => 101001006
};
get(129)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 9,
    'reward' => [
        102004002,
         5
    ],
    'item_id' => 102004002
};
get(130)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 10,
    'reward' => [
        104008001,
         5
    ],
    'item_id' => 104008001
};
get(131)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 11,
    'reward' => [
        102016002,
         1
    ],
    'item_id' => 102016002
};
get(132)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 12,
    'reward' => [
        102015002,
         1
    ],
    'item_id' => 102015002
};
get(133)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 13,
    'reward' => [
        102014002,
         2
    ],
    'item_id' => 102014002
};
get(134)-> #{
    'type' => 1,
    'time_id' => 2,
    'sort_id' => 14,
    'reward' => [
        104006001,
         10
    ],
    'item_id' => 104006001
};
get(211)-> #{
    'type' => 2,
    'time_id' => 1,
    'sort_id' => 1,
    'reward' => [
        102017001,
         4
    ],
    'item_id' => 102017001
};
get(212)-> #{
    'type' => 2,
    'time_id' => 1,
    'sort_id' => 2,
    'reward' => [
        102017002,
         4
    ],
    'item_id' => 102017002
};
get(221)-> #{
    'type' => 2,
    'time_id' => 2,
    'sort_id' => 1,
    'reward' => [
        102017001,
         3
    ],
    'item_id' => 102017001
};
get(222)-> #{
    'type' => 2,
    'time_id' => 2,
    'sort_id' => 2,
    'reward' => [
        102017002,
         3
    ],
    'item_id' => 102017002
};
get(223)-> #{
    'type' => 2,
    'time_id' => 2,
    'sort_id' => 3,
    'reward' => [
        102017003,
         3
    ],
    'item_id' => 102017003
};
get(224)-> #{
    'type' => 2,
    'time_id' => 2,
    'sort_id' => 4,
    'reward' => [
        102017004,
         3
    ],
    'item_id' => 102017004
};
get(225)-> #{
    'type' => 2,
    'time_id' => 2,
    'sort_id' => 5,
    'reward' => [
        102017006,
         3
    ],
    'item_id' => 102017006
};

get(_N) -> false.
get_list() ->
	[111,121,122,123,124,125,126,127,128,129,130,131,132,133,134,211,212,221,222,223,224,225].
