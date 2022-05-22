%%--- coding:utf-8 ---
-module(tb_here_die_attack).
-export([get/1,get_list/0]).
get(500101)-> #{
    'id' => 5001,
    'hero_type' => 1,
    'skill' => 200101001
};
get(500102)-> #{
    'id' => 5001,
    'hero_type' => 2,
    'skill' => 200201001
};
get(500103)-> #{
    'id' => 5001,
    'hero_type' => 3,
    'skill' => 200301001
};

get(_N) -> false.
get_list() ->
	[500101,500102,500103].
