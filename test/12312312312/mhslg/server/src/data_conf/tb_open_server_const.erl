%%--- coding:utf-8 ---
-module(tb_open_server_const).
-export([get/1,get_list/0]).
get(government_times)-> #{
    'value' => 5
};

get(_N) -> false.
get_list() ->
	[government_times].
