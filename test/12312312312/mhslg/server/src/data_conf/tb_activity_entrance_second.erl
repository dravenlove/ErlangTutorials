%%--- coding:utf-8 ---
-module(tb_activity_entrance_second).
-export([get/1,get_list/0]).
get(1)-> #{
    'entrance_first_id' => <<"huodong"/utf8>>,
    'entrance_entrance_id' => <<"huodong_1"/utf8>>,
    'name' => <<"2256"/utf8>>,
    'icon' => <<"huodong_1"/utf8>>,
    'sort' => 2
};
get(2)-> #{
    'entrance_first_id' => <<"huodong"/utf8>>,
    'entrance_entrance_id' => <<"huodong_2"/utf8>>,
    'name' => <<"2256"/utf8>>,
    'icon' => <<"huodong_2"/utf8>>,
    'sort' => 1
};
get(3)-> #{
    'entrance_first_id' => <<"huodong"/utf8>>,
    'entrance_entrance_id' => <<"huodong_3"/utf8>>,
    'name' => <<"2256"/utf8>>,
    'icon' => <<"huodong_3"/utf8>>,
    'sort' => 3
};
get(4)-> #{
    'entrance_first_id' => <<"huodong"/utf8>>,
    'entrance_entrance_id' => <<"huodong_4"/utf8>>,
    'name' => <<"2256"/utf8>>,
    'icon' => <<"huodong_4"/utf8>>,
    'sort' => 4
};
get(5)-> #{
    'entrance_first_id' => <<"huodong"/utf8>>,
    'entrance_entrance_id' => <<"huodong_5"/utf8>>,
    'name' => <<"2256"/utf8>>,
    'icon' => <<"huodong_5"/utf8>>,
    'sort' => 5
};
get(6)-> #{
    'entrance_first_id' => <<"fuli"/utf8>>,
    'entrance_entrance_id' => <<"fuli_1"/utf8>>,
    'name' => <<"13049"/utf8>>,
    'icon' => <<"fuli_1"/utf8>>,
    'sort' => 2
};
get(7)-> #{
    'entrance_first_id' => <<"fuli"/utf8>>,
    'entrance_entrance_id' => <<"fuli_2"/utf8>>,
    'name' => <<"13049"/utf8>>,
    'icon' => <<"fuli_2"/utf8>>,
    'sort' => 1
};
get(8)-> #{
    'entrance_first_id' => <<"fuli"/utf8>>,
    'entrance_entrance_id' => <<"fuli_3"/utf8>>,
    'name' => <<"13049"/utf8>>,
    'icon' => <<"fuli_3"/utf8>>,
    'sort' => 5
};
get(9)-> #{
    'entrance_first_id' => <<"fuli"/utf8>>,
    'entrance_entrance_id' => <<"fuli_4"/utf8>>,
    'name' => <<"13049"/utf8>>,
    'icon' => <<"fuli_4"/utf8>>,
    'sort' => 4
};
get(10)-> #{
    'entrance_first_id' => <<"fuli"/utf8>>,
    'entrance_entrance_id' => <<"fuli_5"/utf8>>,
    'name' => <<"13049"/utf8>>,
    'icon' => <<"fuli_5"/utf8>>,
    'sort' => 3
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10].
