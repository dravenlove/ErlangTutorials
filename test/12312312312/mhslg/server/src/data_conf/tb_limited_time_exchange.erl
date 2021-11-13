%%--- coding:utf-8 ---
-module(tb_limited_time_exchange).
-export([get/1,get_list/0]).
get(20101)-> #{
    'shop_id' => 201,
    'sort_id' => 1,
    'item_id' => 106010001,
    'amount' => 1,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        3,
         1
    ]
};
get(20102)-> #{
    'shop_id' => 201,
    'sort_id' => 2,
    'item_id' => 106011001,
    'amount' => 1,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        3,
         1
    ]
};
get(20103)-> #{
    'shop_id' => 201,
    'sort_id' => 3,
    'item_id' => 106012001,
    'amount' => 1,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        3,
         1
    ]
};
get(20104)-> #{
    'shop_id' => 201,
    'sort_id' => 4,
    'item_id' => 106013001,
    'amount' => 1,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        3,
         1
    ]
};
get(20105)-> #{
    'shop_id' => 201,
    'sort_id' => 5,
    'item_id' => 102012013,
    'amount' => 10,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         1
    ],
    'put_down_time' => [
        3,
         1
    ]
};
get(20106)-> #{
    'shop_id' => 201,
    'sort_id' => 6,
    'item_id' => 102012047,
    'amount' => 10,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         23
    ],
    'put_down_time' => [
        3,
         1
    ]
};
get(20107)-> #{
    'shop_id' => 201,
    'sort_id' => 7,
    'item_id' => 104005001,
    'amount' => 20,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         1
    ]
};
get(20108)-> #{
    'shop_id' => 201,
    'sort_id' => 8,
    'item_id' => 104006001,
    'amount' => 80,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         1
    ]
};
get(20109)-> #{
    'shop_id' => 201,
    'sort_id' => 9,
    'item_id' => 109009002,
    'amount' => 2,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         1
    ]
};
get(20110)-> #{
    'shop_id' => 201,
    'sort_id' => 10,
    'item_id' => 109010002,
    'amount' => 4,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         1
    ]
};
get(20111)-> #{
    'shop_id' => 201,
    'sort_id' => 11,
    'item_id' => 102007517,
    'amount' => 10,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         10
    ]
};
get(20112)-> #{
    'shop_id' => 201,
    'sort_id' => 12,
    'item_id' => 102007020,
    'amount' => 10,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         18
    ]
};
get(20113)-> #{
    'shop_id' => 201,
    'sort_id' => 13,
    'item_id' => 102007518,
    'amount' => 10,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         22
    ]
};
get(20114)-> #{
    'shop_id' => 201,
    'sort_id' => 14,
    'item_id' => 102007021,
    'amount' => 10,
    'money_id' => 102002006,
    'price' => 10,
    'limit_time' => 60,
    'put_on_time' => [
        0,
         33
    ]
};
get(20115)-> #{
    'shop_id' => 201,
    'sort_id' => 15,
    'item_id' => 102026001,
    'amount' => 1,
    'money_id' => 102002006,
    'price' => 600,
    'limit_time' => 10,
    'put_on_time' => [
        1,
         1
    ]
};
get(20201)-> #{
    'shop_id' => 202,
    'sort_id' => 1,
    'item_id' => 107001101,
    'amount' => 1,
    'money_id' => 102002007,
    'price' => 200,
    'limit_time' => 1,
    'put_on_time' => [
        0,
         13
    ]
};
get(20202)-> #{
    'shop_id' => 202,
    'sort_id' => 2,
    'item_id' => 107002101,
    'amount' => 1,
    'money_id' => 102002007,
    'price' => 400,
    'limit_time' => 1,
    'put_on_time' => [
        0,
         13
    ]
};
get(20203)-> #{
    'shop_id' => 202,
    'sort_id' => 3,
    'item_id' => 107003101,
    'amount' => 1,
    'money_id' => 102002007,
    'price' => 600,
    'limit_time' => 1,
    'put_on_time' => [
        0,
         13
    ]
};
get(20204)-> #{
    'shop_id' => 202,
    'sort_id' => 4,
    'item_id' => 107004101,
    'amount' => 1,
    'money_id' => 102002007,
    'price' => 800,
    'limit_time' => 1,
    'put_on_time' => [
        0,
         13
    ]
};
get(20205)-> #{
    'shop_id' => 202,
    'sort_id' => 5,
    'item_id' => 107005101,
    'amount' => 1,
    'money_id' => 102002007,
    'price' => 1000,
    'limit_time' => 1,
    'put_on_time' => [
        0,
         13
    ]
};
get(20206)-> #{
    'shop_id' => 202,
    'sort_id' => 6,
    'item_id' => 102012206,
    'amount' => 10,
    'money_id' => 102002007,
    'price' => 15,
    'limit_time' => 50,
    'put_on_time' => [
        0,
         13
    ]
};
get(20207)-> #{
    'shop_id' => 202,
    'sort_id' => 7,
    'item_id' => 102012206,
    'amount' => 200,
    'money_id' => 102002007,
    'price' => 300,
    'limit_time' => 20,
    'put_on_time' => [
        0,
         13
    ]
};
get(20208)-> #{
    'shop_id' => 202,
    'sort_id' => 8,
    'item_id' => 102002006,
    'amount' => 10,
    'money_id' => 102002007,
    'price' => 10,
    'limit_time' => 50,
    'put_on_time' => [
        0,
         13
    ]
};
get(20301)-> #{
    'shop_id' => 203,
    'sort_id' => 1,
    'item_id' => 107001102,
    'amount' => 5,
    'money_id' => 102002009,
    'price' => 8,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         18
    ]
};
get(20302)-> #{
    'shop_id' => 203,
    'sort_id' => 2,
    'item_id' => 107002102,
    'amount' => 5,
    'money_id' => 102002009,
    'price' => 10,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         18
    ]
};
get(20303)-> #{
    'shop_id' => 203,
    'sort_id' => 3,
    'item_id' => 107003102,
    'amount' => 5,
    'money_id' => 102002009,
    'price' => 12,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         18
    ]
};
get(20304)-> #{
    'shop_id' => 203,
    'sort_id' => 4,
    'item_id' => 107004102,
    'amount' => 5,
    'money_id' => 102002009,
    'price' => 15,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         18
    ]
};
get(20305)-> #{
    'shop_id' => 203,
    'sort_id' => 5,
    'item_id' => 107005102,
    'amount' => 5,
    'money_id' => 102002009,
    'price' => 20,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         18
    ]
};
get(20306)-> #{
    'shop_id' => 203,
    'sort_id' => 6,
    'item_id' => 102002006,
    'amount' => 10,
    'money_id' => 102002009,
    'price' => 10,
    'limit_time' => 50,
    'put_on_time' => [
        0,
         18
    ]
};
get(20401)-> #{
    'shop_id' => 204,
    'sort_id' => 1,
    'item_id' => 102012221,
    'amount' => 8,
    'money_id' => 102002008,
    'price' => 5,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         30
    ]
};
get(20402)-> #{
    'shop_id' => 204,
    'sort_id' => 2,
    'item_id' => 102012222,
    'amount' => 10,
    'money_id' => 102002008,
    'price' => 5,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         30
    ]
};
get(20403)-> #{
    'shop_id' => 204,
    'sort_id' => 3,
    'item_id' => 102012223,
    'amount' => 12,
    'money_id' => 102002008,
    'price' => 5,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         30
    ]
};
get(20404)-> #{
    'shop_id' => 204,
    'sort_id' => 4,
    'item_id' => 102012224,
    'amount' => 15,
    'money_id' => 102002008,
    'price' => 5,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         30
    ]
};
get(20405)-> #{
    'shop_id' => 204,
    'sort_id' => 5,
    'item_id' => 102012225,
    'amount' => 20,
    'money_id' => 102002008,
    'price' => 5,
    'limit_time' => 120,
    'put_on_time' => [
        0,
         30
    ]
};
get(20406)-> #{
    'shop_id' => 204,
    'sort_id' => 6,
    'item_id' => 102002006,
    'amount' => 10,
    'money_id' => 102002008,
    'price' => 10,
    'limit_time' => 50,
    'put_on_time' => [
        0,
         30
    ]
};
get(20501)-> #{
    'shop_id' => 205,
    'sort_id' => 1,
    'item_id' => 107001104,
    'amount' => 1,
    'money_id' => 102002010,
    'price' => 200,
    'limit_time' => 1,
    'put_on_time' => [
        1,
         1
    ]
};
get(20502)-> #{
    'shop_id' => 205,
    'sort_id' => 2,
    'item_id' => 107002104,
    'amount' => 1,
    'money_id' => 102002010,
    'price' => 400,
    'limit_time' => 1,
    'put_on_time' => [
        1,
         1
    ]
};
get(20503)-> #{
    'shop_id' => 205,
    'sort_id' => 3,
    'item_id' => 107003104,
    'amount' => 1,
    'money_id' => 102002010,
    'price' => 600,
    'limit_time' => 1,
    'put_on_time' => [
        1,
         1
    ]
};
get(20504)-> #{
    'shop_id' => 205,
    'sort_id' => 4,
    'item_id' => 107004104,
    'amount' => 1,
    'money_id' => 102002010,
    'price' => 800,
    'limit_time' => 1,
    'put_on_time' => [
        1,
         1
    ]
};
get(20505)-> #{
    'shop_id' => 205,
    'sort_id' => 5,
    'item_id' => 107005104,
    'amount' => 1,
    'money_id' => 102002010,
    'price' => 1000,
    'limit_time' => 1,
    'put_on_time' => [
        1,
         1
    ]
};
get(20506)-> #{
    'shop_id' => 205,
    'sort_id' => 6,
    'item_id' => 102012236,
    'amount' => 10,
    'money_id' => 102002010,
    'price' => 20,
    'limit_time' => 50,
    'put_on_time' => [
        1,
         1
    ]
};
get(20507)-> #{
    'shop_id' => 205,
    'sort_id' => 7,
    'item_id' => 102012236,
    'amount' => 200,
    'money_id' => 102002010,
    'price' => 400,
    'limit_time' => 20,
    'put_on_time' => [
        1,
         1
    ]
};
get(20508)-> #{
    'shop_id' => 205,
    'sort_id' => 8,
    'item_id' => 102002006,
    'amount' => 10,
    'money_id' => 102002010,
    'price' => 10,
    'limit_time' => 50,
    'put_on_time' => [
        1,
         1
    ]
};
get(20601)-> #{
    'shop_id' => 206,
    'sort_id' => 1,
    'item_id' => 107001105,
    'amount' => 1,
    'money_id' => 102002011,
    'price' => 1,
    'limit_time' => 1,
    'put_on_time' => [
        2,
         1
    ]
};
get(20602)-> #{
    'shop_id' => 206,
    'sort_id' => 2,
    'item_id' => 107002105,
    'amount' => 1,
    'money_id' => 102002011,
    'price' => 1,
    'limit_time' => 1,
    'put_on_time' => [
        2,
         1
    ]
};
get(20603)-> #{
    'shop_id' => 206,
    'sort_id' => 3,
    'item_id' => 107003105,
    'amount' => 1,
    'money_id' => 102002011,
    'price' => 1,
    'limit_time' => 1,
    'put_on_time' => [
        2,
         1
    ]
};
get(20604)-> #{
    'shop_id' => 206,
    'sort_id' => 4,
    'item_id' => 107004105,
    'amount' => 1,
    'money_id' => 102002011,
    'price' => 1,
    'limit_time' => 1,
    'put_on_time' => [
        2,
         1
    ]
};
get(20605)-> #{
    'shop_id' => 206,
    'sort_id' => 5,
    'item_id' => 107005105,
    'amount' => 1,
    'money_id' => 102002011,
    'price' => 1,
    'limit_time' => 1,
    'put_on_time' => [
        2,
         1
    ]
};
get(20606)-> #{
    'shop_id' => 206,
    'sort_id' => 6,
    'item_id' => 102012246,
    'amount' => 10,
    'money_id' => 102002011,
    'price' => 200,
    'limit_time' => 240,
    'put_on_time' => [
        2,
         1
    ]
};
get(20607)-> #{
    'shop_id' => 206,
    'sort_id' => 7,
    'item_id' => 102012246,
    'amount' => 200,
    'money_id' => 102002011,
    'price' => 4000,
    'limit_time' => 12,
    'put_on_time' => [
        2,
         1
    ]
};
get(20608)-> #{
    'shop_id' => 206,
    'sort_id' => 8,
    'item_id' => 102012245,
    'amount' => 10,
    'money_id' => 102002011,
    'price' => 300,
    'limit_time' => 100,
    'put_on_time' => [
        2,
         1
    ]
};
get(20609)-> #{
    'shop_id' => 206,
    'sort_id' => 9,
    'item_id' => 102012245,
    'amount' => 200,
    'money_id' => 102002011,
    'price' => 6000,
    'limit_time' => 5,
    'put_on_time' => [
        2,
         1
    ]
};
get(20701)-> #{
    'shop_id' => 207,
    'sort_id' => 1,
    'item_id' => 107001106,
    'amount' => 1,
    'money_id' => 102002012,
    'price' => 200,
    'limit_time' => 1,
    'put_on_time' => [
        3,
         1
    ]
};
get(20702)-> #{
    'shop_id' => 207,
    'sort_id' => 2,
    'item_id' => 107002106,
    'amount' => 1,
    'money_id' => 102002012,
    'price' => 400,
    'limit_time' => 1,
    'put_on_time' => [
        3,
         1
    ]
};
get(20703)-> #{
    'shop_id' => 207,
    'sort_id' => 3,
    'item_id' => 107003106,
    'amount' => 1,
    'money_id' => 102002012,
    'price' => 600,
    'limit_time' => 1,
    'put_on_time' => [
        3,
         1
    ]
};
get(20704)-> #{
    'shop_id' => 207,
    'sort_id' => 4,
    'item_id' => 107004106,
    'amount' => 1,
    'money_id' => 102002012,
    'price' => 800,
    'limit_time' => 1,
    'put_on_time' => [
        3,
         1
    ]
};
get(20705)-> #{
    'shop_id' => 207,
    'sort_id' => 5,
    'item_id' => 107005106,
    'amount' => 1,
    'money_id' => 102002012,
    'price' => 1000,
    'limit_time' => 1,
    'put_on_time' => [
        3,
         1
    ]
};
get(20706)-> #{
    'shop_id' => 207,
    'sort_id' => 6,
    'item_id' => 102012256,
    'amount' => 10,
    'money_id' => 102002012,
    'price' => 20,
    'limit_time' => 200,
    'put_on_time' => [
        3,
         1
    ]
};
get(20707)-> #{
    'shop_id' => 207,
    'sort_id' => 7,
    'item_id' => 102012256,
    'amount' => 200,
    'money_id' => 102002012,
    'price' => 400,
    'limit_time' => 20,
    'put_on_time' => [
        3,
         1
    ]
};

get(_N) -> false.
get_list() ->
	[20101,20102,20103,20104,20105,20106,20107,20108,20109,20110,20111,20112,20113,20114,20115,20201,20202,20203,20204,20205,20206,20207,20208,20301,20302,20303,20304,20305,20306,20401,20402,20403,20404,20405,20406,20501,20502,20503,20504,20505,20506,20507,20508,20601,20602,20603,20604,20605,20606,20607,20608,20609,20701,20702,20703,20704,20705,20706,20707].
