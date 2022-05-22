%%--- coding:utf-8 ---
-module(tb_corps_general_attack).
-export([get/1,get_list/0]).
get(400101)-> #{
    'id' => 4001,
    'corps_type' => 1,
    'skill' => 100101001
};
get(400102)-> #{
    'id' => 4001,
    'corps_type' => 2,
    'skill' => 100201001
};
get(400103)-> #{
    'id' => 4001,
    'corps_type' => 3,
    'skill' => 100301001
};
get(400104)-> #{
    'id' => 4001,
    'corps_type' => 4,
    'skill' => 100401001
};

get(_N) -> false.
get_list() ->
	[400101,400102,400103,400104].
