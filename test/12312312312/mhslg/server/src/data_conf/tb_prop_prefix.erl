%%--- coding:utf-8 ---
-module(tb_prop_prefix).
-export([get/1,get_list/0]).
get(hero)-> #{
    'name_text' => <<"4260"/utf8>>
};
get(qianjun)-> #{
    'name_text' => <<"4261"/utf8>>
};
get(houjun)-> #{
    'name_text' => <<"4262"/utf8>>
};
get(all)-> #{
    'name_text' => <<"4263"/utf8>>
};
get(bingzhong)-> #{
    'name_text' => <<"4264"/utf8>>
};
get(nan)-> #{
    'name_text' => <<"4265"/utf8>>
};
get(nv)-> #{
    'name_text' => <<"4266"/utf8>>
};
get(wen)-> #{
    'name_text' => <<"4267"/utf8>>
};
get(wu)-> #{
    'name_text' => <<"4268"/utf8>>
};
get(quan)-> #{
    'name_text' => <<"4269"/utf8>>
};
get(lanse)-> #{
    'name_text' => <<"4270"/utf8>>
};
get(zise)-> #{
    'name_text' => <<"4271"/utf8>>
};
get(chengse)-> #{
    'name_text' => <<"4272"/utf8>>
};
get(hongse)-> #{
    'name_text' => <<"4273"/utf8>>
};
get(bubing)-> #{
    'name_text' => <<"4274"/utf8>>
};
get(qibing)-> #{
    'name_text' => <<"4275"/utf8>>
};
get(gongbing)-> #{
    'name_text' => <<"4276"/utf8>>
};
get(fangshi)-> #{
    'name_text' => <<"4277"/utf8>>
};
get(wenqianjun)-> #{
    'name_text' => <<"4278"/utf8>>
};
get(wuqianjun)-> #{
    'name_text' => <<"4279"/utf8>>
};
get(quanqianjun)-> #{
    'name_text' => <<"4280"/utf8>>
};
get(wenhoujun)-> #{
    'name_text' => <<"4281"/utf8>>
};
get(wuhoujun)-> #{
    'name_text' => <<"4282"/utf8>>
};
get(quanhoujun)-> #{
    'name_text' => <<"4283"/utf8>>
};
get(chuanqibingzhong)-> #{
    'name_text' => <<"4284"/utf8>>
};
get(round3hero)-> #{
    'name_text' => <<"4285"/utf8>>
};
get(round31hero)-> #{
    'name_text' => <<"4286"/utf8>>
};
get(round32hero)-> #{
    'name_text' => <<"4287"/utf8>>
};
get(round4hero)-> #{
    'name_text' => <<"4288"/utf8>>
};
get(round41hero)-> #{
    'name_text' => <<"4289"/utf8>>
};
get(round42hero)-> #{
    'name_text' => <<"4290"/utf8>>
};
get(round3qianjun)-> #{
    'name_text' => <<"4291"/utf8>>
};
get(round31qianjun)-> #{
    'name_text' => <<"4292"/utf8>>
};
get(round32qianjun)-> #{
    'name_text' => <<"4293"/utf8>>
};
get(round4qianjun)-> #{
    'name_text' => <<"4294"/utf8>>
};
get(round41qianjun)-> #{
    'name_text' => <<"4295"/utf8>>
};
get(round42qianjun)-> #{
    'name_text' => <<"4296"/utf8>>
};
get(round3houjun)-> #{
    'name_text' => <<"4297"/utf8>>
};
get(round31houjun)-> #{
    'name_text' => <<"4298"/utf8>>
};
get(round32houjun)-> #{
    'name_text' => <<"4299"/utf8>>
};
get(round4houjun)-> #{
    'name_text' => <<"4300"/utf8>>
};
get(round41houjun)-> #{
    'name_text' => <<"4301"/utf8>>
};
get(round42houjun)-> #{
    'name_text' => <<"4302"/utf8>>
};
get(round3bingzhong)-> #{
    'name_text' => <<"4303"/utf8>>
};
get(round31bingzhong)-> #{
    'name_text' => <<"4304"/utf8>>
};
get(round32bingzhong)-> #{
    'name_text' => <<"4305"/utf8>>
};
get(round4bingzhong)-> #{
    'name_text' => <<"4306"/utf8>>
};
get(round41bingzhong)-> #{
    'name_text' => <<"4307"/utf8>>
};
get(round42bingzhong)-> #{
    'name_text' => <<"4308"/utf8>>
};

get(_N) -> false.
get_list() ->
	[hero,qianjun,houjun,all,bingzhong,nan,nv,wen,wu,quan,lanse,zise,chengse,hongse,bubing,qibing,gongbing,fangshi,wenqianjun,wuqianjun,quanqianjun,wenhoujun,wuhoujun,quanhoujun,chuanqibingzhong,round3hero,round31hero,round32hero,round4hero,round41hero,round42hero,round3qianjun,round31qianjun,round32qianjun,round4qianjun,round41qianjun,round42qianjun,round3houjun,round31houjun,round32houjun,round4houjun,round41houjun,round42houjun,round3bingzhong,round31bingzhong,round32bingzhong,round4bingzhong,round41bingzhong,round42bingzhong].
