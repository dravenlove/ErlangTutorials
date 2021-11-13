%%--- coding:utf-8 ---
-module(tb_government_task_silver_multiple).
-export([get/1,get_list/0]).
get(101)-> #{
    'type' => 1,
    'grade' => 1,
    'multiple' => 0
};
get(102)-> #{
    'type' => 1,
    'grade' => 2,
    'multiple' => 2
};
get(103)-> #{
    'type' => 1,
    'grade' => 3,
    'multiple' => 2
};
get(104)-> #{
    'type' => 1,
    'grade' => 4,
    'multiple' => 4
};
get(105)-> #{
    'type' => 1,
    'grade' => 5,
    'multiple' => 4
};
get(201)-> #{
    'type' => 2,
    'grade' => 1,
    'multiple' => 0
};
get(202)-> #{
    'type' => 2,
    'grade' => 2,
    'multiple' => 1
};
get(203)-> #{
    'type' => 2,
    'grade' => 3,
    'multiple' => 2
};
get(204)-> #{
    'type' => 2,
    'grade' => 4,
    'multiple' => 2
};
get(205)-> #{
    'type' => 2,
    'grade' => 5,
    'multiple' => 4
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,201,202,203,204,205].
