%%--- coding:utf-8 ---
-module(tb_prop).
-export([get/1,get_list/0]).
get(strength)-> #{
    'name_text' => <<"4206"/utf8>>
};
get(intelect)-> #{
    'name_text' => <<"4207"/utf8>>
};
get(spirit)-> #{
    'name_text' => <<"4208"/utf8>>
};
get(leadership)-> #{
    'name_text' => <<"4209"/utf8>>
};
get(final_attack)-> #{
    'name_text' => <<"4210"/utf8>>
};
get(final_defence)-> #{
    'name_text' => <<"4211"/utf8>>
};
get(final_speed)-> #{
    'name_text' => <<"4212"/utf8>>
};
get(final_troops)-> #{
    'name_text' => <<"4213"/utf8>>
};
get(attack)-> #{
    'name_text' => <<"4214"/utf8>>
};
get(defence)-> #{
    'name_text' => <<"4215"/utf8>>
};
get(speed)-> #{
    'name_text' => <<"4216"/utf8>>
};
get(troops)-> #{
    'name_text' => <<"4217"/utf8>>
};
get(base_attack)-> #{
    'name_text' => <<"4218"/utf8>>
};
get(base_defence)-> #{
    'name_text' => <<"4219"/utf8>>
};
get(base_speed)-> #{
    'name_text' => <<"4220"/utf8>>
};
get(base_troops)-> #{
    'name_text' => <<"4221"/utf8>>
};
get(hit)-> #{
    'name_text' => <<"4222"/utf8>>
};
get(avoid)-> #{
    'name_text' => <<"4223"/utf8>>
};
get(crit)-> #{
    'name_text' => <<"4224"/utf8>>
};
get(crit_red)-> #{
    'name_text' => <<"4225"/utf8>>
};
get(crit_multi)-> #{
    'name_text' => <<"4226"/utf8>>
};
get(piercing)-> #{
    'name_text' => <<"4227"/utf8>>
};
get(parry)-> #{
    'name_text' => <<"4228"/utf8>>
};
get(parry_multi)-> #{
    'name_text' => <<"4229"/utf8>>
};
get(hurt_inc)-> #{
    'name_text' => <<"4230"/utf8>>
};
get(hero_skill_hurt_inc)-> #{
    'name_text' => <<"4231"/utf8>>
};
get(troops_skill_hurt_inc)-> #{
    'name_text' => <<"4232"/utf8>>
};
get(civilian_hurt_inc)-> #{
    'name_text' => <<"4233"/utf8>>
};
get(general_hurt_inc)-> #{
    'name_text' => <<"4234"/utf8>>
};
get(generalist_hurt_inc)-> #{
    'name_text' => <<"4235"/utf8>>
};
get(infantry_hurt_inc)-> #{
    'name_text' => <<"4236"/utf8>>
};
get(cavalry_hurt_inc)-> #{
    'name_text' => <<"4237"/utf8>>
};
get(though_hurt_inc)-> #{
    'name_text' => <<"4238"/utf8>>
};
get(alchemist_hurt_inc)-> #{
    'name_text' => <<"4239"/utf8>>
};
get(former_hurt_inc)-> #{
    'name_text' => <<"4240"/utf8>>
};
get(later_hurt_inc)-> #{
    'name_text' => <<"4241"/utf8>>
};
get(man_hurt_inc)-> #{
    'name_text' => <<"4242"/utf8>>
};
get(woman_hurt_inc)-> #{
    'name_text' => <<"4243"/utf8>>
};
get(hurt_red)-> #{
    'name_text' => <<"4244"/utf8>>
};
get(hero_skill_hurt_red)-> #{
    'name_text' => <<"4245"/utf8>>
};
get(troops_skill_hurt_red)-> #{
    'name_text' => <<"4246"/utf8>>
};
get(civilian_hurt_red)-> #{
    'name_text' => <<"4247"/utf8>>
};
get(general_hurt_red)-> #{
    'name_text' => <<"4248"/utf8>>
};
get(generalist_hurt_red)-> #{
    'name_text' => <<"4249"/utf8>>
};
get(infantry_hurt_red)-> #{
    'name_text' => <<"4250"/utf8>>
};
get(cavalry_hurt_red)-> #{
    'name_text' => <<"4251"/utf8>>
};
get(though_hurt_red)-> #{
    'name_text' => <<"4252"/utf8>>
};
get(alchemist_hurt_red)-> #{
    'name_text' => <<"4253"/utf8>>
};
get(former_hurt_red)-> #{
    'name_text' => <<"4254"/utf8>>
};
get(later_hurt_red)-> #{
    'name_text' => <<"4255"/utf8>>
};
get(man_hurt_red)-> #{
    'name_text' => <<"4256"/utf8>>
};
get(woman_hurt_red)-> #{
    'name_text' => <<"4257"/utf8>>
};
get(final_attack_rate)-> #{
    'name_text' => <<"4210"/utf8>>
};
get(final_defence_rate)-> #{
    'name_text' => <<"4211"/utf8>>
};
get(final_speed_rate)-> #{
    'name_text' => <<"4212"/utf8>>
};
get(final_troops_rate)-> #{
    'name_text' => <<"4213"/utf8>>
};
get(attack_rate)-> #{
    'name_text' => <<"4214"/utf8>>
};
get(defence_rate)-> #{
    'name_text' => <<"4215"/utf8>>
};
get(speed_rate)-> #{
    'name_text' => <<"4216"/utf8>>
};
get(troops_rate)-> #{
    'name_text' => <<"4217"/utf8>>
};
get(base_attack_rate)-> #{
    'name_text' => <<"4218"/utf8>>
};
get(base_defence_rate)-> #{
    'name_text' => <<"4219"/utf8>>
};
get(base_speed_rate)-> #{
    'name_text' => <<"4220"/utf8>>
};
get(base_troops_rate)-> #{
    'name_text' => <<"4221"/utf8>>
};
get(hit_rate)-> #{
    'name_text' => <<"4222"/utf8>>
};
get(avoid_rate)-> #{
    'name_text' => <<"4223"/utf8>>
};
get(crit_rate)-> #{
    'name_text' => <<"4224"/utf8>>
};
get(crit_red_rate)-> #{
    'name_text' => <<"4225"/utf8>>
};
get(crit_multi_rate)-> #{
    'name_text' => <<"4226"/utf8>>
};
get(piercing_rate)-> #{
    'name_text' => <<"4227"/utf8>>
};
get(parry_rate)-> #{
    'name_text' => <<"4228"/utf8>>
};
get(parry_multi_rate)-> #{
    'name_text' => <<"4229"/utf8>>
};
get(break_attack_rate)-> #{
    'name_text' => <<"4258"/utf8>>
};
get(break_defence_rate)-> #{
    'name_text' => <<"3559"/utf8>>
};
get(hurt_inc_rate)-> #{
    'name_text' => <<"4230"/utf8>>
};
get(hero_skill_hurt_inc_rate)-> #{
    'name_text' => <<"4259"/utf8>>
};
get(troops_skill_hurt_inc_rate)-> #{
    'name_text' => <<"4259"/utf8>>
};
get(civilian_hurt_inc_rate)-> #{
    'name_text' => <<"4233"/utf8>>
};
get(general_hurt_inc_rate)-> #{
    'name_text' => <<"4234"/utf8>>
};
get(generalist_hurt_inc_rate)-> #{
    'name_text' => <<"4235"/utf8>>
};
get(infantry_hurt_inc_rate)-> #{
    'name_text' => <<"4236"/utf8>>
};
get(cavalry_hurt_inc_rate)-> #{
    'name_text' => <<"4237"/utf8>>
};
get(though_hurt_inc_rate)-> #{
    'name_text' => <<"4238"/utf8>>
};
get(alchemist_hurt_inc_rate)-> #{
    'name_text' => <<"4239"/utf8>>
};
get(former_hurt_inc_rate)-> #{
    'name_text' => <<"4240"/utf8>>
};
get(later_hurt_inc_rate)-> #{
    'name_text' => <<"4241"/utf8>>
};
get(man_hurt_inc_rate)-> #{
    'name_text' => <<"4242"/utf8>>
};
get(woman_hurt_inc_rate)-> #{
    'name_text' => <<"4243"/utf8>>
};
get(hurt_red_rate)-> #{
    'name_text' => <<"4244"/utf8>>
};
get(hero_skill_hurt_red_rate)-> #{
    'name_text' => <<"4245"/utf8>>
};
get(troops_skill_hurt_red_rate)-> #{
    'name_text' => <<"4246"/utf8>>
};
get(civilian_hurt_red_rate)-> #{
    'name_text' => <<"4247"/utf8>>
};
get(general_hurt_red_rate)-> #{
    'name_text' => <<"4248"/utf8>>
};
get(generalist_hurt_red_rate)-> #{
    'name_text' => <<"4249"/utf8>>
};
get(infantry_hurt_red_rate)-> #{
    'name_text' => <<"4250"/utf8>>
};
get(cavalry_hurt_red_rate)-> #{
    'name_text' => <<"4251"/utf8>>
};
get(though_hurt_red_rate)-> #{
    'name_text' => <<"4252"/utf8>>
};
get(alchemist_hurt_red_rate)-> #{
    'name_text' => <<"4253"/utf8>>
};
get(former_hurt_red_rate)-> #{
    'name_text' => <<"4254"/utf8>>
};
get(later_hurt_red_rate)-> #{
    'name_text' => <<"4255"/utf8>>
};
get(man_hurt_red_rate)-> #{
    'name_text' => <<"4256"/utf8>>
};
get(woman_hurt_red_rate)-> #{
    'name_text' => <<"4257"/utf8>>
};

get(_N) -> false.
get_list() ->
	[strength,intelect,spirit,leadership,final_attack,final_defence,final_speed,final_troops,attack,defence,speed,troops,base_attack,base_defence,base_speed,base_troops,hit,avoid,crit,crit_red,crit_multi,piercing,parry,parry_multi,hurt_inc,hero_skill_hurt_inc,troops_skill_hurt_inc,civilian_hurt_inc,general_hurt_inc,generalist_hurt_inc,infantry_hurt_inc,cavalry_hurt_inc,though_hurt_inc,alchemist_hurt_inc,former_hurt_inc,later_hurt_inc,man_hurt_inc,woman_hurt_inc,hurt_red,hero_skill_hurt_red,troops_skill_hurt_red,civilian_hurt_red,general_hurt_red,generalist_hurt_red,infantry_hurt_red,cavalry_hurt_red,though_hurt_red,alchemist_hurt_red,former_hurt_red,later_hurt_red,man_hurt_red,woman_hurt_red,final_attack_rate,final_defence_rate,final_speed_rate,final_troops_rate,attack_rate,defence_rate,speed_rate,troops_rate,base_attack_rate,base_defence_rate,base_speed_rate,base_troops_rate,hit_rate,avoid_rate,crit_rate,crit_red_rate,crit_multi_rate,piercing_rate,parry_rate,parry_multi_rate,break_attack_rate,break_defence_rate,hurt_inc_rate,hero_skill_hurt_inc_rate,troops_skill_hurt_inc_rate,civilian_hurt_inc_rate,general_hurt_inc_rate,generalist_hurt_inc_rate,infantry_hurt_inc_rate,cavalry_hurt_inc_rate,though_hurt_inc_rate,alchemist_hurt_inc_rate,former_hurt_inc_rate,later_hurt_inc_rate,man_hurt_inc_rate,woman_hurt_inc_rate,hurt_red_rate,hero_skill_hurt_red_rate,troops_skill_hurt_red_rate,civilian_hurt_red_rate,general_hurt_red_rate,generalist_hurt_red_rate,infantry_hurt_red_rate,cavalry_hurt_red_rate,though_hurt_red_rate,alchemist_hurt_red_rate,former_hurt_red_rate,later_hurt_red_rate,man_hurt_red_rate,woman_hurt_red_rate].
