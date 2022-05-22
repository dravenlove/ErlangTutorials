%%--- coding:utf-8 ---
-module(tb_honour_top_rise).
-export([get/1,get_list/0]).
get(1)-> #{
    'type' => 1,
    'condition1' => [
        2,
         0
    ]
};
get(2)-> #{
    'type' => 2,
    'condition2' => [
        [
            2,
             0
        ],
         [
            2,
             1
        ]
    ]
};
get(3)-> #{
    'type' => 2,
    'condition2' => [
        [
            2,
             0
        ],
         [
            2,
             1
        ]
    ]
};
get(4)-> #{
    'type' => 2,
    'condition2' => [
        [
            2,
             0
        ],
         [
            2,
             1
        ]
    ]
};
get(5)-> #{
    'type' => 2,
    'condition2' => [
        [
            2,
             0
        ],
         [
            2,
             1
        ]
    ]
};
get(6)-> #{
    'type' => 2,
    'condition2' => [
        [
            2,
             0
        ],
         [
            2,
             1
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6].
