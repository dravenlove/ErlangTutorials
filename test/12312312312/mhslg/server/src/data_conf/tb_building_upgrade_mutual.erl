%%--- coding:utf-8 ---
-module(tb_building_upgrade_mutual).
-export([get/1,get_list/0]).
get(accelerate_time)-> #{
    'value' => 3000
};
get(number)-> #{
    'value' => 10
};
get(auto_time)-> #{
    'value' => 180
};

get(_N) -> false.
get_list() ->
	[accelerate_time,number,auto_time].
