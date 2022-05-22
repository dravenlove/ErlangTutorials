%%--- coding:utf-8 ---
-module(tb_activity_identification_type).
-export([get/1,get_list/0]).
get(1)-> #{
    'type' => 1
};
get(2)-> #{
    'type' => 2
};
get(3)-> #{
    'type' => 3
};
get(4)-> #{
    'type' => 4
};

get(_N) -> false.
get_list() ->
	[1,2,3,4].
