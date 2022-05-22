%%--- coding:utf-8 ---
-module(tb_holiday_name).
-export([get/1,get_list/0]).
get(jieqi_li_chun)-> #{
    'name' => <<"16654"/utf8>>
};
get(jieqi_yu_shui)-> #{
    'name' => <<"16655"/utf8>>
};
get(jieqi_jing_zhe)-> #{
    'name' => <<"16656"/utf8>>
};
get(jieqi_chun_fen)-> #{
    'name' => <<"16657"/utf8>>
};
get(jieqi_qing_ming)-> #{
    'name' => <<"16658"/utf8>>
};
get(jieqi_gu_yu)-> #{
    'name' => <<"16659"/utf8>>
};
get(jieqi_li_xia)-> #{
    'name' => <<"16660"/utf8>>
};
get(jieqi_xiao_man)-> #{
    'name' => <<"16661"/utf8>>
};
get(jieqi_mang_zhong)-> #{
    'name' => <<"16662"/utf8>>
};
get(jieqi_xia_zhi)-> #{
    'name' => <<"16663"/utf8>>
};
get(jieqi_xiao_shu)-> #{
    'name' => <<"16664"/utf8>>
};
get(jieqi_da_shu)-> #{
    'name' => <<"16665"/utf8>>
};
get(jieqi_li_qiu)-> #{
    'name' => <<"16666"/utf8>>
};
get(jieqi_chu_shu)-> #{
    'name' => <<"16667"/utf8>>
};
get(jieqi_bai_lu)-> #{
    'name' => <<"16668"/utf8>>
};
get(jieqi_qiu_fen)-> #{
    'name' => <<"16669"/utf8>>
};
get(jieqi_han_lu)-> #{
    'name' => <<"16670"/utf8>>
};
get(jieqi_shuang_jiang)-> #{
    'name' => <<"16671"/utf8>>
};
get(jieqi_li_dong)-> #{
    'name' => <<"16672"/utf8>>
};
get(jieqi_xiao_xue)-> #{
    'name' => <<"16673"/utf8>>
};
get(jieqi_da_xue)-> #{
    'name' => <<"16674"/utf8>>
};
get(jieqi_dong_zhi)-> #{
    'name' => <<"16675"/utf8>>
};
get(jieqi_xiao_han)-> #{
    'name' => <<"16676"/utf8>>
};
get(jieqi_da_han)-> #{
    'name' => <<"16677"/utf8>>
};
get(cn_xiao_nian)-> #{
    'name' => <<"16678"/utf8>>
};
get(cn_chun_jie)-> #{
    'name' => <<"16679"/utf8>>
};
get(cn_yuan_xiao)-> #{
    'name' => <<"16680"/utf8>>
};
get(cn_long_tai_tou)-> #{
    'name' => <<"16681"/utf8>>
};
get(it_mu_qin_jie)-> #{
    'name' => <<"16682"/utf8>>
};
get(cn_duan_wu_jie)-> #{
    'name' => <<"16683"/utf8>>
};
get(it_fu_qin_jie)-> #{
    'name' => <<"16684"/utf8>>
};
get(cn_qi_xi_jie)-> #{
    'name' => <<"16685"/utf8>>
};
get(cn_zhong_yuan_jie)-> #{
    'name' => <<"16686"/utf8>>
};
get(cn_zhong_qiu_jie)-> #{
    'name' => <<"16687"/utf8>>
};
get(cn_zhong_yang_jie)-> #{
    'name' => <<"16688"/utf8>>
};
get(it_gan_en_jie)-> #{
    'name' => <<"16689"/utf8>>
};
get(cn_la_ba_jie)-> #{
    'name' => <<"16690"/utf8>>
};
get(jieqi_test)-> #{
    'name' => <<"16691"/utf8>>
};

get(_N) -> false.
get_list() ->
	[jieqi_li_chun,jieqi_yu_shui,jieqi_jing_zhe,jieqi_chun_fen,jieqi_qing_ming,jieqi_gu_yu,jieqi_li_xia,jieqi_xiao_man,jieqi_mang_zhong,jieqi_xia_zhi,jieqi_xiao_shu,jieqi_da_shu,jieqi_li_qiu,jieqi_chu_shu,jieqi_bai_lu,jieqi_qiu_fen,jieqi_han_lu,jieqi_shuang_jiang,jieqi_li_dong,jieqi_xiao_xue,jieqi_da_xue,jieqi_dong_zhi,jieqi_xiao_han,jieqi_da_han,cn_xiao_nian,cn_chun_jie,cn_yuan_xiao,cn_long_tai_tou,it_mu_qin_jie,cn_duan_wu_jie,it_fu_qin_jie,cn_qi_xi_jie,cn_zhong_yuan_jie,cn_zhong_qiu_jie,cn_zhong_yang_jie,it_gan_en_jie,cn_la_ba_jie,jieqi_test].
