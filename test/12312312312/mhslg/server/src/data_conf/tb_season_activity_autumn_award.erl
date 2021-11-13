%%--- coding:utf-8 ---
-module(tb_season_activity_autumn_award).
-export([get/1,get_list/0]).
get(1)-> #{
    'award_list' => [
        302,
         303,
         304,
         305
    ]
};
get(2)-> #{
    'award_list' => [
        302,
         303,
         304,
         306
    ]
};
get(3)-> #{
    'award_list' => [
        302,
         303,
         304,
         307
    ]
};
get(4)-> #{
    'award_list' => [
        302,
         303,
         304,
         308
    ]
};
get(5)-> #{
    'award_list' => [
        302,
         303,
         304,
         309
    ]
};
get(6)-> #{
    'award_list' => [
        302,
         303,
         304,
         310
    ]
};
get(7)-> #{
    'award_list' => [
        302,
         303,
         304,
         311
    ]
};
get(8)-> #{
    'award_list' => [
        302,
         303,
         304,
         312
    ]
};
get(9)-> #{
    'award_list' => [
        302,
         303,
         304,
         305
    ]
};
get(10)-> #{
    'award_list' => [
        302,
         303,
         304,
         306
    ]
};
get(11)-> #{
    'award_list' => [
        302,
         303,
         304,
         307
    ]
};
get(12)-> #{
    'award_list' => [
        302,
         303,
         304,
         308
    ]
};
get(13)-> #{
    'award_list' => [
        302,
         303,
         304,
         309
    ]
};
get(14)-> #{
    'award_list' => [
        302,
         303,
         304,
         310
    ]
};
get(15)-> #{
    'award_list' => [
        302,
         303,
         304,
         311
    ]
};
get(16)-> #{
    'award_list' => [
        302,
         303,
         304,
         312
    ]
};
get(17)-> #{
    'award_list' => [
        302,
         303,
         304,
         305
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17].
