%%--- coding:utf-8 ---
-module(tb_function_open).
-export([get/1,get_list/0]).
get(1)-> #{
    'condition_type' => 1,
    'player_level' => 1,
    'season' => 1,
    'knighthood' => 1,
    'open_day' => 1
};
get(2)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(101)-> #{
    'condition_type' => 3
};
get(102)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(105)-> #{
    'condition_type' => 2,
    'knighthood' => 6
};
get(106)-> #{
    'condition_type' => 2,
    'knighthood' => 3
};
get(107)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(108)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(109)-> #{
    'condition_type' => 1,
    'knighthood' => 101
};
get(110)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(111)-> #{
    'condition_type' => 1,
    'player_level' => 9
};
get(112)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(113)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(114)-> #{
    'condition_type' => 1,
    'player_level' => 9
};
get(115)-> #{
    'condition_type' => 1,
    'player_level' => 4
};
get(116)-> #{
    'condition_type' => 1,
    'player_level' => 6
};
get(117)-> #{
    'condition_type' => 1,
    'player_level' => 6
};
get(118)-> #{
    'condition_type' => 1,
    'open_day' => 1
};
get(119)-> #{
    'condition_type' => 1,
    'player_level' => 13
};
get(120)-> #{
    'condition_type' => 1,
    'player_level' => 2
};
get(121)-> #{
    'condition_type' => 1,
    'player_level' => 2
};
get(122)-> #{
    'condition_type' => 1,
    'player_level' => 3
};
get(123)-> #{
    'condition_type' => 1,
    'player_level' => 3
};
get(124)-> #{
    'condition_type' => 1,
    'player_level' => 3
};
get(125)-> #{
    'condition_type' => 1,
    'knighthood' => 101
};
get(126)-> #{
    'condition_type' => 1,
    'knighthood' => 101
};
get(127)-> #{
    'condition_type' => 1,
    'player_level' => 9
};
get(128)-> #{
    'condition_type' => 1,
    'player_level' => 13
};
get(129)-> #{
    'condition_type' => 1,
    'player_level' => 13
};
get(130)-> #{
    'condition_type' => 1,
    'player_level' => 13
};
get(131)-> #{
    'condition_type' => 1,
    'privilege' => 208071
};
get(132)-> #{
    'condition_type' => 1,
    'player_level' => 6
};
get(133)-> #{
    'condition_type' => 3
};
get(134)-> #{
    'condition_type' => 3
};
get(135)-> #{
    'condition_type' => 3
};
get(136)-> #{
    'condition_type' => 3
};
get(137)-> #{
    'condition_type' => 1,
    'player_level' => 15
};
get(138)-> #{
    'condition_type' => 1,
    'player_level' => 12
};
get(139)-> #{
    'condition_type' => 1,
    'player_level' => 6
};
get(140)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(141)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(142)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(143)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(144)-> #{
    'condition_type' => 1,
    'player_level' => 1
};
get(145)-> #{
    'condition_type' => 1,
    'player_level' => 12
};
get(146)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'open_day' => 10
};
get(147)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'open_day' => 10
};
get(148)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'open_day' => 13
};
get(149)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'open_day' => 18
};
get(150)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'open_day' => 30
};
get(151)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'combine_day' => [
        1,
         1
    ]
};
get(152)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'combine_day' => [
        2,
         1
    ]
};
get(153)-> #{
    'condition_type' => 2,
    'player_level' => 3,
    'combine_day' => [
        3,
         1
    ]
};
get(154)-> #{
    'condition_type' => 1,
    'player_level' => 3
};
get(155)-> #{
    'condition_type' => 3,
    'player_level' => 1,
    'season' => 1
};
get(156)-> #{
    'condition_type' => 3,
    'player_level' => 1,
    'season' => 2
};
get(157)-> #{
    'condition_type' => 3,
    'player_level' => 1,
    'season' => 3
};
get(158)-> #{
    'condition_type' => 3,
    'player_level' => 1,
    'season' => 4
};
get(159)-> #{
    'condition_type' => 2,
    'player_level' => 5
};
get(160)-> #{
    'condition_type' => 1,
    'player_level' => 6
};

get(_N) -> false.
get_list() ->
	[1,2,101,102,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160].
