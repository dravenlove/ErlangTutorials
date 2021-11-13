%%--- coding:utf-8 ---
-module(tb_limitedtime_freeorder).
-export([get/1,get_list/0]).
get(1)-> #{
    'index' => 101,
    'goods_id' => 10101,
    'num' => 1,
    'goods' => [
        102012013,
         5
    ],
    'item_id' => 102012013,
    'price' => 250,
    'buy_time' => 120,
    'free_probability' => 0.5
};
get(2)-> #{
    'index' => 101,
    'goods_id' => 10102,
    'num' => 2,
    'goods' => [
        102007304,
         5
    ],
    'item_id' => 102007304,
    'price' => 200,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(3)-> #{
    'index' => 101,
    'goods_id' => 10103,
    'num' => 3,
    'goods' => [
        104001001,
         5
    ],
    'item_id' => 104001001,
    'price' => 150,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(4)-> #{
    'index' => 101,
    'goods_id' => 10104,
    'num' => 4,
    'goods' => [
        102007006,
         5
    ],
    'item_id' => 102007006,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(5)-> #{
    'index' => 101,
    'goods_id' => 10105,
    'num' => 5,
    'goods' => [
        102007011,
         5
    ],
    'item_id' => 102007011,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(6)-> #{
    'index' => 101,
    'goods_id' => 10106,
    'num' => 6,
    'goods' => [
        102022060,
         5
    ],
    'item_id' => 102022060,
    'price' => 250,
    'buy_time' => 20,
    'free_probability' => 0.5
};
get(7)-> #{
    'index' => 102,
    'goods_id' => 10201,
    'num' => 1,
    'goods' => [
        104001001,
         5
    ],
    'item_id' => 104001001,
    'price' => 150,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(8)-> #{
    'index' => 102,
    'goods_id' => 10202,
    'num' => 2,
    'goods' => [
        102007304,
         5
    ],
    'item_id' => 102007304,
    'price' => 200,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(9)-> #{
    'index' => 102,
    'goods_id' => 10203,
    'num' => 3,
    'goods' => [
        102007012,
         5
    ],
    'item_id' => 102007012,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(10)-> #{
    'index' => 102,
    'goods_id' => 10204,
    'num' => 4,
    'goods' => [
        102007010,
         5
    ],
    'item_id' => 102007010,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(11)-> #{
    'index' => 102,
    'goods_id' => 10205,
    'num' => 5,
    'goods' => [
        102022058,
         5
    ],
    'item_id' => 102022058,
    'price' => 200,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(12)-> #{
    'index' => 102,
    'goods_id' => 10206,
    'num' => 6,
    'goods' => [
        102005049,
         5
    ],
    'item_id' => 102005049,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(13)-> #{
    'index' => 103,
    'goods_id' => 10301,
    'num' => 1,
    'goods' => [
        102007206,
         5
    ],
    'item_id' => 102007206,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(14)-> #{
    'index' => 103,
    'goods_id' => 10302,
    'num' => 2,
    'goods' => [
        102007011,
         5
    ],
    'item_id' => 102007011,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(15)-> #{
    'index' => 103,
    'goods_id' => 10303,
    'num' => 3,
    'goods' => [
        102007010,
         5
    ],
    'item_id' => 102007010,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(16)-> #{
    'index' => 103,
    'goods_id' => 10304,
    'num' => 4,
    'goods' => [
        102022060,
         5
    ],
    'item_id' => 102022060,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(17)-> #{
    'index' => 103,
    'goods_id' => 10305,
    'num' => 5,
    'goods' => [
        102005049,
         5
    ],
    'item_id' => 102005049,
    'price' => 200,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(18)-> #{
    'index' => 103,
    'goods_id' => 10306,
    'num' => 6,
    'goods' => [
        102022047,
         5
    ],
    'item_id' => 102022047,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(19)-> #{
    'index' => 104,
    'goods_id' => 10401,
    'num' => 1,
    'goods' => [
        106002001,
         3
    ],
    'item_id' => 106002001,
    'price' => 80,
    'buy_time' => 10,
    'free_probability' => 0.5
};
get(20)-> #{
    'index' => 104,
    'goods_id' => 10402,
    'num' => 2,
    'goods' => [
        102022051,
         5
    ],
    'item_id' => 102022051,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(21)-> #{
    'index' => 104,
    'goods_id' => 10403,
    'num' => 3,
    'goods' => [
        102007101,
         5
    ],
    'item_id' => 102007101,
    'price' => 80,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(22)-> #{
    'index' => 104,
    'goods_id' => 10404,
    'num' => 4,
    'goods' => [
        102007203,
         5
    ],
    'item_id' => 102007203,
    'price' => 80,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(23)-> #{
    'index' => 104,
    'goods_id' => 10405,
    'num' => 5,
    'goods' => [
        102007301,
         5
    ],
    'item_id' => 102007301,
    'price' => 80,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(24)-> #{
    'index' => 104,
    'goods_id' => 10406,
    'num' => 6,
    'goods' => [
        102007403,
         5
    ],
    'item_id' => 102007403,
    'price' => 80,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(25)-> #{
    'index' => 105,
    'goods_id' => 10501,
    'num' => 1,
    'goods' => [
        106002001,
         3
    ],
    'item_id' => 106002001,
    'price' => 80,
    'buy_time' => 10,
    'free_probability' => 0.5
};
get(26)-> #{
    'index' => 105,
    'goods_id' => 10502,
    'num' => 2,
    'goods' => [
        102012206,
         5
    ],
    'item_id' => 102012206,
    'price' => 250,
    'buy_time' => 80,
    'free_probability' => 0.5
};
get(27)-> #{
    'index' => 105,
    'goods_id' => 10503,
    'num' => 3,
    'goods' => [
        102022048,
         5
    ],
    'item_id' => 102022048,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(28)-> #{
    'index' => 105,
    'goods_id' => 10504,
    'num' => 4,
    'goods' => [
        102022050,
         5
    ],
    'item_id' => 102022050,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(29)-> #{
    'index' => 105,
    'goods_id' => 10505,
    'num' => 5,
    'goods' => [
        102022060,
         5
    ],
    'item_id' => 102022060,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(30)-> #{
    'index' => 105,
    'goods_id' => 10506,
    'num' => 6,
    'goods' => [
        102022049,
         5
    ],
    'item_id' => 102022049,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(31)-> #{
    'index' => 106,
    'goods_id' => 10601,
    'num' => 1,
    'goods' => [
        102012056,
         5
    ],
    'item_id' => 102012056,
    'price' => 300,
    'buy_time' => 120,
    'free_probability' => 0.5
};
get(32)-> #{
    'index' => 106,
    'goods_id' => 10602,
    'num' => 2,
    'goods' => [
        102020001,
         5
    ],
    'item_id' => 102020001,
    'price' => 100,
    'buy_time' => 100,
    'free_probability' => 0.5
};
get(33)-> #{
    'index' => 106,
    'goods_id' => 10603,
    'num' => 3,
    'goods' => [
        102020002,
         5
    ],
    'item_id' => 102020002,
    'price' => 100,
    'buy_time' => 100,
    'free_probability' => 0.5
};
get(34)-> #{
    'index' => 106,
    'goods_id' => 10604,
    'num' => 4,
    'goods' => [
        102020003,
         5
    ],
    'item_id' => 102020003,
    'price' => 100,
    'buy_time' => 100,
    'free_probability' => 0.5
};
get(35)-> #{
    'index' => 106,
    'goods_id' => 10605,
    'num' => 5,
    'goods' => [
        102020004,
         5
    ],
    'item_id' => 102020004,
    'price' => 100,
    'buy_time' => 100,
    'free_probability' => 0.5
};
get(36)-> #{
    'index' => 106,
    'goods_id' => 10606,
    'num' => 6,
    'goods' => [
        102020005,
         5
    ],
    'item_id' => 102020005,
    'price' => 200,
    'buy_time' => 100,
    'free_probability' => 0.5
};
get(37)-> #{
    'index' => 107,
    'goods_id' => 10701,
    'num' => 1,
    'goods' => [
        106002001,
         3
    ],
    'item_id' => 106002001,
    'price' => 80,
    'buy_time' => 10,
    'free_probability' => 0.5
};
get(38)-> #{
    'index' => 107,
    'goods_id' => 10702,
    'num' => 2,
    'goods' => [
        104006001,
         10
    ],
    'item_id' => 104006001,
    'price' => 200,
    'buy_time' => 50,
    'free_probability' => 0.5
};
get(39)-> #{
    'index' => 107,
    'goods_id' => 10703,
    'num' => 3,
    'goods' => [
        102007204,
         5
    ],
    'item_id' => 102007204,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(40)-> #{
    'index' => 107,
    'goods_id' => 10704,
    'num' => 4,
    'goods' => [
        102007206,
         5
    ],
    'item_id' => 102007206,
    'price' => 250,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(41)-> #{
    'index' => 107,
    'goods_id' => 10705,
    'num' => 5,
    'goods' => [
        102007016,
         5
    ],
    'item_id' => 102007016,
    'price' => 300,
    'buy_time' => 25,
    'free_probability' => 0.5
};
get(42)-> #{
    'index' => 107,
    'goods_id' => 10706,
    'num' => 6,
    'goods' => [
        102022053,
         5
    ],
    'item_id' => 102022053,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(43)-> #{
    'index' => 108,
    'goods_id' => 10801,
    'num' => 1,
    'goods' => [
        102007502,
         5
    ],
    'item_id' => 102007502,
    'price' => 200,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(44)-> #{
    'index' => 108,
    'goods_id' => 10802,
    'num' => 2,
    'goods' => [
        102007504,
         5
    ],
    'item_id' => 102007504,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(45)-> #{
    'index' => 108,
    'goods_id' => 10803,
    'num' => 3,
    'goods' => [
        102007011,
         5
    ],
    'item_id' => 102007011,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(46)-> #{
    'index' => 108,
    'goods_id' => 10804,
    'num' => 4,
    'goods' => [
        102007012,
         5
    ],
    'item_id' => 102007012,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(47)-> #{
    'index' => 108,
    'goods_id' => 10805,
    'num' => 5,
    'goods' => [
        102007010,
         5
    ],
    'item_id' => 102007010,
    'price' => 200,
    'buy_time' => 30,
    'free_probability' => 0.5
};
get(48)-> #{
    'index' => 108,
    'goods_id' => 10806,
    'num' => 6,
    'goods' => [
        102007014,
         5
    ],
    'item_id' => 102007014,
    'price' => 250,
    'buy_time' => 30,
    'free_probability' => 0.5
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48].
