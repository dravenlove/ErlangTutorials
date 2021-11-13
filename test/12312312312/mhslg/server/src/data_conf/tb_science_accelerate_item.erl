%%--- coding:utf-8 ---
-module(tb_science_accelerate_item).
-export([get/1,get_list/0]).
get(102013001)-> #{
    'time' => 10
};
get(102013002)-> #{
    'time' => 60
};
get(102015001)-> #{
    'time' => 10
};
get(102015002)-> #{
    'time' => 60
};

get(_N) -> false.
get_list() ->
	[102013001,102013002,102015001,102015002].
