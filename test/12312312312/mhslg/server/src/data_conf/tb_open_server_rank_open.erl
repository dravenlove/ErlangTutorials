%%--- coding:utf-8 ---
-module(tb_open_server_rank_open).
-export([get/1,get_list/0]).
get(101)-> #{
        101=> #{
        'time' => 0,
        'award_day' => 169200,
        'final_value' => 6,
        'rank_cunt_lift_time' => 0,
        'rank_cunt_right_time' => 169200
    },
        102=> #{
        'time' => 172800,
        'award_day' => 255600,
        'final_value' => 30,
        'assist_value' => 2,
        'rank_count' => 5,
        'rank_cunt_lift_time' => 172800,
        'rank_cunt_right_time' => 255600
    },
        103=> #{
        'time' => 259200,
        'award_day' => 342000,
        'final_value' => 20,
        'assist_value' => 2,
        'rank_count' => 5,
        'rank_cunt_lift_time' => 259200,
        'rank_cunt_right_time' => 342000
    },
        104=> #{
        'time' => 345600,
        'award_day' => 428400,
        'final_value' => 200,
        'rank_cunt_lift_time' => 345600,
        'rank_cunt_right_time' => 428400
    },
        105=> #{
        'time' => 432000,
        'award_day' => 514800,
        'final_value' => 5000,
        'rank_cunt_lift_time' => 432000,
        'rank_cunt_right_time' => 514800
    },
        106=> #{
        'time' => 518400,
        'award_day' => 601200,
        'final_value' => 10000,
        'rank_cunt_lift_time' => 518400,
        'rank_cunt_right_time' => 601200
    }
};

get(_N) -> false.
get_list() ->
	[101].
