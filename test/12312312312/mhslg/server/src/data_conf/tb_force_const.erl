%%--- coding:utf-8 ---
-module(tb_force_const).
-export([get/1,get_list/0]).
get(coefficient_a)-> #{
    'value' => 5000
};

get(_N) -> false.
get_list() ->
	[coefficient_a].
