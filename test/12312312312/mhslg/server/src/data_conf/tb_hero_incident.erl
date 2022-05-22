%%--- coding:utf-8 ---
-module(tb_hero_incident).
-export([get/1,get_list/0]).
get(1)-> #{
    'incident' => [
        0,
         1,
         2
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};
get(2)-> #{
    'incident' => [
        0,
         3,
         4
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};
get(3)-> #{
    'incident' => [
        0,
         5,
         6
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};
get(4)-> #{
    'incident' => [
        0,
         7,
         8
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};
get(5)-> #{
    'incident' => [
        0,
         9,
         10
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};
get(6)-> #{
    'incident' => [
        0,
         11,
         12
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};
get(7)-> #{
    'incident' => [
        0,
         13,
         14
    ],
    'weight' => [
        3,
         3,
         3
    ],
    'limit' => 5
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7].
