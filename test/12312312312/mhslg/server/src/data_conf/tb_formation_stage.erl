%%--- coding:utf-8 ---
-module(tb_formation_stage).
-export([get/1,get_list/0]).
get(201)-> #{
    'formation_id' => 2,
    'stage' => 1,
    'condition' => [
        1,
         1
    ],
    'consume' => [
        102025001,
         5
    ],
    'prop' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'qianjun_speed' => 5,
        'qianjun_crit' => 0.05
    }
};
get(202)-> #{
    'formation_id' => 2,
    'stage' => 2,
    'condition' => [
        2,
         2
    ],
    'consume' => [
        102025001,
         20
    ],
    'prop' => #{
        'skill_powerbase' => 800,
        'skill_powerbase_coefficient' => 800,
        'bingzhong_generalist_hurt_inc_rate' => 0.1
    }
};
get(203)-> #{
    'formation_id' => 2,
    'stage' => 3,
    'condition' => [
        3,
         3
    ],
    'consume' => [
        102025001,
         80
    ],
    'prop' => #{
        'skill_powerbase' => 1200,
        'skill_powerbase_coefficient' => 1200,
        'qianjun_attack_rate' => 0.15
    }
};
get(204)-> #{
    'formation_id' => 2,
    'stage' => 4,
    'condition' => [
        4,
         4
    ],
    'consume' => [
        102025001,
         300
    ],
    'prop' => #{
        'skill_powerbase' => 1600,
        'skill_powerbase_coefficient' => 1600,
        'hero_strength' => 1,
        'hero_intelect' => 1
    }
};
get(205)-> #{
    'formation_id' => 2,
    'stage' => 5,
    'condition' => [
        5,
         5
    ],
    'consume' => [
        102025001,
         600
    ],
    'skill' => 1070202001,
    'prop' => #{
        'skill_powerbase' => 2000,
        'skill_powerbase_coefficient' => 2000,
        'bingzhong_speed' => 3
    }
};
get(206)-> #{
    'formation_id' => 2,
    'stage' => 6,
    'prop' => #{
        'skill_powerbase' => 2400,
        'skill_powerbase_coefficient' => 2400,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(301)-> #{
    'formation_id' => 3,
    'stage' => 1,
    'condition' => [
        1,
         1
    ],
    'consume' => [
        102025002,
         5
    ],
    'prop' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_parry' => 0.05
    }
};
get(302)-> #{
    'formation_id' => 3,
    'stage' => 2,
    'condition' => [
        2,
         2
    ],
    'consume' => [
        102025002,
         20
    ],
    'prop' => #{
        'skill_powerbase' => 800,
        'skill_powerbase_coefficient' => 800,
        'bingzhong_civilian_hurt_red_rate' => 0.05
    }
};
get(303)-> #{
    'formation_id' => 3,
    'stage' => 3,
    'condition' => [
        3,
         3
    ],
    'consume' => [
        102025002,
         80
    ],
    'skill' => 1070203001,
    'prop' => #{
        'skill_powerbase' => 1200,
        'skill_powerbase_coefficient' => 1200
    }
};
get(304)-> #{
    'formation_id' => 3,
    'stage' => 4,
    'condition' => [
        4,
         4
    ],
    'consume' => [
        102025002,
         300
    ],
    'prop' => #{
        'skill_powerbase' => 1600,
        'skill_powerbase_coefficient' => 1600,
        'hero_strength' => 1,
        'hero_spirit' => 1
    }
};
get(305)-> #{
    'formation_id' => 3,
    'stage' => 5,
    'condition' => [
        5,
         5
    ],
    'consume' => [
        102025002,
         600
    ],
    'skill' => 1070302001,
    'prop' => #{
        'skill_powerbase' => 2000,
        'skill_powerbase_coefficient' => 2000,
        'bingzhong_speed' => 3
    }
};
get(306)-> #{
    'formation_id' => 3,
    'stage' => 6,
    'prop' => #{
        'skill_powerbase' => 2400,
        'skill_powerbase_coefficient' => 2400,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(401)-> #{
    'formation_id' => 4,
    'stage' => 1,
    'condition' => [
        1,
         1
    ],
    'consume' => [
        102025003,
         5
    ],
    'prop' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'houjun_speed' => 5,
        'houjun_crit' => 0.05
    }
};
get(402)-> #{
    'formation_id' => 4,
    'stage' => 2,
    'condition' => [
        2,
         2
    ],
    'consume' => [
        102025003,
         20
    ],
    'prop' => #{
        'skill_powerbase' => 800,
        'skill_powerbase_coefficient' => 800,
        'bingzhong_general_hurt_inc_rate' => 0.1
    }
};
get(403)-> #{
    'formation_id' => 4,
    'stage' => 3,
    'condition' => [
        3,
         3
    ],
    'consume' => [
        102025003,
         80
    ],
    'prop' => #{
        'skill_powerbase' => 1200,
        'skill_powerbase_coefficient' => 1200,
        'houjun_attack_rate' => 0.15
    }
};
get(404)-> #{
    'formation_id' => 4,
    'stage' => 4,
    'condition' => [
        4,
         4
    ],
    'consume' => [
        102025003,
         300
    ],
    'prop' => #{
        'skill_powerbase' => 1600,
        'skill_powerbase_coefficient' => 1600,
        'hero_spirit' => 1,
        'hero_intelect' => 1
    }
};
get(405)-> #{
    'formation_id' => 4,
    'stage' => 5,
    'condition' => [
        5,
         5
    ],
    'consume' => [
        102025003,
         600
    ],
    'skill' => 1070402001,
    'prop' => #{
        'skill_powerbase' => 2000,
        'skill_powerbase_coefficient' => 2000,
        'bingzhong_speed' => 3
    }
};
get(406)-> #{
    'formation_id' => 4,
    'stage' => 6,
    'prop' => #{
        'skill_powerbase' => 2400,
        'skill_powerbase_coefficient' => 2400,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(501)-> #{
    'formation_id' => 5,
    'stage' => 1,
    'condition' => [
        1,
         1
    ],
    'consume' => [
        102025004,
         5
    ],
    'prop' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'qianjun_speed' => 5,
        'qianjun_crit' => 0.05
    }
};
get(502)-> #{
    'formation_id' => 5,
    'stage' => 2,
    'condition' => [
        2,
         2
    ],
    'consume' => [
        102025004,
         20
    ],
    'prop' => #{
        'skill_powerbase' => 800,
        'skill_powerbase_coefficient' => 800,
        'bingzhong_generalist_hurt_red_rate' => 0.1
    }
};
get(503)-> #{
    'formation_id' => 5,
    'stage' => 3,
    'condition' => [
        3,
         3
    ],
    'consume' => [
        102025004,
         80
    ],
    'prop' => #{
        'skill_powerbase' => 1200,
        'skill_powerbase_coefficient' => 1200,
        'qianjun_attack_rate' => 0.06,
        'houjun_attack_rate' => 0.1
    }
};
get(504)-> #{
    'formation_id' => 5,
    'stage' => 4,
    'condition' => [
        4,
         4
    ],
    'consume' => [
        102025004,
         300
    ],
    'prop' => #{
        'skill_powerbase' => 1600,
        'skill_powerbase_coefficient' => 1600,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(505)-> #{
    'formation_id' => 5,
    'stage' => 5,
    'condition' => [
        5,
         5
    ],
    'consume' => [
        102025004,
         600
    ],
    'skill' => 1070502001,
    'prop' => #{
        'skill_powerbase' => 2000,
        'skill_powerbase_coefficient' => 2000,
        'bingzhong_speed' => 3
    }
};
get(506)-> #{
    'formation_id' => 5,
    'stage' => 6,
    'prop' => #{
        'skill_powerbase' => 2400,
        'skill_powerbase_coefficient' => 2400,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(601)-> #{
    'formation_id' => 6,
    'stage' => 1,
    'condition' => [
        1,
         1
    ],
    'consume' => [
        102025005,
         5
    ],
    'prop' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'hero_hero_skill_hurt_inc_rate' => 0.1
    }
};
get(602)-> #{
    'formation_id' => 6,
    'stage' => 2,
    'condition' => [
        2,
         2
    ],
    'consume' => [
        102025005,
         20
    ],
    'prop' => #{
        'skill_powerbase' => 800,
        'skill_powerbase_coefficient' => 800,
        'bingzhong_civilian_hurt_inc_rate' => 0.05
    }
};
get(603)-> #{
    'formation_id' => 6,
    'stage' => 3,
    'condition' => [
        3,
         3
    ],
    'consume' => [
        102025005,
         80
    ],
    'prop' => #{
        'skill_powerbase' => 1200,
        'skill_powerbase_coefficient' => 1200,
        'qianjun_attack_rate' => 0.1,
        'houjun_attack_rate' => 0.06
    }
};
get(604)-> #{
    'formation_id' => 6,
    'stage' => 4,
    'condition' => [
        4,
         4
    ],
    'consume' => [
        102025005,
         300
    ],
    'prop' => #{
        'skill_powerbase' => 1600,
        'skill_powerbase_coefficient' => 1600,
        'hero_strength' => 1,
        'hero_leadership' => 1
    }
};
get(605)-> #{
    'formation_id' => 6,
    'stage' => 5,
    'condition' => [
        5,
         5
    ],
    'consume' => [
        102025005,
         600
    ],
    'skill' => 1070602001,
    'prop' => #{
        'skill_powerbase' => 2000,
        'skill_powerbase_coefficient' => 2000,
        'bingzhong_speed' => 3
    }
};
get(606)-> #{
    'formation_id' => 6,
    'stage' => 6,
    'prop' => #{
        'skill_powerbase' => 2400,
        'skill_powerbase_coefficient' => 2400,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(701)-> #{
    'formation_id' => 7,
    'stage' => 1,
    'condition' => [
        1,
         1
    ],
    'consume' => [
        102025006,
         5
    ],
    'prop' => #{
        'skill_powerbase' => 400,
        'skill_powerbase_coefficient' => 400,
        'bingzhong_hero_skill_hurt_red_rate' => 0.1
    }
};
get(702)-> #{
    'formation_id' => 7,
    'stage' => 2,
    'condition' => [
        2,
         2
    ],
    'consume' => [
        102025006,
         20
    ],
    'prop' => #{
        'skill_powerbase' => 800,
        'skill_powerbase_coefficient' => 800,
        'bingzhong_general_hurt_red_rate' => 0.1
    }
};
get(703)-> #{
    'formation_id' => 7,
    'stage' => 3,
    'condition' => [
        3,
         3
    ],
    'consume' => [
        102025006,
         80
    ],
    'skill' => 1070702001,
    'prop' => #{
        'skill_powerbase' => 1200,
        'skill_powerbase_coefficient' => 1200
    }
};
get(704)-> #{
    'formation_id' => 7,
    'stage' => 4,
    'condition' => [
        4,
         4
    ],
    'consume' => [
        102025006,
         300
    ],
    'prop' => #{
        'skill_powerbase' => 1600,
        'skill_powerbase_coefficient' => 1600,
        'hero_leadership' => 1,
        'hero_intelect' => 1
    }
};
get(705)-> #{
    'formation_id' => 7,
    'stage' => 5,
    'condition' => [
        5,
         5
    ],
    'consume' => [
        102025006,
         600
    ],
    'skill' => 1070703001,
    'prop' => #{
        'skill_powerbase' => 2000,
        'skill_powerbase_coefficient' => 2000,
        'bingzhong_speed' => 3
    }
};
get(706)-> #{
    'formation_id' => 7,
    'stage' => 6,
    'prop' => #{
        'skill_powerbase' => 2400,
        'skill_powerbase_coefficient' => 2400,
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};

get(_N) -> false.
get_list() ->
	[201,202,203,204,205,206,301,302,303,304,305,306,401,402,403,404,405,406,501,502,503,504,505,506,601,602,603,604,605,606,701,702,703,704,705,706].
