%%--- coding:utf-8 ---
-module(tb_genesis_church_const).
-export([get/1,get_list/0]).
get(arrive_time)-> #{
    'value' => 3600
};
get(small_num)-> #{
    'jsonvalue' => [
        1,
         1
    ]
};
get(small_one)-> #{
    'timevalue' => 32400
};
get(small_two)-> #{
    'timevalue' => 36000
};
get(small_three)-> #{
    'timevalue' => 61200
};
get(small_four)-> #{
    'timevalue' => 64800
};
get(small_refresh_weight)-> #{
    'jsonvalue' => [
        [
            1,
             2,
             3,
             4,
             5,
             6
        ],
         [
            40,
             30,
             20,
             10,
             5,
             1
        ]
    ]
};
get(small_troops_num)-> #{
    'jsonvalue' => [
        [
            10,
             20,
             30
        ],
         [
            60,
             100,
             150,
             200
        ]
    ]
};
get(big_time)-> #{
    'timevalue' => 68400
};
get(big_refresh)-> #{
    'jsonvalue' => [
        3017002,
         1017014,
         1017015,
         2011001,
         1011013,
         3008001,
         1008006,
         1008007,
         1008011,
         2008002,
         3015001,
         2015006,
         2015008,
         1015011,
         1015012
    ]
};
get(big_open_day)-> #{
    'value' => 5
};
get(big_interval)-> #{
    'value' => 3
};
get(big_troops_num)-> #{
    'jsonvalue' => [
        [
            0,
             1,
             2,
             3
        ],
         [
            100,
             200,
             300,
             400
        ]
    ]
};
get(distance)-> #{
    'value' => 50
};
get(coord)-> #{
    'jsonvalue' => [
        0,
         1,
         2,
         3
    ]
};

get(_N) -> false.
get_list() ->
	[arrive_time,small_num,small_one,small_two,small_three,small_four,small_refresh_weight,small_troops_num,big_time,big_refresh,big_open_day,big_interval,big_troops_num,distance,coord].
