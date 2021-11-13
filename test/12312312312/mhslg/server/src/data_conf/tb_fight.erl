%%--- coding:utf-8 ---
-module(tb_fight).
-export([get/1,get_list/0]).
get(1)-> #{
    'name' => <<"25312"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1001)-> #{
    'name' => <<"25313"/utf8>>,
    'shou_country' => 1,
    'interval_type' => 2,
    'interval' => 0,
    'count_down' => 30,
    'is_drums' => 1,
    'drums_limit' => 5
};
get(1002)-> #{
    'name' => <<"1292"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1003)-> #{
    'name' => <<"14287"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1004)-> #{
    'name' => <<"14019"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 1,
    'interval' => 10,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1005)-> #{
    'name' => <<"25314"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1006)-> #{
    'name' => <<"25315"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 1,
    'interval' => 0,
    'count_down' => 5,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1007)-> #{
    'name' => <<"25316"/utf8>>,
    'shou_country' => 1,
    'interval_type' => 3,
    'interval' => 5,
    'count_down' => 30,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1008)-> #{
    'name' => <<"14530"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1009)-> #{
    'name' => <<"14566"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1010)-> #{
    'name' => <<"14686"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1011)-> #{
    'name' => <<"25317"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1012)-> #{
    'name' => <<"14005"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 2,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1013)-> #{
    'name' => <<"25318"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1014)-> #{
    'name' => <<"25319"/utf8>>,
    'shou_country' => 1,
    'interval_type' => 2,
    'interval' => 0,
    'count_down' => 10,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1015)-> #{
    'name' => <<"14660"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};
get(1016)-> #{
    'name' => <<"25320"/utf8>>,
    'shou_country' => 0,
    'interval_type' => 0,
    'interval' => 0,
    'count_down' => 0,
    'is_drums' => 0,
    'drums_limit' => 0
};

get(_N) -> false.
get_list() ->
	[1,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016].
