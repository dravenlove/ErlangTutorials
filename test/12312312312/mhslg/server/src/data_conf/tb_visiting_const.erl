%%--- coding:utf-8 ---
-module(tb_visiting_const).
-export([get/1,get_list/0]).
get(time)-> #{
    'value' => 3600
};
get(init_num)-> #{
    'value' => 2
};
get(item)-> #{
    'jsonvalue' => [
        [
            102017002,
             1
        ]
    ]
};
get(x)-> #{
    'value' => 3
};
get(refresh_time)-> #{
    'value' => 5
};
get(complete_section)-> #{
    'jsonvalue' => [
        70,
         80,
         90
    ]
};
get(relation)-> #{
    'value' => 1
};

get(_N) -> false.
get_list() ->
	[time,init_num,item,x,refresh_time,complete_section,relation].
