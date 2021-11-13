%%--- coding:utf-8 ---
-module(tb_chapter).
-export([get/1,get_list/0]).
get(1)-> #{
    'name' => <<"英雄立首功"/utf8>>,
    'open_level' => 1,
    'stage_number' => 12,
    'star_number' => 3
};
get(2)-> #{
    'name' => <<"奸邪乱天下"/utf8>>,
    'open_level' => 1,
    'stage_number' => 12,
    'star_number' => 3
};
get(3)-> #{
    'name' => <<"谋诛十常侍"/utf8>>,
    'open_level' => 1,
    'stage_number' => 12,
    'star_number' => 3
};
get(4)-> #{
    'name' => <<"董卓霸京师"/utf8>>,
    'open_level' => 1,
    'stage_number' => 12,
    'star_number' => 3
};
get(5)-> #{
    'name' => <<"诸侯应曹公"/utf8>>,
    'open_level' => 1,
    'stage_number' => 12,
    'star_number' => 3
};
get(6)-> #{
    'name' => <<"三英战吕布"/utf8>>,
    'open_level' => 1,
    'stage_number' => 12,
    'star_number' => 3
};
get(7)-> #{
    'name' => <<"孙坚背盟约"/utf8>>,
    'open_level' => 9,
    'stage_number' => 12,
    'star_number' => 3
};
get(8)-> #{
    'name' => <<"子龙识英主"/utf8>>,
    'open_level' => 9,
    'stage_number' => 12,
    'star_number' => 3
};
get(9)-> #{
    'name' => <<"猛虎战荆襄"/utf8>>,
    'open_level' => 9,
    'stage_number' => 12,
    'star_number' => 3
};
get(10)-> #{
    'name' => <<"吕布助司徒"/utf8>>,
    'open_level' => 13,
    'stage_number' => 12,
    'star_number' => 3
};
get(11)-> #{
    'name' => <<"贾诩献毒计"/utf8>>,
    'open_level' => 13,
    'stage_number' => 12,
    'star_number' => 3
};
get(12)-> #{
    'name' => <<"马腾举义师"/utf8>>,
    'open_level' => 13,
    'stage_number' => 12,
    'star_number' => 3
};
get(13)-> #{
    'name' => <<"曹操讨徐州"/utf8>>,
    'open_level' => 13,
    'stage_number' => 12,
    'star_number' => 3
};
get(14)-> #{
    'name' => <<"皇叔驰救兵"/utf8>>,
    'open_level' => 13,
    'stage_number' => 12,
    'star_number' => 3
};
get(15)-> #{
    'name' => <<"温候破曹操"/utf8>>,
    'open_level' => 13,
    'stage_number' => 12,
    'star_number' => 3
};
get(16)-> #{
    'name' => <<"陶谦推俊杰"/utf8>>,
    'open_level' => 17,
    'stage_number' => 12,
    'star_number' => 3
};
get(17)-> #{
    'name' => <<"长安二人乱"/utf8>>,
    'open_level' => 17,
    'stage_number' => 12,
    'star_number' => 3
};
get(18)-> #{
    'name' => <<"奉先占先机"/utf8>>,
    'open_level' => 17,
    'stage_number' => 12,
    'star_number' => 3
};
get(19)-> #{
    'name' => <<"酣战小霸王"/utf8>>,
    'open_level' => 17,
    'stage_number' => 12,
    'star_number' => 3
};
get(20)-> #{
    'name' => <<"辕门亲射戟"/utf8>>,
    'open_level' => 17,
    'stage_number' => 12,
    'star_number' => 3
};
get(21)-> #{
    'name' => <<"袁术遣雄兵"/utf8>>,
    'open_level' => 17,
    'stage_number' => 12,
    'star_number' => 3
};
get(22)-> #{
    'name' => <<"孟德大会师"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(23)-> #{
    'name' => <<"贾诩决胜败"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(24)-> #{
    'name' => <<"夏侯奋神威"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(25)-> #{
    'name' => <<"决战下邳城"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(26)-> #{
    'name' => <<"命陨白门楼"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(27)-> #{
    'name' => <<"奸雄擅威福"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(28)-> #{
    'name' => <<"董承优汉室"/utf8>>,
    'open_level' => 22,
    'stage_number' => 12,
    'star_number' => 3
};
get(29)-> #{
    'name' => <<"三军战四象"/utf8>>,
    'open_level' => 30,
    'stage_number' => 12,
    'star_number' => 3
};
get(30)-> #{
    'name' => <<"上将斩饕餮"/utf8>>,
    'open_level' => 30,
    'stage_number' => 12,
    'star_number' => 3
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30].
