%%--- coding:utf-8 ---
-module(tb_equip_append).
-export([get/1,get_list/0]).
get(100)-> #{
    
};
get(101)-> #{
    'prop' => #{
        'hero_spirit' => 1
    }
};
get(102)-> #{
    'prop' => #{
        'hero_spirit' => 2
    }
};
get(103)-> #{
    'prop' => #{
        'hero_spirit' => 3
    }
};
get(104)-> #{
    'prop' => #{
        'hero_spirit' => 4
    }
};
get(105)-> #{
    'prop' => #{
        'hero_spirit' => 5
    }
};
get(106)-> #{
    'prop' => #{
        'hero_spirit' => 6
    }
};
get(107)-> #{
    'prop' => #{
        'hero_spirit' => 7
    }
};
get(108)-> #{
    'prop' => #{
        'hero_spirit' => 8
    }
};
get(109)-> #{
    'prop' => #{
        'hero_spirit' => 9
    }
};
get(200)-> #{
    
};
get(201)-> #{
    'prop' => #{
        'hero_intelect' => 1
    }
};
get(202)-> #{
    'prop' => #{
        'hero_intelect' => 2
    }
};
get(203)-> #{
    'prop' => #{
        'hero_intelect' => 3
    }
};
get(204)-> #{
    'prop' => #{
        'hero_intelect' => 4
    }
};
get(205)-> #{
    'prop' => #{
        'hero_intelect' => 5
    }
};
get(206)-> #{
    'prop' => #{
        'hero_intelect' => 6
    }
};
get(207)-> #{
    'prop' => #{
        'hero_intelect' => 7
    }
};
get(208)-> #{
    'prop' => #{
        'hero_intelect' => 8
    }
};
get(209)-> #{
    'prop' => #{
        'hero_intelect' => 9
    }
};
get(300)-> #{
    
};
get(301)-> #{
    'prop' => #{
        'hero_spirit' => 1
    }
};
get(302)-> #{
    'prop' => #{
        'hero_spirit' => 2
    }
};
get(303)-> #{
    'prop' => #{
        'hero_spirit' => 3
    }
};
get(304)-> #{
    'prop' => #{
        'hero_spirit' => 4
    }
};
get(305)-> #{
    'prop' => #{
        'hero_spirit' => 5
    }
};
get(306)-> #{
    'prop' => #{
        'hero_spirit' => 6
    }
};
get(307)-> #{
    'prop' => #{
        'hero_spirit' => 7
    }
};
get(308)-> #{
    'prop' => #{
        'hero_spirit' => 8
    }
};
get(309)-> #{
    'prop' => #{
        'hero_spirit' => 9
    }
};
get(400)-> #{
    
};
get(401)-> #{
    'prop' => #{
        'hero_leadership' => 1
    }
};
get(402)-> #{
    'prop' => #{
        'hero_leadership' => 2
    }
};
get(403)-> #{
    'prop' => #{
        'hero_leadership' => 3
    }
};
get(404)-> #{
    'prop' => #{
        'hero_leadership' => 4
    }
};
get(405)-> #{
    'prop' => #{
        'hero_leadership' => 5
    }
};
get(406)-> #{
    'prop' => #{
        'hero_leadership' => 6
    }
};
get(407)-> #{
    'prop' => #{
        'hero_leadership' => 7
    }
};
get(408)-> #{
    'prop' => #{
        'hero_leadership' => 8
    }
};
get(409)-> #{
    'prop' => #{
        'hero_leadership' => 9
    }
};

get(_N) -> false.
get_list() ->
	[100,101,102,103,104,105,106,107,108,109,200,201,202,203,204,205,206,207,208,209,300,301,302,303,304,305,306,307,308,309,400,401,402,403,404,405,406,407,408,409].
