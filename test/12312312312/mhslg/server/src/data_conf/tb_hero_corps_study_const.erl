%%--- coding:utf-8 ---
-module(tb_hero_corps_study_const).
-export([get/1,get_list/0]).
get(fail_get)-> #{
    'floatvalue' => 0.1
};
get(remedy_get)-> #{
    'floatvalue' => 2.0
};
get(money)-> #{
    'value' => 101001002
};
get(study_time_max)-> #{
    'value' => 60
};
get(recover_time)-> #{
    'value' => 600
};
get(item1)-> #{
    'value' => 101001005
};
get(item2)-> #{
    'value' => 101001006
};
get(corps_type)-> #{
    'jsonvalue' => [
        1,
         2,
         3,
         4
    ]
};
get(hero_corps_max_level)-> #{
    'value' => 180
};
get(level_multiple)-> #{
    'value' => 6
};

get(_N) -> false.
get_list() ->
	[fail_get,remedy_get,money,study_time_max,recover_time,item1,item2,corps_type,hero_corps_max_level,level_multiple].
