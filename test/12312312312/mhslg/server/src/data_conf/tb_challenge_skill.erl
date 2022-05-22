%%--- coding:utf-8 ---
-module(tb_challenge_skill).
-export([get/1,get_list/0]).
get(1)-> #{
    'value' => 2
};

get(_N) -> false.
get_list() ->
	[1].
