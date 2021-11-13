%%--- coding:utf-8 ---
-module(tb_package).
-export([get/1,get_list/0]).
get(2)-> #{
    'max_size' => 99999
};
get(3)-> #{
    'max_size' => 99999
};
get(4)-> #{
    'max_size' => 99999
};
get(5)-> #{
    'max_size' => 99999
};
get(6)-> #{
    'max_size' => 99999
};

get(_N) -> false.
get_list() ->
	[2,3,4,5,6].
