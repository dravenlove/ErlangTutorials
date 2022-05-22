%%--- coding:utf-8 ---
-module(tb_season_activity_open).
-export([get/1,get_list/0]).
get(1)-> #{
    'start_time' => {
        18,
        51,
        35
    },
    'end_time' => {
        19,
        51,
        35
    }
};
get(2)-> #{
    'start_time' => {
        19,
        51,
        35
    },
    'end_time' => {
        20,
        51,
        35
    }
};
get(3)-> #{
    'start_time' => {
        20,
        51,
        35
    },
    'end_time' => {
        21,
        51,
        35
    }
};
get(4)-> #{
    'start_time' => {
        21,
        51,
        35
    },
    'end_time' => {
        22,
        51,
        35
    }
};

get(_N) -> false.
get_list() ->
	[1,2,3,4].
