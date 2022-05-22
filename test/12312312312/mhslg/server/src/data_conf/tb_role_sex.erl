%%--- coding:utf-8 ---
-module(tb_role_sex).
-export([get/1,get_list/0]).
get(1)-> #{
    'describe' => <<"4172"/utf8>>,
    'head_id' => 1001
};
get(2)-> #{
    'describe' => <<"4173"/utf8>>,
    'head_id' => 1002
};

get(_N) -> false.
get_list() ->
	[1,2].
