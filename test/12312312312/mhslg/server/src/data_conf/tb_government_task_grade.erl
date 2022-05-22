%%--- coding:utf-8 ---
-module(tb_government_task_grade).
-export([get/1,get_list/0]).
get(1)-> #{
    'min_multiple' => 1,
    'max_multiple' => 3
};
get(2)-> #{
    'min_multiple' => 3,
    'max_multiple' => 4
};
get(3)-> #{
    'min_multiple' => 4,
    'max_multiple' => 5
};
get(4)-> #{
    'min_multiple' => 5,
    'max_multiple' => 6
};
get(5)-> #{
    'min_multiple' => 6,
    'max_multiple' => 20
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5].
