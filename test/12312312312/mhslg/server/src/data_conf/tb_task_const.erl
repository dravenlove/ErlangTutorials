%%--- coding:utf-8 ---
-module(tb_task_const).
-export([get/1,get_list/0]).
get(government_times)-> #{
    'value' => 5
};
get(government_buy_times)-> #{
    'value' => 3
};
get(government_times_cost)-> #{
    'jsonvalue' => [
        [
            101001002,
             50
        ],
         [
            101001002,
             100
        ],
         [
            101001002,
             300
        ]
    ]
};
get(exclude_government_city)-> #{
    
};
get(government_free_times)-> #{
    'value' => 3
};
get(government_refresh_cost)-> #{
    'jsonvalue' => [
        101001002,
         10
    ]
};
get(government_amount)-> #{
    'value' => 3
};
get(government_grade_cost)-> #{
    'jsonvalue' => [
        101001002,
         50
    ]
};
get(government_multiple)-> #{
    'value' => 20
};
get(achievement_task_tab_name)-> #{
    'jsonvalue' => [
        165,
         166,
         167,
         168
    ]
};
get(once_get_reward)-> #{
    'jsonvalue' => [
        1,
         2,
         3,
         4,
         5
    ]
};
get(government_gongxun_id)-> #{
    'value' => 101001007
};

get(_N) -> false.
get_list() ->
	[government_times,government_buy_times,government_times_cost,exclude_government_city,government_free_times,government_refresh_cost,government_amount,government_grade_cost,government_multiple,achievement_task_tab_name,once_get_reward,government_gongxun_id].
