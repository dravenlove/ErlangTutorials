%%--- coding:utf-8 ---
-module(tb_hero_star).
-export([get/1,get_list/0]).
get(1000)-> #{
    'type' => 1,
    'star' => 0,
    'cost_num' => 10,
    'money_cost_num' => 50000,
    'reset_cost_num' => 2,
    'reset_reward_num' => 0
};
get(1001)-> #{
    'type' => 1,
    'star' => 1,
    'cost_num' => 10,
    'money_cost_num' => 100000,
    'reset_cost_num' => 4,
    'reset_reward_num' => 10
};
get(1002)-> #{
    'type' => 1,
    'star' => 2,
    'cost_num' => 10,
    'money_cost_num' => 150000,
    'reset_cost_num' => 6,
    'reset_reward_num' => 10
};
get(1003)-> #{
    'type' => 1,
    'star' => 3,
    'cost_num' => 10,
    'money_cost_num' => 200000,
    'reset_cost_num' => 8,
    'reset_reward_num' => 10
};
get(1004)-> #{
    'type' => 1,
    'star' => 4,
    'cost_num' => 10,
    'money_cost_num' => 250000,
    'reset_cost_num' => 10,
    'reset_reward_num' => 10
};
get(1005)-> #{
    'type' => 1,
    'star' => 5,
    'cost_num' => 50,
    'money_cost_num' => 300000,
    'reset_cost_num' => 12,
    'reset_reward_num' => 10
};
get(1006)-> #{
    'type' => 1,
    'star' => 6,
    'cost_num' => 20,
    'money_cost_num' => 500000,
    'reset_cost_num' => 14,
    'reset_reward_num' => 50
};
get(1007)-> #{
    'type' => 1,
    'star' => 7,
    'cost_num' => 20,
    'money_cost_num' => 1000000,
    'reset_cost_num' => 16,
    'reset_reward_num' => 20
};
get(1008)-> #{
    'type' => 1,
    'star' => 8,
    'cost_num' => 20,
    'money_cost_num' => 1500000,
    'reset_cost_num' => 18,
    'reset_reward_num' => 20
};
get(1009)-> #{
    'type' => 1,
    'star' => 9,
    'cost_num' => 20,
    'money_cost_num' => 2000000,
    'reset_cost_num' => 20,
    'reset_reward_num' => 20
};
get(1010)-> #{
    'type' => 1,
    'star' => 10,
    'cost_num' => 20,
    'money_cost_num' => 2500000,
    'reset_cost_num' => 22,
    'reset_reward_num' => 20
};
get(1011)-> #{
    'type' => 1,
    'star' => 11,
    'cost_num' => 100,
    'money_cost_num' => 3000000,
    'reset_cost_num' => 24,
    'reset_reward_num' => 20
};
get(1012)-> #{
    'type' => 1,
    'star' => 12,
    'cost_num' => 40,
    'money_cost_num' => 5000000,
    'reset_cost_num' => 26,
    'reset_reward_num' => 100
};
get(1013)-> #{
    'type' => 1,
    'star' => 13,
    'cost_num' => 50,
    'money_cost_num' => 7000000,
    'reset_cost_num' => 28,
    'reset_reward_num' => 40
};
get(1014)-> #{
    'type' => 1,
    'star' => 14,
    'cost_num' => 60,
    'money_cost_num' => 9000000,
    'reset_cost_num' => 30,
    'reset_reward_num' => 50
};
get(1015)-> #{
    'type' => 1,
    'star' => 15,
    'cost_num' => 70,
    'money_cost_num' => 11000000,
    'reset_cost_num' => 32,
    'reset_reward_num' => 60
};
get(1016)-> #{
    'type' => 1,
    'star' => 16,
    'cost_num' => 80,
    'money_cost_num' => 13000000,
    'reset_cost_num' => 34,
    'reset_reward_num' => 70
};
get(1017)-> #{
    'type' => 1,
    'star' => 17,
    'cost_num' => 200,
    'money_cost_num' => 15000000,
    'reset_cost_num' => 36,
    'reset_reward_num' => 80
};
get(1018)-> #{
    'type' => 1,
    'star' => 18,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 200
};
get(1019)-> #{
    'type' => 1,
    'star' => 19,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(1020)-> #{
    'type' => 1,
    'star' => 20,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(1021)-> #{
    'type' => 1,
    'star' => 21,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(1022)-> #{
    'type' => 1,
    'star' => 22,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(1023)-> #{
    'type' => 1,
    'star' => 23,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(2000)-> #{
    'type' => 2,
    'star' => 0,
    'cost_num' => 10,
    'money_cost_num' => 100000,
    'reset_cost_num' => 40,
    'reset_reward_num' => 0
};
get(2001)-> #{
    'type' => 2,
    'star' => 1,
    'cost_num' => 20,
    'money_cost_num' => 200000,
    'reset_cost_num' => 42,
    'reset_reward_num' => 10
};
get(2002)-> #{
    'type' => 2,
    'star' => 2,
    'cost_num' => 30,
    'money_cost_num' => 300000,
    'reset_cost_num' => 44,
    'reset_reward_num' => 20
};
get(2003)-> #{
    'type' => 2,
    'star' => 3,
    'cost_num' => 40,
    'money_cost_num' => 400000,
    'reset_cost_num' => 46,
    'reset_reward_num' => 30
};
get(2004)-> #{
    'type' => 2,
    'star' => 4,
    'cost_num' => 50,
    'money_cost_num' => 500000,
    'reset_cost_num' => 48,
    'reset_reward_num' => 40
};
get(2005)-> #{
    'type' => 2,
    'star' => 5,
    'need_nobility' => 202071,
    'cost_num' => 100,
    'money_cost_num' => 600000,
    'reset_cost_num' => 50,
    'reset_reward_num' => 50
};
get(2006)-> #{
    'type' => 2,
    'star' => 6,
    'cost_num' => 30,
    'money_cost_num' => 1000000,
    'reset_cost_num' => 52,
    'reset_reward_num' => 100
};
get(2007)-> #{
    'type' => 2,
    'star' => 7,
    'cost_num' => 40,
    'money_cost_num' => 2000000,
    'reset_cost_num' => 54,
    'reset_reward_num' => 30
};
get(2008)-> #{
    'type' => 2,
    'star' => 8,
    'cost_num' => 50,
    'money_cost_num' => 3000000,
    'reset_cost_num' => 56,
    'reset_reward_num' => 40
};
get(2009)-> #{
    'type' => 2,
    'star' => 9,
    'cost_num' => 60,
    'money_cost_num' => 4000000,
    'reset_cost_num' => 58,
    'reset_reward_num' => 50
};
get(2010)-> #{
    'type' => 2,
    'star' => 10,
    'cost_num' => 70,
    'money_cost_num' => 5000000,
    'reset_cost_num' => 60,
    'reset_reward_num' => 60
};
get(2011)-> #{
    'type' => 2,
    'star' => 11,
    'need_nobility' => 205071,
    'cost_num' => 200,
    'money_cost_num' => 6000000,
    'reset_cost_num' => 62,
    'reset_reward_num' => 70
};
get(2012)-> #{
    'type' => 2,
    'star' => 12,
    'cost_num' => 50,
    'money_cost_num' => 10000000,
    'reset_cost_num' => 64,
    'reset_reward_num' => 200
};
get(2013)-> #{
    'type' => 2,
    'star' => 13,
    'cost_num' => 60,
    'money_cost_num' => 14000000,
    'reset_cost_num' => 66,
    'reset_reward_num' => 50
};
get(2014)-> #{
    'type' => 2,
    'star' => 14,
    'cost_num' => 70,
    'money_cost_num' => 18000000,
    'reset_cost_num' => 68,
    'reset_reward_num' => 60
};
get(2015)-> #{
    'type' => 2,
    'star' => 15,
    'cost_num' => 80,
    'money_cost_num' => 22000000,
    'reset_cost_num' => 70,
    'reset_reward_num' => 70
};
get(2016)-> #{
    'type' => 2,
    'star' => 16,
    'cost_num' => 90,
    'money_cost_num' => 26000000,
    'reset_cost_num' => 72,
    'reset_reward_num' => 80
};
get(2017)-> #{
    'type' => 2,
    'star' => 17,
    'need_nobility' => 208071,
    'cost_num' => 400,
    'money_cost_num' => 30000000,
    'reset_cost_num' => 74,
    'reset_reward_num' => 90
};
get(2018)-> #{
    'type' => 2,
    'star' => 18,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 400
};
get(2019)-> #{
    'type' => 2,
    'star' => 19,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(2020)-> #{
    'type' => 2,
    'star' => 20,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(2021)-> #{
    'type' => 2,
    'star' => 21,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(2022)-> #{
    'type' => 2,
    'star' => 22,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};
get(2023)-> #{
    'type' => 2,
    'star' => 23,
    'cost_num' => 0,
    'money_cost_num' => 0,
    'reset_cost_num' => 38,
    'reset_reward_num' => 0
};

get(_N) -> false.
get_list() ->
	[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023].
