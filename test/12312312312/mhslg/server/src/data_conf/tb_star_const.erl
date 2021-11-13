%%--- coding:utf-8 ---
-module(tb_star_const).
-export([get/1,get_list/0]).
get(buy_num)-> #{
    'value' => 999
};
get(buy_money)-> #{
    'jsonvalue' => [
        102002015,
         1
    ]
};
get(experience_item)-> #{
    'jsonvalue' => [
        109010001,
         109010002,
         109010003
    ]
};
get(special_experience_item)-> #{
    'jsonvalue' => [
        109009001,
         109009002,
         109009003
    ]
};
get(max_level)-> #{
    'jsonvalue' => [
        [
            1,
             6
        ],
         [
            2,
             30
        ]
    ]
};
get(resolve)-> #{
    'jsonvalue' => [
        109010002,
         1
    ]
};
get(special_resolve)-> #{
    'jsonvalue' => [
        109009002,
         1
    ]
};
get(type_list)-> #{
    'jsonvalue' => [
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
get(last_season)-> #{
    'value' => 2
};
get(star_science)-> #{
    'jsonvalue' => [
        [
            1,
             9016
        ],
         [
            2,
             9016
        ],
         [
            3,
             9016
        ],
         [
            4,
             9016
        ],
         [
            5,
             9014
        ],
         [
            6,
             9011
        ],
         [
            7,
             9013
        ],
         [
            8,
             9012
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[buy_num,buy_money,experience_item,special_experience_item,max_level,resolve,special_resolve,type_list,last_season,star_science].
