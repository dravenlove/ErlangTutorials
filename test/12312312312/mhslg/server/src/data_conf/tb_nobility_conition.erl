%%--- coding:utf-8 ---
-module(tb_nobility_conition).
-export([get/1,get_list/0]).
get(101061)-> #{
    'big' => 6,
    'small' => 1,
    'para1' => 3,
    'para2' => 1010101,
    'des' => <<"4329"/utf8>>
};
get(101021)-> #{
    'big' => 2,
    'small' => 1,
    'para1' => 2,
    'para2' => 0,
    'des' => <<"4330"/utf8>>
};
get(102011)-> #{
    'big' => 1,
    'small' => 1,
    'para1' => 2,
    'des' => <<"4331"/utf8>>
};
get(102021)-> #{
    'big' => 2,
    'small' => 1,
    'para1' => 4,
    'para2' => 0,
    'des' => <<"4332"/utf8>>
};
get(102031)-> #{
    'big' => 3,
    'small' => 1,
    'para1' => 2000,
    'des' => <<"4333"/utf8>>
};
get(102041)-> #{
    'big' => 4,
    'small' => 1,
    'para1' => 200,
    'des' => <<"4334"/utf8>>
};
get(103051)-> #{
    'big' => 5,
    'small' => 1,
    'para1' => 5,
    'des' => <<"①累计完成5个政务"/utf8>>
};
get(103061)-> #{
    'big' => 6,
    'small' => 1,
    'para1' => 6,
    'para2' => 1060101,
    'des' => <<"4336"/utf8>>
};
get(103071)-> #{
    'big' => 7,
    'small' => 1,
    'para1' => 1,
    'para2' => 4,
    'para3' => 5,
    'des' => <<"4337"/utf8>>
};
get(103032)-> #{
    'big' => 3,
    'small' => 2,
    'para1' => 6000,
    'des' => <<"4338"/utf8>>
};
get(104072)-> #{
    'big' => 7,
    'small' => 2,
    'para1' => 2,
    'para2' => 2,
    'para3' => 7,
    'des' => <<"4339"/utf8>>
};
get(104081)-> #{
    'big' => 8,
    'small' => 1,
    'para1' => 50,
    'des' => <<"4340"/utf8>>
};
get(104033)-> #{
    'big' => 3,
    'small' => 3,
    'para1' => 14000,
    'des' => <<"4341"/utf8>>
};
get(104042)-> #{
    'big' => 4,
    'small' => 2,
    'para1' => 3000,
    'des' => <<"4342"/utf8>>
};
get(105052)-> #{
    'big' => 5,
    'small' => 2,
    'para1' => 10,
    'des' => <<"4335"/utf8>>
};
get(105073)-> #{
    'big' => 7,
    'small' => 3,
    'para1' => 1,
    'para2' => 5,
    'para3' => 8,
    'des' => <<"②英雄拥有5个8级以上技能"/utf8>>
};
get(105012)-> #{
    'big' => 1,
    'small' => 2,
    'para1' => 15,
    'des' => <<"4345"/utf8>>
};
get(105034)-> #{
    'big' => 3,
    'small' => 4,
    'para1' => 24000,
    'des' => <<"4346"/utf8>>
};
get(105091)-> #{
    'big' => 9,
    'small' => 1,
    'para1' => 1000,
    'des' => <<"⑤累计城池建设达到1000点"/utf8>>
};
get(106053)-> #{
    'big' => 5,
    'small' => 3,
    'para1' => 12,
    'des' => <<"①累计完成12个政务"/utf8>>
};
get(106082)-> #{
    'big' => 8,
    'small' => 2,
    'para1' => 60,
    'des' => <<"②累计在书院问道分解60张英雄碎片"/utf8>>
};
get(106022)-> #{
    'big' => 2,
    'small' => 2,
    'para1' => 2,
    'para2' => 4,
    'des' => <<"4350"/utf8>>
};
get(106035)-> #{
    'big' => 3,
    'small' => 5,
    'para1' => 42000,
    'des' => <<"4351"/utf8>>
};
get(106092)-> #{
    'big' => 9,
    'small' => 2,
    'para1' => 2000,
    'des' => <<"4347"/utf8>>
};
get(107054)-> #{
    'big' => 5,
    'small' => 4,
    'para1' => 15,
    'des' => <<"①累计完成15个政务"/utf8>>
};
get(107062)-> #{
    'big' => 6,
    'small' => 2,
    'para1' => 3,
    'para2' => 1030101,
    'des' => <<"4354"/utf8>>
};
get(107074)-> #{
    'big' => 7,
    'small' => 4,
    'para1' => 2,
    'para2' => 2,
    'para3' => 10,
    'des' => <<"4355"/utf8>>
};
get(107101)-> #{
    'big' => 10,
    'small' => 1,
    'para1' => 5,
    'des' => <<"④累计使用拜帖进行拜访5次"/utf8>>
};
get(107036)-> #{
    'big' => 3,
    'small' => 6,
    'para1' => 85000,
    'des' => <<"4357"/utf8>>
};
get(108055)-> #{
    'big' => 5,
    'small' => 5,
    'para1' => 18,
    'des' => <<"①累计完成18个政务"/utf8>>
};
get(108063)-> #{
    'big' => 6,
    'small' => 3,
    'para1' => 5,
    'para2' => 1040101,
    'des' => <<"4359"/utf8>>
};
get(108023)-> #{
    'big' => 2,
    'small' => 3,
    'para1' => 4,
    'para2' => 5,
    'des' => <<"4360"/utf8>>
};
get(108037)-> #{
    'big' => 3,
    'small' => 7,
    'para1' => 150000,
    'des' => <<"4361"/utf8>>
};
get(108111)-> #{
    'big' => 11,
    'small' => 1,
    'para1' => 10,
    'des' => <<"⑤累计制作成功5次装备"/utf8>>
};
get(109056)-> #{
    'big' => 5,
    'small' => 6,
    'para1' => 20,
    'des' => <<"①累计完成20个政务"/utf8>>
};
get(109064)-> #{
    'big' => 6,
    'small' => 4,
    'para1' => 6,
    'para2' => 1020101,
    'des' => <<"4364"/utf8>>
};
get(109121)-> #{
    'big' => 12,
    'small' => 1,
    'para1' => 10,
    'des' => <<"③累计使用账本征税10次"/utf8>>
};
get(109038)-> #{
    'big' => 3,
    'small' => 8,
    'para1' => 250000,
    'des' => <<"4366"/utf8>>
};
get(109093)-> #{
    'big' => 9,
    'small' => 3,
    'para1' => 2500,
    'des' => <<"⑤累计城池建设达到2500点"/utf8>>
};
get(110065)-> #{
    'big' => 6,
    'small' => 5,
    'para1' => 10,
    'para2' => 1090101,
    'des' => <<"①内城辎重站达到10级"/utf8>>
};
get(110075)-> #{
    'big' => 7,
    'small' => 5,
    'para1' => 1,
    'para2' => 2,
    'para3' => 18,
    'des' => <<"②英雄拥有2个18级以上技能"/utf8>>
};
get(110131)-> #{
    'big' => 13,
    'small' => 1,
    'para1' => 10,
    'des' => <<"③达成伯爵后完成10个政务"/utf8>>
};
get(110039)-> #{
    'big' => 3,
    'small' => 9,
    'para1' => 500,
    'des' => <<"④累计获得500功勋"/utf8>>
};
get(111076)-> #{
    'big' => 7,
    'small' => 6,
    'para1' => 1,
    'para2' => 2,
    'para3' => 25,
    'des' => <<"①英雄拥有2个25级以上技能"/utf8>>
};
get(111141)-> #{
    'big' => 14,
    'small' => 1,
    'para1' => 300,
    'para2' => 110,
    'des' => <<"②达成侯爵后累计300战功"/utf8>>
};
get(111024)-> #{
    'big' => 2,
    'small' => 4,
    'para1' => 2,
    'para2' => 6,
    'des' => <<"③拥有红色英雄2个"/utf8>>
};
get(111051)-> #{
    'big' => 5,
    'small' => 1,
    'para1' => 12,
    'para2' => 110,
    'des' => <<"④达成侯爵后完成12个政务"/utf8>>
};
get(112077)-> #{
    'big' => 7,
    'small' => 7,
    'para1' => 5,
    'para2' => 5,
    'para3' => 25,
    'des' => <<"①5个英雄拥有5个25级以上技能"/utf8>>
};
get(112142)-> #{
    'big' => 14,
    'small' => 2,
    'para1' => 500,
    'para2' => 111,
    'des' => <<"②达成公爵后累计500战功"/utf8>>
};
get(112025)-> #{
    'big' => 2,
    'small' => 5,
    'para1' => 10,
    'para2' => 6,
    'des' => <<"③拥有红色英雄10个"/utf8>>
};
get(112052)-> #{
    'big' => 5,
    'small' => 2,
    'para1' => 20,
    'para2' => 111,
    'des' => <<"④达成公爵后完成20个政务"/utf8>>
};

get(_N) -> false.
get_list() ->
	[101061,101021,102011,102021,102031,102041,103051,103061,103071,103032,104072,104081,104033,104042,105052,105073,105012,105034,105091,106053,106082,106022,106035,106092,107054,107062,107074,107101,107036,108055,108063,108023,108037,108111,109056,109064,109121,109038,109093,110065,110075,110131,110039,111076,111141,111024,111051,112077,112142,112025,112052].
