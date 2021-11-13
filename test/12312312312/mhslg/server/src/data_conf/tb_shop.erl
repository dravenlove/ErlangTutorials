%%--- coding:utf-8 ---
-module(tb_shop).
-export([get/1,get_list/0]).
get(101)-> #{
    'grid_number' => 8,
    'refresh_type' => 1,
    'free_refresh_times' => 0,
    'price_type' => 1,
    'grid_limit' => 10,
    'total_limit' => 0
};
get(102)-> #{
    'grid_number' => 8,
    'refresh_type' => 1,
    'free_refresh_times' => 0,
    'price_type' => 1,
    'grid_limit' => 10,
    'total_limit' => 0
};
get(103)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 30,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 0
};
get(104)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 1,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 0
};
get(105)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 1,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 10
};
get(106)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 1,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 22
};
get(107)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 1,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 0
};
get(108)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 1,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 0
};
get(109)-> #{
    'grid_number' => 8,
    'refresh_type' => 2,
    'free_refresh_times' => 3,
    'refresh_max_index' => 1,
    'price_type' => 2,
    'grid_limit' => 1,
    'total_limit' => 0
};
get(110)-> #{
    'grid_number' => 8,
    'refresh_type' => 1,
    'free_refresh_times' => 0,
    'price_type' => 2,
    'grid_limit' => 0,
    'total_limit' => 0
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107,108,109,110].
