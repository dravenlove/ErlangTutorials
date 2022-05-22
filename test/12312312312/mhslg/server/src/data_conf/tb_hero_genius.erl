%%--- coding:utf-8 ---
-module(tb_hero_genius).
-export([get/1,get_list/0]).
get(20101)-> #{
    'hero_id' => 201,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032011001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20102)-> #{
    'hero_id' => 201,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1032012001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20201)-> #{
    'hero_id' => 202,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032021001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20202)-> #{
    'hero_id' => 202,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002021,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20301)-> #{
    'hero_id' => 203,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032031001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20302)-> #{
    'hero_id' => 203,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002031,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20401)-> #{
    'hero_id' => 204,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032041001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'qianjun_attack_rate' => 0.1,
        'houjun_attack_rate' => 0.1,
        'qianjun_defence_rate' => 0.1,
        'houjun_defence_rate' => 0.1
    }
};
get(20402)-> #{
    'hero_id' => 204,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002041,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20501)-> #{
    'hero_id' => 205,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032051001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20502)-> #{
    'hero_id' => 205,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002051,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20601)-> #{
    'hero_id' => 206,
    'genius_num' => 1,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_hero_skill_hurt_red_rate' => 0.5
    }
};
get(20602)-> #{
    'hero_id' => 206,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002061,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20701)-> #{
    'hero_id' => 207,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1002071,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20702)-> #{
    'hero_id' => 207,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1032071001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20801)-> #{
    'hero_id' => 208,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032081001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20802)-> #{
    'hero_id' => 208,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002081,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20901)-> #{
    'hero_id' => 209,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032091001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(20902)-> #{
    'hero_id' => 209,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002091,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21001)-> #{
    'hero_id' => 210,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032101001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21002)-> #{
    'hero_id' => 210,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002101,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21101)-> #{
    'hero_id' => 211,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032111001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21102)-> #{
    'hero_id' => 211,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1032112001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21201)-> #{
    'hero_id' => 212,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032121001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21202)-> #{
    'hero_id' => 212,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002121,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21301)-> #{
    'hero_id' => 213,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032131001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21302)-> #{
    'hero_id' => 213,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002131,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21401)-> #{
    'hero_id' => 214,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1032141001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21402)-> #{
    'hero_id' => 214,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002141,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(21501)-> #{
    'hero_id' => 215,
    'genius_num' => 1,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_general_hurt_red_rate' => 0.15
    }
};
get(21502)-> #{
    'hero_id' => 215,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1002151,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30101)-> #{
    'hero_id' => 301,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033011001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30102)-> #{
    'hero_id' => 301,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003011,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30201)-> #{
    'hero_id' => 302,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033021001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30202)-> #{
    'hero_id' => 302,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003021,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30301)-> #{
    'hero_id' => 303,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033031001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30302)-> #{
    'hero_id' => 303,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1033032001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30303)-> #{
    'hero_id' => 303,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003031,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30401)-> #{
    'hero_id' => 304,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033041001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30402)-> #{
    'hero_id' => 304,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003041,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30403)-> #{
    'hero_id' => 304,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003042,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30404)-> #{
    'hero_id' => 304,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1003043,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30501)-> #{
    'hero_id' => 305,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033051001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30502)-> #{
    'hero_id' => 305,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003051,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30601)-> #{
    'hero_id' => 306,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033061001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30602)-> #{
    'hero_id' => 306,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'qibing_infantry_hurt_inc_rate' => 0.5
    }
};
get(30603)-> #{
    'hero_id' => 306,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1033062001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30701)-> #{
    'hero_id' => 307,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033071001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30702)-> #{
    'hero_id' => 307,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_civilian_hurt_red_rate' => 0.25,
        'bingzhong_general_hurt_red_rate' => 0.25
    }
};
get(30703)-> #{
    'hero_id' => 307,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1033072001,
    'special_effect' => 1003072,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30801)-> #{
    'hero_id' => 308,
    'genius_num' => 1,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30802)-> #{
    'hero_id' => 308,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30803)-> #{
    'hero_id' => 308,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003081,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30901)-> #{
    'hero_id' => 309,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033091001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30902)-> #{
    'hero_id' => 309,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'hero_generalist_hurt_inc_rate' => 0.3,
        'bingzhong_generalist_hurt_inc_rate' => 0.3
    }
};
get(30903)-> #{
    'hero_id' => 309,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1033092001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(30904)-> #{
    'hero_id' => 309,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1003091,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31001)-> #{
    'hero_id' => 310,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033101001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31002)-> #{
    'hero_id' => 310,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003101,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31003)-> #{
    'hero_id' => 310,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003102,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31004)-> #{
    'hero_id' => 310,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1003103,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31101)-> #{
    'hero_id' => 311,
    'genius_num' => 1,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_civilian_hurt_red_rate' => 0.25,
        'bingzhong_generalist_hurt_red_rate' => 0.25
    }
};
get(31102)-> #{
    'hero_id' => 311,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003111,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31103)-> #{
    'hero_id' => 311,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003112,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31104)-> #{
    'hero_id' => 311,
    'genius_num' => 4,
    'is_awaken' => 0,
    'skill' => 1033111001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31201)-> #{
    'hero_id' => 312,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033121001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31202)-> #{
    'hero_id' => 312,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1033122001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31203)-> #{
    'hero_id' => 312,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1033123001,
    'special_effect' => 1003121,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31204)-> #{
    'hero_id' => 312,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1003122,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31301)-> #{
    'hero_id' => 313,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1003131,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31302)-> #{
    'hero_id' => 313,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003132,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31303)-> #{
    'hero_id' => 313,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003133,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31401)-> #{
    'hero_id' => 314,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033141001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31402)-> #{
    'hero_id' => 314,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1033142001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31403)-> #{
    'hero_id' => 314,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003141,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31404)-> #{
    'hero_id' => 314,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1003142,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31501)-> #{
    'hero_id' => 315,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033151001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31502)-> #{
    'hero_id' => 315,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1033152001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31503)-> #{
    'hero_id' => 315,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003151,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31504)-> #{
    'hero_id' => 315,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1003152,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31601)-> #{
    'hero_id' => 316,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1003161,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31602)-> #{
    'hero_id' => 316,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1003162,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31603)-> #{
    'hero_id' => 316,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003163,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31701)-> #{
    'hero_id' => 317,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033171001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31702)-> #{
    'hero_id' => 317,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1033172001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31703)-> #{
    'hero_id' => 317,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1033173001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31704)-> #{
    'hero_id' => 317,
    'genius_num' => 4,
    'is_awaken' => 0,
    'skill' => 1033174001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31801)-> #{
    'hero_id' => 318,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1033181001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31802)-> #{
    'hero_id' => 318,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1033182001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(31803)-> #{
    'hero_id' => 318,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1003181,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40101)-> #{
    'hero_id' => 401,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034011001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40102)-> #{
    'hero_id' => 401,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004011,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40201)-> #{
    'hero_id' => 402,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034021001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40202)-> #{
    'hero_id' => 402,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1034022001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40203)-> #{
    'hero_id' => 402,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1034023001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40301)-> #{
    'hero_id' => 403,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034031001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40302)-> #{
    'hero_id' => 403,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004031,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40303)-> #{
    'hero_id' => 403,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004032,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40304)-> #{
    'hero_id' => 403,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1004033,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40401)-> #{
    'hero_id' => 404,
    'genius_num' => 1,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_general_hurt_red_rate' => 0.4
    }
};
get(40402)-> #{
    'hero_id' => 404,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1034041001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40403)-> #{
    'hero_id' => 404,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004041,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40404)-> #{
    'hero_id' => 404,
    'genius_num' => 4,
    'is_awaken' => 0,
    'skill' => 1034042001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40501)-> #{
    'hero_id' => 405,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1004051,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40502)-> #{
    'hero_id' => 405,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004052,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40503)-> #{
    'hero_id' => 405,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004053,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40601)-> #{
    'hero_id' => 406,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034061001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40602)-> #{
    'hero_id' => 406,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004061,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40701)-> #{
    'hero_id' => 407,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034071001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40702)-> #{
    'hero_id' => 407,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004071,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40801)-> #{
    'hero_id' => 408,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034081001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40802)-> #{
    'hero_id' => 408,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_man_hurt_red_rate' => 0.15
    }
};
get(40803)-> #{
    'hero_id' => 408,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004081,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40901)-> #{
    'hero_id' => 409,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034091001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40902)-> #{
    'hero_id' => 409,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004091,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40903)-> #{
    'hero_id' => 409,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004092,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(40904)-> #{
    'hero_id' => 409,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1004093,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41001)-> #{
    'hero_id' => 410,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1004101,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41002)-> #{
    'hero_id' => 410,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1034101001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41003)-> #{
    'hero_id' => 410,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1034102001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41004)-> #{
    'hero_id' => 410,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1004102,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41101)-> #{
    'hero_id' => 411,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034111001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41102)-> #{
    'hero_id' => 411,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1034112001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41103)-> #{
    'hero_id' => 411,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004111,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41104)-> #{
    'hero_id' => 411,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1004112,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41201)-> #{
    'hero_id' => 412,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1034121001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_troops_skill_hurt_red_rate' => 0.2
    }
};
get(41202)-> #{
    'hero_id' => 412,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1034122001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41203)-> #{
    'hero_id' => 412,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004121,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41204)-> #{
    'hero_id' => 412,
    'genius_num' => 4,
    'is_awaken' => 0,
    'special_effect' => 1004122,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41301)-> #{
    'hero_id' => 413,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1004131,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41302)-> #{
    'hero_id' => 413,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004132,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41303)-> #{
    'hero_id' => 413,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004133,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41401)-> #{
    'hero_id' => 414,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1004141,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41402)-> #{
    'hero_id' => 414,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004142,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41403)-> #{
    'hero_id' => 414,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004143,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41501)-> #{
    'hero_id' => 415,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1004151,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41502)-> #{
    'hero_id' => 415,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1004152,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(41503)-> #{
    'hero_id' => 415,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1004153,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50101)-> #{
    'hero_id' => 501,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035011001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50102)-> #{
    'hero_id' => 501,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005011,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50103)-> #{
    'hero_id' => 501,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005012,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50201)-> #{
    'hero_id' => 502,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035021001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50202)-> #{
    'hero_id' => 502,
    'genius_num' => 2,
    'is_awaken' => 0,
    'skill' => 1035022001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50203)-> #{
    'hero_id' => 502,
    'genius_num' => 3,
    'is_awaken' => 0,
    'skill' => 1035023001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50301)-> #{
    'hero_id' => 503,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035031001,
    'special_effect' => 1005031,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50302)-> #{
    'hero_id' => 503,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005032,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50401)-> #{
    'hero_id' => 504,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035041001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50402)-> #{
    'hero_id' => 504,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005041,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50403)-> #{
    'hero_id' => 504,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005042,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50501)-> #{
    'hero_id' => 505,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035051001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50502)-> #{
    'hero_id' => 505,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005051,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50503)-> #{
    'hero_id' => 505,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005052,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50601)-> #{
    'hero_id' => 506,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035061001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50602)-> #{
    'hero_id' => 506,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005061,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50603)-> #{
    'hero_id' => 506,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005062,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50701)-> #{
    'hero_id' => 507,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035071001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50702)-> #{
    'hero_id' => 507,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005071,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50703)-> #{
    'hero_id' => 507,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005072,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50801)-> #{
    'hero_id' => 508,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035081001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50802)-> #{
    'hero_id' => 508,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005081,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50803)-> #{
    'hero_id' => 508,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005082,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50901)-> #{
    'hero_id' => 509,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035091001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50902)-> #{
    'hero_id' => 509,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005091,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(50903)-> #{
    'hero_id' => 509,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005092,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51001)-> #{
    'hero_id' => 510,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035101001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51002)-> #{
    'hero_id' => 510,
    'genius_num' => 2,
    'is_awaken' => 0,
    'special_effect' => 1005101,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51003)-> #{
    'hero_id' => 510,
    'genius_num' => 3,
    'is_awaken' => 0,
    'special_effect' => 1005102,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51101)-> #{
    'hero_id' => 511,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035111001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51102)-> #{
    'hero_id' => 511,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51201)-> #{
    'hero_id' => 512,
    'genius_num' => 1,
    'is_awaken' => 0,
    'skill' => 1035121001,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51202)-> #{
    'hero_id' => 512,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51301)-> #{
    'hero_id' => 513,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1005131,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51302)-> #{
    'hero_id' => 513,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51303)-> #{
    'hero_id' => 513,
    'genius_num' => 3,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51304)-> #{
    'hero_id' => 513,
    'genius_num' => 4,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51305)-> #{
    'hero_id' => 513,
    'genius_num' => 5,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51401)-> #{
    'hero_id' => 514,
    'genius_num' => 1,
    'is_awaken' => 0,
    'special_effect' => 1005141,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(51402)-> #{
    'hero_id' => 514,
    'genius_num' => 2,
    'is_awaken' => 0,
    'props' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400
    }
};
get(10511)-> #{
    'hero_id' => 105,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1031051001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(10512)-> #{
    'hero_id' => 105,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1031052001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(10513)-> #{
    'hero_id' => 105,
    'genius_num' => 3,
    'is_awaken' => 1,
    'special_effect' => 1001051,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(11511)-> #{
    'hero_id' => 115,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1031151001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(11512)-> #{
    'hero_id' => 115,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1031152001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(11513)-> #{
    'hero_id' => 115,
    'genius_num' => 3,
    'is_awaken' => 1,
    'special_effect' => 1001151,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20111)-> #{
    'hero_id' => 201,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032013001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'qibing_speed' => 30,
        'qibing_base_attack' => 40,
        'qibing_hurt_red_rate' => 0.55
    }
};
get(20112)-> #{
    'hero_id' => 201,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1032014001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20211)-> #{
    'hero_id' => 202,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032022001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20212)-> #{
    'hero_id' => 202,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002022,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20411)-> #{
    'hero_id' => 204,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20412)-> #{
    'hero_id' => 204,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20311)-> #{
    'hero_id' => 203,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032032001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20312)-> #{
    'hero_id' => 203,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002032,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20511)-> #{
    'hero_id' => 205,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032052001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20512)-> #{
    'hero_id' => 205,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002052,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20611)-> #{
    'hero_id' => 206,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032061001,
    'special_effect' => 1002062,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20612)-> #{
    'hero_id' => 206,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002063,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20711)-> #{
    'hero_id' => 207,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032072001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'gongbing_base_attack' => 200
    }
};
get(20712)-> #{
    'hero_id' => 207,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1032073001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20811)-> #{
    'hero_id' => 208,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032082001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20812)-> #{
    'hero_id' => 208,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1032083001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20911)-> #{
    'hero_id' => 209,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(20912)-> #{
    'hero_id' => 209,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21011)-> #{
    'hero_id' => 210,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032102001,
    'special_effect' => 1002102,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21012)-> #{
    'hero_id' => 210,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002103,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21111)-> #{
    'hero_id' => 211,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21112)-> #{
    'hero_id' => 211,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21211)-> #{
    'hero_id' => 212,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032122001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21212)-> #{
    'hero_id' => 212,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002122,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21311)-> #{
    'hero_id' => 213,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1032132001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21312)-> #{
    'hero_id' => 213,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1002132,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21411)-> #{
    'hero_id' => 214,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21412)-> #{
    'hero_id' => 214,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21511)-> #{
    'hero_id' => 215,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(21512)-> #{
    'hero_id' => 215,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30111)-> #{
    'hero_id' => 301,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1033012001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30112)-> #{
    'hero_id' => 301,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033013001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30211)-> #{
    'hero_id' => 302,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1033022001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30212)-> #{
    'hero_id' => 302,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1003022,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30213)-> #{
    'hero_id' => 302,
    'genius_num' => 3,
    'is_awaken' => 1,
    'skill' => 1033023001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30311)-> #{
    'hero_id' => 303,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1033033001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30312)-> #{
    'hero_id' => 303,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1003032,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30411)-> #{
    'hero_id' => 304,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003044,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30412)-> #{
    'hero_id' => 304,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033042001,
    'special_effect' => 1003045,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30511)-> #{
    'hero_id' => 305,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1033052001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'hero_intelect' => 3
    }
};
get(30512)-> #{
    'hero_id' => 305,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033053001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30611)-> #{
    'hero_id' => 306,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003061,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30612)-> #{
    'hero_id' => 306,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033063001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30711)-> #{
    'hero_id' => 307,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003071,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30712)-> #{
    'hero_id' => 307,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033073001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30811)-> #{
    'hero_id' => 308,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1033081001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30812)-> #{
    'hero_id' => 308,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033082001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30911)-> #{
    'hero_id' => 309,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003092,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(30912)-> #{
    'hero_id' => 309,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033093001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31011)-> #{
    'hero_id' => 310,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003104,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31012)-> #{
    'hero_id' => 310,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033102001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31111)-> #{
    'hero_id' => 311,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003113,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31112)-> #{
    'hero_id' => 311,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033112001,
    'special_effect' => 1003114,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31211)-> #{
    'hero_id' => 312,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003123,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31212)-> #{
    'hero_id' => 312,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033124001,
    'special_effect' => 1003124,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31311)-> #{
    'hero_id' => 313,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31312)-> #{
    'hero_id' => 313,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31411)-> #{
    'hero_id' => 314,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1003143,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31412)-> #{
    'hero_id' => 314,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1033143001,
    'special_effect' => 1003144,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31511)-> #{
    'hero_id' => 315,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1033153001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31512)-> #{
    'hero_id' => 315,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1003153,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31611)-> #{
    'hero_id' => 316,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31612)-> #{
    'hero_id' => 316,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31711)-> #{
    'hero_id' => 317,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31712)-> #{
    'hero_id' => 317,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31811)-> #{
    'hero_id' => 318,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(31812)-> #{
    'hero_id' => 318,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40111)-> #{
    'hero_id' => 401,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1034012001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40112)-> #{
    'hero_id' => 401,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034013001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40211)-> #{
    'hero_id' => 402,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1004021,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40212)-> #{
    'hero_id' => 402,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034024001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40311)-> #{
    'hero_id' => 403,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'bingzhong_generalist_hurt_red_rate' => 0.35
    }
};
get(40312)-> #{
    'hero_id' => 403,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034032001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40411)-> #{
    'hero_id' => 404,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40412)-> #{
    'hero_id' => 404,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034043001,
    'special_effect' => 1004042,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40511)-> #{
    'hero_id' => 405,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1034053001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40512)-> #{
    'hero_id' => 405,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034054001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40611)-> #{
    'hero_id' => 406,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1034062001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40612)-> #{
    'hero_id' => 406,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1004062,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40711)-> #{
    'hero_id' => 407,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1004072,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40712)-> #{
    'hero_id' => 407,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1004073,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40811)-> #{
    'hero_id' => 408,
    'genius_num' => 1,
    'is_awaken' => 1,
    'special_effect' => 1004082,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40812)-> #{
    'hero_id' => 408,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1004083,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(40911)-> #{
    'hero_id' => 409,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'bingzhong_general_hurt_red_rate' => 0.35
    }
};
get(40912)-> #{
    'hero_id' => 409,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034092001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41011)-> #{
    'hero_id' => 410,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1034103001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41012)-> #{
    'hero_id' => 410,
    'genius_num' => 2,
    'is_awaken' => 1,
    'special_effect' => 1004103,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41111)-> #{
    'hero_id' => 411,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1034113001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41112)-> #{
    'hero_id' => 411,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1034114001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41211)-> #{
    'hero_id' => 412,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41212)-> #{
    'hero_id' => 412,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41311)-> #{
    'hero_id' => 413,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41312)-> #{
    'hero_id' => 413,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41411)-> #{
    'hero_id' => 414,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41412)-> #{
    'hero_id' => 414,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41511)-> #{
    'hero_id' => 415,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(41512)-> #{
    'hero_id' => 415,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50111)-> #{
    'hero_id' => 501,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1035012001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50211)-> #{
    'hero_id' => 502,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(50212)-> #{
    'hero_id' => 502,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'bingzhong_general_hurt_red_rate' => 0.35
    }
};
get(50213)-> #{
    'hero_id' => 502,
    'genius_num' => 3,
    'is_awaken' => 1,
    'special_effect' => 1005021,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50311)-> #{
    'hero_id' => 503,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50312)-> #{
    'hero_id' => 503,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50411)-> #{
    'hero_id' => 504,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'hero_intelect' => 2,
        'hero_spirit' => 2,
        'hero_leadership' => 2
    }
};
get(50412)-> #{
    'hero_id' => 504,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1035042001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50511)-> #{
    'hero_id' => 505,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1035052001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'hero_spirit' => 4
    }
};
get(50512)-> #{
    'hero_id' => 505,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1035053001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50611)-> #{
    'hero_id' => 506,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600,
        'hero_crit' => 0.05,
        'hero_parry' => 0.05,
        'bingzhong_crit' => 0.05,
        'bingzhong_parry' => 0.05
    }
};
get(50612)-> #{
    'hero_id' => 506,
    'genius_num' => 2,
    'is_awaken' => 1,
    'skill' => 1035062001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50711)-> #{
    'hero_id' => 507,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50712)-> #{
    'hero_id' => 507,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50811)-> #{
    'hero_id' => 508,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50812)-> #{
    'hero_id' => 508,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50911)-> #{
    'hero_id' => 509,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(50912)-> #{
    'hero_id' => 509,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51011)-> #{
    'hero_id' => 510,
    'genius_num' => 1,
    'is_awaken' => 1,
    'skill' => 1035102001,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51111)-> #{
    'hero_id' => 511,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51112)-> #{
    'hero_id' => 511,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51211)-> #{
    'hero_id' => 512,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51212)-> #{
    'hero_id' => 512,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51311)-> #{
    'hero_id' => 513,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51312)-> #{
    'hero_id' => 513,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51411)-> #{
    'hero_id' => 514,
    'genius_num' => 1,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};
get(51412)-> #{
    'hero_id' => 514,
    'genius_num' => 2,
    'is_awaken' => 1,
    'props' => #{
        'skill_powerbase' => 600,
        'skill_powerbase_coefficient' => 600
    }
};

get(_N) -> false.
get_list() ->
	[20101,20102,20201,20202,20301,20302,20401,20402,20501,20502,20601,20602,20701,20702,20801,20802,20901,20902,21001,21002,21101,21102,21201,21202,21301,21302,21401,21402,21501,21502,30101,30102,30201,30202,30301,30302,30303,30401,30402,30403,30404,30501,30502,30601,30602,30603,30701,30702,30703,30801,30802,30803,30901,30902,30903,30904,31001,31002,31003,31004,31101,31102,31103,31104,31201,31202,31203,31204,31301,31302,31303,31401,31402,31403,31404,31501,31502,31503,31504,31601,31602,31603,31701,31702,31703,31704,31801,31802,31803,40101,40102,40201,40202,40203,40301,40302,40303,40304,40401,40402,40403,40404,40501,40502,40503,40601,40602,40701,40702,40801,40802,40803,40901,40902,40903,40904,41001,41002,41003,41004,41101,41102,41103,41104,41201,41202,41203,41204,41301,41302,41303,41401,41402,41403,41501,41502,41503,50101,50102,50103,50201,50202,50203,50301,50302,50401,50402,50403,50501,50502,50503,50601,50602,50603,50701,50702,50703,50801,50802,50803,50901,50902,50903,51001,51002,51003,51101,51102,51201,51202,51301,51302,51303,51304,51305,51401,51402,10511,10512,10513,11511,11512,11513,20111,20112,20211,20212,20411,20412,20311,20312,20511,20512,20611,20612,20711,20712,20811,20812,20911,20912,21011,21012,21111,21112,21211,21212,21311,21312,21411,21412,21511,21512,30111,30112,30211,30212,30213,30311,30312,30411,30412,30511,30512,30611,30612,30711,30712,30811,30812,30911,30912,31011,31012,31111,31112,31211,31212,31311,31312,31411,31412,31511,31512,31611,31612,31711,31712,31811,31812,40111,40112,40211,40212,40311,40312,40411,40412,40511,40512,40611,40612,40711,40712,40811,40812,40911,40912,41011,41012,41111,41112,41211,41212,41311,41312,41411,41412,41511,41512,50111,50211,50212,50213,50311,50312,50411,50412,50511,50512,50611,50612,50711,50712,50811,50812,50911,50912,51011,51111,51112,51211,51212,51311,51312,51411,51412].
