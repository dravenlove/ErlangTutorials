%%--- coding:utf-8 ---
-module(tb_archives_task).
-export([get/1,get_list/0]).
get(100103)-> #{
    'type_id' => 1,
    'sub_id' => 1,
    'order' => 3,
    'archives_title' => <<"万般武艺"/utf8>>,
    'archives_condition' => <<"一个英雄同时拥有12个技能"/utf8>>,
    'archives_text' => <<"万般武艺"/utf8>>,
    'cond' => 12,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 100103
};
get(100201)-> #{
    'type_id' => 1,
    'sub_id' => 2,
    'order' => 1,
    'archives_title' => <<"饱读兵书"/utf8>>,
    'archives_condition' => <<"1个英雄拥有10级技能"/utf8>>,
    'archives_text' => <<"饱读兵书"/utf8>>,
    'cond' => 1,
    'cond_int' => 10,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 100201
};
get(100301)-> #{
    'type_id' => 1,
    'sub_id' => 3,
    'order' => 1,
    'archives_title' => <<"金属狂潮"/utf8>>,
    'archives_condition' => <<"开启3个冶炼厂"/utf8>>,
    'archives_text' => <<"金属狂潮"/utf8>>,
    'cond' => 3,
    'cond_json' => [
        1120201,
         1120202,
         1120203
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100301
};
get(100302)-> #{
    'type_id' => 1,
    'sub_id' => 3,
    'order' => 2,
    'archives_title' => <<"拽耙扶犁"/utf8>>,
    'archives_condition' => <<"开启3个农庄"/utf8>>,
    'archives_text' => <<"拽耙扶犁"/utf8>>,
    'cond' => 3,
    'cond_json' => [
        1120301,
         1120302,
         1120303
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100302
};
get(100402)-> #{
    'type_id' => 1,
    'sub_id' => 4,
    'order' => 2,
    'archives_title' => <<"学富五车"/utf8>>,
    'archives_condition' => <<"进行100次问道"/utf8>>,
    'archives_text' => <<"学富五车"/utf8>>,
    'cond' => 100,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 100402
};
get(100401)-> #{
    'type_id' => 1,
    'sub_id' => 4,
    'order' => 1,
    'archives_title' => <<"学富五马"/utf8>>,
    'archives_condition' => <<"进行10次问道"/utf8>>,
    'archives_text' => <<"学富五马"/utf8>>,
    'cond' => 10,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100401
};
get(100102)-> #{
    'type_id' => 1,
    'sub_id' => 1,
    'order' => 2,
    'archives_title' => <<"千般武艺"/utf8>>,
    'archives_condition' => <<"一个英雄同时拥有8个技能"/utf8>>,
    'archives_text' => <<"千般武艺"/utf8>>,
    'cond' => 8,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 100102
};
get(100101)-> #{
    'type_id' => 1,
    'sub_id' => 1,
    'order' => 1,
    'archives_title' => <<"百般武艺"/utf8>>,
    'archives_condition' => <<"一个英雄同时拥有4个技能"/utf8>>,
    'archives_text' => <<"百般武艺"/utf8>>,
    'cond' => 4,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100101
};
get(100501)-> #{
    'type_id' => 1,
    'sub_id' => 5,
    'order' => 1,
    'archives_title' => <<"大宴宾客"/utf8>>,
    'archives_condition' => <<"酒馆豪饮5次"/utf8>>,
    'archives_text' => <<"大宴宾客"/utf8>>,
    'cond' => 5,
    'cond_int' => 2,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 100501,
    'reward_result' => 1,
    'result_sond' => 1,
    'result_text' => <<"豪饮产出英雄碎片增加1"/utf8>>
};
get(100601)-> #{
    'type_id' => 1,
    'sub_id' => 6,
    'order' => 1,
    'archives_title' => <<"三顾茅庐"/utf8>>,
    'archives_condition' => <<"一天内举行豪饮共计3次"/utf8>>,
    'archives_text' => <<"三顾茅庐"/utf8>>,
    'cond' => 3,
    'cond_int' => 2,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100601
};
get(100403)-> #{
    'type_id' => 1,
    'sub_id' => 4,
    'order' => 3,
    'archives_title' => <<"学富五帅"/utf8>>,
    'archives_condition' => <<"进行1000次问道"/utf8>>,
    'archives_text' => <<"学富五帅"/utf8>>,
    'cond' => 1,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 100403
};
get(100502)-> #{
    'type_id' => 1,
    'sub_id' => 5,
    'order' => 2,
    'archives_title' => <<"一掷千金"/utf8>>,
    'archives_condition' => <<"酒馆举行盛宴1次"/utf8>>,
    'archives_text' => <<"一掷千金"/utf8>>,
    'cond' => 1,
    'cond_int' => 3,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100502
};
get(100602)-> #{
    'type_id' => 1,
    'sub_id' => 6,
    'order' => 2,
    'archives_title' => <<"仗义疏财"/utf8>>,
    'archives_condition' => <<"酒馆举行盛宴10次"/utf8>>,
    'archives_text' => <<"仗义疏财"/utf8>>,
    'cond' => 10,
    'cond_int' => 3,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 100602
};
get(100202)-> #{
    'type_id' => 1,
    'sub_id' => 2,
    'order' => 2,
    'archives_title' => <<"熟读兵法"/utf8>>,
    'archives_condition' => <<"3个英雄拥有15级技能"/utf8>>,
    'archives_text' => <<"熟读兵法"/utf8>>,
    'cond' => 3,
    'cond_int' => 15,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 100202
};
get(100203)-> #{
    'type_id' => 1,
    'sub_id' => 2,
    'order' => 3,
    'archives_title' => <<"深谙兵道"/utf8>>,
    'archives_condition' => <<"5个英雄拥有20级技能"/utf8>>,
    'archives_text' => <<"深谙兵道"/utf8>>,
    'cond' => 5,
    'cond_int' => 20,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 100203
};
get(100701)-> #{
    'type_id' => 1,
    'sub_id' => 7,
    'order' => 1,
    'archives_title' => <<"江东佳话"/utf8>>,
    'archives_condition' => <<"孙策和周瑜同时达到50级"/utf8>>,
    'archives_text' => <<"江东佳话"/utf8>>,
    'cond' => 50,
    'cond_json' => [
        308,
         310
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 100701
};
get(100801)-> #{
    'type_id' => 1,
    'sub_id' => 8,
    'order' => 1,
    'archives_title' => <<"有钱任性"/utf8>>,
    'archives_condition' => <<"累积10000000银两"/utf8>>,
    'archives_text' => <<"有钱任性"/utf8>>,
    'cond' => 10000000,
    'cond_int' => 101001003,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 100801
};
get(100901)-> #{
    'type_id' => 1,
    'sub_id' => 9,
    'order' => 1,
    'archives_title' => <<"天下名驹"/utf8>>,
    'archives_condition' => <<"拥有绝影与爪电"/utf8>>,
    'archives_text' => <<"天下名驹"/utf8>>,
    'cond' => 1,
    'cond_json' => [
        107002005,
         107002003
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 100901
};
get(101001)-> #{
    'type_id' => 1,
    'sub_id' => 10,
    'order' => 1,
    'archives_title' => <<"投机倒把"/utf8>>,
    'archives_condition' => <<"累积使用产业道具50次"/utf8>>,
    'archives_text' => <<"投机倒把"/utf8>>,
    'cond' => 50,
    'cond_json' => [
        102017001,
         102017002,
         102017003,
         102017004,
         102017005,
         102017006
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 101001
};
get(101002)-> #{
    'type_id' => 1,
    'sub_id' => 10,
    'order' => 2,
    'archives_title' => <<"视财如命"/utf8>>,
    'archives_condition' => <<"累积用产业道具200次"/utf8>>,
    'archives_text' => <<"视财如命"/utf8>>,
    'cond' => 200,
    'cond_json' => [
        102017001,
         102017002,
         102017003,
         102017004,
         102017005,
         102017006
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 101002
};
get(101101)-> #{
    'type_id' => 1,
    'sub_id' => 11,
    'order' => 1,
    'archives_title' => <<"五朵金花"/utf8>>,
    'archives_condition' => <<"同时拥有紫色品质貂蝉、马云禄、甄姬、孙尚香、祝融"/utf8>>,
    'archives_text' => <<"五朵金花"/utf8>>,
    'cond' => 5,
    'cond_int' => 4,
    'cond_json' => [
        406,
         408,
         401,
         402,
         403
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 101101
};
get(101102)-> #{
    'type_id' => 1,
    'sub_id' => 11,
    'order' => 2,
    'archives_title' => <<"五子良将"/utf8>>,
    'archives_condition' => <<"同时拥有金色品质张辽、乐进、于禁、张郃、徐晃"/utf8>>,
    'archives_text' => <<"五子良将"/utf8>>,
    'cond' => 5,
    'cond_int' => 5,
    'cond_json' => [
        306,
         108,
         106,
         204,
         113
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 5,
    'reward_id' => 101102
};
get(101103)-> #{
    'type_id' => 1,
    'sub_id' => 11,
    'order' => 3,
    'archives_title' => <<"五大谋士"/utf8>>,
    'archives_condition' => <<"同时拥有紫色品质荀彧、荀攸、贾诩、陈宫、郭嘉"/utf8>>,
    'archives_text' => <<"五大谋士"/utf8>>,
    'cond' => 5,
    'cond_int' => 4,
    'cond_json' => [
        206,
         107,
         305,
         307,
         112
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 101103
};
get(101104)-> #{
    'type_id' => 1,
    'sub_id' => 11,
    'order' => 4,
    'archives_title' => <<"五虎上将"/utf8>>,
    'archives_condition' => <<"同时拥有金色品质关羽、张飞、赵云、马超、黄忠"/utf8>>,
    'archives_text' => <<"五虎上将"/utf8>>,
    'cond' => 5,
    'cond_int' => 5,
    'cond_json' => [
        301,
         203,
         201,
         302,
         207
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 5,
    'reward_id' => 101104
};
get(101201)-> #{
    'type_id' => 1,
    'sub_id' => 12,
    'order' => 1,
    'archives_title' => <<"剑夫银妇"/utf8>>,
    'archives_condition' => <<"董卓和貂蝉同时上阵"/utf8>>,
    'archives_text' => <<"剑夫银妇"/utf8>>,
    'cond' => 1,
    'cond_json' => [
        311,
         402
    ],
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 101201
};
get(200101)-> #{
    'type_id' => 2,
    'sub_id' => 1,
    'order' => 1,
    'archives_title' => <<"厚德载物"/utf8>>,
    'archives_condition' => <<"被任命为太守"/utf8>>,
    'archives_text' => <<"厚德载物"/utf8>>,
    'cond' => 1,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 200101
};
get(200201)-> #{
    'type_id' => 2,
    'sub_id' => 2,
    'order' => 1,
    'archives_title' => <<"两仪四象"/utf8>>,
    'archives_condition' => <<"同时编组4支队伍"/utf8>>,
    'archives_text' => <<"两仪四象"/utf8>>,
    'cond' => 4,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 200201
};
get(200202)-> #{
    'type_id' => 2,
    'sub_id' => 2,
    'order' => 2,
    'archives_title' => <<"八门金锁"/utf8>>,
    'archives_condition' => <<"同时编组8支队伍"/utf8>>,
    'archives_text' => <<"八门金锁"/utf8>>,
    'cond' => 8,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 200202
};
get(200301)-> #{
    'type_id' => 2,
    'sub_id' => 3,
    'order' => 1,
    'archives_title' => <<"养兵十日"/utf8>>,
    'archives_condition' => <<"累积训练时间10小时"/utf8>>,
    'archives_text' => <<"养兵十日"/utf8>>,
    'cond' => 36000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 200301
};
get(200302)-> #{
    'type_id' => 2,
    'sub_id' => 3,
    'order' => 2,
    'archives_title' => <<"养兵千日"/utf8>>,
    'archives_condition' => <<"累积训练时间100小时"/utf8>>,
    'archives_text' => <<"养兵千日"/utf8>>,
    'cond' => 360000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 200302
};
get(200401)-> #{
    'type_id' => 2,
    'sub_id' => 4,
    'order' => 1,
    'archives_title' => <<"募兵为伍"/utf8>>,
    'archives_condition' => <<"建造总共50000个士兵"/utf8>>,
    'archives_text' => <<"募兵为伍"/utf8>>,
    'cond' => 50000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 200401
};
get(200402)-> #{
    'type_id' => 2,
    'sub_id' => 4,
    'order' => 2,
    'archives_title' => <<"火列星屯"/utf8>>,
    'archives_condition' => <<"建造总共1000000个士兵"/utf8>>,
    'archives_text' => <<"火列星屯"/utf8>>,
    'cond' => 1000000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 5,
    'reward_id' => 200402
};
get(200501)-> #{
    'type_id' => 2,
    'sub_id' => 5,
    'order' => 1,
    'archives_title' => <<"止战之殇"/utf8>>,
    'archives_condition' => <<"共计在战斗中消耗10000士兵"/utf8>>,
    'archives_text' => <<"止战之殇"/utf8>>,
    'cond' => 10000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 200501
};
get(200502)-> #{
    'type_id' => 2,
    'sub_id' => 5,
    'order' => 2,
    'archives_title' => <<"戎马倥惚"/utf8>>,
    'archives_condition' => <<"共计在战斗中消耗100000士兵"/utf8>>,
    'archives_text' => <<"戎马倥惚"/utf8>>,
    'cond' => 100000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 200502
};
get(200503)-> #{
    'type_id' => 2,
    'sub_id' => 5,
    'order' => 3,
    'archives_title' => <<"穷兵黩武"/utf8>>,
    'archives_condition' => <<"共计在战斗中消耗1000000个士兵"/utf8>>,
    'archives_text' => <<"穷兵黩武"/utf8>>,
    'cond' => 1000000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 5,
    'reward_id' => 200503
};
get(200601)-> #{
    'type_id' => 2,
    'sub_id' => 6,
    'order' => 1,
    'archives_title' => <<"精忠报国"/utf8>>,
    'archives_condition' => <<"参与1次国战"/utf8>>,
    'archives_text' => <<"精忠报国"/utf8>>,
    'cond' => 1,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 200601
};
get(200602)-> #{
    'type_id' => 2,
    'sub_id' => 6,
    'order' => 2,
    'archives_title' => <<"赤胆忠心"/utf8>>,
    'archives_condition' => <<"参加100次国战"/utf8>>,
    'archives_text' => <<"赤胆忠心"/utf8>>,
    'cond' => 100,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 200602
};
get(200701)-> #{
    'type_id' => 2,
    'sub_id' => 7,
    'order' => 1,
    'archives_title' => <<"军事扩张"/utf8>>,
    'archives_condition' => <<"开启4个兵营"/utf8>>,
    'archives_text' => <<"军事扩张"/utf8>>,
    'cond' => 4,
    'cond_int' => 106,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 200701
};
get(200801)-> #{
    'type_id' => 2,
    'sub_id' => 8,
    'order' => 1,
    'archives_title' => <<"沙场新星"/utf8>>,
    'archives_condition' => <<"共计击败10000个士兵"/utf8>>,
    'archives_text' => <<"沙场新星"/utf8>>,
    'cond' => 10000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 200801
};
get(200802)-> #{
    'type_id' => 2,
    'sub_id' => 8,
    'order' => 2,
    'archives_title' => <<"沙场英豪"/utf8>>,
    'archives_condition' => <<"共计击败1000000个士兵"/utf8>>,
    'archives_text' => <<"沙场英豪"/utf8>>,
    'cond' => 1000000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 200802
};
get(200803)-> #{
    'type_id' => 2,
    'sub_id' => 8,
    'order' => 3,
    'archives_title' => <<"灭神转世"/utf8>>,
    'archives_condition' => <<"共计击败10000000个士兵"/utf8>>,
    'archives_text' => <<"灭神转世"/utf8>>,
    'cond' => 10000000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 200803
};
get(200901)-> #{
    'type_id' => 2,
    'sub_id' => 9,
    'order' => 1,
    'archives_title' => <<"十万雄狮"/utf8>>,
    'archives_condition' => <<"囤积100000个士兵"/utf8>>,
    'archives_text' => <<"十万雄狮"/utf8>>,
    'cond' => 100000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 200901
};
get(200902)-> #{
    'type_id' => 2,
    'sub_id' => 9,
    'order' => 2,
    'archives_title' => <<"百万雄狮"/utf8>>,
    'archives_condition' => <<"囤积1000000个士兵"/utf8>>,
    'archives_text' => <<"百万雄狮"/utf8>>,
    'cond' => 1000000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 200902
};
get(201001)-> #{
    'type_id' => 2,
    'sub_id' => 10,
    'order' => 1,
    'archives_title' => <<"擒贼擒将"/utf8>>,
    'archives_condition' => <<"国战中累计击杀大将10次"/utf8>>,
    'archives_text' => <<"擒贼擒将"/utf8>>,
    'cond' => 10,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 201001
};
get(201002)-> #{
    'type_id' => 2,
    'sub_id' => 10,
    'order' => 2,
    'archives_title' => <<"擒贼擒王"/utf8>>,
    'archives_condition' => <<"国战中累计击杀大将100次"/utf8>>,
    'archives_text' => <<"擒贼擒王"/utf8>>,
    'cond' => 100,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 201002
};
get(201101)-> #{
    'type_id' => 2,
    'sub_id' => 11,
    'order' => 1,
    'archives_title' => <<"盖世无双"/utf8>>,
    'archives_condition' => <<"单次国战击杀200000士兵"/utf8>>,
    'archives_text' => <<"盖世无双"/utf8>>,
    'cond' => 200000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 201101
};
get(201201)-> #{
    'type_id' => 2,
    'sub_id' => 12,
    'order' => 1,
    'archives_title' => <<"九五之尊"/utf8>>,
    'archives_condition' => <<"被推举成为丞相"/utf8>>,
    'archives_text' => <<"九五之尊"/utf8>>,
    'cond' => 10,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 5,
    'reward_id' => 201201
};
get(300101)-> #{
    'type_id' => 3,
    'sub_id' => 1,
    'order' => 1,
    'archives_title' => <<"实业建邦"/utf8>>,
    'archives_condition' => <<"完成10个建设类政务"/utf8>>,
    'archives_text' => <<"实业建邦"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300101
};
get(300201)-> #{
    'type_id' => 3,
    'sub_id' => 2,
    'order' => 1,
    'archives_title' => <<"以权谋私"/utf8>>,
    'archives_condition' => <<"单日政务打点3次"/utf8>>,
    'archives_text' => <<"以权谋私"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300201
};
get(300301)-> #{
    'type_id' => 3,
    'sub_id' => 3,
    'order' => 1,
    'archives_title' => <<"我的地盘"/utf8>>,
    'archives_condition' => <<"拥有1片自己的产业"/utf8>>,
    'archives_text' => <<"我的地盘"/utf8>>,
    'cond' => 1,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300301
};
get(300401)-> #{
    'type_id' => 3,
    'sub_id' => 4,
    'order' => 1,
    'archives_title' => <<"弄权谋事"/utf8>>,
    'archives_condition' => <<"开启10个特权"/utf8>>,
    'archives_text' => <<"弄权谋事"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 300401
};
get(300501)-> #{
    'type_id' => 3,
    'sub_id' => 5,
    'order' => 1,
    'archives_title' => <<"建国兴邦"/utf8>>,
    'archives_condition' => <<"提升1000点建设值"/utf8>>,
    'archives_text' => <<"建国兴邦"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 300501
};
get(300601)-> #{
    'type_id' => 3,
    'sub_id' => 6,
    'order' => 1,
    'archives_title' => <<"小试牛刀"/utf8>>,
    'archives_condition' => <<"累积消费100黄金"/utf8>>,
    'archives_text' => <<"小试牛刀"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 300601
};
get(300701)-> #{
    'type_id' => 3,
    'sub_id' => 7,
    'order' => 1,
    'archives_title' => <<"居功至伟"/utf8>>,
    'archives_condition' => <<"政务评价达到居功至伟1次"/utf8>>,
    'archives_text' => <<"居功至伟"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 300701
};
get(300202)-> #{
    'type_id' => 3,
    'sub_id' => 2,
    'order' => 2,
    'archives_title' => <<"职场之道"/utf8>>,
    'archives_condition' => <<"打点达到10次"/utf8>>,
    'archives_text' => <<"职场之道"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300202
};
get(300801)-> #{
    'type_id' => 3,
    'sub_id' => 8,
    'order' => 1,
    'archives_title' => <<"卖官鬻爵"/utf8>>,
    'archives_condition' => <<"美言几句达到10次"/utf8>>,
    'archives_text' => <<"卖官鬻爵"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300801
};
get(300602)-> #{
    'type_id' => 3,
    'sub_id' => 6,
    'order' => 2,
    'archives_title' => <<"挥金如土"/utf8>>,
    'archives_condition' => <<"累积消耗10000黄金"/utf8>>,
    'archives_text' => <<"挥金如土"/utf8>>,
    'cond' => 10000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 300602
};
get(300603)-> #{
    'type_id' => 3,
    'sub_id' => 6,
    'order' => 3,
    'archives_title' => <<"挥霍无度"/utf8>>,
    'archives_condition' => <<"累积消耗1000000黄金"/utf8>>,
    'archives_text' => <<"挥霍无度"/utf8>>,
    'cond' => 1000000,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 300603
};
get(300901)-> #{
    'type_id' => 3,
    'sub_id' => 9,
    'order' => 1,
    'archives_title' => <<"五谷丰登"/utf8>>,
    'archives_condition' => <<"累计使用产业道具达到10个小时"/utf8>>,
    'archives_text' => <<"五谷丰登"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300901
};
get(300902)-> #{
    'type_id' => 3,
    'sub_id' => 9,
    'order' => 2,
    'archives_title' => <<"民安物阜"/utf8>>,
    'archives_condition' => <<"累积使用产业道具达到100小时"/utf8>>,
    'archives_text' => <<"民安物阜"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 300902
};
get(300903)-> #{
    'type_id' => 3,
    'sub_id' => 9,
    'order' => 3,
    'archives_title' => <<"时和岁稔"/utf8>>,
    'archives_condition' => <<"累计使用产业道具达到1000小时"/utf8>>,
    'archives_text' => <<"时和岁稔"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 300903
};
get(300203)-> #{
    'type_id' => 3,
    'sub_id' => 2,
    'order' => 3,
    'archives_title' => <<"涂歌里咏"/utf8>>,
    'archives_condition' => <<"完成50个政务"/utf8>>,
    'archives_text' => <<"涂歌里咏"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 300203
};
get(300204)-> #{
    'type_id' => 3,
    'sub_id' => 2,
    'order' => 4,
    'archives_title' => <<"涂歌邑咏"/utf8>>,
    'archives_condition' => <<"完成500个政务"/utf8>>,
    'archives_text' => <<"涂歌邑咏"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 300204
};
get(300102)-> #{
    'type_id' => 3,
    'sub_id' => 1,
    'order' => 2,
    'archives_title' => <<"实业兴邦"/utf8>>,
    'archives_condition' => <<"完成100个建设类政务"/utf8>>,
    'archives_text' => <<"实业兴邦"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 300102
};
get(301001)-> #{
    'type_id' => 3,
    'sub_id' => 10,
    'order' => 1,
    'archives_title' => <<"人民公仆"/utf8>>,
    'archives_condition' => <<"完成10个击败山贼类政务"/utf8>>,
    'archives_text' => <<"人民公仆"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 301001
};
get(301002)-> #{
    'type_id' => 3,
    'sub_id' => 10,
    'order' => 2,
    'archives_title' => <<"国家守护神"/utf8>>,
    'archives_condition' => <<"完成100个击败山贼类政务"/utf8>>,
    'archives_text' => <<"国家守护神"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 301002
};
get(301101)-> #{
    'type_id' => 3,
    'sub_id' => 11,
    'order' => 1,
    'archives_title' => <<"希望工程"/utf8>>,
    'archives_condition' => <<"完成10个捐献类政务"/utf8>>,
    'archives_text' => <<"希望工程"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 301101
};
get(301102)-> #{
    'type_id' => 3,
    'sub_id' => 11,
    'order' => 2,
    'archives_title' => <<"希望基金会"/utf8>>,
    'archives_condition' => <<"完成100个捐献类政务"/utf8>>,
    'archives_text' => <<"希望基金会"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 301102
};
get(300702)-> #{
    'type_id' => 3,
    'sub_id' => 7,
    'order' => 2,
    'archives_title' => <<"可圈可点"/utf8>>,
    'archives_condition' => <<"政务评价达到可圈可点5次"/utf8>>,
    'archives_text' => <<"可圈可点"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 300702
};
get(300703)-> #{
    'type_id' => 3,
    'sub_id' => 7,
    'order' => 3,
    'archives_title' => <<"出类拔萃"/utf8>>,
    'archives_condition' => <<"政务评价达到出类拔萃10次"/utf8>>,
    'archives_text' => <<"出类拔萃"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 300703
};
get(300704)-> #{
    'type_id' => 3,
    'sub_id' => 7,
    'order' => 4,
    'archives_title' => <<"不同凡响"/utf8>>,
    'archives_condition' => <<"政务评价达到不同凡响15次"/utf8>>,
    'archives_text' => <<"不同凡响"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 300704
};
get(300402)-> #{
    'type_id' => 3,
    'sub_id' => 4,
    'order' => 2,
    'archives_title' => <<"只手遮天"/utf8>>,
    'archives_condition' => <<"总共开启20个特权"/utf8>>,
    'archives_text' => <<"只手遮天"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 300402
};
get(301201)-> #{
    'type_id' => 3,
    'sub_id' => 12,
    'order' => 1,
    'archives_title' => <<"吹毛求疵"/utf8>>,
    'archives_condition' => <<"单日刷新10次政务"/utf8>>,
    'archives_text' => <<"吹毛求疵"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 4,
    'reward_id' => 301201
};
get(301301)-> #{
    'type_id' => 3,
    'sub_id' => 13,
    'order' => 1,
    'archives_title' => <<"搬砖如风"/utf8>>,
    'archives_condition' => <<"累积黄金加速建设100小时"/utf8>>,
    'archives_text' => <<"搬砖如风"/utf8>>,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 301301
};
get(301401)-> #{
    'type_id' => 3,
    'sub_id' => 14,
    'order' => 1,
    'archives_title' => <<"顺风速运"/utf8>>,
    'archives_condition' => <<"一次行军中使用10个急速行军"/utf8>>,
    'archives_text' => <<"顺风速运"/utf8>>,
    'cond' => 10,
    'is_show' => 1,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 301401
};
get(400101)-> #{
    'type_id' => 4,
    'sub_id' => 1,
    'order' => 1,
    'archives_title' => <<"以退为进"/utf8>>,
    'archives_condition' => <<"国战中撤军1次"/utf8>>,
    'archives_text' => <<"以退为进"/utf8>>,
    'cond' => 1,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400101
};
get(400102)-> #{
    'type_id' => 4,
    'sub_id' => 1,
    'order' => 2,
    'archives_title' => <<"屡进屡退"/utf8>>,
    'archives_condition' => <<"国战中撤军10次"/utf8>>,
    'archives_text' => <<"屡进屡退"/utf8>>,
    'cond' => 10,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 2,
    'reward_id' => 400102
};
get(400103)-> #{
    'type_id' => 4,
    'sub_id' => 1,
    'order' => 3,
    'archives_title' => <<"我是怂货"/utf8>>,
    'archives_condition' => <<"国战中撤军100次"/utf8>>,
    'archives_text' => <<"我是怂货"/utf8>>,
    'cond' => 100,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 3,
    'reward_id' => 400103
};
get(400201)-> #{
    'type_id' => 4,
    'sub_id' => 2,
    'order' => 1,
    'archives_title' => <<"嗯？？？"/utf8>>,
    'archives_condition' => <<"遗忘1个技能"/utf8>>,
    'archives_text' => <<"嗯？？？"/utf8>>,
    'cond' => 1,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400201
};
get(400301)-> #{
    'type_id' => 4,
    'sub_id' => 3,
    'order' => 1,
    'archives_title' => <<"浑水摸鱼"/utf8>>,
    'archives_condition' => <<"国战中没有进行任何战斗的情况下获得胜利"/utf8>>,
    'archives_text' => <<"浑水摸鱼"/utf8>>,
    'cond' => 1,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400301
};
get(400401)-> #{
    'type_id' => 4,
    'sub_id' => 4,
    'order' => 1,
    'archives_title' => <<"沆瀣一气"/utf8>>,
    'archives_condition' => <<"政务美言几句1次"/utf8>>,
    'archives_text' => <<"沆瀣一气"/utf8>>,
    'cond' => 1,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400401
};
get(400501)-> #{
    'type_id' => 4,
    'sub_id' => 5,
    'order' => 1,
    'archives_title' => <<"水淹七军"/utf8>>,
    'archives_condition' => <<"关羽和于禁同时上阵"/utf8>>,
    'archives_text' => <<"水淹七军"/utf8>>,
    'cond' => 1,
    'cond_json' => [
        301,
         106
    ],
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400501
};
get(400601)-> #{
    'type_id' => 4,
    'sub_id' => 6,
    'order' => 1,
    'archives_title' => <<"阴沟翻船"/utf8>>,
    'archives_condition' => <<"在切磋中失败"/utf8>>,
    'archives_text' => <<"阴沟翻船"/utf8>>,
    'cond' => 1,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400601
};
get(400701)-> #{
    'type_id' => 4,
    'sub_id' => 7,
    'order' => 1,
    'archives_title' => <<"破釜沉舟"/utf8>>,
    'archives_condition' => <<"总兵力低于5%的情况下国战战斗获得胜利"/utf8>>,
    'archives_text' => <<"破釜沉舟"/utf8>>,
    'cond' => 5,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400701
};
get(400801)-> #{
    'type_id' => 4,
    'sub_id' => 8,
    'order' => 1,
    'archives_title' => <<"金蝉脱壳"/utf8>>,
    'archives_condition' => <<"国战中在兵力不高于5%的情况下成功撤军"/utf8>>,
    'archives_text' => <<"金蝉脱壳"/utf8>>,
    'cond' => 5,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400801
};
get(400901)-> #{
    'type_id' => 4,
    'sub_id' => 9,
    'order' => 1,
    'archives_title' => <<"勤政爱民"/utf8>>,
    'archives_condition' => <<"累积发布50个太守专令"/utf8>>,
    'archives_text' => <<"勤政爱民"/utf8>>,
    'cond' => 50,
    'is_show' => 0,
    'is_look' => 0,
    'score' => 1,
    'reward_id' => 400901
};

get(_N) -> false.
get_list() ->
	[100103,100201,100301,100302,100402,100401,100102,100101,100501,100601,100403,100502,100602,100202,100203,100701,100801,100901,101001,101002,101101,101102,101103,101104,101201,200101,200201,200202,200301,200302,200401,200402,200501,200502,200503,200601,200602,200701,200801,200802,200803,200901,200902,201001,201002,201101,201201,300101,300201,300301,300401,300501,300601,300701,300202,300801,300602,300603,300901,300902,300903,300203,300204,300102,301001,301002,301101,301102,300702,300703,300704,300402,301201,301301,301401,400101,400102,400103,400201,400301,400401,400501,400601,400701,400801,400901].
