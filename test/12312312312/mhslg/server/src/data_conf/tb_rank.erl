%%--- coding:utf-8 ---
-module(tb_rank).
-export([get/1,get_list/0]).
get(1001)-> #{
    'range' => 1,
    'type' => 1,
    'max_num' => 50,
    'refresh_time' => 6,
    'reset_type' => 0
};
get(2001)-> #{
    'range' => 2,
    'type' => 1,
    'max_num' => 100,
    'refresh_time' => 6,
    'reset_type' => 0
};
get(1002)-> #{
    'range' => 1,
    'type' => 2,
    'max_num' => 50,
    'refresh_time' => 6,
    'reset_type' => 0
};
get(2002)-> #{
    'range' => 2,
    'type' => 2,
    'max_num' => 100,
    'refresh_time' => 6,
    'reset_type' => 0
};
get(1003)-> #{
    'range' => 1,
    'type' => 3,
    'max_num' => 50,
    'refresh_time' => 6,
    'reset_type' => 1
};
get(2003)-> #{
    'range' => 2,
    'type' => 3,
    'max_num' => 0,
    'refresh_time' => 6,
    'reset_type' => 1
};
get(1004)-> #{
    'range' => 1,
    'type' => 4,
    'max_num' => 50,
    'refresh_time' => 6,
    'reset_type' => 2
};
get(2004)-> #{
    'range' => 2,
    'type' => 4,
    'max_num' => 100,
    'refresh_time' => 6,
    'reset_type' => 2
};

get(_N) -> false.
get_list() ->
	[1001,2001,1002,2002,1003,2003,1004,2004].
