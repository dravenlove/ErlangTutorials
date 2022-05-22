%%--- coding:utf-8 ---
-module(tb_honor_title_rand_prop).
-export([get/1,get_list/0]).
get(1001)-> #{
    'weight' => 10,
    'prop_name' => <<"hero_strength"/utf8>>,
    'prop_value' => 1.0
};
get(1002)-> #{
    'weight' => 10,
    'prop_name' => <<"hero_intelect"/utf8>>,
    'prop_value' => 1.0
};
get(1003)-> #{
    'weight' => 10,
    'prop_name' => <<"hero_spirit"/utf8>>,
    'prop_value' => 1.0
};
get(1004)-> #{
    'weight' => 10,
    'prop_name' => <<"hero_leadership"/utf8>>,
    'prop_value' => 1.0
};

get(_N) -> false.
get_list() ->
	[1001,1002,1003,1004].
