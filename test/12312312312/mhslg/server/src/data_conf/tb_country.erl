%%--- coding:utf-8 ---
-module(tb_country).
-export([get/1,get_list/0]).
get(1)-> #{
    'country_name' => <<"3923"/utf8>>
};
get(2)-> #{
    'country_name' => <<"3926"/utf8>>
};
get(3)-> #{
    'country_name' => <<"3928"/utf8>>
};
get(4)-> #{
    'country_name' => <<"A"/utf8>>
};
get(5)-> #{
    'country_name' => <<"B"/utf8>>
};
get(6)-> #{
    'country_name' => <<"C"/utf8>>
};
get(7)-> #{
    'country_name' => <<"D"/utf8>>
};
get(8)-> #{
    'country_name' => <<"E"/utf8>>
};
get(9)-> #{
    'country_name' => <<"F"/utf8>>
};
get(10)-> #{
    'country_name' => <<"G"/utf8>>
};
get(11)-> #{
    'country_name' => <<"H"/utf8>>
};
get(12)-> #{
    'country_name' => <<"I"/utf8>>
};
get(13)-> #{
    'country_name' => <<"J"/utf8>>
};
get(14)-> #{
    'country_name' => <<"K"/utf8>>
};
get(15)-> #{
    'country_name' => <<"L"/utf8>>
};
get(16)-> #{
    'country_name' => <<"M"/utf8>>
};
get(17)-> #{
    'country_name' => <<"N"/utf8>>
};
get(100)-> #{
    'country_name' => <<"25623"/utf8>>
};
get(101)-> #{
    'country_name' => <<"25624"/utf8>>
};
get(102)-> #{
    'country_name' => <<"25625"/utf8>>
};
get(103)-> #{
    'country_name' => <<"25626"/utf8>>
};
get(104)-> #{
    'country_name' => <<"25627"/utf8>>
};
get(105)-> #{
    'country_name' => <<"25628"/utf8>>
};
get(106)-> #{
    'country_name' => <<"25629"/utf8>>
};
get(107)-> #{
    'country_name' => <<"25630"/utf8>>
};
get(108)-> #{
    'country_name' => <<"25631"/utf8>>
};
get(109)-> #{
    'country_name' => <<"25632"/utf8>>
};
get(110)-> #{
    'country_name' => <<"25633"/utf8>>
};
get(111)-> #{
    'country_name' => <<"25634"/utf8>>
};
get(112)-> #{
    'country_name' => <<"25635"/utf8>>
};
get(113)-> #{
    'country_name' => <<"25636"/utf8>>
};
get(114)-> #{
    'country_name' => <<"25637"/utf8>>
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114].
