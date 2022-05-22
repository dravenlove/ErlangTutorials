%%--- coding:utf-8 ---
-module(tb_honour_top_time).
-export([get/1,get_list/0]).
get(101)-> #{
    'stage' => 1,
    'stage_start' => 50400,
    'times' => 1,
    'times_start' => 51000
};
get(102)-> #{
    'stage' => 1,
    'stage_start' => 50400,
    'times' => 2,
    'times_start' => 51300
};
get(103)-> #{
    'stage' => 1,
    'stage_start' => 50400,
    'times' => 3,
    'times_start' => 51600
};
get(201)-> #{
    'stage' => 2,
    'stage_start' => 51600,
    'times' => 1,
    'times_start' => 51900
};
get(202)-> #{
    'stage' => 2,
    'stage_start' => 51600,
    'times' => 2,
    'times_start' => 52200
};
get(203)-> #{
    'stage' => 2,
    'stage_start' => 51600,
    'times' => 3,
    'times_start' => 52500
};
get(301)-> #{
    'stage' => 3,
    'stage_start' => 52500,
    'times' => 1,
    'times_start' => 52800
};
get(302)-> #{
    'stage' => 3,
    'stage_start' => 52500,
    'times' => 2,
    'times_start' => 53100
};
get(303)-> #{
    'stage' => 3,
    'stage_start' => 52500,
    'times' => 3,
    'times_start' => 53400
};
get(401)-> #{
    'stage' => 4,
    'stage_start' => 53400,
    'times' => 1,
    'times_start' => 53700
};
get(402)-> #{
    'stage' => 4,
    'stage_start' => 53400,
    'times' => 2,
    'times_start' => 54000
};
get(403)-> #{
    'stage' => 4,
    'stage_start' => 53400,
    'times' => 3,
    'times_start' => 54300
};
get(501)-> #{
    'stage' => 5,
    'stage_start' => 54300,
    'times' => 1,
    'times_start' => 54600
};
get(502)-> #{
    'stage' => 5,
    'stage_start' => 54300,
    'times' => 2,
    'times_start' => 54900
};
get(503)-> #{
    'stage' => 5,
    'stage_start' => 54300,
    'times' => 3,
    'times_start' => 55200
};
get(601)-> #{
    'stage' => 6,
    'stage_start' => 55200,
    'times' => 1,
    'times_start' => 55500
};
get(602)-> #{
    'stage' => 6,
    'stage_start' => 55200,
    'times' => 2,
    'times_start' => 55800
};
get(603)-> #{
    'stage' => 6,
    'stage_start' => 55200,
    'times' => 3,
    'times_start' => 56100
};
get(701)-> #{
    'stage' => 7,
    'stage_start' => 56100,
    'times' => 1,
    'times_start' => 59700
};
get(702)-> #{
    'stage' => 7,
    'stage_start' => 56100,
    'times' => 2,
    'times_start' => 60000
};
get(703)-> #{
    'stage' => 7,
    'stage_start' => 56100,
    'times' => 3,
    'times_start' => 60300
};

get(_N) -> false.
get_list() ->
	[101,102,103,201,202,203,301,302,303,401,402,403,501,502,503,601,602,603,701,702,703].
