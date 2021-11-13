%%--- coding:utf-8 ---
-module(tb_star_type).
-export([get/1,get_list/0]).
get(101)-> #{
    'type' => 1,
    'inlay_type' => 1,
    'item_type' => 5
};
get(102)-> #{
    'type' => 1,
    'inlay_type' => 2,
    'item_type' => 6
};
get(103)-> #{
    'type' => 1,
    'inlay_type' => 3,
    'item_type' => 7
};
get(104)-> #{
    'type' => 1,
    'inlay_type' => 4,
    'item_type' => 8
};
get(105)-> #{
    'type' => 1,
    'inlay_type' => 5,
    'item_type' => 1
};
get(201)-> #{
    'type' => 2,
    'inlay_type' => 1,
    'item_type' => 5
};
get(202)-> #{
    'type' => 2,
    'inlay_type' => 2,
    'item_type' => 6
};
get(203)-> #{
    'type' => 2,
    'inlay_type' => 3,
    'item_type' => 7
};
get(204)-> #{
    'type' => 2,
    'inlay_type' => 4,
    'item_type' => 8
};
get(205)-> #{
    'type' => 2,
    'inlay_type' => 5,
    'item_type' => 2
};
get(301)-> #{
    'type' => 3,
    'inlay_type' => 1,
    'item_type' => 5
};
get(302)-> #{
    'type' => 3,
    'inlay_type' => 2,
    'item_type' => 6
};
get(303)-> #{
    'type' => 3,
    'inlay_type' => 3,
    'item_type' => 7
};
get(304)-> #{
    'type' => 3,
    'inlay_type' => 4,
    'item_type' => 8
};
get(305)-> #{
    'type' => 3,
    'inlay_type' => 5,
    'item_type' => 3
};
get(401)-> #{
    'type' => 4,
    'inlay_type' => 1,
    'item_type' => 5
};
get(402)-> #{
    'type' => 4,
    'inlay_type' => 2,
    'item_type' => 6
};
get(403)-> #{
    'type' => 4,
    'inlay_type' => 3,
    'item_type' => 7
};
get(404)-> #{
    'type' => 4,
    'inlay_type' => 4,
    'item_type' => 8
};
get(405)-> #{
    'type' => 4,
    'inlay_type' => 5,
    'item_type' => 4
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,201,202,203,204,205,301,302,303,304,305,401,402,403,404,405].
