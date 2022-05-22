%%--- coding:utf-8 ---
-module(tb_special_effect).
-export([get/1,get_list/0]).
get(1001051)-> #{
    'type' => 2,
    'des' => <<"3126"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201605
    ],
    'props' => #{
        'bubing_base_attack' => 210,
        'bubing_crit' => 0.1
    }
};
get(1001151)-> #{
    'type' => 2,
    'des' => <<"3127"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201611
    ],
    'props' => #{
        'bingzhong_troops' => 50
    }
};
get(1002021)-> #{
    'type' => 2,
    'des' => <<"3128"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201203
    ],
    'props' => #{
        'bingzhong_troops' => 10
    }
};
get(1002022)-> #{
    'type' => 2,
    'des' => <<"3129"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201201
    ],
    'props' => #{
        'bingzhong_attack' => 20,
        'bingzhong_defence' => 20
    }
};
get(1002031)-> #{
    'type' => 2,
    'des' => <<"3130"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201602
    ],
    'props' => #{
        'hero_civilian_hurt_red_rate' => 0.01,
        'hero_generalist_hurt_red_rate' => 0.01,
        'bingzhong_civilian_hurt_red_rate' => 0.01,
        'bingzhong_generalist_hurt_red_rate' => 0.01
    },
    'max_props' => #{
        'hero_civilian_hurt_red_rate' => 0.2,
        'hero_generalist_hurt_red_rate' => 0.2,
        'bingzhong_civilian_hurt_red_rate' => 0.2,
        'bingzhong_generalist_hurt_red_rate' => 0.2
    }
};
get(1002032)-> #{
    'type' => 3,
    'des' => <<"3131"/utf8>>,
    'p1' => 201303,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 2,
        'qibing_crit' => 0.4
    }
};
get(1002041)-> #{
    'type' => 2,
    'des' => <<"3132"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101301
    ],
    'props' => #{
        'hero_skill_hurt_inc_rate' => 0.02
    },
    'max_props' => #{
        'hero_skill_hurt_inc_rate' => 0.3
    }
};
get(1002051)-> #{
    'type' => 2,
    'des' => <<"3133"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201503
    ],
    'props' => #{
        'fangshi_base_attack' => 5
    }
};
get(1002052)-> #{
    'type' => 3,
    'des' => <<"3134"/utf8>>,
    'p1' => 101114,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 7,
        'hero_intelect' => 7,
        'hero_spirit' => 7,
        'hero_leadership' => 7
    }
};
get(1002061)-> #{
    'type' => 2,
    'des' => <<"3135"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201704
    ],
    'props' => #{
        'qianjun_troops' => 5,
        'houjun_troops' => 3
    }
};
get(1002062)-> #{
    'type' => 3,
    'des' => <<"3136"/utf8>>,
    'p1' => 101108,
    'p2' => 1,
    'props' => #{
        'gongbing_hurt_red_rate' => 0.03
    },
    'max_props' => #{
        'gongbing_hurt_red_rate' => 0.75
    }
};
get(1002063)-> #{
    'type' => 3,
    'des' => <<"3137"/utf8>>,
    'p1' => 201601,
    'p2' => 15,
    'props' => #{
        'hero_intelect' => 5,
        'hero_spirit' => 8,
        'hero_leadership' => 6
    }
};
get(1002071)-> #{
    'type' => 5,
    'des' => <<"3138"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_attack_rate' => 0.005,
        'bingzhong_defence_rate' => 0.005
    },
    'max_props' => #{
        'bingzhong_attack_rate' => 0.3,
        'bingzhong_defence_rate' => 0.3
    }
};
get(1002081)-> #{
    'type' => 2,
    'des' => <<"3139"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101201
    ],
    'props' => #{
        'bubing_base_attack' => 5
    }
};
get(1002091)-> #{
    'type' => 2,
    'des' => <<"3140"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101202
    ],
    'props' => #{
        'bubing_base_attack' => 3
    }
};
get(1002101)-> #{
    'type' => 2,
    'des' => <<"3141"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201608
    ],
    'props' => #{
        'hero_skill_hurt_inc_rate' => 0.05
    }
};
get(1002102)-> #{
    'type' => 2,
    'des' => <<"3142"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101109
    ],
    'props' => #{
        'fangshi_hurt_red_rate' => 0.03
    },
    'max_props' => #{
        'fangshi_hurt_red_rate' => 0.75
    }
};
get(1002103)-> #{
    'type' => 3,
    'des' => <<"3143"/utf8>>,
    'p1' => 201603,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 8,
        'hero_intelect' => 6,
        'hero_leadership' => 5
    }
};
get(1002121)-> #{
    'type' => 2,
    'des' => <<"3144"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201302
    ],
    'props' => #{
        'qibing_base_attack' => 3,
        'qibing_crit' => 0.02
    }
};
get(1002122)-> #{
    'type' => 3,
    'des' => <<"3145"/utf8>>,
    'p1' => 201602,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 6,
        'hero_spirit' => 10,
        'bingzhong_civilian_hurt_red_rate' => 0.4
    }
};
get(1002131)-> #{
    'type' => 2,
    'des' => <<"3146"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101401
    ],
    'props' => #{
        'gongbing_base_attack' => 2,
        'gongbing_crit' => 0.02
    }
};
get(1002132)-> #{
    'type' => 3,
    'des' => <<"3147"/utf8>>,
    'p1' => 201402,
    'p2' => 15,
    'props' => #{
        'bingzhong_crit' => 0.3,
        'bingzhong_general_hurt_red_rate' => 0.4
    }
};
get(1002141)-> #{
    'type' => 2,
    'des' => <<"3148"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201702
    ],
    'props' => #{
        'bingzhong_attack_rate' => 0.01,
        'bingzhong_defence_rate' => 0.01
    },
    'max_props' => #{
        'bingzhong_attack_rate' => 0.2,
        'bingzhong_defence_rate' => 0.2
    }
};
get(1002151)-> #{
    'type' => 2,
    'des' => <<"3149"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201403
    ],
    'props' => #{
        'hero_skill_hurt_red_rate' => 0.02
    },
    'max_props' => #{
        'hero_skill_hurt_red_rate' => 0.4
    }
};
get(1003011)-> #{
    'type' => 2,
    'des' => <<"3150"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101101
    ],
    'props' => #{
        'qibing_base_attack' => 6,
        'gongbing_troops' => 20
    }
};
get(1003021)-> #{
    'type' => 2,
    'des' => <<"3151"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201202
    ],
    'props' => #{
        'bubing_attack' => 3,
        'bubing_defence' => 3,
        'hero_skill_hurt_inc_rate' => 0.01
    }
};
get(1003022)-> #{
    'type' => 3,
    'des' => <<"3152"/utf8>>,
    'p1' => 101110,
    'p2' => 15,
    'props' => #{
        'bubing_attack' => 100,
        'bubing_defence' => 100,
        'gongbing_attack' => 300,
        'gongbing_defence' => 300
    }
};
get(1003031)-> #{
    'type' => 2,
    'des' => <<"3153"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101103
    ],
    'props' => #{
        'qibing_base_attack' => 5,
        'qibing_base_defence' => 2
    }
};
get(1003032)-> #{
    'type' => 3,
    'des' => <<"3154"/utf8>>,
    'p1' => 201504,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 5
    }
};
get(1003041)-> #{
    'type' => 1,
    'des' => <<"3155"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_intelect"/utf8>>
    ],
    'props' => #{
        'hero_hurt_inc_rate' => 0.01,
        'hero_hurt_red_rate' => 0.01,
        'bingzhong_hurt_inc_rate' => 0.01,
        'bingzhong_hurt_red_rate' => 0.01
    },
    'max_props' => #{
        'hero_hurt_inc_rate' => 0.35,
        'hero_hurt_red_rate' => 0.35,
        'bingzhong_hurt_inc_rate' => 0.35,
        'bingzhong_hurt_red_rate' => 0.35
    }
};
get(1003042)-> #{
    'type' => 2,
    'des' => <<"3156"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101105
    ],
    'props' => #{
        'bubing_base_attack' => 4,
        'bubing_base_defence' => 4,
        'fansghi_base_attack' => 5,
        'fangshi_base_defence' => 5
    }
};
get(1003043)-> #{
    'type' => 2,
    'des' => <<"3157"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101114
    ],
    'props' => #{
        'bubing_troops' => 15,
        'fangshi_troops' => 10
    }
};
get(1003044)-> #{
    'type' => 14,
    'des' => <<"3158"/utf8>>,
    'p_text' => [
        101105,
         101108,
         101109,
         101114,
         101121,
         101122,
         201601,
         201613,
         201616,
         201619,
         201621
    ],
    'props' => #{
        'bingzhong_crit' => 0.02
    }
};
get(1003045)-> #{
    'type' => 3,
    'des' => <<"3159"/utf8>>,
    'p1' => 201704,
    'p2' => 15,
    'props' => #{
        'hero_intelect' => 1
    }
};
get(1003051)-> #{
    'type' => 2,
    'des' => <<"3160"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201201
    ],
    'props' => #{
        'bingzhong_later_hurt_red_rate' => 0.01
    },
    'max_props' => #{
        'bingzhong_later_hurt_red_rate' => 0.2
    }
};
get(1003061)-> #{
    'type' => 1,
    'des' => <<"3161"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_strength"/utf8>>
    ],
    'props' => #{
        'hero_leadership' => 1
    }
};
get(1003071)-> #{
    'type' => 1,
    'des' => <<"3162"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_leadership"/utf8>>
    ],
    'props' => #{
        'hero_intelect' => 1
    }
};
get(1003072)-> #{
    'type' => 2,
    'des' => <<"3163"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201501
    ],
    'props' => #{
        'fangshi_base_attack' => 6
    }
};
get(1003081)-> #{
    'type' => 2,
    'des' => <<"3164"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201203
    ],
    'props' => #{
        'bubing_base_attack' => 4,
        'bubing_parry' => 0.015
    }
};
get(1003091)-> #{
    'type' => 2,
    'des' => <<"3165"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101109
    ],
    'props' => #{
        'hero_skill_hurt_red_rate' => 0.03
    },
    'max_props' => #{
        'hero_skill_hurt_red_rate' => 0.45
    }
};
get(1003092)-> #{
    'type' => 1,
    'des' => <<"3166"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_intelect"/utf8>>
    ],
    'props' => #{
        'hero_leadership' => 1
    }
};
get(1003101)-> #{
    'type' => 1,
    'des' => <<"3167"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_spirit"/utf8>>
    ],
    'props' => #{
        'hero_skill_hurt_inc_rate' => 0.02
    },
    'max_props' => #{
        'hero_skill_hurt_inc_rate' => 0.5
    }
};
get(1003102)-> #{
    'type' => 2,
    'des' => <<"3168"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101401
    ],
    'props' => #{
        'gongbing_base_attack' => 7,
        'gongbing_base_defence' => 7
    }
};
get(1003103)-> #{
    'type' => 2,
    'des' => <<"3169"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101113
    ],
    'props' => #{
        'bingzhong_troops' => 12
    }
};
get(1003104)-> #{
    'type' => 1,
    'des' => <<"3170"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_leadership"/utf8>>
    ],
    'props' => #{
        'hero_spirit' => 1
    }
};
get(1003111)-> #{
    'type' => 4,
    'des' => <<"3171"/utf8>>,
    'p1' => 107001002,
    'props' => #{
        'hero_strength' => 5,
        'hero_leadership' => 5
    }
};
get(1003112)-> #{
    'type' => 2,
    'des' => <<"3172"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101110
    ],
    'props' => #{
        'bubing_troops' => 40,
        'bingzhong_base_attack' => 3,
        'bingzhong_base_defence' => 3
    }
};
get(1003113)-> #{
    'type' => 14,
    'des' => <<"3173"/utf8>>,
    'p_text' => [
        101102,
         101103,
         101110,
         101112,
         101116,
         101120,
         101122,
         201602,
         201614,
         201621
    ],
    'props' => #{
        'bingzhong_attack' => 80
    }
};
get(1003114)-> #{
    'type' => 3,
    'des' => <<"3174"/utf8>>,
    'p1' => 201705,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 1
    }
};
get(1003121)-> #{
    'type' => 1,
    'des' => <<"3175"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_leadership"/utf8>>
    ],
    'props' => #{
        'fangshi_base_attack' => 8,
        'fangshi_base_defence' => 8
    }
};
get(1003122)-> #{
    'type' => 2,
    'des' => <<"3176"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201304
    ],
    'props' => #{
        'qibing_troops' => 60,
        'fangshi_troops' => 20
    }
};
get(1003123)-> #{
    'type' => 14,
    'des' => <<"3177"/utf8>>,
    'p_text' => [
        101104,
         101113,
         101116,
         101117,
         201603,
         201604,
         201614,
         201616,
         201618
    ],
    'props' => #{
        'bingzhong_troops' => 150
    }
};
get(1003124)-> #{
    'type' => 3,
    'des' => <<"3178"/utf8>>,
    'p1' => 201706,
    'p2' => 15,
    'props' => #{
        'hero_leadership' => 1
    }
};
get(1003131)-> #{
    'type' => 6,
    'des' => <<"3179"/utf8>>
};
get(1003132)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1003133)-> #{
    'type' => 12,
    'des' => <<"3181"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'bingzhong_speed' => 2
        },
         #{
            'star' => 12,
            'bingzhong_troops' => 100
        },
         #{
            'star' => 18,
            'hero_strength' => 1,
            'hero_intelect' => 1,
            'hero_spirit' => 1,
            'hero_leadership' => 1
        }
    ]
};
get(1003141)-> #{
    'type' => 2,
    'des' => <<"3182"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201604
    ],
    'props' => #{
        'gongbing_base_attack' => 11,
        'gongbing_troops' => 50
    }
};
get(1003142)-> #{
    'type' => 1,
    'des' => <<"3183"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_strength"/utf8>>,
         <<"hero_intelect"/utf8>>,
         <<"hero_leadership"/utf8>>,
         <<"hero_spirit"/utf8>>
    ],
    'props' => #{
        'bubing_attack' => 7,
        'bubing_defence' => 7
    }
};
get(1003143)-> #{
    'type' => 14,
    'des' => <<"3184"/utf8>>,
    'p_text' => [
        101101,
         101111,
         101115,
         101117,
         201604,
         201613,
         201617,
         201620
    ],
    'props' => #{
        'bingzhong_defence' => 60
    }
};
get(1003144)-> #{
    'type' => 3,
    'des' => <<"3185"/utf8>>,
    'p1' => 201707,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 1,
        'hero_intelect' => 1,
        'hero_spirit' => 1,
        'hero_leadership' => 1
    }
};
get(1003151)-> #{
    'type' => 2,
    'des' => <<"3186"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101116
    ],
    'props' => #{
        'bingzhong_troops_skill_hurt_inc' => 0.02
    }
};
get(1003152)-> #{
    'type' => 2,
    'des' => <<"3187"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201609
    ],
    'props' => #{
        'qibing_base_attack' => 2,
        'qibing_base_defence' => 2,
        'gongbing_base_attack' => 6,
        'gongbing_base_defence' => 6
    }
};
get(1003153)-> #{
    'type' => 3,
    'des' => <<"3188"/utf8>>,
    'p1' => 201702,
    'p2' => 15,
    'props' => #{
        'bingzhong_base_attack' => 100,
        'bingzhong_base_defence' => 20
    }
};
get(1003161)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1003162)-> #{
    'type' => 12,
    'des' => <<"3189"/utf8>>,
    'props' => [
        #{
            'star' => 12,
            'hero_spirit' => 1,
            'hero_leadership' => 1
        }
    ]
};
get(1003163)-> #{
    'type' => 13,
    'des' => <<"3190"/utf8>>,
    'props' => [
        #{
            'star' => 12,
            'hero_spirit' => 4,
            'hero_leadership' => 4
        }
    ]
};
get(1003181)-> #{
    'type' => 2,
    'des' => <<"3191"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201601
    ],
    'props' => #{
        'bubing_troops' => 40,
        'fangshi_base_attack' => 13
    }
};
get(1004011)-> #{
    'type' => 2,
    'des' => <<"3192"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201403
    ],
    'props' => #{
        'gongbing_base_attack' => 3,
        'gongbing_crit' => 0.02
    }
};
get(1004021)-> #{
    'type' => 1,
    'des' => <<"3193"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_spirit"/utf8>>
    ],
    'props' => #{
        'hero_intelect' => 1,
        'man_hurt_red' => 0.02
    },
    'max_props' => #{
        'man_hurt_red' => 0.5
    }
};
get(1004031)-> #{
    'type' => 1,
    'des' => <<"3194"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_strength"/utf8>>
    ],
    'props' => #{
        'hero_spirit' => 1
    }
};
get(1004032)-> #{
    'type' => 2,
    'des' => <<"3195"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201303
    ],
    'props' => #{
        'qibing_base_attack' => 11,
        'qibing_base_defence' => 3
    }
};
get(1004033)-> #{
    'type' => 2,
    'des' => <<"3196"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101112
    ],
    'props' => #{
        'bingzhong_crit' => 0.02
    }
};
get(1004041)-> #{
    'type' => 2,
    'des' => <<"3197"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101111
    ],
    'props' => #{
        'gongbing_troops' => 6,
        'gongbing_base_attack' => 6,
        'gongbing_base_defence' => 6
    }
};
get(1004042)-> #{
    'type' => 4,
    'des' => <<"3198"/utf8>>,
    'p1' => 107001002,
    'props' => #{
        'hero_spirit' => 5
    }
};
get(1004051)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1004052)-> #{
    'type' => 12,
    'des' => <<"3199"/utf8>>,
    'props' => [
        #{
            'star' => 12,
            'hero_strength' => 1,
            'hero_leadership' => 1
        }
    ]
};
get(1004053)-> #{
    'type' => 13,
    'des' => <<"3200"/utf8>>,
    'props' => [
        #{
            'star' => 12,
            'hero_strength' => 4,
            'hero_leadership' => 4
        }
    ]
};
get(1004061)-> #{
    'type' => 2,
    'des' => <<"3201"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201302
    ],
    'props' => #{
        'former_hurt_red' => 0.01
    },
    'max_props' => #{
        'former_hurt_red' => 0.2
    }
};
get(1004062)-> #{
    'type' => 15,
    'des' => <<"3202"/utf8>>,
    'p2' => 110,
    'p_text' => [
        <<"hero_intelect"/utf8>>
    ],
    'props' => #{
        'bingzhong_base_attack' => 40,
        'bingzhong_base_defence' => 40,
        'man_hurt_inc_rate' => 0.5
    }
};
get(1004071)-> #{
    'type' => 2,
    'des' => <<"3203"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201603
    ],
    'props' => #{
        'qibing_base_attack' => 4,
        'qibing_base_defence' => 4,
        'fangshi_base_attack' => 5,
        'fangshi_base_defence' => 5
    }
};
get(1004072)-> #{
    'type' => 1,
    'des' => <<"3204"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_intelect"/utf8>>
    ],
    'props' => #{
        'hero_spirit' => 1
    }
};
get(1004073)-> #{
    'type' => 3,
    'des' => <<"3205"/utf8>>,
    'p1' => 201502,
    'p2' => 15,
    'props' => #{
        'hero_general_hurt_inc_rate' => 0.5,
        'bingzhong_general_hurt_inc_rate' => 0.5
    }
};
get(1004081)-> #{
    'type' => 2,
    'des' => <<"3206"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201607
    ],
    'props' => #{
        'bingzhong_attack_rate' => 0.04,
        'bingzhong_defence_rate' => 0.04
    },
    'max_props' => #{
        'bingzhong_attack_rate' => 0.2,
        'bingzhong_defence_rate' => 0.2
    }
};
get(1004082)-> #{
    'type' => 1,
    'des' => <<"3207"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_spirit"/utf8>>
    ],
    'props' => #{
        'hero_intelect' => 1
    }
};
get(1004083)-> #{
    'type' => 3,
    'des' => <<"3208"/utf8>>,
    'p1' => 101111,
    'p2' => 15,
    'props' => #{
        'bubing_base_attack' => 30,
        'bubing_base_defence' => 30,
        'fangshi_base_attack' => 60,
        'fangshi_base_defence' => 60
    }
};
get(1004091)-> #{
    'type' => 16,
    'des' => <<"3209"/utf8>>,
    'p1' => 1,
    'p2' => 15,
    'p_text' => [
        101104,
         101105,
         101108,
         101115,
         101118,
         101121,
         201601
    ],
    'props' => #{
        'hero_hurt_inc_rate' => 0.1,
        'bingzhong_hurt_inc_rate' => 0.1
    }
};
get(1004092)-> #{
    'type' => 2,
    'des' => <<"3210"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101115
    ],
    'props' => #{
        'bingzhong_base_defence' => 5,
        'bingzhong_troops' => 15
    }
};
get(1004093)-> #{
    'type' => 2,
    'des' => <<"3211"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201607
    ],
    'props' => #{
        'hero_intelect' => 1,
        'hero_spirit' => 1
    }
};
get(1004101)-> #{
    'type' => 6,
    'des' => <<"3179"/utf8>>
};
get(1004102)-> #{
    'type' => 2,
    'des' => <<"3212"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201613
    ],
    'props' => #{
        'gongbing_troops' => 20,
        'gongbing_hurt_red_rate' => 0.02
    },
    'max_props' => #{
        'gongbing_hurt_red_rate' => 0.5
    }
};
get(1004103)-> #{
    'type' => 3,
    'des' => <<"3213"/utf8>>,
    'p1' => 201701,
    'p2' => 15,
    'props' => #{
        'bingzhong_base_attack' => 40,
        'bingzhong_base_defence' => 80
    }
};
get(1004111)-> #{
    'type' => 2,
    'des' => <<"3214"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101107
    ],
    'props' => #{
        'qibing_base_defence' => 5,
        'qibing_troops' => 15
    }
};
get(1004112)-> #{
    'type' => 2,
    'des' => <<"3215"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201614
    ],
    'props' => #{
        'gongbing_crit' => 0.02,
        'gongbing_troops' => 10
    }
};
get(1004121)-> #{
    'type' => 2,
    'des' => <<"3216"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201615
    ],
    'props' => #{
        'fangshi_base_attack' => 5,
        'fangshi_base_defence' => 5,
        'fangshi_troops' => 25
    }
};
get(1004122)-> #{
    'type' => 2,
    'des' => <<"3217"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201614
    ],
    'props' => #{
        'hero_woman_hurt_red' => 0.02,
        'bingzhong_woman_hurt_red' => 0.02
    },
    'max_props' => #{
        'woman_hurt_red' => 0.5
    }
};
get(1004131)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1004132)-> #{
    'type' => 12,
    'des' => <<"3218"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'qibing_base_attack' => 25,
            'qibing_base_defence' => 15
        },
         #{
            'star' => 12,
            'hero_strength' => 2
        },
         #{
            'star' => 18,
            'qibing_crit' => 0.1,
            'qibing_speed' => 5
        }
    ]
};
get(1004133)-> #{
    'type' => 13,
    'des' => <<"3219"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'qibing_base_attack' => 100,
            'qibing_base_defence' => 60
        },
         #{
            'star' => 12,
            'hero_strength' => 8
        },
         #{
            'star' => 18,
            'qibing_crit' => 0.4,
            'qibing_speed' => 20
        }
    ]
};
get(1004141)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1004142)-> #{
    'type' => 12,
    'des' => <<"3220"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'bubing_base_attack' => 20,
            'bubing_base_defence' => 20
        },
         #{
            'star' => 12,
            'hero_intelect' => 2
        },
         #{
            'star' => 18,
            'bubing_parry' => 0.15,
            'bubing_speed' => 3
        }
    ]
};
get(1004143)-> #{
    'type' => 13,
    'des' => <<"3221"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'bubing_base_attack' => 80,
            'bubing_base_defence' => 80
        },
         #{
            'star' => 12,
            'hero_intelect' => 8
        },
         #{
            'star' => 18,
            'bubing_parry' => 0.6,
            'bubing_speed' => 12
        }
    ]
};
get(1004151)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1004152)-> #{
    'type' => 12,
    'des' => <<"3222"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'bingzhong_hurt_red_rate' => 0.04
        },
         #{
            'star' => 12,
            'hero_leadership' => 2
        }
    ]
};
get(1004153)-> #{
    'type' => 13,
    'des' => <<"3223"/utf8>>,
    'props' => [
        #{
            'star' => 6,
            'bingzhong_hurt_red_rate' => 0.16
        },
         #{
            'star' => 12,
            'hero_leadership' => 8
        }
    ]
};
get(1005011)-> #{
    'type' => 2,
    'des' => <<"3224"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101502
    ],
    'props' => #{
        'fangshi_hurt_red_rate' => 0.02
    },
    'max_props' => #{
        'fangshi_hurt_red_rate' => 0.5
    }
};
get(1005012)-> #{
    'type' => 2,
    'des' => <<"3225"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101503
    ],
    'props' => #{
        'fangshi_base_attack' => 9,
        'fangshi_base_defence' => 9,
        'fangshi_troops' => 30
    }
};
get(1005021)-> #{
    'type' => 2,
    'des' => <<"3226"/utf8>>,
    'p2' => 1,
    'p_text' => [
        201205
    ],
    'props' => #{
        'bubing_attack' => 35,
        'bubing_defence' => 15,
        'bubing_troops' => 45
    }
};
get(1005031)-> #{
    'type' => 2,
    'des' => <<"3227"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101117
    ],
    'props' => #{
        'bingzhong_troops' => 20
    }
};
get(1005032)-> #{
    'type' => 7,
    'des' => <<"3180"/utf8>>
};
get(1005041)-> #{
    'type' => 2,
    'des' => <<"3228"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101122
    ],
    'props' => #{
        'hero_civilian_hurt_inc_rate' => 0.01,
        'hero_generalist_hurt_inc_rate' => 0.01,
        'bingzhong_civilian_hurt_inc_rate' => 0.01,
        'bingzhong_generalist_hurt_inc_rate' => 0.01
    }
};
get(1005042)-> #{
    'type' => 5,
    'des' => <<"3229"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_troops' => 12
    }
};
get(1005051)-> #{
    'type' => 2,
    'des' => <<"3230"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101122
    ],
    'props' => #{
        'hero_general_hurt_inc_rate' => 0.01,
        'hero_generalist_hurt_inc_rate' => 0.01,
        'bingzhong_general_hurt_inc_rate' => 0.01,
        'bingzhong_generalist_hurt_inc_rate' => 0.01
    }
};
get(1005052)-> #{
    'type' => 5,
    'des' => <<"3229"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_troops' => 12
    }
};
get(1005061)-> #{
    'type' => 2,
    'des' => <<"3231"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101122
    ],
    'props' => #{
        'hero_civilian_hurt_inc_rate' => 0.01,
        'hero_general_hurt_inc_rate' => 0.01,
        'bingzhong_civilian_hurt_inc_rate' => 0.01,
        'bingzhong_general_hurt_inc_rate' => 0.01
    }
};
get(1005062)-> #{
    'type' => 5,
    'des' => <<"3229"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_troops' => 12
    }
};
get(1005071)-> #{
    'type' => 3,
    'des' => <<"3232"/utf8>>,
    'p1' => 201617,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 3,
        'hero_intelect' => 4,
        'hero_spirit' => 5
    }
};
get(1005072)-> #{
    'type' => 5,
    'des' => <<"3233"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_attack' => 15,
        'bingzhong_defence' => 8
    }
};
get(1005081)-> #{
    'type' => 3,
    'des' => <<"3234"/utf8>>,
    'p1' => 101120,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 5,
        'hero_spirit' => 4,
        'hero_leadership' => 7
    }
};
get(1005082)-> #{
    'type' => 5,
    'des' => <<"3235"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_attack' => 16,
        'bingzhong_defence' => 7
    }
};
get(1005091)-> #{
    'type' => 3,
    'des' => <<"3236"/utf8>>,
    'p1' => 201618,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 5,
        'hero_spirit' => 3,
        'hero_leadership' => 4
    }
};
get(1005092)-> #{
    'type' => 5,
    'des' => <<"3237"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_attack' => 21,
        'bingzhong_defence' => 12
    }
};
get(1005101)-> #{
    'type' => 3,
    'des' => <<"3238"/utf8>>,
    'p1' => 101121,
    'p2' => 15,
    'props' => #{
        'hero_strength' => 4,
        'hero_intelect' => 5,
        'hero_leadership' => 3
    }
};
get(1005102)-> #{
    'type' => 5,
    'des' => <<"3239"/utf8>>,
    'p2' => 1,
    'props' => #{
        'bingzhong_attack' => 14,
        'bingzhong_defence' => 9
    }
};
get(1005131)-> #{
    'type' => 7,
    'des' => <<"3240"/utf8>>
};
get(1005141)-> #{
    'type' => 7,
    'des' => <<"3240"/utf8>>
};
get(101011)-> #{
    'type' => 17,
    'des' => <<"3241"/utf8>>,
    'p2' => 12,
    'props' => #{
        'hero_hero_skill_hurt_inc_rate' => 0.2
    }
};
get(101021)-> #{
    'type' => 3,
    'des' => <<"3242"/utf8>>,
    'p1' => 101202,
    'p2' => 12,
    'props' => #{
        'hero_strength' => 1,
        'qianjun_base_attack' => 15
    }
};
get(101022)-> #{
    'type' => 17,
    'des' => <<"3241"/utf8>>,
    'p2' => 12,
    'props' => #{
        'hero_hero_skill_hurt_inc_rate' => 0.2
    }
};
get(101031)-> #{
    'type' => 10,
    'des' => <<"3243"/utf8>>,
    'p2' => 50,
    'props' => #{
        'hero_strength' => 1
    }
};
get(101032)-> #{
    'type' => 17,
    'des' => <<"3244"/utf8>>,
    'p2' => 12,
    'props' => #{
        'hero_strength' => 2
    }
};
get(101041)-> #{
    'type' => 20,
    'des' => <<"3245"/utf8>>,
    'p1' => 301,
    'props' => #{
        'hero_strength' => 1
    }
};
get(101042)-> #{
    'type' => 20,
    'des' => <<"3246"/utf8>>,
    'p1' => 301,
    'props' => #{
        'hero_spirit' => 1
    }
};
get(101051)-> #{
    'type' => 15,
    'des' => <<"3247"/utf8>>,
    'p2' => 100,
    'p_text' => [
        <<"hero_intelect"/utf8>>
    ],
    'props' => #{
        'bingzhong_attack' => 100,
        'bingzhong_troops' => 100
    }
};
get(101061)-> #{
    'type' => 9,
    'des' => <<"3248"/utf8>>,
    'p2' => 3,
    'props' => #{
        'hero_strength' => 3
    }
};
get(101071)-> #{
    'type' => 10,
    'des' => <<"3249"/utf8>>,
    'p2' => 50,
    'props' => #{
        'hero_spirit' => 1
    }
};
get(101072)-> #{
    'type' => 17,
    'des' => <<"3250"/utf8>>,
    'p2' => 12,
    'props' => #{
        'hero_spirit' => 2
    }
};
get(101081)-> #{
    'type' => 17,
    'des' => <<"3251"/utf8>>,
    'p2' => 12,
    'props' => #{
        'qianjun_troops' => 20,
        'houjun_troops' => 20
    }
};
get(101091)-> #{
    'type' => 10,
    'des' => <<"3252"/utf8>>,
    'p2' => 60,
    'props' => #{
        'hero_intelect' => 1
    }
};
get(101092)-> #{
    'type' => 17,
    'des' => <<"3253"/utf8>>,
    'p2' => 12,
    'props' => #{
        'hero_intelect' => 2
    }
};
get(101101)-> #{
    'type' => 10,
    'des' => <<"3254"/utf8>>,
    'p2' => 40,
    'props' => #{
        'hero_leadership' => 2
    }
};
get(101102)-> #{
    'type' => 17,
    'des' => <<"3255"/utf8>>,
    'p2' => 12,
    'props' => #{
        'hero_leadership' => 1
    }
};
get(101111)-> #{
    'type' => 4,
    'des' => <<"3256"/utf8>>,
    'p1' => 107004007,
    'props' => #{
        'houjun_troops_skill_hurt_inc_rate' => 0.1
    }
};
get(101112)-> #{
    'type' => 4,
    'des' => <<"3257"/utf8>>,
    'p1' => 107005004,
    'props' => #{
        'houjun_troops_skill_hurt_red_rate' => 0.2
    }
};
get(101121)-> #{
    'type' => 3,
    'des' => <<"3258"/utf8>>,
    'p1' => 201617,
    'p2' => 20,
    'props' => #{
        'hero_spirit' => 2
    }
};
get(101131)-> #{
    'type' => 3,
    'des' => <<"3259"/utf8>>,
    'p1' => 201608,
    'p2' => 6,
    'props' => #{
        'hero_leadership' => 1
    }
};
get(101132)-> #{
    'type' => 3,
    'des' => <<"3260"/utf8>>,
    'p1' => 201606,
    'p2' => 6,
    'props' => #{
        'hero_intelect' => 1
    }
};
get(101141)-> #{
    'type' => 20,
    'des' => <<"3261"/utf8>>,
    'props' => #{
        'hero_intelect' => 1
    }
};
get(101142)-> #{
    'type' => 18,
    'des' => <<"3262"/utf8>>,
    'p1' => 201606,
    'p2' => 5,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => -0.15
    }
};
get(101143)-> #{
    'type' => 17,
    'des' => <<"3251"/utf8>>,
    'props' => #{
        'qianjun_troops' => 70,
        'houjun_troops' => 70
    }
};
get(101151)-> #{
    'type' => 11,
    'des' => <<"3263"/utf8>>,
    'p_text' => [
        1,
         3
    ],
    'props' => #{
        'hero_spirit' => 1
    }
};
get(101152)-> #{
    'type' => 3,
    'des' => <<"3264"/utf8>>,
    'p1' => 201607,
    'p2' => 5,
    'props' => #{
        'bingzhong_troops' => 50
    }
};
get(101153)-> #{
    'type' => 11,
    'des' => <<"3265"/utf8>>,
    'p_text' => [
        1
    ],
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => 0.05
    }
};
get(101161)-> #{
    'type' => 4,
    'des' => <<"3266"/utf8>>,
    'p1' => 107005004,
    'props' => #{
        'qianjun_troops_skill_hurt_inc_rate' => 0.15
    }
};
get(101162)-> #{
    'type' => 4,
    'des' => <<"3267"/utf8>>,
    'p1' => 107003007,
    'props' => #{
        'qianjun_troops_skill_hurt_red_rate' => 0.2
    }
};
get(101171)-> #{
    'type' => 18,
    'des' => <<"3268"/utf8>>,
    'p1' => 201602,
    'p2' => 20,
    'props' => #{
        'hero_intelect' => -3,
        'hero_leadership' => -3
    }
};
get(101181)-> #{
    'type' => 4,
    'des' => <<"3269"/utf8>>,
    'p1' => 107003007,
    'props' => #{
        'hero_hero_skill_hurt_inc_rate' => 0.15
    }
};
get(101182)-> #{
    'type' => 4,
    'des' => <<"3270"/utf8>>,
    'p1' => 107004007,
    'props' => #{
        'bingzhong_hero_skill_hurt_red_rate' => 0.2
    }
};
get(101191)-> #{
    'type' => 8,
    'des' => <<"3271"/utf8>>,
    'p1' => 101,
    'p2' => 1,
    'props' => #{
        'qianjun_troops' => 20
    }
};
get(101201)-> #{
    'type' => 8,
    'des' => <<"3272"/utf8>>,
    'p1' => 101,
    'p2' => 1,
    'props' => #{
        'houjun_troops' => 20
    }
};
get(101211)-> #{
    'type' => 8,
    'des' => <<"3273"/utf8>>,
    'p1' => 101,
    'p2' => 1,
    'props' => #{
        'qianjun_troops' => 20
    }
};
get(101221)-> #{
    'type' => 8,
    'des' => <<"3274"/utf8>>,
    'p1' => 101,
    'p2' => 1,
    'props' => #{
        'houjun_troops' => 20
    }
};
get(101232)-> #{
    'type' => 8,
    'des' => <<"3275"/utf8>>,
    'p1' => 101,
    'p2' => 1,
    'props' => #{
        'qianjun_troops' => 20,
        'houjun_troops' => 20
    }
};
get(101241)-> #{
    'type' => 19,
    'des' => <<"3276"/utf8>>,
    'p1' => 102,
    'p2' => 1,
    'p3' => 100
};
get(101242)-> #{
    'type' => 19,
    'des' => <<"3277"/utf8>>,
    'p1' => 102,
    'p2' => 2,
    'p3' => 100
};
get(101243)-> #{
    'type' => 19,
    'des' => <<"3278"/utf8>>,
    'p1' => 102,
    'p2' => 3,
    'p3' => 100
};
get(101251)-> #{
    'type' => 2,
    'des' => <<"3279"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101112
    ],
    'props' => #{
        'qianjun_attack' => 20
    }
};
get(101261)-> #{
    'type' => 2,
    'des' => <<"3280"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101103
    ],
    'props' => #{
        'houjun_defence' => 20
    }
};
get(101271)-> #{
    'type' => 2,
    'des' => <<"3281"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101102
    ],
    'props' => #{
        'qianjun_attack' => 30
    }
};
get(101281)-> #{
    'type' => 2,
    'des' => <<"3282"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101101
    ],
    'props' => #{
        'houjun_defence' => 30
    }
};
get(101291)-> #{
    'type' => 8,
    'des' => <<"3283"/utf8>>,
    'p1' => 104,
    'p2' => 1,
    'props' => #{
        'bingzhong_troops' => 50
    }
};
get(101301)-> #{
    'type' => 4,
    'des' => <<"3284"/utf8>>,
    'p1' => 107002105,
    'props' => #{
        'hero_strength' => 4
    }
};
get(101302)-> #{
    'type' => 2,
    'des' => <<"3285"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101303,
         101203
    ],
    'props' => #{
        'bingzhong_troops' => 40
    }
};
get(101303)-> #{
    'type' => 1,
    'des' => <<"3286"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_strength"/utf8>>
    ],
    'props' => #{
        'bingzhong_attack' => 3
    }
};
get(101311)-> #{
    'type' => 4,
    'des' => <<"3287"/utf8>>,
    'p1' => 107003105,
    'props' => #{
        'hero_leadership' => 4
    }
};
get(101312)-> #{
    'type' => 1,
    'des' => <<"3288"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_leadership"/utf8>>
    ],
    'props' => #{
        'bingzhong_troops' => 4
    }
};
get(101321)-> #{
    'type' => 4,
    'des' => <<"3289"/utf8>>,
    'p1' => 107004105,
    'props' => #{
        'hero_intelect' => 4
    }
};
get(101322)-> #{
    'type' => 2,
    'des' => <<"3290"/utf8>>,
    'p2' => 1,
    'p_text' => [
        101403,
         101503
    ],
    'props' => #{
        'houjun_troops' => 40
    }
};
get(101323)-> #{
    'type' => 1,
    'des' => <<"3291"/utf8>>,
    'p2' => 20,
    'p_text' => [
        <<"hero_intelect"/utf8>>
    ],
    'props' => #{
        'bingzhong_speed' => 1
    }
};
get(101331)-> #{
    'type' => 4,
    'des' => <<"3292"/utf8>>,
    'p1' => 107001105,
    'props' => #{
        'hero_spirit' => 4
    }
};
get(101332)-> #{
    'type' => 1,
    'des' => <<"3293"/utf8>>,
    'p2' => 1,
    'p_text' => [
        <<"hero_spirit"/utf8>>
    ],
    'props' => #{
        'bingzhong_defence' => 3
    }
};
get(101341)-> #{
    'type' => 8,
    'des' => <<"3294"/utf8>>,
    'p1' => 105,
    'p2' => 2,
    'props' => #{
        'hero_spirit' => 3,
        'hero_leadership' => 3
    }
};
get(101342)-> #{
    'type' => 8,
    'des' => <<"3295"/utf8>>,
    'p1' => 105,
    'p2' => 4,
    'props' => #{
        'hero_strength' => 3,
        'hero_intelect' => 3
    }
};
get(101351)-> #{
    'type' => 4,
    'des' => <<"3296"/utf8>>,
    'p1' => 107001106,
    'props' => #{
        'qianjun_defence' => 1000
    }
};
get(101361)-> #{
    'type' => 4,
    'des' => <<"3297"/utf8>>,
    'p1' => 107002106,
    'props' => #{
        'qianjun_troops' => 1500
    }
};
get(101371)-> #{
    'type' => 4,
    'des' => <<"3298"/utf8>>,
    'p1' => 107003106,
    'props' => #{
        'bingzhong_troops' => 750,
        'bingzhong_defence' => 500
    }
};

get(_N) -> false.
get_list() ->
	[1001051,1001151,1002021,1002022,1002031,1002032,1002041,1002051,1002052,1002061,1002062,1002063,1002071,1002081,1002091,1002101,1002102,1002103,1002121,1002122,1002131,1002132,1002141,1002151,1003011,1003021,1003022,1003031,1003032,1003041,1003042,1003043,1003044,1003045,1003051,1003061,1003071,1003072,1003081,1003091,1003092,1003101,1003102,1003103,1003104,1003111,1003112,1003113,1003114,1003121,1003122,1003123,1003124,1003131,1003132,1003133,1003141,1003142,1003143,1003144,1003151,1003152,1003153,1003161,1003162,1003163,1003181,1004011,1004021,1004031,1004032,1004033,1004041,1004042,1004051,1004052,1004053,1004061,1004062,1004071,1004072,1004073,1004081,1004082,1004083,1004091,1004092,1004093,1004101,1004102,1004103,1004111,1004112,1004121,1004122,1004131,1004132,1004133,1004141,1004142,1004143,1004151,1004152,1004153,1005011,1005012,1005021,1005031,1005032,1005041,1005042,1005051,1005052,1005061,1005062,1005071,1005072,1005081,1005082,1005091,1005092,1005101,1005102,1005131,1005141,101011,101021,101022,101031,101032,101041,101042,101051,101061,101071,101072,101081,101091,101092,101101,101102,101111,101112,101121,101131,101132,101141,101142,101143,101151,101152,101153,101161,101162,101171,101181,101182,101191,101201,101211,101221,101232,101241,101242,101243,101251,101261,101271,101281,101291,101301,101302,101303,101311,101312,101321,101322,101323,101331,101332,101341,101342,101351,101361,101371].
