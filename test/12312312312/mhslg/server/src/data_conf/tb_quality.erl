%%--- coding:utf-8 ---
-module(tb_quality).
-export([get/1,get_list/0]).
get(400)-> #{
    'part' => 4,
    'quality' => 0,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 5,
    'supportsterrainholes' => 0,
    'additionalshadowresolution' => 4096,
    'supportssoftshadows' => 1,
    'colorgradinglutsize' => 16
};
get(300)-> #{
    'part' => 3,
    'quality' => 0,
    'ishdr' => 0,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 0,
    'shadowdistance' => 50,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 0,
    'colorgradinglutsize' => 16
};
get(200)-> #{
    'part' => 2,
    'quality' => 0,
    'ishdr' => 0,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 800,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 0,
    'colorgradinglutsize' => 16
};
get(100)-> #{
    'part' => 1,
    'quality' => 0,
    'ishdr' => 0,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 800,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 0,
    'colorgradinglutsize' => 16
};
get(401)-> #{
    'part' => 4,
    'quality' => 1,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 5,
    'supportsterrainholes' => 0,
    'additionalshadowresolution' => 4096,
    'supportssoftshadows' => 1,
    'colorgradinglutsize' => 32
};
get(301)-> #{
    'part' => 3,
    'quality' => 1,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 0,
    'shadowdistance' => 50,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 0,
    'colorgradinglutsize' => 32
};
get(201)-> #{
    'part' => 2,
    'quality' => 1,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 1,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 800,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 1,
    'cascade2split' => 0.25,
    'colorgradinglutsize' => 32
};
get(101)-> #{
    'part' => 1,
    'quality' => 1,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 1,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 800,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 1,
    'cascade2split' => 0.25,
    'colorgradinglutsize' => 32
};
get(402)-> #{
    'part' => 4,
    'quality' => 2,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 0,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 5,
    'supportsterrainholes' => 0,
    'additionalshadowresolution' => 4096,
    'supportssoftshadows' => 1,
    'colorgradinglutsize' => 32
};
get(302)-> #{
    'part' => 3,
    'quality' => 2,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 1,
    'supportscameradepthtexture' => 0,
    'shadowdistance' => 50,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 1,
    'cascade2split' => 0.46,
    'colorgradinglutsize' => 32
};
get(202)-> #{
    'part' => 2,
    'quality' => 2,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 2,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 800,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 1,
    'colorgradinglutsize' => 32
};
get(102)-> #{
    'part' => 1,
    'quality' => 2,
    'ishdr' => 1,
    'msaasamplecount' => 1,
    'shadowcascadeoption' => 2,
    'supportscameradepthtexture' => 1,
    'shadowdistance' => 800,
    'supportsterrainholes' => 1,
    'additionalshadowresolution' => 512,
    'supportssoftshadows' => 1
};

get(_N) -> false.
get_list() ->
	[400,300,200,100,401,301,201,101,402,302,202,102].
