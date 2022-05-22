%%--- coding:utf-8 ---
-module(tb_science_effect).
-export([get/1,get_list/0]).
get(1944)-> #{
    'type' => 1,
    'cond_list' => [
        1
    ],
    'int_val' => 10,
    'json_val' => [
        1,
         3
    ]
};
get(1945)-> #{
    'type' => 2,
    'cond_list' => [
        2
    ]
};

get(_N) -> false.
get_list() ->
	[1944,1945].
