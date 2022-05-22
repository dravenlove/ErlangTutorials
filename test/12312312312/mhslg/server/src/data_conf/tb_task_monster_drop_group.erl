%%--- coding:utf-8 ---
-module(tb_task_monster_drop_group).
-export([get/1,get_list/0]).
get(1081006)-> #{
        10810061=> #{
        'amount' => 35,
        'power' => 97
    },
        10810062=> #{
        'amount' => 60,
        'power' => 50
    },
        10810063=> #{
        'amount' => 70,
        'power' => 50
    },
        10810064=> #{
        'amount' => 1,
        'power' => 1
    }
};

get(_N) -> false.
get_list() ->
	[1081006].
