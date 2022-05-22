%%--- coding:utf-8 ---
-module(tb_const).
-export([get/1,get_list/0]).
get(session_timeout)-> #{
    'value' => 3600
};
get(system_sender)-> #{
    'strvalue' => <<"系统邮件"/utf8>>
};
get(mail_default_overtime)-> #{
    'value' => 259200
};
get(mail_max_size)-> #{
    'value' => 100
};
get(private_chat_his)-> #{
    'value' => 86400
};
get(chapter_free_times)-> #{
    'value' => 10
};
get(chapter_times_number)-> #{
    'value' => 5
};
get(chapter_hero_num)-> #{
    'value' => 5
};
get(chapter_star_num_list)-> #{
    'jsonvalue' => [
        5,
         9,
         12
    ]
};
get(pack_maintype_sort)-> #{
    'jsonvalue' => [
        103,
         104,
         105,
         106,
         102
    ]
};
get(heart_sec)-> #{
    'value' => 120
};
get(refresh_time)-> #{
    'timevalue' => 18000
};
get(new_role_hero)-> #{
    'jsonvalue' => [
        201
    ]
};
get(new_role_head)-> #{
    'jsonvalue' => [
        1001,
         1002
    ]
};
get(rename_cool_times)-> #{
    'value' => 1000
};
get(rename_cost)-> #{
    'jsonvalue' => [
        [
            102003001,
             1
        ]
    ]
};
get(hero_corps_max_stage)-> #{
    'value' => 60
};
get(hero_corps_stage_common_id)-> #{
    'value' => 102010001
};
get(hero_corps_stage_common_exchange)-> #{
    'jsonvalue' => [
        [
            1,
             2
        ],
         [
            2,
             4
        ],
         [
            3,
             6
        ]
    ]
};
get(building_upgrade_prop_list)-> #{
    'jsonvalue' => [
        101001003,
         101001004,
         101001005,
         101001006
    ]
};
get(quicken_prop_id_list)-> #{
    'jsonvalue' => [
        102013001,
         102013002
    ]
};
get(quicken_gold_time)-> #{
    'jsonvalue' => [
        60,
         1
    ]
};
get(initial_troops_num)-> #{
    'value' => 2
};
get(construction_workers)-> #{
    'value' => 1
};
get(gold)-> #{
    'value' => 101001002
};
get(money)-> #{
    'value' => 101001003
};
get(provisions)-> #{
    'value' => 101001004
};
get(wood)-> #{
    'value' => 101001005
};
get(iron)-> #{
    'value' => 101001006
};
get(feat)-> #{
    'value' => 101001007
};
get(top_prop_id_list)-> #{
    'jsonvalue' => [
        101001007,
         101001006,
         101001005,
         101001004,
         101001003,
         101001002
    ]
};
get(train_gold_time)-> #{
    'jsonvalue' => [
        60,
         1
    ]
};
get(barrack_corps)-> #{
    'jsonvalue' => [
        [
            1060101,
             1
        ],
         [
            1060201,
             2
        ],
         [
            1060301,
             3
        ],
         [
            1060401,
             4
        ]
    ]
};
get(max_show_hero)-> #{
    'value' => 10
};
get(soul)-> #{
    'value' => 102002002
};
get(decompose_use)-> #{
    'jsonvalue' => [
        800,
         1600,
         1600,
         1600,
         3200
    ]
};
get(open_tribute_to_win)-> #{
    'value' => 2
};
get(tribute_percentage)-> #{
    'floatvalue' => 0.05
};
get(annual_award_time)-> #{
    'timevalue' => 82800
};
get(submit_tax_time)-> #{
    'timevalue' => 79200
};
get(pay_tribute_time)-> #{
    'timevalue' => 75600
};
get(city_master_reward)-> #{
    'timevalue' => 72000
};
get(additional_soldiers)-> #{
    'jsonvalue' => [
        1,
         60
    ]
};
get(crit_multiples)-> #{
    'floatvalue' => 1.5
};
get(wash_gold_finger)-> #{
    'jsonvalue' => [
        102021001,
         1
    ]
};
get(hero_level_pre_city)-> #{
    'value' => 3
};
get(science_accelerate_item)-> #{
    'jsonvalue' => [
        101001002,
         1
    ]
};
get(science_accelerate_min)-> #{
    'value' => 2
};
get(chat_common_world)-> #{
    'value' => 100
};
get(chat_common_league)-> #{
    'value' => 100
};
get(chat_common_system)-> #{
    'value' => 100
};
get(chat_common_cluster)-> #{
    'value' => 100
};
get(chat_common_governor)-> #{
    'value' => 100
};
get(deduct_protect_tick)-> #{
    'value' => 14400
};
get(auto_train_interval)-> #{
    'value' => 5000
};
get(auto_train_nobility_id)-> #{
    'value' => 204160
};
get(initial_hold_industry)-> #{
    'value' => 5
};
get(initial_industry_work)-> #{
    'value' => 1
};
get(industry_award_time)-> #{
    'value' => 86400
};
get(industry_waive_time)-> #{
    'value' => 3600
};
get(industry_full_time)-> #{
    'value' => 3600
};
get(building_choose)-> #{
    'jsonvalue' => [
        1,
         2,
         4,
         6,
         8
    ]
};
get(every_time_recover_guard)-> #{
    'jsonvalue' => [
        3600,
         5
    ]
};
get(puppet_max)-> #{
    'value' => 3
};
get(puppet_times)-> #{
    'value' => 5
};
get(puppet_refresh_cost)-> #{
    'jsonvalue' => [
        101001002,
         10
    ]
};
get(puppet_free_refresh_times)-> #{
    'value' => 5
};
get(puppet_lock_cost)-> #{
    'jsonvalue' => [
        101001002,
         10
    ]
};
get(puppet_buy_times_cost)-> #{
    'jsonvalue' => [
        [
            101001002,
             10
        ],
         [
            101001002,
             20
        ]
    ]
};
get(troops_march_consume)-> #{
    'jsonvalue' => [
        0.000185,
         0.016
    ]
};
get(single_season_day)-> #{
    'jsonvalue' => [
        45,
         60,
         90
    ]
};
get(cluster_season_day)-> #{
    'jsonvalue' => [
        45,
         60,
         90
    ]
};
get(world_season_day)-> #{
    'jsonvalue' => [
        45,
         60,
         90
    ]
};
get(equip_suit)-> #{
    'jsonvalue' => [
        101,
         102,
         103,
         104,
         105,
         106,
         107
    ]
};
get(equip_break_limit)-> #{
    'value' => 5
};
get(equip_up_limit)-> #{
    'value' => 24
};
get(player_country)-> #{
    'jsonvalue' => [
        1,
         2,
         3
    ]
};
get(hero_reset_cost)-> #{
    'jsonvalue' => [
        [
            102006005,
             1
        ]
    ]
};
get(hero_free_reset_day)-> #{
    'value' => 7
};
get(assist_hero_skill_limit)-> #{
    'value' => 125
};
get(assist_arms_skill_limit)-> #{
    'value' => 250
};
get(innercityuihidden)-> #{
    'jsonvalue' => [
        30,
         35
    ]
};
get(fight_time_scale)-> #{
    'floatvalue' => 1.5
};
get(initial_soldiers)-> #{
    'value' => 1000
};
get(special_suit_equip_id)-> #{
    'jsonvalue' => [
        102,
         107005102
    ]
};
get(special_suit_add_data)-> #{
    'jsonvalue' => [
        [
            1,
             100
        ],
         [
            2,
             100
        ],
         [
            3,
             100
        ]
    ]
};
get(home_move_time)-> #{
    'floatvalue' => 0.8
};
get(home_fieldofview_time)-> #{
    'floatvalue' => 0.8
};
get(home_reset_time)-> #{
    'floatvalue' => 0.8
};
get(recharge_money)-> #{
    'value' => 101001001
};
get(gradient_list)-> #{
    'jsonvalue' => [
        [
            <<"#B5B5B5"/utf8>>,
             <<"#EFEFEF"/utf8>>,
             <<"#000000"/utf8>>
        ],
         [
            <<"#65FFC0"/utf8>>,
             <<"#E2FFFA"/utf8>>,
             <<"#002815"/utf8>>
        ],
         [
            <<"#44AFFA"/utf8>>,
             <<"#E2F2FF"/utf8>>,
             <<"#080E27"/utf8>>
        ],
         [
            <<"#AD65FF"/utf8>>,
             <<"#FFDBF5"/utf8>>,
             <<"#1B043C"/utf8>>
        ],
         [
            <<"#ff6565"/utf8>>,
             <<"#ffe1db"/utf8>>,
             <<"#390500"/utf8>>
        ],
         [
            <<"#FF81A8"/utf8>>,
             <<"#FFE2EA"/utf8>>,
             <<"#270817"/utf8>>
        ]
    ]
};
get(hall_prop_list)-> #{
    'jsonvalue' => [
        [
            <<"wen_attack_rate"/utf8>>,
             <<"wen_defence_rate"/utf8>>,
             <<"wen_break_attack_rate"/utf8>>,
             <<"wen_break_defence_rate"/utf8>>
        ],
         [
            <<"wu_attack_rate"/utf8>>,
             <<"wu_defence_rate"/utf8>>,
             <<"wu_break_attack_rate"/utf8>>,
             <<"wu_break_defence_rate"/utf8>>
        ],
         [
            <<"quan_attack_rate"/utf8>>,
             <<"quan_defence_rate"/utf8>>,
             <<"quan_break_attack_rate"/utf8>>,
             <<"quan_break_defence_rate"/utf8>>
        ],
         [
            <<"bubing_attack_rate"/utf8>>,
             <<"bubing_defence_rate"/utf8>>,
             <<"bubing_break_attack_rate"/utf8>>,
             <<"bubing_break_defence_rate"/utf8>>
        ],
         [
            <<"qibing_attack_rate"/utf8>>,
             <<"qibing_defence_rate"/utf8>>,
             <<"qibing_break_attack_rate"/utf8>>,
             <<"qibing_break_defence_rate"/utf8>>
        ],
         [
            <<"gongbing_attack_rate"/utf8>>,
             <<"gongbing_defence_rate"/utf8>>,
             <<"gongbing_break_attack_rate"/utf8>>,
             <<"gongbing_break_defence_rate"/utf8>>
        ],
         [
            <<"fangshi_attack_rate"/utf8>>,
             <<"fangshi_defence_rate"/utf8>>,
             <<"fangshi_break_attack_rate"/utf8>>,
             <<"fangshi_break_defence_rate"/utf8>>
        ]
    ]
};
get(hero_formation_reset)-> #{
    'jsonvalue' => [
        [
            102026001,
             1
        ]
    ]
};
get(show_percent_rank)-> #{
    'value' => 1
};
get(core_equip_building_level)-> #{
    'value' => 4
};
get(trigger_hero_distance)-> #{
    'value' => 1000
};

get(_N) -> false.
get_list() ->
	[session_timeout,system_sender,mail_default_overtime,mail_max_size,private_chat_his,chapter_free_times,chapter_times_number,chapter_hero_num,chapter_star_num_list,pack_maintype_sort,heart_sec,refresh_time,new_role_hero,new_role_head,rename_cool_times,rename_cost,hero_corps_max_stage,hero_corps_stage_common_id,hero_corps_stage_common_exchange,building_upgrade_prop_list,quicken_prop_id_list,quicken_gold_time,initial_troops_num,construction_workers,gold,money,provisions,wood,iron,feat,top_prop_id_list,train_gold_time,barrack_corps,max_show_hero,soul,decompose_use,open_tribute_to_win,tribute_percentage,annual_award_time,submit_tax_time,pay_tribute_time,city_master_reward,additional_soldiers,crit_multiples,wash_gold_finger,hero_level_pre_city,science_accelerate_item,science_accelerate_min,chat_common_world,chat_common_league,chat_common_system,chat_common_cluster,chat_common_governor,deduct_protect_tick,auto_train_interval,auto_train_nobility_id,initial_hold_industry,initial_industry_work,industry_award_time,industry_waive_time,industry_full_time,building_choose,every_time_recover_guard,puppet_max,puppet_times,puppet_refresh_cost,puppet_free_refresh_times,puppet_lock_cost,puppet_buy_times_cost,troops_march_consume,single_season_day,cluster_season_day,world_season_day,equip_suit,equip_break_limit,equip_up_limit,player_country,hero_reset_cost,hero_free_reset_day,assist_hero_skill_limit,assist_arms_skill_limit,innercityuihidden,fight_time_scale,initial_soldiers,special_suit_equip_id,special_suit_add_data,home_move_time,home_fieldofview_time,home_reset_time,recharge_money,gradient_list,hall_prop_list,hero_formation_reset,show_percent_rank,core_equip_building_level,trigger_hero_distance].
