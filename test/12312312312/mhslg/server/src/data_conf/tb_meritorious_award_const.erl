%%--- coding:utf-8 ---
-module(tb_meritorious_award_const).
-export([get/1,get_list/0]).
get(grade)-> #{
    'value' => 31
};
get(max_season)-> #{
    'jsonvalue' => [
        1,
         1
    ]
};
get(restet_time)-> #{
    'timevalue' => 79200
};
get(rank_num)-> #{
    'value' => 100
};
get(max_stage)-> #{
    'value' => 5
};
get(kill_coefficient)-> #{
    'floatvalue' => 0.0006
};
get(player_coefficient)-> #{
    'value' => 5
};
get(npc_coefficient)-> #{
    'value' => 1
};
get(damage_coefficient)-> #{
    'floatvalue' => 0.24
};

get(_N) -> false.
get_list() ->
	[grade,max_season,restet_time,rank_num,max_stage,kill_coefficient,player_coefficient,npc_coefficient,damage_coefficient].
