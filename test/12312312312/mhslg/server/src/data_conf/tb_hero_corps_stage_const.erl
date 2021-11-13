%%--- coding:utf-8 ---
-module(tb_hero_corps_stage_const).
-export([get/1,get_list/0]).
get(fail_get)-> #{
    'value' => 10
};
get(remedy_get)-> #{
    'value' => 200
};
get(remedy_item)-> #{
    'jsonvalue' => [
        1001,
         1
    ]
};
get(money)-> #{
    'value' => 1111
};
get(study_time_max)-> #{
    'value' => 60
};
get(recover_time)-> #{
    'value' => 600
};
get(item1)-> #{
    'value' => 1
};
get(item2)-> #{
    'value' => 1
};

get(_N) -> false.
get_list() ->
	[fail_get,remedy_get,remedy_item,money,study_time_max,recover_time,item1,item2].
