%%--- coding:utf-8 ---
-module(tb_arena_challenge_reward).
-export([get/1,get_list/0]).
get(1)-> #{
    'min' => 1,
    'max' => 1,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(2)-> #{
    'min' => 2,
    'max' => 2,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(3)-> #{
    'min' => 3,
    'max' => 3,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(5)-> #{
    'min' => 4,
    'max' => 5,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(10)-> #{
    'min' => 6,
    'max' => 10,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(20)-> #{
    'min' => 11,
    'max' => 20,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(50)-> #{
    'min' => 21,
    'max' => 50,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(100)-> #{
    'min' => 51,
    'max' => 100,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(200)-> #{
    'min' => 101,
    'max' => 200,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(500)-> #{
    'min' => 201,
    'max' => 500,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(1000)-> #{
    'min' => 501,
    'max' => 1000,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(2000)-> #{
    'min' => 1001,
    'max' => 2000,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(5000)-> #{
    'min' => 2001,
    'max' => 5000,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(10000)-> #{
    'min' => 5001,
    'max' => 10000,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};
get(999999)-> #{
    'min' => 10001,
    'max' => 999999,
    'reward' => [
        [
            102002001,
             10
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1,2,3,5,10,20,50,100,200,500,1000,2000,5000,10000,999999].