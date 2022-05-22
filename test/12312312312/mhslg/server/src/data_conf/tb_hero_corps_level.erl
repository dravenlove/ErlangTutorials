%%--- coding:utf-8 ---
-module(tb_hero_corps_level).
-export([get/1,get_list/0]).
get(101)-> #{
    'type' => 1,
    'lvl' => 1,
    'model_id1' => 1001,
    'model_id2' => 1001,
    'bubing_base_attack' => 80.0,
    'bubing_base_defence' => 42.0,
    'bubing_base_speed' => 27.0,
    'bubing_base_troops' => 270.0
};
get(102)-> #{
    'type' => 1,
    'lvl' => 2,
    'model_id1' => 1002,
    'model_id2' => 1002,
    'bubing_base_attack' => 123.0,
    'bubing_base_defence' => 64.0,
    'bubing_base_speed' => 27.0,
    'bubing_base_troops' => 270.0
};
get(103)-> #{
    'type' => 1,
    'lvl' => 3,
    'model_id1' => 1003,
    'model_id2' => 1003,
    'bubing_base_attack' => 166.0,
    'bubing_base_defence' => 86.0,
    'bubing_base_speed' => 27.0,
    'bubing_base_troops' => 270.0
};
get(104)-> #{
    'type' => 1,
    'lvl' => 4,
    'model_id1' => 1004,
    'model_id2' => 1004,
    'bubing_base_attack' => 209.0,
    'bubing_base_defence' => 108.0,
    'bubing_base_speed' => 27.0,
    'bubing_base_troops' => 270.0
};
get(105)-> #{
    'type' => 1,
    'lvl' => 5,
    'model_id1' => 1004,
    'model_id2' => 1004,
    'bubing_base_attack' => 252.0,
    'bubing_base_defence' => 130.0,
    'bubing_base_speed' => 27.0,
    'bubing_base_troops' => 270.0
};
get(106)-> #{
    'type' => 1,
    'lvl' => 6,
    'model_id1' => 1004,
    'model_id2' => 1004
};
get(107)-> #{
    'type' => 1,
    'lvl' => 7,
    'model_id1' => 1004,
    'model_id2' => 1004
};
get(108)-> #{
    'type' => 1,
    'lvl' => 8,
    'model_id1' => 1004,
    'model_id2' => 1004
};
get(109)-> #{
    'type' => 1,
    'lvl' => 9,
    'model_id1' => 1004,
    'model_id2' => 1004
};
get(110)-> #{
    'type' => 1,
    'lvl' => 10,
    'model_id1' => 1004,
    'model_id2' => 1004
};
get(201)-> #{
    'type' => 2,
    'lvl' => 1,
    'model_id1' => 2001,
    'model_id2' => 2001,
    'qibing_base_attack' => 95.0,
    'qibing_base_defence' => 35.0,
    'qibing_base_speed' => 30.0,
    'qibing_base_troops' => 255.0
};
get(202)-> #{
    'type' => 2,
    'lvl' => 2,
    'model_id1' => 2002,
    'model_id2' => 2002,
    'qibing_base_attack' => 140.0,
    'qibing_base_defence' => 55.0,
    'qibing_base_speed' => 30.0,
    'qibing_base_troops' => 255.0
};
get(203)-> #{
    'type' => 2,
    'lvl' => 3,
    'model_id1' => 2003,
    'model_id2' => 2003,
    'qibing_base_attack' => 185.0,
    'qibing_base_defence' => 75.0,
    'qibing_base_speed' => 30.0,
    'qibing_base_troops' => 255.0
};
get(204)-> #{
    'type' => 2,
    'lvl' => 4,
    'model_id1' => 2004,
    'model_id2' => 2004,
    'qibing_base_attack' => 230.0,
    'qibing_base_defence' => 95.0,
    'qibing_base_speed' => 30.0,
    'qibing_base_troops' => 255.0
};
get(205)-> #{
    'type' => 2,
    'lvl' => 5,
    'model_id1' => 2004,
    'model_id2' => 2004,
    'qibing_base_attack' => 275.0,
    'qibing_base_defence' => 115.0,
    'qibing_base_speed' => 30.0,
    'qibing_base_troops' => 255.0
};
get(206)-> #{
    'type' => 2,
    'lvl' => 6,
    'model_id1' => 2004,
    'model_id2' => 2004
};
get(207)-> #{
    'type' => 2,
    'lvl' => 7,
    'model_id1' => 2004,
    'model_id2' => 2004
};
get(208)-> #{
    'type' => 2,
    'lvl' => 8,
    'model_id1' => 2004,
    'model_id2' => 2004
};
get(209)-> #{
    'type' => 2,
    'lvl' => 9,
    'model_id1' => 2004,
    'model_id2' => 2004
};
get(210)-> #{
    'type' => 2,
    'lvl' => 10,
    'model_id1' => 2004,
    'model_id2' => 2004
};
get(301)-> #{
    'type' => 3,
    'lvl' => 1,
    'model_id1' => 4001,
    'model_id2' => 4001,
    'gongbing_base_attack' => 100.0,
    'gongbing_base_defence' => 30.0,
    'gongbing_base_speed' => 24.0,
    'gongbing_base_troops' => 150.0
};
get(302)-> #{
    'type' => 3,
    'lvl' => 2,
    'model_id1' => 4002,
    'model_id2' => 4002,
    'gongbing_base_attack' => 155.0,
    'gongbing_base_defence' => 48.0,
    'gongbing_base_speed' => 24.0,
    'gongbing_base_troops' => 150.0
};
get(303)-> #{
    'type' => 3,
    'lvl' => 3,
    'model_id1' => 4003,
    'model_id2' => 4003,
    'gongbing_base_attack' => 210.0,
    'gongbing_base_defence' => 66.0,
    'gongbing_base_speed' => 24.0,
    'gongbing_base_troops' => 150.0
};
get(304)-> #{
    'type' => 3,
    'lvl' => 4,
    'model_id1' => 4004,
    'model_id2' => 4004,
    'gongbing_base_attack' => 265.0,
    'gongbing_base_defence' => 84.0,
    'gongbing_base_speed' => 24.0,
    'gongbing_base_troops' => 150.0
};
get(305)-> #{
    'type' => 3,
    'lvl' => 5,
    'model_id1' => 4004,
    'model_id2' => 4004,
    'gongbing_base_attack' => 320.0,
    'gongbing_base_defence' => 102.0,
    'gongbing_base_speed' => 24.0,
    'gongbing_base_troops' => 150.0
};
get(306)-> #{
    'type' => 3,
    'lvl' => 6,
    'model_id1' => 4004,
    'model_id2' => 4004
};
get(307)-> #{
    'type' => 3,
    'lvl' => 7,
    'model_id1' => 4004,
    'model_id2' => 4004
};
get(308)-> #{
    'type' => 3,
    'lvl' => 8,
    'model_id1' => 4004,
    'model_id2' => 4004
};
get(309)-> #{
    'type' => 3,
    'lvl' => 9,
    'model_id1' => 4004,
    'model_id2' => 4004
};
get(310)-> #{
    'type' => 3,
    'lvl' => 10,
    'model_id1' => 4004,
    'model_id2' => 4004
};
get(401)-> #{
    'type' => 4,
    'lvl' => 1,
    'model_id1' => 3001,
    'model_id2' => 3001,
    'fangshi_base_attack' => 120.0,
    'fangshi_base_defence' => 20.0,
    'fangshi_base_speed' => 20.0,
    'fangshi_base_troops' => 140.0
};
get(402)-> #{
    'type' => 4,
    'lvl' => 2,
    'model_id1' => 3002,
    'model_id2' => 3002,
    'fangshi_base_attack' => 177.0,
    'fangshi_base_defence' => 36.0,
    'fangshi_base_speed' => 20.0,
    'fangshi_base_troops' => 140.0
};
get(403)-> #{
    'type' => 4,
    'lvl' => 3,
    'model_id1' => 3003,
    'model_id2' => 3003,
    'fangshi_base_attack' => 234.0,
    'fangshi_base_defence' => 52.0,
    'fangshi_base_speed' => 20.0,
    'fangshi_base_troops' => 140.0
};
get(404)-> #{
    'type' => 4,
    'lvl' => 4,
    'model_id1' => 3004,
    'model_id2' => 3004,
    'fangshi_base_attack' => 291.0,
    'fangshi_base_defence' => 68.0,
    'fangshi_base_speed' => 20.0,
    'fangshi_base_troops' => 140.0
};
get(405)-> #{
    'type' => 4,
    'lvl' => 5,
    'model_id1' => 3004,
    'model_id2' => 3004,
    'fangshi_base_attack' => 348.0,
    'fangshi_base_defence' => 84.0,
    'fangshi_base_speed' => 20.0,
    'fangshi_base_troops' => 140.0
};
get(406)-> #{
    'type' => 4,
    'lvl' => 6,
    'model_id1' => 3004,
    'model_id2' => 3004
};
get(407)-> #{
    'type' => 4,
    'lvl' => 7,
    'model_id1' => 3004,
    'model_id2' => 3004
};
get(408)-> #{
    'type' => 4,
    'lvl' => 8,
    'model_id1' => 3004,
    'model_id2' => 3004
};
get(409)-> #{
    'type' => 4,
    'lvl' => 9,
    'model_id1' => 3004,
    'model_id2' => 3004
};
get(410)-> #{
    'type' => 4,
    'lvl' => 10,
    'model_id1' => 3004,
    'model_id2' => 3004
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107,108,109,110,201,202,203,204,205,206,207,208,209,210,301,302,303,304,305,306,307,308,309,310,401,402,403,404,405,406,407,408,409,410].
