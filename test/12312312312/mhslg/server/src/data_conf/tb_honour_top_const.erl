%%--- coding:utf-8 ---
-module(tb_honour_top_const).
-export([get/1,get_list/0]).
get(join_hero)-> #{
    'jsonvalue' => [
        [
            1,
             3
        ],
         [
            2,
             4
        ],
         [
            3,
             5
        ],
         [
            4,
             6
        ],
         [
            5,
             7
        ],
         [
            6,
             8
        ]
    ]
};
get(bat_start)-> #{
    'timevalue' => 56100
};
get(bat_over)-> #{
    'timevalue' => 59400
};
get(bat_money)-> #{
    'jsonvalue' => [
        100,
         5000
    ]
};
get(worship)-> #{
    'jsonvalue' => [
        102002003,
         1000
    ]
};
get(money)-> #{
    'value' => 102002003
};
get(fight_time)-> #{
    'value' => 60
};
get(show_list)-> #{
    'jsonvalue' => [
        1,
         2,
         3
    ]
};
get(apply_get)-> #{
    'jsonvalue' => [
        102002003,
         1000
    ]
};
get(max_apply)-> #{
    'value' => 1024
};
get(single_group)-> #{
    'value' => 4
};
get(eight_single_group)-> #{
    'value' => 8
};
get(all_stage)-> #{
    'jsonvalue' => [
        0,
         1,
         2,
         3,
         4,
         5,
         6,
         7,
         8
    ]
};
get(start_times)-> #{
    'value' => 3
};
get(honour_id)-> #{
    'value' => 102002003
};
get(open_season)-> #{
    'value' => 1
};

get(_N) -> false.
get_list() ->
	[join_hero,bat_start,bat_over,bat_money,worship,money,fight_time,show_list,apply_get,max_apply,single_group,eight_single_group,all_stage,start_times,honour_id,open_season].
