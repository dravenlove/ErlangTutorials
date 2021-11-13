%%--- coding:utf-8 ---
-module(tb_activity_interface).
-export([get/1,get_list/0]).
get(1)-> #{
    'entrance_first_id' => <<"huodong"/utf8>>,
    'name' => <<"13053"/utf8>>
};
get(2)-> #{
    'entrance_first_id' => <<"fuli"/utf8>>,
    'name' => <<"13054"/utf8>>
};
get(3)-> #{
    'entrance_first_id' => <<"kaifu"/utf8>>,
    'name' => <<"13055"/utf8>>
};
get(4)-> #{
    'entrance_first_id' => <<"jieri"/utf8>>,
    'name' => <<"13056"/utf8>>
};

get(_N) -> false.
get_list() ->
	[1,2,3,4].
