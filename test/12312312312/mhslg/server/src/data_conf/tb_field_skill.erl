%%--- coding:utf-8 ---
-module(tb_field_skill).
-export([get/1,get_list/0]).
get(100101001)-> #{
    'group' => 100101,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 0,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'trigger_hero_distance' => 0,
    'active_rand' => 1.0,
    'first_time' => 500,
    'cooling_time' => 400,
    'target_object' => 1,
    'skill_distance' => 40,
    'mix_unit' => 1,
    'max_unit' => 2,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0
};
get(100201001)-> #{
    'group' => 100201,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 0,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'trigger_hero_distance' => 0,
    'active_rand' => 1.0,
    'first_time' => 500,
    'cooling_time' => 400,
    'target_object' => 1,
    'skill_distance' => 40,
    'mix_unit' => 1,
    'max_unit' => 2,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0
};
get(100301001)-> #{
    'group' => 100301,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 0,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'trigger_hero_distance' => 0,
    'active_rand' => 1.0,
    'first_time' => 500,
    'cooling_time' => 400,
    'target_object' => 1,
    'skill_distance' => 80,
    'mix_unit' => 2,
    'max_unit' => 2,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0
};
get(100401001)-> #{
    'group' => 100401,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 0,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'trigger_hero_distance' => 0,
    'active_rand' => 1.0,
    'first_time' => 500,
    'cooling_time' => 400,
    'target_object' => 1,
    'skill_distance' => 80,
    'mix_unit' => 2,
    'max_unit' => 2,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0
};
get(101101001)-> #{
    'group' => 101101,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.15,
    'skill_hurt_r' => 1.15,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101002)-> #{
    'group' => 101101,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.21,
    'skill_hurt_r' => 1.21,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101003)-> #{
    'group' => 101101,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.27,
    'skill_hurt_r' => 1.27,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101004)-> #{
    'group' => 101101,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.33,
    'skill_hurt_r' => 1.33,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101005)-> #{
    'group' => 101101,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.39,
    'skill_hurt_r' => 1.39,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101006)-> #{
    'group' => 101101,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.45,
    'skill_hurt_r' => 1.45,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101007)-> #{
    'group' => 101101,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.51,
    'skill_hurt_r' => 1.51,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101008)-> #{
    'group' => 101101,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.57,
    'skill_hurt_r' => 1.57,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101009)-> #{
    'group' => 101101,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.63,
    'skill_hurt_r' => 1.63,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101010)-> #{
    'group' => 101101,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.69,
    'skill_hurt_r' => 1.69,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101011)-> #{
    'group' => 101101,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.75,
    'skill_hurt_r' => 1.75,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 805.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101012)-> #{
    'group' => 101101,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.81,
    'skill_hurt_r' => 1.81,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 875.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101013)-> #{
    'group' => 101101,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.87,
    'skill_hurt_r' => 1.87,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101014)-> #{
    'group' => 101101,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.93,
    'skill_hurt_r' => 1.93,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101015)-> #{
    'group' => 101101,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.99,
    'skill_hurt_r' => 1.99,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101016)-> #{
    'group' => 101101,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.05,
    'skill_hurt_r' => 2.05,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101017)-> #{
    'group' => 101101,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.11,
    'skill_hurt_r' => 2.11,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101018)-> #{
    'group' => 101101,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.17,
    'skill_hurt_r' => 2.17,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101019)-> #{
    'group' => 101101,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.23,
    'skill_hurt_r' => 2.23,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101020)-> #{
    'group' => 101101,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.29,
    'skill_hurt_r' => 2.29,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101021)-> #{
    'group' => 101101,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.35,
    'skill_hurt_r' => 2.35,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101022)-> #{
    'group' => 101101,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.41,
    'skill_hurt_r' => 2.41,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101023)-> #{
    'group' => 101101,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.47,
    'skill_hurt_r' => 2.47,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101024)-> #{
    'group' => 101101,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.53,
    'skill_hurt_r' => 2.53,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101025)-> #{
    'group' => 101101,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.59,
    'skill_hurt_r' => 2.59,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101026)-> #{
    'group' => 101101,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.65,
    'skill_hurt_r' => 2.65,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101027)-> #{
    'group' => 101101,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.71,
    'skill_hurt_r' => 2.71,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101028)-> #{
    'group' => 101101,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.77,
    'skill_hurt_r' => 2.77,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101029)-> #{
    'group' => 101101,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.83,
    'skill_hurt_r' => 2.83,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101101030)-> #{
    'group' => 101101,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.89,
    'skill_hurt_r' => 2.89,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 0.25
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 1,
            'value' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102001)-> #{
    'group' => 101102,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.16,
    'skill_hurt_r' => 0.4,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102002)-> #{
    'group' => 101102,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.165,
    'skill_hurt_r' => 0.42,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102003)-> #{
    'group' => 101102,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.17,
    'skill_hurt_r' => 0.44,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102004)-> #{
    'group' => 101102,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.175,
    'skill_hurt_r' => 0.46,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102005)-> #{
    'group' => 101102,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.18,
    'skill_hurt_r' => 0.48,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102006)-> #{
    'group' => 101102,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.185,
    'skill_hurt_r' => 0.5,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102007)-> #{
    'group' => 101102,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.19,
    'skill_hurt_r' => 0.52,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102008)-> #{
    'group' => 101102,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.195,
    'skill_hurt_r' => 0.54,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102009)-> #{
    'group' => 101102,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.2,
    'skill_hurt_r' => 0.56,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102010)-> #{
    'group' => 101102,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.205,
    'skill_hurt_r' => 0.58,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102011)-> #{
    'group' => 101102,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.21,
    'skill_hurt_r' => 0.6,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102012)-> #{
    'group' => 101102,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.215,
    'skill_hurt_r' => 0.62,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102013)-> #{
    'group' => 101102,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.22,
    'skill_hurt_r' => 0.64,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102014)-> #{
    'group' => 101102,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.225,
    'skill_hurt_r' => 0.66,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102015)-> #{
    'group' => 101102,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.23,
    'skill_hurt_r' => 0.679999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102016)-> #{
    'group' => 101102,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.235,
    'skill_hurt_r' => 0.699999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102017)-> #{
    'group' => 101102,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.24,
    'skill_hurt_r' => 0.719999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102018)-> #{
    'group' => 101102,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.245,
    'skill_hurt_r' => 0.739999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102019)-> #{
    'group' => 101102,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.25,
    'skill_hurt_r' => 0.759999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102020)-> #{
    'group' => 101102,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.255,
    'skill_hurt_r' => 0.779999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102021)-> #{
    'group' => 101102,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.26,
    'skill_hurt_r' => 0.799999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102022)-> #{
    'group' => 101102,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.265,
    'skill_hurt_r' => 0.819999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102023)-> #{
    'group' => 101102,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.27,
    'skill_hurt_r' => 0.839999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102024)-> #{
    'group' => 101102,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.275,
    'skill_hurt_r' => 0.859999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102025)-> #{
    'group' => 101102,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.28,
    'skill_hurt_r' => 0.879999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102026)-> #{
    'group' => 101102,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.285,
    'skill_hurt_r' => 0.899999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102027)-> #{
    'group' => 101102,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.29,
    'skill_hurt_r' => 0.919999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102028)-> #{
    'group' => 101102,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.295,
    'skill_hurt_r' => 0.939999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102029)-> #{
    'group' => 101102,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.3,
    'skill_hurt_r' => 0.959999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101102030)-> #{
    'group' => 101102,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.305,
    'skill_hurt_r' => 0.979999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.08
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103001)-> #{
    'group' => 101103,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.55,
    'skill_hurt_r' => 0.8,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103002)-> #{
    'group' => 101103,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.57,
    'skill_hurt_r' => 0.84,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103003)-> #{
    'group' => 101103,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.59,
    'skill_hurt_r' => 0.88,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103004)-> #{
    'group' => 101103,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.61,
    'skill_hurt_r' => 0.92,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103005)-> #{
    'group' => 101103,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.63,
    'skill_hurt_r' => 0.96,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103006)-> #{
    'group' => 101103,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.65,
    'skill_hurt_r' => 1.0,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103007)-> #{
    'group' => 101103,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.669999999999999,
    'skill_hurt_r' => 1.04,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103008)-> #{
    'group' => 101103,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.689999999999999,
    'skill_hurt_r' => 1.08,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103009)-> #{
    'group' => 101103,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.709999999999999,
    'skill_hurt_r' => 1.12,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103010)-> #{
    'group' => 101103,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.729999999999999,
    'skill_hurt_r' => 1.16,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103011)-> #{
    'group' => 101103,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.749999999999999,
    'skill_hurt_r' => 1.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103012)-> #{
    'group' => 101103,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 0.769999999999999,
    'skill_hurt_r' => 1.24,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103013)-> #{
    'group' => 101103,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.789999999999999,
    'skill_hurt_r' => 1.28,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103014)-> #{
    'group' => 101103,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.809999999999999,
    'skill_hurt_r' => 1.32,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103015)-> #{
    'group' => 101103,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.829999999999999,
    'skill_hurt_r' => 1.36,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103016)-> #{
    'group' => 101103,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.849999999999999,
    'skill_hurt_r' => 1.4,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103017)-> #{
    'group' => 101103,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.869999999999999,
    'skill_hurt_r' => 1.44,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103018)-> #{
    'group' => 101103,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.889999999999998,
    'skill_hurt_r' => 1.48,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103019)-> #{
    'group' => 101103,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.909999999999998,
    'skill_hurt_r' => 1.52,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103020)-> #{
    'group' => 101103,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.929999999999998,
    'skill_hurt_r' => 1.56,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103021)-> #{
    'group' => 101103,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.949999999999998,
    'skill_hurt_r' => 1.6,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103022)-> #{
    'group' => 101103,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.969999999999998,
    'skill_hurt_r' => 1.64,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103023)-> #{
    'group' => 101103,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.989999999999998,
    'skill_hurt_r' => 1.68,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103024)-> #{
    'group' => 101103,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.01,
    'skill_hurt_r' => 1.72,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103025)-> #{
    'group' => 101103,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.03,
    'skill_hurt_r' => 1.76,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103026)-> #{
    'group' => 101103,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.05,
    'skill_hurt_r' => 1.8,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103027)-> #{
    'group' => 101103,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.84,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103028)-> #{
    'group' => 101103,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.09,
    'skill_hurt_r' => 1.88,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103029)-> #{
    'group' => 101103,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.11,
    'skill_hurt_r' => 1.92,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101103030)-> #{
    'group' => 101103,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.13,
    'skill_hurt_r' => 1.96,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104001)-> #{
    'group' => 101104,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104002)-> #{
    'group' => 101104,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.055,
    'skill_hurt_r' => 1.055,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104003)-> #{
    'group' => 101104,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.11,
    'skill_hurt_r' => 1.11,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104004)-> #{
    'group' => 101104,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.165,
    'skill_hurt_r' => 1.165,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104005)-> #{
    'group' => 101104,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.22,
    'skill_hurt_r' => 1.22,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104006)-> #{
    'group' => 101104,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.275,
    'skill_hurt_r' => 1.275,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104007)-> #{
    'group' => 101104,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.33,
    'skill_hurt_r' => 1.33,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104008)-> #{
    'group' => 101104,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.385,
    'skill_hurt_r' => 1.385,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104009)-> #{
    'group' => 101104,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.44,
    'skill_hurt_r' => 1.44,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104010)-> #{
    'group' => 101104,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.495,
    'skill_hurt_r' => 1.495,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104011)-> #{
    'group' => 101104,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.55,
    'skill_hurt_r' => 1.55,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 805.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104012)-> #{
    'group' => 101104,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.605,
    'skill_hurt_r' => 1.605,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 875.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104013)-> #{
    'group' => 101104,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.66,
    'skill_hurt_r' => 1.66,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104014)-> #{
    'group' => 101104,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.715,
    'skill_hurt_r' => 1.715,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104015)-> #{
    'group' => 101104,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.77,
    'skill_hurt_r' => 1.77,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104016)-> #{
    'group' => 101104,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.825,
    'skill_hurt_r' => 1.825,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104017)-> #{
    'group' => 101104,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.88,
    'skill_hurt_r' => 1.88,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104018)-> #{
    'group' => 101104,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.935,
    'skill_hurt_r' => 1.935,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104019)-> #{
    'group' => 101104,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.99,
    'skill_hurt_r' => 1.99,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104020)-> #{
    'group' => 101104,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.045,
    'skill_hurt_r' => 2.045,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104021)-> #{
    'group' => 101104,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.1,
    'skill_hurt_r' => 2.1,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104022)-> #{
    'group' => 101104,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.155,
    'skill_hurt_r' => 2.155,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104023)-> #{
    'group' => 101104,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.21,
    'skill_hurt_r' => 2.21,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104024)-> #{
    'group' => 101104,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.265,
    'skill_hurt_r' => 2.265,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104025)-> #{
    'group' => 101104,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.32,
    'skill_hurt_r' => 2.32,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104026)-> #{
    'group' => 101104,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.375,
    'skill_hurt_r' => 2.375,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104027)-> #{
    'group' => 101104,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.43,
    'skill_hurt_r' => 2.43,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104028)-> #{
    'group' => 101104,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.485,
    'skill_hurt_r' => 2.485,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104029)-> #{
    'group' => 101104,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.54,
    'skill_hurt_r' => 2.54,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101104030)-> #{
    'group' => 101104,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.595,
    'skill_hurt_r' => 2.595,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.25
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1001001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105001)-> #{
    'group' => 101105,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105002)-> #{
    'group' => 101105,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.25,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105003)-> #{
    'group' => 101105,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.3,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105004)-> #{
    'group' => 101105,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.35,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105005)-> #{
    'group' => 101105,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.4,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105006)-> #{
    'group' => 101105,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.45,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105007)-> #{
    'group' => 101105,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.5,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105008)-> #{
    'group' => 101105,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.55,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105009)-> #{
    'group' => 101105,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.6,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105010)-> #{
    'group' => 101105,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.65,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105011)-> #{
    'group' => 101105,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.7,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 805.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105012)-> #{
    'group' => 101105,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.75,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 875.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105013)-> #{
    'group' => 101105,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.8,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105014)-> #{
    'group' => 101105,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.85,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105015)-> #{
    'group' => 101105,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.9,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105016)-> #{
    'group' => 101105,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 1.95,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105017)-> #{
    'group' => 101105,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.0,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105018)-> #{
    'group' => 101105,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.05,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105019)-> #{
    'group' => 101105,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.1,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105020)-> #{
    'group' => 101105,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.15,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105021)-> #{
    'group' => 101105,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105022)-> #{
    'group' => 101105,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.25,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105023)-> #{
    'group' => 101105,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.3,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105024)-> #{
    'group' => 101105,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.35,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105025)-> #{
    'group' => 101105,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.4,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105026)-> #{
    'group' => 101105,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.45,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105027)-> #{
    'group' => 101105,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.5,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105028)-> #{
    'group' => 101105,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.55,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105029)-> #{
    'group' => 101105,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.6,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101105030)-> #{
    'group' => 101105,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.1,
    'skill_hurt_r' => 2.65,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106001)-> #{
    'group' => 101106,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.9,
    'skill_hurt_r' => 0.9,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 0.9,
            'skill_hurt_r' => 0.9,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106002)-> #{
    'group' => 101106,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.955,
    'skill_hurt_r' => 0.955,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 0.955,
            'skill_hurt_r' => 0.955,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106003)-> #{
    'group' => 101106,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.01,
    'skill_hurt_r' => 1.01,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.01,
            'skill_hurt_r' => 1.01,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106004)-> #{
    'group' => 101106,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.065,
    'skill_hurt_r' => 1.065,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.065,
            'skill_hurt_r' => 1.065,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106005)-> #{
    'group' => 101106,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.12,
    'skill_hurt_r' => 1.12,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.12,
            'skill_hurt_r' => 1.12,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106006)-> #{
    'group' => 101106,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.175,
    'skill_hurt_r' => 1.175,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.175,
            'skill_hurt_r' => 1.175,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106007)-> #{
    'group' => 101106,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.23,
    'skill_hurt_r' => 1.23,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.23,
            'skill_hurt_r' => 1.23,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106008)-> #{
    'group' => 101106,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.285,
    'skill_hurt_r' => 1.285,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.285,
            'skill_hurt_r' => 1.285,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106009)-> #{
    'group' => 101106,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.34,
    'skill_hurt_r' => 1.34,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.34,
            'skill_hurt_r' => 1.34,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106010)-> #{
    'group' => 101106,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.395,
    'skill_hurt_r' => 1.395,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.395,
            'skill_hurt_r' => 1.395,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106011)-> #{
    'group' => 101106,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.45,
    'skill_hurt_r' => 1.45,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.45,
            'skill_hurt_r' => 1.45,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106012)-> #{
    'group' => 101106,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.505,
    'skill_hurt_r' => 1.505,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.505,
            'skill_hurt_r' => 1.505,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106013)-> #{
    'group' => 101106,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.56,
            'skill_hurt_r' => 1.56,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106014)-> #{
    'group' => 101106,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.615,
    'skill_hurt_r' => 1.615,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.615,
            'skill_hurt_r' => 1.615,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106015)-> #{
    'group' => 101106,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.67,
    'skill_hurt_r' => 1.67,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.67,
            'skill_hurt_r' => 1.67,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106016)-> #{
    'group' => 101106,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.725,
    'skill_hurt_r' => 1.725,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.725,
            'skill_hurt_r' => 1.725,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106017)-> #{
    'group' => 101106,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.78,
    'skill_hurt_r' => 1.78,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.78,
            'skill_hurt_r' => 1.78,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106018)-> #{
    'group' => 101106,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.835,
    'skill_hurt_r' => 1.835,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.835,
            'skill_hurt_r' => 1.835,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106019)-> #{
    'group' => 101106,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.89,
    'skill_hurt_r' => 1.89,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.89,
            'skill_hurt_r' => 1.89,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106020)-> #{
    'group' => 101106,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 1.945,
    'skill_hurt_r' => 1.945,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 1.945,
            'skill_hurt_r' => 1.945,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106021)-> #{
    'group' => 101106,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.0,
    'skill_hurt_r' => 2.0,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2,
            'skill_hurt_r' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106022)-> #{
    'group' => 101106,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.055,
    'skill_hurt_r' => 2.055,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.055,
            'skill_hurt_r' => 2.055,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106023)-> #{
    'group' => 101106,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.11,
    'skill_hurt_r' => 2.11,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.11,
            'skill_hurt_r' => 2.11,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106024)-> #{
    'group' => 101106,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.165,
    'skill_hurt_r' => 2.165,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.165,
            'skill_hurt_r' => 2.165,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106025)-> #{
    'group' => 101106,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.22,
    'skill_hurt_r' => 2.22,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.22,
            'skill_hurt_r' => 2.22,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106026)-> #{
    'group' => 101106,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.275,
    'skill_hurt_r' => 2.275,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.275,
            'skill_hurt_r' => 2.275,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106027)-> #{
    'group' => 101106,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.33,
    'skill_hurt_r' => 2.33,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.33,
            'skill_hurt_r' => 2.33,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106028)-> #{
    'group' => 101106,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.385,
    'skill_hurt_r' => 2.385,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.385,
            'skill_hurt_r' => 2.385,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106029)-> #{
    'group' => 101106,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.44,
    'skill_hurt_r' => 2.44,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.44,
            'skill_hurt_r' => 2.44,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101106030)-> #{
    'group' => 101106,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 2.495,
    'skill_hurt_r' => 2.495,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 5,
            'condition_type' => 3,
            'condition_value' => 1,
            'target_object' => 1,
            'target' => 5,
            'skill_hurt_l' => 2.495,
            'skill_hurt_r' => 2.495,
            'hurt_times' => 1
        },
         #{
            'effect' => 1005,
            'value' => 0.1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107001)-> #{
    'group' => 101107,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013001,
                 1014001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107002)-> #{
    'group' => 101107,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013002,
                 1014002
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107003)-> #{
    'group' => 101107,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013003,
                 1014003
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107004)-> #{
    'group' => 101107,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013004,
                 1014004
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107005)-> #{
    'group' => 101107,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013005,
                 1014005
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107006)-> #{
    'group' => 101107,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013006,
                 1014006
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107007)-> #{
    'group' => 101107,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013007,
                 1014007
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107008)-> #{
    'group' => 101107,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013008,
                 1014008
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107009)-> #{
    'group' => 101107,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013009,
                 1014009
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107010)-> #{
    'group' => 101107,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013010,
                 1014010
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107011)-> #{
    'group' => 101107,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013011,
                 1014011
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107012)-> #{
    'group' => 101107,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013012,
                 1014012
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107013)-> #{
    'group' => 101107,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013013,
                 1014013,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107014)-> #{
    'group' => 101107,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013014,
                 1014014,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107015)-> #{
    'group' => 101107,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013015,
                 1014015,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107016)-> #{
    'group' => 101107,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013016,
                 1014016,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107017)-> #{
    'group' => 101107,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013017,
                 1014017,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107018)-> #{
    'group' => 101107,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013018,
                 1014018,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107019)-> #{
    'group' => 101107,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013019,
                 1014019,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107020)-> #{
    'group' => 101107,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013020,
                 1014020,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107021)-> #{
    'group' => 101107,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013021,
                 1014021,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107022)-> #{
    'group' => 101107,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013022,
                 1014022,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107023)-> #{
    'group' => 101107,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013023,
                 1014023,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107024)-> #{
    'group' => 101107,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013024,
                 1014024,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107025)-> #{
    'group' => 101107,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013025,
                 1014025,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107026)-> #{
    'group' => 101107,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013026,
                 1014026,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107027)-> #{
    'group' => 101107,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013027,
                 1014027,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107028)-> #{
    'group' => 101107,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013028,
                 1014028,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107029)-> #{
    'group' => 101107,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013029,
                 1014029,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101107030)-> #{
    'group' => 101107,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1013030,
                 1014030,
                 1012001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1010001,
                 1011001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108001)-> #{
    'group' => 101108,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.79,
    'skill_hurt_r' => 0.79,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108002)-> #{
    'group' => 101108,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.83,
    'skill_hurt_r' => 0.83,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108003)-> #{
    'group' => 101108,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.87,
    'skill_hurt_r' => 0.87,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108004)-> #{
    'group' => 101108,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.91,
    'skill_hurt_r' => 0.91,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108005)-> #{
    'group' => 101108,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.95,
    'skill_hurt_r' => 0.95,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108006)-> #{
    'group' => 101108,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.99,
    'skill_hurt_r' => 0.99,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108007)-> #{
    'group' => 101108,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.03,
    'skill_hurt_r' => 1.03,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108008)-> #{
    'group' => 101108,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.07,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108009)-> #{
    'group' => 101108,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.11,
    'skill_hurt_r' => 1.11,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108010)-> #{
    'group' => 101108,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.15,
    'skill_hurt_r' => 1.15,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108011)-> #{
    'group' => 101108,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.19,
    'skill_hurt_r' => 1.19,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108012)-> #{
    'group' => 101108,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.23,
    'skill_hurt_r' => 1.23,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108013)-> #{
    'group' => 101108,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.27,
    'skill_hurt_r' => 1.27,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108014)-> #{
    'group' => 101108,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.31,
    'skill_hurt_r' => 1.31,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108015)-> #{
    'group' => 101108,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.35,
    'skill_hurt_r' => 1.35,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108016)-> #{
    'group' => 101108,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.39,
    'skill_hurt_r' => 1.39,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108017)-> #{
    'group' => 101108,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.43,
    'skill_hurt_r' => 1.43,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108018)-> #{
    'group' => 101108,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.47,
    'skill_hurt_r' => 1.47,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108019)-> #{
    'group' => 101108,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.51,
    'skill_hurt_r' => 1.51,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108020)-> #{
    'group' => 101108,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.55,
    'skill_hurt_r' => 1.55,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108021)-> #{
    'group' => 101108,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.59,
    'skill_hurt_r' => 1.59,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108022)-> #{
    'group' => 101108,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.63,
    'skill_hurt_r' => 1.63,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108023)-> #{
    'group' => 101108,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.67,
    'skill_hurt_r' => 1.67,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108024)-> #{
    'group' => 101108,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.71,
    'skill_hurt_r' => 1.71,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108025)-> #{
    'group' => 101108,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.75,
    'skill_hurt_r' => 1.75,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108026)-> #{
    'group' => 101108,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.79,
    'skill_hurt_r' => 1.79,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108027)-> #{
    'group' => 101108,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.83,
    'skill_hurt_r' => 1.83,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108028)-> #{
    'group' => 101108,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.87,
    'skill_hurt_r' => 1.87,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108029)-> #{
    'group' => 101108,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.91,
    'skill_hurt_r' => 1.91,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101108030)-> #{
    'group' => 101108,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.95,
    'skill_hurt_r' => 1.95,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.35,
            'value' => 0
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101109001)-> #{
    'group' => 101109,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 95.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109002)-> #{
    'group' => 101109,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015002
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 190.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109003)-> #{
    'group' => 101109,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015003
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 285.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109004)-> #{
    'group' => 101109,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015004
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109005)-> #{
    'group' => 101109,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015005
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 475.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109006)-> #{
    'group' => 101109,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015006
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109007)-> #{
    'group' => 101109,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015007
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 665.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109008)-> #{
    'group' => 101109,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015008
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 760.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109009)-> #{
    'group' => 101109,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015009
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109010)-> #{
    'group' => 101109,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015010
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 950.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109011)-> #{
    'group' => 101109,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015011
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1045.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109012)-> #{
    'group' => 101109,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015012
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1140.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109013)-> #{
    'group' => 101109,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015013
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 1,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1290.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109014)-> #{
    'group' => 101109,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015014
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1385.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109015)-> #{
    'group' => 101109,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015015
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1480.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109016)-> #{
    'group' => 101109,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015016
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109017)-> #{
    'group' => 101109,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015017
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1670.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109018)-> #{
    'group' => 101109,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015018
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1765.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109019)-> #{
    'group' => 101109,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015019
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1860.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109020)-> #{
    'group' => 101109,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015020
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1955.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109021)-> #{
    'group' => 101109,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015021
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109022)-> #{
    'group' => 101109,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015022
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2145.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109023)-> #{
    'group' => 101109,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015023
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109024)-> #{
    'group' => 101109,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015024
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2335.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109025)-> #{
    'group' => 101109,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015025
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2430.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109026)-> #{
    'group' => 101109,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015026
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2525.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109027)-> #{
    'group' => 101109,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015027
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2620.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109028)-> #{
    'group' => 101109,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015028
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2715.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109029)-> #{
    'group' => 101109,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015029
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2810.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101109030)-> #{
    'group' => 101109,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.75,
    'skill_hurt_r' => 0.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1015030
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.2
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.4,
            'buff_list' => [
                1002001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2905.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110001)-> #{
    'group' => 101110,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 95.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110002)-> #{
    'group' => 101110,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017002
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 190.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110003)-> #{
    'group' => 101110,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017003
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 285.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110004)-> #{
    'group' => 101110,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017004
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110005)-> #{
    'group' => 101110,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017005
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 475.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110006)-> #{
    'group' => 101110,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017006
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110007)-> #{
    'group' => 101110,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017007
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 665.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110008)-> #{
    'group' => 101110,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017008
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 760.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110009)-> #{
    'group' => 101110,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017009
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110010)-> #{
    'group' => 101110,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017010
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 950.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110011)-> #{
    'group' => 101110,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017011
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1045.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110012)-> #{
    'group' => 101110,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1017012
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1140.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110013)-> #{
    'group' => 101110,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017013
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1290.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110014)-> #{
    'group' => 101110,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017014
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1385.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110015)-> #{
    'group' => 101110,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017015
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1480.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110016)-> #{
    'group' => 101110,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017016
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110017)-> #{
    'group' => 101110,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017017
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1670.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110018)-> #{
    'group' => 101110,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017018
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1765.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110019)-> #{
    'group' => 101110,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017019
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1860.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110020)-> #{
    'group' => 101110,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017020
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1955.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110021)-> #{
    'group' => 101110,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017021
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110022)-> #{
    'group' => 101110,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017022
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2145.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110023)-> #{
    'group' => 101110,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017023
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110024)-> #{
    'group' => 101110,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017024
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2335.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110025)-> #{
    'group' => 101110,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017025
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2430.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110026)-> #{
    'group' => 101110,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017026
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2525.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110027)-> #{
    'group' => 101110,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017027
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2620.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110028)-> #{
    'group' => 101110,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017028
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2715.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110029)-> #{
    'group' => 101110,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017029
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2810.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101110030)-> #{
    'group' => 101110,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1016001,
                 1017030
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2905.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111001)-> #{
    'group' => 101111,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 95.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111002)-> #{
    'group' => 101111,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019002
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 190.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111003)-> #{
    'group' => 101111,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019003
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 285.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111004)-> #{
    'group' => 101111,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019004
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111005)-> #{
    'group' => 101111,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019005
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 475.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111006)-> #{
    'group' => 101111,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019006
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111007)-> #{
    'group' => 101111,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019007
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 665.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111008)-> #{
    'group' => 101111,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019008
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 760.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111009)-> #{
    'group' => 101111,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019009
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111010)-> #{
    'group' => 101111,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019010
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 950.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111011)-> #{
    'group' => 101111,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019011
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1045.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111012)-> #{
    'group' => 101111,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019012
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1140.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111013)-> #{
    'group' => 101111,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019013
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1290.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111014)-> #{
    'group' => 101111,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019014
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1385.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111015)-> #{
    'group' => 101111,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019015
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1480.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111016)-> #{
    'group' => 101111,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019016
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111017)-> #{
    'group' => 101111,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019017
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1670.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111018)-> #{
    'group' => 101111,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019018
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1765.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111019)-> #{
    'group' => 101111,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019019
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1860.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111020)-> #{
    'group' => 101111,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019020
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1955.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111021)-> #{
    'group' => 101111,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019021
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111022)-> #{
    'group' => 101111,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019022
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2145.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111023)-> #{
    'group' => 101111,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019023
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111024)-> #{
    'group' => 101111,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019024
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2335.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111025)-> #{
    'group' => 101111,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019025
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2430.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111026)-> #{
    'group' => 101111,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019026
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2525.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111027)-> #{
    'group' => 101111,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019027
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2620.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111028)-> #{
    'group' => 101111,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019028
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2715.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111029)-> #{
    'group' => 101111,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019029
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2810.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101111030)-> #{
    'group' => 101111,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.35,
    'skill_hurt_r' => 0.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1019030
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 1,
            'active_time' => 1,
            'buff_list' => [
                1018001
            ]
        },
         #{
            'effect' => 1009,
            'condition' => 4,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'buff_type' => 1,
            'value' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 3,
            'percent' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2905.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112001)-> #{
    'group' => 101112,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.7,
    'skill_hurt_r' => 0.7,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 95.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112002)-> #{
    'group' => 101112,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.735,
    'skill_hurt_r' => 0.735,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 190.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112003)-> #{
    'group' => 101112,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.77,
    'skill_hurt_r' => 0.77,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 285.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112004)-> #{
    'group' => 101112,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.805,
    'skill_hurt_r' => 0.805,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112005)-> #{
    'group' => 101112,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.84,
    'skill_hurt_r' => 0.84,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 475.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112006)-> #{
    'group' => 101112,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.875,
    'skill_hurt_r' => 0.875,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112007)-> #{
    'group' => 101112,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.91,
    'skill_hurt_r' => 0.91,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 665.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112008)-> #{
    'group' => 101112,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.945,
    'skill_hurt_r' => 0.945,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 760.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112009)-> #{
    'group' => 101112,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.98,
    'skill_hurt_r' => 0.98,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112010)-> #{
    'group' => 101112,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.015,
    'skill_hurt_r' => 1.015,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 950.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112011)-> #{
    'group' => 101112,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.05,
    'skill_hurt_r' => 1.05,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1045.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112012)-> #{
    'group' => 101112,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.085,
    'skill_hurt_r' => 1.085,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1140.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112013)-> #{
    'group' => 101112,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.12,
    'skill_hurt_r' => 1.12,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1235.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112014)-> #{
    'group' => 101112,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.155,
    'skill_hurt_r' => 1.155,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1330.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112015)-> #{
    'group' => 101112,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.19,
    'skill_hurt_r' => 1.19,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1480.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112016)-> #{
    'group' => 101112,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.225,
    'skill_hurt_r' => 1.225,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112017)-> #{
    'group' => 101112,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.26,
    'skill_hurt_r' => 1.26,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1670.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112018)-> #{
    'group' => 101112,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.295,
    'skill_hurt_r' => 1.295,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1765.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112019)-> #{
    'group' => 101112,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.33,
    'skill_hurt_r' => 1.33,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1860.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112020)-> #{
    'group' => 101112,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.365,
    'skill_hurt_r' => 1.365,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1955.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112021)-> #{
    'group' => 101112,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.4,
    'skill_hurt_r' => 1.4,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112022)-> #{
    'group' => 101112,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.435,
    'skill_hurt_r' => 1.435,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2145.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112023)-> #{
    'group' => 101112,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.47,
    'skill_hurt_r' => 1.47,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112024)-> #{
    'group' => 101112,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.505,
    'skill_hurt_r' => 1.505,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2335.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112025)-> #{
    'group' => 101112,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.54,
    'skill_hurt_r' => 1.54,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2430.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112026)-> #{
    'group' => 101112,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.575,
    'skill_hurt_r' => 1.575,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2525.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112027)-> #{
    'group' => 101112,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.61,
    'skill_hurt_r' => 1.61,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2620.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112028)-> #{
    'group' => 101112,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.645,
    'skill_hurt_r' => 1.645,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2715.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112029)-> #{
    'group' => 101112,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.68,
    'skill_hurt_r' => 1.68,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2810.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101112030)-> #{
    'group' => 101112,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.715,
    'skill_hurt_r' => 1.715,
    'effect_of_additional' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 3,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2905.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113001)-> #{
    'group' => 101113,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.85,
    'skill_hurt_r' => 0.85,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 95.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113002)-> #{
    'group' => 101113,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.905,
    'skill_hurt_r' => 0.905,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 190.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113003)-> #{
    'group' => 101113,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.96,
    'skill_hurt_r' => 0.96,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 285.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113004)-> #{
    'group' => 101113,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.015,
    'skill_hurt_r' => 1.015,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113005)-> #{
    'group' => 101113,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.07,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 475.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113006)-> #{
    'group' => 101113,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.125,
    'skill_hurt_r' => 1.125,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113007)-> #{
    'group' => 101113,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.18,
    'skill_hurt_r' => 1.18,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 665.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113008)-> #{
    'group' => 101113,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.235,
    'skill_hurt_r' => 1.235,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 760.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113009)-> #{
    'group' => 101113,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.29,
    'skill_hurt_r' => 1.29,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113010)-> #{
    'group' => 101113,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.345,
    'skill_hurt_r' => 1.345,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 950.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113011)-> #{
    'group' => 101113,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.4,
    'skill_hurt_r' => 1.4,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1045.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113012)-> #{
    'group' => 101113,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.455,
    'skill_hurt_r' => 1.455,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1140.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113013)-> #{
    'group' => 101113,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.51,
    'skill_hurt_r' => 1.51,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1290.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113014)-> #{
    'group' => 101113,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.565,
    'skill_hurt_r' => 1.565,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1385.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113015)-> #{
    'group' => 101113,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.62,
    'skill_hurt_r' => 1.62,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1480.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113016)-> #{
    'group' => 101113,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.675,
    'skill_hurt_r' => 1.675,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113017)-> #{
    'group' => 101113,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.73,
    'skill_hurt_r' => 1.73,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1670.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113018)-> #{
    'group' => 101113,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.785,
    'skill_hurt_r' => 1.785,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1765.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113019)-> #{
    'group' => 101113,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.84,
    'skill_hurt_r' => 1.84,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1860.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113020)-> #{
    'group' => 101113,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.895,
    'skill_hurt_r' => 1.895,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1955.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113021)-> #{
    'group' => 101113,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.95,
    'skill_hurt_r' => 1.95,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113022)-> #{
    'group' => 101113,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.005,
    'skill_hurt_r' => 2.005,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2145.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113023)-> #{
    'group' => 101113,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.06,
    'skill_hurt_r' => 2.06,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113024)-> #{
    'group' => 101113,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.115,
    'skill_hurt_r' => 2.115,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2335.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113025)-> #{
    'group' => 101113,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.17,
    'skill_hurt_r' => 2.17,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2430.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113026)-> #{
    'group' => 101113,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.225,
    'skill_hurt_r' => 2.225,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2525.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113027)-> #{
    'group' => 101113,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.28,
    'skill_hurt_r' => 2.28,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2620.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113028)-> #{
    'group' => 101113,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.335,
    'skill_hurt_r' => 2.335,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2715.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113029)-> #{
    'group' => 101113,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.39,
    'skill_hurt_r' => 2.39,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2810.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101113030)-> #{
    'group' => 101113,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.445,
    'skill_hurt_r' => 2.445,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 1,
            'target' => 2,
            'hurt_times' => 1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1005001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2905.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114001)-> #{
    'group' => 101114,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.72,
    'skill_hurt_r' => 0.72,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 95.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114002)-> #{
    'group' => 101114,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.755,
    'skill_hurt_r' => 0.755,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 190.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114003)-> #{
    'group' => 101114,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.79,
    'skill_hurt_r' => 0.79,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 285.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114004)-> #{
    'group' => 101114,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.825,
    'skill_hurt_r' => 0.825,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114005)-> #{
    'group' => 101114,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.86,
    'skill_hurt_r' => 0.86,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 475.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114006)-> #{
    'group' => 101114,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.895,
    'skill_hurt_r' => 0.895,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114007)-> #{
    'group' => 101114,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.93,
    'skill_hurt_r' => 0.93,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 665.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114008)-> #{
    'group' => 101114,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.965,
    'skill_hurt_r' => 0.965,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 760.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114009)-> #{
    'group' => 101114,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114010)-> #{
    'group' => 101114,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.035,
    'skill_hurt_r' => 1.035,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 950.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114011)-> #{
    'group' => 101114,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.07,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1045.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114012)-> #{
    'group' => 101114,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.105,
    'skill_hurt_r' => 1.105,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1140.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114013)-> #{
    'group' => 101114,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.14,
    'skill_hurt_r' => 1.14,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1235.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114014)-> #{
    'group' => 101114,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.175,
    'skill_hurt_r' => 1.175,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1330.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114015)-> #{
    'group' => 101114,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.21,
    'skill_hurt_r' => 1.21,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1425.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114016)-> #{
    'group' => 101114,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.245,
    'skill_hurt_r' => 1.245,
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1520.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114017)-> #{
    'group' => 101114,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.28,
    'skill_hurt_r' => 1.28,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1670.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114018)-> #{
    'group' => 101114,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.315,
    'skill_hurt_r' => 1.315,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1765.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114019)-> #{
    'group' => 101114,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.35,
    'skill_hurt_r' => 1.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1860.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114020)-> #{
    'group' => 101114,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.385,
    'skill_hurt_r' => 1.385,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1955.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114021)-> #{
    'group' => 101114,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.42,
    'skill_hurt_r' => 1.42,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114022)-> #{
    'group' => 101114,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.455,
    'skill_hurt_r' => 1.455,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2145.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114023)-> #{
    'group' => 101114,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.49,
    'skill_hurt_r' => 1.49,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114024)-> #{
    'group' => 101114,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.525,
    'skill_hurt_r' => 1.525,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2335.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114025)-> #{
    'group' => 101114,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2430.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114026)-> #{
    'group' => 101114,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.595,
    'skill_hurt_r' => 1.595,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2525.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114027)-> #{
    'group' => 101114,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.63,
    'skill_hurt_r' => 1.63,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2620.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114028)-> #{
    'group' => 101114,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.665,
    'skill_hurt_r' => 1.665,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2715.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114029)-> #{
    'group' => 101114,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.7,
    'skill_hurt_r' => 1.7,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2810.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101114030)-> #{
    'group' => 101114,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 2,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.735,
    'skill_hurt_r' => 1.735,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.3,
            'active_time' => 2,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1002,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2905.0,
    'skill_powerbase_coefficient' => 400.0
};
get(101115001)-> #{
    'group' => 101115,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.4,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 105.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115002)-> #{
    'group' => 101115,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.405,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020002
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115003)-> #{
    'group' => 101115,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.41,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020003
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 315.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115004)-> #{
    'group' => 101115,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.415,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020004
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115005)-> #{
    'group' => 101115,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.42,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020005
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115006)-> #{
    'group' => 101115,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.425,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020006
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115007)-> #{
    'group' => 101115,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.43,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020007
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115008)-> #{
    'group' => 101115,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.435,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020008
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115009)-> #{
    'group' => 101115,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.44,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020009
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115010)-> #{
    'group' => 101115,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.445,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020010
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115011)-> #{
    'group' => 101115,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.45,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020011
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115012)-> #{
    'group' => 101115,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.455,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020012
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115013)-> #{
    'group' => 101115,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.46,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020013
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115014)-> #{
    'group' => 101115,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.465,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020014
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115015)-> #{
    'group' => 101115,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.47,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020015
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115016)-> #{
    'group' => 101115,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.475,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020016
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115017)-> #{
    'group' => 101115,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.48,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020017
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115018)-> #{
    'group' => 101115,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.485,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020018
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115019)-> #{
    'group' => 101115,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.49,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020019
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115020)-> #{
    'group' => 101115,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.495,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020020
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115021)-> #{
    'group' => 101115,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.5,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020021
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115022)-> #{
    'group' => 101115,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.505,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020022
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115023)-> #{
    'group' => 101115,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.51,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020023
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115024)-> #{
    'group' => 101115,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.515,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020024
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115025)-> #{
    'group' => 101115,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.52,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020025
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115026)-> #{
    'group' => 101115,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.525,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020026
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2785.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115027)-> #{
    'group' => 101115,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.53,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020027
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115028)-> #{
    'group' => 101115,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.535,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020028
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2995.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115029)-> #{
    'group' => 101115,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.54,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020029
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 3100.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101115030)-> #{
    'group' => 101115,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 0.545,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'active_time' => 2,
            'buff_list' => [
                1020030
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 3205.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116001)-> #{
    'group' => 101116,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.9,
    'skill_hurt_r' => 0.9,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.01
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 105.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116002)-> #{
    'group' => 101116,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.95,
    'skill_hurt_r' => 0.95,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.012
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116003)-> #{
    'group' => 101116,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.014
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 315.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116004)-> #{
    'group' => 101116,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.05,
    'skill_hurt_r' => 1.05,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.016
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116005)-> #{
    'group' => 101116,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.1,
    'skill_hurt_r' => 1.1,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.018
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116006)-> #{
    'group' => 101116,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.15,
    'skill_hurt_r' => 1.15,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.02
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116007)-> #{
    'group' => 101116,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.2,
    'skill_hurt_r' => 1.2,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.022
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116008)-> #{
    'group' => 101116,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.25,
    'skill_hurt_r' => 1.25,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.024
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116009)-> #{
    'group' => 101116,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.3,
    'skill_hurt_r' => 1.3,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.026
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116010)-> #{
    'group' => 101116,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.35,
    'skill_hurt_r' => 1.35,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.028
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116011)-> #{
    'group' => 101116,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.4,
    'skill_hurt_r' => 1.4,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.03
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116012)-> #{
    'group' => 101116,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.45,
    'skill_hurt_r' => 1.45,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.032
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116013)-> #{
    'group' => 101116,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.5,
    'skill_hurt_r' => 1.5,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.034
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116014)-> #{
    'group' => 101116,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.55,
    'skill_hurt_r' => 1.55,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.036
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116015)-> #{
    'group' => 101116,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.6,
    'skill_hurt_r' => 1.6,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.038
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116016)-> #{
    'group' => 101116,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.65,
    'skill_hurt_r' => 1.65,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.04
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116017)-> #{
    'group' => 101116,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.7,
    'skill_hurt_r' => 1.7,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.042
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116018)-> #{
    'group' => 101116,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.75,
    'skill_hurt_r' => 1.75,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.044
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116019)-> #{
    'group' => 101116,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.8,
    'skill_hurt_r' => 1.8,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.046
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116020)-> #{
    'group' => 101116,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.85,
    'skill_hurt_r' => 1.85,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.048
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116021)-> #{
    'group' => 101116,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.9,
    'skill_hurt_r' => 1.9,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116022)-> #{
    'group' => 101116,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.95,
    'skill_hurt_r' => 1.95,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.052
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116023)-> #{
    'group' => 101116,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.0,
    'skill_hurt_r' => 2.0,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.054
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116024)-> #{
    'group' => 101116,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.05,
    'skill_hurt_r' => 2.05,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.056
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116025)-> #{
    'group' => 101116,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.1,
    'skill_hurt_r' => 2.1,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.058
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116026)-> #{
    'group' => 101116,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.15,
    'skill_hurt_r' => 2.15,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.06
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2785.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116027)-> #{
    'group' => 101116,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.2,
    'skill_hurt_r' => 2.2,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.062
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116028)-> #{
    'group' => 101116,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.25,
    'skill_hurt_r' => 2.25,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.064
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2995.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116029)-> #{
    'group' => 101116,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.3,
    'skill_hurt_r' => 2.3,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.066
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3100.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101116030)-> #{
    'group' => 101116,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.35,
    'skill_hurt_r' => 2.35,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'active_time' => 1,
            'percent_type' => 0,
            'percent' => 0.068
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1003,
            'condition' => 3,
            'condition_type' => 4,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.1
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1004001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3205.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117001)-> #{
    'group' => 101117,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 105.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117002)-> #{
    'group' => 101117,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022002
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117003)-> #{
    'group' => 101117,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022003
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 315.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117004)-> #{
    'group' => 101117,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022004
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117005)-> #{
    'group' => 101117,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022005
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117006)-> #{
    'group' => 101117,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022006
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117007)-> #{
    'group' => 101117,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022007
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117008)-> #{
    'group' => 101117,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022008
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117009)-> #{
    'group' => 101117,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022009
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117010)-> #{
    'group' => 101117,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022010
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117011)-> #{
    'group' => 101117,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022011
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117012)-> #{
    'group' => 101117,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022012
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117013)-> #{
    'group' => 101117,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022013
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117014)-> #{
    'group' => 101117,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022014
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117015)-> #{
    'group' => 101117,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022015
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117016)-> #{
    'group' => 101117,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022016
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117017)-> #{
    'group' => 101117,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022017
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 1840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117018)-> #{
    'group' => 101117,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022018
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 1945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117019)-> #{
    'group' => 101117,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022019
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117020)-> #{
    'group' => 101117,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022020
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117021)-> #{
    'group' => 101117,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022021
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117022)-> #{
    'group' => 101117,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022022
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117023)-> #{
    'group' => 101117,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022023
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117024)-> #{
    'group' => 101117,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022024
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117025)-> #{
    'group' => 101117,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022025
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117026)-> #{
    'group' => 101117,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022026
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2785.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117027)-> #{
    'group' => 101117,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022027
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117028)-> #{
    'group' => 101117,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022028
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 2995.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117029)-> #{
    'group' => 101117,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022029
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 3100.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101117030)-> #{
    'group' => 101117,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 2,
    'target' => 5,
    'hurt_times' => 0,
    'skill_hurt_l' => 0.0,
    'skill_hurt_r' => 0.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 2,
            'target' => 5,
            'rate' => 1,
            'buff_list' => [
                1022030
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 2,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 1,
            'effect' => 1014,
            'value' => 0.2
        }
    ],
    'skill_powerbase' => 3205.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118001)-> #{
    'group' => 101118,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.5,
    'skill_hurt_r' => 0.5,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         1
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 105.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118002)-> #{
    'group' => 101118,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.52,
    'skill_hurt_r' => 0.52,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         1
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118003)-> #{
    'group' => 101118,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.54,
    'skill_hurt_r' => 0.54,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         1
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 315.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118004)-> #{
    'group' => 101118,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.56,
    'skill_hurt_r' => 0.56,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         1
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118005)-> #{
    'group' => 101118,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.58,
    'skill_hurt_r' => 0.58,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         1
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118006)-> #{
    'group' => 101118,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.6,
    'skill_hurt_r' => 0.6,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         1
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118007)-> #{
    'group' => 101118,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.62,
    'skill_hurt_r' => 0.62,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118008)-> #{
    'group' => 101118,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.64,
    'skill_hurt_r' => 0.64,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118009)-> #{
    'group' => 101118,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.66,
    'skill_hurt_r' => 0.66,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118010)-> #{
    'group' => 101118,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.68,
    'skill_hurt_r' => 0.68,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118011)-> #{
    'group' => 101118,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.7,
    'skill_hurt_r' => 0.7,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118012)-> #{
    'group' => 101118,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.72,
    'skill_hurt_r' => 0.72,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118013)-> #{
    'group' => 101118,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.74,
    'skill_hurt_r' => 0.74,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         2
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118014)-> #{
    'group' => 101118,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.76,
    'skill_hurt_r' => 0.76,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118015)-> #{
    'group' => 101118,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.78,
    'skill_hurt_r' => 0.78,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118016)-> #{
    'group' => 101118,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.8,
    'skill_hurt_r' => 0.8,
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118017)-> #{
    'group' => 101118,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.82,
    'skill_hurt_r' => 0.82,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118018)-> #{
    'group' => 101118,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.84,
    'skill_hurt_r' => 0.84,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 1945.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118019)-> #{
    'group' => 101118,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.86,
    'skill_hurt_r' => 0.86,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2050.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118020)-> #{
    'group' => 101118,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.88,
    'skill_hurt_r' => 0.88,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2155.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118021)-> #{
    'group' => 101118,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.9,
    'skill_hurt_r' => 0.9,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         3
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118022)-> #{
    'group' => 101118,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.92,
    'skill_hurt_r' => 0.92,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2365.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118023)-> #{
    'group' => 101118,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.94,
    'skill_hurt_r' => 0.94,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2470.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118024)-> #{
    'group' => 101118,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.96,
    'skill_hurt_r' => 0.96,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2575.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118025)-> #{
    'group' => 101118,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 0.98,
    'skill_hurt_r' => 0.98,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118026)-> #{
    'group' => 101118,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2785.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118027)-> #{
    'group' => 101118,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 1.02,
    'skill_hurt_r' => 1.02,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118028)-> #{
    'group' => 101118,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 1.04,
    'skill_hurt_r' => 1.04,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 2995.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118029)-> #{
    'group' => 101118,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'skill_hurt_l' => 1.06,
    'skill_hurt_r' => 1.06,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         4
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 3100.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101118030)-> #{
    'group' => 101118,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.08,
    'skill_hurt_r' => 1.08,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 6,
            'target_object' => 1,
            'target' => 3,
            'rate' => 1,
            'buff_list' => [
                1007001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'hurt_times_rand' => [
        1,
         5
    ],
    'related_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'rate' => 1,
            'buff_list' => [
                1029001,
                 1030001
            ]
        }
    ],
    'skill_powerbase' => 3205.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101119001)-> #{
    'group' => 101119,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.68,
    'skill_hurt_r' => 0.68,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.68,
            'skill_hurt_r' => 0.68,
            'hurt_times' => 1,
            'active_rand' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119002)-> #{
    'group' => 101119,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.72,
    'skill_hurt_r' => 0.72,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.72,
            'skill_hurt_r' => 0.72,
            'hurt_times' => 1,
            'active_rand' => 0.32
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119003)-> #{
    'group' => 101119,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.76,
    'skill_hurt_r' => 0.76,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.76,
            'skill_hurt_r' => 0.76,
            'hurt_times' => 1,
            'active_rand' => 0.34
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119004)-> #{
    'group' => 101119,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.8,
    'skill_hurt_r' => 0.8,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.8,
            'skill_hurt_r' => 0.8,
            'hurt_times' => 1,
            'active_rand' => 0.36
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119005)-> #{
    'group' => 101119,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.84,
    'skill_hurt_r' => 0.84,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.84,
            'skill_hurt_r' => 0.84,
            'hurt_times' => 1,
            'active_rand' => 0.38
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119006)-> #{
    'group' => 101119,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.88,
    'skill_hurt_r' => 0.88,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.88,
            'skill_hurt_r' => 0.88,
            'hurt_times' => 1,
            'active_rand' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119007)-> #{
    'group' => 101119,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.92,
    'skill_hurt_r' => 0.92,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.92,
            'skill_hurt_r' => 0.92,
            'hurt_times' => 1,
            'active_rand' => 0.42
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119008)-> #{
    'group' => 101119,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.959999999999999,
    'skill_hurt_r' => 0.959999999999999,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 0.96,
            'skill_hurt_r' => 0.96,
            'hurt_times' => 1,
            'active_rand' => 0.44
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119009)-> #{
    'group' => 101119,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.999999999999999,
    'skill_hurt_r' => 0.999999999999999,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1,
            'skill_hurt_r' => 1,
            'hurt_times' => 1,
            'active_rand' => 0.46
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119010)-> #{
    'group' => 101119,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.04,
    'skill_hurt_r' => 1.04,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.04,
            'skill_hurt_r' => 1.04,
            'hurt_times' => 1,
            'active_rand' => 0.48
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119011)-> #{
    'group' => 101119,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.08,
    'skill_hurt_r' => 1.08,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.08,
            'skill_hurt_r' => 1.08,
            'hurt_times' => 1,
            'active_rand' => 0.5
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119012)-> #{
    'group' => 101119,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.12,
    'skill_hurt_r' => 1.12,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.12,
            'skill_hurt_r' => 1.12,
            'hurt_times' => 1,
            'active_rand' => 0.52
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119013)-> #{
    'group' => 101119,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.16,
    'skill_hurt_r' => 1.16,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.16,
            'skill_hurt_r' => 1.16,
            'hurt_times' => 1,
            'active_rand' => 0.54
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1820.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119014)-> #{
    'group' => 101119,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.2,
    'skill_hurt_r' => 1.2,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.2,
            'skill_hurt_r' => 1.2,
            'hurt_times' => 1,
            'active_rand' => 0.56
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 1960.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119015)-> #{
    'group' => 101119,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.24,
    'skill_hurt_r' => 1.24,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.24,
            'skill_hurt_r' => 1.24,
            'hurt_times' => 1,
            'active_rand' => 0.58
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2100.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119016)-> #{
    'group' => 101119,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.28,
    'skill_hurt_r' => 1.28,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.28,
            'skill_hurt_r' => 1.28,
            'hurt_times' => 1,
            'active_rand' => 0.6
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119017)-> #{
    'group' => 101119,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.32,
    'skill_hurt_r' => 1.32,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.32,
            'skill_hurt_r' => 1.32,
            'hurt_times' => 1,
            'active_rand' => 0.62,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119018)-> #{
    'group' => 101119,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.36,
    'skill_hurt_r' => 1.36,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.36,
            'skill_hurt_r' => 1.36,
            'hurt_times' => 1,
            'active_rand' => 0.64,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119019)-> #{
    'group' => 101119,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.4,
    'skill_hurt_r' => 1.4,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.4,
            'skill_hurt_r' => 1.4,
            'hurt_times' => 1,
            'active_rand' => 0.66,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119020)-> #{
    'group' => 101119,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.44,
    'skill_hurt_r' => 1.44,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.44,
            'skill_hurt_r' => 1.44,
            'hurt_times' => 1,
            'active_rand' => 0.68,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119021)-> #{
    'group' => 101119,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.48,
    'skill_hurt_r' => 1.48,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.48,
            'skill_hurt_r' => 1.48,
            'hurt_times' => 1,
            'active_rand' => 0.7,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119022)-> #{
    'group' => 101119,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.52,
    'skill_hurt_r' => 1.52,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.52,
            'skill_hurt_r' => 1.52,
            'hurt_times' => 1,
            'active_rand' => 0.72,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119023)-> #{
    'group' => 101119,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.56,
            'skill_hurt_r' => 1.56,
            'hurt_times' => 1,
            'active_rand' => 0.74,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119024)-> #{
    'group' => 101119,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.6,
    'skill_hurt_r' => 1.6,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.6,
            'skill_hurt_r' => 1.6,
            'hurt_times' => 1,
            'active_rand' => 0.76,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119025)-> #{
    'group' => 101119,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.64,
    'skill_hurt_r' => 1.64,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.64,
            'skill_hurt_r' => 1.64,
            'hurt_times' => 1,
            'active_rand' => 0.78,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119026)-> #{
    'group' => 101119,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.68,
    'skill_hurt_r' => 1.68,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.68,
            'skill_hurt_r' => 1.68,
            'hurt_times' => 1,
            'active_rand' => 0.8,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119027)-> #{
    'group' => 101119,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.72,
    'skill_hurt_r' => 1.72,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.72,
            'skill_hurt_r' => 1.72,
            'hurt_times' => 1,
            'active_rand' => 0.82,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119028)-> #{
    'group' => 101119,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.76,
    'skill_hurt_r' => 1.76,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.76,
            'skill_hurt_r' => 1.76,
            'hurt_times' => 1,
            'active_rand' => 0.84,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119029)-> #{
    'group' => 101119,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.8,
    'skill_hurt_r' => 1.8,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.8,
            'skill_hurt_r' => 1.8,
            'hurt_times' => 1,
            'active_rand' => 0.86,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101119030)-> #{
    'group' => 101119,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.84,
    'skill_hurt_r' => 1.84,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.84,
            'skill_hurt_r' => 1.84,
            'hurt_times' => 1,
            'active_rand' => 0.88,
            'related_effect' => [
                #{
                    'effect' => 1008,
                    'rate' => 1,
                    'buff_list' => [
                        1028001
                    ]
                }
            ]
        }
    ],
    'is_show' => 1,
    'round' => 2,
    'round_add' => 1,
    'related_effect' => [
        #{
            'effect' => 1008,
            'rate' => 1,
            'buff_list' => [
                1028001
            ]
        }
    ],
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120001)-> #{
    'group' => 101120,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.81,
    'skill_hurt_r' => 0.81,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.2,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120002)-> #{
    'group' => 101120,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.845,
    'skill_hurt_r' => 0.845,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.23,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120003)-> #{
    'group' => 101120,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.88,
    'skill_hurt_r' => 0.88,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.26,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120004)-> #{
    'group' => 101120,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.915,
    'skill_hurt_r' => 0.915,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.29,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120005)-> #{
    'group' => 101120,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.95,
    'skill_hurt_r' => 0.95,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.32,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120006)-> #{
    'group' => 101120,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.985,
    'skill_hurt_r' => 0.985,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.35,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120007)-> #{
    'group' => 101120,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.02,
    'skill_hurt_r' => 1.02,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.38,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120008)-> #{
    'group' => 101120,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.055,
    'skill_hurt_r' => 1.055,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.41,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120009)-> #{
    'group' => 101120,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.09,
    'skill_hurt_r' => 1.09,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.44,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120010)-> #{
    'group' => 101120,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.125,
    'skill_hurt_r' => 1.125,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.47,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120011)-> #{
    'group' => 101120,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.16,
    'skill_hurt_r' => 1.16,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.5,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120012)-> #{
    'group' => 101120,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.195,
    'skill_hurt_r' => 1.195,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.53,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120013)-> #{
    'group' => 101120,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.23,
    'skill_hurt_r' => 1.23,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.56,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 1890.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120014)-> #{
    'group' => 101120,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.265,
    'skill_hurt_r' => 1.265,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.59,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2030.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120015)-> #{
    'group' => 101120,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.3,
    'skill_hurt_r' => 1.3,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.62,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2170.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120016)-> #{
    'group' => 101120,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.335,
    'skill_hurt_r' => 1.335,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.65,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2310.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120017)-> #{
    'group' => 101120,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.37,
    'skill_hurt_r' => 1.37,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.68,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120018)-> #{
    'group' => 101120,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.405,
    'skill_hurt_r' => 1.405,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.71,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120019)-> #{
    'group' => 101120,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.44,
    'skill_hurt_r' => 1.44,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.74,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120020)-> #{
    'group' => 101120,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.475,
    'skill_hurt_r' => 1.475,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.77,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120021)-> #{
    'group' => 101120,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.51,
    'skill_hurt_r' => 1.51,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.8,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120022)-> #{
    'group' => 101120,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.545,
    'skill_hurt_r' => 1.545,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.83,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120023)-> #{
    'group' => 101120,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.58,
    'skill_hurt_r' => 1.58,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.86,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120024)-> #{
    'group' => 101120,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.615,
    'skill_hurt_r' => 1.615,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.89,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120025)-> #{
    'group' => 101120,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.65,
    'skill_hurt_r' => 1.65,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.92,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120026)-> #{
    'group' => 101120,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.685,
    'skill_hurt_r' => 1.685,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.93,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120027)-> #{
    'group' => 101120,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.72,
    'skill_hurt_r' => 1.72,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.94,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120028)-> #{
    'group' => 101120,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.755,
    'skill_hurt_r' => 1.755,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.95,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120029)-> #{
    'group' => 101120,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.79,
    'skill_hurt_r' => 1.79,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.96,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101120030)-> #{
    'group' => 101120,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 1,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.825,
    'skill_hurt_r' => 1.825,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'condition' => 0
        },
         #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 0,
            'rate' => 0.97,
            'buff_list' => [
                1003001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'passive_effect' => [
        #{
            'round' => 4,
            'round_add' => 0,
            'effect' => 1015,
            'rand' => 0.6
        }
    ],
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121001)-> #{
    'group' => 101121,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.65,
    'skill_hurt_r' => 0.65,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.2,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121002)-> #{
    'group' => 101121,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.685,
    'skill_hurt_r' => 0.685,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.205,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121003)-> #{
    'group' => 101121,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.72,
    'skill_hurt_r' => 0.72,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.21,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121004)-> #{
    'group' => 101121,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.755,
    'skill_hurt_r' => 0.755,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.215,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121005)-> #{
    'group' => 101121,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.79,
    'skill_hurt_r' => 0.79,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.22,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121006)-> #{
    'group' => 101121,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.825,
    'skill_hurt_r' => 0.825,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.225,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121007)-> #{
    'group' => 101121,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.86,
    'skill_hurt_r' => 0.86,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.23,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121008)-> #{
    'group' => 101121,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.895,
    'skill_hurt_r' => 0.895,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.235,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121009)-> #{
    'group' => 101121,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.93,
    'skill_hurt_r' => 0.93,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.24,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121010)-> #{
    'group' => 101121,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.965,
    'skill_hurt_r' => 0.965,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.245,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121011)-> #{
    'group' => 101121,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.25,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121012)-> #{
    'group' => 101121,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.035,
    'skill_hurt_r' => 1.035,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.255,
            'buff_list' => [
                1008001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121013)-> #{
    'group' => 101121,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.07,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.26,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1890.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121014)-> #{
    'group' => 101121,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.105,
    'skill_hurt_r' => 1.105,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.265,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2030.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121015)-> #{
    'group' => 101121,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.14,
    'skill_hurt_r' => 1.14,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.27,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2170.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121016)-> #{
    'group' => 101121,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.175,
    'skill_hurt_r' => 1.175,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.275,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2310.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121017)-> #{
    'group' => 101121,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.21,
    'skill_hurt_r' => 1.21,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.28,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121018)-> #{
    'group' => 101121,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.245,
    'skill_hurt_r' => 1.245,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.285,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121019)-> #{
    'group' => 101121,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.28,
    'skill_hurt_r' => 1.28,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.29,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121020)-> #{
    'group' => 101121,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.315,
    'skill_hurt_r' => 1.315,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.295,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121021)-> #{
    'group' => 101121,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.35,
    'skill_hurt_r' => 1.35,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.3,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121022)-> #{
    'group' => 101121,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.385,
    'skill_hurt_r' => 1.385,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.305,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121023)-> #{
    'group' => 101121,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.42,
    'skill_hurt_r' => 1.42,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.31,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121024)-> #{
    'group' => 101121,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.455,
    'skill_hurt_r' => 1.455,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.315,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121025)-> #{
    'group' => 101121,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.49,
    'skill_hurt_r' => 1.49,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.32,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121026)-> #{
    'group' => 101121,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.525,
    'skill_hurt_r' => 1.525,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.325,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121027)-> #{
    'group' => 101121,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.33,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121028)-> #{
    'group' => 101121,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.595,
    'skill_hurt_r' => 1.595,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.335,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121029)-> #{
    'group' => 101121,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.63,
    'skill_hurt_r' => 1.63,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.34,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101121030)-> #{
    'group' => 101121,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.665,
    'skill_hurt_r' => 1.665,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.345,
            'buff_list' => [
                1008001
            ]
        },
         #{
            'effect' => 1003,
            'target_object' => 1,
            'target' => 5,
            'percent_type' => 1,
            'percent' => 0.07
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122001)-> #{
    'group' => 101122,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.9,
    'skill_hurt_r' => 1.9,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122002)-> #{
    'group' => 101122,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.98,
    'skill_hurt_r' => 1.98,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122003)-> #{
    'group' => 101122,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.06,
    'skill_hurt_r' => 2.06,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122004)-> #{
    'group' => 101122,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.14,
    'skill_hurt_r' => 2.14,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122005)-> #{
    'group' => 101122,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.22,
    'skill_hurt_r' => 2.22,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122006)-> #{
    'group' => 101122,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.3,
    'skill_hurt_r' => 2.3,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122007)-> #{
    'group' => 101122,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.38,
    'skill_hurt_r' => 2.38,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122008)-> #{
    'group' => 101122,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.46,
    'skill_hurt_r' => 2.46,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122009)-> #{
    'group' => 101122,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.54,
    'skill_hurt_r' => 2.54,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122010)-> #{
    'group' => 101122,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.62,
    'skill_hurt_r' => 2.62,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122011)-> #{
    'group' => 101122,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.7,
    'skill_hurt_r' => 2.7,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122012)-> #{
    'group' => 101122,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.78,
    'skill_hurt_r' => 2.78,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122013)-> #{
    'group' => 101122,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.86,
    'skill_hurt_r' => 2.86,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1820.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122014)-> #{
    'group' => 101122,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.94,
    'skill_hurt_r' => 2.94,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 1960.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122015)-> #{
    'group' => 101122,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.02,
    'skill_hurt_r' => 3.02,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 2100.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122016)-> #{
    'group' => 101122,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.1,
    'skill_hurt_r' => 3.1,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 2240.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122017)-> #{
    'group' => 101122,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.18,
    'skill_hurt_r' => 3.18,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122018)-> #{
    'group' => 101122,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.26,
    'skill_hurt_r' => 3.26,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122019)-> #{
    'group' => 101122,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.34,
    'skill_hurt_r' => 3.34,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122020)-> #{
    'group' => 101122,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.42,
    'skill_hurt_r' => 3.42,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122021)-> #{
    'group' => 101122,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.5,
    'skill_hurt_r' => 3.5,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122022)-> #{
    'group' => 101122,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.58,
    'skill_hurt_r' => 3.58,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122023)-> #{
    'group' => 101122,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.66,
    'skill_hurt_r' => 3.66,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122024)-> #{
    'group' => 101122,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.74,
    'skill_hurt_r' => 3.74,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122025)-> #{
    'group' => 101122,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.82,
    'skill_hurt_r' => 3.82,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122026)-> #{
    'group' => 101122,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.9,
    'skill_hurt_r' => 3.9,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122027)-> #{
    'group' => 101122,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.98,
    'skill_hurt_r' => 3.98,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122028)-> #{
    'group' => 101122,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.06,
    'skill_hurt_r' => 4.06,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122029)-> #{
    'group' => 101122,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.14,
    'skill_hurt_r' => 4.14,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101122030)-> #{
    'group' => 101122,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 3,
    'skill_type_add' => 0,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.22,
    'skill_hurt_r' => 4.22,
    'effect_of_additional' => [
        #{
            'effect' => 1013,
            'trigger_extra' => 1,
            'trigger_extra_value1' => 0.5,
            'trigger_extra_value2' => 1,
            'condition' => 0
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 2,
            'target' => 2,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1034001
            ]
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 2,
            'target' => 3,
            'rate' => 1,
            'trigger_time' => 4,
            'buff_list' => [
                1035001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 0,
    'round_add' => 0,
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 800.0
};
get(101201001)-> #{
    'group' => 101201,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.62,
    'skill_hurt_r' => 0.62,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 30.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201002)-> #{
    'group' => 101201,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.635,
    'skill_hurt_r' => 0.635,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 60.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201003)-> #{
    'group' => 101201,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.65,
    'skill_hurt_r' => 0.65,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 90.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201004)-> #{
    'group' => 101201,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.665,
    'skill_hurt_r' => 0.665,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 120.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201005)-> #{
    'group' => 101201,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.68,
    'skill_hurt_r' => 0.68,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 150.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201006)-> #{
    'group' => 101201,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.695,
    'skill_hurt_r' => 0.695,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 180.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201007)-> #{
    'group' => 101201,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.71,
    'skill_hurt_r' => 0.71,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201008)-> #{
    'group' => 101201,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.725,
    'skill_hurt_r' => 0.725,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 240.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201009)-> #{
    'group' => 101201,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.74,
    'skill_hurt_r' => 0.74,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 270.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201010)-> #{
    'group' => 101201,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.755,
    'skill_hurt_r' => 0.755,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 300.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201011)-> #{
    'group' => 101201,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.77,
    'skill_hurt_r' => 0.77,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 330.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201012)-> #{
    'group' => 101201,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.785,
    'skill_hurt_r' => 0.785,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 360.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201013)-> #{
    'group' => 101201,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.8,
    'skill_hurt_r' => 0.8,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 390.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201014)-> #{
    'group' => 101201,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.815,
    'skill_hurt_r' => 0.815,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201015)-> #{
    'group' => 101201,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.83,
    'skill_hurt_r' => 0.83,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 450.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201016)-> #{
    'group' => 101201,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.845,
    'skill_hurt_r' => 0.845,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 480.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201017)-> #{
    'group' => 101201,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.86,
    'skill_hurt_r' => 0.86,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 510.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201018)-> #{
    'group' => 101201,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.875,
    'skill_hurt_r' => 0.875,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 540.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201019)-> #{
    'group' => 101201,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.89,
    'skill_hurt_r' => 0.89,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 570.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201020)-> #{
    'group' => 101201,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.905,
    'skill_hurt_r' => 0.905,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 600.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201021)-> #{
    'group' => 101201,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.92,
    'skill_hurt_r' => 0.92,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201022)-> #{
    'group' => 101201,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.935,
    'skill_hurt_r' => 0.935,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 660.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201023)-> #{
    'group' => 101201,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.95,
    'skill_hurt_r' => 0.95,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 690.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201024)-> #{
    'group' => 101201,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.965,
    'skill_hurt_r' => 0.965,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 720.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201025)-> #{
    'group' => 101201,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.98,
    'skill_hurt_r' => 0.98,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 750.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201026)-> #{
    'group' => 101201,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 0.995,
    'skill_hurt_r' => 0.995,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 780.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201027)-> #{
    'group' => 101201,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 1.01,
    'skill_hurt_r' => 1.01,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 810.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201028)-> #{
    'group' => 101201,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 1.025,
    'skill_hurt_r' => 1.025,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201029)-> #{
    'group' => 101201,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 1.04,
    'skill_hurt_r' => 1.04,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 870.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101201030)-> #{
    'group' => 101201,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 4,
    'skill_hurt_l' => 1.055,
    'skill_hurt_r' => 1.055,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 900.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101202001)-> #{
    'group' => 101202,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.8,
    'skill_hurt_r' => 0.8,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 30.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202002)-> #{
    'group' => 101202,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.825,
    'skill_hurt_r' => 0.825,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 60.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202003)-> #{
    'group' => 101202,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.85,
    'skill_hurt_r' => 0.85,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 90.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202004)-> #{
    'group' => 101202,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.875,
    'skill_hurt_r' => 0.875,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 120.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202005)-> #{
    'group' => 101202,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.9,
    'skill_hurt_r' => 0.9,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 150.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202006)-> #{
    'group' => 101202,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.925,
    'skill_hurt_r' => 0.925,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 180.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202007)-> #{
    'group' => 101202,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.949999999999999,
    'skill_hurt_r' => 0.949999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202008)-> #{
    'group' => 101202,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.974999999999999,
    'skill_hurt_r' => 0.974999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 240.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202009)-> #{
    'group' => 101202,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.999999999999999,
    'skill_hurt_r' => 0.999999999999999,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 270.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202010)-> #{
    'group' => 101202,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.025,
    'skill_hurt_r' => 1.025,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 300.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202011)-> #{
    'group' => 101202,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.05,
    'skill_hurt_r' => 1.05,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 330.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202012)-> #{
    'group' => 101202,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.075,
    'skill_hurt_r' => 1.075,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 360.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202013)-> #{
    'group' => 101202,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.1,
    'skill_hurt_r' => 1.1,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 390.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202014)-> #{
    'group' => 101202,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.125,
    'skill_hurt_r' => 1.125,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202015)-> #{
    'group' => 101202,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.15,
    'skill_hurt_r' => 1.15,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 450.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202016)-> #{
    'group' => 101202,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.175,
    'skill_hurt_r' => 1.175,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 495.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202017)-> #{
    'group' => 101202,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.2,
    'skill_hurt_r' => 1.2,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202018)-> #{
    'group' => 101202,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.225,
    'skill_hurt_r' => 1.225,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 555.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202019)-> #{
    'group' => 101202,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.25,
    'skill_hurt_r' => 1.25,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 585.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202020)-> #{
    'group' => 101202,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.275,
    'skill_hurt_r' => 1.275,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 615.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202021)-> #{
    'group' => 101202,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.3,
    'skill_hurt_r' => 1.3,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 645.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202022)-> #{
    'group' => 101202,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.325,
    'skill_hurt_r' => 1.325,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 675.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202023)-> #{
    'group' => 101202,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.35,
    'skill_hurt_r' => 1.35,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 705.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202024)-> #{
    'group' => 101202,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.375,
    'skill_hurt_r' => 1.375,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202025)-> #{
    'group' => 101202,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.4,
    'skill_hurt_r' => 1.4,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 765.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202026)-> #{
    'group' => 101202,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.425,
    'skill_hurt_r' => 1.425,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 795.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202027)-> #{
    'group' => 101202,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.45,
    'skill_hurt_r' => 1.45,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 825.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202028)-> #{
    'group' => 101202,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.475,
    'skill_hurt_r' => 1.475,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202029)-> #{
    'group' => 101202,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.5,
    'skill_hurt_r' => 1.5,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 885.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101202030)-> #{
    'group' => 101202,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.525,
    'skill_hurt_r' => 1.525,
    'four_d_effect' => [
        #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.4
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 915.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101203001)-> #{
    'group' => 101203,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.15,
    'skill_hurt_r' => 1.15,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203002)-> #{
    'group' => 101203,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.22,
    'skill_hurt_r' => 1.22,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203003)-> #{
    'group' => 101203,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.29,
    'skill_hurt_r' => 1.29,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203004)-> #{
    'group' => 101203,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.36,
    'skill_hurt_r' => 1.36,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203005)-> #{
    'group' => 101203,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.43,
    'skill_hurt_r' => 1.43,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203006)-> #{
    'group' => 101203,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.5,
    'skill_hurt_r' => 1.5,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203007)-> #{
    'group' => 101203,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.57,
    'skill_hurt_r' => 1.57,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203008)-> #{
    'group' => 101203,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.64,
    'skill_hurt_r' => 1.64,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203009)-> #{
    'group' => 101203,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.71,
    'skill_hurt_r' => 1.71,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203010)-> #{
    'group' => 101203,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.78,
    'skill_hurt_r' => 1.78,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203011)-> #{
    'group' => 101203,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.85,
    'skill_hurt_r' => 1.85,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203012)-> #{
    'group' => 101203,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.92,
    'skill_hurt_r' => 1.92,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203013)-> #{
    'group' => 101203,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.99,
    'skill_hurt_r' => 1.99,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203014)-> #{
    'group' => 101203,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.06,
    'skill_hurt_r' => 2.06,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2030.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203015)-> #{
    'group' => 101203,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.13,
    'skill_hurt_r' => 2.13,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2170.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203016)-> #{
    'group' => 101203,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.2,
    'skill_hurt_r' => 2.2,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2310.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203017)-> #{
    'group' => 101203,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.27,
    'skill_hurt_r' => 2.27,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203018)-> #{
    'group' => 101203,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.34,
    'skill_hurt_r' => 2.34,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203019)-> #{
    'group' => 101203,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.41,
    'skill_hurt_r' => 2.41,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203020)-> #{
    'group' => 101203,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.48,
    'skill_hurt_r' => 2.48,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203021)-> #{
    'group' => 101203,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.55,
    'skill_hurt_r' => 2.55,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203022)-> #{
    'group' => 101203,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.62,
    'skill_hurt_r' => 2.62,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203023)-> #{
    'group' => 101203,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.69,
    'skill_hurt_r' => 2.69,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203024)-> #{
    'group' => 101203,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.76,
    'skill_hurt_r' => 2.76,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203025)-> #{
    'group' => 101203,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.83,
    'skill_hurt_r' => 2.83,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203026)-> #{
    'group' => 101203,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.9,
    'skill_hurt_r' => 2.9,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203027)-> #{
    'group' => 101203,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.97,
    'skill_hurt_r' => 2.97,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203028)-> #{
    'group' => 101203,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.04,
    'skill_hurt_r' => 3.04,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203029)-> #{
    'group' => 101203,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.11,
    'skill_hurt_r' => 3.11,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101203030)-> #{
    'group' => 101203,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 1,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.18,
    'skill_hurt_r' => 3.18,
    'effect_of_additional' => [
        #{
            'effect' => 1003,
            'condition' => 8,
            'condition_value' => 0,
            'target_object' => 2,
            'target' => 2,
            'percent_type' => 1,
            'percent' => 0.05
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101301001)-> #{
    'group' => 101301,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.28,
    'skill_hurt_r' => 0.56,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 20.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301002)-> #{
    'group' => 101301,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.305,
    'skill_hurt_r' => 0.585,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 40.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301003)-> #{
    'group' => 101301,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.33,
    'skill_hurt_r' => 0.61,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 60.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301004)-> #{
    'group' => 101301,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.355,
    'skill_hurt_r' => 0.635,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 80.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301005)-> #{
    'group' => 101301,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.38,
    'skill_hurt_r' => 0.66,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 100.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301006)-> #{
    'group' => 101301,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.405,
    'skill_hurt_r' => 0.685,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 120.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301007)-> #{
    'group' => 101301,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.43,
    'skill_hurt_r' => 0.709999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301008)-> #{
    'group' => 101301,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.455,
    'skill_hurt_r' => 0.734999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 160.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301009)-> #{
    'group' => 101301,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.48,
    'skill_hurt_r' => 0.759999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 180.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301010)-> #{
    'group' => 101301,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.505,
    'skill_hurt_r' => 0.784999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 200.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301011)-> #{
    'group' => 101301,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.53,
    'skill_hurt_r' => 0.809999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 220.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301012)-> #{
    'group' => 101301,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.555,
    'skill_hurt_r' => 0.834999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 240.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301013)-> #{
    'group' => 101301,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.58,
    'skill_hurt_r' => 0.859999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 260.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301014)-> #{
    'group' => 101301,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.605,
    'skill_hurt_r' => 0.884999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301015)-> #{
    'group' => 101301,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.63,
    'skill_hurt_r' => 0.909999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 300.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301016)-> #{
    'group' => 101301,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.655,
    'skill_hurt_r' => 0.934999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 320.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301017)-> #{
    'group' => 101301,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.679999999999999,
    'skill_hurt_r' => 0.959999999999999,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 340.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301018)-> #{
    'group' => 101301,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.704999999999999,
    'skill_hurt_r' => 0.984999999999998,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 360.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301019)-> #{
    'group' => 101301,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.729999999999999,
    'skill_hurt_r' => 1.01,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 380.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301020)-> #{
    'group' => 101301,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.754999999999999,
    'skill_hurt_r' => 1.035,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 400.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301021)-> #{
    'group' => 101301,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.779999999999999,
    'skill_hurt_r' => 1.06,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301022)-> #{
    'group' => 101301,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.804999999999999,
    'skill_hurt_r' => 1.085,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 440.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301023)-> #{
    'group' => 101301,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.829999999999999,
    'skill_hurt_r' => 1.11,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 460.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301024)-> #{
    'group' => 101301,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.854999999999999,
    'skill_hurt_r' => 1.135,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 480.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301025)-> #{
    'group' => 101301,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.879999999999999,
    'skill_hurt_r' => 1.16,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 500.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301026)-> #{
    'group' => 101301,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.904999999999999,
    'skill_hurt_r' => 1.185,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 520.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301027)-> #{
    'group' => 101301,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.929999999999999,
    'skill_hurt_r' => 1.21,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 540.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301028)-> #{
    'group' => 101301,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.954999999999999,
    'skill_hurt_r' => 1.235,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301029)-> #{
    'group' => 101301,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.979999999999999,
    'skill_hurt_r' => 1.26,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 580.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101301030)-> #{
    'group' => 101301,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.005,
    'skill_hurt_r' => 1.285,
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 600.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302001)-> #{
    'group' => 101302,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.78,
    'skill_hurt_r' => 0.78,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 30.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302002)-> #{
    'group' => 101302,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.815,
    'skill_hurt_r' => 0.815,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 60.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302003)-> #{
    'group' => 101302,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.85,
    'skill_hurt_r' => 0.85,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 90.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302004)-> #{
    'group' => 101302,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.885,
    'skill_hurt_r' => 0.885,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 120.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302005)-> #{
    'group' => 101302,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.92,
    'skill_hurt_r' => 0.92,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 150.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302006)-> #{
    'group' => 101302,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.955,
    'skill_hurt_r' => 0.955,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 180.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302007)-> #{
    'group' => 101302,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.99,
    'skill_hurt_r' => 0.99,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302008)-> #{
    'group' => 101302,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.025,
    'skill_hurt_r' => 1.025,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 240.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302009)-> #{
    'group' => 101302,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.06,
    'skill_hurt_r' => 1.06,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 270.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302010)-> #{
    'group' => 101302,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.095,
    'skill_hurt_r' => 1.095,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 300.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302011)-> #{
    'group' => 101302,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.13,
    'skill_hurt_r' => 1.13,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 330.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302012)-> #{
    'group' => 101302,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.165,
    'skill_hurt_r' => 1.165,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 360.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302013)-> #{
    'group' => 101302,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.2,
    'skill_hurt_r' => 1.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 390.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302014)-> #{
    'group' => 101302,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.235,
    'skill_hurt_r' => 1.235,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302015)-> #{
    'group' => 101302,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.27,
    'skill_hurt_r' => 1.27,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 450.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302016)-> #{
    'group' => 101302,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.305,
    'skill_hurt_r' => 1.305,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 495.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302017)-> #{
    'group' => 101302,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.34,
    'skill_hurt_r' => 1.34,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302018)-> #{
    'group' => 101302,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.375,
    'skill_hurt_r' => 1.375,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 555.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302019)-> #{
    'group' => 101302,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.41,
    'skill_hurt_r' => 1.41,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 585.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302020)-> #{
    'group' => 101302,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.445,
    'skill_hurt_r' => 1.445,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 615.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302021)-> #{
    'group' => 101302,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.48,
    'skill_hurt_r' => 1.48,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 645.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302022)-> #{
    'group' => 101302,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.515,
    'skill_hurt_r' => 1.515,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 675.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302023)-> #{
    'group' => 101302,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.55,
    'skill_hurt_r' => 1.55,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 705.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302024)-> #{
    'group' => 101302,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.585,
    'skill_hurt_r' => 1.585,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302025)-> #{
    'group' => 101302,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.62,
    'skill_hurt_r' => 1.62,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 765.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302026)-> #{
    'group' => 101302,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.655,
    'skill_hurt_r' => 1.655,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 795.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302027)-> #{
    'group' => 101302,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.69,
    'skill_hurt_r' => 1.69,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 825.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302028)-> #{
    'group' => 101302,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.725,
    'skill_hurt_r' => 1.725,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302029)-> #{
    'group' => 101302,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.76,
    'skill_hurt_r' => 1.76,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 885.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101302030)-> #{
    'group' => 101302,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.795,
    'skill_hurt_r' => 1.795,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.2
        },
         #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 915.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101303001)-> #{
    'group' => 101303,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.5,
    'skill_hurt_r' => 1.5,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 4.5,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 4.5,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303002)-> #{
    'group' => 101303,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 4.68,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 4.68,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303003)-> #{
    'group' => 101303,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.62,
    'skill_hurt_r' => 1.62,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 4.86,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 4.86,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303004)-> #{
    'group' => 101303,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.68,
    'skill_hurt_r' => 1.68,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 5.04,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 5.04,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303005)-> #{
    'group' => 101303,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.74,
    'skill_hurt_r' => 1.74,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 5.22,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 5.22,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303006)-> #{
    'group' => 101303,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.8,
    'skill_hurt_r' => 1.8,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 5.4,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 5.4,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303007)-> #{
    'group' => 101303,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.86,
    'skill_hurt_r' => 1.86,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 5.58,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 5.58,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303008)-> #{
    'group' => 101303,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.92,
    'skill_hurt_r' => 1.92,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 5.76,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 5.76,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303009)-> #{
    'group' => 101303,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.98,
    'skill_hurt_r' => 1.98,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 5.94,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 5.94,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303010)-> #{
    'group' => 101303,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.04,
    'skill_hurt_r' => 2.04,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 6.12,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 6.12,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303011)-> #{
    'group' => 101303,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.1,
    'skill_hurt_r' => 2.1,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 6.3,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 6.3,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303012)-> #{
    'group' => 101303,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.16,
    'skill_hurt_r' => 2.16,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 6.48,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 6.48,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303013)-> #{
    'group' => 101303,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.22,
    'skill_hurt_r' => 2.22,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 6.66,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 6.66,
    'skill_powerbase' => 1890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303014)-> #{
    'group' => 101303,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.28,
    'skill_hurt_r' => 2.28,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 6.84,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 6.84,
    'skill_powerbase' => 2030.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303015)-> #{
    'group' => 101303,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.34,
    'skill_hurt_r' => 2.34,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 7.02,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 7.02,
    'skill_powerbase' => 2170.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303016)-> #{
    'group' => 101303,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.4,
    'skill_hurt_r' => 2.4,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 7.2,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 7.2,
    'skill_powerbase' => 2310.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303017)-> #{
    'group' => 101303,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.46,
    'skill_hurt_r' => 2.46,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 7.38,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 7.38,
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303018)-> #{
    'group' => 101303,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.52,
    'skill_hurt_r' => 2.52,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 7.56,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 7.56,
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303019)-> #{
    'group' => 101303,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.58,
    'skill_hurt_r' => 2.58,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 7.74,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 7.73999999999999,
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303020)-> #{
    'group' => 101303,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.64,
    'skill_hurt_r' => 2.64,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 7.92,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 7.91999999999999,
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303021)-> #{
    'group' => 101303,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.7,
    'skill_hurt_r' => 2.7,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 8.1,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 8.09999999999999,
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303022)-> #{
    'group' => 101303,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.76,
    'skill_hurt_r' => 2.76,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 8.28,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 8.27999999999999,
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303023)-> #{
    'group' => 101303,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.82,
    'skill_hurt_r' => 2.82,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 8.46,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 8.45999999999999,
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303024)-> #{
    'group' => 101303,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.88,
    'skill_hurt_r' => 2.88,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 8.64,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 8.63999999999999,
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303025)-> #{
    'group' => 101303,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.94,
    'skill_hurt_r' => 2.94,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 8.82,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 8.81999999999999,
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303026)-> #{
    'group' => 101303,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.0,
    'skill_hurt_r' => 3.0,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 9,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 8.99999999999999,
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303027)-> #{
    'group' => 101303,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.06,
    'skill_hurt_r' => 3.06,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 9.18,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 9.17999999999999,
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303028)-> #{
    'group' => 101303,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.12,
    'skill_hurt_r' => 3.12,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 9.36,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 9.35999999999999,
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303029)-> #{
    'group' => 101303,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.18,
    'skill_hurt_r' => 3.18,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 9.54,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 9.53999999999999,
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101303030)-> #{
    'group' => 101303,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 2,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.24,
    'skill_hurt_r' => 3.24,
    'effect_of_additional' => [
        #{
            'effect' => 1001,
            'condition' => 0,
            'target_object' => 1,
            'target' => 4,
            'only_one_hurt' => 9.72,
            'hurt_times' => 1
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1011,
            'condition' => 1,
            'condition_type' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'only_one_hurt' => 9.71999999999999,
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101401001)-> #{
    'group' => 101401,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.9,
    'skill_hurt_r' => 0.9,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 30.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401002)-> #{
    'group' => 101401,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.91,
    'skill_hurt_r' => 0.91,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 60.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401003)-> #{
    'group' => 101401,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.92,
    'skill_hurt_r' => 0.92,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 90.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401004)-> #{
    'group' => 101401,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.93,
    'skill_hurt_r' => 0.93,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 120.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401005)-> #{
    'group' => 101401,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.94,
    'skill_hurt_r' => 0.94,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 150.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401006)-> #{
    'group' => 101401,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.95,
    'skill_hurt_r' => 0.95,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 180.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401007)-> #{
    'group' => 101401,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.96,
    'skill_hurt_r' => 0.96,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401008)-> #{
    'group' => 101401,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.97,
    'skill_hurt_r' => 0.97,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 240.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401009)-> #{
    'group' => 101401,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.98,
    'skill_hurt_r' => 0.98,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 270.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401010)-> #{
    'group' => 101401,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 0.99,
    'skill_hurt_r' => 0.99,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 300.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401011)-> #{
    'group' => 101401,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.0,
    'skill_hurt_r' => 1.0,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 330.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401012)-> #{
    'group' => 101401,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.01,
    'skill_hurt_r' => 1.01,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 360.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401013)-> #{
    'group' => 101401,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.02,
    'skill_hurt_r' => 1.02,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 405.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401014)-> #{
    'group' => 101401,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.03,
    'skill_hurt_r' => 1.03,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 435.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401015)-> #{
    'group' => 101401,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.04,
    'skill_hurt_r' => 1.04,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 465.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401016)-> #{
    'group' => 101401,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.05,
    'skill_hurt_r' => 1.05,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 495.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401017)-> #{
    'group' => 101401,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.06,
    'skill_hurt_r' => 1.06,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401018)-> #{
    'group' => 101401,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.07,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 555.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401019)-> #{
    'group' => 101401,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.08,
    'skill_hurt_r' => 1.08,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 585.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401020)-> #{
    'group' => 101401,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.09,
    'skill_hurt_r' => 1.09,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 615.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401021)-> #{
    'group' => 101401,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.1,
    'skill_hurt_r' => 1.1,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 645.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401022)-> #{
    'group' => 101401,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.11,
    'skill_hurt_r' => 1.11,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 675.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401023)-> #{
    'group' => 101401,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.12,
    'skill_hurt_r' => 1.12,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 705.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401024)-> #{
    'group' => 101401,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.13,
    'skill_hurt_r' => 1.13,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401025)-> #{
    'group' => 101401,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.14,
    'skill_hurt_r' => 1.14,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 765.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401026)-> #{
    'group' => 101401,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.15,
    'skill_hurt_r' => 1.15,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 795.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401027)-> #{
    'group' => 101401,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.16,
    'skill_hurt_r' => 1.16,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 825.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401028)-> #{
    'group' => 101401,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.17,
    'skill_hurt_r' => 1.17,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401029)-> #{
    'group' => 101401,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.18,
    'skill_hurt_r' => 1.18,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 885.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101401030)-> #{
    'group' => 101401,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.19,
    'skill_hurt_r' => 1.19,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.12
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.4,
            'buff_list' => [
                1023001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 915.0,
    'skill_powerbase_coefficient' => 200.0
};
get(101402001)-> #{
    'group' => 101402,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.3,
    'skill_hurt_r' => 1.3,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402002)-> #{
    'group' => 101402,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.32,
    'skill_hurt_r' => 1.32,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402003)-> #{
    'group' => 101402,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.34,
    'skill_hurt_r' => 1.34,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402004)-> #{
    'group' => 101402,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.36,
    'skill_hurt_r' => 1.36,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402005)-> #{
    'group' => 101402,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.38,
    'skill_hurt_r' => 1.38,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402006)-> #{
    'group' => 101402,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.4,
    'skill_hurt_r' => 1.4,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402007)-> #{
    'group' => 101402,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.42,
    'skill_hurt_r' => 1.42,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402008)-> #{
    'group' => 101402,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.44,
    'skill_hurt_r' => 1.44,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402009)-> #{
    'group' => 101402,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.46,
    'skill_hurt_r' => 1.46,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402010)-> #{
    'group' => 101402,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.48,
    'skill_hurt_r' => 1.48,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402011)-> #{
    'group' => 101402,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.5,
    'skill_hurt_r' => 1.5,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402012)-> #{
    'group' => 101402,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.52,
    'skill_hurt_r' => 1.52,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402013)-> #{
    'group' => 101402,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.54,
    'skill_hurt_r' => 1.54,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.54,
            'skill_hurt_r' => 1.54,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402014)-> #{
    'group' => 101402,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.56,
            'skill_hurt_r' => 1.56,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402015)-> #{
    'group' => 101402,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.58,
    'skill_hurt_r' => 1.58,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.58,
            'skill_hurt_r' => 1.58,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402016)-> #{
    'group' => 101402,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.6,
    'skill_hurt_r' => 1.6,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.6,
            'skill_hurt_r' => 1.6,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402017)-> #{
    'group' => 101402,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.62,
    'skill_hurt_r' => 1.62,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.62,
            'skill_hurt_r' => 1.62,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402018)-> #{
    'group' => 101402,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.64,
    'skill_hurt_r' => 1.64,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.64,
            'skill_hurt_r' => 1.64,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402019)-> #{
    'group' => 101402,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.66,
    'skill_hurt_r' => 1.66,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.66,
            'skill_hurt_r' => 1.66,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402020)-> #{
    'group' => 101402,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.68,
    'skill_hurt_r' => 1.68,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.68,
            'skill_hurt_r' => 1.68,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402021)-> #{
    'group' => 101402,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.7,
    'skill_hurt_r' => 1.7,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.7,
            'skill_hurt_r' => 1.7,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402022)-> #{
    'group' => 101402,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.72,
    'skill_hurt_r' => 1.72,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.72,
            'skill_hurt_r' => 1.72,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402023)-> #{
    'group' => 101402,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.74,
    'skill_hurt_r' => 1.74,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.74,
            'skill_hurt_r' => 1.74,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402024)-> #{
    'group' => 101402,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.76,
    'skill_hurt_r' => 1.76,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.76,
            'skill_hurt_r' => 1.76,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402025)-> #{
    'group' => 101402,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.78,
    'skill_hurt_r' => 1.78,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.78,
            'skill_hurt_r' => 1.78,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402026)-> #{
    'group' => 101402,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.8,
    'skill_hurt_r' => 1.8,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.8,
            'skill_hurt_r' => 1.8,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402027)-> #{
    'group' => 101402,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.82,
    'skill_hurt_r' => 1.82,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.82,
            'skill_hurt_r' => 1.82,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402028)-> #{
    'group' => 101402,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.84,
    'skill_hurt_r' => 1.84,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.84,
            'skill_hurt_r' => 1.84,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402029)-> #{
    'group' => 101402,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.86,
    'skill_hurt_r' => 1.86,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.86,
            'skill_hurt_r' => 1.86,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101402030)-> #{
    'group' => 101402,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 4,
    'hurt_times' => 2,
    'skill_hurt_l' => 1.88,
    'skill_hurt_r' => 1.88,
    'four_d_effect' => [
        #{
            'effect' => 1005,
            'condition' => 1,
            'condition_type' => 3,
            'value' => 0.2
        },
         #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 1,
            'target_object' => 1,
            'target' => 4,
            'skill_hurt_l' => 1.88,
            'skill_hurt_r' => 1.88,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101403001)-> #{
    'group' => 101403,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.52,
    'skill_hurt_r' => 0.52,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403002)-> #{
    'group' => 101403,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.545,
    'skill_hurt_r' => 0.545,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403003)-> #{
    'group' => 101403,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.57,
    'skill_hurt_r' => 0.57,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403004)-> #{
    'group' => 101403,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.595,
    'skill_hurt_r' => 0.595,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403005)-> #{
    'group' => 101403,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.62,
    'skill_hurt_r' => 0.62,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403006)-> #{
    'group' => 101403,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.645,
    'skill_hurt_r' => 0.645,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403007)-> #{
    'group' => 101403,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.67,
    'skill_hurt_r' => 0.67,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403008)-> #{
    'group' => 101403,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.695,
    'skill_hurt_r' => 0.695,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403009)-> #{
    'group' => 101403,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.72,
    'skill_hurt_r' => 0.72,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403010)-> #{
    'group' => 101403,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.745,
    'skill_hurt_r' => 0.745,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403011)-> #{
    'group' => 101403,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.77,
    'skill_hurt_r' => 0.77,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403012)-> #{
    'group' => 101403,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.795,
    'skill_hurt_r' => 0.795,
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403013)-> #{
    'group' => 101403,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.82,
    'skill_hurt_r' => 0.82,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403014)-> #{
    'group' => 101403,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.845,
    'skill_hurt_r' => 0.845,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2030.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403015)-> #{
    'group' => 101403,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.87,
    'skill_hurt_r' => 0.87,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2170.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403016)-> #{
    'group' => 101403,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.895,
    'skill_hurt_r' => 0.895,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2310.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403017)-> #{
    'group' => 101403,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.92,
    'skill_hurt_r' => 0.92,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403018)-> #{
    'group' => 101403,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.945,
    'skill_hurt_r' => 0.945,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403019)-> #{
    'group' => 101403,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.97,
    'skill_hurt_r' => 0.97,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403020)-> #{
    'group' => 101403,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 0.995,
    'skill_hurt_r' => 0.995,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403021)-> #{
    'group' => 101403,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.02,
    'skill_hurt_r' => 1.02,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403022)-> #{
    'group' => 101403,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.045,
    'skill_hurt_r' => 1.045,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403023)-> #{
    'group' => 101403,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.07,
    'skill_hurt_r' => 1.07,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403024)-> #{
    'group' => 101403,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.095,
    'skill_hurt_r' => 1.095,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403025)-> #{
    'group' => 101403,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.12,
    'skill_hurt_r' => 1.12,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403026)-> #{
    'group' => 101403,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.145,
    'skill_hurt_r' => 1.145,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403027)-> #{
    'group' => 101403,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.17,
    'skill_hurt_r' => 1.17,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403028)-> #{
    'group' => 101403,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.195,
    'skill_hurt_r' => 1.195,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403029)-> #{
    'group' => 101403,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.22,
    'skill_hurt_r' => 1.22,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101403030)-> #{
    'group' => 101403,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 3,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 3,
    'skill_hurt_l' => 1.245,
    'skill_hurt_r' => 1.245,
    'four_d_effect' => [
        #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 4,
            'target' => 5,
            'rate' => 0.1,
            'buff_list' => [
                1024001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101501001)-> #{
    'group' => 101501,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.2,
    'skill_hurt_r' => 1.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 30.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501002)-> #{
    'group' => 101501,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.215,
    'skill_hurt_r' => 1.215,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 60.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501003)-> #{
    'group' => 101501,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.23,
    'skill_hurt_r' => 1.23,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 90.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501004)-> #{
    'group' => 101501,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.245,
    'skill_hurt_r' => 1.245,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 120.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501005)-> #{
    'group' => 101501,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.26,
    'skill_hurt_r' => 1.26,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 150.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501006)-> #{
    'group' => 101501,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.275,
    'skill_hurt_r' => 1.275,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 180.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501007)-> #{
    'group' => 101501,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.29,
    'skill_hurt_r' => 1.29,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501008)-> #{
    'group' => 101501,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.305,
    'skill_hurt_r' => 1.305,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 240.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501009)-> #{
    'group' => 101501,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.32,
    'skill_hurt_r' => 1.32,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 270.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501010)-> #{
    'group' => 101501,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.335,
    'skill_hurt_r' => 1.335,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 300.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501011)-> #{
    'group' => 101501,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.35,
    'skill_hurt_r' => 1.35,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 330.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501012)-> #{
    'group' => 101501,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.365,
    'skill_hurt_r' => 1.365,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 360.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501013)-> #{
    'group' => 101501,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.38,
    'skill_hurt_r' => 1.38,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 390.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501014)-> #{
    'group' => 101501,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.395,
    'skill_hurt_r' => 1.395,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501015)-> #{
    'group' => 101501,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.41,
    'skill_hurt_r' => 1.41,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 450.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501016)-> #{
    'group' => 101501,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.425,
    'skill_hurt_r' => 1.425,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 495.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501017)-> #{
    'group' => 101501,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.44,
    'skill_hurt_r' => 1.44,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 525.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501018)-> #{
    'group' => 101501,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.455,
    'skill_hurt_r' => 1.455,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 555.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501019)-> #{
    'group' => 101501,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.47,
    'skill_hurt_r' => 1.47,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 585.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501020)-> #{
    'group' => 101501,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.485,
    'skill_hurt_r' => 1.485,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 615.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501021)-> #{
    'group' => 101501,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.5,
    'skill_hurt_r' => 1.5,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 645.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501022)-> #{
    'group' => 101501,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.515,
    'skill_hurt_r' => 1.515,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 675.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501023)-> #{
    'group' => 101501,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.53,
    'skill_hurt_r' => 1.53,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 705.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501024)-> #{
    'group' => 101501,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.545,
    'skill_hurt_r' => 1.545,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 735.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501025)-> #{
    'group' => 101501,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.56,
    'skill_hurt_r' => 1.56,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 765.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501026)-> #{
    'group' => 101501,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.575,
    'skill_hurt_r' => 1.575,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 795.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501027)-> #{
    'group' => 101501,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.59,
    'skill_hurt_r' => 1.59,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 825.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501028)-> #{
    'group' => 101501,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.605,
    'skill_hurt_r' => 1.605,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 855.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501029)-> #{
    'group' => 101501,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.62,
    'skill_hurt_r' => 1.62,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 885.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101501030)-> #{
    'group' => 101501,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 5,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.635,
    'skill_hurt_r' => 1.635,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 2,
            'percent' => 0.15
        },
         #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 4,
            'percent' => 0.15
        },
         #{
            'effect' => 1008,
            'condition' => 1,
            'condition_type' => 4,
            'target_object' => 1,
            'target' => 5,
            'rate' => 0.15,
            'buff_list' => [
                1025001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 2,
    'skill_powerbase' => 915.0,
    'skill_powerbase_coefficient' => 150.0
};
get(101502001)-> #{
    'group' => 101502,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.75,
    'skill_hurt_r' => 1.75,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 70.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502002)-> #{
    'group' => 101502,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.8,
    'skill_hurt_r' => 1.8,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502003)-> #{
    'group' => 101502,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.85,
    'skill_hurt_r' => 1.85,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 210.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502004)-> #{
    'group' => 101502,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.9,
    'skill_hurt_r' => 1.9,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502005)-> #{
    'group' => 101502,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 1.95,
    'skill_hurt_r' => 1.95,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 350.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502006)-> #{
    'group' => 101502,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.0,
    'skill_hurt_r' => 2.0,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502007)-> #{
    'group' => 101502,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.05,
    'skill_hurt_r' => 2.05,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 490.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502008)-> #{
    'group' => 101502,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.1,
    'skill_hurt_r' => 2.1,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502009)-> #{
    'group' => 101502,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.15,
    'skill_hurt_r' => 2.15,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 630.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502010)-> #{
    'group' => 101502,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.2,
    'skill_hurt_r' => 2.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502011)-> #{
    'group' => 101502,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.25,
    'skill_hurt_r' => 2.25,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 770.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502012)-> #{
    'group' => 101502,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.3,
    'skill_hurt_r' => 2.3,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502013)-> #{
    'group' => 101502,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.35,
    'skill_hurt_r' => 2.35,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 945.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502014)-> #{
    'group' => 101502,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.4,
    'skill_hurt_r' => 2.4,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1015.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502015)-> #{
    'group' => 101502,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.45,
    'skill_hurt_r' => 2.45,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1085.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502016)-> #{
    'group' => 101502,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.5,
    'skill_hurt_r' => 2.5,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1155.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502017)-> #{
    'group' => 101502,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.55,
    'skill_hurt_r' => 2.55,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1225.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502018)-> #{
    'group' => 101502,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.6,
    'skill_hurt_r' => 2.6,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1295.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502019)-> #{
    'group' => 101502,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.65,
    'skill_hurt_r' => 2.65,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1365.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502020)-> #{
    'group' => 101502,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.7,
    'skill_hurt_r' => 2.7,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1435.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502021)-> #{
    'group' => 101502,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.75,
    'skill_hurt_r' => 2.75,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1505.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502022)-> #{
    'group' => 101502,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.8,
    'skill_hurt_r' => 2.8,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1575.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502023)-> #{
    'group' => 101502,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.85,
    'skill_hurt_r' => 2.85,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1645.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502024)-> #{
    'group' => 101502,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.9,
    'skill_hurt_r' => 2.9,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1715.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502025)-> #{
    'group' => 101502,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.95,
    'skill_hurt_r' => 2.95,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1785.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502026)-> #{
    'group' => 101502,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.0,
    'skill_hurt_r' => 3.0,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1855.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502027)-> #{
    'group' => 101502,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.05,
    'skill_hurt_r' => 3.05,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1925.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502028)-> #{
    'group' => 101502,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.1,
    'skill_hurt_r' => 3.1,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 1995.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502029)-> #{
    'group' => 101502,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.15,
    'skill_hurt_r' => 3.15,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2065.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101502030)-> #{
    'group' => 101502,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 3,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.2,
    'skill_hurt_r' => 3.2,
    'four_d_effect' => [
        #{
            'effect' => 1006,
            'condition' => 1,
            'condition_type' => 1,
            'percent' => 0.25
        },
         #{
            'effect' => 1010,
            'condition' => 1,
            'condition_type' => 3,
            'target_object' => 2,
            'target' => 5,
            'active_time' => 1,
            'prop_type' => <<"crit"/utf8>>,
            'value' => 0.3
        }
    ],
    'is_show' => 1,
    'round' => 3,
    'round_add' => 1,
    'skill_powerbase' => 2135.0,
    'skill_powerbase_coefficient' => 300.0
};
get(101503001)-> #{
    'group' => 101503,
    'level' => 1,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.0,
    'skill_hurt_r' => 2.0,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026001,
                 1027001
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 140.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503002)-> #{
    'group' => 101503,
    'level' => 2,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.11,
    'skill_hurt_r' => 2.11,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026002,
                 1027002
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 280.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503003)-> #{
    'group' => 101503,
    'level' => 3,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.22,
    'skill_hurt_r' => 2.22,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026003,
                 1027003
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 420.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503004)-> #{
    'group' => 101503,
    'level' => 4,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.33,
    'skill_hurt_r' => 2.33,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026004,
                 1027004
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 560.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503005)-> #{
    'group' => 101503,
    'level' => 5,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.44,
    'skill_hurt_r' => 2.44,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026005,
                 1027005
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 700.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503006)-> #{
    'group' => 101503,
    'level' => 6,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.55,
    'skill_hurt_r' => 2.55,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026006,
                 1027006
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 840.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503007)-> #{
    'group' => 101503,
    'level' => 7,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.66,
    'skill_hurt_r' => 2.66,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026007,
                 1027007
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 980.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503008)-> #{
    'group' => 101503,
    'level' => 8,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.77,
    'skill_hurt_r' => 2.77,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026008,
                 1027008
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1120.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503009)-> #{
    'group' => 101503,
    'level' => 9,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.88,
    'skill_hurt_r' => 2.88,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026009,
                 1027009
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1260.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503010)-> #{
    'group' => 101503,
    'level' => 10,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 2.99,
    'skill_hurt_r' => 2.99,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026010,
                 1027010
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1400.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503011)-> #{
    'group' => 101503,
    'level' => 11,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.1,
    'skill_hurt_r' => 3.1,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026011,
                 1027011
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1540.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503012)-> #{
    'group' => 101503,
    'level' => 12,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.21,
    'skill_hurt_r' => 3.21,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026012,
                 1027012
            ]
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1680.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503013)-> #{
    'group' => 101503,
    'level' => 13,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.32,
    'skill_hurt_r' => 3.32,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026013,
                 1027013
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.32,
            'skill_hurt_r' => 3.32,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 1890.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503014)-> #{
    'group' => 101503,
    'level' => 14,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.43,
    'skill_hurt_r' => 3.43,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026014,
                 1027014
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.43,
            'skill_hurt_r' => 3.43,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2030.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503015)-> #{
    'group' => 101503,
    'level' => 15,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.54,
    'skill_hurt_r' => 3.54,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026015,
                 1027015
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.54,
            'skill_hurt_r' => 3.54,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2170.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503016)-> #{
    'group' => 101503,
    'level' => 16,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.65,
    'skill_hurt_r' => 3.65,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026016,
                 1027016
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.65,
            'skill_hurt_r' => 3.65,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2310.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503017)-> #{
    'group' => 101503,
    'level' => 17,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.76,
    'skill_hurt_r' => 3.76,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026017,
                 1027017
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.76,
            'skill_hurt_r' => 3.76,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2450.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503018)-> #{
    'group' => 101503,
    'level' => 18,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.87,
    'skill_hurt_r' => 3.87,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026018,
                 1027018
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.87,
            'skill_hurt_r' => 3.87,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2590.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503019)-> #{
    'group' => 101503,
    'level' => 19,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 3.98,
    'skill_hurt_r' => 3.98,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026019,
                 1027019
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 3.98,
            'skill_hurt_r' => 3.98,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2730.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503020)-> #{
    'group' => 101503,
    'level' => 20,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.09,
    'skill_hurt_r' => 4.09,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026020,
                 1027020
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.09,
            'skill_hurt_r' => 4.09,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 2870.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503021)-> #{
    'group' => 101503,
    'level' => 21,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.2,
    'skill_hurt_r' => 4.2,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026021,
                 1027021
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.2,
            'skill_hurt_r' => 4.2,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3010.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503022)-> #{
    'group' => 101503,
    'level' => 22,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.31,
    'skill_hurt_r' => 4.31,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026022,
                 1027022
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.31,
            'skill_hurt_r' => 4.31,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3150.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503023)-> #{
    'group' => 101503,
    'level' => 23,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.42,
    'skill_hurt_r' => 4.42,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026023,
                 1027023
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.42,
            'skill_hurt_r' => 4.42,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3290.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503024)-> #{
    'group' => 101503,
    'level' => 24,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.53,
    'skill_hurt_r' => 4.53,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026024,
                 1027024
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.53,
            'skill_hurt_r' => 4.53,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3430.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503025)-> #{
    'group' => 101503,
    'level' => 25,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.64,
    'skill_hurt_r' => 4.64,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026025,
                 1027025
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.64,
            'skill_hurt_r' => 4.64,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3570.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503026)-> #{
    'group' => 101503,
    'level' => 26,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.75,
    'skill_hurt_r' => 4.75,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026026,
                 1027026
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.75,
            'skill_hurt_r' => 4.75,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3710.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503027)-> #{
    'group' => 101503,
    'level' => 27,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.86,
    'skill_hurt_r' => 4.86,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026027,
                 1027027
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.86,
            'skill_hurt_r' => 4.86,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3850.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503028)-> #{
    'group' => 101503,
    'level' => 28,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 4.97,
    'skill_hurt_r' => 4.97,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026028,
                 1027028
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 4.97,
            'skill_hurt_r' => 4.97,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 3990.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503029)-> #{
    'group' => 101503,
    'level' => 29,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 5.08,
    'skill_hurt_r' => 5.08,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026029,
                 1027029
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 5.08,
            'skill_hurt_r' => 5.08,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 4130.0,
    'skill_powerbase_coefficient' => 600.0
};
get(101503030)-> #{
    'group' => 101503,
    'level' => 30,
    'active_passive' => 1,
    'skill_type' => 4,
    'skill_type_add' => 4,
    'trigger_army_type' => 0,
    'trigger_hero_type' => 0,
    'active_rand' => 1.0,
    'target_object' => 1,
    'target' => 2,
    'hurt_times' => 1,
    'skill_hurt_l' => 5.19,
    'skill_hurt_r' => 5.19,
    'effect_of_additional' => [
        #{
            'effect' => 1008,
            'condition' => 0,
            'target_object' => 1,
            'target' => 2,
            'rate' => 1,
            'buff_list' => [
                1026030,
                 1027030
            ]
        }
    ],
    'four_d_effect' => [
        #{
            'effect' => 1001,
            'condition' => 1,
            'condition_type' => 2,
            'target_object' => 1,
            'target' => 3,
            'active_rand' => 0.3,
            'skill_hurt_l' => 5.19,
            'skill_hurt_r' => 5.19,
            'hurt_times' => 1
        }
    ],
    'is_show' => 1,
    'round' => 4,
    'round_add' => 1,
    'skill_powerbase' => 4270.0,
    'skill_powerbase_coefficient' => 600.0
};

get(_N) -> false.
get_list() ->
	[100101001,100201001,100301001,100401001,101101001,101101002,101101003,101101004,101101005,101101006,101101007,101101008,101101009,101101010,101101011,101101012,101101013,101101014,101101015,101101016,101101017,101101018,101101019,101101020,101101021,101101022,101101023,101101024,101101025,101101026,101101027,101101028,101101029,101101030,101102001,101102002,101102003,101102004,101102005,101102006,101102007,101102008,101102009,101102010,101102011,101102012,101102013,101102014,101102015,101102016,101102017,101102018,101102019,101102020,101102021,101102022,101102023,101102024,101102025,101102026,101102027,101102028,101102029,101102030,101103001,101103002,101103003,101103004,101103005,101103006,101103007,101103008,101103009,101103010,101103011,101103012,101103013,101103014,101103015,101103016,101103017,101103018,101103019,101103020,101103021,101103022,101103023,101103024,101103025,101103026,101103027,101103028,101103029,101103030,101104001,101104002,101104003,101104004,101104005,101104006,101104007,101104008,101104009,101104010,101104011,101104012,101104013,101104014,101104015,101104016,101104017,101104018,101104019,101104020,101104021,101104022,101104023,101104024,101104025,101104026,101104027,101104028,101104029,101104030,101105001,101105002,101105003,101105004,101105005,101105006,101105007,101105008,101105009,101105010,101105011,101105012,101105013,101105014,101105015,101105016,101105017,101105018,101105019,101105020,101105021,101105022,101105023,101105024,101105025,101105026,101105027,101105028,101105029,101105030,101106001,101106002,101106003,101106004,101106005,101106006,101106007,101106008,101106009,101106010,101106011,101106012,101106013,101106014,101106015,101106016,101106017,101106018,101106019,101106020,101106021,101106022,101106023,101106024,101106025,101106026,101106027,101106028,101106029,101106030,101107001,101107002,101107003,101107004,101107005,101107006,101107007,101107008,101107009,101107010,101107011,101107012,101107013,101107014,101107015,101107016,101107017,101107018,101107019,101107020,101107021,101107022,101107023,101107024,101107025,101107026,101107027,101107028,101107029,101107030,101108001,101108002,101108003,101108004,101108005,101108006,101108007,101108008,101108009,101108010,101108011,101108012,101108013,101108014,101108015,101108016,101108017,101108018,101108019,101108020,101108021,101108022,101108023,101108024,101108025,101108026,101108027,101108028,101108029,101108030,101109001,101109002,101109003,101109004,101109005,101109006,101109007,101109008,101109009,101109010,101109011,101109012,101109013,101109014,101109015,101109016,101109017,101109018,101109019,101109020,101109021,101109022,101109023,101109024,101109025,101109026,101109027,101109028,101109029,101109030,101110001,101110002,101110003,101110004,101110005,101110006,101110007,101110008,101110009,101110010,101110011,101110012,101110013,101110014,101110015,101110016,101110017,101110018,101110019,101110020,101110021,101110022,101110023,101110024,101110025,101110026,101110027,101110028,101110029,101110030,101111001,101111002,101111003,101111004,101111005,101111006,101111007,101111008,101111009,101111010,101111011,101111012,101111013,101111014,101111015,101111016,101111017,101111018,101111019,101111020,101111021,101111022,101111023,101111024,101111025,101111026,101111027,101111028,101111029,101111030,101112001,101112002,101112003,101112004,101112005,101112006,101112007,101112008,101112009,101112010,101112011,101112012,101112013,101112014,101112015,101112016,101112017,101112018,101112019,101112020,101112021,101112022,101112023,101112024,101112025,101112026,101112027,101112028,101112029,101112030,101113001,101113002,101113003,101113004,101113005,101113006,101113007,101113008,101113009,101113010,101113011,101113012,101113013,101113014,101113015,101113016,101113017,101113018,101113019,101113020,101113021,101113022,101113023,101113024,101113025,101113026,101113027,101113028,101113029,101113030,101114001,101114002,101114003,101114004,101114005,101114006,101114007,101114008,101114009,101114010,101114011,101114012,101114013,101114014,101114015,101114016,101114017,101114018,101114019,101114020,101114021,101114022,101114023,101114024,101114025,101114026,101114027,101114028,101114029,101114030,101115001,101115002,101115003,101115004,101115005,101115006,101115007,101115008,101115009,101115010,101115011,101115012,101115013,101115014,101115015,101115016,101115017,101115018,101115019,101115020,101115021,101115022,101115023,101115024,101115025,101115026,101115027,101115028,101115029,101115030,101116001,101116002,101116003,101116004,101116005,101116006,101116007,101116008,101116009,101116010,101116011,101116012,101116013,101116014,101116015,101116016,101116017,101116018,101116019,101116020,101116021,101116022,101116023,101116024,101116025,101116026,101116027,101116028,101116029,101116030,101117001,101117002,101117003,101117004,101117005,101117006,101117007,101117008,101117009,101117010,101117011,101117012,101117013,101117014,101117015,101117016,101117017,101117018,101117019,101117020,101117021,101117022,101117023,101117024,101117025,101117026,101117027,101117028,101117029,101117030,101118001,101118002,101118003,101118004,101118005,101118006,101118007,101118008,101118009,101118010,101118011,101118012,101118013,101118014,101118015,101118016,101118017,101118018,101118019,101118020,101118021,101118022,101118023,101118024,101118025,101118026,101118027,101118028,101118029,101118030,101119001,101119002,101119003,101119004,101119005,101119006,101119007,101119008,101119009,101119010,101119011,101119012,101119013,101119014,101119015,101119016,101119017,101119018,101119019,101119020,101119021,101119022,101119023,101119024,101119025,101119026,101119027,101119028,101119029,101119030,101120001,101120002,101120003,101120004,101120005,101120006,101120007,101120008,101120009,101120010,101120011,101120012,101120013,101120014,101120015,101120016,101120017,101120018,101120019,101120020,101120021,101120022,101120023,101120024,101120025,101120026,101120027,101120028,101120029,101120030,101121001,101121002,101121003,101121004,101121005,101121006,101121007,101121008,101121009,101121010,101121011,101121012,101121013,101121014,101121015,101121016,101121017,101121018,101121019,101121020,101121021,101121022,101121023,101121024,101121025,101121026,101121027,101121028,101121029,101121030,101122001,101122002,101122003,101122004,101122005,101122006,101122007,101122008,101122009,101122010,101122011,101122012,101122013,101122014,101122015,101122016,101122017,101122018,101122019,101122020,101122021,101122022,101122023,101122024,101122025,101122026,101122027,101122028,101122029,101122030,101201001,101201002,101201003,101201004,101201005,101201006,101201007,101201008,101201009,101201010,101201011,101201012,101201013,101201014,101201015,101201016,101201017,101201018,101201019,101201020,101201021,101201022,101201023,101201024,101201025,101201026,101201027,101201028,101201029,101201030,101202001,101202002,101202003,101202004,101202005,101202006,101202007,101202008,101202009,101202010,101202011,101202012,101202013,101202014,101202015,101202016,101202017,101202018,101202019,101202020,101202021,101202022,101202023,101202024,101202025,101202026,101202027,101202028,101202029,101202030,101203001,101203002,101203003,101203004,101203005,101203006,101203007,101203008,101203009,101203010,101203011,101203012,101203013,101203014,101203015,101203016,101203017,101203018,101203019,101203020,101203021,101203022,101203023,101203024,101203025,101203026,101203027,101203028,101203029,101203030,101301001,101301002,101301003,101301004,101301005,101301006,101301007,101301008,101301009,101301010,101301011,101301012,101301013,101301014,101301015,101301016,101301017,101301018,101301019,101301020,101301021,101301022,101301023,101301024,101301025,101301026,101301027,101301028,101301029,101301030,101302001,101302002,101302003,101302004,101302005,101302006,101302007,101302008,101302009,101302010,101302011,101302012,101302013,101302014,101302015,101302016,101302017,101302018,101302019,101302020,101302021,101302022,101302023,101302024,101302025,101302026,101302027,101302028,101302029,101302030,101303001,101303002,101303003,101303004,101303005,101303006,101303007,101303008,101303009,101303010,101303011,101303012,101303013,101303014,101303015,101303016,101303017,101303018,101303019,101303020,101303021,101303022,101303023,101303024,101303025,101303026,101303027,101303028,101303029,101303030,101401001,101401002,101401003,101401004,101401005,101401006,101401007,101401008,101401009,101401010,101401011,101401012,101401013,101401014,101401015,101401016,101401017,101401018,101401019,101401020,101401021,101401022,101401023,101401024,101401025,101401026,101401027,101401028,101401029,101401030,101402001,101402002,101402003,101402004,101402005,101402006,101402007,101402008,101402009,101402010,101402011,101402012,101402013,101402014,101402015,101402016,101402017,101402018,101402019,101402020,101402021,101402022,101402023,101402024,101402025,101402026,101402027,101402028,101402029,101402030,101403001,101403002,101403003,101403004,101403005,101403006,101403007,101403008,101403009,101403010,101403011,101403012,101403013,101403014,101403015,101403016,101403017,101403018,101403019,101403020,101403021,101403022,101403023,101403024,101403025,101403026,101403027,101403028,101403029,101403030,101501001,101501002,101501003,101501004,101501005,101501006,101501007,101501008,101501009,101501010,101501011,101501012,101501013,101501014,101501015,101501016,101501017,101501018,101501019,101501020,101501021,101501022,101501023,101501024,101501025,101501026,101501027,101501028,101501029,101501030,101502001,101502002,101502003,101502004,101502005,101502006,101502007,101502008,101502009,101502010,101502011,101502012,101502013,101502014,101502015,101502016,101502017,101502018,101502019,101502020,101502021,101502022,101502023,101502024,101502025,101502026,101502027,101502028,101502029,101502030,101503001,101503002,101503003,101503004,101503005,101503006,101503007,101503008,101503009,101503010,101503011,101503012,101503013,101503014,101503015,101503016,101503017,101503018,101503019,101503020,101503021,101503022,101503023,101503024,101503025,101503026,101503027,101503028,101503029,101503030].
