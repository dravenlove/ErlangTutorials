%%--- coding:utf-8 ---
-module(tb_holy_spirit_hall_grade).
-export([get/1,get_list/0]).
get(1)-> #{
    'grade' => <<"S"/utf8>>,
    'left_point' => 1.0,
    'right_point' => 999.0
};
get(2)-> #{
    'grade' => <<"A"/utf8>>,
    'left_point' => 0.8,
    'right_point' => 1.0
};
get(3)-> #{
    'grade' => <<"B"/utf8>>,
    'left_point' => 0.6,
    'right_point' => 0.8
};
get(4)-> #{
    'grade' => <<"C"/utf8>>,
    'left_point' => 0.4,
    'right_point' => 0.6
};
get(5)-> #{
    'grade' => <<"D"/utf8>>,
    'left_point' => 0.2,
    'right_point' => 0.4
};
get(6)-> #{
    'grade' => <<"E"/utf8>>,
    'left_point' => 0.0,
    'right_point' => 0.2
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6].
