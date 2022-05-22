%%--- coding:utf-8 ---
-module(tb_hero_skill_num).
-export([get/1,get_list/0]).
get(201)-> #{
    'cond_type' => 1,
    'level' => 10
};
get(202)-> #{
    'cond_type' => 1,
    'level' => 30
};
get(203)-> #{
    'cond_type' => 1,
    'level' => 40
};
get(204)-> #{
    'cond_type' => 1,
    'level' => 60
};
get(205)-> #{
    'cond_type' => 1,
    'level' => 80
};
get(206)-> #{
    'cond_type' => 1,
    'level' => 93
};
get(301)-> #{
    'cond_type' => 1,
    'level' => 15
};
get(302)-> #{
    'cond_type' => 1,
    'level' => 32
};
get(303)-> #{
    'cond_type' => 1,
    'level' => 45
};
get(304)-> #{
    'cond_type' => 1,
    'level' => 63
};
get(305)-> #{
    'cond_type' => 1,
    'level' => 53
};
get(306)-> #{
    'cond_type' => 1,
    'level' => 95
};
get(401)-> #{
    'cond_type' => 1,
    'level' => 14
};
get(402)-> #{
    'cond_type' => 1,
    'level' => 30
};
get(403)-> #{
    'cond_type' => 1,
    'level' => 46
};
get(404)-> #{
    'cond_type' => 1,
    'level' => 61
};
get(405)-> #{
    'cond_type' => 1,
    'level' => 55
};
get(406)-> #{
    'cond_type' => 1,
    'level' => 91
};
get(501)-> #{
    'cond_type' => 1,
    'level' => 10
};
get(502)-> #{
    'cond_type' => 1,
    'level' => 30
};
get(503)-> #{
    'cond_type' => 1,
    'level' => 40
};
get(504)-> #{
    'cond_type' => 1,
    'level' => 60
};
get(505)-> #{
    'cond_type' => 1,
    'level' => 80
};
get(506)-> #{
    'cond_type' => 1,
    'level' => 93
};
get(601)-> #{
    'cond_type' => 1,
    'level' => 10
};
get(602)-> #{
    'cond_type' => 1,
    'level' => 30
};
get(603)-> #{
    'cond_type' => 1,
    'level' => 40
};
get(604)-> #{
    'cond_type' => 1,
    'level' => 60
};
get(605)-> #{
    'cond_type' => 1,
    'level' => 80
};
get(606)-> #{
    'cond_type' => 1,
    'level' => 93
};
get(607)-> #{
    'cond_type' => 1,
    'level' => 95
};
get(701)-> #{
    'cond_type' => 1,
    'level' => 10
};
get(702)-> #{
    'cond_type' => 1,
    'level' => 30
};
get(703)-> #{
    'cond_type' => 1,
    'level' => 40
};
get(704)-> #{
    'cond_type' => 1,
    'level' => 60
};
get(705)-> #{
    'cond_type' => 1,
    'level' => 80
};
get(706)-> #{
    'cond_type' => 1,
    'level' => 93
};
get(707)-> #{
    'cond_type' => 1,
    'level' => 96
};

get(_N) -> false.
get_list() ->
	[201,202,203,204,205,206,301,302,303,304,305,306,401,402,403,404,405,406,501,502,503,504,505,506,601,602,603,604,605,606,607,701,702,703,704,705,706,707].
