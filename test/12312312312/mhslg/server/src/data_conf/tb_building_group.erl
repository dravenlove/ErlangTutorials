%%--- coding:utf-8 ---
-module(tb_building_group).
-export([get/1,get_list/0]).
get(1)-> #{
    'building_group_id' => 1060,
    'building_id' => 1060101
};
get(2)-> #{
    'building_group_id' => 1060,
    'building_id' => 1060201
};
get(3)-> #{
    'building_group_id' => 1060,
    'building_id' => 1060301
};
get(4)-> #{
    'building_group_id' => 1060,
    'building_id' => 1060401
};
get(5)-> #{
    'building_group_id' => 1121,
    'building_id' => 1120201
};
get(6)-> #{
    'building_group_id' => 1121,
    'building_id' => 1120202
};
get(7)-> #{
    'building_group_id' => 1121,
    'building_id' => 1120203
};
get(8)-> #{
    'building_group_id' => 1121,
    'building_id' => 1120401
};
get(9)-> #{
    'building_group_id' => 1121,
    'building_id' => 1120402
};
get(10)-> #{
    'building_group_id' => 1121,
    'building_id' => 1120403
};
get(11)-> #{
    'building_group_id' => 1122,
    'building_id' => 1120101
};
get(12)-> #{
    'building_group_id' => 1122,
    'building_id' => 1120102
};
get(13)-> #{
    'building_group_id' => 1122,
    'building_id' => 1120103
};
get(14)-> #{
    'building_group_id' => 1122,
    'building_id' => 1120301
};
get(15)-> #{
    'building_group_id' => 1122,
    'building_id' => 1120302
};
get(16)-> #{
    'building_group_id' => 1122,
    'building_id' => 1120303
};
get(17)-> #{
    'building_group_id' => 1110,
    'building_id' => 1110201
};
get(18)-> #{
    'building_group_id' => 1090,
    'building_id' => 1090101
};
get(19)-> #{
    'building_group_id' => 1010,
    'building_id' => 1010101
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19].
