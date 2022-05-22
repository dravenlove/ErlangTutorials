%%--- coding:utf-8 ---
-module(tb_activity).
-export([get/1,get_list/0]).
get(11)-> #{
    'id' => 11,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1440
};
get(12)-> #{
    'id' => 12,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200,
    'tips' => 2,
    'tips_time' => 1440
};
get(13)-> #{
    'id' => 13,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(14)-> #{
    'id' => 14,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         7,
         459
    ],
    'duration_min' => 10080
};
get(15)-> #{
    'id' => 15,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 2,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200
};
get(16)-> #{
    'id' => 16,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 2,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(17)-> #{
    'id' => 17,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(18)-> #{
    'id' => 18,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 3,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200
};
get(19)-> #{
    'id' => 19,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 3,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(111)-> #{
    'id' => 111,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         7,
         459
    ],
    'duration_min' => 10080
};
get(112)-> #{
    'id' => 112,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200
};
get(113)-> #{
    'id' => 113,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(114)-> #{
    'id' => 114,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1440
};
get(115)-> #{
    'id' => 115,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 2,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200
};
get(116)-> #{
    'id' => 116,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 2,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(117)-> #{
    'id' => 117,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         7,
         459
    ],
    'duration_min' => 10080
};
get(118)-> #{
    'id' => 118,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 3,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200,
    'tips' => 2,
    'tips_time' => 1440
};
get(119)-> #{
    'id' => 119,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 3,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(211)-> #{
    'id' => 211,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(212)-> #{
    'id' => 212,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200
};
get(213)-> #{
    'id' => 213,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(214)-> #{
    'id' => 214,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         7,
         459
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1440
};
get(215)-> #{
    'id' => 215,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 2,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200
};
get(216)-> #{
    'id' => 216,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 2,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         0,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(217)-> #{
    'id' => 217,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         7,
         459
    ],
    'duration_min' => 10080
};
get(218)-> #{
    'id' => 218,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 3,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628121600,
    'end_season' => [
        0,
         7,
         501
    ],
    'end_date' => 1629421200,
    'tips' => 2,
    'tips_time' => 1440
};
get(219)-> #{
    'id' => 219,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 3,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(21)-> #{
    'id' => 21,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1440
};
get(22)-> #{
    'id' => 22,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200,
    'tips' => 2,
    'tips_time' => 1440
};
get(23)-> #{
    'id' => 23,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(24)-> #{
    'id' => 24,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         14,
         501
    ],
    'duration_min' => 10080,
    'tips' => 4,
    'tips_time' => 1440
};
get(25)-> #{
    'id' => 25,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 2,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200
};
get(26)-> #{
    'id' => 26,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 2,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(27)-> #{
    'id' => 27,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(28)-> #{
    'id' => 28,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 3,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200
};
get(29)-> #{
    'id' => 29,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 3,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(121)-> #{
    'id' => 121,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         14,
         501
    ],
    'duration_min' => 10080
};
get(122)-> #{
    'id' => 122,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200
};
get(123)-> #{
    'id' => 123,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(124)-> #{
    'id' => 124,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1440
};
get(125)-> #{
    'id' => 125,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 2,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200
};
get(126)-> #{
    'id' => 126,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 2,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(127)-> #{
    'id' => 127,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         14,
         501
    ],
    'duration_min' => 10080
};
get(128)-> #{
    'id' => 128,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 3,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200,
    'tips' => 2,
    'tips_time' => 1440
};
get(129)-> #{
    'id' => 129,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 3,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(221)-> #{
    'id' => 221,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(222)-> #{
    'id' => 222,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200
};
get(223)-> #{
    'id' => 223,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(224)-> #{
    'id' => 224,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         14,
         501
    ],
    'duration_min' => 10080,
    'tips' => 4,
    'tips_time' => 1440
};
get(225)-> #{
    'id' => 225,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 2,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200
};
get(226)-> #{
    'id' => 226,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 2,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080
};
get(227)-> #{
    'id' => 227,
    'main_type' => 1003,
    'index' => 100,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        0,
         14,
         501
    ],
    'duration_min' => 10080
};
get(228)-> #{
    'id' => 228,
    'main_type' => 1003,
    'index' => 101,
    'server_type' => 3,
    'time_type' => 2,
    'start_season' => [
        0,
         1,
         500
    ],
    'start_date' => 1628553600,
    'end_season' => [
        0,
         14,
         501
    ],
    'end_date' => 1629421200,
    'tips' => 2,
    'tips_time' => 1440
};
get(229)-> #{
    'id' => 229,
    'main_type' => 1003,
    'index' => 102,
    'server_type' => 3,
    'time_type' => 3,
    'start_festival' => [
        <<"jieqi_test"/utf8>>,
         5,
         500
    ],
    'end_season' => [
        0,
         45,
         2359
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(100001001)-> #{
    'id' => 100001001,
    'main_type' => 1004,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         4,
         500
    ],
    'end_season' => [
        0,
         7,
         459
    ],
    'duration_min' => 4320
};
get(100001002)-> #{
    'id' => 100001002,
    'main_type' => 1004,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         10,
         500
    ],
    'end_season' => [
        0,
         13,
         459
    ],
    'duration_min' => 4320
};
get(100001003)-> #{
    'id' => 100001003,
    'main_type' => 1004,
    'index' => 103,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         16,
         500
    ],
    'end_season' => [
        0,
         19,
         459
    ],
    'duration_min' => 4320
};
get(100001004)-> #{
    'id' => 100001004,
    'main_type' => 1004,
    'index' => 104,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         21,
         500
    ],
    'end_season' => [
        0,
         24,
         459
    ],
    'duration_min' => 4320
};
get(100001005)-> #{
    'id' => 100001005,
    'main_type' => 1004,
    'index' => 105,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         27,
         500
    ],
    'end_season' => [
        0,
         30,
         459
    ],
    'duration_min' => 4320
};
get(100001006)-> #{
    'id' => 100001006,
    'main_type' => 1004,
    'index' => 106,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         33,
         500
    ],
    'end_season' => [
        0,
         36,
         459
    ],
    'duration_min' => 4320
};
get(100001007)-> #{
    'id' => 100001007,
    'main_type' => 1004,
    'index' => 107,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         39,
         500
    ],
    'end_season' => [
        0,
         42,
         459
    ],
    'duration_min' => 4320
};
get(100001008)-> #{
    'id' => 100001008,
    'main_type' => 1004,
    'index' => 108,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         45,
         500
    ],
    'end_season' => [
        0,
         48,
         459
    ],
    'duration_min' => 4320
};
get(100001009)-> #{
    'id' => 100001009,
    'main_type' => 1004,
    'index' => 201,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         4,
         500
    ],
    'end_season' => [
        1,
         7,
         459
    ],
    'duration_min' => 4320
};
get(100001010)-> #{
    'id' => 100001010,
    'main_type' => 1004,
    'index' => 202,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         9,
         500
    ],
    'end_season' => [
        1,
         11,
         459
    ],
    'duration_min' => 2880
};
get(100001011)-> #{
    'id' => 100001011,
    'main_type' => 1004,
    'index' => 203,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         13,
         500
    ],
    'end_season' => [
        1,
         15,
         459
    ],
    'duration_min' => 2880
};
get(100001012)-> #{
    'id' => 100001012,
    'main_type' => 1004,
    'index' => 204,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         17,
         500
    ],
    'end_season' => [
        1,
         19,
         459
    ],
    'duration_min' => 2880
};
get(100001013)-> #{
    'id' => 100001013,
    'main_type' => 1004,
    'index' => 205,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         21,
         500
    ],
    'end_season' => [
        1,
         23,
         459
    ],
    'duration_min' => 2880
};
get(100001014)-> #{
    'id' => 100001014,
    'main_type' => 1004,
    'index' => 206,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         25,
         500
    ],
    'end_season' => [
        1,
         27,
         459
    ],
    'duration_min' => 2880
};
get(100001015)-> #{
    'id' => 100001015,
    'main_type' => 1004,
    'index' => 207,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         29,
         500
    ],
    'end_season' => [
        1,
         32,
         459
    ],
    'duration_min' => 4320
};
get(100001016)-> #{
    'id' => 100001016,
    'main_type' => 1004,
    'index' => 208,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         35,
         500
    ],
    'end_season' => [
        1,
         38,
         459
    ],
    'duration_min' => 4320
};
get(100001017)-> #{
    'id' => 100001017,
    'main_type' => 1004,
    'index' => 209,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         41,
         500
    ],
    'end_season' => [
        1,
         44,
         459
    ],
    'duration_min' => 4320
};
get(100001018)-> #{
    'id' => 100001018,
    'main_type' => 1004,
    'index' => 210,
    'server_type' => 2,
    'time_type' => 1,
    'start_season' => [
        1,
         47,
         500
    ],
    'end_season' => [
        1,
         50,
         459
    ],
    'duration_min' => 4320
};
get(100001019)-> #{
    'id' => 100001019,
    'main_type' => 1004,
    'index' => 301,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         4,
         500
    ],
    'end_season' => [
        2,
         7,
         459
    ],
    'duration_min' => 4320
};
get(100001020)-> #{
    'id' => 100001020,
    'main_type' => 1004,
    'index' => 302,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         10,
         500
    ],
    'end_season' => [
        2,
         13,
         459
    ],
    'duration_min' => 4320
};
get(100001021)-> #{
    'id' => 100001021,
    'main_type' => 1004,
    'index' => 303,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         16,
         500
    ],
    'end_season' => [
        2,
         19,
         459
    ],
    'duration_min' => 4320
};
get(100001022)-> #{
    'id' => 100001022,
    'main_type' => 1004,
    'index' => 304,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         22,
         500
    ],
    'end_season' => [
        2,
         25,
         459
    ],
    'duration_min' => 4320
};
get(100001023)-> #{
    'id' => 100001023,
    'main_type' => 1004,
    'index' => 305,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         28,
         500
    ],
    'end_season' => [
        2,
         31,
         459
    ],
    'duration_min' => 4320
};
get(100001024)-> #{
    'id' => 100001024,
    'main_type' => 1004,
    'index' => 306,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         34,
         500
    ],
    'end_season' => [
        2,
         37,
         459
    ],
    'duration_min' => 4320
};
get(100001025)-> #{
    'id' => 100001025,
    'main_type' => 1004,
    'index' => 307,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         40,
         500
    ],
    'end_season' => [
        2,
         43,
         459
    ],
    'duration_min' => 4320
};
get(100001026)-> #{
    'id' => 100001026,
    'main_type' => 1004,
    'index' => 308,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         46,
         500
    ],
    'end_season' => [
        2,
         49,
         459
    ],
    'duration_min' => 4320
};
get(100001027)-> #{
    'id' => 100001027,
    'main_type' => 1004,
    'index' => 309,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         52,
         500
    ],
    'end_season' => [
        2,
         55,
         459
    ],
    'duration_min' => 4320
};
get(100001028)-> #{
    'id' => 100001028,
    'main_type' => 1004,
    'index' => 310,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         58,
         500
    ],
    'end_season' => [
        2,
         61,
         459
    ],
    'duration_min' => 4320
};
get(100001029)-> #{
    'id' => 100001029,
    'main_type' => 1004,
    'index' => 311,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         64,
         500
    ],
    'end_season' => [
        2,
         67,
         459
    ],
    'duration_min' => 4320
};
get(100001030)-> #{
    'id' => 100001030,
    'main_type' => 1004,
    'index' => 312,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         70,
         500
    ],
    'end_season' => [
        2,
         73,
         459
    ],
    'duration_min' => 4320
};
get(100001031)-> #{
    'id' => 100001031,
    'main_type' => 1004,
    'index' => 313,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         76,
         500
    ],
    'end_season' => [
        2,
         79,
         459
    ],
    'duration_min' => 4320
};
get(100001032)-> #{
    'id' => 100001032,
    'main_type' => 1004,
    'index' => 314,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         82,
         500
    ],
    'end_season' => [
        2,
         85,
         459
    ],
    'duration_min' => 4320
};
get(100001033)-> #{
    'id' => 100001033,
    'main_type' => 1004,
    'index' => 315,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         88,
         500
    ],
    'end_season' => [
        2,
         91,
         459
    ],
    'duration_min' => 4320
};
get(100001034)-> #{
    'id' => 100001034,
    'main_type' => 1004,
    'index' => 316,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        2,
         94,
         500
    ],
    'end_season' => [
        2,
         97,
         459
    ],
    'duration_min' => 4320
};
get(100001035)-> #{
    'id' => 100001035,
    'main_type' => 1004,
    'index' => 401,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         1,
         500
    ],
    'end_season' => [
        3,
         4,
         459
    ],
    'duration_min' => 4320
};
get(100001036)-> #{
    'id' => 100001036,
    'main_type' => 1004,
    'index' => 402,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         7,
         500
    ],
    'end_season' => [
        3,
         10,
         459
    ],
    'duration_min' => 4320
};
get(100001037)-> #{
    'id' => 100001037,
    'main_type' => 1004,
    'index' => 403,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         13,
         500
    ],
    'end_season' => [
        3,
         16,
         459
    ],
    'duration_min' => 4320
};
get(100001038)-> #{
    'id' => 100001038,
    'main_type' => 1004,
    'index' => 404,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         19,
         500
    ],
    'end_season' => [
        3,
         22,
         459
    ],
    'duration_min' => 4320
};
get(100001039)-> #{
    'id' => 100001039,
    'main_type' => 1004,
    'index' => 405,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         25,
         500
    ],
    'end_season' => [
        3,
         28,
         459
    ],
    'duration_min' => 4320
};
get(100001040)-> #{
    'id' => 100001040,
    'main_type' => 1004,
    'index' => 406,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         31,
         500
    ],
    'end_season' => [
        3,
         34,
         459
    ],
    'duration_min' => 4320
};
get(100001041)-> #{
    'id' => 100001041,
    'main_type' => 1004,
    'index' => 407,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         37,
         500
    ],
    'end_season' => [
        3,
         40,
         459
    ],
    'duration_min' => 4320
};
get(100001042)-> #{
    'id' => 100001042,
    'main_type' => 1004,
    'index' => 408,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         43,
         500
    ],
    'end_season' => [
        3,
         46,
         459
    ],
    'duration_min' => 4320
};
get(100001043)-> #{
    'id' => 100001043,
    'main_type' => 1004,
    'index' => 409,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         49,
         500
    ],
    'end_season' => [
        3,
         52,
         459
    ],
    'duration_min' => 4320
};
get(100001044)-> #{
    'id' => 100001044,
    'main_type' => 1004,
    'index' => 410,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         55,
         500
    ],
    'end_season' => [
        3,
         58,
         459
    ],
    'duration_min' => 4320
};
get(100001045)-> #{
    'id' => 100001045,
    'main_type' => 1004,
    'index' => 411,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         61,
         500
    ],
    'end_season' => [
        3,
         64,
         459
    ],
    'duration_min' => 4320
};
get(100001046)-> #{
    'id' => 100001046,
    'main_type' => 1004,
    'index' => 412,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         67,
         500
    ],
    'end_season' => [
        3,
         70,
         459
    ],
    'duration_min' => 4320
};
get(100001047)-> #{
    'id' => 100001047,
    'main_type' => 1004,
    'index' => 413,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         73,
         500
    ],
    'end_season' => [
        3,
         76,
         459
    ],
    'duration_min' => 4320
};
get(100001048)-> #{
    'id' => 100001048,
    'main_type' => 1004,
    'index' => 414,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         79,
         500
    ],
    'end_season' => [
        3,
         82,
         459
    ],
    'duration_min' => 4320
};
get(100001049)-> #{
    'id' => 100001049,
    'main_type' => 1004,
    'index' => 415,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         85,
         500
    ],
    'end_season' => [
        3,
         88,
         459
    ],
    'duration_min' => 4320
};
get(100001050)-> #{
    'id' => 100001050,
    'main_type' => 1004,
    'index' => 416,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         91,
         500
    ],
    'end_season' => [
        3,
         94,
         459
    ],
    'duration_min' => 4320
};
get(100001051)-> #{
    'id' => 100001051,
    'main_type' => 1004,
    'index' => 417,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         97,
         500
    ],
    'end_season' => [
        3,
         100,
         459
    ],
    'duration_min' => 4320
};
get(100001052)-> #{
    'id' => 100001052,
    'main_type' => 1004,
    'index' => 418,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         103,
         500
    ],
    'end_season' => [
        3,
         106,
         459
    ],
    'duration_min' => 4320
};
get(100001053)-> #{
    'id' => 100001053,
    'main_type' => 1004,
    'index' => 419,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         109,
         500
    ],
    'end_season' => [
        3,
         112,
         459
    ],
    'duration_min' => 4320
};
get(100001054)-> #{
    'id' => 100001054,
    'main_type' => 1004,
    'index' => 420,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         115,
         500
    ],
    'end_season' => [
        3,
         118,
         459
    ],
    'duration_min' => 4320
};
get(100001055)-> #{
    'id' => 100001055,
    'main_type' => 1004,
    'index' => 421,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         121,
         500
    ],
    'end_season' => [
        3,
         124,
         459
    ],
    'duration_min' => 4320
};
get(100001056)-> #{
    'id' => 100001056,
    'main_type' => 1004,
    'index' => 422,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         127,
         500
    ],
    'end_season' => [
        3,
         130,
         459
    ],
    'duration_min' => 4320
};
get(100001057)-> #{
    'id' => 100001057,
    'main_type' => 1004,
    'index' => 423,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         133,
         500
    ],
    'end_season' => [
        3,
         136,
         459
    ],
    'duration_min' => 4320
};
get(100001058)-> #{
    'id' => 100001058,
    'main_type' => 1004,
    'index' => 424,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         139,
         500
    ],
    'end_season' => [
        3,
         142,
         459
    ],
    'duration_min' => 4320
};
get(100001059)-> #{
    'id' => 100001059,
    'main_type' => 1004,
    'index' => 425,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         145,
         500
    ],
    'end_season' => [
        3,
         148,
         459
    ],
    'duration_min' => 4320
};
get(100001060)-> #{
    'id' => 100001060,
    'main_type' => 1004,
    'index' => 426,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         151,
         500
    ],
    'end_season' => [
        3,
         154,
         459
    ],
    'duration_min' => 4320
};
get(100001061)-> #{
    'id' => 100001061,
    'main_type' => 1004,
    'index' => 427,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         157,
         500
    ],
    'end_season' => [
        3,
         160,
         459
    ],
    'duration_min' => 4320
};
get(100001062)-> #{
    'id' => 100001062,
    'main_type' => 1004,
    'index' => 428,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         163,
         500
    ],
    'end_season' => [
        3,
         166,
         459
    ],
    'duration_min' => 4320
};
get(100001063)-> #{
    'id' => 100001063,
    'main_type' => 1004,
    'index' => 429,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         169,
         500
    ],
    'end_season' => [
        3,
         172,
         459
    ],
    'duration_min' => 4320
};
get(100001064)-> #{
    'id' => 100001064,
    'main_type' => 1004,
    'index' => 430,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         175,
         500
    ],
    'end_season' => [
        3,
         178,
         459
    ],
    'duration_min' => 4320
};
get(100001065)-> #{
    'id' => 100001065,
    'main_type' => 1004,
    'index' => 431,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         181,
         500
    ],
    'end_season' => [
        3,
         184,
         459
    ],
    'duration_min' => 4320
};
get(100001066)-> #{
    'id' => 100001066,
    'main_type' => 1004,
    'index' => 432,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         187,
         500
    ],
    'end_season' => [
        3,
         190,
         459
    ],
    'duration_min' => 4320
};
get(100001067)-> #{
    'id' => 100001067,
    'main_type' => 1004,
    'index' => 433,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         193,
         500
    ],
    'end_season' => [
        3,
         196,
         459
    ],
    'duration_min' => 4320
};
get(100001068)-> #{
    'id' => 100001068,
    'main_type' => 1004,
    'index' => 434,
    'server_type' => 3,
    'time_type' => 1,
    'start_season' => [
        3,
         199,
         500
    ],
    'end_season' => [
        3,
         202,
         459
    ],
    'duration_min' => 4320
};
get(100002001)-> #{
    'id' => 100002001,
    'main_type' => 1009,
    'sub_type' => 1,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         44,
         0
    ],
    'end_season' => [
        0,
         51,
         0
    ],
    'duration_min' => 10080,
    'tips' => 3,
    'tips_time' => 1440
};
get(101101001)-> #{
    'id' => 101101001,
    'main_type' => 1011,
    'index' => 1,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'end_season' => [
        10,
         9999,
         500
    ],
    'duration_min' => 2147483647
};
get(100301001)-> #{
    'id' => 100301001,
    'main_type' => 1004,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(101101098)-> #{
  'id' => 101101098,
  'main_type' => 1003,
  'index' => 101,
  'server_type' => 1,
  'time_type' => 1,
  'start_season' => [
    0,
    1,
    500
  ],
  'end_season' => [
    10,
    9999,
    500
  ],
  'duration_min' => 2147483648
};
get(100302001)-> #{
    'id' => 100302001,
    'main_type' => 1005,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100303001)-> #{
    'id' => 100303001,
    'main_type' => 1006,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100303002)-> #{
    'id' => 100303002,
    'main_type' => 1006,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100303003)-> #{
    'id' => 100303003,
    'main_type' => 1006,
    'index' => 103,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100303004)-> #{
    'id' => 100303004,
    'main_type' => 1006,
    'index' => 104,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100303005)-> #{
    'id' => 100303005,
    'main_type' => 1006,
    'index' => 105,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100303006)-> #{
    'id' => 100303006,
    'main_type' => 1006,
    'index' => 106,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100304001)-> #{
    'id' => 100304001,
    'main_type' => 1007,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         12,
         501
    ],
    'end_season' => [
        0,
         19,
         459
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100304002)-> #{
    'id' => 100304002,
    'main_type' => 1007,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         12,
         501
    ],
    'end_season' => [
        0,
         19,
         459
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100304003)-> #{
    'id' => 100304003,
    'main_type' => 1007,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         11,
         501
    ],
    'end_season' => [
        0,
         19,
         459
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100304004)-> #{
    'id' => 100304004,
    'main_type' => 1007,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         12,
         501
    ],
    'end_season' => [
        0,
         19,
         459
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305001)-> #{
    'id' => 100305001,
    'main_type' => 1008,
    'index' => 101,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305002)-> #{
    'id' => 100305002,
    'main_type' => 1008,
    'index' => 102,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305003)-> #{
    'id' => 100305003,
    'main_type' => 1008,
    'index' => 103,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305004)-> #{
    'id' => 100305004,
    'main_type' => 1008,
    'index' => 104,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305005)-> #{
    'id' => 100305005,
    'main_type' => 1008,
    'index' => 105,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305006)-> #{
    'id' => 100305006,
    'main_type' => 1008,
    'index' => 106,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305007)-> #{
    'id' => 100305007,
    'main_type' => 1008,
    'index' => 107,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};
get(100305008)-> #{
    'id' => 100305008,
    'main_type' => 1008,
    'index' => 108,
    'server_type' => 1,
    'time_type' => 1,
    'start_season' => [
        0,
         1,
         500
    ],
    'duration_min' => 10080,
    'tips' => 1,
    'tips_time' => 1
};

get(_N) -> false.
get_list() ->
	[101101098,11,12,13,14,15,16,17,18,19,111,112,113,114,115,116,117,118,119,211,212,213,214,215,216,217,218,219,21,22,23,24,25,26,27,28,29,121,122,123,124,125,126,127,128,129,221,222,223,224,225,226,227,228,229,100001001,100001002,100001003,100001004,100001005,100001006,100001007,100001008,100001009,100001010,100001011,100001012,100001013,100001014,100001015,100001016,100001017,100001018,100001019,100001020,100001021,100001022,100001023,100001024,100001025,100001026,100001027,100001028,100001029,100001030,100001031,100001032,100001033,100001034,100001035,100001036,100001037,100001038,100001039,100001040,100001041,100001042,100001043,100001044,100001045,100001046,100001047,100001048,100001049,100001050,100001051,100001052,100001053,100001054,100001055,100001056,100001057,100001058,100001059,100001060,100001061,100001062,100001063,100001064,100001065,100001066,100001067,100001068,100002001,101101001,100301001,100302001,100303001,100303002,100303003,100303004,100303005,100303006,100304001,100304002,100304003,100304004,100305001,100305002,100305003,100305004,100305005,100305006,100305007,100305008].
