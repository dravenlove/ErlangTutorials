%%--- coding:utf-8 ---
-module(tb_alien_invasion_const).
-export([get/1,get_list/0]).
get(1)-> #{
    'jsonvalue' => [
        6001001,
         2017012,
         2017011,
         2017010,
         4017006,
         3017003,
         2017013,
         2017014,
         2008001,
         3008001
    ]
};
get(2)-> #{
    'jsonvalue' => [
        6002001,
         2017007,
         2017018,
         3017002,
         3017001,
         2017001,
         4017003,
         2017004,
         2017009,
         2017006
    ]
};
get(3)-> #{
    'jsonvalue' => [
        6003001,
         2017021,
         2017022,
         2015007,
         4015002,
         2015005,
         2015008,
         2017023,
         4017004,
         2015003
    ]
};
get(fresh_limit)-> #{
    'value' => 8
};
get(save_limit)-> #{
    'value' => 3
};
get(fresh_time)-> #{
    'jsonvalue' => [
        11,
         22,
         33,
         44,
         55,
         66,
         77,
         88
    ]
};
get(11)-> #{
    'value' => 4,
    'timevalue' => 28800
};
get(22)-> #{
    'value' => 1,
    'timevalue' => 32400
};
get(33)-> #{
    'value' => 1,
    'timevalue' => 36000
};
get(44)-> #{
    'value' => 1,
    'timevalue' => 39600
};
get(55)-> #{
    'value' => 1,
    'timevalue' => 43200
};
get(66)-> #{
    'value' => 2,
    'timevalue' => 61200
};
get(77)-> #{
    'value' => 1,
    'timevalue' => 64800
};
get(88)-> #{
    'value' => 1,
    'timevalue' => 68400
};
get(weight_list)-> #{
    'jsonvalue' => [
        [
            1,
             2,
             3
        ],
         [
            100,
             50,
             10
        ]
    ]
};
get(type_limit)-> #{
    'value' => 1
};

get(_N) -> false.
get_list() ->
	[1,2,3,fresh_limit,save_limit,fresh_time,11,22,33,44,55,66,77,88,weight_list,type_limit].
