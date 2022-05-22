%%--- coding:utf-8 ---
-module(tb_single_recharge).
-export([get/1,get_list/0]).
get(1)-> #{
    'index' => 101,
    'key' => 10101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(2)-> #{
    'index' => 101,
    'key' => 10101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        101001005,
         200000
    ],
    'item_id' => 101001005
};
get(3)-> #{
    'index' => 101,
    'key' => 10101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102008003,
         3
    ],
    'item_id' => 102008003
};
get(4)-> #{
    'index' => 101,
    'key' => 10102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(5)-> #{
    'index' => 101,
    'key' => 10102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        101001006,
         300000
    ],
    'item_id' => 101001006
};
get(6)-> #{
    'index' => 101,
    'key' => 10102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102008003,
         4
    ],
    'item_id' => 102008003
};
get(7)-> #{
    'index' => 101,
    'key' => 10102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102013002,
         2
    ],
    'item_id' => 102013002
};
get(8)-> #{
    'index' => 101,
    'key' => 10102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 5,
    'reward' => [
        102016002,
         2
    ],
    'item_id' => 102016002
};
get(9)-> #{
    'index' => 101,
    'key' => 10103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(10)-> #{
    'index' => 101,
    'key' => 10103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        101001004,
         500000
    ],
    'item_id' => 101001004
};
get(11)-> #{
    'index' => 101,
    'key' => 10103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102013002,
         4
    ],
    'item_id' => 102013002
};
get(12)-> #{
    'index' => 101,
    'key' => 10103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102016002,
         4
    ],
    'item_id' => 102016002
};
get(13)-> #{
    'index' => 101,
    'key' => 10103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102005047,
         10
    ],
    'item_id' => 102005047
};
get(14)-> #{
    'index' => 101,
    'key' => 10104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(15)-> #{
    'index' => 101,
    'key' => 10104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        101001003,
         500000
    ],
    'item_id' => 101001003
};
get(16)-> #{
    'index' => 101,
    'key' => 10104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102013002,
         6
    ],
    'item_id' => 102013002
};
get(17)-> #{
    'index' => 101,
    'key' => 10104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102016002,
         6
    ],
    'item_id' => 102016002
};
get(18)-> #{
    'index' => 101,
    'key' => 10104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102005047,
         20
    ],
    'item_id' => 102005047
};
get(19)-> #{
    'index' => 101,
    'key' => 10105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(20)-> #{
    'index' => 101,
    'key' => 10105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        106002001,
         10
    ],
    'item_id' => 106002001
};
get(21)-> #{
    'index' => 101,
    'key' => 10105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(22)-> #{
    'index' => 101,
    'key' => 10105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(23)-> #{
    'index' => 101,
    'key' => 10105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102005047,
         40
    ],
    'item_id' => 102005047
};
get(24)-> #{
    'index' => 101,
    'key' => 10106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(25)-> #{
    'index' => 101,
    'key' => 10106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(26)-> #{
    'index' => 101,
    'key' => 10106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102013002,
         20
    ],
    'item_id' => 102013002
};
get(27)-> #{
    'index' => 101,
    'key' => 10106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102016002,
         20
    ],
    'item_id' => 102016002
};
get(28)-> #{
    'index' => 101,
    'key' => 10106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102005047,
         80
    ],
    'item_id' => 102005047
};
get(29)-> #{
    'index' => 101,
    'key' => 10107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(30)-> #{
    'index' => 101,
    'key' => 10107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(31)-> #{
    'index' => 101,
    'key' => 10107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(32)-> #{
    'index' => 101,
    'key' => 10107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102016002,
         30
    ],
    'item_id' => 102016002
};
get(33)-> #{
    'index' => 101,
    'key' => 10107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        104001001,
         200
    ],
    'item_id' => 104001001
};
get(34)-> #{
    'index' => 101,
    'key' => 10108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(35)-> #{
    'index' => 101,
    'key' => 10108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(36)-> #{
    'index' => 101,
    'key' => 10108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(37)-> #{
    'index' => 101,
    'key' => 10108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102016002,
         50
    ],
    'item_id' => 102016002
};
get(38)-> #{
    'index' => 101,
    'key' => 10108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        104001001,
         6000
    ],
    'item_id' => 104001001
};
get(39)-> #{
    'index' => 102,
    'key' => 10201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(40)-> #{
    'index' => 102,
    'key' => 10201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         3
    ],
    'item_id' => 102013002
};
get(41)-> #{
    'index' => 102,
    'key' => 10201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         3
    ],
    'item_id' => 102016002
};
get(42)-> #{
    'index' => 102,
    'key' => 10202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(43)-> #{
    'index' => 102,
    'key' => 10202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         4
    ],
    'item_id' => 106002001
};
get(44)-> #{
    'index' => 102,
    'key' => 10202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102008003,
         10
    ],
    'item_id' => 102008003
};
get(45)-> #{
    'index' => 102,
    'key' => 10202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(46)-> #{
    'index' => 102,
    'key' => 10202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 5,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(47)-> #{
    'index' => 102,
    'key' => 10203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(48)-> #{
    'index' => 102,
    'key' => 10203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102017001,
         2
    ],
    'item_id' => 102017001
};
get(49)-> #{
    'index' => 102,
    'key' => 10203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007405,
         20
    ],
    'item_id' => 102007405
};
get(50)-> #{
    'index' => 102,
    'key' => 10203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007013,
         20
    ],
    'item_id' => 102007013
};
get(51)-> #{
    'index' => 102,
    'key' => 10203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102022048,
         10
    ],
    'item_id' => 102022048
};
get(52)-> #{
    'index' => 102,
    'key' => 10204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(53)-> #{
    'index' => 102,
    'key' => 10204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102017001,
         4
    ],
    'item_id' => 102017001
};
get(54)-> #{
    'index' => 102,
    'key' => 10204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007008,
         30
    ],
    'item_id' => 102007008
};
get(55)-> #{
    'index' => 102,
    'key' => 10204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007013,
         30
    ],
    'item_id' => 102007013
};
get(56)-> #{
    'index' => 102,
    'key' => 10204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102022048,
         20
    ],
    'item_id' => 102022048
};
get(57)-> #{
    'index' => 102,
    'key' => 10205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(58)-> #{
    'index' => 102,
    'key' => 10205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102017001,
         6
    ],
    'item_id' => 102017001
};
get(59)-> #{
    'index' => 102,
    'key' => 10205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007405,
         40
    ],
    'item_id' => 102007405
};
get(60)-> #{
    'index' => 102,
    'key' => 10205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007013,
         40
    ],
    'item_id' => 102007013
};
get(61)-> #{
    'index' => 102,
    'key' => 10205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102022048,
         40
    ],
    'item_id' => 102022048
};
get(62)-> #{
    'index' => 102,
    'key' => 10206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(63)-> #{
    'index' => 102,
    'key' => 10206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102017001,
         8
    ],
    'item_id' => 102017001
};
get(64)-> #{
    'index' => 102,
    'key' => 10206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007008,
         50
    ],
    'item_id' => 102007008
};
get(65)-> #{
    'index' => 102,
    'key' => 10206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007013,
         50
    ],
    'item_id' => 102007013
};
get(66)-> #{
    'index' => 102,
    'key' => 10206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102022048,
         80
    ],
    'item_id' => 102022048
};
get(67)-> #{
    'index' => 102,
    'key' => 10207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(68)-> #{
    'index' => 102,
    'key' => 10207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        102017001,
         10
    ],
    'item_id' => 102017001
};
get(69)-> #{
    'index' => 102,
    'key' => 10207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102007405,
         80
    ],
    'item_id' => 102007405
};
get(70)-> #{
    'index' => 102,
    'key' => 10207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007013,
         80
    ],
    'item_id' => 102007013
};
get(71)-> #{
    'index' => 102,
    'key' => 10207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102022048,
         100
    ],
    'item_id' => 102022048
};
get(72)-> #{
    'index' => 102,
    'key' => 10208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(73)-> #{
    'index' => 102,
    'key' => 10208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        102017001,
         15
    ],
    'item_id' => 102017001
};
get(74)-> #{
    'index' => 102,
    'key' => 10208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102007008,
         120
    ],
    'item_id' => 102007008
};
get(75)-> #{
    'index' => 102,
    'key' => 10208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007013,
         120
    ],
    'item_id' => 102007013
};
get(76)-> #{
    'index' => 102,
    'key' => 10208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102022048,
         120
    ],
    'item_id' => 102022048
};
get(77)-> #{
    'index' => 103,
    'key' => 10301,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(78)-> #{
    'index' => 103,
    'key' => 10301,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         3
    ],
    'item_id' => 102013002
};
get(79)-> #{
    'index' => 103,
    'key' => 10301,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         3
    ],
    'item_id' => 102016002
};
get(80)-> #{
    'index' => 103,
    'key' => 10302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(81)-> #{
    'index' => 103,
    'key' => 10302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         4
    ],
    'item_id' => 106002001
};
get(82)-> #{
    'index' => 103,
    'key' => 10302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(83)-> #{
    'index' => 103,
    'key' => 10302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(84)-> #{
    'index' => 103,
    'key' => 10303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(85)-> #{
    'index' => 103,
    'key' => 10303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007105,
         20
    ],
    'item_id' => 102007105
};
get(86)-> #{
    'index' => 103,
    'key' => 10303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007205,
         20
    ],
    'item_id' => 102007205
};
get(87)-> #{
    'index' => 103,
    'key' => 10303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007305,
         20
    ],
    'item_id' => 102007305
};
get(88)-> #{
    'index' => 103,
    'key' => 10303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007405,
         20
    ],
    'item_id' => 102007405
};
get(89)-> #{
    'index' => 103,
    'key' => 10304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(90)-> #{
    'index' => 103,
    'key' => 10304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007105,
         50
    ],
    'item_id' => 102007105
};
get(91)-> #{
    'index' => 103,
    'key' => 10304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007205,
         50
    ],
    'item_id' => 102007205
};
get(92)-> #{
    'index' => 103,
    'key' => 10304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007305,
         50
    ],
    'item_id' => 102007305
};
get(93)-> #{
    'index' => 103,
    'key' => 10304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007405,
         50
    ],
    'item_id' => 102007405
};
get(94)-> #{
    'index' => 103,
    'key' => 10305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(95)-> #{
    'index' => 103,
    'key' => 10305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007105,
         150
    ],
    'item_id' => 102007105
};
get(96)-> #{
    'index' => 103,
    'key' => 10305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007205,
         150
    ],
    'item_id' => 102007205
};
get(97)-> #{
    'index' => 103,
    'key' => 10305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007305,
         150
    ],
    'item_id' => 102007305
};
get(98)-> #{
    'index' => 103,
    'key' => 10305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007405,
         150
    ],
    'item_id' => 102007405
};
get(99)-> #{
    'index' => 103,
    'key' => 10306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(100)-> #{
    'index' => 103,
    'key' => 10306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007105,
         400
    ],
    'item_id' => 102007105
};
get(101)-> #{
    'index' => 103,
    'key' => 10306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007205,
         400
    ],
    'item_id' => 102007205
};
get(102)-> #{
    'index' => 103,
    'key' => 10306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007305,
         400
    ],
    'item_id' => 102007305
};
get(103)-> #{
    'index' => 103,
    'key' => 10306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007405,
         400
    ],
    'item_id' => 102007405
};
get(104)-> #{
    'index' => 103,
    'key' => 10307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(105)-> #{
    'index' => 103,
    'key' => 10307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(106)-> #{
    'index' => 103,
    'key' => 10307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         60
    ],
    'item_id' => 102013002
};
get(107)-> #{
    'index' => 103,
    'key' => 10307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007101,
         600
    ],
    'item_id' => 102007101
};
get(108)-> #{
    'index' => 103,
    'key' => 10307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007203,
         600
    ],
    'item_id' => 102007203
};
get(109)-> #{
    'index' => 103,
    'key' => 10308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(110)-> #{
    'index' => 103,
    'key' => 10308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(111)-> #{
    'index' => 103,
    'key' => 10308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         100
    ],
    'item_id' => 102013002
};
get(112)-> #{
    'index' => 103,
    'key' => 10308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007104,
         800
    ],
    'item_id' => 102007104
};
get(113)-> #{
    'index' => 103,
    'key' => 10308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007204,
         800
    ],
    'item_id' => 102007204
};
get(114)-> #{
    'index' => 104,
    'key' => 10401,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(115)-> #{
    'index' => 104,
    'key' => 10401,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         3
    ],
    'item_id' => 102013002
};
get(116)-> #{
    'index' => 104,
    'key' => 10401,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         3
    ],
    'item_id' => 102016002
};
get(117)-> #{
    'index' => 104,
    'key' => 10402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(118)-> #{
    'index' => 104,
    'key' => 10402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         4
    ],
    'item_id' => 106002001
};
get(119)-> #{
    'index' => 104,
    'key' => 10402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(120)-> #{
    'index' => 104,
    'key' => 10402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(121)-> #{
    'index' => 104,
    'key' => 10403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(122)-> #{
    'index' => 104,
    'key' => 10403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        101001003,
         300000
    ],
    'item_id' => 101001003
};
get(123)-> #{
    'index' => 104,
    'key' => 10403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007501,
         20
    ],
    'item_id' => 102007501
};
get(124)-> #{
    'index' => 104,
    'key' => 10403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007502,
         20
    ],
    'item_id' => 102007502
};
get(125)-> #{
    'index' => 104,
    'key' => 10403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007503,
         20
    ],
    'item_id' => 102007503
};
get(126)-> #{
    'index' => 104,
    'key' => 10404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(127)-> #{
    'index' => 104,
    'key' => 10404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        101001003,
         500000
    ],
    'item_id' => 101001003
};
get(128)-> #{
    'index' => 104,
    'key' => 10404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007501,
         50
    ],
    'item_id' => 102007501
};
get(129)-> #{
    'index' => 104,
    'key' => 10404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007502,
         50
    ],
    'item_id' => 102007502
};
get(130)-> #{
    'index' => 104,
    'key' => 10404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007503,
         50
    ],
    'item_id' => 102007503
};
get(131)-> #{
    'index' => 104,
    'key' => 10405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(132)-> #{
    'index' => 104,
    'key' => 10405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        101001003,
         1000000
    ],
    'item_id' => 101001003
};
get(133)-> #{
    'index' => 104,
    'key' => 10405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007501,
         150
    ],
    'item_id' => 102007501
};
get(134)-> #{
    'index' => 104,
    'key' => 10405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007502,
         150
    ],
    'item_id' => 102007502
};
get(135)-> #{
    'index' => 104,
    'key' => 10405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007503,
         150
    ],
    'item_id' => 102007503
};
get(136)-> #{
    'index' => 104,
    'key' => 10406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(137)-> #{
    'index' => 104,
    'key' => 10406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        101001003,
         2000000
    ],
    'item_id' => 101001003
};
get(138)-> #{
    'index' => 104,
    'key' => 10406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007501,
         400
    ],
    'item_id' => 102007501
};
get(139)-> #{
    'index' => 104,
    'key' => 10406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007502,
         400
    ],
    'item_id' => 102007502
};
get(140)-> #{
    'index' => 104,
    'key' => 10406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007503,
         400
    ],
    'item_id' => 102007503
};
get(141)-> #{
    'index' => 104,
    'key' => 10407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(142)-> #{
    'index' => 104,
    'key' => 10407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(143)-> #{
    'index' => 104,
    'key' => 10407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         60
    ],
    'item_id' => 102013002
};
get(144)-> #{
    'index' => 104,
    'key' => 10407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102016002,
         60
    ],
    'item_id' => 102016002
};
get(145)-> #{
    'index' => 104,
    'key' => 10407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        104005001,
         400
    ],
    'item_id' => 104005001
};
get(146)-> #{
    'index' => 104,
    'key' => 10408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(147)-> #{
    'index' => 104,
    'key' => 10408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(148)-> #{
    'index' => 104,
    'key' => 10408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         100
    ],
    'item_id' => 102013002
};
get(149)-> #{
    'index' => 104,
    'key' => 10408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102016002,
         100
    ],
    'item_id' => 102016002
};
get(150)-> #{
    'index' => 104,
    'key' => 10408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        104005001,
         800
    ],
    'item_id' => 104005001
};
get(151)-> #{
    'index' => 105,
    'key' => 10501,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(152)-> #{
    'index' => 105,
    'key' => 10501,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         3
    ],
    'item_id' => 102013002
};
get(153)-> #{
    'index' => 105,
    'key' => 10501,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         3
    ],
    'item_id' => 102016002
};
get(154)-> #{
    'index' => 105,
    'key' => 10502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(155)-> #{
    'index' => 105,
    'key' => 10502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         4
    ],
    'item_id' => 106002001
};
get(156)-> #{
    'index' => 105,
    'key' => 10502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(157)-> #{
    'index' => 105,
    'key' => 10502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(158)-> #{
    'index' => 105,
    'key' => 10503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(159)-> #{
    'index' => 105,
    'key' => 10503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        109004001,
         1
    ],
    'item_id' => 109004001
};
get(160)-> #{
    'index' => 105,
    'key' => 10503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        106002001,
         10
    ],
    'item_id' => 106002001
};
get(161)-> #{
    'index' => 105,
    'key' => 10503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        109009003,
         1
    ],
    'item_id' => 109009003
};
get(162)-> #{
    'index' => 105,
    'key' => 10503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        109010003,
         2
    ],
    'item_id' => 109010003
};
get(163)-> #{
    'index' => 105,
    'key' => 10504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(164)-> #{
    'index' => 105,
    'key' => 10504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        109001001,
         1
    ],
    'item_id' => 109001001
};
get(165)-> #{
    'index' => 105,
    'key' => 10504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(166)-> #{
    'index' => 105,
    'key' => 10504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        109009003,
         2
    ],
    'item_id' => 109009003
};
get(167)-> #{
    'index' => 105,
    'key' => 10504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        109010003,
         4
    ],
    'item_id' => 109010003
};
get(168)-> #{
    'index' => 105,
    'key' => 10505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(169)-> #{
    'index' => 105,
    'key' => 10505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        109003001,
         1
    ],
    'item_id' => 109003001
};
get(170)-> #{
    'index' => 105,
    'key' => 10505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(171)-> #{
    'index' => 105,
    'key' => 10505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        109009003,
         3
    ],
    'item_id' => 109009003
};
get(172)-> #{
    'index' => 105,
    'key' => 10505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        109010003,
         6
    ],
    'item_id' => 109010003
};
get(173)-> #{
    'index' => 105,
    'key' => 10506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(174)-> #{
    'index' => 105,
    'key' => 10506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        109002001,
         1
    ],
    'item_id' => 109002001
};
get(175)-> #{
    'index' => 105,
    'key' => 10506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(176)-> #{
    'index' => 105,
    'key' => 10506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        109009003,
         4
    ],
    'item_id' => 109009003
};
get(177)-> #{
    'index' => 105,
    'key' => 10506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        109010003,
         8
    ],
    'item_id' => 109010003
};
get(178)-> #{
    'index' => 105,
    'key' => 10507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(179)-> #{
    'index' => 105,
    'key' => 10507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        102006004,
         1
    ],
    'item_id' => 102006004
};
get(180)-> #{
    'index' => 105,
    'key' => 10507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        106002001,
         70
    ],
    'item_id' => 106002001
};
get(181)-> #{
    'index' => 105,
    'key' => 10507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        109009003,
         6
    ],
    'item_id' => 109009003
};
get(182)-> #{
    'index' => 105,
    'key' => 10507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        109010003,
         10
    ],
    'item_id' => 109010003
};
get(183)-> #{
    'index' => 105,
    'key' => 10508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(184)-> #{
    'index' => 105,
    'key' => 10508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        102006004,
         2
    ],
    'item_id' => 102006004
};
get(185)-> #{
    'index' => 105,
    'key' => 10508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        106002001,
         100
    ],
    'item_id' => 106002001
};
get(186)-> #{
    'index' => 105,
    'key' => 10508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        109009003,
         8
    ],
    'item_id' => 109009003
};
get(187)-> #{
    'index' => 105,
    'key' => 10508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        109010003,
         12
    ],
    'item_id' => 109010003
};
get(188)-> #{
    'index' => 106,
    'key' => 10601,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(189)-> #{
    'index' => 106,
    'key' => 10601,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        107001102,
         1
    ],
    'item_id' => 107001102
};
get(190)-> #{
    'index' => 106,
    'key' => 10601,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102011001,
         20
    ],
    'item_id' => 102011001
};
get(191)-> #{
    'index' => 106,
    'key' => 10602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(192)-> #{
    'index' => 106,
    'key' => 10602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        107002102,
         1
    ],
    'item_id' => 107002102
};
get(193)-> #{
    'index' => 106,
    'key' => 10602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102011001,
         20
    ],
    'item_id' => 102011001
};
get(194)-> #{
    'index' => 106,
    'key' => 10602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102011002,
         40
    ],
    'item_id' => 102011002
};
get(195)-> #{
    'index' => 106,
    'key' => 10603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(196)-> #{
    'index' => 106,
    'key' => 10603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        107003102,
         1
    ],
    'item_id' => 107003102
};
get(197)-> #{
    'index' => 106,
    'key' => 10603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102011001,
         60
    ],
    'item_id' => 102011001
};
get(198)-> #{
    'index' => 106,
    'key' => 10603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102011002,
         20
    ],
    'item_id' => 102011002
};
get(199)-> #{
    'index' => 106,
    'key' => 10603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102011003,
         60
    ],
    'item_id' => 102011003
};
get(200)-> #{
    'index' => 106,
    'key' => 10604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(201)-> #{
    'index' => 106,
    'key' => 10604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        107004102,
         1
    ],
    'item_id' => 107004102
};
get(202)-> #{
    'index' => 106,
    'key' => 10604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102011002,
         40
    ],
    'item_id' => 102011002
};
get(203)-> #{
    'index' => 106,
    'key' => 10604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102011003,
         20
    ],
    'item_id' => 102011003
};
get(204)-> #{
    'index' => 106,
    'key' => 10604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102011004,
         80
    ],
    'item_id' => 102011004
};
get(205)-> #{
    'index' => 106,
    'key' => 10605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(206)-> #{
    'index' => 106,
    'key' => 10605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        107005102,
         1
    ],
    'item_id' => 107005102
};
get(207)-> #{
    'index' => 106,
    'key' => 10605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102011003,
         20
    ],
    'item_id' => 102011003
};
get(208)-> #{
    'index' => 106,
    'key' => 10605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102011004,
         20
    ],
    'item_id' => 102011004
};
get(209)-> #{
    'index' => 106,
    'key' => 10605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102011005,
         100
    ],
    'item_id' => 102011005
};
get(210)-> #{
    'index' => 106,
    'key' => 10606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(211)-> #{
    'index' => 106,
    'key' => 10606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007007,
         400
    ],
    'item_id' => 102007007
};
get(212)-> #{
    'index' => 106,
    'key' => 10606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007008,
         400
    ],
    'item_id' => 102007008
};
get(213)-> #{
    'index' => 106,
    'key' => 10606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007012,
         400
    ],
    'item_id' => 102007012
};
get(214)-> #{
    'index' => 106,
    'key' => 10606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007013,
         400
    ],
    'item_id' => 102007013
};
get(215)-> #{
    'index' => 106,
    'key' => 10607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(216)-> #{
    'index' => 106,
    'key' => 10607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(217)-> #{
    'index' => 106,
    'key' => 10607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         60
    ],
    'item_id' => 102013002
};
get(218)-> #{
    'index' => 106,
    'key' => 10607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007301,
         600
    ],
    'item_id' => 102007301
};
get(219)-> #{
    'index' => 106,
    'key' => 10607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007403,
         600
    ],
    'item_id' => 102007403
};
get(220)-> #{
    'index' => 106,
    'key' => 10608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(221)-> #{
    'index' => 106,
    'key' => 10608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(222)-> #{
    'index' => 106,
    'key' => 10608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         100
    ],
    'item_id' => 102013002
};
get(223)-> #{
    'index' => 106,
    'key' => 10608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007303,
         800
    ],
    'item_id' => 102007303
};
get(224)-> #{
    'index' => 106,
    'key' => 10608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007401,
         800
    ],
    'item_id' => 102007401
};
get(225)-> #{
    'index' => 107,
    'key' => 10701,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(226)-> #{
    'index' => 107,
    'key' => 10701,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(227)-> #{
    'index' => 107,
    'key' => 10701,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(228)-> #{
    'index' => 107,
    'key' => 10702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(229)-> #{
    'index' => 107,
    'key' => 10702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(230)-> #{
    'index' => 107,
    'key' => 10702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(231)-> #{
    'index' => 107,
    'key' => 10702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(232)-> #{
    'index' => 107,
    'key' => 10703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(233)-> #{
    'index' => 107,
    'key' => 10703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        106002001,
         10
    ],
    'item_id' => 106002001
};
get(234)-> #{
    'index' => 107,
    'key' => 10703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102013002,
         20
    ],
    'item_id' => 102013002
};
get(235)-> #{
    'index' => 107,
    'key' => 10703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        104005001,
         100
    ],
    'item_id' => 104005001
};
get(236)-> #{
    'index' => 107,
    'key' => 10703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        104006001,
         200
    ],
    'item_id' => 104006001
};
get(237)-> #{
    'index' => 107,
    'key' => 10704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(238)-> #{
    'index' => 107,
    'key' => 10704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(239)-> #{
    'index' => 107,
    'key' => 10704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(240)-> #{
    'index' => 107,
    'key' => 10704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        104005001,
         200
    ],
    'item_id' => 104005001
};
get(241)-> #{
    'index' => 107,
    'key' => 10704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        104006001,
         400
    ],
    'item_id' => 104006001
};
get(242)-> #{
    'index' => 107,
    'key' => 10705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(243)-> #{
    'index' => 107,
    'key' => 10705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(244)-> #{
    'index' => 107,
    'key' => 10705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102013002,
         40
    ],
    'item_id' => 102013002
};
get(245)-> #{
    'index' => 107,
    'key' => 10705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        104005001,
         300
    ],
    'item_id' => 104005001
};
get(246)-> #{
    'index' => 107,
    'key' => 10705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        104006001,
         600
    ],
    'item_id' => 104006001
};
get(247)-> #{
    'index' => 107,
    'key' => 10706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(248)-> #{
    'index' => 107,
    'key' => 10706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(249)-> #{
    'index' => 107,
    'key' => 10706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(250)-> #{
    'index' => 107,
    'key' => 10706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        104005001,
         500
    ],
    'item_id' => 104005001
};
get(251)-> #{
    'index' => 107,
    'key' => 10706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        104006001,
         1000
    ],
    'item_id' => 104006001
};
get(252)-> #{
    'index' => 107,
    'key' => 10707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(253)-> #{
    'index' => 107,
    'key' => 10707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106004001,
         1
    ],
    'item_id' => 106004001
};
get(254)-> #{
    'index' => 107,
    'key' => 10707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        104005001,
         700
    ],
    'item_id' => 104005001
};
get(255)-> #{
    'index' => 107,
    'key' => 10707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        104006001,
         1500
    ],
    'item_id' => 104006001
};
get(256)-> #{
    'index' => 107,
    'key' => 10707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102002015,
         50
    ],
    'item_id' => 102002015
};
get(257)-> #{
    'index' => 107,
    'key' => 10708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(258)-> #{
    'index' => 107,
    'key' => 10708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106004001,
         1
    ],
    'item_id' => 106004001
};
get(259)-> #{
    'index' => 107,
    'key' => 10708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        104005001,
         1000
    ],
    'item_id' => 104005001
};
get(260)-> #{
    'index' => 107,
    'key' => 10708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        104006001,
         2000
    ],
    'item_id' => 104006001
};
get(261)-> #{
    'index' => 107,
    'key' => 10708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102002015,
         100
    ],
    'item_id' => 102002015
};
get(262)-> #{
    'index' => 108,
    'key' => 10801,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(263)-> #{
    'index' => 108,
    'key' => 10801,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(264)-> #{
    'index' => 108,
    'key' => 10801,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(265)-> #{
    'index' => 108,
    'key' => 10802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(266)-> #{
    'index' => 108,
    'key' => 10802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(267)-> #{
    'index' => 108,
    'key' => 10802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(268)-> #{
    'index' => 108,
    'key' => 10802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(269)-> #{
    'index' => 108,
    'key' => 10803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(270)-> #{
    'index' => 108,
    'key' => 10803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007206,
         20
    ],
    'item_id' => 102007206
};
get(271)-> #{
    'index' => 108,
    'key' => 10803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007205,
         20
    ],
    'item_id' => 102007205
};
get(272)-> #{
    'index' => 108,
    'key' => 10803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007004,
         20
    ],
    'item_id' => 102007004
};
get(273)-> #{
    'index' => 108,
    'key' => 10803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102022050,
         10
    ],
    'item_id' => 102022050
};
get(274)-> #{
    'index' => 108,
    'key' => 10804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(275)-> #{
    'index' => 108,
    'key' => 10804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007206,
         40
    ],
    'item_id' => 102007206
};
get(276)-> #{
    'index' => 108,
    'key' => 10804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007205,
         40
    ],
    'item_id' => 102007205
};
get(277)-> #{
    'index' => 108,
    'key' => 10804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007004,
         40
    ],
    'item_id' => 102007004
};
get(278)-> #{
    'index' => 108,
    'key' => 10804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102022050,
         20
    ],
    'item_id' => 102022050
};
get(279)-> #{
    'index' => 108,
    'key' => 10805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(280)-> #{
    'index' => 108,
    'key' => 10805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007206,
         100
    ],
    'item_id' => 102007206
};
get(281)-> #{
    'index' => 108,
    'key' => 10805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007205,
         100
    ],
    'item_id' => 102007205
};
get(282)-> #{
    'index' => 108,
    'key' => 10805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007004,
         100
    ],
    'item_id' => 102007004
};
get(283)-> #{
    'index' => 108,
    'key' => 10805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102022050,
         50
    ],
    'item_id' => 102022050
};
get(284)-> #{
    'index' => 108,
    'key' => 10806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(285)-> #{
    'index' => 108,
    'key' => 10806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007206,
         240
    ],
    'item_id' => 102007206
};
get(286)-> #{
    'index' => 108,
    'key' => 10806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007205,
         240
    ],
    'item_id' => 102007205
};
get(287)-> #{
    'index' => 108,
    'key' => 10806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007004,
         240
    ],
    'item_id' => 102007004
};
get(288)-> #{
    'index' => 108,
    'key' => 10806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102022050,
         120
    ],
    'item_id' => 102022050
};
get(289)-> #{
    'index' => 108,
    'key' => 10807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(290)-> #{
    'index' => 108,
    'key' => 10807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        102007206,
         400
    ],
    'item_id' => 102007206
};
get(291)-> #{
    'index' => 108,
    'key' => 10807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102007205,
         400
    ],
    'item_id' => 102007205
};
get(292)-> #{
    'index' => 108,
    'key' => 10807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007004,
         400
    ],
    'item_id' => 102007004
};
get(293)-> #{
    'index' => 108,
    'key' => 10807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102022050,
         140
    ],
    'item_id' => 102022050
};
get(294)-> #{
    'index' => 108,
    'key' => 10808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(295)-> #{
    'index' => 108,
    'key' => 10808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        102007206,
         600
    ],
    'item_id' => 102007206
};
get(296)-> #{
    'index' => 108,
    'key' => 10808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102007205,
         600
    ],
    'item_id' => 102007205
};
get(297)-> #{
    'index' => 108,
    'key' => 10808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007004,
         600
    ],
    'item_id' => 102007004
};
get(298)-> #{
    'index' => 108,
    'key' => 10808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102022050,
         160
    ],
    'item_id' => 102022050
};
get(299)-> #{
    'index' => 109,
    'key' => 10901,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(300)-> #{
    'index' => 109,
    'key' => 10901,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(301)-> #{
    'index' => 109,
    'key' => 10901,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(302)-> #{
    'index' => 109,
    'key' => 10902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(303)-> #{
    'index' => 109,
    'key' => 10902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(304)-> #{
    'index' => 109,
    'key' => 10902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(305)-> #{
    'index' => 109,
    'key' => 10902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(306)-> #{
    'index' => 109,
    'key' => 10903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(307)-> #{
    'index' => 109,
    'key' => 10903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007003,
         20
    ],
    'item_id' => 102007003
};
get(308)-> #{
    'index' => 109,
    'key' => 10903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007006,
         20
    ],
    'item_id' => 102007006
};
get(309)-> #{
    'index' => 109,
    'key' => 10903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007010,
         20
    ],
    'item_id' => 102007010
};
get(310)-> #{
    'index' => 109,
    'key' => 10903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007014,
         20
    ],
    'item_id' => 102007014
};
get(311)-> #{
    'index' => 109,
    'key' => 10904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(312)-> #{
    'index' => 109,
    'key' => 10904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007003,
         50
    ],
    'item_id' => 102007003
};
get(313)-> #{
    'index' => 109,
    'key' => 10904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007006,
         50
    ],
    'item_id' => 102007006
};
get(314)-> #{
    'index' => 109,
    'key' => 10904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007010,
         50
    ],
    'item_id' => 102007010
};
get(315)-> #{
    'index' => 109,
    'key' => 10904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007014,
         50
    ],
    'item_id' => 102007014
};
get(316)-> #{
    'index' => 109,
    'key' => 10905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(317)-> #{
    'index' => 109,
    'key' => 10905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007003,
         150
    ],
    'item_id' => 102007003
};
get(318)-> #{
    'index' => 109,
    'key' => 10905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007006,
         150
    ],
    'item_id' => 102007006
};
get(319)-> #{
    'index' => 109,
    'key' => 10905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007010,
         150
    ],
    'item_id' => 102007010
};
get(320)-> #{
    'index' => 109,
    'key' => 10905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007014,
         150
    ],
    'item_id' => 102007014
};
get(321)-> #{
    'index' => 109,
    'key' => 10906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(322)-> #{
    'index' => 109,
    'key' => 10906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007003,
         400
    ],
    'item_id' => 102007003
};
get(323)-> #{
    'index' => 109,
    'key' => 10906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007006,
         400
    ],
    'item_id' => 102007006
};
get(324)-> #{
    'index' => 109,
    'key' => 10906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007010,
         400
    ],
    'item_id' => 102007010
};
get(325)-> #{
    'index' => 109,
    'key' => 10906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007014,
         400
    ],
    'item_id' => 102007014
};
get(326)-> #{
    'index' => 109,
    'key' => 10907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(327)-> #{
    'index' => 109,
    'key' => 10907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(328)-> #{
    'index' => 109,
    'key' => 10907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(329)-> #{
    'index' => 109,
    'key' => 10907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007101,
         600
    ],
    'item_id' => 102007101
};
get(330)-> #{
    'index' => 109,
    'key' => 10907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007203,
         600
    ],
    'item_id' => 102007203
};
get(331)-> #{
    'index' => 109,
    'key' => 10908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(332)-> #{
    'index' => 109,
    'key' => 10908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(333)-> #{
    'index' => 109,
    'key' => 10908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(334)-> #{
    'index' => 109,
    'key' => 10908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007104,
         800
    ],
    'item_id' => 102007104
};
get(335)-> #{
    'index' => 109,
    'key' => 10908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007204,
         800
    ],
    'item_id' => 102007204
};
get(336)-> #{
    'index' => 110,
    'key' => 11001,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(337)-> #{
    'index' => 110,
    'key' => 11001,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(338)-> #{
    'index' => 110,
    'key' => 11001,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(339)-> #{
    'index' => 110,
    'key' => 11002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(340)-> #{
    'index' => 110,
    'key' => 11002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(341)-> #{
    'index' => 110,
    'key' => 11002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(342)-> #{
    'index' => 110,
    'key' => 11002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(343)-> #{
    'index' => 110,
    'key' => 11003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(344)-> #{
    'index' => 110,
    'key' => 11003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102013002,
         20
    ],
    'item_id' => 102013002
};
get(345)-> #{
    'index' => 110,
    'key' => 11003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        101001003,
         1000000
    ],
    'item_id' => 101001003
};
get(346)-> #{
    'index' => 110,
    'key' => 11003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102010001,
         10000
    ],
    'item_id' => 102010001
};
get(347)-> #{
    'index' => 110,
    'key' => 11003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        104007001,
         100
    ],
    'item_id' => 104007001
};
get(348)-> #{
    'index' => 110,
    'key' => 11004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(349)-> #{
    'index' => 110,
    'key' => 11004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102013002,
         40
    ],
    'item_id' => 102013002
};
get(350)-> #{
    'index' => 110,
    'key' => 11004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        101001003,
         2000000
    ],
    'item_id' => 101001003
};
get(351)-> #{
    'index' => 110,
    'key' => 11004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102010001,
         20000
    ],
    'item_id' => 102010001
};
get(352)-> #{
    'index' => 110,
    'key' => 11004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        104007001,
         200
    ],
    'item_id' => 104007001
};
get(353)-> #{
    'index' => 110,
    'key' => 11005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(354)-> #{
    'index' => 110,
    'key' => 11005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(355)-> #{
    'index' => 110,
    'key' => 11005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        101001003,
         3000000
    ],
    'item_id' => 101001003
};
get(356)-> #{
    'index' => 110,
    'key' => 11005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102010001,
         30000
    ],
    'item_id' => 102010001
};
get(357)-> #{
    'index' => 110,
    'key' => 11005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        104007001,
         400
    ],
    'item_id' => 104007001
};
get(358)-> #{
    'index' => 110,
    'key' => 11006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(359)-> #{
    'index' => 110,
    'key' => 11006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        101001003,
         5000000
    ],
    'item_id' => 101001003
};
get(360)-> #{
    'index' => 110,
    'key' => 11006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102006004,
         1
    ],
    'item_id' => 102006004
};
get(361)-> #{
    'index' => 110,
    'key' => 11006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102010001,
         50000
    ],
    'item_id' => 102010001
};
get(362)-> #{
    'index' => 110,
    'key' => 11006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        104007001,
         600
    ],
    'item_id' => 104007001
};
get(363)-> #{
    'index' => 110,
    'key' => 11007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(364)-> #{
    'index' => 110,
    'key' => 11007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        101001003,
         7000000
    ],
    'item_id' => 101001003
};
get(365)-> #{
    'index' => 110,
    'key' => 11007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        109010003,
         1
    ],
    'item_id' => 109010003
};
get(366)-> #{
    'index' => 110,
    'key' => 11007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102010001,
         70000
    ],
    'item_id' => 102010001
};
get(367)-> #{
    'index' => 110,
    'key' => 11007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        104007001,
         800
    ],
    'item_id' => 104007001
};
get(368)-> #{
    'index' => 110,
    'key' => 11008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(369)-> #{
    'index' => 110,
    'key' => 11008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        101001003,
         10000000
    ],
    'item_id' => 101001003
};
get(370)-> #{
    'index' => 110,
    'key' => 11008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102006004,
         2
    ],
    'item_id' => 102006004
};
get(371)-> #{
    'index' => 110,
    'key' => 11008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102010001,
         100000
    ],
    'item_id' => 102010001
};
get(372)-> #{
    'index' => 110,
    'key' => 11008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        104007001,
         1000
    ],
    'item_id' => 104007001
};
get(373)-> #{
    'index' => 111,
    'key' => 11101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(374)-> #{
    'index' => 111,
    'key' => 11101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(375)-> #{
    'index' => 111,
    'key' => 11101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(376)-> #{
    'index' => 111,
    'key' => 11102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(377)-> #{
    'index' => 111,
    'key' => 11102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(378)-> #{
    'index' => 111,
    'key' => 11102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(379)-> #{
    'index' => 111,
    'key' => 11102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(380)-> #{
    'index' => 111,
    'key' => 11103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(381)-> #{
    'index' => 111,
    'key' => 11103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007002,
         20
    ],
    'item_id' => 102007002
};
get(382)-> #{
    'index' => 111,
    'key' => 11103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007005,
         20
    ],
    'item_id' => 102007005
};
get(383)-> #{
    'index' => 111,
    'key' => 11103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007009,
         20
    ],
    'item_id' => 102007009
};
get(384)-> #{
    'index' => 111,
    'key' => 11103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007011,
         20
    ],
    'item_id' => 102007011
};
get(385)-> #{
    'index' => 111,
    'key' => 11104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(386)-> #{
    'index' => 111,
    'key' => 11104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007002,
         50
    ],
    'item_id' => 102007002
};
get(387)-> #{
    'index' => 111,
    'key' => 11104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007005,
         50
    ],
    'item_id' => 102007005
};
get(388)-> #{
    'index' => 111,
    'key' => 11104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007009,
         50
    ],
    'item_id' => 102007009
};
get(389)-> #{
    'index' => 111,
    'key' => 11104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007011,
         50
    ],
    'item_id' => 102007011
};
get(390)-> #{
    'index' => 111,
    'key' => 11105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(391)-> #{
    'index' => 111,
    'key' => 11105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007002,
         150
    ],
    'item_id' => 102007002
};
get(392)-> #{
    'index' => 111,
    'key' => 11105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007005,
         150
    ],
    'item_id' => 102007005
};
get(393)-> #{
    'index' => 111,
    'key' => 11105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007009,
         150
    ],
    'item_id' => 102007009
};
get(394)-> #{
    'index' => 111,
    'key' => 11105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007011,
         150
    ],
    'item_id' => 102007011
};
get(395)-> #{
    'index' => 111,
    'key' => 11106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(396)-> #{
    'index' => 111,
    'key' => 11106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007002,
         400
    ],
    'item_id' => 102007002
};
get(397)-> #{
    'index' => 111,
    'key' => 11106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007005,
         400
    ],
    'item_id' => 102007005
};
get(398)-> #{
    'index' => 111,
    'key' => 11106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007009,
         400
    ],
    'item_id' => 102007009
};
get(399)-> #{
    'index' => 111,
    'key' => 11106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007011,
         400
    ],
    'item_id' => 102007011
};
get(400)-> #{
    'index' => 111,
    'key' => 11107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(401)-> #{
    'index' => 111,
    'key' => 11107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(402)-> #{
    'index' => 111,
    'key' => 11107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(403)-> #{
    'index' => 111,
    'key' => 11107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007101,
         600
    ],
    'item_id' => 102007101
};
get(404)-> #{
    'index' => 111,
    'key' => 11107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007203,
         600
    ],
    'item_id' => 102007203
};
get(405)-> #{
    'index' => 111,
    'key' => 11108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(406)-> #{
    'index' => 111,
    'key' => 11108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(407)-> #{
    'index' => 111,
    'key' => 11108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(408)-> #{
    'index' => 111,
    'key' => 11108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007104,
         800
    ],
    'item_id' => 102007104
};
get(409)-> #{
    'index' => 111,
    'key' => 11108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007204,
         800
    ],
    'item_id' => 102007204
};
get(410)-> #{
    'index' => 112,
    'key' => 11201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(411)-> #{
    'index' => 112,
    'key' => 11201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(412)-> #{
    'index' => 112,
    'key' => 11201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(413)-> #{
    'index' => 112,
    'key' => 11202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(414)-> #{
    'index' => 112,
    'key' => 11202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(415)-> #{
    'index' => 112,
    'key' => 11202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(416)-> #{
    'index' => 112,
    'key' => 11202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(417)-> #{
    'index' => 112,
    'key' => 11203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(418)-> #{
    'index' => 112,
    'key' => 11203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007106,
         20
    ],
    'item_id' => 102007106
};
get(419)-> #{
    'index' => 112,
    'key' => 11203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007206,
         20
    ],
    'item_id' => 102007206
};
get(420)-> #{
    'index' => 112,
    'key' => 11203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007511,
         20
    ],
    'item_id' => 102007511
};
get(421)-> #{
    'index' => 112,
    'key' => 11203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007512,
         20
    ],
    'item_id' => 102007512
};
get(422)-> #{
    'index' => 112,
    'key' => 11204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(423)-> #{
    'index' => 112,
    'key' => 11204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007106,
         50
    ],
    'item_id' => 102007106
};
get(424)-> #{
    'index' => 112,
    'key' => 11204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007206,
         50
    ],
    'item_id' => 102007206
};
get(425)-> #{
    'index' => 112,
    'key' => 11204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007511,
         50
    ],
    'item_id' => 102007511
};
get(426)-> #{
    'index' => 112,
    'key' => 11204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007512,
         50
    ],
    'item_id' => 102007512
};
get(427)-> #{
    'index' => 112,
    'key' => 11205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(428)-> #{
    'index' => 112,
    'key' => 11205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007106,
         150
    ],
    'item_id' => 102007106
};
get(429)-> #{
    'index' => 112,
    'key' => 11205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007206,
         150
    ],
    'item_id' => 102007206
};
get(430)-> #{
    'index' => 112,
    'key' => 11205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007511,
         150
    ],
    'item_id' => 102007511
};
get(431)-> #{
    'index' => 112,
    'key' => 11205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007512,
         150
    ],
    'item_id' => 102007512
};
get(432)-> #{
    'index' => 112,
    'key' => 11206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(433)-> #{
    'index' => 112,
    'key' => 11206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007106,
         400
    ],
    'item_id' => 102007106
};
get(434)-> #{
    'index' => 112,
    'key' => 11206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007206,
         400
    ],
    'item_id' => 102007206
};
get(435)-> #{
    'index' => 112,
    'key' => 11206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007511,
         400
    ],
    'item_id' => 102007511
};
get(436)-> #{
    'index' => 112,
    'key' => 11206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007512,
         400
    ],
    'item_id' => 102007512
};
get(437)-> #{
    'index' => 112,
    'key' => 11207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(438)-> #{
    'index' => 112,
    'key' => 11207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(439)-> #{
    'index' => 112,
    'key' => 11207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(440)-> #{
    'index' => 112,
    'key' => 11207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007101,
         600
    ],
    'item_id' => 102007101
};
get(441)-> #{
    'index' => 112,
    'key' => 11207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007203,
         600
    ],
    'item_id' => 102007203
};
get(442)-> #{
    'index' => 112,
    'key' => 11208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(443)-> #{
    'index' => 112,
    'key' => 11208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(444)-> #{
    'index' => 112,
    'key' => 11208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(445)-> #{
    'index' => 112,
    'key' => 11208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007104,
         800
    ],
    'item_id' => 102007104
};
get(446)-> #{
    'index' => 112,
    'key' => 11208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007204,
         800
    ],
    'item_id' => 102007204
};
get(447)-> #{
    'index' => 113,
    'key' => 11301,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(448)-> #{
    'index' => 113,
    'key' => 11301,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(449)-> #{
    'index' => 113,
    'key' => 11301,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(450)-> #{
    'index' => 113,
    'key' => 11302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(451)-> #{
    'index' => 113,
    'key' => 11302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(452)-> #{
    'index' => 113,
    'key' => 11302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(453)-> #{
    'index' => 113,
    'key' => 11302,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(454)-> #{
    'index' => 113,
    'key' => 11303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(455)-> #{
    'index' => 113,
    'key' => 11303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        106002001,
         10
    ],
    'item_id' => 106002001
};
get(456)-> #{
    'index' => 113,
    'key' => 11303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102015002,
         20
    ],
    'item_id' => 102015002
};
get(457)-> #{
    'index' => 113,
    'key' => 11303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        104005001,
         200
    ],
    'item_id' => 104005001
};
get(458)-> #{
    'index' => 113,
    'key' => 11303,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102028001,
         40
    ],
    'item_id' => 102028001
};
get(459)-> #{
    'index' => 113,
    'key' => 11304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(460)-> #{
    'index' => 113,
    'key' => 11304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(461)-> #{
    'index' => 113,
    'key' => 11304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102015002,
         40
    ],
    'item_id' => 102015002
};
get(462)-> #{
    'index' => 113,
    'key' => 11304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        104005001,
         400
    ],
    'item_id' => 104005001
};
get(463)-> #{
    'index' => 113,
    'key' => 11304,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102028001,
         80
    ],
    'item_id' => 102028001
};
get(464)-> #{
    'index' => 113,
    'key' => 11305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(465)-> #{
    'index' => 113,
    'key' => 11305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        106002001,
         40
    ],
    'item_id' => 106002001
};
get(466)-> #{
    'index' => 113,
    'key' => 11305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102027001,
         1
    ],
    'item_id' => 102027001
};
get(467)-> #{
    'index' => 113,
    'key' => 11305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102015002,
         80
    ],
    'item_id' => 102015002
};
get(468)-> #{
    'index' => 113,
    'key' => 11305,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102028001,
         120
    ],
    'item_id' => 102028001
};
get(469)-> #{
    'index' => 113,
    'key' => 11306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(470)-> #{
    'index' => 113,
    'key' => 11306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        106002001,
         60
    ],
    'item_id' => 106002001
};
get(471)-> #{
    'index' => 113,
    'key' => 11306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102027001,
         2
    ],
    'item_id' => 102027001
};
get(472)-> #{
    'index' => 113,
    'key' => 11306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102015002,
         100
    ],
    'item_id' => 102015002
};
get(473)-> #{
    'index' => 113,
    'key' => 11306,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102028001,
         200
    ],
    'item_id' => 102028001
};
get(474)-> #{
    'index' => 113,
    'key' => 11307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(475)-> #{
    'index' => 113,
    'key' => 11307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         80
    ],
    'item_id' => 106002001
};
get(476)-> #{
    'index' => 113,
    'key' => 11307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102027001,
         3
    ],
    'item_id' => 102027001
};
get(477)-> #{
    'index' => 113,
    'key' => 11307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102015002,
         120
    ],
    'item_id' => 102015002
};
get(478)-> #{
    'index' => 113,
    'key' => 11307,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        104006001,
         200
    ],
    'item_id' => 104006001
};
get(479)-> #{
    'index' => 113,
    'key' => 11308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(480)-> #{
    'index' => 113,
    'key' => 11308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         100
    ],
    'item_id' => 106002001
};
get(481)-> #{
    'index' => 113,
    'key' => 11308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102027001,
         5
    ],
    'item_id' => 102027001
};
get(482)-> #{
    'index' => 113,
    'key' => 11308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102015002,
         160
    ],
    'item_id' => 102015002
};
get(483)-> #{
    'index' => 113,
    'key' => 11308,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        104006001,
         300
    ],
    'item_id' => 104006001
};
get(484)-> #{
    'index' => 114,
    'key' => 11401,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(485)-> #{
    'index' => 114,
    'key' => 11401,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(486)-> #{
    'index' => 114,
    'key' => 11401,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(487)-> #{
    'index' => 114,
    'key' => 11402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(488)-> #{
    'index' => 114,
    'key' => 11402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(489)-> #{
    'index' => 114,
    'key' => 11402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(490)-> #{
    'index' => 114,
    'key' => 11402,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(491)-> #{
    'index' => 114,
    'key' => 11403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(492)-> #{
    'index' => 114,
    'key' => 11403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007306,
         20
    ],
    'item_id' => 102007306
};
get(493)-> #{
    'index' => 114,
    'key' => 11403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007406,
         20
    ],
    'item_id' => 102007406
};
get(494)-> #{
    'index' => 114,
    'key' => 11403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007509,
         20
    ],
    'item_id' => 102007509
};
get(495)-> #{
    'index' => 114,
    'key' => 11403,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007510,
         20
    ],
    'item_id' => 102007510
};
get(496)-> #{
    'index' => 114,
    'key' => 11404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(497)-> #{
    'index' => 114,
    'key' => 11404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007306,
         50
    ],
    'item_id' => 102007306
};
get(498)-> #{
    'index' => 114,
    'key' => 11404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007406,
         50
    ],
    'item_id' => 102007406
};
get(499)-> #{
    'index' => 114,
    'key' => 11404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007509,
         50
    ],
    'item_id' => 102007509
};
get(500)-> #{
    'index' => 114,
    'key' => 11404,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007510,
         50
    ],
    'item_id' => 102007510
};
get(501)-> #{
    'index' => 114,
    'key' => 11405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(502)-> #{
    'index' => 114,
    'key' => 11405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007306,
         150
    ],
    'item_id' => 102007306
};
get(503)-> #{
    'index' => 114,
    'key' => 11405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007406,
         150
    ],
    'item_id' => 102007406
};
get(504)-> #{
    'index' => 114,
    'key' => 11405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007509,
         150
    ],
    'item_id' => 102007509
};
get(505)-> #{
    'index' => 114,
    'key' => 11405,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007510,
         150
    ],
    'item_id' => 102007510
};
get(506)-> #{
    'index' => 114,
    'key' => 11406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(507)-> #{
    'index' => 114,
    'key' => 11406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007306,
         400
    ],
    'item_id' => 102007306
};
get(508)-> #{
    'index' => 114,
    'key' => 11406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007406,
         400
    ],
    'item_id' => 102007406
};
get(509)-> #{
    'index' => 114,
    'key' => 11406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007509,
         400
    ],
    'item_id' => 102007509
};
get(510)-> #{
    'index' => 114,
    'key' => 11406,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007510,
         400
    ],
    'item_id' => 102007510
};
get(511)-> #{
    'index' => 114,
    'key' => 11407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(512)-> #{
    'index' => 114,
    'key' => 11407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106003001,
         10
    ],
    'item_id' => 106003001
};
get(513)-> #{
    'index' => 114,
    'key' => 11407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        104005001,
         800
    ],
    'item_id' => 104005001
};
get(514)-> #{
    'index' => 114,
    'key' => 11407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        104006001,
         1800
    ],
    'item_id' => 104006001
};
get(515)-> #{
    'index' => 114,
    'key' => 11407,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102002015,
         80
    ],
    'item_id' => 102002015
};
get(516)-> #{
    'index' => 114,
    'key' => 11408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(517)-> #{
    'index' => 114,
    'key' => 11408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106003001,
         20
    ],
    'item_id' => 106003001
};
get(518)-> #{
    'index' => 114,
    'key' => 11408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        104005001,
         1200
    ],
    'item_id' => 104005001
};
get(519)-> #{
    'index' => 114,
    'key' => 11408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        104006001,
         2500
    ],
    'item_id' => 104006001
};
get(520)-> #{
    'index' => 114,
    'key' => 11408,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102002015,
         120
    ],
    'item_id' => 102002015
};
get(521)-> #{
    'index' => 115,
    'key' => 11501,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(522)-> #{
    'index' => 115,
    'key' => 11501,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(523)-> #{
    'index' => 115,
    'key' => 11501,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(524)-> #{
    'index' => 115,
    'key' => 11502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(525)-> #{
    'index' => 115,
    'key' => 11502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(526)-> #{
    'index' => 115,
    'key' => 11502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(527)-> #{
    'index' => 115,
    'key' => 11502,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(528)-> #{
    'index' => 115,
    'key' => 11503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(529)-> #{
    'index' => 115,
    'key' => 11503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007106,
         20
    ],
    'item_id' => 102007106
};
get(530)-> #{
    'index' => 115,
    'key' => 11503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007005,
         20
    ],
    'item_id' => 102007005
};
get(531)-> #{
    'index' => 115,
    'key' => 11503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007014,
         20
    ],
    'item_id' => 102007014
};
get(532)-> #{
    'index' => 115,
    'key' => 11503,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007506,
         20
    ],
    'item_id' => 102007506
};
get(533)-> #{
    'index' => 115,
    'key' => 11504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(534)-> #{
    'index' => 115,
    'key' => 11504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007106,
         50
    ],
    'item_id' => 102007106
};
get(535)-> #{
    'index' => 115,
    'key' => 11504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007005,
         50
    ],
    'item_id' => 102007005
};
get(536)-> #{
    'index' => 115,
    'key' => 11504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007014,
         50
    ],
    'item_id' => 102007014
};
get(537)-> #{
    'index' => 115,
    'key' => 11504,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007506,
         50
    ],
    'item_id' => 102007506
};
get(538)-> #{
    'index' => 115,
    'key' => 11505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(539)-> #{
    'index' => 115,
    'key' => 11505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007106,
         150
    ],
    'item_id' => 102007106
};
get(540)-> #{
    'index' => 115,
    'key' => 11505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007005,
         150
    ],
    'item_id' => 102007005
};
get(541)-> #{
    'index' => 115,
    'key' => 11505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007014,
         150
    ],
    'item_id' => 102007014
};
get(542)-> #{
    'index' => 115,
    'key' => 11505,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007506,
         150
    ],
    'item_id' => 102007506
};
get(543)-> #{
    'index' => 115,
    'key' => 11506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(544)-> #{
    'index' => 115,
    'key' => 11506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007106,
         400
    ],
    'item_id' => 102007106
};
get(545)-> #{
    'index' => 115,
    'key' => 11506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007005,
         400
    ],
    'item_id' => 102007005
};
get(546)-> #{
    'index' => 115,
    'key' => 11506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007014,
         400
    ],
    'item_id' => 102007014
};
get(547)-> #{
    'index' => 115,
    'key' => 11506,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007506,
         400
    ],
    'item_id' => 102007506
};
get(548)-> #{
    'index' => 115,
    'key' => 11507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(549)-> #{
    'index' => 115,
    'key' => 11507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         80
    ],
    'item_id' => 106002001
};
get(550)-> #{
    'index' => 115,
    'key' => 11507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(551)-> #{
    'index' => 115,
    'key' => 11507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        104007001,
         800
    ],
    'item_id' => 104007001
};
get(552)-> #{
    'index' => 115,
    'key' => 11507,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        109010003,
         10
    ],
    'item_id' => 109010003
};
get(553)-> #{
    'index' => 115,
    'key' => 11508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(554)-> #{
    'index' => 115,
    'key' => 11508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         100
    ],
    'item_id' => 106002001
};
get(555)-> #{
    'index' => 115,
    'key' => 11508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(556)-> #{
    'index' => 115,
    'key' => 11508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        104007001,
         1000
    ],
    'item_id' => 104007001
};
get(557)-> #{
    'index' => 115,
    'key' => 11508,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        109010003,
         15
    ],
    'item_id' => 109010003
};
get(558)-> #{
    'index' => 116,
    'key' => 11601,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(559)-> #{
    'index' => 116,
    'key' => 11601,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(560)-> #{
    'index' => 116,
    'key' => 11601,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(561)-> #{
    'index' => 116,
    'key' => 11602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(562)-> #{
    'index' => 116,
    'key' => 11602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(563)-> #{
    'index' => 116,
    'key' => 11602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(564)-> #{
    'index' => 116,
    'key' => 11602,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(565)-> #{
    'index' => 116,
    'key' => 11603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(566)-> #{
    'index' => 116,
    'key' => 11603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007206,
         20
    ],
    'item_id' => 102007206
};
get(567)-> #{
    'index' => 116,
    'key' => 11603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007004,
         20
    ],
    'item_id' => 102007004
};
get(568)-> #{
    'index' => 116,
    'key' => 11603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007009,
         20
    ],
    'item_id' => 102007009
};
get(569)-> #{
    'index' => 116,
    'key' => 11603,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007508,
         20
    ],
    'item_id' => 102007508
};
get(570)-> #{
    'index' => 116,
    'key' => 11604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(571)-> #{
    'index' => 116,
    'key' => 11604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007206,
         50
    ],
    'item_id' => 102007206
};
get(572)-> #{
    'index' => 116,
    'key' => 11604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007004,
         50
    ],
    'item_id' => 102007004
};
get(573)-> #{
    'index' => 116,
    'key' => 11604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007009,
         50
    ],
    'item_id' => 102007009
};
get(574)-> #{
    'index' => 116,
    'key' => 11604,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007508,
         50
    ],
    'item_id' => 102007508
};
get(575)-> #{
    'index' => 116,
    'key' => 11605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(576)-> #{
    'index' => 116,
    'key' => 11605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007206,
         150
    ],
    'item_id' => 102007206
};
get(577)-> #{
    'index' => 116,
    'key' => 11605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007004,
         150
    ],
    'item_id' => 102007004
};
get(578)-> #{
    'index' => 116,
    'key' => 11605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007009,
         150
    ],
    'item_id' => 102007009
};
get(579)-> #{
    'index' => 116,
    'key' => 11605,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007508,
         150
    ],
    'item_id' => 102007508
};
get(580)-> #{
    'index' => 116,
    'key' => 11606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(581)-> #{
    'index' => 116,
    'key' => 11606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007206,
         400
    ],
    'item_id' => 102007206
};
get(582)-> #{
    'index' => 116,
    'key' => 11606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007004,
         400
    ],
    'item_id' => 102007004
};
get(583)-> #{
    'index' => 116,
    'key' => 11606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007009,
         400
    ],
    'item_id' => 102007009
};
get(584)-> #{
    'index' => 116,
    'key' => 11606,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007508,
         400
    ],
    'item_id' => 102007508
};
get(585)-> #{
    'index' => 116,
    'key' => 11607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(586)-> #{
    'index' => 116,
    'key' => 11607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        102006004,
         1
    ],
    'item_id' => 102006004
};
get(587)-> #{
    'index' => 116,
    'key' => 11607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102016002,
         60
    ],
    'item_id' => 102016002
};
get(588)-> #{
    'index' => 116,
    'key' => 11607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102010001,
         70000
    ],
    'item_id' => 102010001
};
get(589)-> #{
    'index' => 116,
    'key' => 11607,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        104001001,
         1000
    ],
    'item_id' => 104001001
};
get(590)-> #{
    'index' => 116,
    'key' => 11608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(591)-> #{
    'index' => 116,
    'key' => 11608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        102006004,
         2
    ],
    'item_id' => 102006004
};
get(592)-> #{
    'index' => 116,
    'key' => 11608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102016002,
         100
    ],
    'item_id' => 102016002
};
get(593)-> #{
    'index' => 116,
    'key' => 11608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102010001,
         100000
    ],
    'item_id' => 102010001
};
get(594)-> #{
    'index' => 116,
    'key' => 11608,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        104001001,
         1500
    ],
    'item_id' => 104001001
};
get(595)-> #{
    'index' => 117,
    'key' => 11701,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(596)-> #{
    'index' => 117,
    'key' => 11701,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(597)-> #{
    'index' => 117,
    'key' => 11701,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(598)-> #{
    'index' => 117,
    'key' => 11702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(599)-> #{
    'index' => 117,
    'key' => 11702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(600)-> #{
    'index' => 117,
    'key' => 11702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(601)-> #{
    'index' => 117,
    'key' => 11702,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(602)-> #{
    'index' => 117,
    'key' => 11703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(603)-> #{
    'index' => 117,
    'key' => 11703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        106002001,
         10
    ],
    'item_id' => 106002001
};
get(604)-> #{
    'index' => 117,
    'key' => 11703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102011001,
         200
    ],
    'item_id' => 102011001
};
get(605)-> #{
    'index' => 117,
    'key' => 11703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102011003,
         200
    ],
    'item_id' => 102011003
};
get(606)-> #{
    'index' => 117,
    'key' => 11703,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102011005,
         50
    ],
    'item_id' => 102011005
};
get(607)-> #{
    'index' => 117,
    'key' => 11704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(608)-> #{
    'index' => 117,
    'key' => 11704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        106002001,
         15
    ],
    'item_id' => 106002001
};
get(609)-> #{
    'index' => 117,
    'key' => 11704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102011002,
         200
    ],
    'item_id' => 102011002
};
get(610)-> #{
    'index' => 117,
    'key' => 11704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102011004,
         200
    ],
    'item_id' => 102011004
};
get(611)-> #{
    'index' => 117,
    'key' => 11704,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102011005,
         100
    ],
    'item_id' => 102011005
};
get(612)-> #{
    'index' => 117,
    'key' => 11705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(613)-> #{
    'index' => 117,
    'key' => 11705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(614)-> #{
    'index' => 117,
    'key' => 11705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102011001,
         400
    ],
    'item_id' => 102011001
};
get(615)-> #{
    'index' => 117,
    'key' => 11705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102011003,
         400
    ],
    'item_id' => 102011003
};
get(616)-> #{
    'index' => 117,
    'key' => 11705,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102011005,
         200
    ],
    'item_id' => 102011005
};
get(617)-> #{
    'index' => 117,
    'key' => 11706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(618)-> #{
    'index' => 117,
    'key' => 11706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(619)-> #{
    'index' => 117,
    'key' => 11706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102011002,
         400
    ],
    'item_id' => 102011002
};
get(620)-> #{
    'index' => 117,
    'key' => 11706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102011004,
         400
    ],
    'item_id' => 102011004
};
get(621)-> #{
    'index' => 117,
    'key' => 11706,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102011005,
         400
    ],
    'item_id' => 102011005
};
get(622)-> #{
    'index' => 117,
    'key' => 11707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(623)-> #{
    'index' => 117,
    'key' => 11707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         40
    ],
    'item_id' => 106002001
};
get(624)-> #{
    'index' => 117,
    'key' => 11707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102011001,
         600
    ],
    'item_id' => 102011001
};
get(625)-> #{
    'index' => 117,
    'key' => 11707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102011003,
         600
    ],
    'item_id' => 102011003
};
get(626)-> #{
    'index' => 117,
    'key' => 11707,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102011005,
         600
    ],
    'item_id' => 102011005
};
get(627)-> #{
    'index' => 117,
    'key' => 11708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(628)-> #{
    'index' => 117,
    'key' => 11708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         60
    ],
    'item_id' => 106002001
};
get(629)-> #{
    'index' => 117,
    'key' => 11708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102011002,
         600
    ],
    'item_id' => 102011002
};
get(630)-> #{
    'index' => 117,
    'key' => 11708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102011004,
         600
    ],
    'item_id' => 102011004
};
get(631)-> #{
    'index' => 117,
    'key' => 11708,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102011005,
         800
    ],
    'item_id' => 102011005
};
get(632)-> #{
    'index' => 118,
    'key' => 11801,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(633)-> #{
    'index' => 118,
    'key' => 11801,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(634)-> #{
    'index' => 118,
    'key' => 11801,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(635)-> #{
    'index' => 118,
    'key' => 11802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(636)-> #{
    'index' => 118,
    'key' => 11802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(637)-> #{
    'index' => 118,
    'key' => 11802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(638)-> #{
    'index' => 118,
    'key' => 11802,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(639)-> #{
    'index' => 118,
    'key' => 11803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(640)-> #{
    'index' => 118,
    'key' => 11803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        106002001,
         10
    ],
    'item_id' => 106002001
};
get(641)-> #{
    'index' => 118,
    'key' => 11803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102013002,
         20
    ],
    'item_id' => 102013002
};
get(642)-> #{
    'index' => 118,
    'key' => 11803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102002015,
         20
    ],
    'item_id' => 102002015
};
get(643)-> #{
    'index' => 118,
    'key' => 11803,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        109010003,
         5
    ],
    'item_id' => 109010003
};
get(644)-> #{
    'index' => 118,
    'key' => 11804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(645)-> #{
    'index' => 118,
    'key' => 11804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        106002001,
         20
    ],
    'item_id' => 106002001
};
get(646)-> #{
    'index' => 118,
    'key' => 11804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102013002,
         40
    ],
    'item_id' => 102013002
};
get(647)-> #{
    'index' => 118,
    'key' => 11804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102002015,
         40
    ],
    'item_id' => 102002015
};
get(648)-> #{
    'index' => 118,
    'key' => 11804,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        109010003,
         10
    ],
    'item_id' => 109010003
};
get(649)-> #{
    'index' => 118,
    'key' => 11805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(650)-> #{
    'index' => 118,
    'key' => 11805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        106002001,
         40
    ],
    'item_id' => 106002001
};
get(651)-> #{
    'index' => 118,
    'key' => 11805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102013002,
         80
    ],
    'item_id' => 102013002
};
get(652)-> #{
    'index' => 118,
    'key' => 11805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102002015,
         80
    ],
    'item_id' => 102002015
};
get(653)-> #{
    'index' => 118,
    'key' => 11805,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        109010003,
         15
    ],
    'item_id' => 109010003
};
get(654)-> #{
    'index' => 118,
    'key' => 11806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(655)-> #{
    'index' => 118,
    'key' => 11806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        106002001,
         60
    ],
    'item_id' => 106002001
};
get(656)-> #{
    'index' => 118,
    'key' => 11806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102013002,
         100
    ],
    'item_id' => 102013002
};
get(657)-> #{
    'index' => 118,
    'key' => 11806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102002015,
         120
    ],
    'item_id' => 102002015
};
get(658)-> #{
    'index' => 118,
    'key' => 11806,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        109010003,
         20
    ],
    'item_id' => 109010003
};
get(659)-> #{
    'index' => 118,
    'key' => 11807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(660)-> #{
    'index' => 118,
    'key' => 11807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         80
    ],
    'item_id' => 106002001
};
get(661)-> #{
    'index' => 118,
    'key' => 11807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         120
    ],
    'item_id' => 102013002
};
get(662)-> #{
    'index' => 118,
    'key' => 11807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        109009003,
         4
    ],
    'item_id' => 109009003
};
get(663)-> #{
    'index' => 118,
    'key' => 11807,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        109010003,
         25
    ],
    'item_id' => 109010003
};
get(664)-> #{
    'index' => 118,
    'key' => 11808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(665)-> #{
    'index' => 118,
    'key' => 11808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         100
    ],
    'item_id' => 106002001
};
get(666)-> #{
    'index' => 118,
    'key' => 11808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         150
    ],
    'item_id' => 102013002
};
get(667)-> #{
    'index' => 118,
    'key' => 11808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        109009003,
         8
    ],
    'item_id' => 109009003
};
get(668)-> #{
    'index' => 118,
    'key' => 11808,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        109010003,
         30
    ],
    'item_id' => 109010003
};
get(669)-> #{
    'index' => 119,
    'key' => 11901,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(670)-> #{
    'index' => 119,
    'key' => 11901,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(671)-> #{
    'index' => 119,
    'key' => 11901,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(672)-> #{
    'index' => 119,
    'key' => 11902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(673)-> #{
    'index' => 119,
    'key' => 11902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(674)-> #{
    'index' => 119,
    'key' => 11902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(675)-> #{
    'index' => 119,
    'key' => 11902,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(676)-> #{
    'index' => 119,
    'key' => 11903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(677)-> #{
    'index' => 119,
    'key' => 11903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007306,
         20
    ],
    'item_id' => 102007306
};
get(678)-> #{
    'index' => 119,
    'key' => 11903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007011,
         20
    ],
    'item_id' => 102007011
};
get(679)-> #{
    'index' => 119,
    'key' => 11903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007013,
         20
    ],
    'item_id' => 102007013
};
get(680)-> #{
    'index' => 119,
    'key' => 11903,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007507,
         20
    ],
    'item_id' => 102007507
};
get(681)-> #{
    'index' => 119,
    'key' => 11904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(682)-> #{
    'index' => 119,
    'key' => 11904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007306,
         50
    ],
    'item_id' => 102007306
};
get(683)-> #{
    'index' => 119,
    'key' => 11904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007011,
         50
    ],
    'item_id' => 102007011
};
get(684)-> #{
    'index' => 119,
    'key' => 11904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007013,
         50
    ],
    'item_id' => 102007013
};
get(685)-> #{
    'index' => 119,
    'key' => 11904,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007507,
         50
    ],
    'item_id' => 102007507
};
get(686)-> #{
    'index' => 119,
    'key' => 11905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(687)-> #{
    'index' => 119,
    'key' => 11905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007306,
         150
    ],
    'item_id' => 102007306
};
get(688)-> #{
    'index' => 119,
    'key' => 11905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007011,
         150
    ],
    'item_id' => 102007011
};
get(689)-> #{
    'index' => 119,
    'key' => 11905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007013,
         150
    ],
    'item_id' => 102007013
};
get(690)-> #{
    'index' => 119,
    'key' => 11905,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007507,
         150
    ],
    'item_id' => 102007507
};
get(691)-> #{
    'index' => 119,
    'key' => 11906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(692)-> #{
    'index' => 119,
    'key' => 11906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007306,
         400
    ],
    'item_id' => 102007306
};
get(693)-> #{
    'index' => 119,
    'key' => 11906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007011,
         400
    ],
    'item_id' => 102007011
};
get(694)-> #{
    'index' => 119,
    'key' => 11906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007013,
         400
    ],
    'item_id' => 102007013
};
get(695)-> #{
    'index' => 119,
    'key' => 11906,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007507,
         400
    ],
    'item_id' => 102007507
};
get(696)-> #{
    'index' => 119,
    'key' => 11907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(697)-> #{
    'index' => 119,
    'key' => 11907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(698)-> #{
    'index' => 119,
    'key' => 11907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102016002,
         30
    ],
    'item_id' => 102016002
};
get(699)-> #{
    'index' => 119,
    'key' => 11907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007001,
         600
    ],
    'item_id' => 102007001
};
get(700)-> #{
    'index' => 119,
    'key' => 11907,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007502,
         600
    ],
    'item_id' => 102007502
};
get(701)-> #{
    'index' => 119,
    'key' => 11908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(702)-> #{
    'index' => 119,
    'key' => 11908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(703)-> #{
    'index' => 119,
    'key' => 11908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102016002,
         50
    ],
    'item_id' => 102016002
};
get(704)-> #{
    'index' => 119,
    'key' => 11908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007005,
         800
    ],
    'item_id' => 102007005
};
get(705)-> #{
    'index' => 119,
    'key' => 11908,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007501,
         800
    ],
    'item_id' => 102007501
};
get(706)-> #{
    'index' => 120,
    'key' => 12001,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(707)-> #{
    'index' => 120,
    'key' => 12001,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(708)-> #{
    'index' => 120,
    'key' => 12001,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(709)-> #{
    'index' => 120,
    'key' => 12002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(710)-> #{
    'index' => 120,
    'key' => 12002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(711)-> #{
    'index' => 120,
    'key' => 12002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(712)-> #{
    'index' => 120,
    'key' => 12002,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(713)-> #{
    'index' => 120,
    'key' => 12003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(714)-> #{
    'index' => 120,
    'key' => 12003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007406,
         20
    ],
    'item_id' => 102007406
};
get(715)-> #{
    'index' => 120,
    'key' => 12003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007002,
         20
    ],
    'item_id' => 102007002
};
get(716)-> #{
    'index' => 120,
    'key' => 12003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007009,
         20
    ],
    'item_id' => 102007009
};
get(717)-> #{
    'index' => 120,
    'key' => 12003,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007505,
         20
    ],
    'item_id' => 102007505
};
get(718)-> #{
    'index' => 120,
    'key' => 12004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(719)-> #{
    'index' => 120,
    'key' => 12004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007406,
         50
    ],
    'item_id' => 102007406
};
get(720)-> #{
    'index' => 120,
    'key' => 12004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007002,
         50
    ],
    'item_id' => 102007002
};
get(721)-> #{
    'index' => 120,
    'key' => 12004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007009,
         50
    ],
    'item_id' => 102007009
};
get(722)-> #{
    'index' => 120,
    'key' => 12004,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007505,
         50
    ],
    'item_id' => 102007505
};
get(723)-> #{
    'index' => 120,
    'key' => 12005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(724)-> #{
    'index' => 120,
    'key' => 12005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007406,
         150
    ],
    'item_id' => 102007406
};
get(725)-> #{
    'index' => 120,
    'key' => 12005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007002,
         150
    ],
    'item_id' => 102007002
};
get(726)-> #{
    'index' => 120,
    'key' => 12005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007009,
         150
    ],
    'item_id' => 102007009
};
get(727)-> #{
    'index' => 120,
    'key' => 12005,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007505,
         150
    ],
    'item_id' => 102007505
};
get(728)-> #{
    'index' => 120,
    'key' => 12006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(729)-> #{
    'index' => 120,
    'key' => 12006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007406,
         400
    ],
    'item_id' => 102007406
};
get(730)-> #{
    'index' => 120,
    'key' => 12006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007002,
         400
    ],
    'item_id' => 102007002
};
get(731)-> #{
    'index' => 120,
    'key' => 12006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007009,
         400
    ],
    'item_id' => 102007009
};
get(732)-> #{
    'index' => 120,
    'key' => 12006,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007505,
         400
    ],
    'item_id' => 102007505
};
get(733)-> #{
    'index' => 120,
    'key' => 12007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(734)-> #{
    'index' => 120,
    'key' => 12007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(735)-> #{
    'index' => 120,
    'key' => 12007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102016002,
         30
    ],
    'item_id' => 102016002
};
get(736)-> #{
    'index' => 120,
    'key' => 12007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007003,
         600
    ],
    'item_id' => 102007003
};
get(737)-> #{
    'index' => 120,
    'key' => 12007,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007009,
         600
    ],
    'item_id' => 102007009
};
get(738)-> #{
    'index' => 120,
    'key' => 12008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(739)-> #{
    'index' => 120,
    'key' => 12008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(740)-> #{
    'index' => 120,
    'key' => 12008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102016002,
         50
    ],
    'item_id' => 102016002
};
get(741)-> #{
    'index' => 120,
    'key' => 12008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007008,
         800
    ],
    'item_id' => 102007008
};
get(742)-> #{
    'index' => 120,
    'key' => 12008,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007014,
         800
    ],
    'item_id' => 102007014
};
get(743)-> #{
    'index' => 121,
    'key' => 12101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(744)-> #{
    'index' => 121,
    'key' => 12101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(745)-> #{
    'index' => 121,
    'key' => 12101,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(746)-> #{
    'index' => 121,
    'key' => 12102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(747)-> #{
    'index' => 121,
    'key' => 12102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(748)-> #{
    'index' => 121,
    'key' => 12102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(749)-> #{
    'index' => 121,
    'key' => 12102,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(750)-> #{
    'index' => 121,
    'key' => 12103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(751)-> #{
    'index' => 121,
    'key' => 12103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        101001003,
         200000
    ],
    'item_id' => 101001003
};
get(752)-> #{
    'index' => 121,
    'key' => 12103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102018001,
         25
    ],
    'item_id' => 102018001
};
get(753)-> #{
    'index' => 121,
    'key' => 12103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102018002,
         25
    ],
    'item_id' => 102018002
};
get(754)-> #{
    'index' => 121,
    'key' => 12103,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102018003,
         25
    ],
    'item_id' => 102018003
};
get(755)-> #{
    'index' => 121,
    'key' => 12104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(756)-> #{
    'index' => 121,
    'key' => 12104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        101001003,
         400000
    ],
    'item_id' => 101001003
};
get(757)-> #{
    'index' => 121,
    'key' => 12104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102018001,
         50
    ],
    'item_id' => 102018001
};
get(758)-> #{
    'index' => 121,
    'key' => 12104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102018002,
         50
    ],
    'item_id' => 102018002
};
get(759)-> #{
    'index' => 121,
    'key' => 12104,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102018003,
         50
    ],
    'item_id' => 102018003
};
get(760)-> #{
    'index' => 121,
    'key' => 12105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(761)-> #{
    'index' => 121,
    'key' => 12105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        101001003,
         1000000
    ],
    'item_id' => 101001003
};
get(762)-> #{
    'index' => 121,
    'key' => 12105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102018001,
         100
    ],
    'item_id' => 102018001
};
get(763)-> #{
    'index' => 121,
    'key' => 12105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102018002,
         100
    ],
    'item_id' => 102018002
};
get(764)-> #{
    'index' => 121,
    'key' => 12105,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102018003,
         100
    ],
    'item_id' => 102018003
};
get(765)-> #{
    'index' => 121,
    'key' => 12106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(766)-> #{
    'index' => 121,
    'key' => 12106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        101001003,
         3000000
    ],
    'item_id' => 101001003
};
get(767)-> #{
    'index' => 121,
    'key' => 12106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102018001,
         200
    ],
    'item_id' => 102018001
};
get(768)-> #{
    'index' => 121,
    'key' => 12106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102018002,
         200
    ],
    'item_id' => 102018002
};
get(769)-> #{
    'index' => 121,
    'key' => 12106,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102018003,
         200
    ],
    'item_id' => 102018003
};
get(770)-> #{
    'index' => 121,
    'key' => 12107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(771)-> #{
    'index' => 121,
    'key' => 12107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        101001003,
         5000000
    ],
    'item_id' => 101001003
};
get(772)-> #{
    'index' => 121,
    'key' => 12107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102018001,
         300
    ],
    'item_id' => 102018001
};
get(773)-> #{
    'index' => 121,
    'key' => 12107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102018002,
         300
    ],
    'item_id' => 102018002
};
get(774)-> #{
    'index' => 121,
    'key' => 12107,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102018003,
         300
    ],
    'item_id' => 102018003
};
get(775)-> #{
    'index' => 121,
    'key' => 12108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(776)-> #{
    'index' => 121,
    'key' => 12108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        101001003,
         8000000
    ],
    'item_id' => 101001003
};
get(777)-> #{
    'index' => 121,
    'key' => 12108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102018001,
         500
    ],
    'item_id' => 102018001
};
get(778)-> #{
    'index' => 121,
    'key' => 12108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102018002,
         500
    ],
    'item_id' => 102018002
};
get(779)-> #{
    'index' => 121,
    'key' => 12108,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102018003,
         500
    ],
    'item_id' => 102018003
};
get(780)-> #{
    'index' => 122,
    'key' => 12201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 1,
    'reward' => [
        101001002,
         60
    ],
    'item_id' => 101001002
};
get(781)-> #{
    'index' => 122,
    'key' => 12201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 2,
    'reward' => [
        102013002,
         5
    ],
    'item_id' => 102013002
};
get(782)-> #{
    'index' => 122,
    'key' => 12201,
    'recharge_lvl' => 1,
    'recharge_amount' => 60,
    'num' => 3,
    'reward' => [
        102016002,
         5
    ],
    'item_id' => 102016002
};
get(783)-> #{
    'index' => 122,
    'key' => 12202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 1,
    'reward' => [
        101001002,
         300
    ],
    'item_id' => 101001002
};
get(784)-> #{
    'index' => 122,
    'key' => 12202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 2,
    'reward' => [
        106002001,
         5
    ],
    'item_id' => 106002001
};
get(785)-> #{
    'index' => 122,
    'key' => 12202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 3,
    'reward' => [
        102013002,
         10
    ],
    'item_id' => 102013002
};
get(786)-> #{
    'index' => 122,
    'key' => 12202,
    'recharge_lvl' => 2,
    'recharge_amount' => 300,
    'num' => 4,
    'reward' => [
        102016002,
         10
    ],
    'item_id' => 102016002
};
get(787)-> #{
    'index' => 122,
    'key' => 12203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 1,
    'reward' => [
        101001002,
         680
    ],
    'item_id' => 101001002
};
get(788)-> #{
    'index' => 122,
    'key' => 12203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 2,
    'reward' => [
        102007103,
         40
    ],
    'item_id' => 102007103
};
get(789)-> #{
    'index' => 122,
    'key' => 12203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 3,
    'reward' => [
        102007104,
         40
    ],
    'item_id' => 102007104
};
get(790)-> #{
    'index' => 122,
    'key' => 12203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 4,
    'reward' => [
        102007105,
         40
    ],
    'item_id' => 102007105
};
get(791)-> #{
    'index' => 122,
    'key' => 12203,
    'recharge_lvl' => 3,
    'recharge_amount' => 680,
    'num' => 5,
    'reward' => [
        102007106,
         40
    ],
    'item_id' => 102007106
};
get(792)-> #{
    'index' => 122,
    'key' => 12204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 1,
    'reward' => [
        101001002,
         1280
    ],
    'item_id' => 101001002
};
get(793)-> #{
    'index' => 122,
    'key' => 12204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 2,
    'reward' => [
        102007103,
         100
    ],
    'item_id' => 102007103
};
get(794)-> #{
    'index' => 122,
    'key' => 12204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 3,
    'reward' => [
        102007104,
         100
    ],
    'item_id' => 102007104
};
get(795)-> #{
    'index' => 122,
    'key' => 12204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 4,
    'reward' => [
        102007105,
         100
    ],
    'item_id' => 102007105
};
get(796)-> #{
    'index' => 122,
    'key' => 12204,
    'recharge_lvl' => 4,
    'recharge_amount' => 1280,
    'num' => 5,
    'reward' => [
        102007106,
         100
    ],
    'item_id' => 102007106
};
get(797)-> #{
    'index' => 122,
    'key' => 12205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 1,
    'reward' => [
        101001002,
         3280
    ],
    'item_id' => 101001002
};
get(798)-> #{
    'index' => 122,
    'key' => 12205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 2,
    'reward' => [
        102007103,
         300
    ],
    'item_id' => 102007103
};
get(799)-> #{
    'index' => 122,
    'key' => 12205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 3,
    'reward' => [
        102007104,
         300
    ],
    'item_id' => 102007104
};
get(800)-> #{
    'index' => 122,
    'key' => 12205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 4,
    'reward' => [
        102007105,
         300
    ],
    'item_id' => 102007105
};
get(801)-> #{
    'index' => 122,
    'key' => 12205,
    'recharge_lvl' => 5,
    'recharge_amount' => 3280,
    'num' => 5,
    'reward' => [
        102007106,
         300
    ],
    'item_id' => 102007106
};
get(802)-> #{
    'index' => 122,
    'key' => 12206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 1,
    'reward' => [
        101001002,
         6480
    ],
    'item_id' => 101001002
};
get(803)-> #{
    'index' => 122,
    'key' => 12206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 2,
    'reward' => [
        102007103,
         800
    ],
    'item_id' => 102007103
};
get(804)-> #{
    'index' => 122,
    'key' => 12206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 3,
    'reward' => [
        102007104,
         800
    ],
    'item_id' => 102007104
};
get(805)-> #{
    'index' => 122,
    'key' => 12206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 4,
    'reward' => [
        102007105,
         800
    ],
    'item_id' => 102007105
};
get(806)-> #{
    'index' => 122,
    'key' => 12206,
    'recharge_lvl' => 6,
    'recharge_amount' => 6480,
    'num' => 5,
    'reward' => [
        102007106,
         800
    ],
    'item_id' => 102007106
};
get(807)-> #{
    'index' => 122,
    'key' => 12207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 1,
    'reward' => [
        101001002,
         10000
    ],
    'item_id' => 101001002
};
get(808)-> #{
    'index' => 122,
    'key' => 12207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 2,
    'reward' => [
        106002001,
         30
    ],
    'item_id' => 106002001
};
get(809)-> #{
    'index' => 122,
    'key' => 12207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 3,
    'reward' => [
        102013002,
         30
    ],
    'item_id' => 102013002
};
get(810)-> #{
    'index' => 122,
    'key' => 12207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 4,
    'reward' => [
        102007010,
         500
    ],
    'item_id' => 102007010
};
get(811)-> #{
    'index' => 122,
    'key' => 12207,
    'recharge_lvl' => 7,
    'recharge_amount' => 9980,
    'num' => 5,
    'reward' => [
        102007503,
         500
    ],
    'item_id' => 102007503
};
get(812)-> #{
    'index' => 122,
    'key' => 12208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 1,
    'reward' => [
        101001002,
         20000
    ],
    'item_id' => 101001002
};
get(813)-> #{
    'index' => 122,
    'key' => 12208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 2,
    'reward' => [
        106002001,
         50
    ],
    'item_id' => 106002001
};
get(814)-> #{
    'index' => 122,
    'key' => 12208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 3,
    'reward' => [
        102013002,
         50
    ],
    'item_id' => 102013002
};
get(815)-> #{
    'index' => 122,
    'key' => 12208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 4,
    'reward' => [
        102007011,
         600
    ],
    'item_id' => 102007011
};
get(816)-> #{
    'index' => 122,
    'key' => 12208,
    'recharge_lvl' => 8,
    'recharge_amount' => 19980,
    'num' => 5,
    'reward' => [
        102007510,
         600
    ],
    'item_id' => 102007510
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816].
