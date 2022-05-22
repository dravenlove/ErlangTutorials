%%--- coding:utf-8 ---
-module(tb_hero_skill_level).
-export([get/1,get_list/0]).
get(101101001)-> #{
    'skill_sort_id' => 101101,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101101001
};
get(101101002)-> #{
    'skill_sort_id' => 101101,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101101002
};
get(101101003)-> #{
    'skill_sort_id' => 101101,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101101003
};
get(101101004)-> #{
    'skill_sort_id' => 101101,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101101004
};
get(101101005)-> #{
    'skill_sort_id' => 101101,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101101005
};
get(101101006)-> #{
    'skill_sort_id' => 101101,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101101006
};
get(101101007)-> #{
    'skill_sort_id' => 101101,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101101007
};
get(101101008)-> #{
    'skill_sort_id' => 101101,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101101008
};
get(101101009)-> #{
    'skill_sort_id' => 101101,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101101009
};
get(101101010)-> #{
    'skill_sort_id' => 101101,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101101010
};
get(101101011)-> #{
    'skill_sort_id' => 101101,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101101011
};
get(101101012)-> #{
    'skill_sort_id' => 101101,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101101012
};
get(101101013)-> #{
    'skill_sort_id' => 101101,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101101013
};
get(101101014)-> #{
    'skill_sort_id' => 101101,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101101014
};
get(101101015)-> #{
    'skill_sort_id' => 101101,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101101015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101101016)-> #{
    'skill_sort_id' => 101101,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101101016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101101017)-> #{
    'skill_sort_id' => 101101,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101101017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101101018)-> #{
    'skill_sort_id' => 101101,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101101018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101101019)-> #{
    'skill_sort_id' => 101101,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101101019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101101020)-> #{
    'skill_sort_id' => 101101,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101101020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101101021)-> #{
    'skill_sort_id' => 101101,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101101021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101101022)-> #{
    'skill_sort_id' => 101101,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101101022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101101023)-> #{
    'skill_sort_id' => 101101,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101101023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101101024)-> #{
    'skill_sort_id' => 101101,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101101024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101101025)-> #{
    'skill_sort_id' => 101101,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101101025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101101026)-> #{
    'skill_sort_id' => 101101,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101101026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101101027)-> #{
    'skill_sort_id' => 101101,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101101027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101101028)-> #{
    'skill_sort_id' => 101101,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101101028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101101029)-> #{
    'skill_sort_id' => 101101,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101101029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101101030)-> #{
    'skill_sort_id' => 101101,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101101030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101102001)-> #{
    'skill_sort_id' => 101102,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101102001
};
get(101102002)-> #{
    'skill_sort_id' => 101102,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101102002
};
get(101102003)-> #{
    'skill_sort_id' => 101102,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101102003
};
get(101102004)-> #{
    'skill_sort_id' => 101102,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101102004
};
get(101102005)-> #{
    'skill_sort_id' => 101102,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101102005
};
get(101102006)-> #{
    'skill_sort_id' => 101102,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101102006
};
get(101102007)-> #{
    'skill_sort_id' => 101102,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101102007
};
get(101102008)-> #{
    'skill_sort_id' => 101102,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101102008
};
get(101102009)-> #{
    'skill_sort_id' => 101102,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101102009
};
get(101102010)-> #{
    'skill_sort_id' => 101102,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101102010
};
get(101102011)-> #{
    'skill_sort_id' => 101102,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101102011
};
get(101102012)-> #{
    'skill_sort_id' => 101102,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101102012
};
get(101102013)-> #{
    'skill_sort_id' => 101102,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101102013
};
get(101102014)-> #{
    'skill_sort_id' => 101102,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101102014
};
get(101102015)-> #{
    'skill_sort_id' => 101102,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101102015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101102016)-> #{
    'skill_sort_id' => 101102,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101102016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101102017)-> #{
    'skill_sort_id' => 101102,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101102017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101102018)-> #{
    'skill_sort_id' => 101102,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101102018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101102019)-> #{
    'skill_sort_id' => 101102,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101102019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101102020)-> #{
    'skill_sort_id' => 101102,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101102020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101102021)-> #{
    'skill_sort_id' => 101102,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101102021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101102022)-> #{
    'skill_sort_id' => 101102,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101102022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101102023)-> #{
    'skill_sort_id' => 101102,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101102023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101102024)-> #{
    'skill_sort_id' => 101102,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101102024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101102025)-> #{
    'skill_sort_id' => 101102,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101102025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101102026)-> #{
    'skill_sort_id' => 101102,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101102026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101102027)-> #{
    'skill_sort_id' => 101102,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101102027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101102028)-> #{
    'skill_sort_id' => 101102,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101102028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101102029)-> #{
    'skill_sort_id' => 101102,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101102029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101102030)-> #{
    'skill_sort_id' => 101102,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101102030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101103001)-> #{
    'skill_sort_id' => 101103,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101103001
};
get(101103002)-> #{
    'skill_sort_id' => 101103,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101103002
};
get(101103003)-> #{
    'skill_sort_id' => 101103,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101103003
};
get(101103004)-> #{
    'skill_sort_id' => 101103,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101103004
};
get(101103005)-> #{
    'skill_sort_id' => 101103,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101103005
};
get(101103006)-> #{
    'skill_sort_id' => 101103,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101103006
};
get(101103007)-> #{
    'skill_sort_id' => 101103,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101103007
};
get(101103008)-> #{
    'skill_sort_id' => 101103,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101103008
};
get(101103009)-> #{
    'skill_sort_id' => 101103,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101103009
};
get(101103010)-> #{
    'skill_sort_id' => 101103,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101103010
};
get(101103011)-> #{
    'skill_sort_id' => 101103,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101103011
};
get(101103012)-> #{
    'skill_sort_id' => 101103,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101103012
};
get(101103013)-> #{
    'skill_sort_id' => 101103,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101103013
};
get(101103014)-> #{
    'skill_sort_id' => 101103,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101103014
};
get(101103015)-> #{
    'skill_sort_id' => 101103,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101103015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101103016)-> #{
    'skill_sort_id' => 101103,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101103016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101103017)-> #{
    'skill_sort_id' => 101103,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101103017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101103018)-> #{
    'skill_sort_id' => 101103,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101103018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101103019)-> #{
    'skill_sort_id' => 101103,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101103019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101103020)-> #{
    'skill_sort_id' => 101103,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101103020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101103021)-> #{
    'skill_sort_id' => 101103,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101103021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101103022)-> #{
    'skill_sort_id' => 101103,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101103022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101103023)-> #{
    'skill_sort_id' => 101103,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101103023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101103024)-> #{
    'skill_sort_id' => 101103,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101103024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101103025)-> #{
    'skill_sort_id' => 101103,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101103025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101103026)-> #{
    'skill_sort_id' => 101103,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101103026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101103027)-> #{
    'skill_sort_id' => 101103,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101103027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101103028)-> #{
    'skill_sort_id' => 101103,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101103028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101103029)-> #{
    'skill_sort_id' => 101103,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101103029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101103030)-> #{
    'skill_sort_id' => 101103,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101103030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101104001)-> #{
    'skill_sort_id' => 101104,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101104001
};
get(101104002)-> #{
    'skill_sort_id' => 101104,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101104002
};
get(101104003)-> #{
    'skill_sort_id' => 101104,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101104003
};
get(101104004)-> #{
    'skill_sort_id' => 101104,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101104004
};
get(101104005)-> #{
    'skill_sort_id' => 101104,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101104005
};
get(101104006)-> #{
    'skill_sort_id' => 101104,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101104006
};
get(101104007)-> #{
    'skill_sort_id' => 101104,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101104007
};
get(101104008)-> #{
    'skill_sort_id' => 101104,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101104008
};
get(101104009)-> #{
    'skill_sort_id' => 101104,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101104009
};
get(101104010)-> #{
    'skill_sort_id' => 101104,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101104010
};
get(101104011)-> #{
    'skill_sort_id' => 101104,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101104011
};
get(101104012)-> #{
    'skill_sort_id' => 101104,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101104012
};
get(101104013)-> #{
    'skill_sort_id' => 101104,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101104013
};
get(101104014)-> #{
    'skill_sort_id' => 101104,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101104014
};
get(101104015)-> #{
    'skill_sort_id' => 101104,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101104015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101104016)-> #{
    'skill_sort_id' => 101104,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101104016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101104017)-> #{
    'skill_sort_id' => 101104,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101104017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101104018)-> #{
    'skill_sort_id' => 101104,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101104018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101104019)-> #{
    'skill_sort_id' => 101104,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101104019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101104020)-> #{
    'skill_sort_id' => 101104,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101104020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101104021)-> #{
    'skill_sort_id' => 101104,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101104021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101104022)-> #{
    'skill_sort_id' => 101104,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101104022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101104023)-> #{
    'skill_sort_id' => 101104,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101104023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101104024)-> #{
    'skill_sort_id' => 101104,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101104024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101104025)-> #{
    'skill_sort_id' => 101104,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101104025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101104026)-> #{
    'skill_sort_id' => 101104,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101104026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101104027)-> #{
    'skill_sort_id' => 101104,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101104027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101104028)-> #{
    'skill_sort_id' => 101104,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101104028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101104029)-> #{
    'skill_sort_id' => 101104,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101104029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101104030)-> #{
    'skill_sort_id' => 101104,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101104030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101105001)-> #{
    'skill_sort_id' => 101105,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101105001
};
get(101105002)-> #{
    'skill_sort_id' => 101105,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101105002
};
get(101105003)-> #{
    'skill_sort_id' => 101105,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101105003
};
get(101105004)-> #{
    'skill_sort_id' => 101105,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101105004
};
get(101105005)-> #{
    'skill_sort_id' => 101105,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101105005
};
get(101105006)-> #{
    'skill_sort_id' => 101105,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101105006
};
get(101105007)-> #{
    'skill_sort_id' => 101105,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101105007
};
get(101105008)-> #{
    'skill_sort_id' => 101105,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101105008
};
get(101105009)-> #{
    'skill_sort_id' => 101105,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101105009
};
get(101105010)-> #{
    'skill_sort_id' => 101105,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101105010
};
get(101105011)-> #{
    'skill_sort_id' => 101105,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101105011
};
get(101105012)-> #{
    'skill_sort_id' => 101105,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101105012
};
get(101105013)-> #{
    'skill_sort_id' => 101105,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101105013
};
get(101105014)-> #{
    'skill_sort_id' => 101105,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101105014
};
get(101105015)-> #{
    'skill_sort_id' => 101105,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101105015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101105016)-> #{
    'skill_sort_id' => 101105,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101105016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101105017)-> #{
    'skill_sort_id' => 101105,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101105017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101105018)-> #{
    'skill_sort_id' => 101105,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101105018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101105019)-> #{
    'skill_sort_id' => 101105,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101105019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101105020)-> #{
    'skill_sort_id' => 101105,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101105020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101105021)-> #{
    'skill_sort_id' => 101105,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101105021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101105022)-> #{
    'skill_sort_id' => 101105,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101105022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101105023)-> #{
    'skill_sort_id' => 101105,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101105023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101105024)-> #{
    'skill_sort_id' => 101105,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101105024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101105025)-> #{
    'skill_sort_id' => 101105,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101105025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101105026)-> #{
    'skill_sort_id' => 101105,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101105026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101105027)-> #{
    'skill_sort_id' => 101105,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101105027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101105028)-> #{
    'skill_sort_id' => 101105,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101105028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101105029)-> #{
    'skill_sort_id' => 101105,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101105029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101105030)-> #{
    'skill_sort_id' => 101105,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101105030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101106001)-> #{
    'skill_sort_id' => 101106,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101106001
};
get(101106002)-> #{
    'skill_sort_id' => 101106,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101106002
};
get(101106003)-> #{
    'skill_sort_id' => 101106,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101106003
};
get(101106004)-> #{
    'skill_sort_id' => 101106,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101106004
};
get(101106005)-> #{
    'skill_sort_id' => 101106,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101106005
};
get(101106006)-> #{
    'skill_sort_id' => 101106,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101106006
};
get(101106007)-> #{
    'skill_sort_id' => 101106,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101106007
};
get(101106008)-> #{
    'skill_sort_id' => 101106,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101106008
};
get(101106009)-> #{
    'skill_sort_id' => 101106,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101106009
};
get(101106010)-> #{
    'skill_sort_id' => 101106,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101106010
};
get(101106011)-> #{
    'skill_sort_id' => 101106,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101106011
};
get(101106012)-> #{
    'skill_sort_id' => 101106,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101106012
};
get(101106013)-> #{
    'skill_sort_id' => 101106,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101106013
};
get(101106014)-> #{
    'skill_sort_id' => 101106,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101106014
};
get(101106015)-> #{
    'skill_sort_id' => 101106,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101106015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101106016)-> #{
    'skill_sort_id' => 101106,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101106016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101106017)-> #{
    'skill_sort_id' => 101106,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101106017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101106018)-> #{
    'skill_sort_id' => 101106,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101106018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101106019)-> #{
    'skill_sort_id' => 101106,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101106019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101106020)-> #{
    'skill_sort_id' => 101106,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101106020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101106021)-> #{
    'skill_sort_id' => 101106,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101106021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101106022)-> #{
    'skill_sort_id' => 101106,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101106022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101106023)-> #{
    'skill_sort_id' => 101106,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101106023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101106024)-> #{
    'skill_sort_id' => 101106,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101106024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101106025)-> #{
    'skill_sort_id' => 101106,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101106025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101106026)-> #{
    'skill_sort_id' => 101106,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101106026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101106027)-> #{
    'skill_sort_id' => 101106,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101106027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101106028)-> #{
    'skill_sort_id' => 101106,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101106028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101106029)-> #{
    'skill_sort_id' => 101106,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101106029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101106030)-> #{
    'skill_sort_id' => 101106,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101106030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101107001)-> #{
    'skill_sort_id' => 101107,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101107001
};
get(101107002)-> #{
    'skill_sort_id' => 101107,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101107002
};
get(101107003)-> #{
    'skill_sort_id' => 101107,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101107003
};
get(101107004)-> #{
    'skill_sort_id' => 101107,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101107004
};
get(101107005)-> #{
    'skill_sort_id' => 101107,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101107005
};
get(101107006)-> #{
    'skill_sort_id' => 101107,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101107006
};
get(101107007)-> #{
    'skill_sort_id' => 101107,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101107007
};
get(101107008)-> #{
    'skill_sort_id' => 101107,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101107008
};
get(101107009)-> #{
    'skill_sort_id' => 101107,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101107009
};
get(101107010)-> #{
    'skill_sort_id' => 101107,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101107010
};
get(101107011)-> #{
    'skill_sort_id' => 101107,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101107011
};
get(101107012)-> #{
    'skill_sort_id' => 101107,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101107012
};
get(101107013)-> #{
    'skill_sort_id' => 101107,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101107013
};
get(101107014)-> #{
    'skill_sort_id' => 101107,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101107014
};
get(101107015)-> #{
    'skill_sort_id' => 101107,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101107015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101107016)-> #{
    'skill_sort_id' => 101107,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101107016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101107017)-> #{
    'skill_sort_id' => 101107,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101107017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101107018)-> #{
    'skill_sort_id' => 101107,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101107018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101107019)-> #{
    'skill_sort_id' => 101107,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101107019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101107020)-> #{
    'skill_sort_id' => 101107,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101107020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101107021)-> #{
    'skill_sort_id' => 101107,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101107021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101107022)-> #{
    'skill_sort_id' => 101107,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101107022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101107023)-> #{
    'skill_sort_id' => 101107,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101107023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101107024)-> #{
    'skill_sort_id' => 101107,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101107024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101107025)-> #{
    'skill_sort_id' => 101107,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101107025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101107026)-> #{
    'skill_sort_id' => 101107,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101107026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101107027)-> #{
    'skill_sort_id' => 101107,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101107027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101107028)-> #{
    'skill_sort_id' => 101107,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101107028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101107029)-> #{
    'skill_sort_id' => 101107,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101107029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101107030)-> #{
    'skill_sort_id' => 101107,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101107030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101108001)-> #{
    'skill_sort_id' => 101108,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101108001
};
get(101108002)-> #{
    'skill_sort_id' => 101108,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101108002
};
get(101108003)-> #{
    'skill_sort_id' => 101108,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101108003
};
get(101108004)-> #{
    'skill_sort_id' => 101108,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101108004
};
get(101108005)-> #{
    'skill_sort_id' => 101108,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101108005
};
get(101108006)-> #{
    'skill_sort_id' => 101108,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101108006
};
get(101108007)-> #{
    'skill_sort_id' => 101108,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101108007
};
get(101108008)-> #{
    'skill_sort_id' => 101108,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101108008
};
get(101108009)-> #{
    'skill_sort_id' => 101108,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101108009
};
get(101108010)-> #{
    'skill_sort_id' => 101108,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101108010
};
get(101108011)-> #{
    'skill_sort_id' => 101108,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101108011
};
get(101108012)-> #{
    'skill_sort_id' => 101108,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101108012
};
get(101108013)-> #{
    'skill_sort_id' => 101108,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101108013
};
get(101108014)-> #{
    'skill_sort_id' => 101108,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101108014
};
get(101108015)-> #{
    'skill_sort_id' => 101108,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101108015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101108016)-> #{
    'skill_sort_id' => 101108,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101108016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101108017)-> #{
    'skill_sort_id' => 101108,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101108017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101108018)-> #{
    'skill_sort_id' => 101108,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101108018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101108019)-> #{
    'skill_sort_id' => 101108,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101108019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101108020)-> #{
    'skill_sort_id' => 101108,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101108020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101108021)-> #{
    'skill_sort_id' => 101108,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101108021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101108022)-> #{
    'skill_sort_id' => 101108,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101108022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101108023)-> #{
    'skill_sort_id' => 101108,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101108023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101108024)-> #{
    'skill_sort_id' => 101108,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101108024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101108025)-> #{
    'skill_sort_id' => 101108,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101108025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101108026)-> #{
    'skill_sort_id' => 101108,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101108026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101108027)-> #{
    'skill_sort_id' => 101108,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101108027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101108028)-> #{
    'skill_sort_id' => 101108,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101108028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101108029)-> #{
    'skill_sort_id' => 101108,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101108029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101108030)-> #{
    'skill_sort_id' => 101108,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101108030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101109001)-> #{
    'skill_sort_id' => 101109,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101109001
};
get(101109002)-> #{
    'skill_sort_id' => 101109,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101109002
};
get(101109003)-> #{
    'skill_sort_id' => 101109,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101109003
};
get(101109004)-> #{
    'skill_sort_id' => 101109,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101109004
};
get(101109005)-> #{
    'skill_sort_id' => 101109,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101109005
};
get(101109006)-> #{
    'skill_sort_id' => 101109,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101109006
};
get(101109007)-> #{
    'skill_sort_id' => 101109,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101109007
};
get(101109008)-> #{
    'skill_sort_id' => 101109,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101109008
};
get(101109009)-> #{
    'skill_sort_id' => 101109,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101109009
};
get(101109010)-> #{
    'skill_sort_id' => 101109,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101109010
};
get(101109011)-> #{
    'skill_sort_id' => 101109,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101109011
};
get(101109012)-> #{
    'skill_sort_id' => 101109,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101109012
};
get(101109013)-> #{
    'skill_sort_id' => 101109,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101109013
};
get(101109014)-> #{
    'skill_sort_id' => 101109,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101109014
};
get(101109015)-> #{
    'skill_sort_id' => 101109,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101109015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101109016)-> #{
    'skill_sort_id' => 101109,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101109016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101109017)-> #{
    'skill_sort_id' => 101109,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101109017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101109018)-> #{
    'skill_sort_id' => 101109,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101109018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101109019)-> #{
    'skill_sort_id' => 101109,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101109019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101109020)-> #{
    'skill_sort_id' => 101109,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101109020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101109021)-> #{
    'skill_sort_id' => 101109,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101109021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101109022)-> #{
    'skill_sort_id' => 101109,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101109022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101109023)-> #{
    'skill_sort_id' => 101109,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101109023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101109024)-> #{
    'skill_sort_id' => 101109,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101109024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101109025)-> #{
    'skill_sort_id' => 101109,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101109025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101109026)-> #{
    'skill_sort_id' => 101109,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101109026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101109027)-> #{
    'skill_sort_id' => 101109,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101109027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101109028)-> #{
    'skill_sort_id' => 101109,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101109028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101109029)-> #{
    'skill_sort_id' => 101109,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101109029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101109030)-> #{
    'skill_sort_id' => 101109,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101109030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101110001)-> #{
    'skill_sort_id' => 101110,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101110001
};
get(101110002)-> #{
    'skill_sort_id' => 101110,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101110002
};
get(101110003)-> #{
    'skill_sort_id' => 101110,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101110003
};
get(101110004)-> #{
    'skill_sort_id' => 101110,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101110004
};
get(101110005)-> #{
    'skill_sort_id' => 101110,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101110005
};
get(101110006)-> #{
    'skill_sort_id' => 101110,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101110006
};
get(101110007)-> #{
    'skill_sort_id' => 101110,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101110007
};
get(101110008)-> #{
    'skill_sort_id' => 101110,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101110008
};
get(101110009)-> #{
    'skill_sort_id' => 101110,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101110009
};
get(101110010)-> #{
    'skill_sort_id' => 101110,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101110010
};
get(101110011)-> #{
    'skill_sort_id' => 101110,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101110011
};
get(101110012)-> #{
    'skill_sort_id' => 101110,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101110012
};
get(101110013)-> #{
    'skill_sort_id' => 101110,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101110013
};
get(101110014)-> #{
    'skill_sort_id' => 101110,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101110014
};
get(101110015)-> #{
    'skill_sort_id' => 101110,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101110015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101110016)-> #{
    'skill_sort_id' => 101110,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101110016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101110017)-> #{
    'skill_sort_id' => 101110,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101110017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101110018)-> #{
    'skill_sort_id' => 101110,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101110018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101110019)-> #{
    'skill_sort_id' => 101110,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101110019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101110020)-> #{
    'skill_sort_id' => 101110,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101110020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101110021)-> #{
    'skill_sort_id' => 101110,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101110021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101110022)-> #{
    'skill_sort_id' => 101110,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101110022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101110023)-> #{
    'skill_sort_id' => 101110,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101110023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101110024)-> #{
    'skill_sort_id' => 101110,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101110024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101110025)-> #{
    'skill_sort_id' => 101110,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101110025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101110026)-> #{
    'skill_sort_id' => 101110,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101110026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101110027)-> #{
    'skill_sort_id' => 101110,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101110027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101110028)-> #{
    'skill_sort_id' => 101110,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101110028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101110029)-> #{
    'skill_sort_id' => 101110,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101110029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101110030)-> #{
    'skill_sort_id' => 101110,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101110030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101111001)-> #{
    'skill_sort_id' => 101111,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101111001
};
get(101111002)-> #{
    'skill_sort_id' => 101111,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101111002
};
get(101111003)-> #{
    'skill_sort_id' => 101111,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101111003
};
get(101111004)-> #{
    'skill_sort_id' => 101111,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101111004
};
get(101111005)-> #{
    'skill_sort_id' => 101111,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101111005
};
get(101111006)-> #{
    'skill_sort_id' => 101111,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101111006
};
get(101111007)-> #{
    'skill_sort_id' => 101111,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101111007
};
get(101111008)-> #{
    'skill_sort_id' => 101111,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101111008
};
get(101111009)-> #{
    'skill_sort_id' => 101111,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101111009
};
get(101111010)-> #{
    'skill_sort_id' => 101111,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101111010
};
get(101111011)-> #{
    'skill_sort_id' => 101111,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101111011
};
get(101111012)-> #{
    'skill_sort_id' => 101111,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101111012
};
get(101111013)-> #{
    'skill_sort_id' => 101111,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101111013
};
get(101111014)-> #{
    'skill_sort_id' => 101111,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101111014
};
get(101111015)-> #{
    'skill_sort_id' => 101111,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101111015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101111016)-> #{
    'skill_sort_id' => 101111,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101111016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101111017)-> #{
    'skill_sort_id' => 101111,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101111017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101111018)-> #{
    'skill_sort_id' => 101111,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101111018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101111019)-> #{
    'skill_sort_id' => 101111,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101111019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101111020)-> #{
    'skill_sort_id' => 101111,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101111020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101111021)-> #{
    'skill_sort_id' => 101111,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101111021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101111022)-> #{
    'skill_sort_id' => 101111,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101111022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101111023)-> #{
    'skill_sort_id' => 101111,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101111023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101111024)-> #{
    'skill_sort_id' => 101111,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101111024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101111025)-> #{
    'skill_sort_id' => 101111,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101111025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101111026)-> #{
    'skill_sort_id' => 101111,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101111026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101111027)-> #{
    'skill_sort_id' => 101111,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101111027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101111028)-> #{
    'skill_sort_id' => 101111,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101111028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101111029)-> #{
    'skill_sort_id' => 101111,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101111029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101111030)-> #{
    'skill_sort_id' => 101111,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101111030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101112001)-> #{
    'skill_sort_id' => 101112,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101112001
};
get(101112002)-> #{
    'skill_sort_id' => 101112,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101112002
};
get(101112003)-> #{
    'skill_sort_id' => 101112,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101112003
};
get(101112004)-> #{
    'skill_sort_id' => 101112,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101112004
};
get(101112005)-> #{
    'skill_sort_id' => 101112,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101112005
};
get(101112006)-> #{
    'skill_sort_id' => 101112,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101112006
};
get(101112007)-> #{
    'skill_sort_id' => 101112,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101112007
};
get(101112008)-> #{
    'skill_sort_id' => 101112,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101112008
};
get(101112009)-> #{
    'skill_sort_id' => 101112,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101112009
};
get(101112010)-> #{
    'skill_sort_id' => 101112,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101112010
};
get(101112011)-> #{
    'skill_sort_id' => 101112,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101112011
};
get(101112012)-> #{
    'skill_sort_id' => 101112,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101112012
};
get(101112013)-> #{
    'skill_sort_id' => 101112,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101112013
};
get(101112014)-> #{
    'skill_sort_id' => 101112,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101112014
};
get(101112015)-> #{
    'skill_sort_id' => 101112,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101112015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101112016)-> #{
    'skill_sort_id' => 101112,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101112016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101112017)-> #{
    'skill_sort_id' => 101112,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101112017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101112018)-> #{
    'skill_sort_id' => 101112,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101112018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101112019)-> #{
    'skill_sort_id' => 101112,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101112019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101112020)-> #{
    'skill_sort_id' => 101112,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101112020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101112021)-> #{
    'skill_sort_id' => 101112,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101112021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101112022)-> #{
    'skill_sort_id' => 101112,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101112022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101112023)-> #{
    'skill_sort_id' => 101112,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101112023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101112024)-> #{
    'skill_sort_id' => 101112,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101112024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101112025)-> #{
    'skill_sort_id' => 101112,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101112025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101112026)-> #{
    'skill_sort_id' => 101112,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101112026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101112027)-> #{
    'skill_sort_id' => 101112,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101112027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101112028)-> #{
    'skill_sort_id' => 101112,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101112028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101112029)-> #{
    'skill_sort_id' => 101112,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101112029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101112030)-> #{
    'skill_sort_id' => 101112,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101112030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101113001)-> #{
    'skill_sort_id' => 101113,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101113001
};
get(101113002)-> #{
    'skill_sort_id' => 101113,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101113002
};
get(101113003)-> #{
    'skill_sort_id' => 101113,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101113003
};
get(101113004)-> #{
    'skill_sort_id' => 101113,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101113004
};
get(101113005)-> #{
    'skill_sort_id' => 101113,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101113005
};
get(101113006)-> #{
    'skill_sort_id' => 101113,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101113006
};
get(101113007)-> #{
    'skill_sort_id' => 101113,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101113007
};
get(101113008)-> #{
    'skill_sort_id' => 101113,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101113008
};
get(101113009)-> #{
    'skill_sort_id' => 101113,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101113009
};
get(101113010)-> #{
    'skill_sort_id' => 101113,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101113010
};
get(101113011)-> #{
    'skill_sort_id' => 101113,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101113011
};
get(101113012)-> #{
    'skill_sort_id' => 101113,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101113012
};
get(101113013)-> #{
    'skill_sort_id' => 101113,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101113013
};
get(101113014)-> #{
    'skill_sort_id' => 101113,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101113014
};
get(101113015)-> #{
    'skill_sort_id' => 101113,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101113015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101113016)-> #{
    'skill_sort_id' => 101113,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101113016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101113017)-> #{
    'skill_sort_id' => 101113,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101113017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101113018)-> #{
    'skill_sort_id' => 101113,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101113018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101113019)-> #{
    'skill_sort_id' => 101113,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101113019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101113020)-> #{
    'skill_sort_id' => 101113,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101113020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101113021)-> #{
    'skill_sort_id' => 101113,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101113021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101113022)-> #{
    'skill_sort_id' => 101113,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101113022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101113023)-> #{
    'skill_sort_id' => 101113,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101113023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101113024)-> #{
    'skill_sort_id' => 101113,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101113024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101113025)-> #{
    'skill_sort_id' => 101113,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101113025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101113026)-> #{
    'skill_sort_id' => 101113,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101113026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101113027)-> #{
    'skill_sort_id' => 101113,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101113027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101113028)-> #{
    'skill_sort_id' => 101113,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101113028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101113029)-> #{
    'skill_sort_id' => 101113,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101113029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101113030)-> #{
    'skill_sort_id' => 101113,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101113030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101114001)-> #{
    'skill_sort_id' => 101114,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101114001
};
get(101114002)-> #{
    'skill_sort_id' => 101114,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101114002
};
get(101114003)-> #{
    'skill_sort_id' => 101114,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101114003
};
get(101114004)-> #{
    'skill_sort_id' => 101114,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101114004
};
get(101114005)-> #{
    'skill_sort_id' => 101114,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101114005
};
get(101114006)-> #{
    'skill_sort_id' => 101114,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101114006
};
get(101114007)-> #{
    'skill_sort_id' => 101114,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101114007
};
get(101114008)-> #{
    'skill_sort_id' => 101114,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101114008
};
get(101114009)-> #{
    'skill_sort_id' => 101114,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101114009
};
get(101114010)-> #{
    'skill_sort_id' => 101114,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101114010
};
get(101114011)-> #{
    'skill_sort_id' => 101114,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101114011
};
get(101114012)-> #{
    'skill_sort_id' => 101114,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101114012
};
get(101114013)-> #{
    'skill_sort_id' => 101114,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101114013
};
get(101114014)-> #{
    'skill_sort_id' => 101114,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101114014
};
get(101114015)-> #{
    'skill_sort_id' => 101114,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101114015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101114016)-> #{
    'skill_sort_id' => 101114,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101114016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101114017)-> #{
    'skill_sort_id' => 101114,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101114017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101114018)-> #{
    'skill_sort_id' => 101114,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101114018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101114019)-> #{
    'skill_sort_id' => 101114,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101114019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101114020)-> #{
    'skill_sort_id' => 101114,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101114020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101114021)-> #{
    'skill_sort_id' => 101114,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101114021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101114022)-> #{
    'skill_sort_id' => 101114,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101114022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101114023)-> #{
    'skill_sort_id' => 101114,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101114023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101114024)-> #{
    'skill_sort_id' => 101114,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101114024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101114025)-> #{
    'skill_sort_id' => 101114,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101114025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101114026)-> #{
    'skill_sort_id' => 101114,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101114026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101114027)-> #{
    'skill_sort_id' => 101114,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101114027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101114028)-> #{
    'skill_sort_id' => 101114,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101114028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101114029)-> #{
    'skill_sort_id' => 101114,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101114029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101114030)-> #{
    'skill_sort_id' => 101114,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101114030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101115001)-> #{
    'skill_sort_id' => 101115,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101115001
};
get(101115002)-> #{
    'skill_sort_id' => 101115,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101115002
};
get(101115003)-> #{
    'skill_sort_id' => 101115,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101115003
};
get(101115004)-> #{
    'skill_sort_id' => 101115,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101115004
};
get(101115005)-> #{
    'skill_sort_id' => 101115,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101115005
};
get(101115006)-> #{
    'skill_sort_id' => 101115,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101115006
};
get(101115007)-> #{
    'skill_sort_id' => 101115,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101115007
};
get(101115008)-> #{
    'skill_sort_id' => 101115,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101115008
};
get(101115009)-> #{
    'skill_sort_id' => 101115,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101115009
};
get(101115010)-> #{
    'skill_sort_id' => 101115,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101115010
};
get(101115011)-> #{
    'skill_sort_id' => 101115,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101115011
};
get(101115012)-> #{
    'skill_sort_id' => 101115,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101115012
};
get(101115013)-> #{
    'skill_sort_id' => 101115,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101115013
};
get(101115014)-> #{
    'skill_sort_id' => 101115,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101115014
};
get(101115015)-> #{
    'skill_sort_id' => 101115,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101115015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101115016)-> #{
    'skill_sort_id' => 101115,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101115016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101115017)-> #{
    'skill_sort_id' => 101115,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101115017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101115018)-> #{
    'skill_sort_id' => 101115,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101115018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101115019)-> #{
    'skill_sort_id' => 101115,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101115019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101115020)-> #{
    'skill_sort_id' => 101115,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101115020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101115021)-> #{
    'skill_sort_id' => 101115,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101115021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101115022)-> #{
    'skill_sort_id' => 101115,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101115022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101115023)-> #{
    'skill_sort_id' => 101115,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101115023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101115024)-> #{
    'skill_sort_id' => 101115,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101115024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101115025)-> #{
    'skill_sort_id' => 101115,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101115025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101115026)-> #{
    'skill_sort_id' => 101115,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101115026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101115027)-> #{
    'skill_sort_id' => 101115,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101115027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101115028)-> #{
    'skill_sort_id' => 101115,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101115028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101115029)-> #{
    'skill_sort_id' => 101115,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101115029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101115030)-> #{
    'skill_sort_id' => 101115,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101115030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101116001)-> #{
    'skill_sort_id' => 101116,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101116001
};
get(101116002)-> #{
    'skill_sort_id' => 101116,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101116002
};
get(101116003)-> #{
    'skill_sort_id' => 101116,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101116003
};
get(101116004)-> #{
    'skill_sort_id' => 101116,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101116004
};
get(101116005)-> #{
    'skill_sort_id' => 101116,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101116005
};
get(101116006)-> #{
    'skill_sort_id' => 101116,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101116006
};
get(101116007)-> #{
    'skill_sort_id' => 101116,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101116007
};
get(101116008)-> #{
    'skill_sort_id' => 101116,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101116008
};
get(101116009)-> #{
    'skill_sort_id' => 101116,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101116009
};
get(101116010)-> #{
    'skill_sort_id' => 101116,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101116010
};
get(101116011)-> #{
    'skill_sort_id' => 101116,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101116011
};
get(101116012)-> #{
    'skill_sort_id' => 101116,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101116012
};
get(101116013)-> #{
    'skill_sort_id' => 101116,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101116013
};
get(101116014)-> #{
    'skill_sort_id' => 101116,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101116014
};
get(101116015)-> #{
    'skill_sort_id' => 101116,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101116015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101116016)-> #{
    'skill_sort_id' => 101116,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101116016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101116017)-> #{
    'skill_sort_id' => 101116,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101116017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101116018)-> #{
    'skill_sort_id' => 101116,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101116018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101116019)-> #{
    'skill_sort_id' => 101116,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101116019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101116020)-> #{
    'skill_sort_id' => 101116,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101116020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101116021)-> #{
    'skill_sort_id' => 101116,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101116021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101116022)-> #{
    'skill_sort_id' => 101116,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101116022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101116023)-> #{
    'skill_sort_id' => 101116,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101116023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101116024)-> #{
    'skill_sort_id' => 101116,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101116024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101116025)-> #{
    'skill_sort_id' => 101116,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101116025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101116026)-> #{
    'skill_sort_id' => 101116,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101116026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101116027)-> #{
    'skill_sort_id' => 101116,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101116027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101116028)-> #{
    'skill_sort_id' => 101116,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101116028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101116029)-> #{
    'skill_sort_id' => 101116,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101116029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101116030)-> #{
    'skill_sort_id' => 101116,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101116030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101117001)-> #{
    'skill_sort_id' => 101117,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101117001
};
get(101117002)-> #{
    'skill_sort_id' => 101117,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101117002
};
get(101117003)-> #{
    'skill_sort_id' => 101117,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101117003
};
get(101117004)-> #{
    'skill_sort_id' => 101117,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101117004
};
get(101117005)-> #{
    'skill_sort_id' => 101117,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101117005
};
get(101117006)-> #{
    'skill_sort_id' => 101117,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101117006
};
get(101117007)-> #{
    'skill_sort_id' => 101117,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101117007
};
get(101117008)-> #{
    'skill_sort_id' => 101117,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101117008
};
get(101117009)-> #{
    'skill_sort_id' => 101117,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101117009
};
get(101117010)-> #{
    'skill_sort_id' => 101117,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101117010
};
get(101117011)-> #{
    'skill_sort_id' => 101117,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101117011
};
get(101117012)-> #{
    'skill_sort_id' => 101117,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101117012
};
get(101117013)-> #{
    'skill_sort_id' => 101117,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101117013
};
get(101117014)-> #{
    'skill_sort_id' => 101117,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101117014
};
get(101117015)-> #{
    'skill_sort_id' => 101117,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101117015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101117016)-> #{
    'skill_sort_id' => 101117,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101117016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101117017)-> #{
    'skill_sort_id' => 101117,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101117017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101117018)-> #{
    'skill_sort_id' => 101117,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101117018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101117019)-> #{
    'skill_sort_id' => 101117,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101117019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101117020)-> #{
    'skill_sort_id' => 101117,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101117020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101117021)-> #{
    'skill_sort_id' => 101117,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101117021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101117022)-> #{
    'skill_sort_id' => 101117,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101117022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101117023)-> #{
    'skill_sort_id' => 101117,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101117023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101117024)-> #{
    'skill_sort_id' => 101117,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101117024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101117025)-> #{
    'skill_sort_id' => 101117,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101117025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101117026)-> #{
    'skill_sort_id' => 101117,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101117026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101117027)-> #{
    'skill_sort_id' => 101117,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101117027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101117028)-> #{
    'skill_sort_id' => 101117,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101117028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101117029)-> #{
    'skill_sort_id' => 101117,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101117029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101117030)-> #{
    'skill_sort_id' => 101117,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101117030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101118001)-> #{
    'skill_sort_id' => 101118,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101118001
};
get(101118002)-> #{
    'skill_sort_id' => 101118,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101118002
};
get(101118003)-> #{
    'skill_sort_id' => 101118,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101118003
};
get(101118004)-> #{
    'skill_sort_id' => 101118,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101118004
};
get(101118005)-> #{
    'skill_sort_id' => 101118,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101118005
};
get(101118006)-> #{
    'skill_sort_id' => 101118,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101118006
};
get(101118007)-> #{
    'skill_sort_id' => 101118,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101118007
};
get(101118008)-> #{
    'skill_sort_id' => 101118,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101118008
};
get(101118009)-> #{
    'skill_sort_id' => 101118,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101118009
};
get(101118010)-> #{
    'skill_sort_id' => 101118,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101118010
};
get(101118011)-> #{
    'skill_sort_id' => 101118,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101118011
};
get(101118012)-> #{
    'skill_sort_id' => 101118,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101118012
};
get(101118013)-> #{
    'skill_sort_id' => 101118,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101118013
};
get(101118014)-> #{
    'skill_sort_id' => 101118,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101118014
};
get(101118015)-> #{
    'skill_sort_id' => 101118,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101118015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101118016)-> #{
    'skill_sort_id' => 101118,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101118016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101118017)-> #{
    'skill_sort_id' => 101118,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101118017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101118018)-> #{
    'skill_sort_id' => 101118,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101118018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101118019)-> #{
    'skill_sort_id' => 101118,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101118019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101118020)-> #{
    'skill_sort_id' => 101118,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101118020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101118021)-> #{
    'skill_sort_id' => 101118,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101118021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101118022)-> #{
    'skill_sort_id' => 101118,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101118022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101118023)-> #{
    'skill_sort_id' => 101118,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101118023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101118024)-> #{
    'skill_sort_id' => 101118,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101118024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101118025)-> #{
    'skill_sort_id' => 101118,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101118025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101118026)-> #{
    'skill_sort_id' => 101118,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101118026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101118027)-> #{
    'skill_sort_id' => 101118,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101118027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101118028)-> #{
    'skill_sort_id' => 101118,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101118028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101118029)-> #{
    'skill_sort_id' => 101118,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101118029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101118030)-> #{
    'skill_sort_id' => 101118,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101118030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101119001)-> #{
    'skill_sort_id' => 101119,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101119001
};
get(101119002)-> #{
    'skill_sort_id' => 101119,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101119002
};
get(101119003)-> #{
    'skill_sort_id' => 101119,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101119003
};
get(101119004)-> #{
    'skill_sort_id' => 101119,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101119004
};
get(101119005)-> #{
    'skill_sort_id' => 101119,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101119005
};
get(101119006)-> #{
    'skill_sort_id' => 101119,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101119006
};
get(101119007)-> #{
    'skill_sort_id' => 101119,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101119007
};
get(101119008)-> #{
    'skill_sort_id' => 101119,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101119008
};
get(101119009)-> #{
    'skill_sort_id' => 101119,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101119009
};
get(101119010)-> #{
    'skill_sort_id' => 101119,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101119010
};
get(101119011)-> #{
    'skill_sort_id' => 101119,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101119011
};
get(101119012)-> #{
    'skill_sort_id' => 101119,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101119012
};
get(101119013)-> #{
    'skill_sort_id' => 101119,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101119013
};
get(101119014)-> #{
    'skill_sort_id' => 101119,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101119014
};
get(101119015)-> #{
    'skill_sort_id' => 101119,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101119015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101119016)-> #{
    'skill_sort_id' => 101119,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101119016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101119017)-> #{
    'skill_sort_id' => 101119,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101119017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101119018)-> #{
    'skill_sort_id' => 101119,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101119018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101119019)-> #{
    'skill_sort_id' => 101119,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101119019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101119020)-> #{
    'skill_sort_id' => 101119,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101119020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101119021)-> #{
    'skill_sort_id' => 101119,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101119021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101119022)-> #{
    'skill_sort_id' => 101119,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101119022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101119023)-> #{
    'skill_sort_id' => 101119,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101119023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101119024)-> #{
    'skill_sort_id' => 101119,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101119024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101119025)-> #{
    'skill_sort_id' => 101119,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101119025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101119026)-> #{
    'skill_sort_id' => 101119,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101119026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101119027)-> #{
    'skill_sort_id' => 101119,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101119027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101119028)-> #{
    'skill_sort_id' => 101119,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101119028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101119029)-> #{
    'skill_sort_id' => 101119,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101119029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101119030)-> #{
    'skill_sort_id' => 101119,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101119030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101120001)-> #{
    'skill_sort_id' => 101120,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101120001
};
get(101120002)-> #{
    'skill_sort_id' => 101120,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101120002
};
get(101120003)-> #{
    'skill_sort_id' => 101120,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101120003
};
get(101120004)-> #{
    'skill_sort_id' => 101120,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101120004
};
get(101120005)-> #{
    'skill_sort_id' => 101120,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101120005
};
get(101120006)-> #{
    'skill_sort_id' => 101120,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101120006
};
get(101120007)-> #{
    'skill_sort_id' => 101120,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101120007
};
get(101120008)-> #{
    'skill_sort_id' => 101120,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101120008
};
get(101120009)-> #{
    'skill_sort_id' => 101120,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101120009
};
get(101120010)-> #{
    'skill_sort_id' => 101120,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101120010
};
get(101120011)-> #{
    'skill_sort_id' => 101120,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101120011
};
get(101120012)-> #{
    'skill_sort_id' => 101120,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101120012
};
get(101120013)-> #{
    'skill_sort_id' => 101120,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101120013
};
get(101120014)-> #{
    'skill_sort_id' => 101120,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101120014
};
get(101120015)-> #{
    'skill_sort_id' => 101120,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101120015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101120016)-> #{
    'skill_sort_id' => 101120,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101120016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101120017)-> #{
    'skill_sort_id' => 101120,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101120017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101120018)-> #{
    'skill_sort_id' => 101120,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101120018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101120019)-> #{
    'skill_sort_id' => 101120,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101120019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101120020)-> #{
    'skill_sort_id' => 101120,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101120020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101120021)-> #{
    'skill_sort_id' => 101120,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101120021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101120022)-> #{
    'skill_sort_id' => 101120,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101120022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101120023)-> #{
    'skill_sort_id' => 101120,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101120023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101120024)-> #{
    'skill_sort_id' => 101120,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101120024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101120025)-> #{
    'skill_sort_id' => 101120,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101120025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101120026)-> #{
    'skill_sort_id' => 101120,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101120026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101120027)-> #{
    'skill_sort_id' => 101120,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101120027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101120028)-> #{
    'skill_sort_id' => 101120,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101120028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101120029)-> #{
    'skill_sort_id' => 101120,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101120029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101120030)-> #{
    'skill_sort_id' => 101120,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101120030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101121001)-> #{
    'skill_sort_id' => 101121,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101121001
};
get(101121002)-> #{
    'skill_sort_id' => 101121,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101121002
};
get(101121003)-> #{
    'skill_sort_id' => 101121,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101121003
};
get(101121004)-> #{
    'skill_sort_id' => 101121,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101121004
};
get(101121005)-> #{
    'skill_sort_id' => 101121,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101121005
};
get(101121006)-> #{
    'skill_sort_id' => 101121,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101121006
};
get(101121007)-> #{
    'skill_sort_id' => 101121,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101121007
};
get(101121008)-> #{
    'skill_sort_id' => 101121,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101121008
};
get(101121009)-> #{
    'skill_sort_id' => 101121,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101121009
};
get(101121010)-> #{
    'skill_sort_id' => 101121,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101121010
};
get(101121011)-> #{
    'skill_sort_id' => 101121,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101121011
};
get(101121012)-> #{
    'skill_sort_id' => 101121,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101121012
};
get(101121013)-> #{
    'skill_sort_id' => 101121,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101121013
};
get(101121014)-> #{
    'skill_sort_id' => 101121,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101121014
};
get(101121015)-> #{
    'skill_sort_id' => 101121,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101121015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101121016)-> #{
    'skill_sort_id' => 101121,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101121016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101121017)-> #{
    'skill_sort_id' => 101121,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101121017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101121018)-> #{
    'skill_sort_id' => 101121,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101121018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101121019)-> #{
    'skill_sort_id' => 101121,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101121019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101121020)-> #{
    'skill_sort_id' => 101121,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101121020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101121021)-> #{
    'skill_sort_id' => 101121,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101121021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101121022)-> #{
    'skill_sort_id' => 101121,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101121022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101121023)-> #{
    'skill_sort_id' => 101121,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101121023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101121024)-> #{
    'skill_sort_id' => 101121,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101121024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101121025)-> #{
    'skill_sort_id' => 101121,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101121025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101121026)-> #{
    'skill_sort_id' => 101121,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101121026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101121027)-> #{
    'skill_sort_id' => 101121,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101121027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101121028)-> #{
    'skill_sort_id' => 101121,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101121028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101121029)-> #{
    'skill_sort_id' => 101121,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101121029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101121030)-> #{
    'skill_sort_id' => 101121,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101121030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(101122001)-> #{
    'skill_sort_id' => 101122,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101122001
};
get(101122002)-> #{
    'skill_sort_id' => 101122,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101122002
};
get(101122003)-> #{
    'skill_sort_id' => 101122,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101122003
};
get(101122004)-> #{
    'skill_sort_id' => 101122,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101122004
};
get(101122005)-> #{
    'skill_sort_id' => 101122,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101122005
};
get(101122006)-> #{
    'skill_sort_id' => 101122,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101122006
};
get(101122007)-> #{
    'skill_sort_id' => 101122,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101122007
};
get(101122008)-> #{
    'skill_sort_id' => 101122,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101122008
};
get(101122009)-> #{
    'skill_sort_id' => 101122,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101122009
};
get(101122010)-> #{
    'skill_sort_id' => 101122,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101122010
};
get(101122011)-> #{
    'skill_sort_id' => 101122,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101122011
};
get(101122012)-> #{
    'skill_sort_id' => 101122,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101122012
};
get(101122013)-> #{
    'skill_sort_id' => 101122,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101122013
};
get(101122014)-> #{
    'skill_sort_id' => 101122,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101122014
};
get(101122015)-> #{
    'skill_sort_id' => 101122,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101122015,
    'bingzhong_base_troops_rate' => 0.05
};
get(101122016)-> #{
    'skill_sort_id' => 101122,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101122016,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.05
};
get(101122017)-> #{
    'skill_sort_id' => 101122,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101122017,
    'bingzhong_base_defence_rate' => 0.04,
    'bingzhong_base_troops_rate' => 0.12
};
get(101122018)-> #{
    'skill_sort_id' => 101122,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101122018,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.12
};
get(101122019)-> #{
    'skill_sort_id' => 101122,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101122019,
    'bingzhong_base_defence_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.21
};
get(101122020)-> #{
    'skill_sort_id' => 101122,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101122020,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.21
};
get(101122021)-> #{
    'skill_sort_id' => 101122,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101122021,
    'bingzhong_base_defence_rate' => 0.18,
    'bingzhong_base_troops_rate' => 0.32
};
get(101122022)-> #{
    'skill_sort_id' => 101122,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101122022,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.32
};
get(101122023)-> #{
    'skill_sort_id' => 101122,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101122023,
    'bingzhong_base_defence_rate' => 0.28,
    'bingzhong_base_troops_rate' => 0.45
};
get(101122024)-> #{
    'skill_sort_id' => 101122,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101122024,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.45
};
get(101122025)-> #{
    'skill_sort_id' => 101122,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101122025,
    'bingzhong_base_defence_rate' => 0.4,
    'bingzhong_base_troops_rate' => 0.6
};
get(101122026)-> #{
    'skill_sort_id' => 101122,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101122026,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.6
};
get(101122027)-> #{
    'skill_sort_id' => 101122,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101122027,
    'bingzhong_base_defence_rate' => 0.5,
    'bingzhong_base_troops_rate' => 0.7
};
get(101122028)-> #{
    'skill_sort_id' => 101122,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101122028,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.7
};
get(101122029)-> #{
    'skill_sort_id' => 101122,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101122029,
    'bingzhong_base_defence_rate' => 0.6,
    'bingzhong_base_troops_rate' => 0.8
};
get(101122030)-> #{
    'skill_sort_id' => 101122,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101122030,
    'bingzhong_base_defence_rate' => 0.7,
    'bingzhong_base_troops_rate' => 0.8
};
get(201201001)-> #{
    'skill_sort_id' => 201201,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201201001
};
get(201201002)-> #{
    'skill_sort_id' => 201201,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201201002
};
get(201201003)-> #{
    'skill_sort_id' => 201201,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201201003
};
get(201201004)-> #{
    'skill_sort_id' => 201201,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201201004
};
get(201201005)-> #{
    'skill_sort_id' => 201201,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201201005
};
get(201201006)-> #{
    'skill_sort_id' => 201201,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201201006
};
get(201201007)-> #{
    'skill_sort_id' => 201201,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201201007
};
get(201201008)-> #{
    'skill_sort_id' => 201201,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201201008
};
get(201201009)-> #{
    'skill_sort_id' => 201201,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201201009
};
get(201201010)-> #{
    'skill_sort_id' => 201201,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201201010,
    'bubing_base_defence' => 20.0
};
get(201201011)-> #{
    'skill_sort_id' => 201201,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201201011,
    'bubing_base_defence' => 20.0
};
get(201201012)-> #{
    'skill_sort_id' => 201201,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201201012,
    'bubing_base_defence' => 20.0
};
get(201201013)-> #{
    'skill_sort_id' => 201201,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201201013,
    'bubing_base_defence' => 20.0
};
get(201201014)-> #{
    'skill_sort_id' => 201201,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201201014,
    'bubing_base_defence' => 20.0
};
get(201201015)-> #{
    'skill_sort_id' => 201201,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201201015,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.05
};
get(201201016)-> #{
    'skill_sort_id' => 201201,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201201016,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(201201017)-> #{
    'skill_sort_id' => 201201,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201201017,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(201201018)-> #{
    'skill_sort_id' => 201201,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201201018,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(201201019)-> #{
    'skill_sort_id' => 201201,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201201019,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(201201020)-> #{
    'skill_sort_id' => 201201,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201201020,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(201201021)-> #{
    'skill_sort_id' => 201201,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201201021,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(201201022)-> #{
    'skill_sort_id' => 201201,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201201022,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(201201023)-> #{
    'skill_sort_id' => 201201,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201201023,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(201201024)-> #{
    'skill_sort_id' => 201201,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201201024,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(201201025)-> #{
    'skill_sort_id' => 201201,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201201025,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(201201026)-> #{
    'skill_sort_id' => 201201,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201201026,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(201201027)-> #{
    'skill_sort_id' => 201201,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201201027,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(201201028)-> #{
    'skill_sort_id' => 201201,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201201028,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(201201029)-> #{
    'skill_sort_id' => 201201,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201201029,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(201201030)-> #{
    'skill_sort_id' => 201201,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201201030,
    'bubing_base_defence' => 20.0,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(101201001)-> #{
    'skill_sort_id' => 101201,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101201001
};
get(101201002)-> #{
    'skill_sort_id' => 101201,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101201002
};
get(101201003)-> #{
    'skill_sort_id' => 101201,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101201003
};
get(101201004)-> #{
    'skill_sort_id' => 101201,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101201004
};
get(101201005)-> #{
    'skill_sort_id' => 101201,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101201005
};
get(101201006)-> #{
    'skill_sort_id' => 101201,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101201006
};
get(101201007)-> #{
    'skill_sort_id' => 101201,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101201007
};
get(101201008)-> #{
    'skill_sort_id' => 101201,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101201008
};
get(101201009)-> #{
    'skill_sort_id' => 101201,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101201009
};
get(101201010)-> #{
    'skill_sort_id' => 101201,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101201010,
    'bubing_base_attack' => 50.0
};
get(101201011)-> #{
    'skill_sort_id' => 101201,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101201011,
    'bubing_base_attack' => 50.0
};
get(101201012)-> #{
    'skill_sort_id' => 101201,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101201012,
    'bubing_base_attack' => 50.0
};
get(101201013)-> #{
    'skill_sort_id' => 101201,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101201013,
    'bubing_base_attack' => 50.0
};
get(101201014)-> #{
    'skill_sort_id' => 101201,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101201014,
    'bubing_base_attack' => 50.0
};
get(101201015)-> #{
    'skill_sort_id' => 101201,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101201015,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.05
};
get(101201016)-> #{
    'skill_sort_id' => 101201,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101201016,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(101201017)-> #{
    'skill_sort_id' => 101201,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101201017,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(101201018)-> #{
    'skill_sort_id' => 101201,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101201018,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(101201019)-> #{
    'skill_sort_id' => 101201,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101201019,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(101201020)-> #{
    'skill_sort_id' => 101201,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101201020,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(101201021)-> #{
    'skill_sort_id' => 101201,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101201021,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(101201022)-> #{
    'skill_sort_id' => 101201,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101201022,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(101201023)-> #{
    'skill_sort_id' => 101201,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101201023,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(101201024)-> #{
    'skill_sort_id' => 101201,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101201024,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(101201025)-> #{
    'skill_sort_id' => 101201,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101201025,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(101201026)-> #{
    'skill_sort_id' => 101201,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101201026,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(101201027)-> #{
    'skill_sort_id' => 101201,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101201027,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(101201028)-> #{
    'skill_sort_id' => 101201,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101201028,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(101201029)-> #{
    'skill_sort_id' => 101201,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101201029,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(101201030)-> #{
    'skill_sort_id' => 101201,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101201030,
    'bubing_base_attack' => 50.0,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(201202001)-> #{
    'skill_sort_id' => 201202,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201202001
};
get(201202002)-> #{
    'skill_sort_id' => 201202,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201202002
};
get(201202003)-> #{
    'skill_sort_id' => 201202,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201202003
};
get(201202004)-> #{
    'skill_sort_id' => 201202,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201202004
};
get(201202005)-> #{
    'skill_sort_id' => 201202,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201202005
};
get(201202006)-> #{
    'skill_sort_id' => 201202,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201202006
};
get(201202007)-> #{
    'skill_sort_id' => 201202,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201202007
};
get(201202008)-> #{
    'skill_sort_id' => 201202,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201202008
};
get(201202009)-> #{
    'skill_sort_id' => 201202,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201202009
};
get(201202010)-> #{
    'skill_sort_id' => 201202,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201202010
};
get(201202011)-> #{
    'skill_sort_id' => 201202,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201202011
};
get(201202012)-> #{
    'skill_sort_id' => 201202,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201202012
};
get(201202013)-> #{
    'skill_sort_id' => 201202,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201202013,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0
};
get(201202014)-> #{
    'skill_sort_id' => 201202,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201202014,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0
};
get(201202015)-> #{
    'skill_sort_id' => 201202,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201202015,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.05
};
get(201202016)-> #{
    'skill_sort_id' => 201202,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201202016,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(201202017)-> #{
    'skill_sort_id' => 201202,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201202017,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(201202018)-> #{
    'skill_sort_id' => 201202,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201202018,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(201202019)-> #{
    'skill_sort_id' => 201202,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201202019,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(201202020)-> #{
    'skill_sort_id' => 201202,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201202020,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(201202021)-> #{
    'skill_sort_id' => 201202,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201202021,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(201202022)-> #{
    'skill_sort_id' => 201202,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201202022,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(201202023)-> #{
    'skill_sort_id' => 201202,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201202023,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(201202024)-> #{
    'skill_sort_id' => 201202,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201202024,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(201202025)-> #{
    'skill_sort_id' => 201202,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201202025,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(201202026)-> #{
    'skill_sort_id' => 201202,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201202026,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(201202027)-> #{
    'skill_sort_id' => 201202,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201202027,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(201202028)-> #{
    'skill_sort_id' => 201202,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201202028,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(201202029)-> #{
    'skill_sort_id' => 201202,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201202029,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(201202030)-> #{
    'skill_sort_id' => 201202,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201202030,
    'bubing_speed' => 10.0,
    'bubing_troops' => 50.0,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(101202001)-> #{
    'skill_sort_id' => 101202,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101202001
};
get(101202002)-> #{
    'skill_sort_id' => 101202,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101202002
};
get(101202003)-> #{
    'skill_sort_id' => 101202,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101202003
};
get(101202004)-> #{
    'skill_sort_id' => 101202,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101202004
};
get(101202005)-> #{
    'skill_sort_id' => 101202,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101202005
};
get(101202006)-> #{
    'skill_sort_id' => 101202,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101202006
};
get(101202007)-> #{
    'skill_sort_id' => 101202,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101202007
};
get(101202008)-> #{
    'skill_sort_id' => 101202,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101202008
};
get(101202009)-> #{
    'skill_sort_id' => 101202,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101202009
};
get(101202010)-> #{
    'skill_sort_id' => 101202,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101202010
};
get(101202011)-> #{
    'skill_sort_id' => 101202,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101202011
};
get(101202012)-> #{
    'skill_sort_id' => 101202,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101202012
};
get(101202013)-> #{
    'skill_sort_id' => 101202,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101202013
};
get(101202014)-> #{
    'skill_sort_id' => 101202,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101202014
};
get(101202015)-> #{
    'skill_sort_id' => 101202,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101202015,
    'bubing_base_attack_rate' => 0.05
};
get(101202016)-> #{
    'skill_sort_id' => 101202,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101202016,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(101202017)-> #{
    'skill_sort_id' => 101202,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101202017,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(101202018)-> #{
    'skill_sort_id' => 101202,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101202018,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(101202019)-> #{
    'skill_sort_id' => 101202,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101202019,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(101202020)-> #{
    'skill_sort_id' => 101202,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101202020,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(101202021)-> #{
    'skill_sort_id' => 101202,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101202021,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(101202022)-> #{
    'skill_sort_id' => 101202,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101202022,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(101202023)-> #{
    'skill_sort_id' => 101202,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101202023,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(101202024)-> #{
    'skill_sort_id' => 101202,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101202024,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(101202025)-> #{
    'skill_sort_id' => 101202,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101202025,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(101202026)-> #{
    'skill_sort_id' => 101202,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101202026,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(101202027)-> #{
    'skill_sort_id' => 101202,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101202027,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(101202028)-> #{
    'skill_sort_id' => 101202,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101202028,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(101202029)-> #{
    'skill_sort_id' => 101202,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101202029,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(101202030)-> #{
    'skill_sort_id' => 101202,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101202030,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(201203001)-> #{
    'skill_sort_id' => 201203,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201203001
};
get(201203002)-> #{
    'skill_sort_id' => 201203,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201203002
};
get(201203003)-> #{
    'skill_sort_id' => 201203,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201203003
};
get(201203004)-> #{
    'skill_sort_id' => 201203,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201203004
};
get(201203005)-> #{
    'skill_sort_id' => 201203,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201203005
};
get(201203006)-> #{
    'skill_sort_id' => 201203,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201203006
};
get(201203007)-> #{
    'skill_sort_id' => 201203,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201203007
};
get(201203008)-> #{
    'skill_sort_id' => 201203,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201203008
};
get(201203009)-> #{
    'skill_sort_id' => 201203,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201203009
};
get(201203010)-> #{
    'skill_sort_id' => 201203,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201203010
};
get(201203011)-> #{
    'skill_sort_id' => 201203,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201203011
};
get(201203012)-> #{
    'skill_sort_id' => 201203,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201203012
};
get(201203013)-> #{
    'skill_sort_id' => 201203,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201203013
};
get(201203014)-> #{
    'skill_sort_id' => 201203,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201203014
};
get(201203015)-> #{
    'skill_sort_id' => 201203,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201203015,
    'bubing_base_attack_rate' => 0.05
};
get(201203016)-> #{
    'skill_sort_id' => 201203,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201203016,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(201203017)-> #{
    'skill_sort_id' => 201203,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201203017,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(201203018)-> #{
    'skill_sort_id' => 201203,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201203018,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(201203019)-> #{
    'skill_sort_id' => 201203,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201203019,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(201203020)-> #{
    'skill_sort_id' => 201203,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201203020,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(201203021)-> #{
    'skill_sort_id' => 201203,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201203021,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(201203022)-> #{
    'skill_sort_id' => 201203,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201203022,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(201203023)-> #{
    'skill_sort_id' => 201203,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201203023,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(201203024)-> #{
    'skill_sort_id' => 201203,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201203024,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(201203025)-> #{
    'skill_sort_id' => 201203,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201203025,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(201203026)-> #{
    'skill_sort_id' => 201203,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201203026,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(201203027)-> #{
    'skill_sort_id' => 201203,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201203027,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(201203028)-> #{
    'skill_sort_id' => 201203,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201203028,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(201203029)-> #{
    'skill_sort_id' => 201203,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201203029,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(201203030)-> #{
    'skill_sort_id' => 201203,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201203030,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(201204001)-> #{
    'skill_sort_id' => 201204,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201204001
};
get(201204002)-> #{
    'skill_sort_id' => 201204,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201204002
};
get(201204003)-> #{
    'skill_sort_id' => 201204,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201204003
};
get(201204004)-> #{
    'skill_sort_id' => 201204,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201204004
};
get(201204005)-> #{
    'skill_sort_id' => 201204,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201204005
};
get(201204006)-> #{
    'skill_sort_id' => 201204,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201204006
};
get(201204007)-> #{
    'skill_sort_id' => 201204,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201204007
};
get(201204008)-> #{
    'skill_sort_id' => 201204,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201204008
};
get(201204009)-> #{
    'skill_sort_id' => 201204,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201204009
};
get(201204010)-> #{
    'skill_sort_id' => 201204,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201204010
};
get(201204011)-> #{
    'skill_sort_id' => 201204,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201204011
};
get(201204012)-> #{
    'skill_sort_id' => 201204,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201204012
};
get(201204013)-> #{
    'skill_sort_id' => 201204,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201204013
};
get(201204014)-> #{
    'skill_sort_id' => 201204,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201204014
};
get(201204015)-> #{
    'skill_sort_id' => 201204,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201204015,
    'bubing_base_attack_rate' => 0.05
};
get(201204016)-> #{
    'skill_sort_id' => 201204,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201204016,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(201204017)-> #{
    'skill_sort_id' => 201204,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201204017,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(201204018)-> #{
    'skill_sort_id' => 201204,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201204018,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(201204019)-> #{
    'skill_sort_id' => 201204,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201204019,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(201204020)-> #{
    'skill_sort_id' => 201204,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201204020,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(201204021)-> #{
    'skill_sort_id' => 201204,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201204021,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(201204022)-> #{
    'skill_sort_id' => 201204,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201204022,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(201204023)-> #{
    'skill_sort_id' => 201204,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201204023,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(201204024)-> #{
    'skill_sort_id' => 201204,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201204024,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(201204025)-> #{
    'skill_sort_id' => 201204,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201204025,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(201204026)-> #{
    'skill_sort_id' => 201204,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201204026,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(201204027)-> #{
    'skill_sort_id' => 201204,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201204027,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(201204028)-> #{
    'skill_sort_id' => 201204,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201204028,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(201204029)-> #{
    'skill_sort_id' => 201204,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201204029,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(201204030)-> #{
    'skill_sort_id' => 201204,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201204030,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(101203001)-> #{
    'skill_sort_id' => 101203,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101203001
};
get(101203002)-> #{
    'skill_sort_id' => 101203,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101203002
};
get(101203003)-> #{
    'skill_sort_id' => 101203,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101203003
};
get(101203004)-> #{
    'skill_sort_id' => 101203,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101203004
};
get(101203005)-> #{
    'skill_sort_id' => 101203,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101203005
};
get(101203006)-> #{
    'skill_sort_id' => 101203,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101203006
};
get(101203007)-> #{
    'skill_sort_id' => 101203,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101203007
};
get(101203008)-> #{
    'skill_sort_id' => 101203,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101203008
};
get(101203009)-> #{
    'skill_sort_id' => 101203,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101203009
};
get(101203010)-> #{
    'skill_sort_id' => 101203,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101203010
};
get(101203011)-> #{
    'skill_sort_id' => 101203,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101203011
};
get(101203012)-> #{
    'skill_sort_id' => 101203,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101203012
};
get(101203013)-> #{
    'skill_sort_id' => 101203,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101203013
};
get(101203014)-> #{
    'skill_sort_id' => 101203,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101203014
};
get(101203015)-> #{
    'skill_sort_id' => 101203,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101203015,
    'bubing_base_attack_rate' => 0.05
};
get(101203016)-> #{
    'skill_sort_id' => 101203,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101203016,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(101203017)-> #{
    'skill_sort_id' => 101203,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101203017,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(101203018)-> #{
    'skill_sort_id' => 101203,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101203018,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(101203019)-> #{
    'skill_sort_id' => 101203,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101203019,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(101203020)-> #{
    'skill_sort_id' => 101203,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101203020,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(101203021)-> #{
    'skill_sort_id' => 101203,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101203021,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(101203022)-> #{
    'skill_sort_id' => 101203,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101203022,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(101203023)-> #{
    'skill_sort_id' => 101203,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101203023,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(101203024)-> #{
    'skill_sort_id' => 101203,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101203024,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(101203025)-> #{
    'skill_sort_id' => 101203,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101203025,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(101203026)-> #{
    'skill_sort_id' => 101203,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101203026,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(101203027)-> #{
    'skill_sort_id' => 101203,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101203027,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(101203028)-> #{
    'skill_sort_id' => 101203,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101203028,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(101203029)-> #{
    'skill_sort_id' => 101203,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101203029,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(101203030)-> #{
    'skill_sort_id' => 101203,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101203030,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(201205001)-> #{
    'skill_sort_id' => 201205,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201205001
};
get(201205002)-> #{
    'skill_sort_id' => 201205,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201205002
};
get(201205003)-> #{
    'skill_sort_id' => 201205,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201205003
};
get(201205004)-> #{
    'skill_sort_id' => 201205,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201205004
};
get(201205005)-> #{
    'skill_sort_id' => 201205,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201205005
};
get(201205006)-> #{
    'skill_sort_id' => 201205,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201205006
};
get(201205007)-> #{
    'skill_sort_id' => 201205,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201205007
};
get(201205008)-> #{
    'skill_sort_id' => 201205,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201205008
};
get(201205009)-> #{
    'skill_sort_id' => 201205,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201205009
};
get(201205010)-> #{
    'skill_sort_id' => 201205,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201205010
};
get(201205011)-> #{
    'skill_sort_id' => 201205,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201205011
};
get(201205012)-> #{
    'skill_sort_id' => 201205,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201205012
};
get(201205013)-> #{
    'skill_sort_id' => 201205,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201205013
};
get(201205014)-> #{
    'skill_sort_id' => 201205,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201205014
};
get(201205015)-> #{
    'skill_sort_id' => 201205,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201205015,
    'bubing_base_attack_rate' => 0.05
};
get(201205016)-> #{
    'skill_sort_id' => 201205,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201205016,
    'bubing_base_attack_rate' => 0.05,
    'bubing_base_defence_rate' => 0.04
};
get(201205017)-> #{
    'skill_sort_id' => 201205,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201205017,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.04
};
get(201205018)-> #{
    'skill_sort_id' => 201205,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201205018,
    'bubing_base_attack_rate' => 0.12,
    'bubing_base_defence_rate' => 0.1
};
get(201205019)-> #{
    'skill_sort_id' => 201205,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201205019,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.1
};
get(201205020)-> #{
    'skill_sort_id' => 201205,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201205020,
    'bubing_base_attack_rate' => 0.21,
    'bubing_base_defence_rate' => 0.18
};
get(201205021)-> #{
    'skill_sort_id' => 201205,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201205021,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.18
};
get(201205022)-> #{
    'skill_sort_id' => 201205,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201205022,
    'bubing_base_attack_rate' => 0.32,
    'bubing_base_defence_rate' => 0.28
};
get(201205023)-> #{
    'skill_sort_id' => 201205,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201205023,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.28
};
get(201205024)-> #{
    'skill_sort_id' => 201205,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201205024,
    'bubing_base_attack_rate' => 0.45,
    'bubing_base_defence_rate' => 0.4
};
get(201205025)-> #{
    'skill_sort_id' => 201205,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201205025,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.4
};
get(201205026)-> #{
    'skill_sort_id' => 201205,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201205026,
    'bubing_base_attack_rate' => 0.6,
    'bubing_base_defence_rate' => 0.5
};
get(201205027)-> #{
    'skill_sort_id' => 201205,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201205027,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.5
};
get(201205028)-> #{
    'skill_sort_id' => 201205,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201205028,
    'bubing_base_attack_rate' => 0.7,
    'bubing_base_defence_rate' => 0.6
};
get(201205029)-> #{
    'skill_sort_id' => 201205,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201205029,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.6
};
get(201205030)-> #{
    'skill_sort_id' => 201205,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201205030,
    'bubing_base_attack_rate' => 0.8,
    'bubing_base_defence_rate' => 0.7
};
get(101301001)-> #{
    'skill_sort_id' => 101301,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 5000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101301001
};
get(101301002)-> #{
    'skill_sort_id' => 101301,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101301002
};
get(101301003)-> #{
    'skill_sort_id' => 101301,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 15000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101301003
};
get(101301004)-> #{
    'skill_sort_id' => 101301,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 20000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101301004
};
get(101301005)-> #{
    'skill_sort_id' => 101301,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 25000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101301005
};
get(101301006)-> #{
    'skill_sort_id' => 101301,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 30000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101301006
};
get(101301007)-> #{
    'skill_sort_id' => 101301,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 35000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101301007
};
get(101301008)-> #{
    'skill_sort_id' => 101301,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 40000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101301008
};
get(101301009)-> #{
    'skill_sort_id' => 101301,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 45000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101301009
};
get(101301010)-> #{
    'skill_sort_id' => 101301,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 50000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101301010
};
get(101301011)-> #{
    'skill_sort_id' => 101301,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 55000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101301011
};
get(101301012)-> #{
    'skill_sort_id' => 101301,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 60000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101301012
};
get(101301013)-> #{
    'skill_sort_id' => 101301,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 65000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101301013,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0
};
get(101301014)-> #{
    'skill_sort_id' => 101301,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 70000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101301014,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0
};
get(101301015)-> #{
    'skill_sort_id' => 101301,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 75000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101301015,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.05
};
get(101301016)-> #{
    'skill_sort_id' => 101301,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 80000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101301016,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(101301017)-> #{
    'skill_sort_id' => 101301,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 85000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101301017,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(101301018)-> #{
    'skill_sort_id' => 101301,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 90000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101301018,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(101301019)-> #{
    'skill_sort_id' => 101301,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 95000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101301019,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(101301020)-> #{
    'skill_sort_id' => 101301,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 100000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101301020,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(101301021)-> #{
    'skill_sort_id' => 101301,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 150000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101301021,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(101301022)-> #{
    'skill_sort_id' => 101301,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 200000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101301022,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(101301023)-> #{
    'skill_sort_id' => 101301,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 250000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101301023,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(101301024)-> #{
    'skill_sort_id' => 101301,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 300000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101301024,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(101301025)-> #{
    'skill_sort_id' => 101301,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 350000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101301025,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(101301026)-> #{
    'skill_sort_id' => 101301,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 450000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101301026,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(101301027)-> #{
    'skill_sort_id' => 101301,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 550000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101301027,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(101301028)-> #{
    'skill_sort_id' => 101301,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 650000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101301028,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(101301029)-> #{
    'skill_sort_id' => 101301,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 750000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101301029,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(101301030)-> #{
    'skill_sort_id' => 101301,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 850000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101301030,
    'qibing_speed' => 10.0,
    'qibing_troops' => 50.0,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(101302001)-> #{
    'skill_sort_id' => 101302,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101302001
};
get(101302002)-> #{
    'skill_sort_id' => 101302,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101302002
};
get(101302003)-> #{
    'skill_sort_id' => 101302,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101302003
};
get(101302004)-> #{
    'skill_sort_id' => 101302,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101302004
};
get(101302005)-> #{
    'skill_sort_id' => 101302,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101302005
};
get(101302006)-> #{
    'skill_sort_id' => 101302,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101302006
};
get(101302007)-> #{
    'skill_sort_id' => 101302,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101302007
};
get(101302008)-> #{
    'skill_sort_id' => 101302,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101302008
};
get(101302009)-> #{
    'skill_sort_id' => 101302,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101302009
};
get(101302010)-> #{
    'skill_sort_id' => 101302,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101302010
};
get(101302011)-> #{
    'skill_sort_id' => 101302,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101302011
};
get(101302012)-> #{
    'skill_sort_id' => 101302,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101302012
};
get(101302013)-> #{
    'skill_sort_id' => 101302,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101302013
};
get(101302014)-> #{
    'skill_sort_id' => 101302,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101302014
};
get(101302015)-> #{
    'skill_sort_id' => 101302,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101302015,
    'qibing_base_attack_rate' => 0.05
};
get(101302016)-> #{
    'skill_sort_id' => 101302,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101302016,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(101302017)-> #{
    'skill_sort_id' => 101302,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101302017,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(101302018)-> #{
    'skill_sort_id' => 101302,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101302018,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(101302019)-> #{
    'skill_sort_id' => 101302,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101302019,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(101302020)-> #{
    'skill_sort_id' => 101302,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101302020,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(101302021)-> #{
    'skill_sort_id' => 101302,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101302021,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(101302022)-> #{
    'skill_sort_id' => 101302,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101302022,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(101302023)-> #{
    'skill_sort_id' => 101302,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101302023,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(101302024)-> #{
    'skill_sort_id' => 101302,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101302024,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(101302025)-> #{
    'skill_sort_id' => 101302,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101302025,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(101302026)-> #{
    'skill_sort_id' => 101302,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101302026,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(101302027)-> #{
    'skill_sort_id' => 101302,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101302027,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(101302028)-> #{
    'skill_sort_id' => 101302,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101302028,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(101302029)-> #{
    'skill_sort_id' => 101302,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101302029,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(101302030)-> #{
    'skill_sort_id' => 101302,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101302030,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(201301001)-> #{
    'skill_sort_id' => 201301,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 5000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201301001
};
get(201301002)-> #{
    'skill_sort_id' => 201301,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201301002
};
get(201301003)-> #{
    'skill_sort_id' => 201301,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 15000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201301003
};
get(201301004)-> #{
    'skill_sort_id' => 201301,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 20000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201301004
};
get(201301005)-> #{
    'skill_sort_id' => 201301,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 25000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201301005
};
get(201301006)-> #{
    'skill_sort_id' => 201301,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 30000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201301006
};
get(201301007)-> #{
    'skill_sort_id' => 201301,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 35000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201301007
};
get(201301008)-> #{
    'skill_sort_id' => 201301,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 40000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201301008
};
get(201301009)-> #{
    'skill_sort_id' => 201301,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 45000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201301009
};
get(201301010)-> #{
    'skill_sort_id' => 201301,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 50000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201301010,
    'qibing_base_attack' => 50.0
};
get(201301011)-> #{
    'skill_sort_id' => 201301,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 55000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201301011,
    'qibing_base_attack' => 50.0
};
get(201301012)-> #{
    'skill_sort_id' => 201301,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 60000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201301012,
    'qibing_base_attack' => 50.0
};
get(201301013)-> #{
    'skill_sort_id' => 201301,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 65000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201301013,
    'qibing_base_attack' => 50.0
};
get(201301014)-> #{
    'skill_sort_id' => 201301,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 70000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201301014,
    'qibing_base_attack' => 50.0
};
get(201301015)-> #{
    'skill_sort_id' => 201301,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 75000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201301015,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.05
};
get(201301016)-> #{
    'skill_sort_id' => 201301,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 80000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201301016,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(201301017)-> #{
    'skill_sort_id' => 201301,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 85000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201301017,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(201301018)-> #{
    'skill_sort_id' => 201301,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 90000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201301018,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(201301019)-> #{
    'skill_sort_id' => 201301,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 95000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201301019,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(201301020)-> #{
    'skill_sort_id' => 201301,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 100000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201301020,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(201301021)-> #{
    'skill_sort_id' => 201301,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 150000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201301021,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(201301022)-> #{
    'skill_sort_id' => 201301,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 200000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201301022,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(201301023)-> #{
    'skill_sort_id' => 201301,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 250000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201301023,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(201301024)-> #{
    'skill_sort_id' => 201301,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 300000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201301024,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(201301025)-> #{
    'skill_sort_id' => 201301,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 350000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201301025,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(201301026)-> #{
    'skill_sort_id' => 201301,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 450000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201301026,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(201301027)-> #{
    'skill_sort_id' => 201301,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 550000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201301027,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(201301028)-> #{
    'skill_sort_id' => 201301,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 650000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201301028,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(201301029)-> #{
    'skill_sort_id' => 201301,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 750000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201301029,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(201301030)-> #{
    'skill_sort_id' => 201301,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 850000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201301030,
    'qibing_base_attack' => 50.0,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(201302001)-> #{
    'skill_sort_id' => 201302,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201302001
};
get(201302002)-> #{
    'skill_sort_id' => 201302,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201302002
};
get(201302003)-> #{
    'skill_sort_id' => 201302,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201302003
};
get(201302004)-> #{
    'skill_sort_id' => 201302,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201302004
};
get(201302005)-> #{
    'skill_sort_id' => 201302,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201302005
};
get(201302006)-> #{
    'skill_sort_id' => 201302,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201302006
};
get(201302007)-> #{
    'skill_sort_id' => 201302,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201302007
};
get(201302008)-> #{
    'skill_sort_id' => 201302,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201302008
};
get(201302009)-> #{
    'skill_sort_id' => 201302,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201302009
};
get(201302010)-> #{
    'skill_sort_id' => 201302,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201302010,
    'qibing_base_defence' => 20.0
};
get(201302011)-> #{
    'skill_sort_id' => 201302,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201302011,
    'qibing_base_defence' => 20.0
};
get(201302012)-> #{
    'skill_sort_id' => 201302,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201302012,
    'qibing_base_defence' => 20.0
};
get(201302013)-> #{
    'skill_sort_id' => 201302,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201302013,
    'qibing_base_defence' => 20.0
};
get(201302014)-> #{
    'skill_sort_id' => 201302,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201302014,
    'qibing_base_defence' => 20.0
};
get(201302015)-> #{
    'skill_sort_id' => 201302,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201302015,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.05
};
get(201302016)-> #{
    'skill_sort_id' => 201302,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201302016,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(201302017)-> #{
    'skill_sort_id' => 201302,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201302017,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(201302018)-> #{
    'skill_sort_id' => 201302,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201302018,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(201302019)-> #{
    'skill_sort_id' => 201302,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201302019,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(201302020)-> #{
    'skill_sort_id' => 201302,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201302020,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(201302021)-> #{
    'skill_sort_id' => 201302,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201302021,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(201302022)-> #{
    'skill_sort_id' => 201302,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201302022,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(201302023)-> #{
    'skill_sort_id' => 201302,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201302023,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(201302024)-> #{
    'skill_sort_id' => 201302,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201302024,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(201302025)-> #{
    'skill_sort_id' => 201302,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201302025,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(201302026)-> #{
    'skill_sort_id' => 201302,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201302026,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(201302027)-> #{
    'skill_sort_id' => 201302,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201302027,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(201302028)-> #{
    'skill_sort_id' => 201302,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201302028,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(201302029)-> #{
    'skill_sort_id' => 201302,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201302029,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(201302030)-> #{
    'skill_sort_id' => 201302,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201302030,
    'qibing_base_defence' => 20.0,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(201303001)-> #{
    'skill_sort_id' => 201303,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201303001
};
get(201303002)-> #{
    'skill_sort_id' => 201303,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201303002
};
get(201303003)-> #{
    'skill_sort_id' => 201303,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201303003
};
get(201303004)-> #{
    'skill_sort_id' => 201303,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201303004
};
get(201303005)-> #{
    'skill_sort_id' => 201303,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201303005
};
get(201303006)-> #{
    'skill_sort_id' => 201303,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201303006
};
get(201303007)-> #{
    'skill_sort_id' => 201303,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201303007
};
get(201303008)-> #{
    'skill_sort_id' => 201303,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201303008
};
get(201303009)-> #{
    'skill_sort_id' => 201303,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201303009
};
get(201303010)-> #{
    'skill_sort_id' => 201303,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201303010
};
get(201303011)-> #{
    'skill_sort_id' => 201303,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201303011
};
get(201303012)-> #{
    'skill_sort_id' => 201303,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201303012
};
get(201303013)-> #{
    'skill_sort_id' => 201303,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201303013
};
get(201303014)-> #{
    'skill_sort_id' => 201303,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201303014
};
get(201303015)-> #{
    'skill_sort_id' => 201303,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201303015,
    'qibing_base_attack_rate' => 0.05
};
get(201303016)-> #{
    'skill_sort_id' => 201303,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201303016,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(201303017)-> #{
    'skill_sort_id' => 201303,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201303017,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(201303018)-> #{
    'skill_sort_id' => 201303,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201303018,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(201303019)-> #{
    'skill_sort_id' => 201303,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201303019,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(201303020)-> #{
    'skill_sort_id' => 201303,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201303020,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(201303021)-> #{
    'skill_sort_id' => 201303,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201303021,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(201303022)-> #{
    'skill_sort_id' => 201303,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201303022,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(201303023)-> #{
    'skill_sort_id' => 201303,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201303023,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(201303024)-> #{
    'skill_sort_id' => 201303,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201303024,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(201303025)-> #{
    'skill_sort_id' => 201303,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201303025,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(201303026)-> #{
    'skill_sort_id' => 201303,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201303026,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(201303027)-> #{
    'skill_sort_id' => 201303,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201303027,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(201303028)-> #{
    'skill_sort_id' => 201303,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201303028,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(201303029)-> #{
    'skill_sort_id' => 201303,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201303029,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(201303030)-> #{
    'skill_sort_id' => 201303,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201303030,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(201304001)-> #{
    'skill_sort_id' => 201304,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201304001
};
get(201304002)-> #{
    'skill_sort_id' => 201304,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201304002
};
get(201304003)-> #{
    'skill_sort_id' => 201304,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201304003
};
get(201304004)-> #{
    'skill_sort_id' => 201304,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201304004
};
get(201304005)-> #{
    'skill_sort_id' => 201304,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201304005
};
get(201304006)-> #{
    'skill_sort_id' => 201304,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201304006
};
get(201304007)-> #{
    'skill_sort_id' => 201304,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201304007
};
get(201304008)-> #{
    'skill_sort_id' => 201304,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201304008
};
get(201304009)-> #{
    'skill_sort_id' => 201304,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201304009
};
get(201304010)-> #{
    'skill_sort_id' => 201304,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201304010
};
get(201304011)-> #{
    'skill_sort_id' => 201304,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201304011
};
get(201304012)-> #{
    'skill_sort_id' => 201304,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201304012
};
get(201304013)-> #{
    'skill_sort_id' => 201304,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201304013
};
get(201304014)-> #{
    'skill_sort_id' => 201304,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201304014
};
get(201304015)-> #{
    'skill_sort_id' => 201304,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201304015,
    'qibing_base_attack_rate' => 0.05
};
get(201304016)-> #{
    'skill_sort_id' => 201304,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201304016,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(201304017)-> #{
    'skill_sort_id' => 201304,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201304017,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(201304018)-> #{
    'skill_sort_id' => 201304,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201304018,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(201304019)-> #{
    'skill_sort_id' => 201304,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201304019,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(201304020)-> #{
    'skill_sort_id' => 201304,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201304020,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(201304021)-> #{
    'skill_sort_id' => 201304,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201304021,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(201304022)-> #{
    'skill_sort_id' => 201304,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201304022,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(201304023)-> #{
    'skill_sort_id' => 201304,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201304023,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(201304024)-> #{
    'skill_sort_id' => 201304,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201304024,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(201304025)-> #{
    'skill_sort_id' => 201304,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201304025,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(201304026)-> #{
    'skill_sort_id' => 201304,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201304026,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(201304027)-> #{
    'skill_sort_id' => 201304,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201304027,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(201304028)-> #{
    'skill_sort_id' => 201304,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201304028,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(201304029)-> #{
    'skill_sort_id' => 201304,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201304029,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(201304030)-> #{
    'skill_sort_id' => 201304,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201304030,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(101303001)-> #{
    'skill_sort_id' => 101303,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101303001
};
get(101303002)-> #{
    'skill_sort_id' => 101303,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101303002
};
get(101303003)-> #{
    'skill_sort_id' => 101303,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101303003
};
get(101303004)-> #{
    'skill_sort_id' => 101303,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101303004
};
get(101303005)-> #{
    'skill_sort_id' => 101303,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101303005
};
get(101303006)-> #{
    'skill_sort_id' => 101303,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101303006
};
get(101303007)-> #{
    'skill_sort_id' => 101303,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101303007
};
get(101303008)-> #{
    'skill_sort_id' => 101303,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101303008
};
get(101303009)-> #{
    'skill_sort_id' => 101303,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101303009
};
get(101303010)-> #{
    'skill_sort_id' => 101303,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101303010
};
get(101303011)-> #{
    'skill_sort_id' => 101303,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101303011
};
get(101303012)-> #{
    'skill_sort_id' => 101303,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101303012
};
get(101303013)-> #{
    'skill_sort_id' => 101303,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101303013
};
get(101303014)-> #{
    'skill_sort_id' => 101303,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101303014
};
get(101303015)-> #{
    'skill_sort_id' => 101303,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101303015,
    'qibing_base_attack_rate' => 0.05
};
get(101303016)-> #{
    'skill_sort_id' => 101303,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101303016,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(101303017)-> #{
    'skill_sort_id' => 101303,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101303017,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(101303018)-> #{
    'skill_sort_id' => 101303,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101303018,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(101303019)-> #{
    'skill_sort_id' => 101303,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101303019,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(101303020)-> #{
    'skill_sort_id' => 101303,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101303020,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(101303021)-> #{
    'skill_sort_id' => 101303,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101303021,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(101303022)-> #{
    'skill_sort_id' => 101303,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101303022,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(101303023)-> #{
    'skill_sort_id' => 101303,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101303023,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(101303024)-> #{
    'skill_sort_id' => 101303,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101303024,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(101303025)-> #{
    'skill_sort_id' => 101303,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101303025,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(101303026)-> #{
    'skill_sort_id' => 101303,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101303026,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(101303027)-> #{
    'skill_sort_id' => 101303,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101303027,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(101303028)-> #{
    'skill_sort_id' => 101303,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101303028,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(101303029)-> #{
    'skill_sort_id' => 101303,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101303029,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(101303030)-> #{
    'skill_sort_id' => 101303,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101303030,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(201305001)-> #{
    'skill_sort_id' => 201305,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201305001
};
get(201305002)-> #{
    'skill_sort_id' => 201305,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201305002
};
get(201305003)-> #{
    'skill_sort_id' => 201305,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201305003
};
get(201305004)-> #{
    'skill_sort_id' => 201305,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201305004
};
get(201305005)-> #{
    'skill_sort_id' => 201305,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201305005
};
get(201305006)-> #{
    'skill_sort_id' => 201305,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201305006
};
get(201305007)-> #{
    'skill_sort_id' => 201305,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201305007
};
get(201305008)-> #{
    'skill_sort_id' => 201305,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201305008
};
get(201305009)-> #{
    'skill_sort_id' => 201305,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201305009
};
get(201305010)-> #{
    'skill_sort_id' => 201305,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201305010
};
get(201305011)-> #{
    'skill_sort_id' => 201305,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201305011
};
get(201305012)-> #{
    'skill_sort_id' => 201305,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201305012
};
get(201305013)-> #{
    'skill_sort_id' => 201305,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201305013
};
get(201305014)-> #{
    'skill_sort_id' => 201305,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201305014
};
get(201305015)-> #{
    'skill_sort_id' => 201305,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201305015,
    'qibing_base_attack_rate' => 0.05
};
get(201305016)-> #{
    'skill_sort_id' => 201305,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201305016,
    'qibing_base_attack_rate' => 0.05,
    'qibing_base_defence_rate' => 0.04
};
get(201305017)-> #{
    'skill_sort_id' => 201305,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201305017,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.04
};
get(201305018)-> #{
    'skill_sort_id' => 201305,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201305018,
    'qibing_base_attack_rate' => 0.12,
    'qibing_base_defence_rate' => 0.1
};
get(201305019)-> #{
    'skill_sort_id' => 201305,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201305019,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.1
};
get(201305020)-> #{
    'skill_sort_id' => 201305,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201305020,
    'qibing_base_attack_rate' => 0.21,
    'qibing_base_defence_rate' => 0.18
};
get(201305021)-> #{
    'skill_sort_id' => 201305,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201305021,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.18
};
get(201305022)-> #{
    'skill_sort_id' => 201305,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201305022,
    'qibing_base_attack_rate' => 0.32,
    'qibing_base_defence_rate' => 0.28
};
get(201305023)-> #{
    'skill_sort_id' => 201305,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201305023,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.28
};
get(201305024)-> #{
    'skill_sort_id' => 201305,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201305024,
    'qibing_base_attack_rate' => 0.45,
    'qibing_base_defence_rate' => 0.4
};
get(201305025)-> #{
    'skill_sort_id' => 201305,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201305025,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.4
};
get(201305026)-> #{
    'skill_sort_id' => 201305,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201305026,
    'qibing_base_attack_rate' => 0.6,
    'qibing_base_defence_rate' => 0.5
};
get(201305027)-> #{
    'skill_sort_id' => 201305,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201305027,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.5
};
get(201305028)-> #{
    'skill_sort_id' => 201305,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201305028,
    'qibing_base_attack_rate' => 0.7,
    'qibing_base_defence_rate' => 0.6
};
get(201305029)-> #{
    'skill_sort_id' => 201305,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201305029,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.6
};
get(201305030)-> #{
    'skill_sort_id' => 201305,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201305030,
    'qibing_base_attack_rate' => 0.8,
    'qibing_base_defence_rate' => 0.7
};
get(201401001)-> #{
    'skill_sort_id' => 201401,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 5000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201401001
};
get(201401002)-> #{
    'skill_sort_id' => 201401,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201401002
};
get(201401003)-> #{
    'skill_sort_id' => 201401,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 15000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201401003
};
get(201401004)-> #{
    'skill_sort_id' => 201401,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 20000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201401004
};
get(201401005)-> #{
    'skill_sort_id' => 201401,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 25000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201401005
};
get(201401006)-> #{
    'skill_sort_id' => 201401,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 30000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201401006
};
get(201401007)-> #{
    'skill_sort_id' => 201401,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 35000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201401007
};
get(201401008)-> #{
    'skill_sort_id' => 201401,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 40000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201401008
};
get(201401009)-> #{
    'skill_sort_id' => 201401,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 45000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201401009
};
get(201401010)-> #{
    'skill_sort_id' => 201401,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 50000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201401010,
    'gongbing_base_attack' => 50.0
};
get(201401011)-> #{
    'skill_sort_id' => 201401,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 55000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201401011,
    'gongbing_base_attack' => 50.0
};
get(201401012)-> #{
    'skill_sort_id' => 201401,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 60000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201401012,
    'gongbing_base_attack' => 50.0
};
get(201401013)-> #{
    'skill_sort_id' => 201401,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 65000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201401013,
    'gongbing_base_attack' => 50.0
};
get(201401014)-> #{
    'skill_sort_id' => 201401,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 70000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201401014,
    'gongbing_base_attack' => 50.0
};
get(201401015)-> #{
    'skill_sort_id' => 201401,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 75000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201401015,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.05
};
get(201401016)-> #{
    'skill_sort_id' => 201401,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 80000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201401016,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(201401017)-> #{
    'skill_sort_id' => 201401,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 85000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201401017,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(201401018)-> #{
    'skill_sort_id' => 201401,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 90000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201401018,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(201401019)-> #{
    'skill_sort_id' => 201401,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 95000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201401019,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(201401020)-> #{
    'skill_sort_id' => 201401,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 100000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201401020,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(201401021)-> #{
    'skill_sort_id' => 201401,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 150000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201401021,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(201401022)-> #{
    'skill_sort_id' => 201401,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 200000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201401022,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(201401023)-> #{
    'skill_sort_id' => 201401,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 250000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201401023,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(201401024)-> #{
    'skill_sort_id' => 201401,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 300000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201401024,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(201401025)-> #{
    'skill_sort_id' => 201401,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 350000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201401025,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(201401026)-> #{
    'skill_sort_id' => 201401,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 450000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201401026,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(201401027)-> #{
    'skill_sort_id' => 201401,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 550000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201401027,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(201401028)-> #{
    'skill_sort_id' => 201401,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 650000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201401028,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(201401029)-> #{
    'skill_sort_id' => 201401,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 750000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201401029,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(201401030)-> #{
    'skill_sort_id' => 201401,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 850000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201401030,
    'gongbing_base_attack' => 50.0,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(201402001)-> #{
    'skill_sort_id' => 201402,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 5000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201402001
};
get(201402002)-> #{
    'skill_sort_id' => 201402,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201402002
};
get(201402003)-> #{
    'skill_sort_id' => 201402,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 15000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201402003
};
get(201402004)-> #{
    'skill_sort_id' => 201402,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 20000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201402004
};
get(201402005)-> #{
    'skill_sort_id' => 201402,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 25000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201402005
};
get(201402006)-> #{
    'skill_sort_id' => 201402,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 30000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201402006
};
get(201402007)-> #{
    'skill_sort_id' => 201402,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 35000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201402007
};
get(201402008)-> #{
    'skill_sort_id' => 201402,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 40000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201402008
};
get(201402009)-> #{
    'skill_sort_id' => 201402,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 45000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201402009
};
get(201402010)-> #{
    'skill_sort_id' => 201402,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 50000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201402010
};
get(201402011)-> #{
    'skill_sort_id' => 201402,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 55000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201402011
};
get(201402012)-> #{
    'skill_sort_id' => 201402,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 60000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201402012
};
get(201402013)-> #{
    'skill_sort_id' => 201402,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 65000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201402013,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0
};
get(201402014)-> #{
    'skill_sort_id' => 201402,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 70000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201402014,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0
};
get(201402015)-> #{
    'skill_sort_id' => 201402,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 75000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201402015,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.05
};
get(201402016)-> #{
    'skill_sort_id' => 201402,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 80000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201402016,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(201402017)-> #{
    'skill_sort_id' => 201402,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 85000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201402017,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(201402018)-> #{
    'skill_sort_id' => 201402,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 90000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201402018,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(201402019)-> #{
    'skill_sort_id' => 201402,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 95000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201402019,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(201402020)-> #{
    'skill_sort_id' => 201402,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 100000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201402020,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(201402021)-> #{
    'skill_sort_id' => 201402,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 150000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201402021,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(201402022)-> #{
    'skill_sort_id' => 201402,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 200000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201402022,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(201402023)-> #{
    'skill_sort_id' => 201402,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 250000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201402023,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(201402024)-> #{
    'skill_sort_id' => 201402,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 300000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201402024,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(201402025)-> #{
    'skill_sort_id' => 201402,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 350000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201402025,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(201402026)-> #{
    'skill_sort_id' => 201402,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 450000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201402026,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(201402027)-> #{
    'skill_sort_id' => 201402,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 550000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201402027,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(201402028)-> #{
    'skill_sort_id' => 201402,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 650000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201402028,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(201402029)-> #{
    'skill_sort_id' => 201402,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 750000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201402029,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(201402030)-> #{
    'skill_sort_id' => 201402,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 850000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201402030,
    'gongbing_speed' => 10.0,
    'gongbing_troops' => 50.0,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(201403001)-> #{
    'skill_sort_id' => 201403,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201403001
};
get(201403002)-> #{
    'skill_sort_id' => 201403,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201403002
};
get(201403003)-> #{
    'skill_sort_id' => 201403,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201403003
};
get(201403004)-> #{
    'skill_sort_id' => 201403,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201403004
};
get(201403005)-> #{
    'skill_sort_id' => 201403,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201403005
};
get(201403006)-> #{
    'skill_sort_id' => 201403,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201403006
};
get(201403007)-> #{
    'skill_sort_id' => 201403,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201403007
};
get(201403008)-> #{
    'skill_sort_id' => 201403,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201403008
};
get(201403009)-> #{
    'skill_sort_id' => 201403,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201403009
};
get(201403010)-> #{
    'skill_sort_id' => 201403,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201403010,
    'gongbing_base_defence' => 20.0
};
get(201403011)-> #{
    'skill_sort_id' => 201403,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201403011,
    'gongbing_base_defence' => 20.0
};
get(201403012)-> #{
    'skill_sort_id' => 201403,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201403012,
    'gongbing_base_defence' => 20.0
};
get(201403013)-> #{
    'skill_sort_id' => 201403,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201403013,
    'gongbing_base_defence' => 20.0
};
get(201403014)-> #{
    'skill_sort_id' => 201403,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201403014,
    'gongbing_base_defence' => 20.0
};
get(201403015)-> #{
    'skill_sort_id' => 201403,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201403015,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.05
};
get(201403016)-> #{
    'skill_sort_id' => 201403,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201403016,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(201403017)-> #{
    'skill_sort_id' => 201403,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201403017,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(201403018)-> #{
    'skill_sort_id' => 201403,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201403018,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(201403019)-> #{
    'skill_sort_id' => 201403,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201403019,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(201403020)-> #{
    'skill_sort_id' => 201403,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201403020,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(201403021)-> #{
    'skill_sort_id' => 201403,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201403021,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(201403022)-> #{
    'skill_sort_id' => 201403,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201403022,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(201403023)-> #{
    'skill_sort_id' => 201403,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201403023,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(201403024)-> #{
    'skill_sort_id' => 201403,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201403024,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(201403025)-> #{
    'skill_sort_id' => 201403,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201403025,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(201403026)-> #{
    'skill_sort_id' => 201403,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201403026,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(201403027)-> #{
    'skill_sort_id' => 201403,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201403027,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(201403028)-> #{
    'skill_sort_id' => 201403,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201403028,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(201403029)-> #{
    'skill_sort_id' => 201403,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201403029,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(201403030)-> #{
    'skill_sort_id' => 201403,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201403030,
    'gongbing_base_defence' => 20.0,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(101401001)-> #{
    'skill_sort_id' => 101401,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101401001
};
get(101401002)-> #{
    'skill_sort_id' => 101401,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101401002
};
get(101401003)-> #{
    'skill_sort_id' => 101401,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101401003
};
get(101401004)-> #{
    'skill_sort_id' => 101401,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101401004
};
get(101401005)-> #{
    'skill_sort_id' => 101401,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101401005
};
get(101401006)-> #{
    'skill_sort_id' => 101401,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101401006
};
get(101401007)-> #{
    'skill_sort_id' => 101401,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101401007
};
get(101401008)-> #{
    'skill_sort_id' => 101401,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101401008
};
get(101401009)-> #{
    'skill_sort_id' => 101401,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101401009
};
get(101401010)-> #{
    'skill_sort_id' => 101401,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101401010
};
get(101401011)-> #{
    'skill_sort_id' => 101401,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101401011
};
get(101401012)-> #{
    'skill_sort_id' => 101401,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101401012
};
get(101401013)-> #{
    'skill_sort_id' => 101401,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101401013
};
get(101401014)-> #{
    'skill_sort_id' => 101401,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101401014
};
get(101401015)-> #{
    'skill_sort_id' => 101401,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101401015,
    'gongbing_base_attack_rate' => 0.05
};
get(101401016)-> #{
    'skill_sort_id' => 101401,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101401016,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(101401017)-> #{
    'skill_sort_id' => 101401,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101401017,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(101401018)-> #{
    'skill_sort_id' => 101401,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101401018,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(101401019)-> #{
    'skill_sort_id' => 101401,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101401019,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(101401020)-> #{
    'skill_sort_id' => 101401,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101401020,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(101401021)-> #{
    'skill_sort_id' => 101401,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101401021,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(101401022)-> #{
    'skill_sort_id' => 101401,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101401022,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(101401023)-> #{
    'skill_sort_id' => 101401,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101401023,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(101401024)-> #{
    'skill_sort_id' => 101401,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101401024,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(101401025)-> #{
    'skill_sort_id' => 101401,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101401025,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(101401026)-> #{
    'skill_sort_id' => 101401,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101401026,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(101401027)-> #{
    'skill_sort_id' => 101401,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101401027,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(101401028)-> #{
    'skill_sort_id' => 101401,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101401028,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(101401029)-> #{
    'skill_sort_id' => 101401,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101401029,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(101401030)-> #{
    'skill_sort_id' => 101401,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101401030,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(201404001)-> #{
    'skill_sort_id' => 201404,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201404001
};
get(201404002)-> #{
    'skill_sort_id' => 201404,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201404002
};
get(201404003)-> #{
    'skill_sort_id' => 201404,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201404003
};
get(201404004)-> #{
    'skill_sort_id' => 201404,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201404004
};
get(201404005)-> #{
    'skill_sort_id' => 201404,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201404005
};
get(201404006)-> #{
    'skill_sort_id' => 201404,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201404006
};
get(201404007)-> #{
    'skill_sort_id' => 201404,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201404007
};
get(201404008)-> #{
    'skill_sort_id' => 201404,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201404008
};
get(201404009)-> #{
    'skill_sort_id' => 201404,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201404009
};
get(201404010)-> #{
    'skill_sort_id' => 201404,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201404010
};
get(201404011)-> #{
    'skill_sort_id' => 201404,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201404011
};
get(201404012)-> #{
    'skill_sort_id' => 201404,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201404012
};
get(201404013)-> #{
    'skill_sort_id' => 201404,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201404013
};
get(201404014)-> #{
    'skill_sort_id' => 201404,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201404014
};
get(201404015)-> #{
    'skill_sort_id' => 201404,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201404015,
    'gongbing_base_attack_rate' => 0.05
};
get(201404016)-> #{
    'skill_sort_id' => 201404,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201404016,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(201404017)-> #{
    'skill_sort_id' => 201404,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201404017,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(201404018)-> #{
    'skill_sort_id' => 201404,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201404018,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(201404019)-> #{
    'skill_sort_id' => 201404,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201404019,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(201404020)-> #{
    'skill_sort_id' => 201404,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201404020,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(201404021)-> #{
    'skill_sort_id' => 201404,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201404021,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(201404022)-> #{
    'skill_sort_id' => 201404,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201404022,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(201404023)-> #{
    'skill_sort_id' => 201404,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201404023,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(201404024)-> #{
    'skill_sort_id' => 201404,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201404024,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(201404025)-> #{
    'skill_sort_id' => 201404,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201404025,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(201404026)-> #{
    'skill_sort_id' => 201404,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201404026,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(201404027)-> #{
    'skill_sort_id' => 201404,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201404027,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(201404028)-> #{
    'skill_sort_id' => 201404,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201404028,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(201404029)-> #{
    'skill_sort_id' => 201404,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201404029,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(201404030)-> #{
    'skill_sort_id' => 201404,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201404030,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(101402001)-> #{
    'skill_sort_id' => 101402,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101402001
};
get(101402002)-> #{
    'skill_sort_id' => 101402,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101402002
};
get(101402003)-> #{
    'skill_sort_id' => 101402,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101402003
};
get(101402004)-> #{
    'skill_sort_id' => 101402,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101402004
};
get(101402005)-> #{
    'skill_sort_id' => 101402,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101402005
};
get(101402006)-> #{
    'skill_sort_id' => 101402,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101402006
};
get(101402007)-> #{
    'skill_sort_id' => 101402,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101402007
};
get(101402008)-> #{
    'skill_sort_id' => 101402,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101402008
};
get(101402009)-> #{
    'skill_sort_id' => 101402,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101402009
};
get(101402010)-> #{
    'skill_sort_id' => 101402,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101402010
};
get(101402011)-> #{
    'skill_sort_id' => 101402,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101402011
};
get(101402012)-> #{
    'skill_sort_id' => 101402,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101402012
};
get(101402013)-> #{
    'skill_sort_id' => 101402,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101402013
};
get(101402014)-> #{
    'skill_sort_id' => 101402,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101402014
};
get(101402015)-> #{
    'skill_sort_id' => 101402,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101402015,
    'gongbing_base_attack_rate' => 0.05
};
get(101402016)-> #{
    'skill_sort_id' => 101402,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101402016,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(101402017)-> #{
    'skill_sort_id' => 101402,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101402017,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(101402018)-> #{
    'skill_sort_id' => 101402,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101402018,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(101402019)-> #{
    'skill_sort_id' => 101402,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101402019,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(101402020)-> #{
    'skill_sort_id' => 101402,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101402020,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(101402021)-> #{
    'skill_sort_id' => 101402,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101402021,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(101402022)-> #{
    'skill_sort_id' => 101402,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101402022,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(101402023)-> #{
    'skill_sort_id' => 101402,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101402023,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(101402024)-> #{
    'skill_sort_id' => 101402,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101402024,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(101402025)-> #{
    'skill_sort_id' => 101402,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101402025,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(101402026)-> #{
    'skill_sort_id' => 101402,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101402026,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(101402027)-> #{
    'skill_sort_id' => 101402,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101402027,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(101402028)-> #{
    'skill_sort_id' => 101402,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101402028,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(101402029)-> #{
    'skill_sort_id' => 101402,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101402029,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(101402030)-> #{
    'skill_sort_id' => 101402,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101402030,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(101403001)-> #{
    'skill_sort_id' => 101403,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101403001
};
get(101403002)-> #{
    'skill_sort_id' => 101403,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101403002
};
get(101403003)-> #{
    'skill_sort_id' => 101403,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101403003
};
get(101403004)-> #{
    'skill_sort_id' => 101403,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101403004
};
get(101403005)-> #{
    'skill_sort_id' => 101403,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101403005
};
get(101403006)-> #{
    'skill_sort_id' => 101403,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101403006
};
get(101403007)-> #{
    'skill_sort_id' => 101403,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101403007
};
get(101403008)-> #{
    'skill_sort_id' => 101403,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101403008
};
get(101403009)-> #{
    'skill_sort_id' => 101403,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101403009
};
get(101403010)-> #{
    'skill_sort_id' => 101403,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101403010
};
get(101403011)-> #{
    'skill_sort_id' => 101403,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101403011
};
get(101403012)-> #{
    'skill_sort_id' => 101403,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101403012
};
get(101403013)-> #{
    'skill_sort_id' => 101403,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101403013
};
get(101403014)-> #{
    'skill_sort_id' => 101403,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101403014
};
get(101403015)-> #{
    'skill_sort_id' => 101403,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101403015,
    'gongbing_base_attack_rate' => 0.05
};
get(101403016)-> #{
    'skill_sort_id' => 101403,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101403016,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(101403017)-> #{
    'skill_sort_id' => 101403,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101403017,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(101403018)-> #{
    'skill_sort_id' => 101403,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101403018,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(101403019)-> #{
    'skill_sort_id' => 101403,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101403019,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(101403020)-> #{
    'skill_sort_id' => 101403,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101403020,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(101403021)-> #{
    'skill_sort_id' => 101403,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101403021,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(101403022)-> #{
    'skill_sort_id' => 101403,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101403022,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(101403023)-> #{
    'skill_sort_id' => 101403,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101403023,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(101403024)-> #{
    'skill_sort_id' => 101403,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101403024,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(101403025)-> #{
    'skill_sort_id' => 101403,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101403025,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(101403026)-> #{
    'skill_sort_id' => 101403,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101403026,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(101403027)-> #{
    'skill_sort_id' => 101403,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101403027,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(101403028)-> #{
    'skill_sort_id' => 101403,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101403028,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(101403029)-> #{
    'skill_sort_id' => 101403,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101403029,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(101403030)-> #{
    'skill_sort_id' => 101403,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101403030,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(201405001)-> #{
    'skill_sort_id' => 201405,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201405001
};
get(201405002)-> #{
    'skill_sort_id' => 201405,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201405002
};
get(201405003)-> #{
    'skill_sort_id' => 201405,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201405003
};
get(201405004)-> #{
    'skill_sort_id' => 201405,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201405004
};
get(201405005)-> #{
    'skill_sort_id' => 201405,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201405005
};
get(201405006)-> #{
    'skill_sort_id' => 201405,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201405006
};
get(201405007)-> #{
    'skill_sort_id' => 201405,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201405007
};
get(201405008)-> #{
    'skill_sort_id' => 201405,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201405008
};
get(201405009)-> #{
    'skill_sort_id' => 201405,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201405009
};
get(201405010)-> #{
    'skill_sort_id' => 201405,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201405010
};
get(201405011)-> #{
    'skill_sort_id' => 201405,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201405011
};
get(201405012)-> #{
    'skill_sort_id' => 201405,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201405012
};
get(201405013)-> #{
    'skill_sort_id' => 201405,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201405013
};
get(201405014)-> #{
    'skill_sort_id' => 201405,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201405014
};
get(201405015)-> #{
    'skill_sort_id' => 201405,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201405015,
    'gongbing_base_attack_rate' => 0.05
};
get(201405016)-> #{
    'skill_sort_id' => 201405,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201405016,
    'gongbing_base_attack_rate' => 0.05,
    'gongbing_base_defence_rate' => 0.04
};
get(201405017)-> #{
    'skill_sort_id' => 201405,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201405017,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.04
};
get(201405018)-> #{
    'skill_sort_id' => 201405,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201405018,
    'gongbing_base_attack_rate' => 0.12,
    'gongbing_base_defence_rate' => 0.1
};
get(201405019)-> #{
    'skill_sort_id' => 201405,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201405019,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.1
};
get(201405020)-> #{
    'skill_sort_id' => 201405,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201405020,
    'gongbing_base_attack_rate' => 0.21,
    'gongbing_base_defence_rate' => 0.18
};
get(201405021)-> #{
    'skill_sort_id' => 201405,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201405021,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.18
};
get(201405022)-> #{
    'skill_sort_id' => 201405,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201405022,
    'gongbing_base_attack_rate' => 0.32,
    'gongbing_base_defence_rate' => 0.28
};
get(201405023)-> #{
    'skill_sort_id' => 201405,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201405023,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.28
};
get(201405024)-> #{
    'skill_sort_id' => 201405,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201405024,
    'gongbing_base_attack_rate' => 0.45,
    'gongbing_base_defence_rate' => 0.4
};
get(201405025)-> #{
    'skill_sort_id' => 201405,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201405025,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.4
};
get(201405026)-> #{
    'skill_sort_id' => 201405,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201405026,
    'gongbing_base_attack_rate' => 0.6,
    'gongbing_base_defence_rate' => 0.5
};
get(201405027)-> #{
    'skill_sort_id' => 201405,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201405027,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.5
};
get(201405028)-> #{
    'skill_sort_id' => 201405,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201405028,
    'gongbing_base_attack_rate' => 0.7,
    'gongbing_base_defence_rate' => 0.6
};
get(201405029)-> #{
    'skill_sort_id' => 201405,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201405029,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.6
};
get(201405030)-> #{
    'skill_sort_id' => 201405,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201405030,
    'gongbing_base_attack_rate' => 0.8,
    'gongbing_base_defence_rate' => 0.7
};
get(201501001)-> #{
    'skill_sort_id' => 201501,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201501001
};
get(201501002)-> #{
    'skill_sort_id' => 201501,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201501002
};
get(201501003)-> #{
    'skill_sort_id' => 201501,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201501003
};
get(201501004)-> #{
    'skill_sort_id' => 201501,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201501004
};
get(201501005)-> #{
    'skill_sort_id' => 201501,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201501005
};
get(201501006)-> #{
    'skill_sort_id' => 201501,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201501006
};
get(201501007)-> #{
    'skill_sort_id' => 201501,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201501007
};
get(201501008)-> #{
    'skill_sort_id' => 201501,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201501008
};
get(201501009)-> #{
    'skill_sort_id' => 201501,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201501009
};
get(201501010)-> #{
    'skill_sort_id' => 201501,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201501010
};
get(201501011)-> #{
    'skill_sort_id' => 201501,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201501011
};
get(201501012)-> #{
    'skill_sort_id' => 201501,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201501012
};
get(201501013)-> #{
    'skill_sort_id' => 201501,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201501013,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0
};
get(201501014)-> #{
    'skill_sort_id' => 201501,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201501014,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0
};
get(201501015)-> #{
    'skill_sort_id' => 201501,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201501015,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.05
};
get(201501016)-> #{
    'skill_sort_id' => 201501,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201501016,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(201501017)-> #{
    'skill_sort_id' => 201501,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201501017,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(201501018)-> #{
    'skill_sort_id' => 201501,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201501018,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(201501019)-> #{
    'skill_sort_id' => 201501,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201501019,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(201501020)-> #{
    'skill_sort_id' => 201501,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201501020,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(201501021)-> #{
    'skill_sort_id' => 201501,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201501021,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(201501022)-> #{
    'skill_sort_id' => 201501,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201501022,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(201501023)-> #{
    'skill_sort_id' => 201501,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201501023,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(201501024)-> #{
    'skill_sort_id' => 201501,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201501024,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(201501025)-> #{
    'skill_sort_id' => 201501,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201501025,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(201501026)-> #{
    'skill_sort_id' => 201501,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201501026,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(201501027)-> #{
    'skill_sort_id' => 201501,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201501027,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(201501028)-> #{
    'skill_sort_id' => 201501,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201501028,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(201501029)-> #{
    'skill_sort_id' => 201501,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201501029,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(201501030)-> #{
    'skill_sort_id' => 201501,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201501030,
    'fangshi_speed' => 10.0,
    'fangshi_troops' => 50.0,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(101501001)-> #{
    'skill_sort_id' => 101501,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 8000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101501001
};
get(101501002)-> #{
    'skill_sort_id' => 101501,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 16000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101501002
};
get(101501003)-> #{
    'skill_sort_id' => 101501,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101501003
};
get(101501004)-> #{
    'skill_sort_id' => 101501,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 32000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101501004
};
get(101501005)-> #{
    'skill_sort_id' => 101501,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101501005
};
get(101501006)-> #{
    'skill_sort_id' => 101501,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101501006
};
get(101501007)-> #{
    'skill_sort_id' => 101501,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 56000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101501007
};
get(101501008)-> #{
    'skill_sort_id' => 101501,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 64000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101501008
};
get(101501009)-> #{
    'skill_sort_id' => 101501,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 72000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101501009
};
get(101501010)-> #{
    'skill_sort_id' => 101501,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 80000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101501010
};
get(101501011)-> #{
    'skill_sort_id' => 101501,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 88000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101501011
};
get(101501012)-> #{
    'skill_sort_id' => 101501,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 96000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101501012
};
get(101501013)-> #{
    'skill_sort_id' => 101501,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 104000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101501013
};
get(101501014)-> #{
    'skill_sort_id' => 101501,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 112000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101501014
};
get(101501015)-> #{
    'skill_sort_id' => 101501,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 120000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101501015,
    'fangshi_base_attack_rate' => 0.05
};
get(101501016)-> #{
    'skill_sort_id' => 101501,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 128000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101501016,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(101501017)-> #{
    'skill_sort_id' => 101501,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 136000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101501017,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(101501018)-> #{
    'skill_sort_id' => 101501,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 144000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101501018,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(101501019)-> #{
    'skill_sort_id' => 101501,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 152000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101501019,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(101501020)-> #{
    'skill_sort_id' => 101501,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 160000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101501020,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(101501021)-> #{
    'skill_sort_id' => 101501,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 240000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101501021,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(101501022)-> #{
    'skill_sort_id' => 101501,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 320000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101501022,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(101501023)-> #{
    'skill_sort_id' => 101501,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 400000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101501023,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(101501024)-> #{
    'skill_sort_id' => 101501,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 480000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101501024,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(101501025)-> #{
    'skill_sort_id' => 101501,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 560000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101501025,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(101501026)-> #{
    'skill_sort_id' => 101501,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 720000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101501026,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(101501027)-> #{
    'skill_sort_id' => 101501,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 880000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101501027,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(101501028)-> #{
    'skill_sort_id' => 101501,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1040000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101501028,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(101501029)-> #{
    'skill_sort_id' => 101501,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1200000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101501029,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(101501030)-> #{
    'skill_sort_id' => 101501,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1360000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101501030,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(201502001)-> #{
    'skill_sort_id' => 201502,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 5000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201502001
};
get(201502002)-> #{
    'skill_sort_id' => 201502,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201502002
};
get(201502003)-> #{
    'skill_sort_id' => 201502,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 15000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201502003
};
get(201502004)-> #{
    'skill_sort_id' => 201502,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 20000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201502004
};
get(201502005)-> #{
    'skill_sort_id' => 201502,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 25000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201502005
};
get(201502006)-> #{
    'skill_sort_id' => 201502,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 30000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201502006
};
get(201502007)-> #{
    'skill_sort_id' => 201502,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 35000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201502007
};
get(201502008)-> #{
    'skill_sort_id' => 201502,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 40000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201502008
};
get(201502009)-> #{
    'skill_sort_id' => 201502,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 45000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201502009
};
get(201502010)-> #{
    'skill_sort_id' => 201502,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 50000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201502010,
    'fangshi_base_defence' => 20.0
};
get(201502011)-> #{
    'skill_sort_id' => 201502,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 55000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201502011,
    'fangshi_base_defence' => 20.0
};
get(201502012)-> #{
    'skill_sort_id' => 201502,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 60000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201502012,
    'fangshi_base_defence' => 20.0
};
get(201502013)-> #{
    'skill_sort_id' => 201502,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 65000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201502013,
    'fangshi_base_defence' => 20.0
};
get(201502014)-> #{
    'skill_sort_id' => 201502,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 70000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201502014,
    'fangshi_base_defence' => 20.0
};
get(201502015)-> #{
    'skill_sort_id' => 201502,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 75000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201502015,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.05
};
get(201502016)-> #{
    'skill_sort_id' => 201502,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 80000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201502016,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(201502017)-> #{
    'skill_sort_id' => 201502,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 85000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201502017,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(201502018)-> #{
    'skill_sort_id' => 201502,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 90000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201502018,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(201502019)-> #{
    'skill_sort_id' => 201502,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 95000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201502019,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(201502020)-> #{
    'skill_sort_id' => 201502,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 100000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201502020,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(201502021)-> #{
    'skill_sort_id' => 201502,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 150000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201502021,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(201502022)-> #{
    'skill_sort_id' => 201502,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 200000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201502022,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(201502023)-> #{
    'skill_sort_id' => 201502,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 250000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201502023,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(201502024)-> #{
    'skill_sort_id' => 201502,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 300000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201502024,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(201502025)-> #{
    'skill_sort_id' => 201502,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 350000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201502025,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(201502026)-> #{
    'skill_sort_id' => 201502,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 450000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201502026,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(201502027)-> #{
    'skill_sort_id' => 201502,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 550000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201502027,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(201502028)-> #{
    'skill_sort_id' => 201502,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 650000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201502028,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(201502029)-> #{
    'skill_sort_id' => 201502,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 750000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201502029,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(201502030)-> #{
    'skill_sort_id' => 201502,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 850000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201502030,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(201503001)-> #{
    'skill_sort_id' => 201503,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 5000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201503001
};
get(201503002)-> #{
    'skill_sort_id' => 201503,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201503002
};
get(201503003)-> #{
    'skill_sort_id' => 201503,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 15000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201503003
};
get(201503004)-> #{
    'skill_sort_id' => 201503,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 20000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201503004
};
get(201503005)-> #{
    'skill_sort_id' => 201503,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 25000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201503005
};
get(201503006)-> #{
    'skill_sort_id' => 201503,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 30000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201503006
};
get(201503007)-> #{
    'skill_sort_id' => 201503,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 35000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201503007
};
get(201503008)-> #{
    'skill_sort_id' => 201503,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 40000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201503008
};
get(201503009)-> #{
    'skill_sort_id' => 201503,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 45000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201503009
};
get(201503010)-> #{
    'skill_sort_id' => 201503,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 50000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201503010,
    'fangshi_base_attack' => 50.0
};
get(201503011)-> #{
    'skill_sort_id' => 201503,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 55000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201503011,
    'fangshi_base_attack' => 50.0
};
get(201503012)-> #{
    'skill_sort_id' => 201503,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 60000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201503012,
    'fangshi_base_attack' => 50.0
};
get(201503013)-> #{
    'skill_sort_id' => 201503,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 65000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201503013,
    'fangshi_base_attack' => 50.0
};
get(201503014)-> #{
    'skill_sort_id' => 201503,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 70000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201503014,
    'fangshi_base_attack' => 50.0
};
get(201503015)-> #{
    'skill_sort_id' => 201503,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 75000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201503015,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.05
};
get(201503016)-> #{
    'skill_sort_id' => 201503,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 80000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201503016,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(201503017)-> #{
    'skill_sort_id' => 201503,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 85000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201503017,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(201503018)-> #{
    'skill_sort_id' => 201503,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 90000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201503018,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(201503019)-> #{
    'skill_sort_id' => 201503,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 95000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201503019,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(201503020)-> #{
    'skill_sort_id' => 201503,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 100000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201503020,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(201503021)-> #{
    'skill_sort_id' => 201503,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 150000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201503021,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(201503022)-> #{
    'skill_sort_id' => 201503,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 200000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201503022,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(201503023)-> #{
    'skill_sort_id' => 201503,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 250000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201503023,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(201503024)-> #{
    'skill_sort_id' => 201503,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 300000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201503024,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(201503025)-> #{
    'skill_sort_id' => 201503,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 350000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201503025,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(201503026)-> #{
    'skill_sort_id' => 201503,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 450000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201503026,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(201503027)-> #{
    'skill_sort_id' => 201503,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 550000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201503027,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(201503028)-> #{
    'skill_sort_id' => 201503,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 650000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201503028,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(201503029)-> #{
    'skill_sort_id' => 201503,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 750000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201503029,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(201503030)-> #{
    'skill_sort_id' => 201503,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 850000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201503030,
    'fangshi_base_attack' => 50.0,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(201504001)-> #{
    'skill_sort_id' => 201504,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201504001
};
get(201504002)-> #{
    'skill_sort_id' => 201504,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201504002
};
get(201504003)-> #{
    'skill_sort_id' => 201504,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201504003
};
get(201504004)-> #{
    'skill_sort_id' => 201504,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201504004
};
get(201504005)-> #{
    'skill_sort_id' => 201504,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201504005
};
get(201504006)-> #{
    'skill_sort_id' => 201504,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201504006
};
get(201504007)-> #{
    'skill_sort_id' => 201504,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201504007
};
get(201504008)-> #{
    'skill_sort_id' => 201504,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201504008
};
get(201504009)-> #{
    'skill_sort_id' => 201504,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201504009
};
get(201504010)-> #{
    'skill_sort_id' => 201504,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201504010
};
get(201504011)-> #{
    'skill_sort_id' => 201504,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201504011
};
get(201504012)-> #{
    'skill_sort_id' => 201504,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201504012
};
get(201504013)-> #{
    'skill_sort_id' => 201504,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201504013
};
get(201504014)-> #{
    'skill_sort_id' => 201504,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201504014
};
get(201504015)-> #{
    'skill_sort_id' => 201504,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201504015,
    'fangshi_base_attack_rate' => 0.05
};
get(201504016)-> #{
    'skill_sort_id' => 201504,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201504016,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(201504017)-> #{
    'skill_sort_id' => 201504,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201504017,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(201504018)-> #{
    'skill_sort_id' => 201504,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201504018,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(201504019)-> #{
    'skill_sort_id' => 201504,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201504019,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(201504020)-> #{
    'skill_sort_id' => 201504,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201504020,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(201504021)-> #{
    'skill_sort_id' => 201504,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201504021,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(201504022)-> #{
    'skill_sort_id' => 201504,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201504022,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(201504023)-> #{
    'skill_sort_id' => 201504,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201504023,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(201504024)-> #{
    'skill_sort_id' => 201504,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201504024,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(201504025)-> #{
    'skill_sort_id' => 201504,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201504025,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(201504026)-> #{
    'skill_sort_id' => 201504,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201504026,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(201504027)-> #{
    'skill_sort_id' => 201504,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201504027,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(201504028)-> #{
    'skill_sort_id' => 201504,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201504028,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(201504029)-> #{
    'skill_sort_id' => 201504,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201504029,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(201504030)-> #{
    'skill_sort_id' => 201504,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201504030,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(101502001)-> #{
    'skill_sort_id' => 101502,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101502001
};
get(101502002)-> #{
    'skill_sort_id' => 101502,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101502002
};
get(101502003)-> #{
    'skill_sort_id' => 101502,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101502003
};
get(101502004)-> #{
    'skill_sort_id' => 101502,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101502004
};
get(101502005)-> #{
    'skill_sort_id' => 101502,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101502005
};
get(101502006)-> #{
    'skill_sort_id' => 101502,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101502006
};
get(101502007)-> #{
    'skill_sort_id' => 101502,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101502007
};
get(101502008)-> #{
    'skill_sort_id' => 101502,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101502008
};
get(101502009)-> #{
    'skill_sort_id' => 101502,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101502009
};
get(101502010)-> #{
    'skill_sort_id' => 101502,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101502010
};
get(101502011)-> #{
    'skill_sort_id' => 101502,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101502011
};
get(101502012)-> #{
    'skill_sort_id' => 101502,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101502012
};
get(101502013)-> #{
    'skill_sort_id' => 101502,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101502013
};
get(101502014)-> #{
    'skill_sort_id' => 101502,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101502014
};
get(101502015)-> #{
    'skill_sort_id' => 101502,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101502015,
    'fangshi_base_attack_rate' => 0.05
};
get(101502016)-> #{
    'skill_sort_id' => 101502,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101502016,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(101502017)-> #{
    'skill_sort_id' => 101502,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101502017,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(101502018)-> #{
    'skill_sort_id' => 101502,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101502018,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(101502019)-> #{
    'skill_sort_id' => 101502,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101502019,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(101502020)-> #{
    'skill_sort_id' => 101502,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101502020,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(101502021)-> #{
    'skill_sort_id' => 101502,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101502021,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(101502022)-> #{
    'skill_sort_id' => 101502,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101502022,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(101502023)-> #{
    'skill_sort_id' => 101502,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101502023,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(101502024)-> #{
    'skill_sort_id' => 101502,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101502024,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(101502025)-> #{
    'skill_sort_id' => 101502,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101502025,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(101502026)-> #{
    'skill_sort_id' => 101502,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101502026,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(101502027)-> #{
    'skill_sort_id' => 101502,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101502027,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(101502028)-> #{
    'skill_sort_id' => 101502,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101502028,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(101502029)-> #{
    'skill_sort_id' => 101502,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101502029,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(101502030)-> #{
    'skill_sort_id' => 101502,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101502030,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(101503001)-> #{
    'skill_sort_id' => 101503,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 101503001
};
get(101503002)-> #{
    'skill_sort_id' => 101503,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 101503002
};
get(101503003)-> #{
    'skill_sort_id' => 101503,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 101503003
};
get(101503004)-> #{
    'skill_sort_id' => 101503,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 101503004
};
get(101503005)-> #{
    'skill_sort_id' => 101503,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 101503005
};
get(101503006)-> #{
    'skill_sort_id' => 101503,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 101503006
};
get(101503007)-> #{
    'skill_sort_id' => 101503,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 101503007
};
get(101503008)-> #{
    'skill_sort_id' => 101503,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 101503008
};
get(101503009)-> #{
    'skill_sort_id' => 101503,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 101503009
};
get(101503010)-> #{
    'skill_sort_id' => 101503,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 101503010
};
get(101503011)-> #{
    'skill_sort_id' => 101503,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 101503011
};
get(101503012)-> #{
    'skill_sort_id' => 101503,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 101503012
};
get(101503013)-> #{
    'skill_sort_id' => 101503,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 101503013
};
get(101503014)-> #{
    'skill_sort_id' => 101503,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 101503014
};
get(101503015)-> #{
    'skill_sort_id' => 101503,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 101503015,
    'fangshi_base_attack_rate' => 0.05
};
get(101503016)-> #{
    'skill_sort_id' => 101503,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 101503016,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(101503017)-> #{
    'skill_sort_id' => 101503,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 101503017,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(101503018)-> #{
    'skill_sort_id' => 101503,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 101503018,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(101503019)-> #{
    'skill_sort_id' => 101503,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 101503019,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(101503020)-> #{
    'skill_sort_id' => 101503,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 101503020,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(101503021)-> #{
    'skill_sort_id' => 101503,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 101503021,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(101503022)-> #{
    'skill_sort_id' => 101503,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 101503022,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(101503023)-> #{
    'skill_sort_id' => 101503,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 101503023,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(101503024)-> #{
    'skill_sort_id' => 101503,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 101503024,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(101503025)-> #{
    'skill_sort_id' => 101503,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 101503025,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(101503026)-> #{
    'skill_sort_id' => 101503,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 101503026,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(101503027)-> #{
    'skill_sort_id' => 101503,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 101503027,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(101503028)-> #{
    'skill_sort_id' => 101503,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 101503028,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(101503029)-> #{
    'skill_sort_id' => 101503,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 101503029,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(101503030)-> #{
    'skill_sort_id' => 101503,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 101503030,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(201505001)-> #{
    'skill_sort_id' => 201505,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 12000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201505001
};
get(201505002)-> #{
    'skill_sort_id' => 201505,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 24000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201505002
};
get(201505003)-> #{
    'skill_sort_id' => 201505,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 36000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201505003
};
get(201505004)-> #{
    'skill_sort_id' => 201505,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 48000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201505004
};
get(201505005)-> #{
    'skill_sort_id' => 201505,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201505005
};
get(201505006)-> #{
    'skill_sort_id' => 201505,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 72000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201505006
};
get(201505007)-> #{
    'skill_sort_id' => 201505,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 84000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201505007
};
get(201505008)-> #{
    'skill_sort_id' => 201505,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 96000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201505008
};
get(201505009)-> #{
    'skill_sort_id' => 201505,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 108000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201505009
};
get(201505010)-> #{
    'skill_sort_id' => 201505,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 120000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201505010
};
get(201505011)-> #{
    'skill_sort_id' => 201505,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 132000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201505011
};
get(201505012)-> #{
    'skill_sort_id' => 201505,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 144000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201505012
};
get(201505013)-> #{
    'skill_sort_id' => 201505,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 156000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201505013
};
get(201505014)-> #{
    'skill_sort_id' => 201505,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 168000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201505014
};
get(201505015)-> #{
    'skill_sort_id' => 201505,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 180000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201505015,
    'fangshi_base_attack_rate' => 0.05
};
get(201505016)-> #{
    'skill_sort_id' => 201505,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 192000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201505016,
    'fangshi_base_attack_rate' => 0.05,
    'fangshi_base_defence_rate' => 0.04
};
get(201505017)-> #{
    'skill_sort_id' => 201505,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 204000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201505017,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.04
};
get(201505018)-> #{
    'skill_sort_id' => 201505,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 216000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201505018,
    'fangshi_base_attack_rate' => 0.12,
    'fangshi_base_defence_rate' => 0.1
};
get(201505019)-> #{
    'skill_sort_id' => 201505,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 228000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201505019,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.1
};
get(201505020)-> #{
    'skill_sort_id' => 201505,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 240000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201505020,
    'fangshi_base_attack_rate' => 0.21,
    'fangshi_base_defence_rate' => 0.18
};
get(201505021)-> #{
    'skill_sort_id' => 201505,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 360000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201505021,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.18
};
get(201505022)-> #{
    'skill_sort_id' => 201505,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 480000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201505022,
    'fangshi_base_attack_rate' => 0.32,
    'fangshi_base_defence_rate' => 0.28
};
get(201505023)-> #{
    'skill_sort_id' => 201505,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 600000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201505023,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.28
};
get(201505024)-> #{
    'skill_sort_id' => 201505,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 720000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201505024,
    'fangshi_base_attack_rate' => 0.45,
    'fangshi_base_defence_rate' => 0.4
};
get(201505025)-> #{
    'skill_sort_id' => 201505,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 840000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201505025,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.4
};
get(201505026)-> #{
    'skill_sort_id' => 201505,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 1080000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201505026,
    'fangshi_base_attack_rate' => 0.6,
    'fangshi_base_defence_rate' => 0.5
};
get(201505027)-> #{
    'skill_sort_id' => 201505,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1320000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201505027,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.5
};
get(201505028)-> #{
    'skill_sort_id' => 201505,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1560000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201505028,
    'fangshi_base_attack_rate' => 0.7,
    'fangshi_base_defence_rate' => 0.6
};
get(201505029)-> #{
    'skill_sort_id' => 201505,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1800000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201505029,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.6
};
get(201505030)-> #{
    'skill_sort_id' => 201505,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 2040000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201505030,
    'fangshi_base_attack_rate' => 0.8,
    'fangshi_base_defence_rate' => 0.7
};
get(201601001)-> #{
    'skill_sort_id' => 201601,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201601001
};
get(201601002)-> #{
    'skill_sort_id' => 201601,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201601002
};
get(201601003)-> #{
    'skill_sort_id' => 201601,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201601003
};
get(201601004)-> #{
    'skill_sort_id' => 201601,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201601004
};
get(201601005)-> #{
    'skill_sort_id' => 201601,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201601005
};
get(201601006)-> #{
    'skill_sort_id' => 201601,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201601006
};
get(201601007)-> #{
    'skill_sort_id' => 201601,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201601007
};
get(201601008)-> #{
    'skill_sort_id' => 201601,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201601008
};
get(201601009)-> #{
    'skill_sort_id' => 201601,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201601009
};
get(201601010)-> #{
    'skill_sort_id' => 201601,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201601010
};
get(201601011)-> #{
    'skill_sort_id' => 201601,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201601011
};
get(201601012)-> #{
    'skill_sort_id' => 201601,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201601012
};
get(201601013)-> #{
    'skill_sort_id' => 201601,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201601013
};
get(201601014)-> #{
    'skill_sort_id' => 201601,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201601014
};
get(201601015)-> #{
    'skill_sort_id' => 201601,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201601015
};
get(201601016)-> #{
    'skill_sort_id' => 201601,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201601016
};
get(201601017)-> #{
    'skill_sort_id' => 201601,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201601017
};
get(201601018)-> #{
    'skill_sort_id' => 201601,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201601018
};
get(201601019)-> #{
    'skill_sort_id' => 201601,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201601019
};
get(201601020)-> #{
    'skill_sort_id' => 201601,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201601020
};
get(201601021)-> #{
    'skill_sort_id' => 201601,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201601021
};
get(201601022)-> #{
    'skill_sort_id' => 201601,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201601022
};
get(201601023)-> #{
    'skill_sort_id' => 201601,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201601023
};
get(201601024)-> #{
    'skill_sort_id' => 201601,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201601024
};
get(201601025)-> #{
    'skill_sort_id' => 201601,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201601025
};
get(201601026)-> #{
    'skill_sort_id' => 201601,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201601026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201601027)-> #{
    'skill_sort_id' => 201601,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201601027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201601028)-> #{
    'skill_sort_id' => 201601,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201601028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201601029)-> #{
    'skill_sort_id' => 201601,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201601029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201601030)-> #{
    'skill_sort_id' => 201601,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201601030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201602001)-> #{
    'skill_sort_id' => 201602,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201602001
};
get(201602002)-> #{
    'skill_sort_id' => 201602,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201602002
};
get(201602003)-> #{
    'skill_sort_id' => 201602,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201602003
};
get(201602004)-> #{
    'skill_sort_id' => 201602,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201602004
};
get(201602005)-> #{
    'skill_sort_id' => 201602,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201602005
};
get(201602006)-> #{
    'skill_sort_id' => 201602,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201602006
};
get(201602007)-> #{
    'skill_sort_id' => 201602,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201602007
};
get(201602008)-> #{
    'skill_sort_id' => 201602,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201602008
};
get(201602009)-> #{
    'skill_sort_id' => 201602,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201602009
};
get(201602010)-> #{
    'skill_sort_id' => 201602,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201602010
};
get(201602011)-> #{
    'skill_sort_id' => 201602,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201602011
};
get(201602012)-> #{
    'skill_sort_id' => 201602,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201602012
};
get(201602013)-> #{
    'skill_sort_id' => 201602,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201602013
};
get(201602014)-> #{
    'skill_sort_id' => 201602,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201602014
};
get(201602015)-> #{
    'skill_sort_id' => 201602,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201602015
};
get(201602016)-> #{
    'skill_sort_id' => 201602,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201602016
};
get(201602017)-> #{
    'skill_sort_id' => 201602,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201602017
};
get(201602018)-> #{
    'skill_sort_id' => 201602,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201602018
};
get(201602019)-> #{
    'skill_sort_id' => 201602,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201602019
};
get(201602020)-> #{
    'skill_sort_id' => 201602,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201602020
};
get(201602021)-> #{
    'skill_sort_id' => 201602,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201602021
};
get(201602022)-> #{
    'skill_sort_id' => 201602,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201602022
};
get(201602023)-> #{
    'skill_sort_id' => 201602,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201602023
};
get(201602024)-> #{
    'skill_sort_id' => 201602,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201602024
};
get(201602025)-> #{
    'skill_sort_id' => 201602,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201602025
};
get(201602026)-> #{
    'skill_sort_id' => 201602,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201602026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201602027)-> #{
    'skill_sort_id' => 201602,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201602027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201602028)-> #{
    'skill_sort_id' => 201602,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201602028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201602029)-> #{
    'skill_sort_id' => 201602,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201602029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201602030)-> #{
    'skill_sort_id' => 201602,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201602030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201603001)-> #{
    'skill_sort_id' => 201603,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201603001
};
get(201603002)-> #{
    'skill_sort_id' => 201603,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201603002
};
get(201603003)-> #{
    'skill_sort_id' => 201603,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201603003
};
get(201603004)-> #{
    'skill_sort_id' => 201603,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201603004
};
get(201603005)-> #{
    'skill_sort_id' => 201603,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201603005
};
get(201603006)-> #{
    'skill_sort_id' => 201603,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201603006
};
get(201603007)-> #{
    'skill_sort_id' => 201603,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201603007
};
get(201603008)-> #{
    'skill_sort_id' => 201603,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201603008
};
get(201603009)-> #{
    'skill_sort_id' => 201603,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201603009
};
get(201603010)-> #{
    'skill_sort_id' => 201603,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201603010
};
get(201603011)-> #{
    'skill_sort_id' => 201603,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201603011
};
get(201603012)-> #{
    'skill_sort_id' => 201603,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201603012
};
get(201603013)-> #{
    'skill_sort_id' => 201603,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201603013
};
get(201603014)-> #{
    'skill_sort_id' => 201603,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201603014
};
get(201603015)-> #{
    'skill_sort_id' => 201603,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201603015
};
get(201603016)-> #{
    'skill_sort_id' => 201603,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201603016
};
get(201603017)-> #{
    'skill_sort_id' => 201603,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201603017
};
get(201603018)-> #{
    'skill_sort_id' => 201603,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201603018
};
get(201603019)-> #{
    'skill_sort_id' => 201603,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201603019
};
get(201603020)-> #{
    'skill_sort_id' => 201603,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201603020
};
get(201603021)-> #{
    'skill_sort_id' => 201603,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201603021
};
get(201603022)-> #{
    'skill_sort_id' => 201603,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201603022
};
get(201603023)-> #{
    'skill_sort_id' => 201603,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201603023
};
get(201603024)-> #{
    'skill_sort_id' => 201603,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201603024
};
get(201603025)-> #{
    'skill_sort_id' => 201603,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201603025
};
get(201603026)-> #{
    'skill_sort_id' => 201603,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201603026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201603027)-> #{
    'skill_sort_id' => 201603,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201603027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201603028)-> #{
    'skill_sort_id' => 201603,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201603028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201603029)-> #{
    'skill_sort_id' => 201603,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201603029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201603030)-> #{
    'skill_sort_id' => 201603,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201603030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201604001)-> #{
    'skill_sort_id' => 201604,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201604001
};
get(201604002)-> #{
    'skill_sort_id' => 201604,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201604002
};
get(201604003)-> #{
    'skill_sort_id' => 201604,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201604003
};
get(201604004)-> #{
    'skill_sort_id' => 201604,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201604004
};
get(201604005)-> #{
    'skill_sort_id' => 201604,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201604005
};
get(201604006)-> #{
    'skill_sort_id' => 201604,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201604006
};
get(201604007)-> #{
    'skill_sort_id' => 201604,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201604007
};
get(201604008)-> #{
    'skill_sort_id' => 201604,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201604008
};
get(201604009)-> #{
    'skill_sort_id' => 201604,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201604009
};
get(201604010)-> #{
    'skill_sort_id' => 201604,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201604010
};
get(201604011)-> #{
    'skill_sort_id' => 201604,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201604011
};
get(201604012)-> #{
    'skill_sort_id' => 201604,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201604012
};
get(201604013)-> #{
    'skill_sort_id' => 201604,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201604013
};
get(201604014)-> #{
    'skill_sort_id' => 201604,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201604014
};
get(201604015)-> #{
    'skill_sort_id' => 201604,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201604015
};
get(201604016)-> #{
    'skill_sort_id' => 201604,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201604016
};
get(201604017)-> #{
    'skill_sort_id' => 201604,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201604017
};
get(201604018)-> #{
    'skill_sort_id' => 201604,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201604018
};
get(201604019)-> #{
    'skill_sort_id' => 201604,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201604019
};
get(201604020)-> #{
    'skill_sort_id' => 201604,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201604020
};
get(201604021)-> #{
    'skill_sort_id' => 201604,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201604021
};
get(201604022)-> #{
    'skill_sort_id' => 201604,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201604022
};
get(201604023)-> #{
    'skill_sort_id' => 201604,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201604023
};
get(201604024)-> #{
    'skill_sort_id' => 201604,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201604024
};
get(201604025)-> #{
    'skill_sort_id' => 201604,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201604025
};
get(201604026)-> #{
    'skill_sort_id' => 201604,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201604026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201604027)-> #{
    'skill_sort_id' => 201604,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201604027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201604028)-> #{
    'skill_sort_id' => 201604,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201604028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201604029)-> #{
    'skill_sort_id' => 201604,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201604029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201604030)-> #{
    'skill_sort_id' => 201604,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201604030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201605001)-> #{
    'skill_sort_id' => 201605,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 40000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'hero_strength' => 1
};
get(201605002)-> #{
    'skill_sort_id' => 201605,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 80000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'hero_strength' => 2
};
get(201605003)-> #{
    'skill_sort_id' => 201605,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 120000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'hero_strength' => 3
};
get(201605004)-> #{
    'skill_sort_id' => 201605,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 160000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'hero_strength' => 4
};
get(201605005)-> #{
    'skill_sort_id' => 201605,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 200000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'hero_strength' => 5
};
get(201605006)-> #{
    'skill_sort_id' => 201605,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 240000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'hero_strength' => 6
};
get(201605007)-> #{
    'skill_sort_id' => 201605,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 900000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'bingzhong_base_troops_rate' => 0.1,
    'qianjun_base_attack' => 4.0,
    'hero_strength' => 6
};
get(201605008)-> #{
    'skill_sort_id' => 201605,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 1100000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1,
    'qianjun_base_attack' => 8.0,
    'hero_strength' => 6
};
get(201605009)-> #{
    'skill_sort_id' => 201605,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 1300000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2,
    'qianjun_base_attack' => 12.0,
    'hero_strength' => 6
};
get(201605010)-> #{
    'skill_sort_id' => 201605,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 1500000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2,
    'qianjun_base_attack' => 16.0,
    'hero_strength' => 6
};
get(201605011)-> #{
    'skill_sort_id' => 201605,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 1700000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3,
    'qianjun_base_attack' => 20.0,
    'hero_strength' => 6
};
get(201605012)-> #{
    'skill_sort_id' => 201605,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 1900000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'qianjun_base_attack' => 24.0,
    'hero_strength' => 6
};
get(201605013)-> #{
    'skill_sort_id' => 201605,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'qianjun_base_attack' => 28.0,
    'hero_strength' => 6
};
get(201605014)-> #{
    'skill_sort_id' => 201605,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'qianjun_base_attack' => 32.0,
    'hero_strength' => 6
};
get(201605015)-> #{
    'skill_sort_id' => 201605,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'qianjun_base_attack' => 36.0,
    'hero_strength' => 6
};
get(201605016)-> #{
    'skill_sort_id' => 201605,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'qianjun_base_attack' => 40.0,
    'hero_strength' => 6
};
get(201605017)-> #{
    'skill_sort_id' => 201605,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'qianjun_base_attack' => 44.0,
    'hero_strength' => 6
};
get(201605018)-> #{
    'skill_sort_id' => 201605,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'qianjun_base_attack' => 48.0,
    'hero_strength' => 6
};
get(201605019)-> #{
    'skill_sort_id' => 201605,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'qianjun_base_attack' => 52.0,
    'hero_strength' => 6
};
get(201605020)-> #{
    'skill_sort_id' => 201605,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'qianjun_base_attack' => 56.0,
    'hero_strength' => 6
};
get(201605021)-> #{
    'skill_sort_id' => 201605,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'qianjun_base_attack' => 60.0,
    'hero_strength' => 6
};
get(201605022)-> #{
    'skill_sort_id' => 201605,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'qianjun_base_attack' => 64.0,
    'hero_strength' => 6
};
get(201605023)-> #{
    'skill_sort_id' => 201605,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'qianjun_base_attack' => 68.0,
    'hero_strength' => 6
};
get(201605024)-> #{
    'skill_sort_id' => 201605,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'qianjun_base_attack' => 72.0,
    'hero_strength' => 6
};
get(201605025)-> #{
    'skill_sort_id' => 201605,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'qianjun_base_attack' => 76.0,
    'hero_strength' => 6
};
get(201605026)-> #{
    'skill_sort_id' => 201605,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'qianjun_base_attack' => 80.0,
    'hero_strength' => 6
};
get(201605027)-> #{
    'skill_sort_id' => 201605,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'qianjun_base_attack' => 84.0,
    'hero_strength' => 6
};
get(201605028)-> #{
    'skill_sort_id' => 201605,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'qianjun_base_attack' => 88.0,
    'hero_strength' => 6
};
get(201605029)-> #{
    'skill_sort_id' => 201605,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'qianjun_base_attack' => 92.0,
    'hero_strength' => 6
};
get(201605030)-> #{
    'skill_sort_id' => 201605,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'qianjun_base_attack' => 96.0,
    'hero_strength' => 6
};
get(201606001)-> #{
    'skill_sort_id' => 201606,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 40000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'hero_intelect' => 1
};
get(201606002)-> #{
    'skill_sort_id' => 201606,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 80000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'hero_intelect' => 2
};
get(201606003)-> #{
    'skill_sort_id' => 201606,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 120000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'hero_intelect' => 3
};
get(201606004)-> #{
    'skill_sort_id' => 201606,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 160000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'hero_intelect' => 4
};
get(201606005)-> #{
    'skill_sort_id' => 201606,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 200000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'hero_intelect' => 5
};
get(201606006)-> #{
    'skill_sort_id' => 201606,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 240000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'hero_intelect' => 6
};
get(201606007)-> #{
    'skill_sort_id' => 201606,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 900000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'bingzhong_base_troops_rate' => 0.1,
    'houjun_base_attack' => 4.0,
    'hero_intelect' => 6
};
get(201606008)-> #{
    'skill_sort_id' => 201606,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 1100000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1,
    'houjun_base_attack' => 8.0,
    'hero_intelect' => 6
};
get(201606009)-> #{
    'skill_sort_id' => 201606,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 1300000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2,
    'houjun_base_attack' => 12.0,
    'hero_intelect' => 6
};
get(201606010)-> #{
    'skill_sort_id' => 201606,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 1500000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2,
    'houjun_base_attack' => 16.0,
    'hero_intelect' => 6
};
get(201606011)-> #{
    'skill_sort_id' => 201606,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 1700000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3,
    'houjun_base_attack' => 20.0,
    'hero_intelect' => 6
};
get(201606012)-> #{
    'skill_sort_id' => 201606,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 1900000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'houjun_base_attack' => 24.0,
    'hero_intelect' => 6
};
get(201606013)-> #{
    'skill_sort_id' => 201606,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'houjun_base_attack' => 28.0,
    'hero_intelect' => 6
};
get(201606014)-> #{
    'skill_sort_id' => 201606,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'houjun_base_attack' => 32.0,
    'hero_intelect' => 6
};
get(201606015)-> #{
    'skill_sort_id' => 201606,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'houjun_base_attack' => 36.0,
    'hero_intelect' => 6
};
get(201606016)-> #{
    'skill_sort_id' => 201606,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'houjun_base_attack' => 40.0,
    'hero_intelect' => 6
};
get(201606017)-> #{
    'skill_sort_id' => 201606,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'houjun_base_attack' => 44.0,
    'hero_intelect' => 6
};
get(201606018)-> #{
    'skill_sort_id' => 201606,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'houjun_base_attack' => 48.0,
    'hero_intelect' => 6
};
get(201606019)-> #{
    'skill_sort_id' => 201606,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'houjun_base_attack' => 52.0,
    'hero_intelect' => 6
};
get(201606020)-> #{
    'skill_sort_id' => 201606,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'houjun_base_attack' => 56.0,
    'hero_intelect' => 6
};
get(201606021)-> #{
    'skill_sort_id' => 201606,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'houjun_base_attack' => 60.0,
    'hero_intelect' => 6
};
get(201606022)-> #{
    'skill_sort_id' => 201606,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'houjun_base_attack' => 64.0,
    'hero_intelect' => 6
};
get(201606023)-> #{
    'skill_sort_id' => 201606,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'houjun_base_attack' => 68.0,
    'hero_intelect' => 6
};
get(201606024)-> #{
    'skill_sort_id' => 201606,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'houjun_base_attack' => 72.0,
    'hero_intelect' => 6
};
get(201606025)-> #{
    'skill_sort_id' => 201606,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'houjun_base_attack' => 76.0,
    'hero_intelect' => 6
};
get(201606026)-> #{
    'skill_sort_id' => 201606,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'houjun_base_attack' => 80.0,
    'hero_intelect' => 6
};
get(201606027)-> #{
    'skill_sort_id' => 201606,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'houjun_base_attack' => 84.0,
    'hero_intelect' => 6
};
get(201606028)-> #{
    'skill_sort_id' => 201606,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'houjun_base_attack' => 88.0,
    'hero_intelect' => 6
};
get(201606029)-> #{
    'skill_sort_id' => 201606,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'houjun_base_attack' => 92.0,
    'hero_intelect' => 6
};
get(201606030)-> #{
    'skill_sort_id' => 201606,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'houjun_base_attack' => 96.0,
    'hero_intelect' => 6
};
get(201607001)-> #{
    'skill_sort_id' => 201607,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 40000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'hero_spirit' => 1
};
get(201607002)-> #{
    'skill_sort_id' => 201607,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 80000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'hero_spirit' => 2
};
get(201607003)-> #{
    'skill_sort_id' => 201607,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 120000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'hero_spirit' => 3
};
get(201607004)-> #{
    'skill_sort_id' => 201607,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 160000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'hero_spirit' => 4
};
get(201607005)-> #{
    'skill_sort_id' => 201607,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 200000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'hero_spirit' => 5
};
get(201607006)-> #{
    'skill_sort_id' => 201607,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 240000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'hero_spirit' => 6
};
get(201607007)-> #{
    'skill_sort_id' => 201607,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 900000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'bingzhong_base_troops_rate' => 0.1,
    'bingzhong_base_defence' => 2.0,
    'hero_spirit' => 6
};
get(201607008)-> #{
    'skill_sort_id' => 201607,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 1100000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1,
    'bingzhong_base_defence' => 4.0,
    'hero_spirit' => 6
};
get(201607009)-> #{
    'skill_sort_id' => 201607,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 1300000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2,
    'bingzhong_base_defence' => 6.0,
    'hero_spirit' => 6
};
get(201607010)-> #{
    'skill_sort_id' => 201607,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 1500000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2,
    'bingzhong_base_defence' => 8.0,
    'hero_spirit' => 6
};
get(201607011)-> #{
    'skill_sort_id' => 201607,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 1700000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3,
    'bingzhong_base_defence' => 10.0,
    'hero_spirit' => 6
};
get(201607012)-> #{
    'skill_sort_id' => 201607,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 1900000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'bingzhong_base_defence' => 12.0,
    'hero_spirit' => 6
};
get(201607013)-> #{
    'skill_sort_id' => 201607,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'bingzhong_base_defence' => 14.0,
    'hero_spirit' => 6
};
get(201607014)-> #{
    'skill_sort_id' => 201607,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'bingzhong_base_defence' => 16.0,
    'hero_spirit' => 6
};
get(201607015)-> #{
    'skill_sort_id' => 201607,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'bingzhong_base_defence' => 18.0,
    'hero_spirit' => 6
};
get(201607016)-> #{
    'skill_sort_id' => 201607,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'bingzhong_base_defence' => 20.0,
    'hero_spirit' => 6
};
get(201607017)-> #{
    'skill_sort_id' => 201607,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'bingzhong_base_defence' => 22.0,
    'hero_spirit' => 6
};
get(201607018)-> #{
    'skill_sort_id' => 201607,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'bingzhong_base_defence' => 24.0,
    'hero_spirit' => 6
};
get(201607019)-> #{
    'skill_sort_id' => 201607,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'bingzhong_base_defence' => 26.0,
    'hero_spirit' => 6
};
get(201607020)-> #{
    'skill_sort_id' => 201607,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'bingzhong_base_defence' => 28.0,
    'hero_spirit' => 6
};
get(201607021)-> #{
    'skill_sort_id' => 201607,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'bingzhong_base_defence' => 30.0,
    'hero_spirit' => 6
};
get(201607022)-> #{
    'skill_sort_id' => 201607,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'bingzhong_base_defence' => 32.0,
    'hero_spirit' => 6
};
get(201607023)-> #{
    'skill_sort_id' => 201607,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'bingzhong_base_defence' => 34.0,
    'hero_spirit' => 6
};
get(201607024)-> #{
    'skill_sort_id' => 201607,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'bingzhong_base_defence' => 36.0,
    'hero_spirit' => 6
};
get(201607025)-> #{
    'skill_sort_id' => 201607,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'bingzhong_base_defence' => 38.0,
    'hero_spirit' => 6
};
get(201607026)-> #{
    'skill_sort_id' => 201607,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'bingzhong_base_defence' => 40.0,
    'hero_spirit' => 6
};
get(201607027)-> #{
    'skill_sort_id' => 201607,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'bingzhong_base_defence' => 42.0,
    'hero_spirit' => 6
};
get(201607028)-> #{
    'skill_sort_id' => 201607,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'bingzhong_base_defence' => 44.0,
    'hero_spirit' => 6
};
get(201607029)-> #{
    'skill_sort_id' => 201607,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'bingzhong_base_defence' => 46.0,
    'hero_spirit' => 6
};
get(201607030)-> #{
    'skill_sort_id' => 201607,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'bingzhong_base_defence' => 48.0,
    'hero_spirit' => 6
};
get(201608001)-> #{
    'skill_sort_id' => 201608,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 40000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'hero_leadership' => 1
};
get(201608002)-> #{
    'skill_sort_id' => 201608,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 80000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'hero_leadership' => 2
};
get(201608003)-> #{
    'skill_sort_id' => 201608,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 120000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'hero_leadership' => 3
};
get(201608004)-> #{
    'skill_sort_id' => 201608,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 160000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'hero_leadership' => 4
};
get(201608005)-> #{
    'skill_sort_id' => 201608,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 200000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'hero_leadership' => 5
};
get(201608006)-> #{
    'skill_sort_id' => 201608,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 240000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'hero_leadership' => 6
};
get(201608007)-> #{
    'skill_sort_id' => 201608,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 900000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'bingzhong_base_troops_rate' => 0.1,
    'bingzhong_base_troops' => 5.0,
    'hero_leadership' => 6
};
get(201608008)-> #{
    'skill_sort_id' => 201608,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 1100000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1,
    'bingzhong_base_troops' => 10.0,
    'hero_leadership' => 6
};
get(201608009)-> #{
    'skill_sort_id' => 201608,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 1300000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2,
    'bingzhong_base_troops' => 15.0,
    'hero_leadership' => 6
};
get(201608010)-> #{
    'skill_sort_id' => 201608,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 1500000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2,
    'bingzhong_base_troops' => 20.0,
    'hero_leadership' => 6
};
get(201608011)-> #{
    'skill_sort_id' => 201608,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 1700000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3,
    'bingzhong_base_troops' => 25.0,
    'hero_leadership' => 6
};
get(201608012)-> #{
    'skill_sort_id' => 201608,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 1900000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'bingzhong_base_troops' => 30.0,
    'hero_leadership' => 6
};
get(201608013)-> #{
    'skill_sort_id' => 201608,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'bingzhong_base_troops' => 35.0,
    'hero_leadership' => 6
};
get(201608014)-> #{
    'skill_sort_id' => 201608,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'bingzhong_base_troops' => 40.0,
    'hero_leadership' => 6
};
get(201608015)-> #{
    'skill_sort_id' => 201608,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'bingzhong_base_troops' => 45.0,
    'hero_leadership' => 6
};
get(201608016)-> #{
    'skill_sort_id' => 201608,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'bingzhong_base_troops' => 50.0,
    'hero_leadership' => 6
};
get(201608017)-> #{
    'skill_sort_id' => 201608,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'bingzhong_base_troops' => 55.0,
    'hero_leadership' => 6
};
get(201608018)-> #{
    'skill_sort_id' => 201608,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'bingzhong_base_troops' => 60.0,
    'hero_leadership' => 6
};
get(201608019)-> #{
    'skill_sort_id' => 201608,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'bingzhong_base_troops' => 65.0,
    'hero_leadership' => 6
};
get(201608020)-> #{
    'skill_sort_id' => 201608,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'bingzhong_base_troops' => 70.0,
    'hero_leadership' => 6
};
get(201608021)-> #{
    'skill_sort_id' => 201608,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 250,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'bingzhong_base_troops' => 75.0,
    'hero_leadership' => 6
};
get(201608022)-> #{
    'skill_sort_id' => 201608,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'bingzhong_base_troops' => 80.0,
    'hero_leadership' => 6
};
get(201608023)-> #{
    'skill_sort_id' => 201608,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 350,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'bingzhong_base_troops' => 85.0,
    'hero_leadership' => 6
};
get(201608024)-> #{
    'skill_sort_id' => 201608,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 400,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'bingzhong_base_troops' => 90.0,
    'hero_leadership' => 6
};
get(201608025)-> #{
    'skill_sort_id' => 201608,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'bingzhong_base_troops' => 95.0,
    'hero_leadership' => 6
};
get(201608026)-> #{
    'skill_sort_id' => 201608,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'bingzhong_base_troops' => 100.0,
    'hero_leadership' => 6
};
get(201608027)-> #{
    'skill_sort_id' => 201608,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'bingzhong_base_troops' => 105.0,
    'hero_leadership' => 6
};
get(201608028)-> #{
    'skill_sort_id' => 201608,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'bingzhong_base_troops' => 110.0,
    'hero_leadership' => 6
};
get(201608029)-> #{
    'skill_sort_id' => 201608,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'bingzhong_base_troops' => 115.0,
    'hero_leadership' => 6
};
get(201608030)-> #{
    'skill_sort_id' => 201608,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1700000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'bingzhong_base_troops' => 120.0,
    'hero_leadership' => 6
};
get(201609001)-> #{
    'skill_sort_id' => 201609,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'qianjun_base_troops' => 13.0
};
get(201609002)-> #{
    'skill_sort_id' => 201609,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'qianjun_base_troops' => 26.0
};
get(201609003)-> #{
    'skill_sort_id' => 201609,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'qianjun_base_troops' => 39.0
};
get(201609004)-> #{
    'skill_sort_id' => 201609,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'qianjun_base_troops' => 52.0
};
get(201609005)-> #{
    'skill_sort_id' => 201609,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'qianjun_base_troops' => 65.0
};
get(201609006)-> #{
    'skill_sort_id' => 201609,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'qianjun_base_troops' => 78.0
};
get(201609007)-> #{
    'skill_sort_id' => 201609,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'qianjun_base_troops' => 91.0
};
get(201609008)-> #{
    'skill_sort_id' => 201609,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'qianjun_base_troops' => 104.0
};
get(201609009)-> #{
    'skill_sort_id' => 201609,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'qianjun_base_troops' => 117.0
};
get(201609010)-> #{
    'skill_sort_id' => 201609,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'qianjun_base_troops' => 130.0
};
get(201609011)-> #{
    'skill_sort_id' => 201609,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'qianjun_base_troops' => 143.0
};
get(201609012)-> #{
    'skill_sort_id' => 201609,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'qianjun_base_troops' => 156.0
};
get(201609013)-> #{
    'skill_sort_id' => 201609,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'qianjun_base_troops' => 169.0
};
get(201609014)-> #{
    'skill_sort_id' => 201609,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'qianjun_base_troops' => 182.0
};
get(201609015)-> #{
    'skill_sort_id' => 201609,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'qianjun_base_troops' => 195.0
};
get(201609016)-> #{
    'skill_sort_id' => 201609,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'qianjun_base_troops' => 208.0
};
get(201609017)-> #{
    'skill_sort_id' => 201609,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'qianjun_base_troops' => 221.0
};
get(201609018)-> #{
    'skill_sort_id' => 201609,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'qianjun_base_troops' => 234.0
};
get(201609019)-> #{
    'skill_sort_id' => 201609,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'qianjun_base_troops' => 247.0
};
get(201609020)-> #{
    'skill_sort_id' => 201609,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'qianjun_base_troops' => 260.0
};
get(201609021)-> #{
    'skill_sort_id' => 201609,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'qianjun_base_troops' => 273.0,
    'bingzhong_base_troops_rate' => 0.1
};
get(201609022)-> #{
    'skill_sort_id' => 201609,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'qianjun_base_troops' => 286.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201609023)-> #{
    'skill_sort_id' => 201609,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'qianjun_base_troops' => 299.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201609024)-> #{
    'skill_sort_id' => 201609,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'qianjun_base_troops' => 312.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201609025)-> #{
    'skill_sort_id' => 201609,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'qianjun_base_troops' => 325.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201610001)-> #{
    'skill_sort_id' => 201610,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'houjun_base_troops' => 13.0
};
get(201610002)-> #{
    'skill_sort_id' => 201610,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'houjun_base_troops' => 26.0
};
get(201610003)-> #{
    'skill_sort_id' => 201610,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'houjun_base_troops' => 39.0
};
get(201610004)-> #{
    'skill_sort_id' => 201610,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'houjun_base_troops' => 52.0
};
get(201610005)-> #{
    'skill_sort_id' => 201610,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'houjun_base_troops' => 65.0
};
get(201610006)-> #{
    'skill_sort_id' => 201610,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'houjun_base_troops' => 78.0
};
get(201610007)-> #{
    'skill_sort_id' => 201610,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'houjun_base_troops' => 91.0
};
get(201610008)-> #{
    'skill_sort_id' => 201610,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'houjun_base_troops' => 104.0
};
get(201610009)-> #{
    'skill_sort_id' => 201610,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'houjun_base_troops' => 117.0
};
get(201610010)-> #{
    'skill_sort_id' => 201610,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'houjun_base_troops' => 130.0
};
get(201610011)-> #{
    'skill_sort_id' => 201610,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'houjun_base_troops' => 143.0
};
get(201610012)-> #{
    'skill_sort_id' => 201610,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'houjun_base_troops' => 156.0
};
get(201610013)-> #{
    'skill_sort_id' => 201610,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'houjun_base_troops' => 169.0
};
get(201610014)-> #{
    'skill_sort_id' => 201610,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'houjun_base_troops' => 182.0
};
get(201610015)-> #{
    'skill_sort_id' => 201610,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'houjun_base_troops' => 195.0
};
get(201610016)-> #{
    'skill_sort_id' => 201610,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'houjun_base_troops' => 208.0
};
get(201610017)-> #{
    'skill_sort_id' => 201610,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'houjun_base_troops' => 221.0
};
get(201610018)-> #{
    'skill_sort_id' => 201610,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'houjun_base_troops' => 234.0
};
get(201610019)-> #{
    'skill_sort_id' => 201610,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'houjun_base_troops' => 247.0
};
get(201610020)-> #{
    'skill_sort_id' => 201610,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'houjun_base_troops' => 260.0
};
get(201610021)-> #{
    'skill_sort_id' => 201610,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'houjun_base_troops' => 273.0,
    'bingzhong_base_troops_rate' => 0.1
};
get(201610022)-> #{
    'skill_sort_id' => 201610,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'houjun_base_troops' => 286.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201610023)-> #{
    'skill_sort_id' => 201610,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'houjun_base_troops' => 299.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201610024)-> #{
    'skill_sort_id' => 201610,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'houjun_base_troops' => 312.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201610025)-> #{
    'skill_sort_id' => 201610,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'houjun_base_troops' => 325.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201611001)-> #{
    'skill_sort_id' => 201611,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'qianjun_base_defence' => 3.0
};
get(201611002)-> #{
    'skill_sort_id' => 201611,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'qianjun_base_defence' => 6.0
};
get(201611003)-> #{
    'skill_sort_id' => 201611,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'qianjun_base_defence' => 9.0
};
get(201611004)-> #{
    'skill_sort_id' => 201611,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'qianjun_base_defence' => 12.0
};
get(201611005)-> #{
    'skill_sort_id' => 201611,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'qianjun_base_defence' => 15.0
};
get(201611006)-> #{
    'skill_sort_id' => 201611,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'qianjun_base_defence' => 18.0
};
get(201611007)-> #{
    'skill_sort_id' => 201611,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'qianjun_base_defence' => 21.0
};
get(201611008)-> #{
    'skill_sort_id' => 201611,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'qianjun_base_defence' => 24.0
};
get(201611009)-> #{
    'skill_sort_id' => 201611,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'qianjun_base_defence' => 27.0
};
get(201611010)-> #{
    'skill_sort_id' => 201611,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'qianjun_base_defence' => 30.0
};
get(201611011)-> #{
    'skill_sort_id' => 201611,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'qianjun_base_defence' => 33.0
};
get(201611012)-> #{
    'skill_sort_id' => 201611,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'qianjun_base_defence' => 36.0
};
get(201611013)-> #{
    'skill_sort_id' => 201611,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'qianjun_base_defence' => 39.0
};
get(201611014)-> #{
    'skill_sort_id' => 201611,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'qianjun_base_defence' => 42.0
};
get(201611015)-> #{
    'skill_sort_id' => 201611,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'qianjun_base_defence' => 45.0
};
get(201611016)-> #{
    'skill_sort_id' => 201611,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'qianjun_base_defence' => 48.0
};
get(201611017)-> #{
    'skill_sort_id' => 201611,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'qianjun_base_defence' => 51.0
};
get(201611018)-> #{
    'skill_sort_id' => 201611,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'qianjun_base_defence' => 54.0
};
get(201611019)-> #{
    'skill_sort_id' => 201611,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'qianjun_base_defence' => 57.0
};
get(201611020)-> #{
    'skill_sort_id' => 201611,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'qianjun_base_defence' => 60.0
};
get(201611021)-> #{
    'skill_sort_id' => 201611,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'qianjun_base_defence' => 63.0,
    'bingzhong_base_troops_rate' => 0.1
};
get(201611022)-> #{
    'skill_sort_id' => 201611,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'qianjun_base_defence' => 66.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201611023)-> #{
    'skill_sort_id' => 201611,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'qianjun_base_defence' => 69.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201611024)-> #{
    'skill_sort_id' => 201611,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'qianjun_base_defence' => 72.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201611025)-> #{
    'skill_sort_id' => 201611,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'qianjun_base_defence' => 75.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201612001)-> #{
    'skill_sort_id' => 201612,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'houjun_base_defence' => 3.0
};
get(201612002)-> #{
    'skill_sort_id' => 201612,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'houjun_base_defence' => 6.0
};
get(201612003)-> #{
    'skill_sort_id' => 201612,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'houjun_base_defence' => 9.0
};
get(201612004)-> #{
    'skill_sort_id' => 201612,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'houjun_base_defence' => 12.0
};
get(201612005)-> #{
    'skill_sort_id' => 201612,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'houjun_base_defence' => 15.0
};
get(201612006)-> #{
    'skill_sort_id' => 201612,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'houjun_base_defence' => 18.0
};
get(201612007)-> #{
    'skill_sort_id' => 201612,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'houjun_base_defence' => 21.0
};
get(201612008)-> #{
    'skill_sort_id' => 201612,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'houjun_base_defence' => 24.0
};
get(201612009)-> #{
    'skill_sort_id' => 201612,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'houjun_base_defence' => 27.0
};
get(201612010)-> #{
    'skill_sort_id' => 201612,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'houjun_base_defence' => 30.0
};
get(201612011)-> #{
    'skill_sort_id' => 201612,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'houjun_base_defence' => 33.0
};
get(201612012)-> #{
    'skill_sort_id' => 201612,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'houjun_base_defence' => 36.0
};
get(201612013)-> #{
    'skill_sort_id' => 201612,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'houjun_base_defence' => 39.0
};
get(201612014)-> #{
    'skill_sort_id' => 201612,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'houjun_base_defence' => 42.0
};
get(201612015)-> #{
    'skill_sort_id' => 201612,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'houjun_base_defence' => 45.0
};
get(201612016)-> #{
    'skill_sort_id' => 201612,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'houjun_base_defence' => 48.0
};
get(201612017)-> #{
    'skill_sort_id' => 201612,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'houjun_base_defence' => 51.0
};
get(201612018)-> #{
    'skill_sort_id' => 201612,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'houjun_base_defence' => 54.0
};
get(201612019)-> #{
    'skill_sort_id' => 201612,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'houjun_base_defence' => 57.0
};
get(201612020)-> #{
    'skill_sort_id' => 201612,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'houjun_base_defence' => 60.0
};
get(201612021)-> #{
    'skill_sort_id' => 201612,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'houjun_base_defence' => 63.0,
    'bingzhong_base_troops_rate' => 0.1
};
get(201612022)-> #{
    'skill_sort_id' => 201612,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'houjun_base_defence' => 66.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201612023)-> #{
    'skill_sort_id' => 201612,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'houjun_base_defence' => 69.0,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201612024)-> #{
    'skill_sort_id' => 201612,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'houjun_base_defence' => 72.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201612025)-> #{
    'skill_sort_id' => 201612,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'houjun_base_defence' => 75.0,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201613001)-> #{
    'skill_sort_id' => 201613,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201613001
};
get(201613002)-> #{
    'skill_sort_id' => 201613,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201613002
};
get(201613003)-> #{
    'skill_sort_id' => 201613,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201613003
};
get(201613004)-> #{
    'skill_sort_id' => 201613,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201613004
};
get(201613005)-> #{
    'skill_sort_id' => 201613,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201613005
};
get(201613006)-> #{
    'skill_sort_id' => 201613,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201613006
};
get(201613007)-> #{
    'skill_sort_id' => 201613,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201613007
};
get(201613008)-> #{
    'skill_sort_id' => 201613,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201613008
};
get(201613009)-> #{
    'skill_sort_id' => 201613,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201613009
};
get(201613010)-> #{
    'skill_sort_id' => 201613,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201613010
};
get(201613011)-> #{
    'skill_sort_id' => 201613,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201613011
};
get(201613012)-> #{
    'skill_sort_id' => 201613,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201613012
};
get(201613013)-> #{
    'skill_sort_id' => 201613,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201613013
};
get(201613014)-> #{
    'skill_sort_id' => 201613,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201613014
};
get(201613015)-> #{
    'skill_sort_id' => 201613,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201613015
};
get(201613016)-> #{
    'skill_sort_id' => 201613,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201613016
};
get(201613017)-> #{
    'skill_sort_id' => 201613,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201613017
};
get(201613018)-> #{
    'skill_sort_id' => 201613,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201613018
};
get(201613019)-> #{
    'skill_sort_id' => 201613,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201613019
};
get(201613020)-> #{
    'skill_sort_id' => 201613,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201613020
};
get(201613021)-> #{
    'skill_sort_id' => 201613,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201613021
};
get(201613022)-> #{
    'skill_sort_id' => 201613,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201613022
};
get(201613023)-> #{
    'skill_sort_id' => 201613,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201613023
};
get(201613024)-> #{
    'skill_sort_id' => 201613,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201613024
};
get(201613025)-> #{
    'skill_sort_id' => 201613,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201613025
};
get(201613026)-> #{
    'skill_sort_id' => 201613,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201613026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201613027)-> #{
    'skill_sort_id' => 201613,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201613027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201613028)-> #{
    'skill_sort_id' => 201613,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201613028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201613029)-> #{
    'skill_sort_id' => 201613,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201613029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201613030)-> #{
    'skill_sort_id' => 201613,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201613030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201614001)-> #{
    'skill_sort_id' => 201614,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'qianjun_base_attack' => 2.0,
    'houjun_base_attack' => 2.0
};
get(201614002)-> #{
    'skill_sort_id' => 201614,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'qianjun_base_attack' => 4.0,
    'houjun_base_attack' => 4.0
};
get(201614003)-> #{
    'skill_sort_id' => 201614,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'qianjun_base_attack' => 6.0,
    'houjun_base_attack' => 6.0
};
get(201614004)-> #{
    'skill_sort_id' => 201614,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'qianjun_base_attack' => 8.0,
    'houjun_base_attack' => 8.0
};
get(201614005)-> #{
    'skill_sort_id' => 201614,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'qianjun_base_attack' => 10.0,
    'houjun_base_attack' => 10.0
};
get(201614006)-> #{
    'skill_sort_id' => 201614,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'qianjun_base_attack' => 12.0,
    'houjun_base_attack' => 12.0
};
get(201614007)-> #{
    'skill_sort_id' => 201614,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'qianjun_base_attack' => 14.0,
    'houjun_base_attack' => 14.0
};
get(201614008)-> #{
    'skill_sort_id' => 201614,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'qianjun_base_attack' => 16.0,
    'houjun_base_attack' => 16.0
};
get(201614009)-> #{
    'skill_sort_id' => 201614,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'qianjun_base_attack' => 18.0,
    'houjun_base_attack' => 18.0
};
get(201614010)-> #{
    'skill_sort_id' => 201614,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'qianjun_base_attack' => 20.0,
    'houjun_base_attack' => 20.0
};
get(201614011)-> #{
    'skill_sort_id' => 201614,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'qianjun_base_attack' => 22.0,
    'houjun_base_attack' => 22.0
};
get(201614012)-> #{
    'skill_sort_id' => 201614,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'qianjun_base_attack' => 24.0,
    'houjun_base_attack' => 24.0
};
get(201614013)-> #{
    'skill_sort_id' => 201614,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'qianjun_base_attack' => 26.0,
    'houjun_base_attack' => 26.0
};
get(201614014)-> #{
    'skill_sort_id' => 201614,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'qianjun_base_attack' => 28.0,
    'houjun_base_attack' => 28.0
};
get(201614015)-> #{
    'skill_sort_id' => 201614,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'qianjun_base_attack' => 30.0,
    'houjun_base_attack' => 30.0
};
get(201614016)-> #{
    'skill_sort_id' => 201614,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'qianjun_base_attack' => 32.0,
    'houjun_base_attack' => 32.0
};
get(201614017)-> #{
    'skill_sort_id' => 201614,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'qianjun_base_attack' => 34.0,
    'houjun_base_attack' => 34.0
};
get(201614018)-> #{
    'skill_sort_id' => 201614,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'qianjun_base_attack' => 36.0,
    'houjun_base_attack' => 36.0
};
get(201614019)-> #{
    'skill_sort_id' => 201614,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'qianjun_base_attack' => 38.0,
    'houjun_base_attack' => 38.0
};
get(201614020)-> #{
    'skill_sort_id' => 201614,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'qianjun_base_attack' => 40.0,
    'houjun_base_attack' => 40.0
};
get(201614021)-> #{
    'skill_sort_id' => 201614,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'qianjun_base_attack' => 42.0,
    'houjun_base_attack' => 42.0
};
get(201614022)-> #{
    'skill_sort_id' => 201614,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'qianjun_base_attack' => 44.0,
    'houjun_base_attack' => 44.0
};
get(201614023)-> #{
    'skill_sort_id' => 201614,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'qianjun_base_attack' => 46.0,
    'houjun_base_attack' => 46.0
};
get(201614024)-> #{
    'skill_sort_id' => 201614,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'qianjun_base_attack' => 48.0,
    'houjun_base_attack' => 48.0
};
get(201614025)-> #{
    'skill_sort_id' => 201614,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'qianjun_base_attack' => 50.0,
    'houjun_base_attack' => 50.0
};
get(201614026)-> #{
    'skill_sort_id' => 201614,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'bingzhong_base_troops_rate' => 0.1,
    'qianjun_base_attack' => 52.0,
    'houjun_base_attack' => 52.0
};
get(201614027)-> #{
    'skill_sort_id' => 201614,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1,
    'qianjun_base_attack' => 54.0,
    'houjun_base_attack' => 54.0
};
get(201614028)-> #{
    'skill_sort_id' => 201614,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2,
    'qianjun_base_attack' => 56.0,
    'houjun_base_attack' => 56.0
};
get(201614029)-> #{
    'skill_sort_id' => 201614,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2,
    'qianjun_base_attack' => 58.0,
    'houjun_base_attack' => 58.0
};
get(201614030)-> #{
    'skill_sort_id' => 201614,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3,
    'qianjun_base_attack' => 60.0,
    'houjun_base_attack' => 60.0
};
get(201615001)-> #{
    'skill_sort_id' => 201615,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201615001
};
get(201615002)-> #{
    'skill_sort_id' => 201615,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201615002
};
get(201615003)-> #{
    'skill_sort_id' => 201615,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201615003
};
get(201615004)-> #{
    'skill_sort_id' => 201615,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201615004
};
get(201615005)-> #{
    'skill_sort_id' => 201615,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201615005
};
get(201615006)-> #{
    'skill_sort_id' => 201615,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201615006
};
get(201615007)-> #{
    'skill_sort_id' => 201615,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201615007
};
get(201615008)-> #{
    'skill_sort_id' => 201615,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201615008
};
get(201615009)-> #{
    'skill_sort_id' => 201615,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201615009
};
get(201615010)-> #{
    'skill_sort_id' => 201615,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201615010
};
get(201615011)-> #{
    'skill_sort_id' => 201615,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201615011
};
get(201615012)-> #{
    'skill_sort_id' => 201615,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201615012
};
get(201615013)-> #{
    'skill_sort_id' => 201615,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201615013
};
get(201615014)-> #{
    'skill_sort_id' => 201615,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201615014
};
get(201615015)-> #{
    'skill_sort_id' => 201615,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201615015
};
get(201615016)-> #{
    'skill_sort_id' => 201615,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201615016
};
get(201615017)-> #{
    'skill_sort_id' => 201615,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201615017
};
get(201615018)-> #{
    'skill_sort_id' => 201615,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201615018
};
get(201615019)-> #{
    'skill_sort_id' => 201615,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201615019
};
get(201615020)-> #{
    'skill_sort_id' => 201615,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201615020
};
get(201615021)-> #{
    'skill_sort_id' => 201615,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201615021
};
get(201615022)-> #{
    'skill_sort_id' => 201615,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201615022
};
get(201615023)-> #{
    'skill_sort_id' => 201615,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201615023
};
get(201615024)-> #{
    'skill_sort_id' => 201615,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201615024
};
get(201615025)-> #{
    'skill_sort_id' => 201615,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201615025
};
get(201615026)-> #{
    'skill_sort_id' => 201615,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201615026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201615027)-> #{
    'skill_sort_id' => 201615,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201615027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201615028)-> #{
    'skill_sort_id' => 201615,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201615028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201615029)-> #{
    'skill_sort_id' => 201615,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201615029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201615030)-> #{
    'skill_sort_id' => 201615,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201615030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201616001)-> #{
    'skill_sort_id' => 201616,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201616001
};
get(201616002)-> #{
    'skill_sort_id' => 201616,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201616002
};
get(201616003)-> #{
    'skill_sort_id' => 201616,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201616003
};
get(201616004)-> #{
    'skill_sort_id' => 201616,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201616004
};
get(201616005)-> #{
    'skill_sort_id' => 201616,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201616005
};
get(201616006)-> #{
    'skill_sort_id' => 201616,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201616006
};
get(201616007)-> #{
    'skill_sort_id' => 201616,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201616007
};
get(201616008)-> #{
    'skill_sort_id' => 201616,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201616008
};
get(201616009)-> #{
    'skill_sort_id' => 201616,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201616009
};
get(201616010)-> #{
    'skill_sort_id' => 201616,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201616010
};
get(201616011)-> #{
    'skill_sort_id' => 201616,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201616011
};
get(201616012)-> #{
    'skill_sort_id' => 201616,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201616012
};
get(201616013)-> #{
    'skill_sort_id' => 201616,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201616013
};
get(201616014)-> #{
    'skill_sort_id' => 201616,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201616014
};
get(201616015)-> #{
    'skill_sort_id' => 201616,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201616015
};
get(201616016)-> #{
    'skill_sort_id' => 201616,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201616016
};
get(201616017)-> #{
    'skill_sort_id' => 201616,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201616017
};
get(201616018)-> #{
    'skill_sort_id' => 201616,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201616018
};
get(201616019)-> #{
    'skill_sort_id' => 201616,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201616019
};
get(201616020)-> #{
    'skill_sort_id' => 201616,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201616020
};
get(201616021)-> #{
    'skill_sort_id' => 201616,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201616021
};
get(201616022)-> #{
    'skill_sort_id' => 201616,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201616022
};
get(201616023)-> #{
    'skill_sort_id' => 201616,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201616023
};
get(201616024)-> #{
    'skill_sort_id' => 201616,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201616024
};
get(201616025)-> #{
    'skill_sort_id' => 201616,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201616025
};
get(201616026)-> #{
    'skill_sort_id' => 201616,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201616026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201616027)-> #{
    'skill_sort_id' => 201616,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201616027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201616028)-> #{
    'skill_sort_id' => 201616,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201616028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201616029)-> #{
    'skill_sort_id' => 201616,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201616029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201616030)-> #{
    'skill_sort_id' => 201616,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201616030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201617001)-> #{
    'skill_sort_id' => 201617,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201617001
};
get(201617002)-> #{
    'skill_sort_id' => 201617,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201617002
};
get(201617003)-> #{
    'skill_sort_id' => 201617,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201617003
};
get(201617004)-> #{
    'skill_sort_id' => 201617,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201617004
};
get(201617005)-> #{
    'skill_sort_id' => 201617,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201617005
};
get(201617006)-> #{
    'skill_sort_id' => 201617,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201617006
};
get(201617007)-> #{
    'skill_sort_id' => 201617,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201617007
};
get(201617008)-> #{
    'skill_sort_id' => 201617,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201617008
};
get(201617009)-> #{
    'skill_sort_id' => 201617,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201617009
};
get(201617010)-> #{
    'skill_sort_id' => 201617,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201617010
};
get(201617011)-> #{
    'skill_sort_id' => 201617,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201617011
};
get(201617012)-> #{
    'skill_sort_id' => 201617,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201617012
};
get(201617013)-> #{
    'skill_sort_id' => 201617,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201617013
};
get(201617014)-> #{
    'skill_sort_id' => 201617,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201617014
};
get(201617015)-> #{
    'skill_sort_id' => 201617,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201617015
};
get(201617016)-> #{
    'skill_sort_id' => 201617,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201617016
};
get(201617017)-> #{
    'skill_sort_id' => 201617,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201617017
};
get(201617018)-> #{
    'skill_sort_id' => 201617,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201617018
};
get(201617019)-> #{
    'skill_sort_id' => 201617,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201617019
};
get(201617020)-> #{
    'skill_sort_id' => 201617,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201617020
};
get(201617021)-> #{
    'skill_sort_id' => 201617,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201617021
};
get(201617022)-> #{
    'skill_sort_id' => 201617,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201617022
};
get(201617023)-> #{
    'skill_sort_id' => 201617,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201617023
};
get(201617024)-> #{
    'skill_sort_id' => 201617,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201617024
};
get(201617025)-> #{
    'skill_sort_id' => 201617,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201617025
};
get(201617026)-> #{
    'skill_sort_id' => 201617,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201617026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201617027)-> #{
    'skill_sort_id' => 201617,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201617027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201617028)-> #{
    'skill_sort_id' => 201617,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201617028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201617029)-> #{
    'skill_sort_id' => 201617,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201617029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201617030)-> #{
    'skill_sort_id' => 201617,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201617030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201618001)-> #{
    'skill_sort_id' => 201618,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201618001
};
get(201618002)-> #{
    'skill_sort_id' => 201618,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201618002
};
get(201618003)-> #{
    'skill_sort_id' => 201618,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201618003
};
get(201618004)-> #{
    'skill_sort_id' => 201618,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201618004
};
get(201618005)-> #{
    'skill_sort_id' => 201618,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201618005
};
get(201618006)-> #{
    'skill_sort_id' => 201618,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201618006
};
get(201618007)-> #{
    'skill_sort_id' => 201618,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201618007
};
get(201618008)-> #{
    'skill_sort_id' => 201618,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201618008
};
get(201618009)-> #{
    'skill_sort_id' => 201618,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201618009
};
get(201618010)-> #{
    'skill_sort_id' => 201618,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201618010
};
get(201618011)-> #{
    'skill_sort_id' => 201618,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201618011
};
get(201618012)-> #{
    'skill_sort_id' => 201618,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201618012
};
get(201618013)-> #{
    'skill_sort_id' => 201618,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201618013
};
get(201618014)-> #{
    'skill_sort_id' => 201618,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201618014
};
get(201618015)-> #{
    'skill_sort_id' => 201618,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201618015
};
get(201618016)-> #{
    'skill_sort_id' => 201618,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201618016
};
get(201618017)-> #{
    'skill_sort_id' => 201618,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201618017
};
get(201618018)-> #{
    'skill_sort_id' => 201618,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201618018
};
get(201618019)-> #{
    'skill_sort_id' => 201618,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201618019
};
get(201618020)-> #{
    'skill_sort_id' => 201618,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201618020
};
get(201618021)-> #{
    'skill_sort_id' => 201618,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201618021
};
get(201618022)-> #{
    'skill_sort_id' => 201618,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201618022
};
get(201618023)-> #{
    'skill_sort_id' => 201618,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201618023
};
get(201618024)-> #{
    'skill_sort_id' => 201618,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201618024
};
get(201618025)-> #{
    'skill_sort_id' => 201618,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201618025
};
get(201618026)-> #{
    'skill_sort_id' => 201618,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201618026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201618027)-> #{
    'skill_sort_id' => 201618,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201618027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201618028)-> #{
    'skill_sort_id' => 201618,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201618028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201618029)-> #{
    'skill_sort_id' => 201618,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201618029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201618030)-> #{
    'skill_sort_id' => 201618,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201618030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201619001)-> #{
    'skill_sort_id' => 201619,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201619001
};
get(201619002)-> #{
    'skill_sort_id' => 201619,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201619002
};
get(201619003)-> #{
    'skill_sort_id' => 201619,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201619003
};
get(201619004)-> #{
    'skill_sort_id' => 201619,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201619004
};
get(201619005)-> #{
    'skill_sort_id' => 201619,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201619005
};
get(201619006)-> #{
    'skill_sort_id' => 201619,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201619006
};
get(201619007)-> #{
    'skill_sort_id' => 201619,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201619007
};
get(201619008)-> #{
    'skill_sort_id' => 201619,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201619008
};
get(201619009)-> #{
    'skill_sort_id' => 201619,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201619009
};
get(201619010)-> #{
    'skill_sort_id' => 201619,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201619010
};
get(201619011)-> #{
    'skill_sort_id' => 201619,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201619011
};
get(201619012)-> #{
    'skill_sort_id' => 201619,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201619012
};
get(201619013)-> #{
    'skill_sort_id' => 201619,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201619013
};
get(201619014)-> #{
    'skill_sort_id' => 201619,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201619014
};
get(201619015)-> #{
    'skill_sort_id' => 201619,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201619015
};
get(201619016)-> #{
    'skill_sort_id' => 201619,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201619016
};
get(201619017)-> #{
    'skill_sort_id' => 201619,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201619017
};
get(201619018)-> #{
    'skill_sort_id' => 201619,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201619018
};
get(201619019)-> #{
    'skill_sort_id' => 201619,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201619019
};
get(201619020)-> #{
    'skill_sort_id' => 201619,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201619020
};
get(201619021)-> #{
    'skill_sort_id' => 201619,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201619021
};
get(201619022)-> #{
    'skill_sort_id' => 201619,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201619022
};
get(201619023)-> #{
    'skill_sort_id' => 201619,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201619023
};
get(201619024)-> #{
    'skill_sort_id' => 201619,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201619024
};
get(201619025)-> #{
    'skill_sort_id' => 201619,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201619025
};
get(201619026)-> #{
    'skill_sort_id' => 201619,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201619026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201619027)-> #{
    'skill_sort_id' => 201619,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201619027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201619028)-> #{
    'skill_sort_id' => 201619,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201619028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201619029)-> #{
    'skill_sort_id' => 201619,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201619029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201619030)-> #{
    'skill_sort_id' => 201619,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201619030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201620001)-> #{
    'skill_sort_id' => 201620,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201620001
};
get(201620002)-> #{
    'skill_sort_id' => 201620,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201620002
};
get(201620003)-> #{
    'skill_sort_id' => 201620,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201620003
};
get(201620004)-> #{
    'skill_sort_id' => 201620,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201620004
};
get(201620005)-> #{
    'skill_sort_id' => 201620,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201620005
};
get(201620006)-> #{
    'skill_sort_id' => 201620,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201620006
};
get(201620007)-> #{
    'skill_sort_id' => 201620,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201620007
};
get(201620008)-> #{
    'skill_sort_id' => 201620,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201620008
};
get(201620009)-> #{
    'skill_sort_id' => 201620,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201620009
};
get(201620010)-> #{
    'skill_sort_id' => 201620,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201620010
};
get(201620011)-> #{
    'skill_sort_id' => 201620,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201620011
};
get(201620012)-> #{
    'skill_sort_id' => 201620,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201620012
};
get(201620013)-> #{
    'skill_sort_id' => 201620,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201620013
};
get(201620014)-> #{
    'skill_sort_id' => 201620,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201620014
};
get(201620015)-> #{
    'skill_sort_id' => 201620,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201620015
};
get(201620016)-> #{
    'skill_sort_id' => 201620,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201620016
};
get(201620017)-> #{
    'skill_sort_id' => 201620,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201620017
};
get(201620018)-> #{
    'skill_sort_id' => 201620,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201620018
};
get(201620019)-> #{
    'skill_sort_id' => 201620,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201620019
};
get(201620020)-> #{
    'skill_sort_id' => 201620,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201620020
};
get(201620021)-> #{
    'skill_sort_id' => 201620,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201620021
};
get(201620022)-> #{
    'skill_sort_id' => 201620,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201620022
};
get(201620023)-> #{
    'skill_sort_id' => 201620,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201620023
};
get(201620024)-> #{
    'skill_sort_id' => 201620,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201620024
};
get(201620025)-> #{
    'skill_sort_id' => 201620,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201620025
};
get(201620026)-> #{
    'skill_sort_id' => 201620,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201620026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201620027)-> #{
    'skill_sort_id' => 201620,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201620027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201620028)-> #{
    'skill_sort_id' => 201620,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201620028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201620029)-> #{
    'skill_sort_id' => 201620,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201620029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201620030)-> #{
    'skill_sort_id' => 201620,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201620030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201621001)-> #{
    'skill_sort_id' => 201621,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'skill_id' => 201621001
};
get(201621002)-> #{
    'skill_sort_id' => 201621,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'skill_id' => 201621002
};
get(201621003)-> #{
    'skill_sort_id' => 201621,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'skill_id' => 201621003
};
get(201621004)-> #{
    'skill_sort_id' => 201621,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'skill_id' => 201621004
};
get(201621005)-> #{
    'skill_sort_id' => 201621,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'skill_id' => 201621005
};
get(201621006)-> #{
    'skill_sort_id' => 201621,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'skill_id' => 201621006
};
get(201621007)-> #{
    'skill_sort_id' => 201621,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'skill_id' => 201621007
};
get(201621008)-> #{
    'skill_sort_id' => 201621,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'skill_id' => 201621008
};
get(201621009)-> #{
    'skill_sort_id' => 201621,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'skill_id' => 201621009
};
get(201621010)-> #{
    'skill_sort_id' => 201621,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'skill_id' => 201621010
};
get(201621011)-> #{
    'skill_sort_id' => 201621,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'skill_id' => 201621011
};
get(201621012)-> #{
    'skill_sort_id' => 201621,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'skill_id' => 201621012
};
get(201621013)-> #{
    'skill_sort_id' => 201621,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'skill_id' => 201621013
};
get(201621014)-> #{
    'skill_sort_id' => 201621,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'skill_id' => 201621014
};
get(201621015)-> #{
    'skill_sort_id' => 201621,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'skill_id' => 201621015
};
get(201621016)-> #{
    'skill_sort_id' => 201621,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'skill_id' => 201621016
};
get(201621017)-> #{
    'skill_sort_id' => 201621,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'skill_id' => 201621017
};
get(201621018)-> #{
    'skill_sort_id' => 201621,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'skill_id' => 201621018
};
get(201621019)-> #{
    'skill_sort_id' => 201621,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'skill_id' => 201621019
};
get(201621020)-> #{
    'skill_sort_id' => 201621,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'skill_id' => 201621020
};
get(201621021)-> #{
    'skill_sort_id' => 201621,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'skill_id' => 201621021
};
get(201621022)-> #{
    'skill_sort_id' => 201621,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'skill_id' => 201621022
};
get(201621023)-> #{
    'skill_sort_id' => 201621,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'skill_id' => 201621023
};
get(201621024)-> #{
    'skill_sort_id' => 201621,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'skill_id' => 201621024
};
get(201621025)-> #{
    'skill_sort_id' => 201621,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'skill_id' => 201621025
};
get(201621026)-> #{
    'skill_sort_id' => 201621,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'skill_id' => 201621026,
    'bingzhong_base_troops_rate' => 0.1
};
get(201621027)-> #{
    'skill_sort_id' => 201621,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'skill_id' => 201621027,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.1
};
get(201621028)-> #{
    'skill_sort_id' => 201621,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'skill_id' => 201621028,
    'bingzhong_base_attack_rate' => 0.1,
    'bingzhong_base_troops_rate' => 0.2
};
get(201621029)-> #{
    'skill_sort_id' => 201621,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'skill_id' => 201621029,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.2
};
get(201621030)-> #{
    'skill_sort_id' => 201621,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'skill_id' => 201621030,
    'bingzhong_base_attack_rate' => 0.2,
    'bingzhong_base_troops_rate' => 0.3
};
get(201701001)-> #{
    'skill_sort_id' => 201701,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'build_value_multi' => 0.25
};
get(201701002)-> #{
    'skill_sort_id' => 201701,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'build_value_multi' => 0.3
};
get(201701003)-> #{
    'skill_sort_id' => 201701,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'build_value_multi' => 0.35
};
get(201701004)-> #{
    'skill_sort_id' => 201701,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'build_value_multi' => 0.4
};
get(201701005)-> #{
    'skill_sort_id' => 201701,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'build_value_multi' => 0.45
};
get(201701006)-> #{
    'skill_sort_id' => 201701,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'build_value_multi' => 0.5
};
get(201701007)-> #{
    'skill_sort_id' => 201701,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'build_value_multi' => 0.55
};
get(201701008)-> #{
    'skill_sort_id' => 201701,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'build_value_multi' => 0.6
};
get(201701009)-> #{
    'skill_sort_id' => 201701,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'build_value_multi' => 0.65
};
get(201701010)-> #{
    'skill_sort_id' => 201701,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'build_value_multi' => 0.7
};
get(201701011)-> #{
    'skill_sort_id' => 201701,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'build_value_multi' => 0.75
};
get(201701012)-> #{
    'skill_sort_id' => 201701,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'build_value_multi' => 0.8
};
get(201701013)-> #{
    'skill_sort_id' => 201701,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'build_value_multi' => 0.85
};
get(201701014)-> #{
    'skill_sort_id' => 201701,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'build_value_multi' => 0.9
};
get(201701015)-> #{
    'skill_sort_id' => 201701,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'build_value_multi' => 0.95
};
get(201701016)-> #{
    'skill_sort_id' => 201701,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'build_value_multi' => 1.0
};
get(201701017)-> #{
    'skill_sort_id' => 201701,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'build_value_multi' => 1.05
};
get(201701018)-> #{
    'skill_sort_id' => 201701,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'build_value_multi' => 1.1
};
get(201701019)-> #{
    'skill_sort_id' => 201701,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'build_value_multi' => 1.15
};
get(201701020)-> #{
    'skill_sort_id' => 201701,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'build_value_multi' => 1.2
};
get(201701021)-> #{
    'skill_sort_id' => 201701,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'build_value_multi' => 1.25
};
get(201701022)-> #{
    'skill_sort_id' => 201701,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'build_value_multi' => 1.3
};
get(201701023)-> #{
    'skill_sort_id' => 201701,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'build_value_multi' => 1.35
};
get(201701024)-> #{
    'skill_sort_id' => 201701,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'build_value_multi' => 1.4
};
get(201701025)-> #{
    'skill_sort_id' => 201701,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'build_value_multi' => 1.45
};
get(201701026)-> #{
    'skill_sort_id' => 201701,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'build_value_multi' => 1.5
};
get(201701027)-> #{
    'skill_sort_id' => 201701,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'build_value_multi' => 1.55
};
get(201701028)-> #{
    'skill_sort_id' => 201701,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'build_value_multi' => 1.6
};
get(201701029)-> #{
    'skill_sort_id' => 201701,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'build_value_multi' => 1.65
};
get(201701030)-> #{
    'skill_sort_id' => 201701,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'build_value_multi' => 1.7
};
get(201702001)-> #{
    'skill_sort_id' => 201702,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'march_speed_multi' => 0.06
};
get(201702002)-> #{
    'skill_sort_id' => 201702,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'march_speed_multi' => 0.07
};
get(201702003)-> #{
    'skill_sort_id' => 201702,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'march_speed_multi' => 0.08
};
get(201702004)-> #{
    'skill_sort_id' => 201702,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'march_speed_multi' => 0.09
};
get(201702005)-> #{
    'skill_sort_id' => 201702,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'march_speed_multi' => 0.1
};
get(201702006)-> #{
    'skill_sort_id' => 201702,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'march_speed_multi' => 0.11
};
get(201702007)-> #{
    'skill_sort_id' => 201702,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'march_speed_multi' => 0.12
};
get(201702008)-> #{
    'skill_sort_id' => 201702,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'march_speed_multi' => 0.13
};
get(201702009)-> #{
    'skill_sort_id' => 201702,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'march_speed_multi' => 0.14
};
get(201702010)-> #{
    'skill_sort_id' => 201702,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'march_speed_multi' => 0.15
};
get(201702011)-> #{
    'skill_sort_id' => 201702,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'march_speed_multi' => 0.16
};
get(201702012)-> #{
    'skill_sort_id' => 201702,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'march_speed_multi' => 0.17
};
get(201702013)-> #{
    'skill_sort_id' => 201702,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'march_speed_multi' => 0.18
};
get(201702014)-> #{
    'skill_sort_id' => 201702,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'march_speed_multi' => 0.19
};
get(201702015)-> #{
    'skill_sort_id' => 201702,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'march_speed_multi' => 0.2
};
get(201702016)-> #{
    'skill_sort_id' => 201702,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'march_speed_multi' => 0.21
};
get(201702017)-> #{
    'skill_sort_id' => 201702,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'march_speed_multi' => 0.22
};
get(201702018)-> #{
    'skill_sort_id' => 201702,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'march_speed_multi' => 0.23
};
get(201702019)-> #{
    'skill_sort_id' => 201702,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'march_speed_multi' => 0.24
};
get(201702020)-> #{
    'skill_sort_id' => 201702,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'march_speed_multi' => 0.25
};
get(201702021)-> #{
    'skill_sort_id' => 201702,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'march_speed_multi' => 0.26
};
get(201702022)-> #{
    'skill_sort_id' => 201702,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'march_speed_multi' => 0.27
};
get(201702023)-> #{
    'skill_sort_id' => 201702,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'march_speed_multi' => 0.28
};
get(201702024)-> #{
    'skill_sort_id' => 201702,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'march_speed_multi' => 0.29
};
get(201702025)-> #{
    'skill_sort_id' => 201702,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'march_speed_multi' => 0.3
};
get(201702026)-> #{
    'skill_sort_id' => 201702,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'march_speed_multi' => 0.31
};
get(201702027)-> #{
    'skill_sort_id' => 201702,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'march_speed_multi' => 0.32
};
get(201702028)-> #{
    'skill_sort_id' => 201702,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'march_speed_multi' => 0.33
};
get(201702029)-> #{
    'skill_sort_id' => 201702,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'march_speed_multi' => 0.34
};
get(201702030)-> #{
    'skill_sort_id' => 201702,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'march_speed_multi' => 0.35
};
get(201703001)-> #{
    'skill_sort_id' => 201703,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'hunt_units_multi' => 0.2
};
get(201703002)-> #{
    'skill_sort_id' => 201703,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'hunt_units_multi' => 0.22
};
get(201703003)-> #{
    'skill_sort_id' => 201703,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'hunt_units_multi' => 0.24
};
get(201703004)-> #{
    'skill_sort_id' => 201703,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'hunt_units_multi' => 0.26
};
get(201703005)-> #{
    'skill_sort_id' => 201703,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'hunt_units_multi' => 0.28
};
get(201703006)-> #{
    'skill_sort_id' => 201703,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'hunt_units_multi' => 0.3
};
get(201703007)-> #{
    'skill_sort_id' => 201703,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'hunt_units_multi' => 0.32
};
get(201703008)-> #{
    'skill_sort_id' => 201703,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'hunt_units_multi' => 0.34
};
get(201703009)-> #{
    'skill_sort_id' => 201703,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'hunt_units_multi' => 0.36
};
get(201703010)-> #{
    'skill_sort_id' => 201703,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'hunt_units_multi' => 0.38
};
get(201703011)-> #{
    'skill_sort_id' => 201703,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'hunt_units_multi' => 0.4
};
get(201703012)-> #{
    'skill_sort_id' => 201703,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'hunt_units_multi' => 0.42
};
get(201703013)-> #{
    'skill_sort_id' => 201703,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'hunt_units_multi' => 0.44
};
get(201703014)-> #{
    'skill_sort_id' => 201703,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'hunt_units_multi' => 0.46
};
get(201703015)-> #{
    'skill_sort_id' => 201703,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'hunt_units_multi' => 0.48
};
get(201703016)-> #{
    'skill_sort_id' => 201703,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'hunt_units_multi' => 0.5
};
get(201703017)-> #{
    'skill_sort_id' => 201703,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'hunt_units_multi' => 0.52
};
get(201703018)-> #{
    'skill_sort_id' => 201703,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'hunt_units_multi' => 0.54
};
get(201703019)-> #{
    'skill_sort_id' => 201703,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'hunt_units_multi' => 0.56
};
get(201703020)-> #{
    'skill_sort_id' => 201703,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'hunt_units_multi' => 0.58
};
get(201703021)-> #{
    'skill_sort_id' => 201703,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'hunt_units_multi' => 0.6
};
get(201703022)-> #{
    'skill_sort_id' => 201703,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'hunt_units_multi' => 0.62
};
get(201703023)-> #{
    'skill_sort_id' => 201703,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'hunt_units_multi' => 0.64
};
get(201703024)-> #{
    'skill_sort_id' => 201703,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'hunt_units_multi' => 0.66
};
get(201703025)-> #{
    'skill_sort_id' => 201703,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'hunt_units_multi' => 0.68
};
get(201703026)-> #{
    'skill_sort_id' => 201703,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'hunt_units_multi' => 0.7
};
get(201703027)-> #{
    'skill_sort_id' => 201703,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'hunt_units_multi' => 0.72
};
get(201703028)-> #{
    'skill_sort_id' => 201703,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'hunt_units_multi' => 0.74
};
get(201703029)-> #{
    'skill_sort_id' => 201703,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'hunt_units_multi' => 0.76
};
get(201703030)-> #{
    'skill_sort_id' => 201703,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'hunt_units_multi' => 0.78
};
get(201704001)-> #{
    'skill_sort_id' => 201704,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'visit_multi' => 0.24
};
get(201704002)-> #{
    'skill_sort_id' => 201704,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'visit_multi' => 0.28
};
get(201704003)-> #{
    'skill_sort_id' => 201704,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'visit_multi' => 0.32
};
get(201704004)-> #{
    'skill_sort_id' => 201704,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'visit_multi' => 0.36
};
get(201704005)-> #{
    'skill_sort_id' => 201704,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'visit_multi' => 0.4
};
get(201704006)-> #{
    'skill_sort_id' => 201704,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'visit_multi' => 0.44
};
get(201704007)-> #{
    'skill_sort_id' => 201704,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'visit_multi' => 0.48
};
get(201704008)-> #{
    'skill_sort_id' => 201704,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'visit_multi' => 0.52
};
get(201704009)-> #{
    'skill_sort_id' => 201704,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'visit_multi' => 0.56
};
get(201704010)-> #{
    'skill_sort_id' => 201704,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'visit_multi' => 0.6
};
get(201704011)-> #{
    'skill_sort_id' => 201704,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'visit_multi' => 0.64
};
get(201704012)-> #{
    'skill_sort_id' => 201704,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'visit_multi' => 0.68
};
get(201704013)-> #{
    'skill_sort_id' => 201704,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'visit_multi' => 0.72
};
get(201704014)-> #{
    'skill_sort_id' => 201704,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'visit_multi' => 0.76
};
get(201704015)-> #{
    'skill_sort_id' => 201704,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'visit_multi' => 0.8
};
get(201704016)-> #{
    'skill_sort_id' => 201704,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'visit_multi' => 0.84
};
get(201704017)-> #{
    'skill_sort_id' => 201704,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'visit_multi' => 0.88
};
get(201704018)-> #{
    'skill_sort_id' => 201704,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'visit_multi' => 0.92
};
get(201704019)-> #{
    'skill_sort_id' => 201704,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'visit_multi' => 0.96
};
get(201704020)-> #{
    'skill_sort_id' => 201704,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'visit_multi' => 1.0
};
get(201704021)-> #{
    'skill_sort_id' => 201704,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'visit_multi' => 1.04
};
get(201704022)-> #{
    'skill_sort_id' => 201704,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'visit_multi' => 1.08
};
get(201704023)-> #{
    'skill_sort_id' => 201704,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'visit_multi' => 1.12
};
get(201704024)-> #{
    'skill_sort_id' => 201704,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'visit_multi' => 1.16
};
get(201704025)-> #{
    'skill_sort_id' => 201704,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'visit_multi' => 1.2
};
get(201704026)-> #{
    'skill_sort_id' => 201704,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'visit_multi' => 1.24
};
get(201704027)-> #{
    'skill_sort_id' => 201704,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'visit_multi' => 1.28
};
get(201704028)-> #{
    'skill_sort_id' => 201704,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'visit_multi' => 1.32
};
get(201704029)-> #{
    'skill_sort_id' => 201704,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'visit_multi' => 1.36
};
get(201704030)-> #{
    'skill_sort_id' => 201704,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'visit_multi' => 1.4
};
get(201705001)-> #{
    'skill_sort_id' => 201705,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'taxation_multi' => 0.07
};
get(201705002)-> #{
    'skill_sort_id' => 201705,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'taxation_multi' => 0.09
};
get(201705003)-> #{
    'skill_sort_id' => 201705,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'taxation_multi' => 0.11
};
get(201705004)-> #{
    'skill_sort_id' => 201705,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'taxation_multi' => 0.13
};
get(201705005)-> #{
    'skill_sort_id' => 201705,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'taxation_multi' => 0.15
};
get(201705006)-> #{
    'skill_sort_id' => 201705,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'taxation_multi' => 0.17
};
get(201705007)-> #{
    'skill_sort_id' => 201705,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'taxation_multi' => 0.19
};
get(201705008)-> #{
    'skill_sort_id' => 201705,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'taxation_multi' => 0.21
};
get(201705009)-> #{
    'skill_sort_id' => 201705,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'taxation_multi' => 0.23
};
get(201705010)-> #{
    'skill_sort_id' => 201705,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'taxation_multi' => 0.25
};
get(201705011)-> #{
    'skill_sort_id' => 201705,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'taxation_multi' => 0.27
};
get(201705012)-> #{
    'skill_sort_id' => 201705,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'taxation_multi' => 0.29
};
get(201705013)-> #{
    'skill_sort_id' => 201705,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'taxation_multi' => 0.31
};
get(201705014)-> #{
    'skill_sort_id' => 201705,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'taxation_multi' => 0.33
};
get(201705015)-> #{
    'skill_sort_id' => 201705,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'taxation_multi' => 0.35
};
get(201705016)-> #{
    'skill_sort_id' => 201705,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'taxation_multi' => 0.37
};
get(201705017)-> #{
    'skill_sort_id' => 201705,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'taxation_multi' => 0.39
};
get(201705018)-> #{
    'skill_sort_id' => 201705,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'taxation_multi' => 0.41
};
get(201705019)-> #{
    'skill_sort_id' => 201705,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'taxation_multi' => 0.43
};
get(201705020)-> #{
    'skill_sort_id' => 201705,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'taxation_multi' => 0.45
};
get(201705021)-> #{
    'skill_sort_id' => 201705,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'taxation_multi' => 0.47
};
get(201705022)-> #{
    'skill_sort_id' => 201705,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'taxation_multi' => 0.49
};
get(201705023)-> #{
    'skill_sort_id' => 201705,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'taxation_multi' => 0.51
};
get(201705024)-> #{
    'skill_sort_id' => 201705,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'taxation_multi' => 0.53
};
get(201705025)-> #{
    'skill_sort_id' => 201705,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'taxation_multi' => 0.55
};
get(201705026)-> #{
    'skill_sort_id' => 201705,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'taxation_multi' => 0.57
};
get(201705027)-> #{
    'skill_sort_id' => 201705,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'taxation_multi' => 0.59
};
get(201705028)-> #{
    'skill_sort_id' => 201705,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'taxation_multi' => 0.61
};
get(201705029)-> #{
    'skill_sort_id' => 201705,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'taxation_multi' => 0.63
};
get(201705030)-> #{
    'skill_sort_id' => 201705,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'taxation_multi' => 0.65
};
get(201706001)-> #{
    'skill_sort_id' => 201706,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'wasteland_multi' => 0.07
};
get(201706002)-> #{
    'skill_sort_id' => 201706,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'wasteland_multi' => 0.09
};
get(201706003)-> #{
    'skill_sort_id' => 201706,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'wasteland_multi' => 0.11
};
get(201706004)-> #{
    'skill_sort_id' => 201706,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'wasteland_multi' => 0.13
};
get(201706005)-> #{
    'skill_sort_id' => 201706,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'wasteland_multi' => 0.15
};
get(201706006)-> #{
    'skill_sort_id' => 201706,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'wasteland_multi' => 0.17
};
get(201706007)-> #{
    'skill_sort_id' => 201706,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'wasteland_multi' => 0.19
};
get(201706008)-> #{
    'skill_sort_id' => 201706,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'wasteland_multi' => 0.21
};
get(201706009)-> #{
    'skill_sort_id' => 201706,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'wasteland_multi' => 0.23
};
get(201706010)-> #{
    'skill_sort_id' => 201706,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'wasteland_multi' => 0.25
};
get(201706011)-> #{
    'skill_sort_id' => 201706,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'wasteland_multi' => 0.27
};
get(201706012)-> #{
    'skill_sort_id' => 201706,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'wasteland_multi' => 0.29
};
get(201706013)-> #{
    'skill_sort_id' => 201706,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'wasteland_multi' => 0.31
};
get(201706014)-> #{
    'skill_sort_id' => 201706,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'wasteland_multi' => 0.33
};
get(201706015)-> #{
    'skill_sort_id' => 201706,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'wasteland_multi' => 0.35
};
get(201706016)-> #{
    'skill_sort_id' => 201706,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'wasteland_multi' => 0.37
};
get(201706017)-> #{
    'skill_sort_id' => 201706,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'wasteland_multi' => 0.39
};
get(201706018)-> #{
    'skill_sort_id' => 201706,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'wasteland_multi' => 0.41
};
get(201706019)-> #{
    'skill_sort_id' => 201706,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'wasteland_multi' => 0.43
};
get(201706020)-> #{
    'skill_sort_id' => 201706,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'wasteland_multi' => 0.45
};
get(201706021)-> #{
    'skill_sort_id' => 201706,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'wasteland_multi' => 0.47
};
get(201706022)-> #{
    'skill_sort_id' => 201706,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'wasteland_multi' => 0.49
};
get(201706023)-> #{
    'skill_sort_id' => 201706,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'wasteland_multi' => 0.51
};
get(201706024)-> #{
    'skill_sort_id' => 201706,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'wasteland_multi' => 0.53
};
get(201706025)-> #{
    'skill_sort_id' => 201706,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'wasteland_multi' => 0.55
};
get(201706026)-> #{
    'skill_sort_id' => 201706,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'wasteland_multi' => 0.57
};
get(201706027)-> #{
    'skill_sort_id' => 201706,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'wasteland_multi' => 0.59
};
get(201706028)-> #{
    'skill_sort_id' => 201706,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'wasteland_multi' => 0.61
};
get(201706029)-> #{
    'skill_sort_id' => 201706,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'wasteland_multi' => 0.63
};
get(201706030)-> #{
    'skill_sort_id' => 201706,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'wasteland_multi' => 0.65
};
get(201707001)-> #{
    'skill_sort_id' => 201707,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'generation_wood_multi' => 0.07
};
get(201707002)-> #{
    'skill_sort_id' => 201707,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'generation_wood_multi' => 0.09
};
get(201707003)-> #{
    'skill_sort_id' => 201707,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'generation_wood_multi' => 0.11
};
get(201707004)-> #{
    'skill_sort_id' => 201707,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'generation_wood_multi' => 0.13
};
get(201707005)-> #{
    'skill_sort_id' => 201707,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'generation_wood_multi' => 0.15
};
get(201707006)-> #{
    'skill_sort_id' => 201707,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'generation_wood_multi' => 0.17
};
get(201707007)-> #{
    'skill_sort_id' => 201707,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'generation_wood_multi' => 0.19
};
get(201707008)-> #{
    'skill_sort_id' => 201707,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'generation_wood_multi' => 0.21
};
get(201707009)-> #{
    'skill_sort_id' => 201707,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'generation_wood_multi' => 0.23
};
get(201707010)-> #{
    'skill_sort_id' => 201707,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'generation_wood_multi' => 0.25
};
get(201707011)-> #{
    'skill_sort_id' => 201707,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'generation_wood_multi' => 0.27
};
get(201707012)-> #{
    'skill_sort_id' => 201707,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'generation_wood_multi' => 0.29
};
get(201707013)-> #{
    'skill_sort_id' => 201707,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'generation_wood_multi' => 0.31
};
get(201707014)-> #{
    'skill_sort_id' => 201707,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'generation_wood_multi' => 0.33
};
get(201707015)-> #{
    'skill_sort_id' => 201707,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'generation_wood_multi' => 0.35
};
get(201707016)-> #{
    'skill_sort_id' => 201707,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'generation_wood_multi' => 0.37
};
get(201707017)-> #{
    'skill_sort_id' => 201707,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'generation_wood_multi' => 0.39
};
get(201707018)-> #{
    'skill_sort_id' => 201707,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'generation_wood_multi' => 0.41
};
get(201707019)-> #{
    'skill_sort_id' => 201707,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'generation_wood_multi' => 0.43
};
get(201707020)-> #{
    'skill_sort_id' => 201707,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'generation_wood_multi' => 0.45
};
get(201707021)-> #{
    'skill_sort_id' => 201707,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'generation_wood_multi' => 0.47
};
get(201707022)-> #{
    'skill_sort_id' => 201707,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'generation_wood_multi' => 0.49
};
get(201707023)-> #{
    'skill_sort_id' => 201707,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'generation_wood_multi' => 0.51
};
get(201707024)-> #{
    'skill_sort_id' => 201707,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'generation_wood_multi' => 0.53
};
get(201707025)-> #{
    'skill_sort_id' => 201707,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'generation_wood_multi' => 0.55
};
get(201707026)-> #{
    'skill_sort_id' => 201707,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'generation_wood_multi' => 0.57
};
get(201707027)-> #{
    'skill_sort_id' => 201707,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'generation_wood_multi' => 0.59
};
get(201707028)-> #{
    'skill_sort_id' => 201707,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'generation_wood_multi' => 0.61
};
get(201707029)-> #{
    'skill_sort_id' => 201707,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'generation_wood_multi' => 0.63
};
get(201707030)-> #{
    'skill_sort_id' => 201707,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'generation_wood_multi' => 0.65
};
get(201708001)-> #{
    'skill_sort_id' => 201708,
    'lv' => 1,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 10000,
    'reset_num' => 2,
    'reset_reward_fragment' => 5,
    'reset_reward_resource' => 12000,
    'mining_multi' => 0.07
};
get(201708002)-> #{
    'skill_sort_id' => 201708,
    'lv' => 2,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 20000,
    'reset_num' => 4,
    'reset_reward_fragment' => 10,
    'reset_reward_resource' => 36000,
    'mining_multi' => 0.09
};
get(201708003)-> #{
    'skill_sort_id' => 201708,
    'lv' => 3,
    'is_radio' => 0,
    'fragment_num' => 5,
    'resource_num' => 30000,
    'reset_num' => 6,
    'reset_reward_fragment' => 15,
    'reset_reward_resource' => 72000,
    'mining_multi' => 0.11
};
get(201708004)-> #{
    'skill_sort_id' => 201708,
    'lv' => 4,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 40000,
    'reset_num' => 8,
    'reset_reward_fragment' => 25,
    'reset_reward_resource' => 120000,
    'mining_multi' => 0.13
};
get(201708005)-> #{
    'skill_sort_id' => 201708,
    'lv' => 5,
    'is_radio' => 1,
    'fragment_num' => 10,
    'resource_num' => 50000,
    'reset_num' => 10,
    'reset_reward_fragment' => 35,
    'reset_reward_resource' => 180000,
    'mining_multi' => 0.15
};
get(201708006)-> #{
    'skill_sort_id' => 201708,
    'lv' => 6,
    'is_radio' => 0,
    'fragment_num' => 10,
    'resource_num' => 60000,
    'reset_num' => 12,
    'reset_reward_fragment' => 45,
    'reset_reward_resource' => 252000,
    'mining_multi' => 0.17
};
get(201708007)-> #{
    'skill_sort_id' => 201708,
    'lv' => 7,
    'is_radio' => 0,
    'fragment_num' => 15,
    'resource_num' => 70000,
    'reset_num' => 14,
    'reset_reward_fragment' => 60,
    'reset_reward_resource' => 336000,
    'mining_multi' => 0.19
};
get(201708008)-> #{
    'skill_sort_id' => 201708,
    'lv' => 8,
    'is_radio' => 0,
    'fragment_num' => 20,
    'resource_num' => 80000,
    'reset_num' => 16,
    'reset_reward_fragment' => 80,
    'reset_reward_resource' => 432000,
    'mining_multi' => 0.21
};
get(201708009)-> #{
    'skill_sort_id' => 201708,
    'lv' => 9,
    'is_radio' => 0,
    'fragment_num' => 25,
    'resource_num' => 90000,
    'reset_num' => 18,
    'reset_reward_fragment' => 105,
    'reset_reward_resource' => 540000,
    'mining_multi' => 0.23
};
get(201708010)-> #{
    'skill_sort_id' => 201708,
    'lv' => 10,
    'is_radio' => 0,
    'fragment_num' => 30,
    'resource_num' => 100000,
    'reset_num' => 20,
    'reset_reward_fragment' => 135,
    'reset_reward_resource' => 660000,
    'mining_multi' => 0.25
};
get(201708011)-> #{
    'skill_sort_id' => 201708,
    'lv' => 11,
    'is_radio' => 1,
    'fragment_num' => 40,
    'resource_num' => 110000,
    'reset_num' => 22,
    'reset_reward_fragment' => 175,
    'reset_reward_resource' => 792000,
    'mining_multi' => 0.27
};
get(201708012)-> #{
    'skill_sort_id' => 201708,
    'lv' => 12,
    'is_radio' => 1,
    'fragment_num' => 50,
    'resource_num' => 120000,
    'reset_num' => 24,
    'reset_reward_fragment' => 225,
    'reset_reward_resource' => 936000,
    'mining_multi' => 0.29
};
get(201708013)-> #{
    'skill_sort_id' => 201708,
    'lv' => 13,
    'is_radio' => 1,
    'fragment_num' => 60,
    'resource_num' => 130000,
    'reset_num' => 26,
    'reset_reward_fragment' => 285,
    'reset_reward_resource' => 1092000,
    'mining_multi' => 0.31
};
get(201708014)-> #{
    'skill_sort_id' => 201708,
    'lv' => 14,
    'is_radio' => 1,
    'fragment_num' => 70,
    'resource_num' => 140000,
    'reset_num' => 28,
    'reset_reward_fragment' => 355,
    'reset_reward_resource' => 1260000,
    'mining_multi' => 0.33
};
get(201708015)-> #{
    'skill_sort_id' => 201708,
    'lv' => 15,
    'is_radio' => 1,
    'fragment_num' => 80,
    'resource_num' => 150000,
    'reset_num' => 30,
    'reset_reward_fragment' => 435,
    'reset_reward_resource' => 1440000,
    'mining_multi' => 0.35
};
get(201708016)-> #{
    'skill_sort_id' => 201708,
    'lv' => 16,
    'is_radio' => 1,
    'fragment_num' => 100,
    'resource_num' => 160000,
    'reset_num' => 32,
    'reset_reward_fragment' => 535,
    'reset_reward_resource' => 1632000,
    'mining_multi' => 0.37
};
get(201708017)-> #{
    'skill_sort_id' => 201708,
    'lv' => 17,
    'is_radio' => 1,
    'fragment_num' => 120,
    'resource_num' => 170000,
    'reset_num' => 34,
    'reset_reward_fragment' => 655,
    'reset_reward_resource' => 1836000,
    'mining_multi' => 0.39
};
get(201708018)-> #{
    'skill_sort_id' => 201708,
    'lv' => 18,
    'is_radio' => 1,
    'fragment_num' => 140,
    'resource_num' => 180000,
    'reset_num' => 36,
    'reset_reward_fragment' => 795,
    'reset_reward_resource' => 2052000,
    'mining_multi' => 0.41
};
get(201708019)-> #{
    'skill_sort_id' => 201708,
    'lv' => 19,
    'is_radio' => 1,
    'fragment_num' => 160,
    'resource_num' => 190000,
    'reset_num' => 38,
    'reset_reward_fragment' => 955,
    'reset_reward_resource' => 2280000,
    'mining_multi' => 0.43
};
get(201708020)-> #{
    'skill_sort_id' => 201708,
    'lv' => 20,
    'is_radio' => 1,
    'fragment_num' => 200,
    'resource_num' => 200000,
    'reset_num' => 40,
    'reset_reward_fragment' => 1155,
    'reset_reward_resource' => 2520000,
    'mining_multi' => 0.45
};
get(201708021)-> #{
    'skill_sort_id' => 201708,
    'lv' => 21,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 300000,
    'reset_num' => 42,
    'reset_reward_fragment' => 1405,
    'reset_reward_resource' => 2880000,
    'mining_multi' => 0.47
};
get(201708022)-> #{
    'skill_sort_id' => 201708,
    'lv' => 22,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 400000,
    'reset_num' => 44,
    'reset_reward_fragment' => 1705,
    'reset_reward_resource' => 3360000,
    'mining_multi' => 0.49
};
get(201708023)-> #{
    'skill_sort_id' => 201708,
    'lv' => 23,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 500000,
    'reset_num' => 46,
    'reset_reward_fragment' => 2055,
    'reset_reward_resource' => 3960000,
    'mining_multi' => 0.51
};
get(201708024)-> #{
    'skill_sort_id' => 201708,
    'lv' => 24,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 600000,
    'reset_num' => 48,
    'reset_reward_fragment' => 2455,
    'reset_reward_resource' => 4680000,
    'mining_multi' => 0.53
};
get(201708025)-> #{
    'skill_sort_id' => 201708,
    'lv' => 25,
    'is_radio' => 1,
    'fragment_num' => 1100,
    'resource_num' => 700000,
    'reset_num' => 50,
    'reset_reward_fragment' => 2955,
    'reset_reward_resource' => 5520000,
    'mining_multi' => 0.55
};
get(201708026)-> #{
    'skill_sort_id' => 201708,
    'lv' => 26,
    'is_radio' => 1,
    'fragment_num' => 300,
    'resource_num' => 900000,
    'reset_num' => 52,
    'reset_reward_fragment' => 3255,
    'reset_reward_resource' => 6600000,
    'mining_multi' => 0.57
};
get(201708027)-> #{
    'skill_sort_id' => 201708,
    'lv' => 27,
    'is_radio' => 1,
    'fragment_num' => 500,
    'resource_num' => 1100000,
    'reset_num' => 54,
    'reset_reward_fragment' => 3755,
    'reset_reward_resource' => 7920000,
    'mining_multi' => 0.59
};
get(201708028)-> #{
    'skill_sort_id' => 201708,
    'lv' => 28,
    'is_radio' => 1,
    'fragment_num' => 700,
    'resource_num' => 1300000,
    'reset_num' => 56,
    'reset_reward_fragment' => 4455,
    'reset_reward_resource' => 9480000,
    'mining_multi' => 0.61
};
get(201708029)-> #{
    'skill_sort_id' => 201708,
    'lv' => 29,
    'is_radio' => 1,
    'fragment_num' => 900,
    'resource_num' => 1500000,
    'reset_num' => 58,
    'reset_reward_fragment' => 5355,
    'reset_reward_resource' => 11280000,
    'mining_multi' => 0.63
};
get(201708030)-> #{
    'skill_sort_id' => 201708,
    'lv' => 30,
    'is_radio' => 1,
    'fragment_num' => 1200,
    'resource_num' => 1800000,
    'reset_num' => 60,
    'reset_reward_fragment' => 6555,
    'reset_reward_resource' => 13320000,
    'mining_multi' => 0.65
};

get(_N) -> false.
get_list() ->
	[101101001,101101002,101101003,101101004,101101005,101101006,101101007,101101008,101101009,101101010,101101011,101101012,101101013,101101014,101101015,101101016,101101017,101101018,101101019,101101020,101101021,101101022,101101023,101101024,101101025,101101026,101101027,101101028,101101029,101101030,101102001,101102002,101102003,101102004,101102005,101102006,101102007,101102008,101102009,101102010,101102011,101102012,101102013,101102014,101102015,101102016,101102017,101102018,101102019,101102020,101102021,101102022,101102023,101102024,101102025,101102026,101102027,101102028,101102029,101102030,101103001,101103002,101103003,101103004,101103005,101103006,101103007,101103008,101103009,101103010,101103011,101103012,101103013,101103014,101103015,101103016,101103017,101103018,101103019,101103020,101103021,101103022,101103023,101103024,101103025,101103026,101103027,101103028,101103029,101103030,101104001,101104002,101104003,101104004,101104005,101104006,101104007,101104008,101104009,101104010,101104011,101104012,101104013,101104014,101104015,101104016,101104017,101104018,101104019,101104020,101104021,101104022,101104023,101104024,101104025,101104026,101104027,101104028,101104029,101104030,101105001,101105002,101105003,101105004,101105005,101105006,101105007,101105008,101105009,101105010,101105011,101105012,101105013,101105014,101105015,101105016,101105017,101105018,101105019,101105020,101105021,101105022,101105023,101105024,101105025,101105026,101105027,101105028,101105029,101105030,101106001,101106002,101106003,101106004,101106005,101106006,101106007,101106008,101106009,101106010,101106011,101106012,101106013,101106014,101106015,101106016,101106017,101106018,101106019,101106020,101106021,101106022,101106023,101106024,101106025,101106026,101106027,101106028,101106029,101106030,101107001,101107002,101107003,101107004,101107005,101107006,101107007,101107008,101107009,101107010,101107011,101107012,101107013,101107014,101107015,101107016,101107017,101107018,101107019,101107020,101107021,101107022,101107023,101107024,101107025,101107026,101107027,101107028,101107029,101107030,101108001,101108002,101108003,101108004,101108005,101108006,101108007,101108008,101108009,101108010,101108011,101108012,101108013,101108014,101108015,101108016,101108017,101108018,101108019,101108020,101108021,101108022,101108023,101108024,101108025,101108026,101108027,101108028,101108029,101108030,101109001,101109002,101109003,101109004,101109005,101109006,101109007,101109008,101109009,101109010,101109011,101109012,101109013,101109014,101109015,101109016,101109017,101109018,101109019,101109020,101109021,101109022,101109023,101109024,101109025,101109026,101109027,101109028,101109029,101109030,101110001,101110002,101110003,101110004,101110005,101110006,101110007,101110008,101110009,101110010,101110011,101110012,101110013,101110014,101110015,101110016,101110017,101110018,101110019,101110020,101110021,101110022,101110023,101110024,101110025,101110026,101110027,101110028,101110029,101110030,101111001,101111002,101111003,101111004,101111005,101111006,101111007,101111008,101111009,101111010,101111011,101111012,101111013,101111014,101111015,101111016,101111017,101111018,101111019,101111020,101111021,101111022,101111023,101111024,101111025,101111026,101111027,101111028,101111029,101111030,101112001,101112002,101112003,101112004,101112005,101112006,101112007,101112008,101112009,101112010,101112011,101112012,101112013,101112014,101112015,101112016,101112017,101112018,101112019,101112020,101112021,101112022,101112023,101112024,101112025,101112026,101112027,101112028,101112029,101112030,101113001,101113002,101113003,101113004,101113005,101113006,101113007,101113008,101113009,101113010,101113011,101113012,101113013,101113014,101113015,101113016,101113017,101113018,101113019,101113020,101113021,101113022,101113023,101113024,101113025,101113026,101113027,101113028,101113029,101113030,101114001,101114002,101114003,101114004,101114005,101114006,101114007,101114008,101114009,101114010,101114011,101114012,101114013,101114014,101114015,101114016,101114017,101114018,101114019,101114020,101114021,101114022,101114023,101114024,101114025,101114026,101114027,101114028,101114029,101114030,101115001,101115002,101115003,101115004,101115005,101115006,101115007,101115008,101115009,101115010,101115011,101115012,101115013,101115014,101115015,101115016,101115017,101115018,101115019,101115020,101115021,101115022,101115023,101115024,101115025,101115026,101115027,101115028,101115029,101115030,101116001,101116002,101116003,101116004,101116005,101116006,101116007,101116008,101116009,101116010,101116011,101116012,101116013,101116014,101116015,101116016,101116017,101116018,101116019,101116020,101116021,101116022,101116023,101116024,101116025,101116026,101116027,101116028,101116029,101116030,101117001,101117002,101117003,101117004,101117005,101117006,101117007,101117008,101117009,101117010,101117011,101117012,101117013,101117014,101117015,101117016,101117017,101117018,101117019,101117020,101117021,101117022,101117023,101117024,101117025,101117026,101117027,101117028,101117029,101117030,101118001,101118002,101118003,101118004,101118005,101118006,101118007,101118008,101118009,101118010,101118011,101118012,101118013,101118014,101118015,101118016,101118017,101118018,101118019,101118020,101118021,101118022,101118023,101118024,101118025,101118026,101118027,101118028,101118029,101118030,101119001,101119002,101119003,101119004,101119005,101119006,101119007,101119008,101119009,101119010,101119011,101119012,101119013,101119014,101119015,101119016,101119017,101119018,101119019,101119020,101119021,101119022,101119023,101119024,101119025,101119026,101119027,101119028,101119029,101119030,101120001,101120002,101120003,101120004,101120005,101120006,101120007,101120008,101120009,101120010,101120011,101120012,101120013,101120014,101120015,101120016,101120017,101120018,101120019,101120020,101120021,101120022,101120023,101120024,101120025,101120026,101120027,101120028,101120029,101120030,101121001,101121002,101121003,101121004,101121005,101121006,101121007,101121008,101121009,101121010,101121011,101121012,101121013,101121014,101121015,101121016,101121017,101121018,101121019,101121020,101121021,101121022,101121023,101121024,101121025,101121026,101121027,101121028,101121029,101121030,101122001,101122002,101122003,101122004,101122005,101122006,101122007,101122008,101122009,101122010,101122011,101122012,101122013,101122014,101122015,101122016,101122017,101122018,101122019,101122020,101122021,101122022,101122023,101122024,101122025,101122026,101122027,101122028,101122029,101122030,201201001,201201002,201201003,201201004,201201005,201201006,201201007,201201008,201201009,201201010,201201011,201201012,201201013,201201014,201201015,201201016,201201017,201201018,201201019,201201020,201201021,201201022,201201023,201201024,201201025,201201026,201201027,201201028,201201029,201201030,101201001,101201002,101201003,101201004,101201005,101201006,101201007,101201008,101201009,101201010,101201011,101201012,101201013,101201014,101201015,101201016,101201017,101201018,101201019,101201020,101201021,101201022,101201023,101201024,101201025,101201026,101201027,101201028,101201029,101201030,201202001,201202002,201202003,201202004,201202005,201202006,201202007,201202008,201202009,201202010,201202011,201202012,201202013,201202014,201202015,201202016,201202017,201202018,201202019,201202020,201202021,201202022,201202023,201202024,201202025,201202026,201202027,201202028,201202029,201202030,101202001,101202002,101202003,101202004,101202005,101202006,101202007,101202008,101202009,101202010,101202011,101202012,101202013,101202014,101202015,101202016,101202017,101202018,101202019,101202020,101202021,101202022,101202023,101202024,101202025,101202026,101202027,101202028,101202029,101202030,201203001,201203002,201203003,201203004,201203005,201203006,201203007,201203008,201203009,201203010,201203011,201203012,201203013,201203014,201203015,201203016,201203017,201203018,201203019,201203020,201203021,201203022,201203023,201203024,201203025,201203026,201203027,201203028,201203029,201203030,201204001,201204002,201204003,201204004,201204005,201204006,201204007,201204008,201204009,201204010,201204011,201204012,201204013,201204014,201204015,201204016,201204017,201204018,201204019,201204020,201204021,201204022,201204023,201204024,201204025,201204026,201204027,201204028,201204029,201204030,101203001,101203002,101203003,101203004,101203005,101203006,101203007,101203008,101203009,101203010,101203011,101203012,101203013,101203014,101203015,101203016,101203017,101203018,101203019,101203020,101203021,101203022,101203023,101203024,101203025,101203026,101203027,101203028,101203029,101203030,201205001,201205002,201205003,201205004,201205005,201205006,201205007,201205008,201205009,201205010,201205011,201205012,201205013,201205014,201205015,201205016,201205017,201205018,201205019,201205020,201205021,201205022,201205023,201205024,201205025,201205026,201205027,201205028,201205029,201205030,101301001,101301002,101301003,101301004,101301005,101301006,101301007,101301008,101301009,101301010,101301011,101301012,101301013,101301014,101301015,101301016,101301017,101301018,101301019,101301020,101301021,101301022,101301023,101301024,101301025,101301026,101301027,101301028,101301029,101301030,101302001,101302002,101302003,101302004,101302005,101302006,101302007,101302008,101302009,101302010,101302011,101302012,101302013,101302014,101302015,101302016,101302017,101302018,101302019,101302020,101302021,101302022,101302023,101302024,101302025,101302026,101302027,101302028,101302029,101302030,201301001,201301002,201301003,201301004,201301005,201301006,201301007,201301008,201301009,201301010,201301011,201301012,201301013,201301014,201301015,201301016,201301017,201301018,201301019,201301020,201301021,201301022,201301023,201301024,201301025,201301026,201301027,201301028,201301029,201301030,201302001,201302002,201302003,201302004,201302005,201302006,201302007,201302008,201302009,201302010,201302011,201302012,201302013,201302014,201302015,201302016,201302017,201302018,201302019,201302020,201302021,201302022,201302023,201302024,201302025,201302026,201302027,201302028,201302029,201302030,201303001,201303002,201303003,201303004,201303005,201303006,201303007,201303008,201303009,201303010,201303011,201303012,201303013,201303014,201303015,201303016,201303017,201303018,201303019,201303020,201303021,201303022,201303023,201303024,201303025,201303026,201303027,201303028,201303029,201303030,201304001,201304002,201304003,201304004,201304005,201304006,201304007,201304008,201304009,201304010,201304011,201304012,201304013,201304014,201304015,201304016,201304017,201304018,201304019,201304020,201304021,201304022,201304023,201304024,201304025,201304026,201304027,201304028,201304029,201304030,101303001,101303002,101303003,101303004,101303005,101303006,101303007,101303008,101303009,101303010,101303011,101303012,101303013,101303014,101303015,101303016,101303017,101303018,101303019,101303020,101303021,101303022,101303023,101303024,101303025,101303026,101303027,101303028,101303029,101303030,201305001,201305002,201305003,201305004,201305005,201305006,201305007,201305008,201305009,201305010,201305011,201305012,201305013,201305014,201305015,201305016,201305017,201305018,201305019,201305020,201305021,201305022,201305023,201305024,201305025,201305026,201305027,201305028,201305029,201305030,201401001,201401002,201401003,201401004,201401005,201401006,201401007,201401008,201401009,201401010,201401011,201401012,201401013,201401014,201401015,201401016,201401017,201401018,201401019,201401020,201401021,201401022,201401023,201401024,201401025,201401026,201401027,201401028,201401029,201401030,201402001,201402002,201402003,201402004,201402005,201402006,201402007,201402008,201402009,201402010,201402011,201402012,201402013,201402014,201402015,201402016,201402017,201402018,201402019,201402020,201402021,201402022,201402023,201402024,201402025,201402026,201402027,201402028,201402029,201402030,201403001,201403002,201403003,201403004,201403005,201403006,201403007,201403008,201403009,201403010,201403011,201403012,201403013,201403014,201403015,201403016,201403017,201403018,201403019,201403020,201403021,201403022,201403023,201403024,201403025,201403026,201403027,201403028,201403029,201403030,101401001,101401002,101401003,101401004,101401005,101401006,101401007,101401008,101401009,101401010,101401011,101401012,101401013,101401014,101401015,101401016,101401017,101401018,101401019,101401020,101401021,101401022,101401023,101401024,101401025,101401026,101401027,101401028,101401029,101401030,201404001,201404002,201404003,201404004,201404005,201404006,201404007,201404008,201404009,201404010,201404011,201404012,201404013,201404014,201404015,201404016,201404017,201404018,201404019,201404020,201404021,201404022,201404023,201404024,201404025,201404026,201404027,201404028,201404029,201404030,101402001,101402002,101402003,101402004,101402005,101402006,101402007,101402008,101402009,101402010,101402011,101402012,101402013,101402014,101402015,101402016,101402017,101402018,101402019,101402020,101402021,101402022,101402023,101402024,101402025,101402026,101402027,101402028,101402029,101402030,101403001,101403002,101403003,101403004,101403005,101403006,101403007,101403008,101403009,101403010,101403011,101403012,101403013,101403014,101403015,101403016,101403017,101403018,101403019,101403020,101403021,101403022,101403023,101403024,101403025,101403026,101403027,101403028,101403029,101403030,201405001,201405002,201405003,201405004,201405005,201405006,201405007,201405008,201405009,201405010,201405011,201405012,201405013,201405014,201405015,201405016,201405017,201405018,201405019,201405020,201405021,201405022,201405023,201405024,201405025,201405026,201405027,201405028,201405029,201405030,201501001,201501002,201501003,201501004,201501005,201501006,201501007,201501008,201501009,201501010,201501011,201501012,201501013,201501014,201501015,201501016,201501017,201501018,201501019,201501020,201501021,201501022,201501023,201501024,201501025,201501026,201501027,201501028,201501029,201501030,101501001,101501002,101501003,101501004,101501005,101501006,101501007,101501008,101501009,101501010,101501011,101501012,101501013,101501014,101501015,101501016,101501017,101501018,101501019,101501020,101501021,101501022,101501023,101501024,101501025,101501026,101501027,101501028,101501029,101501030,201502001,201502002,201502003,201502004,201502005,201502006,201502007,201502008,201502009,201502010,201502011,201502012,201502013,201502014,201502015,201502016,201502017,201502018,201502019,201502020,201502021,201502022,201502023,201502024,201502025,201502026,201502027,201502028,201502029,201502030,201503001,201503002,201503003,201503004,201503005,201503006,201503007,201503008,201503009,201503010,201503011,201503012,201503013,201503014,201503015,201503016,201503017,201503018,201503019,201503020,201503021,201503022,201503023,201503024,201503025,201503026,201503027,201503028,201503029,201503030,201504001,201504002,201504003,201504004,201504005,201504006,201504007,201504008,201504009,201504010,201504011,201504012,201504013,201504014,201504015,201504016,201504017,201504018,201504019,201504020,201504021,201504022,201504023,201504024,201504025,201504026,201504027,201504028,201504029,201504030,101502001,101502002,101502003,101502004,101502005,101502006,101502007,101502008,101502009,101502010,101502011,101502012,101502013,101502014,101502015,101502016,101502017,101502018,101502019,101502020,101502021,101502022,101502023,101502024,101502025,101502026,101502027,101502028,101502029,101502030,101503001,101503002,101503003,101503004,101503005,101503006,101503007,101503008,101503009,101503010,101503011,101503012,101503013,101503014,101503015,101503016,101503017,101503018,101503019,101503020,101503021,101503022,101503023,101503024,101503025,101503026,101503027,101503028,101503029,101503030,201505001,201505002,201505003,201505004,201505005,201505006,201505007,201505008,201505009,201505010,201505011,201505012,201505013,201505014,201505015,201505016,201505017,201505018,201505019,201505020,201505021,201505022,201505023,201505024,201505025,201505026,201505027,201505028,201505029,201505030,201601001,201601002,201601003,201601004,201601005,201601006,201601007,201601008,201601009,201601010,201601011,201601012,201601013,201601014,201601015,201601016,201601017,201601018,201601019,201601020,201601021,201601022,201601023,201601024,201601025,201601026,201601027,201601028,201601029,201601030,201602001,201602002,201602003,201602004,201602005,201602006,201602007,201602008,201602009,201602010,201602011,201602012,201602013,201602014,201602015,201602016,201602017,201602018,201602019,201602020,201602021,201602022,201602023,201602024,201602025,201602026,201602027,201602028,201602029,201602030,201603001,201603002,201603003,201603004,201603005,201603006,201603007,201603008,201603009,201603010,201603011,201603012,201603013,201603014,201603015,201603016,201603017,201603018,201603019,201603020,201603021,201603022,201603023,201603024,201603025,201603026,201603027,201603028,201603029,201603030,201604001,201604002,201604003,201604004,201604005,201604006,201604007,201604008,201604009,201604010,201604011,201604012,201604013,201604014,201604015,201604016,201604017,201604018,201604019,201604020,201604021,201604022,201604023,201604024,201604025,201604026,201604027,201604028,201604029,201604030,201605001,201605002,201605003,201605004,201605005,201605006,201605007,201605008,201605009,201605010,201605011,201605012,201605013,201605014,201605015,201605016,201605017,201605018,201605019,201605020,201605021,201605022,201605023,201605024,201605025,201605026,201605027,201605028,201605029,201605030,201606001,201606002,201606003,201606004,201606005,201606006,201606007,201606008,201606009,201606010,201606011,201606012,201606013,201606014,201606015,201606016,201606017,201606018,201606019,201606020,201606021,201606022,201606023,201606024,201606025,201606026,201606027,201606028,201606029,201606030,201607001,201607002,201607003,201607004,201607005,201607006,201607007,201607008,201607009,201607010,201607011,201607012,201607013,201607014,201607015,201607016,201607017,201607018,201607019,201607020,201607021,201607022,201607023,201607024,201607025,201607026,201607027,201607028,201607029,201607030,201608001,201608002,201608003,201608004,201608005,201608006,201608007,201608008,201608009,201608010,201608011,201608012,201608013,201608014,201608015,201608016,201608017,201608018,201608019,201608020,201608021,201608022,201608023,201608024,201608025,201608026,201608027,201608028,201608029,201608030,201609001,201609002,201609003,201609004,201609005,201609006,201609007,201609008,201609009,201609010,201609011,201609012,201609013,201609014,201609015,201609016,201609017,201609018,201609019,201609020,201609021,201609022,201609023,201609024,201609025,201610001,201610002,201610003,201610004,201610005,201610006,201610007,201610008,201610009,201610010,201610011,201610012,201610013,201610014,201610015,201610016,201610017,201610018,201610019,201610020,201610021,201610022,201610023,201610024,201610025,201611001,201611002,201611003,201611004,201611005,201611006,201611007,201611008,201611009,201611010,201611011,201611012,201611013,201611014,201611015,201611016,201611017,201611018,201611019,201611020,201611021,201611022,201611023,201611024,201611025,201612001,201612002,201612003,201612004,201612005,201612006,201612007,201612008,201612009,201612010,201612011,201612012,201612013,201612014,201612015,201612016,201612017,201612018,201612019,201612020,201612021,201612022,201612023,201612024,201612025,201613001,201613002,201613003,201613004,201613005,201613006,201613007,201613008,201613009,201613010,201613011,201613012,201613013,201613014,201613015,201613016,201613017,201613018,201613019,201613020,201613021,201613022,201613023,201613024,201613025,201613026,201613027,201613028,201613029,201613030,201614001,201614002,201614003,201614004,201614005,201614006,201614007,201614008,201614009,201614010,201614011,201614012,201614013,201614014,201614015,201614016,201614017,201614018,201614019,201614020,201614021,201614022,201614023,201614024,201614025,201614026,201614027,201614028,201614029,201614030,201615001,201615002,201615003,201615004,201615005,201615006,201615007,201615008,201615009,201615010,201615011,201615012,201615013,201615014,201615015,201615016,201615017,201615018,201615019,201615020,201615021,201615022,201615023,201615024,201615025,201615026,201615027,201615028,201615029,201615030,201616001,201616002,201616003,201616004,201616005,201616006,201616007,201616008,201616009,201616010,201616011,201616012,201616013,201616014,201616015,201616016,201616017,201616018,201616019,201616020,201616021,201616022,201616023,201616024,201616025,201616026,201616027,201616028,201616029,201616030,201617001,201617002,201617003,201617004,201617005,201617006,201617007,201617008,201617009,201617010,201617011,201617012,201617013,201617014,201617015,201617016,201617017,201617018,201617019,201617020,201617021,201617022,201617023,201617024,201617025,201617026,201617027,201617028,201617029,201617030,201618001,201618002,201618003,201618004,201618005,201618006,201618007,201618008,201618009,201618010,201618011,201618012,201618013,201618014,201618015,201618016,201618017,201618018,201618019,201618020,201618021,201618022,201618023,201618024,201618025,201618026,201618027,201618028,201618029,201618030,201619001,201619002,201619003,201619004,201619005,201619006,201619007,201619008,201619009,201619010,201619011,201619012,201619013,201619014,201619015,201619016,201619017,201619018,201619019,201619020,201619021,201619022,201619023,201619024,201619025,201619026,201619027,201619028,201619029,201619030,201620001,201620002,201620003,201620004,201620005,201620006,201620007,201620008,201620009,201620010,201620011,201620012,201620013,201620014,201620015,201620016,201620017,201620018,201620019,201620020,201620021,201620022,201620023,201620024,201620025,201620026,201620027,201620028,201620029,201620030,201621001,201621002,201621003,201621004,201621005,201621006,201621007,201621008,201621009,201621010,201621011,201621012,201621013,201621014,201621015,201621016,201621017,201621018,201621019,201621020,201621021,201621022,201621023,201621024,201621025,201621026,201621027,201621028,201621029,201621030,201701001,201701002,201701003,201701004,201701005,201701006,201701007,201701008,201701009,201701010,201701011,201701012,201701013,201701014,201701015,201701016,201701017,201701018,201701019,201701020,201701021,201701022,201701023,201701024,201701025,201701026,201701027,201701028,201701029,201701030,201702001,201702002,201702003,201702004,201702005,201702006,201702007,201702008,201702009,201702010,201702011,201702012,201702013,201702014,201702015,201702016,201702017,201702018,201702019,201702020,201702021,201702022,201702023,201702024,201702025,201702026,201702027,201702028,201702029,201702030,201703001,201703002,201703003,201703004,201703005,201703006,201703007,201703008,201703009,201703010,201703011,201703012,201703013,201703014,201703015,201703016,201703017,201703018,201703019,201703020,201703021,201703022,201703023,201703024,201703025,201703026,201703027,201703028,201703029,201703030,201704001,201704002,201704003,201704004,201704005,201704006,201704007,201704008,201704009,201704010,201704011,201704012,201704013,201704014,201704015,201704016,201704017,201704018,201704019,201704020,201704021,201704022,201704023,201704024,201704025,201704026,201704027,201704028,201704029,201704030,201705001,201705002,201705003,201705004,201705005,201705006,201705007,201705008,201705009,201705010,201705011,201705012,201705013,201705014,201705015,201705016,201705017,201705018,201705019,201705020,201705021,201705022,201705023,201705024,201705025,201705026,201705027,201705028,201705029,201705030,201706001,201706002,201706003,201706004,201706005,201706006,201706007,201706008,201706009,201706010,201706011,201706012,201706013,201706014,201706015,201706016,201706017,201706018,201706019,201706020,201706021,201706022,201706023,201706024,201706025,201706026,201706027,201706028,201706029,201706030,201707001,201707002,201707003,201707004,201707005,201707006,201707007,201707008,201707009,201707010,201707011,201707012,201707013,201707014,201707015,201707016,201707017,201707018,201707019,201707020,201707021,201707022,201707023,201707024,201707025,201707026,201707027,201707028,201707029,201707030,201708001,201708002,201708003,201708004,201708005,201708006,201708007,201708008,201708009,201708010,201708011,201708012,201708013,201708014,201708015,201708016,201708017,201708018,201708019,201708020,201708021,201708022,201708023,201708024,201708025,201708026,201708027,201708028,201708029,201708030].
