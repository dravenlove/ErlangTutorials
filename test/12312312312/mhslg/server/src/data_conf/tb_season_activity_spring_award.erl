%%--- coding:utf-8 ---
-module(tb_season_activity_spring_award).
-export([get/1,get_list/0]).
get(1)-> #{
    'award_list' => [
        102,
         103,
         104,
         122
    ]
};
get(2)-> #{
    'award_list' => [
        102,
         103,
         104,
         123
    ]
};
get(3)-> #{
    'award_list' => [
        102,
         103,
         104,
         124
    ]
};
get(4)-> #{
    'award_list' => [
        102,
         103,
         104,
         125
    ]
};
get(5)-> #{
    'award_list' => [
        102,
         103,
         104,
         126
    ]
};
get(6)-> #{
    'award_list' => [
        102,
         103,
         104,
         127
    ]
};
get(7)-> #{
    'award_list' => [
        102,
         103,
         104,
         128
    ]
};
get(8)-> #{
    'award_list' => [
        102,
         103,
         104,
         129
    ]
};
get(9)-> #{
    'award_list' => [
        102,
         103,
         104,
         130
    ]
};
get(10)-> #{
    'award_list' => [
        102,
         103,
         104,
         131
    ]
};
get(11)-> #{
    'award_list' => [
        102,
         103,
         104,
         132
    ]
};
get(12)-> #{
    'award_list' => [
        102,
         103,
         104,
         133
    ]
};
get(13)-> #{
    'award_list' => [
        102,
         103,
         104,
         134
    ]
};
get(14)-> #{
    'award_list' => [
        102,
         103,
         104,
         135
    ]
};
get(15)-> #{
    'award_list' => [
        102,
         103,
         104,
         136
    ]
};
get(16)-> #{
    'award_list' => [
        102,
         103,
         104,
         137
    ]
};
get(17)-> #{
    'award_list' => [
        102,
         103,
         104,
         138
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17].
