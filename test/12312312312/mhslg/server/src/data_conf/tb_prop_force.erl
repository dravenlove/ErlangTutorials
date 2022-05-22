%%--- coding:utf-8 ---
-module(tb_prop_force).
-export([get/1,get_list/0]).
get(hero_crit)-> #{
    'force_value' => 0.0,
    'attribute_powerbase' => 0.0
};
get(qianjun_crit)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(houjun_crit)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(qianjun_parry)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(houjun_parry)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(hero_hurt_inc_rate)-> #{
    'force_value' => 2000.0,
    'attribute_powerbase' => 2000.0
};
get(hero_hurt_red_rate)-> #{
    'force_value' => 2000.0,
    'attribute_powerbase' => 2000.0
};
get(bubing_infantry_hurt_inc_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(qibing_cavalry_hurt_inc_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(gongbing_though_hurt_inc_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(fangshi_alchemist_hurt_inc_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(bubing_infantry_hurt_red_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(qibing_cavalry_hurt_red_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(gongbing_though_hurt_red_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(fangshi_alchemist_hurt_red_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(hero_hero_skill_hurt_inc_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(qianjun_hero_skill_hurt_red_rate)-> #{
    'force_value' => 250.0,
    'attribute_powerbase' => 250.0
};
get(houjun_hero_skill_hurt_red_rate)-> #{
    'force_value' => 250.0,
    'attribute_powerbase' => 250.0
};
get(bingzhong_hero_skill_hurt_red_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(troops_skill_hurt_inc_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(qianjun_troops_skill_hurt_red_rate)-> #{
    'force_value' => 250.0,
    'attribute_powerbase' => 250.0
};
get(houjun_troops_skill_hurt_red_rate)-> #{
    'force_value' => 250.0,
    'attribute_powerbase' => 250.0
};
get(bingzhong_troops_skill_hurt_red_rate)-> #{
    'force_value' => 500.0,
    'attribute_powerbase' => 500.0
};
get(qianjun_civilian_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_civilian_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_general_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_general_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_generalist_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_generalist_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_infantry_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_infantry_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_cavalry_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_cavalry_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_though_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_though_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_alchemist_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_alchemist_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_former_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_former_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_later_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_later_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_man_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_man_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_woman_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(qianjun_woman_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_civilian_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_civilian_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_general_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_general_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_generalist_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_generalist_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_infantry_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_infantry_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_cavalry_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_cavalry_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_though_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_though_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_alchemist_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_alchemist_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_former_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_former_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_later_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_later_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_man_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_man_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_woman_hurt_inc_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(houjun_woman_hurt_red_rate)-> #{
    'force_value' => 150.0,
    'attribute_powerbase' => 150.0
};
get(bingzhong_civilian_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_civilian_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_general_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_general_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_generalist_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_generalist_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_infantry_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_infantry_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_cavalry_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_cavalry_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_though_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_though_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_alchemist_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_alchemist_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_former_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_former_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_later_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_later_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_man_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_man_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_woman_hurt_inc_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};
get(bingzhong_woman_hurt_red_rate)-> #{
    'force_value' => 300.0,
    'attribute_powerbase' => 300.0
};

get(_N) -> false.
get_list() ->
	[hero_crit,qianjun_crit,houjun_crit,qianjun_parry,houjun_parry,hero_hurt_inc_rate,hero_hurt_red_rate,bubing_infantry_hurt_inc_rate,qibing_cavalry_hurt_inc_rate,gongbing_though_hurt_inc_rate,fangshi_alchemist_hurt_inc_rate,bubing_infantry_hurt_red_rate,qibing_cavalry_hurt_red_rate,gongbing_though_hurt_red_rate,fangshi_alchemist_hurt_red_rate,hero_hero_skill_hurt_inc_rate,qianjun_hero_skill_hurt_red_rate,houjun_hero_skill_hurt_red_rate,bingzhong_hero_skill_hurt_red_rate,troops_skill_hurt_inc_rate,qianjun_troops_skill_hurt_red_rate,houjun_troops_skill_hurt_red_rate,bingzhong_troops_skill_hurt_red_rate,qianjun_civilian_hurt_inc_rate,qianjun_civilian_hurt_red_rate,qianjun_general_hurt_inc_rate,qianjun_general_hurt_red_rate,qianjun_generalist_hurt_inc_rate,qianjun_generalist_hurt_red_rate,qianjun_infantry_hurt_inc_rate,qianjun_infantry_hurt_red_rate,qianjun_cavalry_hurt_inc_rate,qianjun_cavalry_hurt_red_rate,qianjun_though_hurt_inc_rate,qianjun_though_hurt_red_rate,qianjun_alchemist_hurt_inc_rate,qianjun_alchemist_hurt_red_rate,qianjun_former_hurt_inc_rate,qianjun_former_hurt_red_rate,qianjun_later_hurt_inc_rate,qianjun_later_hurt_red_rate,qianjun_man_hurt_inc_rate,qianjun_man_hurt_red_rate,qianjun_woman_hurt_inc_rate,qianjun_woman_hurt_red_rate,houjun_civilian_hurt_inc_rate,houjun_civilian_hurt_red_rate,houjun_general_hurt_inc_rate,houjun_general_hurt_red_rate,houjun_generalist_hurt_inc_rate,houjun_generalist_hurt_red_rate,houjun_infantry_hurt_inc_rate,houjun_infantry_hurt_red_rate,houjun_cavalry_hurt_inc_rate,houjun_cavalry_hurt_red_rate,houjun_though_hurt_inc_rate,houjun_though_hurt_red_rate,houjun_alchemist_hurt_inc_rate,houjun_alchemist_hurt_red_rate,houjun_former_hurt_inc_rate,houjun_former_hurt_red_rate,houjun_later_hurt_inc_rate,houjun_later_hurt_red_rate,houjun_man_hurt_inc_rate,houjun_man_hurt_red_rate,houjun_woman_hurt_inc_rate,houjun_woman_hurt_red_rate,bingzhong_civilian_hurt_inc_rate,bingzhong_civilian_hurt_red_rate,bingzhong_general_hurt_inc_rate,bingzhong_general_hurt_red_rate,bingzhong_generalist_hurt_inc_rate,bingzhong_generalist_hurt_red_rate,bingzhong_infantry_hurt_inc_rate,bingzhong_infantry_hurt_red_rate,bingzhong_cavalry_hurt_inc_rate,bingzhong_cavalry_hurt_red_rate,bingzhong_though_hurt_inc_rate,bingzhong_though_hurt_red_rate,bingzhong_alchemist_hurt_inc_rate,bingzhong_alchemist_hurt_red_rate,bingzhong_former_hurt_inc_rate,bingzhong_former_hurt_red_rate,bingzhong_later_hurt_inc_rate,bingzhong_later_hurt_red_rate,bingzhong_man_hurt_inc_rate,bingzhong_man_hurt_red_rate,bingzhong_woman_hurt_inc_rate,bingzhong_woman_hurt_red_rate].
