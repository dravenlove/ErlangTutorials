%%--- coding:utf-8 ---
-module(tb_buy_times_and_resources).
-export([get/1,get_list/0]).
get(1)-> #{
    'num' => 12,
    'silver_num' => 7700,
    'cereal_num' => 15400,
    'wood_num' => 15400,
    'iron_num' => 15400,
    'crit' => 0.3
};
get(2)-> #{
    'num' => 14,
    'silver_num' => 7900,
    'cereal_num' => 15800,
    'wood_num' => 15800,
    'iron_num' => 15800,
    'crit' => 0.3
};
get(3)-> #{
    'num' => 16,
    'silver_num' => 8100,
    'cereal_num' => 16200,
    'wood_num' => 16200,
    'iron_num' => 16200,
    'crit' => 0.3
};
get(4)-> #{
    'num' => 18,
    'silver_num' => 8300,
    'cereal_num' => 16600,
    'wood_num' => 16600,
    'iron_num' => 16600,
    'crit' => 0.3
};
get(5)-> #{
    'num' => 20,
    'silver_num' => 8500,
    'cereal_num' => 17000,
    'wood_num' => 17000,
    'iron_num' => 17000,
    'crit' => 0.3
};
get(6)-> #{
    'num' => 22,
    'silver_num' => 8700,
    'cereal_num' => 17400,
    'wood_num' => 17400,
    'iron_num' => 17400,
    'crit' => 0.3
};
get(7)-> #{
    'num' => 24,
    'silver_num' => 8900,
    'cereal_num' => 17800,
    'wood_num' => 17800,
    'iron_num' => 17800,
    'crit' => 0.3
};
get(8)-> #{
    'num' => 26,
    'silver_num' => 9100,
    'cereal_num' => 18200,
    'wood_num' => 18200,
    'iron_num' => 18200,
    'crit' => 0.3
};
get(9)-> #{
    'num' => 28,
    'silver_num' => 9300,
    'cereal_num' => 18600,
    'wood_num' => 18600,
    'iron_num' => 18600,
    'crit' => 0.3
};
get(10)-> #{
    'num' => 30,
    'silver_num' => 9500,
    'cereal_num' => 19000,
    'wood_num' => 19000,
    'iron_num' => 19000,
    'crit' => 0.3
};
get(11)-> #{
    'num' => 32,
    'silver_num' => 9700,
    'cereal_num' => 19400,
    'wood_num' => 19400,
    'iron_num' => 19400,
    'crit' => 0.3
};
get(12)-> #{
    'num' => 34,
    'silver_num' => 9900,
    'cereal_num' => 19800,
    'wood_num' => 19800,
    'iron_num' => 19800,
    'crit' => 0.3
};
get(13)-> #{
    'num' => 36,
    'silver_num' => 10100,
    'cereal_num' => 20200,
    'wood_num' => 20200,
    'iron_num' => 20200,
    'crit' => 0.3
};
get(14)-> #{
    'num' => 38,
    'silver_num' => 10300,
    'cereal_num' => 20600,
    'wood_num' => 20600,
    'iron_num' => 20600,
    'crit' => 0.3
};
get(15)-> #{
    'num' => 40,
    'silver_num' => 10500,
    'cereal_num' => 21000,
    'wood_num' => 21000,
    'iron_num' => 21000,
    'crit' => 0.3
};
get(16)-> #{
    'num' => 42,
    'silver_num' => 10700,
    'cereal_num' => 21400,
    'wood_num' => 21400,
    'iron_num' => 21400,
    'crit' => 0.3
};
get(17)-> #{
    'num' => 44,
    'silver_num' => 10900,
    'cereal_num' => 21800,
    'wood_num' => 21800,
    'iron_num' => 21800,
    'crit' => 0.3
};
get(18)-> #{
    'num' => 46,
    'silver_num' => 11100,
    'cereal_num' => 22200,
    'wood_num' => 22200,
    'iron_num' => 22200,
    'crit' => 0.3
};
get(19)-> #{
    'num' => 48,
    'silver_num' => 11300,
    'cereal_num' => 22600,
    'wood_num' => 22600,
    'iron_num' => 22600,
    'crit' => 0.3
};
get(20)-> #{
    'num' => 50,
    'silver_num' => 11500,
    'cereal_num' => 23000,
    'wood_num' => 23000,
    'iron_num' => 23000,
    'crit' => 0.3
};
get(21)-> #{
    'num' => 52,
    'silver_num' => 11700,
    'cereal_num' => 23400,
    'wood_num' => 23400,
    'iron_num' => 23400,
    'crit' => 0.3
};
get(22)-> #{
    'num' => 54,
    'silver_num' => 11900,
    'cereal_num' => 23800,
    'wood_num' => 23800,
    'iron_num' => 23800,
    'crit' => 0.3
};
get(23)-> #{
    'num' => 56,
    'silver_num' => 12100,
    'cereal_num' => 24200,
    'wood_num' => 24200,
    'iron_num' => 24200,
    'crit' => 0.3
};
get(24)-> #{
    'num' => 58,
    'silver_num' => 12300,
    'cereal_num' => 24600,
    'wood_num' => 24600,
    'iron_num' => 24600,
    'crit' => 0.3
};
get(25)-> #{
    'num' => 60,
    'silver_num' => 12500,
    'cereal_num' => 25000,
    'wood_num' => 25000,
    'iron_num' => 25000,
    'crit' => 0.3
};
get(26)-> #{
    'num' => 62,
    'silver_num' => 12700,
    'cereal_num' => 25400,
    'wood_num' => 25400,
    'iron_num' => 25400,
    'crit' => 0.3
};
get(27)-> #{
    'num' => 64,
    'silver_num' => 12900,
    'cereal_num' => 25800,
    'wood_num' => 25800,
    'iron_num' => 25800,
    'crit' => 0.3
};
get(28)-> #{
    'num' => 66,
    'silver_num' => 13100,
    'cereal_num' => 26200,
    'wood_num' => 26200,
    'iron_num' => 26200,
    'crit' => 0.3
};
get(29)-> #{
    'num' => 68,
    'silver_num' => 13300,
    'cereal_num' => 26600,
    'wood_num' => 26600,
    'iron_num' => 26600,
    'crit' => 0.3
};
get(30)-> #{
    'num' => 70,
    'silver_num' => 13500,
    'cereal_num' => 27000,
    'wood_num' => 27000,
    'iron_num' => 27000,
    'crit' => 0.3
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30].
