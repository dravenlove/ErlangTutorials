%%--- coding:utf-8 ---
-module(tb_force_prop).
-export([get/1,get_list/0]).
get(attribute_powerbase)-> #{
    'name_text' => <<"1481"/utf8>>
};
get(skill_powerbase)-> #{
    'name_text' => <<"1482"/utf8>>
};
get(equipment_powerbase)-> #{
    'name_text' => <<"1483"/utf8>>
};
get(star_powerbase)-> #{
    'name_text' => <<"1484"/utf8>>
};
get(aide_powerbase)-> #{
    'name_text' => <<"1485"/utf8>>
};
get(formation_powerbase)-> #{
    'name_text' => <<"1486"/utf8>>
};
get(beast_powerbase)-> #{
    'name_text' => <<"1487"/utf8>>
};
get(soul_powerbase)-> #{
    'name_text' => <<"1488"/utf8>>
};

get(_N) -> false.
get_list() ->
	[attribute_powerbase,skill_powerbase,equipment_powerbase,star_powerbase,aide_powerbase,formation_powerbase,beast_powerbase,soul_powerbase].
