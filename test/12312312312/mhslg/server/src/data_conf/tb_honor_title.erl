%%--- coding:utf-8 ---
-module(tb_honor_title).
-export([get/1,get_list/0]).
get(108001001)-> #{
    'rand_amount' => 0,
    'hero_strength' => 2,
    'hero_intelect' => 2,
    'hero_spirit' => 2,
    'hero_leadership' => 2,
    'qianjun_attack_rate' => 0.35,
    'houjun_attack_rate' => 0.35,
    'qianjun_defence_rate' => 0.35,
    'houjun_defence_rate' => 0.35
};
get(108001002)-> #{
    'rand_amount' => 0,
    'hero_strength' => 2,
    'hero_intelect' => 1,
    'hero_spirit' => 2,
    'hero_leadership' => 2,
    'qianjun_attack_rate' => 0.35,
    'houjun_attack_rate' => 0.35,
    'qianjun_defence_rate' => 0.3,
    'houjun_defence_rate' => 0.3
};
get(108001003)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_intelect' => 1,
    'hero_spirit' => 2,
    'hero_leadership' => 2,
    'qianjun_attack_rate' => 0.3,
    'houjun_attack_rate' => 0.3,
    'qianjun_defence_rate' => 0.3,
    'houjun_defence_rate' => 0.3
};
get(108001004)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_intelect' => 1,
    'hero_spirit' => 1,
    'hero_leadership' => 2,
    'qianjun_attack_rate' => 0.3,
    'houjun_attack_rate' => 0.3,
    'qianjun_defence_rate' => 0.25,
    'houjun_defence_rate' => 0.25
};
get(108001005)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_intelect' => 1,
    'hero_spirit' => 1,
    'hero_leadership' => 1,
    'qianjun_attack_rate' => 0.25,
    'houjun_attack_rate' => 0.25,
    'qianjun_defence_rate' => 0.25,
    'houjun_defence_rate' => 0.25
};
get(108001006)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_intelect' => 1,
    'hero_leadership' => 1,
    'qianjun_attack_rate' => 0.25,
    'houjun_attack_rate' => 0.25,
    'qianjun_defence_rate' => 0.2,
    'houjun_defence_rate' => 0.2
};
get(108001007)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_intelect' => 1,
    'hero_spirit' => 1,
    'qianjun_attack_rate' => 0.2,
    'houjun_attack_rate' => 0.2,
    'qianjun_defence_rate' => 0.2,
    'houjun_defence_rate' => 0.2
};
get(108001008)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_intelect' => 1,
    'hero_leadership' => 1,
    'qianjun_attack_rate' => 0.15,
    'houjun_attack_rate' => 0.15,
    'qianjun_defence_rate' => 0.15,
    'houjun_defence_rate' => 0.15
};
get(108001009)-> #{
    'rand_amount' => 0,
    'hero_intelect' => 1,
    'hero_leadership' => 1,
    'qianjun_attack_rate' => 0.15,
    'houjun_attack_rate' => 0.15,
    'qianjun_defence_rate' => 0.15,
    'houjun_defence_rate' => 0.15
};
get(108001010)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_leadership' => 1,
    'qianjun_attack_rate' => 0.1,
    'houjun_attack_rate' => 0.1,
    'qianjun_defence_rate' => 0.1,
    'houjun_defence_rate' => 0.1
};
get(108001011)-> #{
    'rand_amount' => 0,
    'hero_strength' => 1,
    'hero_spirit' => 1,
    'qianjun_attack_rate' => 0.1,
    'houjun_attack_rate' => 0.1,
    'qianjun_defence_rate' => 0.05,
    'houjun_defence_rate' => 0.05
};
get(108001012)-> #{
    'rand_amount' => 1,
    'rand_prop' => [
        1001,
         1002,
         1003,
         1004
    ]
};
get(108001013)-> #{
    'rand_amount' => 1,
    'rand_prop' => [
        1001,
         1002,
         1003,
         1004
    ]
};
get(108001014)-> #{
    'rand_amount' => 1,
    'rand_prop' => [
        1001,
         1002,
         1003,
         1004
    ]
};

get(_N) -> false.
get_list() ->
	[108001001,108001002,108001003,108001004,108001005,108001006,108001007,108001008,108001009,108001010,108001011,108001012,108001013,108001014].
