%%--- coding:utf-8 ---
-module(tb_discount_shop).
-export([get/1,get_list/0]).
get(1)-> #{
    'index' => 101,
    'key' => 10101,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 40
};
get(2)-> #{
    'index' => 101,
    'key' => 10102,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        104005001,
         3
    ],
    'item_id' => 104005001,
    'price' => 25,
    'buy_time' => 20
};
get(3)-> #{
    'index' => 101,
    'key' => 10103,
    'num' => 3,
    'recharge_amount' => 500,
    'reward' => [
        102007402,
         5
    ],
    'item_id' => 102007402,
    'price' => 50,
    'buy_time' => 15
};
get(4)-> #{
    'index' => 101,
    'key' => 10104,
    'num' => 4,
    'recharge_amount' => 500,
    'reward' => [
        102007305,
         5
    ],
    'item_id' => 102007305,
    'price' => 150,
    'buy_time' => 15
};
get(5)-> #{
    'index' => 101,
    'key' => 10105,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102007012,
         5
    ],
    'item_id' => 102007012,
    'price' => 200,
    'buy_time' => 15
};
get(6)-> #{
    'index' => 101,
    'key' => 10106,
    'num' => 6,
    'recharge_amount' => 1000,
    'reward' => [
        102007009,
         5
    ],
    'item_id' => 102007009,
    'price' => 200,
    'buy_time' => 10
};
get(7)-> #{
    'index' => 101,
    'key' => 10107,
    'num' => 7,
    'recharge_amount' => 1000,
    'reward' => [
        102007013,
         5
    ],
    'item_id' => 102007013,
    'price' => 200,
    'buy_time' => 10
};
get(8)-> #{
    'index' => 101,
    'key' => 10108,
    'num' => 8,
    'recharge_amount' => 2000,
    'reward' => [
        102005048,
         5
    ],
    'item_id' => 102005048,
    'price' => 200,
    'buy_time' => 5
};
get(9)-> #{
    'index' => 102,
    'key' => 10201,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 40
};
get(10)-> #{
    'index' => 102,
    'key' => 10202,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        104007001,
         3
    ],
    'item_id' => 104007001,
    'price' => 20,
    'buy_time' => 20
};
get(11)-> #{
    'index' => 102,
    'key' => 10203,
    'num' => 3,
    'recharge_amount' => 300,
    'reward' => [
        104005001,
         5
    ],
    'item_id' => 104005001,
    'price' => 50,
    'buy_time' => 15
};
get(12)-> #{
    'index' => 102,
    'key' => 10204,
    'num' => 4,
    'recharge_amount' => 300,
    'reward' => [
        102007405,
         5
    ],
    'item_id' => 102007405,
    'price' => 100,
    'buy_time' => 15
};
get(13)-> #{
    'index' => 102,
    'key' => 10205,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102007005,
         5
    ],
    'item_id' => 102007005,
    'price' => 100,
    'buy_time' => 15
};
get(14)-> #{
    'index' => 102,
    'key' => 10206,
    'num' => 6,
    'recharge_amount' => 1000,
    'reward' => [
        102007009,
         5
    ],
    'item_id' => 102007009,
    'price' => 150,
    'buy_time' => 10
};
get(15)-> #{
    'index' => 102,
    'key' => 10207,
    'num' => 7,
    'recharge_amount' => 1000,
    'reward' => [
        102007014,
         5
    ],
    'item_id' => 102007014,
    'price' => 150,
    'buy_time' => 10
};
get(16)-> #{
    'index' => 102,
    'key' => 10208,
    'num' => 8,
    'recharge_amount' => 2000,
    'reward' => [
        102005042,
         5
    ],
    'item_id' => 102005042,
    'price' => 250,
    'buy_time' => 5
};
get(17)-> #{
    'index' => 103,
    'key' => 10301,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 20
};
get(18)-> #{
    'index' => 103,
    'key' => 10302,
    'num' => 2,
    'recharge_amount' => 60,
    'reward' => [
        104007001,
         3
    ],
    'item_id' => 104007001,
    'price' => 20,
    'buy_time' => 20
};
get(19)-> #{
    'index' => 103,
    'key' => 10303,
    'num' => 3,
    'recharge_amount' => 300,
    'reward' => [
        102007510,
         5
    ],
    'item_id' => 102007510,
    'price' => 100,
    'buy_time' => 10
};
get(20)-> #{
    'index' => 103,
    'key' => 10304,
    'num' => 4,
    'recharge_amount' => 300,
    'reward' => [
        102007509,
         5
    ],
    'item_id' => 102007509,
    'price' => 100,
    'buy_time' => 15
};
get(21)-> #{
    'index' => 103,
    'key' => 10305,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102007004,
         5
    ],
    'item_id' => 102007004,
    'price' => 100,
    'buy_time' => 15
};
get(22)-> #{
    'index' => 103,
    'key' => 10306,
    'num' => 6,
    'recharge_amount' => 1000,
    'reward' => [
        102007206,
         5
    ],
    'item_id' => 102007206,
    'price' => 150,
    'buy_time' => 15
};
get(23)-> #{
    'index' => 103,
    'key' => 10307,
    'num' => 7,
    'recharge_amount' => 1000,
    'reward' => [
        102007009,
         5
    ],
    'item_id' => 102007009,
    'price' => 150,
    'buy_time' => 15
};
get(24)-> #{
    'index' => 103,
    'key' => 10308,
    'num' => 8,
    'recharge_amount' => 2000,
    'reward' => [
        102005050,
         5
    ],
    'item_id' => 102005050,
    'price' => 250,
    'buy_time' => 10
};
get(25)-> #{
    'index' => 104,
    'key' => 10401,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 20
};
get(26)-> #{
    'index' => 104,
    'key' => 10402,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        102007501,
         5
    ],
    'item_id' => 102007501,
    'price' => 150,
    'buy_time' => 20
};
get(27)-> #{
    'index' => 104,
    'key' => 10403,
    'num' => 3,
    'recharge_amount' => 1000,
    'reward' => [
        102007506,
         5
    ],
    'item_id' => 102007506,
    'price' => 150,
    'buy_time' => 20
};
get(28)-> #{
    'index' => 104,
    'key' => 10404,
    'num' => 4,
    'recharge_amount' => 1000,
    'reward' => [
        102007005,
         5
    ],
    'item_id' => 102007005,
    'price' => 150,
    'buy_time' => 20
};
get(29)-> #{
    'index' => 104,
    'key' => 10405,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102007009,
         5
    ],
    'item_id' => 102007009,
    'price' => 150,
    'buy_time' => 20
};
get(30)-> #{
    'index' => 104,
    'key' => 10406,
    'num' => 6,
    'recharge_amount' => 1500,
    'reward' => [
        102007014,
         5
    ],
    'item_id' => 102007014,
    'price' => 150,
    'buy_time' => 20
};
get(31)-> #{
    'index' => 104,
    'key' => 10407,
    'num' => 7,
    'recharge_amount' => 2500,
    'reward' => [
        102005042,
         5
    ],
    'item_id' => 102005042,
    'price' => 250,
    'buy_time' => 15
};
get(32)-> #{
    'index' => 104,
    'key' => 10408,
    'num' => 8,
    'recharge_amount' => 3000,
    'reward' => [
        102012221,
         5
    ],
    'item_id' => 102012221,
    'price' => 250,
    'buy_time' => 20
};
get(33)-> #{
    'index' => 105,
    'key' => 10501,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        102028001,
         1
    ],
    'item_id' => 102028001,
    'price' => 50,
    'buy_time' => 20
};
get(34)-> #{
    'index' => 105,
    'key' => 10502,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        102007501,
         5
    ],
    'item_id' => 102007501,
    'price' => 150,
    'buy_time' => 15
};
get(35)-> #{
    'index' => 105,
    'key' => 10503,
    'num' => 3,
    'recharge_amount' => 500,
    'reward' => [
        102005042,
         5
    ],
    'item_id' => 102005042,
    'price' => 250,
    'buy_time' => 15
};
get(36)-> #{
    'index' => 105,
    'key' => 10504,
    'num' => 4,
    'recharge_amount' => 1000,
    'reward' => [
        102012221,
         5
    ],
    'item_id' => 102012221,
    'price' => 250,
    'buy_time' => 40
};
get(37)-> #{
    'index' => 105,
    'key' => 10505,
    'num' => 5,
    'recharge_amount' => 2000,
    'reward' => [
        102012222,
         5
    ],
    'item_id' => 102012222,
    'price' => 250,
    'buy_time' => 40
};
get(38)-> #{
    'index' => 105,
    'key' => 10506,
    'num' => 6,
    'recharge_amount' => 3000,
    'reward' => [
        102012223,
         5
    ],
    'item_id' => 102012223,
    'price' => 250,
    'buy_time' => 40
};
get(39)-> #{
    'index' => 105,
    'key' => 10507,
    'num' => 7,
    'recharge_amount' => 6000,
    'reward' => [
        102012224,
         5
    ],
    'item_id' => 102012224,
    'price' => 250,
    'buy_time' => 40
};
get(40)-> #{
    'index' => 105,
    'key' => 10508,
    'num' => 8,
    'recharge_amount' => 10000,
    'reward' => [
        102012225,
         5
    ],
    'item_id' => 102012225,
    'price' => 250,
    'buy_time' => 40
};
get(41)-> #{
    'index' => 106,
    'key' => 10601,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 40
};
get(42)-> #{
    'index' => 106,
    'key' => 10602,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        104006001,
         5
    ],
    'item_id' => 104006001,
    'price' => 150,
    'buy_time' => 15
};
get(43)-> #{
    'index' => 106,
    'key' => 10603,
    'num' => 3,
    'recharge_amount' => 300,
    'reward' => [
        102007201,
         5
    ],
    'item_id' => 102007201,
    'price' => 20,
    'buy_time' => 50
};
get(44)-> #{
    'index' => 106,
    'key' => 10604,
    'num' => 4,
    'recharge_amount' => 300,
    'reward' => [
        102007204,
         5
    ],
    'item_id' => 102007204,
    'price' => 20,
    'buy_time' => 50
};
get(45)-> #{
    'index' => 106,
    'key' => 10605,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102007505,
         5
    ],
    'item_id' => 102007505,
    'price' => 150,
    'buy_time' => 15
};
get(46)-> #{
    'index' => 106,
    'key' => 10606,
    'num' => 6,
    'recharge_amount' => 1000,
    'reward' => [
        102007016,
         5
    ],
    'item_id' => 102007016,
    'price' => 200,
    'buy_time' => 30
};
get(47)-> #{
    'index' => 106,
    'key' => 10607,
    'num' => 7,
    'recharge_amount' => 1500,
    'reward' => [
        102005051,
         5
    ],
    'item_id' => 102005051,
    'price' => 200,
    'buy_time' => 20
};
get(48)-> #{
    'index' => 106,
    'key' => 10608,
    'num' => 8,
    'recharge_amount' => 3000,
    'reward' => [
        102005053,
         5
    ],
    'item_id' => 102005053,
    'price' => 250,
    'buy_time' => 30
};
get(49)-> #{
    'index' => 107,
    'key' => 10701,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 40
};
get(50)-> #{
    'index' => 107,
    'key' => 10702,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        104006001,
         5
    ],
    'item_id' => 104006001,
    'price' => 150,
    'buy_time' => 15
};
get(51)-> #{
    'index' => 107,
    'key' => 10703,
    'num' => 3,
    'recharge_amount' => 300,
    'reward' => [
        102007101,
         5
    ],
    'item_id' => 102007101,
    'price' => 20,
    'buy_time' => 50
};
get(52)-> #{
    'index' => 107,
    'key' => 10704,
    'num' => 4,
    'recharge_amount' => 300,
    'reward' => [
        102007004,
         5
    ],
    'item_id' => 102007004,
    'price' => 20,
    'buy_time' => 50
};
get(53)-> #{
    'index' => 107,
    'key' => 10705,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102012206,
         0
    ],
    'item_id' => 102012206,
    'price' => 250,
    'buy_time' => 30
};
get(54)-> #{
    'index' => 107,
    'key' => 10706,
    'num' => 6,
    'recharge_amount' => 1000,
    'reward' => [
        102007013,
         5
    ],
    'item_id' => 102007013,
    'price' => 150,
    'buy_time' => 20
};
get(55)-> #{
    'index' => 107,
    'key' => 10707,
    'num' => 7,
    'recharge_amount' => 1500,
    'reward' => [
        102007504,
         5
    ],
    'item_id' => 102007504,
    'price' => 200,
    'buy_time' => 20
};
get(56)-> #{
    'index' => 107,
    'key' => 10708,
    'num' => 8,
    'recharge_amount' => 3000,
    'reward' => [
        102005052,
         5
    ],
    'item_id' => 102005052,
    'price' => 250,
    'buy_time' => 30
};
get(57)-> #{
    'index' => 108,
    'key' => 10801,
    'num' => 1,
    'recharge_amount' => 60,
    'reward' => [
        106002001,
         1
    ],
    'item_id' => 106002001,
    'price' => 20,
    'buy_time' => 40
};
get(58)-> #{
    'index' => 108,
    'key' => 10802,
    'num' => 2,
    'recharge_amount' => 300,
    'reward' => [
        104006001,
         5
    ],
    'item_id' => 104006001,
    'price' => 150,
    'buy_time' => 15
};
get(59)-> #{
    'index' => 108,
    'key' => 10803,
    'num' => 3,
    'recharge_amount' => 300,
    'reward' => [
        102007101,
         5
    ],
    'item_id' => 102007101,
    'price' => 20,
    'buy_time' => 50
};
get(60)-> #{
    'index' => 108,
    'key' => 10804,
    'num' => 4,
    'recharge_amount' => 300,
    'reward' => [
        102007004,
         5
    ],
    'item_id' => 102007004,
    'price' => 20,
    'buy_time' => 50
};
get(61)-> #{
    'index' => 108,
    'key' => 10805,
    'num' => 5,
    'recharge_amount' => 1000,
    'reward' => [
        102007011,
         5
    ],
    'item_id' => 102007011,
    'price' => 150,
    'buy_time' => 20
};
get(62)-> #{
    'index' => 108,
    'key' => 10806,
    'num' => 6,
    'recharge_amount' => 1000,
    'reward' => [
        102007013,
         5
    ],
    'item_id' => 102007013,
    'price' => 150,
    'buy_time' => 20
};
get(63)-> #{
    'index' => 108,
    'key' => 10807,
    'num' => 7,
    'recharge_amount' => 1500,
    'reward' => [
        102007504,
         5
    ],
    'item_id' => 102007504,
    'price' => 200,
    'buy_time' => 20
};
get(64)-> #{
    'index' => 108,
    'key' => 10808,
    'num' => 8,
    'recharge_amount' => 3000,
    'reward' => [
        102005052,
         5
    ],
    'item_id' => 102005052,
    'price' => 250,
    'buy_time' => 30
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64].
