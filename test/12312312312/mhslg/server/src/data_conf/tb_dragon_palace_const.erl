%%--- coding:utf-8 ---
-module(tb_dragon_palace_const).
-export([get/1,get_list/0]).
get(forest_initial_num)-> #{
    'value' => 400
};
get(lava_initial_num)-> #{
    'value' => 500
};
get(crystal_initial_num)-> #{
    'value' => 600
};
get(treasure_time)-> #{
    'timevalue' => 32400
};
get(lava_open_condition)-> #{
    'value' => 3
};
get(crystal_initial_condition)-> #{
    'value' => 4
};
get(rob_num)-> #{
    'value' => 5
};
get(forest_be_rob_num)-> #{
    'value' => 5
};
get(lava_be_rob_num)-> #{
    'value' => 5
};
get(crystal_be_rob_num)-> #{
    'value' => 5
};
get(be_rob_num)-> #{
    'value' => 3
};
get(forest_rob_ratio)-> #{
    'floatvalue' => 0.45
};
get(lava_rob_ratio)-> #{
    'floatvalue' => 0.5
};
get(crystal_rob_ratio)-> #{
    'floatvalue' => 0.6
};
get(refresh_rob_player)-> #{
    'jsonvalue' => [
        101001003,
         500
    ]
};
get(refresh_astrology)-> #{
    'jsonvalue' => [
        102002014,
         1
    ]
};
get(refresh_times)-> #{
    'value' => 1
};
get(rob_one_star)-> #{
    'jsonvalue' => [
        6,
         4
    ]
};
get(rob_two_star)-> #{
    'jsonvalue' => [
        6,
         5
    ]
};
get(rob_three_star)-> #{
    'jsonvalue' => [
        6,
         6
    ]
};
get(dragon_gem)-> #{
    'value' => 102002004
};

get(_N) -> false.
get_list() ->
	[forest_initial_num,lava_initial_num,crystal_initial_num,treasure_time,lava_open_condition,crystal_initial_condition,rob_num,forest_be_rob_num,lava_be_rob_num,crystal_be_rob_num,be_rob_num,forest_rob_ratio,lava_rob_ratio,crystal_rob_ratio,refresh_rob_player,refresh_astrology,refresh_times,rob_one_star,rob_two_star,rob_three_star,dragon_gem].
