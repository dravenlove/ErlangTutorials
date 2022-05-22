%%--- coding:utf-8 ---
-module(tb_formation).
-export([get/1,get_list/0]).
get(1)-> #{
    'name' => <<"普通长方阵"/utf8>>
};
get(2)-> #{
    'name' => <<"锋矢阵"/utf8>>,
    'skill' => 1070201001
};
get(3)-> #{
    'name' => <<"铁桶阵"/utf8>>,
    'skill' => 1070301001
};
get(4)-> #{
    'name' => <<"雁形阵"/utf8>>,
    'skill' => 1070401001
};
get(5)-> #{
    'name' => <<"鹤翼阵"/utf8>>,
    'skill' => 1070501001
};
get(6)-> #{
    'name' => <<"钩行阵"/utf8>>,
    'skill' => 1070601001
};
get(7)-> #{
    'name' => <<"八卦阵"/utf8>>,
    'skill' => 1070701001
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7].
