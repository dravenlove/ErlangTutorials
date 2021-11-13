%%--- coding:utf-8 ---
-module(tb_country_pos).
-export([get/1,get_list/0]).
get(1)-> #{
    'appoint_pos' => 1,
    'appoint_dm' => 1,
    'ban_chat' => 0,
    'modify_notice' => 1,
    'siege_order' => 1,
    'defensive_order' => 1,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0,
    'world_rate' => 10,
    'fief_rate' => 10
};
get(2)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(3)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(4)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(5)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(6)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 1,
    'defensive_order' => 1,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(7)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 1,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(8)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 1,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(9)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 1,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(10)-> #{
    'appoint_pos' => 1,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 1,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(11)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 1,
    'prohibit_order' => 0
};
get(12)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 0
};
get(13)-> #{
    'appoint_pos' => 0,
    'appoint_dm' => 0,
    'ban_chat' => 0,
    'modify_notice' => 0,
    'siege_order' => 0,
    'defensive_order' => 0,
    'train_order' => 0,
    'build_order' => 0,
    'prohibit_order' => 1
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13].
