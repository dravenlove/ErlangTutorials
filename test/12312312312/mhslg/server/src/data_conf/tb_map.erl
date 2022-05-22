%%--- coding:utf-8 ---
-module(tb_map).
-export([get/1,get_list/0]).
get(1001)-> #{
    'name' => <<"4"/utf8>>,
    'danfov' => 10
};
get(2001)-> #{
    'name' => <<"5"/utf8>>,
    'danfov' => 20
};
get(3001)-> #{
    'name' => <<"6"/utf8>>,
    'danfov' => 20
};

get(_N) -> false.
get_list() ->
	[1001,2001,3001].
