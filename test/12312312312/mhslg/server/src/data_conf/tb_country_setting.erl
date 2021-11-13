%%--- coding:utf-8 ---
-module(tb_country_setting).
-export([get/1,get_list/0]).
get(impeach_duration)-> #{
    'int_val' => 60
};
get(impeach_cost)-> #{
    'json_val' => [
        [
            101001002,
             500
        ]
    ]
};
get(king_protect_time)-> #{
    'int_val' => 2880
};
get(king_change_rebate)-> #{
    'int_val' => 10
};
get(rank_number)-> #{
    'int_val' => 10
};
get(city_master_protect_time)-> #{
    'int_val' => 30
};
get(tax_revenue_time)-> #{
    'json_val' => [
        20,
         22
    ]
};
get(tax_revenue_rate)-> #{
    'json_val' => [
        0.1,
         0.1,
         0.1
    ]
};
get(city_master_order_cost)-> #{
    'json_val' => [
        [
            101001002,
             500
        ]
    ]
};
get(city_master_order_reward)-> #{
    'json_val' => [
        [
            101001002,
             1000
        ]
    ]
};
get(city_master_order_rate)-> #{
    'int_val' => 100
};
get(city_master_order_duration)-> #{
    'int_val' => 180
};
get(send_salary_time)-> #{
    'int_val' => 22
};

get(_N) -> false.
get_list() ->
	[impeach_duration,impeach_cost,king_protect_time,king_change_rebate,rank_number,city_master_protect_time,tax_revenue_time,tax_revenue_rate,city_master_order_cost,city_master_order_reward,city_master_order_rate,city_master_order_duration,send_salary_time].
