%%--- coding:utf-8 ---
-module(tb_season_activity_const).
-export([get/1,get_list/0]).
get(random_hero_line)-> #{
    'int' => 5
};
get(random_hero_sex_line)-> #{
    'int' => 10
};
get(exclude_capital_line)-> #{
    'int' => 5
};
get(exclude_fortress_line)-> #{
    'int' => 10
};
get(exclude_antiwar_line)-> #{
    'int' => 15
};
get(special_target_line)-> #{
    'int' => 80
};
get(spring_mission_number)-> #{
    'int' => 10
};
get(refresh_mission_time)-> #{
    'int' => 120
};
get(campfire_total_times)-> #{
    'int' => 10
};
get(campfire_charge_time)-> #{
    'int' => 600
};
get(firecracker_cost_id)-> #{
    'int' => 101001002
};
get(firecracker_cost)-> #{
    'int' => 30
};
get(firework_recharge)-> #{
    'int' => 30
};
get(firecracker_times)-> #{
    'int' => 10
};
get(firework_times)-> #{
    'int' => 10
};
get(autumn_mission_number)-> #{
    'int' => 10
};
get(question_number)-> #{
    'int' => 20
};
get(question_time)-> #{
    'int' => 20
};
get(next_question_rank_time)-> #{
    'int' => 2
};
get(next_question_extr_time)-> #{
    'int' => 3
};
get(spring_start_time)-> #{
    'time' => {
        9,
        30,
        0
    }
};
get(spring_end_time)-> #{
    'time' => {
        21,
        30,
        0
    }
};
get(summer_start_time)-> #{
    'time' => {
        9,
        30,
        0
    }
};
get(summer_end_time)-> #{
    'time' => {
        21,
        30,
        0
    }
};
get(autumn_start_time)-> #{
    'time' => {
        9,
        30,
        0
    }
};
get(autumn_end_time)-> #{
    'time' => {
        21,
        30,
        0
    }
};
get(winter_start_time)-> #{
    'time' => {
        9,
        30,
        0
    }
};
get(winter_end_time)-> #{
    'time' => {
        21,
        30,
        0
    }
};
get(spring_final_award)-> #{
    'json' => [
        102,
         103,
         104,
         105,
         106
    ]
};
get(autumn_final_award)-> #{
    'json' => [
        302,
         303,
         304,
         305,
         306
    ]
};
get(firework_award2)-> #{
    'json' => [
        [
            101001002,
             1
        ]
    ]
};
get(firecracker_award2)-> #{
    'json' => [
        [
            101001002,
             1
        ]
    ]
};
get(firecracker_award)-> #{
    'json' => [
        202,
         203,
         204,
         205,
         206
    ]
};
get(firework_award)-> #{
    'json' => [
        202,
         203
    ]
};
get(firecracker_words)-> #{
    'string' => <<"爆竹炸啦"/utf8>>
};
get(firework_words)-> #{
    'string' => <<"烟花炸啦"/utf8>>
};

get(_N) -> false.
get_list() ->
	[random_hero_line,random_hero_sex_line,exclude_capital_line,exclude_fortress_line,exclude_antiwar_line,special_target_line,spring_mission_number,refresh_mission_time,campfire_total_times,campfire_charge_time,firecracker_cost_id,firecracker_cost,firework_recharge,firecracker_times,firework_times,autumn_mission_number,question_number,question_time,next_question_rank_time,next_question_extr_time,spring_start_time,spring_end_time,summer_start_time,summer_end_time,autumn_start_time,autumn_end_time,winter_start_time,winter_end_time,spring_final_award,autumn_final_award,firework_award2,firecracker_award2,firecracker_award,firework_award,firecracker_words,firework_words].
