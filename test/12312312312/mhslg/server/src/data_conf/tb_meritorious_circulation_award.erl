%%--- coding:utf-8 ---
-module(tb_meritorious_circulation_award).
-export([get/1,get_list/0]).
get(10001)-> #{
    'season' => 0,
    'stage' => 1,
    'start_meritorious' => 44000,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10002)-> #{
    'season' => 0,
    'stage' => 2,
    'start_meritorious' => 66000,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10003)-> #{
    'season' => 0,
    'stage' => 3,
    'start_meritorious' => 92400,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10004)-> #{
    'season' => 0,
    'stage' => 4,
    'start_meritorious' => 123200,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10005)-> #{
    'season' => 0,
    'stage' => 5,
    'start_meritorious' => 162800,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10006)-> #{
    'season' => 0,
    'stage' => 6,
    'start_meritorious' => 211200,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10007)-> #{
    'season' => 0,
    'stage' => 7,
    'start_meritorious' => 272800,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10008)-> #{
    'season' => 0,
    'stage' => 8,
    'start_meritorious' => 352000,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10009)-> #{
    'season' => 0,
    'stage' => 9,
    'start_meritorious' => 453200,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10010)-> #{
    'season' => 0,
    'stage' => 10,
    'start_meritorious' => 572000,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10101)-> #{
    'season' => 1,
    'stage' => 1,
    'start_meritorious' => 44000,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10102)-> #{
    'season' => 1,
    'stage' => 2,
    'start_meritorious' => 66000,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10103)-> #{
    'season' => 1,
    'stage' => 3,
    'start_meritorious' => 92400,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10104)-> #{
    'season' => 1,
    'stage' => 4,
    'start_meritorious' => 123200,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10105)-> #{
    'season' => 1,
    'stage' => 5,
    'start_meritorious' => 162800,
    'meritorious' => 4000,
    'award' => [
        101001004,
         4000
    ]
};
get(10106)-> #{
    'season' => 1,
    'stage' => 6,
    'start_meritorious' => 211200,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10107)-> #{
    'season' => 1,
    'stage' => 7,
    'start_meritorious' => 272800,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10108)-> #{
    'season' => 1,
    'stage' => 8,
    'start_meritorious' => 352000,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10109)-> #{
    'season' => 1,
    'stage' => 9,
    'start_meritorious' => 453200,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};
get(10110)-> #{
    'season' => 1,
    'stage' => 10,
    'start_meritorious' => 572000,
    'meritorious' => 5000,
    'award' => [
        101001005,
         5000
    ]
};

get(_N) -> false.
get_list() ->
	[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110].
