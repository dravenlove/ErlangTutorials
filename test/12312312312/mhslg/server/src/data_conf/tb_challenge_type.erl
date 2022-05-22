%%--- coding:utf-8 ---
-module(tb_challenge_type).
-export([get/1,get_list/0]).
get(101)-> #{
    'type' => 1,
    'type_stage' => 1,
    'condition_type' => 1,
    'value' => 1,
    'name' => <<"智慧王座"/utf8>>
};
get(102)-> #{
    'type' => 1,
    'type_stage' => 2,
    'condition_type' => 1,
    'value' => 2,
    'name' => <<"勇猛王座"/utf8>>
};
get(103)-> #{
    'type' => 1,
    'type_stage' => 3,
    'condition_type' => 1,
    'value' => 3,
    'name' => <<"均衡王座"/utf8>>
};
get(104)-> #{
    'type' => 1,
    'type_stage' => 4,
    'condition_type' => 3,
    'value' => 2,
    'name' => <<"巾帼王座"/utf8>>
};
get(201)-> #{
    'type' => 2,
    'type_stage' => 1,
    'condition_type' => 2,
    'value' => 1,
    'name' => <<"步兵王座"/utf8>>
};
get(202)-> #{
    'type' => 2,
    'type_stage' => 2,
    'condition_type' => 2,
    'value' => 2,
    'name' => <<"骑兵王座"/utf8>>
};
get(203)-> #{
    'type' => 2,
    'type_stage' => 3,
    'condition_type' => 2,
    'value' => 3,
    'name' => <<"弓兵王座"/utf8>>
};
get(204)-> #{
    'type' => 2,
    'type_stage' => 4,
    'condition_type' => 2,
    'value' => 4,
    'name' => <<"法师王座"/utf8>>
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,201,202,203,204].
