%%--- coding:utf-8 ---
-module(tb_new_king_gift).
-export([get/1,get_list/0]).
get(100)-> #{
    'rewards' => [
        [
            102003001,
             2
        ],
         [
            102003002,
             3
        ],
         [
            102004001,
             4
        ],
         [
            102004002,
             5
        ],
         [
            102004003,
             6
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[100].
