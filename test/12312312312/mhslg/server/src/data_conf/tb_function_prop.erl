%%--- coding:utf-8 ---
-module(tb_function_prop).
-export([get/1,get_list/0]).
get(build_value_multi)-> #{
    'name_text' => <<"4183"/utf8>>
};
get(march_speed_multi)-> #{
    'name_text' => <<"4184"/utf8>>
};
get(hunt_units_multi)-> #{
    'name_text' => <<"4185"/utf8>>
};
get(visit_multi)-> #{
    'name_text' => <<"4186"/utf8>>
};
get(taxation_multi)-> #{
    'name_text' => <<"4187"/utf8>>
};
get(wasteland_multi)-> #{
    'name_text' => <<"4188"/utf8>>
};
get(generation_wood_multi)-> #{
    'name_text' => <<"4189"/utf8>>
};
get(mining_multi)-> #{
    'name_text' => <<"4190"/utf8>>
};
get(power)-> #{
    'name_text' => <<"4191"/utf8>>
};
get(skill_powerbase)-> #{
    'name_text' => <<"4192"/utf8>>
};
get(equipment_powerbase)-> #{
    'name_text' => <<"4193"/utf8>>
};
get(star_powerbase)-> #{
    'name_text' => <<"4194"/utf8>>
};
get(aide_powerbase)-> #{
    'name_text' => <<"4195"/utf8>>
};
get(formation_powerbase)-> #{
    'name_text' => <<"4196"/utf8>>
};
get(beast_powerbase)-> #{
    'name_text' => <<"4197"/utf8>>
};
get(soul_powerbase)-> #{
    'name_text' => <<"4198"/utf8>>
};
get(skill_powerbase_coefficient)-> #{
    'name_text' => <<"4199"/utf8>>
};
get(equipment_powerbase_coefficient)-> #{
    'name_text' => <<"4200"/utf8>>
};
get(star_powerbase_coefficient)-> #{
    'name_text' => <<"4201"/utf8>>
};
get(aide_powerbase_coefficient)-> #{
    'name_text' => <<"4202"/utf8>>
};
get(formation_powerbase_coefficient)-> #{
    'name_text' => <<"4203"/utf8>>
};
get(beast_powerbase_coefficient)-> #{
    'name_text' => <<"4204"/utf8>>
};
get(soul_powerbase_coefficient)-> #{
    'name_text' => <<"4205"/utf8>>
};

get(_N) -> false.
get_list() ->
	[build_value_multi,march_speed_multi,hunt_units_multi,visit_multi,taxation_multi,wasteland_multi,generation_wood_multi,mining_multi,power,skill_powerbase,equipment_powerbase,star_powerbase,aide_powerbase,formation_powerbase,beast_powerbase,soul_powerbase,skill_powerbase_coefficient,equipment_powerbase_coefficient,star_powerbase_coefficient,aide_powerbase_coefficient,formation_powerbase_coefficient,beast_powerbase_coefficient,soul_powerbase_coefficient].
