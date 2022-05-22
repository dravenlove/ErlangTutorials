%%--- coding:utf-8 ---
-module(tb_role_country).
-export([get/1,get_list/0]).
get(1)-> #{
    'country_name' => <<"3923"/utf8>>,
    'describe' => <<"3924"/utf8>>,
    'max_role' => 800,
    'tips' => <<"3925"/utf8>>,
    'reward' => [
        101001001,
         200
    ]
};
get(2)-> #{
    'country_name' => <<"3926"/utf8>>,
    'describe' => <<"3927"/utf8>>,
    'max_role' => 800,
    'tips' => <<"3925"/utf8>>,
    'reward' => [
        101001001,
         200
    ]
};
get(3)-> #{
    'country_name' => <<"3928"/utf8>>,
    'describe' => <<"3929"/utf8>>,
    'max_role' => 800,
    'tips' => <<"3925"/utf8>>,
    'reward' => [
        101001001,
         200
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3].
