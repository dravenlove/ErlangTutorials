%%--- coding:utf-8 ---
-module(tb_building).
-export([get/1,get_list/0]).
get(1010101)-> #{
    'name' => <<"14356"/utf8>>,
    'class_id_big' => 101,
    'class_id' => 1,
    'auto_open' => 1,
    'auto_open_level' => 1
};
get(1020101)-> #{
    'name' => <<"16481"/utf8>>,
    'class_id_big' => 102,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1030101)-> #{
    'name' => <<"16483"/utf8>>,
    'class_id_big' => 103,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1040101)-> #{
    'name' => <<"16484"/utf8>>,
    'class_id_big' => 104,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1050101)-> #{
    'name' => <<"16486"/utf8>>,
    'class_id_big' => 105,
    'class_id' => 1,
    'shortcut_id' => <<"1001"/utf8>>,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1060101)-> #{
    'name' => <<"16487"/utf8>>,
    'class_id_big' => 106,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1060201)-> #{
    'name' => <<"16488"/utf8>>,
    'class_id_big' => 106,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1060301)-> #{
    'name' => <<"16489"/utf8>>,
    'class_id_big' => 106,
    'class_id' => 3,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1060401)-> #{
    'name' => <<"16491"/utf8>>,
    'class_id_big' => 106,
    'class_id' => 4,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1070101)-> #{
    'name' => <<"14009"/utf8>>,
    'class_id_big' => 107,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1070201)-> #{
    'name' => <<"16494"/utf8>>,
    'class_id_big' => 107,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1080101)-> #{
    'name' => <<"16496"/utf8>>,
    'class_id_big' => 108,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1080201)-> #{
    'name' => <<"16498"/utf8>>,
    'class_id_big' => 108,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1090101)-> #{
    'name' => <<"14014"/utf8>>,
    'class_id_big' => 109,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1100101)-> #{
    'name' => <<"16501"/utf8>>,
    'class_id_big' => 110,
    'class_id' => 1,
    'auto_open' => 1,
    'auto_open_level' => 1
};
get(1110101)-> #{
    'name' => <<"14828"/utf8>>,
    'class_id_big' => 111,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1110201)-> #{
    'name' => <<"16503"/utf8>>,
    'class_id_big' => 111,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120101)-> #{
    'name' => <<"16505"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120102)-> #{
    'name' => <<"16505"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120103)-> #{
    'name' => <<"16505"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120201)-> #{
    'name' => <<"521"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120202)-> #{
    'name' => <<"521"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120203)-> #{
    'name' => <<"521"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 2,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120301)-> #{
    'name' => <<"16508"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 3,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120302)-> #{
    'name' => <<"16508"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 3,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120303)-> #{
    'name' => <<"16508"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 3,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120401)-> #{
    'name' => <<"16510"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 4,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120402)-> #{
    'name' => <<"16510"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 4,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1120403)-> #{
    'name' => <<"16510"/utf8>>,
    'class_id_big' => 112,
    'class_id' => 4,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1130101)-> #{
    'name' => <<"16512"/utf8>>,
    'class_id_big' => 113,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1140101)-> #{
    'name' => <<"16514"/utf8>>,
    'class_id_big' => 114,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};
get(1150101)-> #{
    'name' => <<"16516"/utf8>>,
    'class_id_big' => 115,
    'class_id' => 1,
    'auto_open' => -1,
    'auto_open_level' => 0
};

get(_N) -> false.
get_list() ->
	[1010101,1020101,1030101,1040101,1050101,1060101,1060201,1060301,1060401,1070101,1070201,1080101,1080201,1090101,1100101,1110101,1110201,1120101,1120102,1120103,1120201,1120202,1120203,1120301,1120302,1120303,1120401,1120402,1120403,1130101,1140101,1150101].
