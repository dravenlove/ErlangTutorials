%%--- coding:utf-8 ---
-module(tb_chapter_task_const).
-export([get/1,get_list/0]).
get(1)-> #{
    'task_list' => [
        10101010,
         10102010,
         10103010
    ],
    'reward_id' => 10101010
};
get(2)-> #{
    'task_list' => [
        10205010,
         10205020,
         10204011,
         10207010,
         10204012,
         10204013,
         10206010
    ],
    'reward_id' => 10101010
};
get(3)-> #{
    'task_list' => [
        10305030,
         10305040,
         10305050,
         10306020
    ],
    'reward_id' => 10101010
};
get(4)-> #{
    'task_list' => [
        10408010,
         10405060,
         10409010,
         10410010,
         10411010
    ],
    'reward_id' => 10101010
};
get(5)-> #{
    'task_list' => [
        10515010,
         10505070,
         10513010,
         10514010,
         10512010
    ],
    'reward_id' => 10101010
};
get(6)-> #{
    'task_list' => [
        10604033,
         10616010,
         10617010,
         10618010,
         10605080
    ],
    'reward_id' => 10101010
};
get(7)-> #{
    'task_list' => [
        10710020,
         10719010,
         10720010,
         10721010,
         10705090
    ],
    'reward_id' => 10101010
};
get(8)-> #{
    'task_list' => [
        10810030,
         10822010,
         10824010,
         10805100
    ],
    'reward_id' => 10101010
};
get(9)-> #{
    'task_list' => [
        10917020,
         10925010,
         10905110,
         10926010,
         10928010,
         10928020
    ],
    'reward_id' => 10101010
};
get(10)-> #{
    'task_list' => [
        11029010,
         11030010,
         11011020,
         11031010
    ],
    'reward_id' => 10101010
};
get(11)-> #{
    'task_list' => [
        11105130,
         11120020,
         11116020,
         11105140,
         11121020,
         11115020
    ],
    'reward_id' => 10101010
};
get(12)-> #{
    'task_list' => [
        11232010,
         11221030,
         11233010
    ],
    'reward_id' => 10101010
};
get(13)-> #{
    'task_list' => [
        11334010,
         11335010
    ],
    'reward_id' => 10101010
};
get(14)-> #{
    'task_list' => [
        11429020,
         11405160,
         11436010,
         11408020,
         11424020,
         11412020
    ],
    'reward_id' => 10101010
};
get(15)-> #{
    'task_list' => [
        11537011,
         11538010,
         11530020
    ],
    'reward_id' => 10101010
};
get(16)-> #{
    'task_list' => [
        11639010,
         11605170,
         11623020,
         11640010,
         11641010
    ],
    'reward_id' => 10101010
};
get(17)-> #{
    'task_list' => [
        11732020,
         11742010,
         11705180
    ],
    'reward_id' => 10101010
};
get(18)-> #{
    'task_list' => [
        11843010
    ],
    'reward_id' => 10101010
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18].