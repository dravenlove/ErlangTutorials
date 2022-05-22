%%--- coding:utf-8 ---
-module(tb_prop_force_main).
-export([get/1,get_list/0]).
get(qianjun_attack)-> #{
    'force_value' => 2.0,
    'attribute_powerbase' => 2.0
};
get(houjun_attack)-> #{
    'force_value' => 2.0,
    'attribute_powerbase' => 2.0
};
get(qianjun_defence)-> #{
    'force_value' => 2.0,
    'attribute_powerbase' => 2.0
};
get(houjun_defence)-> #{
    'force_value' => 2.0,
    'attribute_powerbase' => 2.0
};
get(qianjun_speed)-> #{
    'force_value' => 6.0,
    'attribute_powerbase' => 6.0
};
get(houjun_speed)-> #{
    'force_value' => 6.0,
    'attribute_powerbase' => 6.0
};
get(qianjun_troops)-> #{
    'force_value' => 1.5,
    'attribute_powerbase' => 1.5
};
get(houjun_troops)-> #{
    'force_value' => 1.5,
    'attribute_powerbase' => 1.5
};

get(_N) -> false.
get_list() ->
	[qianjun_attack,houjun_attack,qianjun_defence,houjun_defence,qianjun_speed,houjun_speed,qianjun_troops,houjun_troops].
