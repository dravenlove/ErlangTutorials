%%--- coding:utf-8 ---
-module(tb_language).
-export([get/1,get_list/0]).
get(1)-> #{
    'language_name' => <<"1"/utf8>>,
    'language_package' => <<"language_cn"/utf8>>
};
get(2)-> #{
    'language_name' => <<"2"/utf8>>,
    'language_package' => <<"language_ft"/utf8>>
};
get(3)-> #{
    'language_name' => <<"English"/utf8>>,
    'language_package' => <<"language_en"/utf8>>
};
get(4)-> #{
    'language_name' => <<"3"/utf8>>,
    'language_package' => <<"language_cn"/utf8>>
};
get(5)-> #{
    'language_name' => <<"한국어"/utf8>>,
    'language_package' => <<"language_ft"/utf8>>
};
get(6)-> #{
    'language_name' => <<"Deutsch"/utf8>>,
    'language_package' => <<"language_en"/utf8>>
};
get(7)-> #{
    'language_name' => <<"русский"/utf8>>,
    'language_package' => <<"language_cn"/utf8>>
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7].
