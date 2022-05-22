%%--- coding:utf-8 ---
-module(tb_challenge_const).
-export([get/1,get_list/0]).
get(dark_horse_award)-> #{
    'value' => 400
};
get(basics_attack_time)-> #{
    'value' => 3
};
get(attack_time_regain)-> #{
    'value' => 1200
};
get(common_basics)-> #{
    'value' => 100
};
get(special_basics)-> #{
    'value' => 150
};
get(add_up_interval)-> #{
    'value' => 30
};
get(common_add_up)-> #{
    'value' => 10
};
get(special_add_up)-> #{
    'value' => 15
};
get(win_min_troops)-> #{
    'floatvalue' => 0.1
};
get(guess_time)-> #{
    'timevalue' => 68400
};
get(run_time)-> #{
    'timevalue' => 72000
};
get(over_time)-> #{
    'timevalue' => 79200
};
get(activity_over)-> #{
    'timevalue' => 81000
};
get(get_interval)-> #{
    'value' => 30
};
get(common_get)-> #{
    'value' => 10
};
get(special_get)-> #{
    'value' => 15
};
get(money)-> #{
    'value' => 102002005
};
get(hero_num)-> #{
    'jsonvalue' => [
        [
            1,
             3
        ],
         [
            5,
             4
        ]
    ]
};
get(challenge_type)-> #{
    'jsonvalue' => [
        1,
         2,
         3,
         4
    ]
};
get(buy_attack_time)-> #{
    'jsonvalue' => [
        [
            1,
             100
        ],
         [
            6,
             500
        ],
         [
            11,
             1000
        ]
    ]
};
get(start_icon)-> #{
    'timevalue' => 67800
};
get(buy_item)-> #{
    'value' => 101001002
};
get(hero_attack_time)-> #{
    'value' => 10
};
get(win_get_coefficient)-> #{
    'floatvalue' => 0.5
};
get(get_basics)-> #{
    'value' => 100
};
get(lose_get_coefficient)-> #{
    'value' => 50
};
get(lose_max)-> #{
    'value' => 125
};
get(time_buff)-> #{
    'value' => 120
};
get(win_time_buff)-> #{
    'value' => 5
};
get(add_skill)-> #{
    'value' => 2050011001
};

get(_N) -> false.
get_list() ->
	[dark_horse_award,basics_attack_time,attack_time_regain,common_basics,special_basics,add_up_interval,common_add_up,special_add_up,win_min_troops,guess_time,run_time,over_time,activity_over,get_interval,common_get,special_get,money,hero_num,challenge_type,buy_attack_time,start_icon,buy_item,hero_attack_time,win_get_coefficient,get_basics,lose_get_coefficient,lose_max,time_buff,win_time_buff,add_skill].
