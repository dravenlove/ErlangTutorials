%%--- coding:utf-8 ---
-module(tb_gift_rand_group).
-export([get/1,get_list/0]).
get(104000101)-> #{
    'dropgroup_id' => 1040001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104000102)-> #{
    'dropgroup_id' => 1040001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104001001)-> #{
    'dropgroup_id' => 104001001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104002001)-> #{
    'dropgroup_id' => 104002001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104003001)-> #{
    'dropgroup_id' => 104003001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104004001)-> #{
    'dropgroup_id' => 104004001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104005001)-> #{
    'dropgroup_id' => 104005001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104006001)-> #{
    'dropgroup_id' => 104006001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104007001)-> #{
    'dropgroup_id' => 104007001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104008001)-> #{
    'dropgroup_id' => 104008001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104009001)-> #{
    'dropgroup_id' => 104009001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104010001)-> #{
    'dropgroup_id' => 104010001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};
get(104011001)-> #{
    'dropgroup_id' => 104011001,
    'drop_rate' => 1.0,
    'reward_rate' => 1
};

get(_N) -> false.
get_list() ->
	[104000101,104000102,104001001,104002001,104003001,104004001,104005001,104006001,104007001,104008001,104009001,104010001,104011001].
