%%--- coding:utf-8 ---
-module(tb_type_and_resources).
-export([get/1,get_list/0]).
get(1)-> #{
    'id' => 101001003
};
get(2)-> #{
    'id' => 101001004
};
get(3)-> #{
    'id' => 101001005
};
get(4)-> #{
    'id' => 101001006
};
get(5)-> #{
    'id' => 101001003
};
get(6)-> #{
    'id' => 101001004
};
get(7)-> #{
    'id' => 101001005
};
get(8)-> #{
    'id' => 101001006
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8].
