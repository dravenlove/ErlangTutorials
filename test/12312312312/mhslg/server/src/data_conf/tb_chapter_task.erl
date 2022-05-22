%%--- coding:utf-8 ---
-module(tb_chapter_task).
-export([get/1,get_list/0]).
get(10101010)-> #{
    'type' => 1001,
    'sub_type' => 1,
    'cond_type' => 1,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 10101010
};
get(10102010)-> #{
    'type' => 1001,
    'sub_type' => 1,
    'cond_type' => 2,
    'final_value' => 1,
    'cond_id' => 0,
    'cond' => 3,
    'reward_id' => 10102010
};
get(10103010)-> #{
    'type' => 1001,
    'sub_type' => 1,
    'cond_type' => 3,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 10103010
};
get(10204011)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017014,
    'country' => 1,
    'reward_id' => 10204011
};
get(10204012)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017006,
    'country' => 2,
    'reward_id' => 10204012
};
get(10204013)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017021,
    'country' => 3,
    'reward_id' => 10204013
};
get(10205010)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 5,
    'final_value' => 2,
    'cond_id' => 1010101,
    'reward_id' => 10205010
};
get(10205020)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 5,
    'final_value' => 1,
    'cond_id' => 1060101,
    'reward_id' => 10205020
};
get(10206010)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 6,
    'final_value' => 500,
    'cond_id' => 0,
    'cond' => 1,
    'reward_id' => 10206010
};
get(10207010)-> #{
    'type' => 1001,
    'sub_type' => 2,
    'cond_type' => 7,
    'final_value' => 1,
    'cond_id' => 1,
    'reward_id' => 10207010
};
get(10304021)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017012,
    'country' => 1,
    'reward_id' => 10304021
};
get(10304022)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017009,
    'country' => 2,
    'reward_id' => 10304022
};
get(10304023)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017022,
    'country' => 3,
    'reward_id' => 10304023
};
get(10305030)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 5,
    'final_value' => 3,
    'cond_id' => 1010101,
    'reward_id' => 10305030
};
get(10305040)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 5,
    'final_value' => 3,
    'cond_id' => 1120201,
    'reward_id' => 10305040
};
get(10305050)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 5,
    'final_value' => 3,
    'cond_id' => 1060401,
    'reward_id' => 10305050
};
get(10306020)-> #{
    'type' => 1001,
    'sub_type' => 3,
    'cond_type' => 6,
    'final_value' => 1000,
    'cond_id' => 4,
    'reward_id' => 10306020
};
get(10408010)-> #{
    'type' => 1001,
    'sub_type' => 4,
    'cond_type' => 8,
    'final_value' => 1,
    'cond_id' => 0,
    'reward_id' => 10408010
};
get(10405060)-> #{
    'type' => 1001,
    'sub_type' => 4,
    'cond_type' => 5,
    'final_value' => 6,
    'cond_id' => 1010101,
    'reward_id' => 10405060
};
get(10409010)-> #{
    'type' => 1001,
    'sub_type' => 4,
    'cond_type' => 9,
    'final_value' => 5,
    'cond_id' => 0,
    'reward_id' => 10409010
};
get(10410010)-> #{
    'type' => 1001,
    'sub_type' => 4,
    'cond_type' => 10,
    'final_value' => 2,
    'cond_id' => 101,
    'reward_id' => 10410010
};
get(10411010)-> #{
    'type' => 1001,
    'sub_type' => 4,
    'cond_type' => 11,
    'final_value' => 3,
    'cond_id' => 0,
    'reward_id' => 10411010
};
get(10505070)-> #{
    'type' => 1001,
    'sub_type' => 5,
    'cond_type' => 5,
    'final_value' => 7,
    'cond_id' => 1010101,
    'reward_id' => 10505070
};
get(10512010)-> #{
    'type' => 1001,
    'sub_type' => 5,
    'cond_type' => 12,
    'final_value' => 7,
    'cond_id' => 106,
    'reward_id' => 10512010
};
get(10513010)-> #{
    'type' => 1001,
    'sub_type' => 5,
    'cond_type' => 13,
    'final_value' => 5000,
    'cond_id' => 0,
    'reward_id' => 10513010
};
get(10514010)-> #{
    'type' => 1001,
    'sub_type' => 5,
    'cond_type' => 14,
    'final_value' => 1,
    'cond_id' => 0,
    'reward_id' => 10514010
};
get(10515010)-> #{
    'type' => 1001,
    'sub_type' => 5,
    'cond_type' => 15,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 10515010
};
get(10604031)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017011,
    'country' => 1,
    'reward_id' => 10604031
};
get(10604032)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017007,
    'country' => 2,
    'reward_id' => 10604032
};
get(10604033)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017020,
    'country' => 3,
    'reward_id' => 10604033
};
get(10616010)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 16,
    'final_value' => 3,
    'cond_id' => 0,
    'reward_id' => 10616010
};
get(10617010)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 17,
    'final_value' => 1,
    'cond_id' => 0,
    'reward_id' => 10617010
};
get(10618010)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 18,
    'final_value' => 15,
    'cond_id' => 0,
    'reward_id' => 10618010
};
get(10605080)-> #{
    'type' => 1001,
    'sub_type' => 6,
    'cond_type' => 5,
    'final_value' => 9,
    'cond_id' => 1010101,
    'reward_id' => 10605080
};
get(10704041)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017013,
    'country' => 1,
    'reward_id' => 10704041
};
get(10704042)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017005,
    'country' => 2,
    'reward_id' => 10704042
};
get(10704043)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2015007,
    'country' => 3,
    'reward_id' => 10704043
};
get(10710020)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 10,
    'final_value' => 2,
    'cond_id' => 105,
    'reward_id' => 10710020
};
get(10719010)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 19,
    'final_value' => 5,
    'cond_id' => 0,
    'reward_id' => 10719010
};
get(10720010)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 20,
    'final_value' => 1,
    'cond_id' => 3,
    'cond' => 2,
    'reward_id' => 10720010
};
get(10721010)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 21,
    'final_value' => 1,
    'cond_id' => 3,
    'reward_id' => 10721010
};
get(10705090)-> #{
    'type' => 1001,
    'sub_type' => 7,
    'cond_type' => 5,
    'final_value' => 10,
    'cond_id' => 1010101,
    'reward_id' => 10705090
};
get(10804051)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3017004,
    'country' => 1,
    'reward_id' => 10804051
};
get(10804052)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3017001,
    'country' => 2,
    'reward_id' => 10804052
};
get(10804053)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2015005,
    'country' => 3,
    'reward_id' => 10804053
};
get(10810030)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 10,
    'final_value' => 2,
    'cond_id' => 106,
    'reward_id' => 10810030
};
get(10822010)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 22,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 10822010
};
get(10823010)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 23,
    'final_value' => 1,
    'cond_id' => 0,
    'reward_id' => 10823010
};
get(10824010)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 24,
    'final_value' => 3,
    'cond_id' => 0,
    'reward_id' => 10824010
};
get(10805100)-> #{
    'type' => 1001,
    'sub_type' => 8,
    'cond_type' => 5,
    'final_value' => 10,
    'cond_id' => 1070101,
    'reward_id' => 10805100
};
get(10917020)-> #{
    'type' => 1001,
    'sub_type' => 9,
    'cond_type' => 17,
    'final_value' => 30,
    'cond_id' => 0,
    'reward_id' => 10917020
};
get(10925010)-> #{
    'type' => 1001,
    'sub_type' => 9,
    'cond_type' => 25,
    'final_value' => 1,
    'cond_id' => 104,
    'reward_id' => 10925010
};
get(10905110)-> #{
    'type' => 1001,
    'sub_type' => 9,
    'cond_type' => 5,
    'final_value' => 4,
    'cond_id' => 1020101,
    'reward_id' => 10905110
};
get(10926010)-> #{
    'type' => 1001,
    'sub_type' => 9,
    'cond_type' => 26,
    'final_value' => 8000,
    'cond_id' => 0,
    'reward_id' => 10926010
};
get(10928010)-> #{
    'type' => 1001,
    'sub_type' => 9,
    'cond_type' => 28,
    'final_value' => 1,
    'cond_id' => 1012,
    'cond' => 3,
    'reward_id' => 10928010
};
get(10928020)-> #{
    'type' => 1001,
    'sub_type' => 9,
    'cond_type' => 28,
    'final_value' => 1,
    'cond_id' => 1003,
    'cond' => 1,
    'reward_id' => 10928020
};
get(11004061)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2013007,
    'country' => 1,
    'reward_id' => 11004061
};
get(11004062)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2017004,
    'country' => 2,
    'reward_id' => 11004062
};
get(11004063)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2015003,
    'country' => 3,
    'reward_id' => 11004063
};
get(11005120)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 5,
    'final_value' => 12,
    'cond_id' => 1010101,
    'reward_id' => 11005120
};
get(11029010)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 29,
    'final_value' => 2,
    'cond_id' => 0,
    'cond' => 8,
    'reward_id' => 11029010
};
get(11011020)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 11,
    'final_value' => 20,
    'cond_id' => 0,
    'reward_id' => 11011020
};
get(11030010)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 30,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 11030010
};
get(11031010)-> #{
    'type' => 1001,
    'sub_type' => 10,
    'cond_type' => 31,
    'final_value' => 3,
    'cond_id' => 0,
    'reward_id' => 11031010
};
get(11105130)-> #{
    'type' => 1001,
    'sub_type' => 11,
    'cond_type' => 5,
    'final_value' => 3,
    'cond_id' => 1040101,
    'reward_id' => 11105130
};
get(11120020)-> #{
    'type' => 1001,
    'sub_type' => 11,
    'cond_type' => 20,
    'final_value' => 1,
    'cond_id' => 5,
    'cond' => 2,
    'reward_id' => 11120020
};
get(11116020)-> #{
    'type' => 1001,
    'sub_type' => 11,
    'cond_type' => 16,
    'final_value' => 10,
    'cond_id' => 0,
    'reward_id' => 11116020
};
get(11105140)-> #{
    'type' => 1001,
    'sub_type' => 11,
    'cond_type' => 5,
    'final_value' => 4,
    'cond_id' => 1080101,
    'reward_id' => 11105140
};
get(11121020)-> #{
    'type' => 1001,
    'sub_type' => 11,
    'cond_type' => 21,
    'final_value' => 2,
    'cond_id' => 5,
    'reward_id' => 11121020
};
get(11115020)-> #{
    'type' => 1001,
    'sub_type' => 11,
    'cond_type' => 15,
    'final_value' => 2,
    'cond_id' => 0,
    'reward_id' => 11115020
};
get(11204071)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 5017001,
    'country' => 1,
    'reward_id' => 11204071
};
get(11204072)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 5005001,
    'country' => 2,
    'reward_id' => 11204072
};
get(11204073)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 5017002,
    'country' => 3,
    'reward_id' => 11204073
};
get(11220030)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 20,
    'final_value' => 1,
    'cond_id' => 6,
    'cond' => 2,
    'reward_id' => 11220030
};
get(11232010)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 32,
    'final_value' => 1,
    'cond_id' => 0,
    'cond' => 4,
    'reward_id' => 11232010
};
get(11221030)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 21,
    'final_value' => 2,
    'cond_id' => 6,
    'reward_id' => 11221030
};
get(11233010)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 33,
    'final_value' => 2,
    'cond_id' => 0,
    'cond' => 20,
    'reward_id' => 11233010
};
get(11226020)-> #{
    'type' => 1001,
    'sub_type' => 12,
    'cond_type' => 26,
    'final_value' => 20000,
    'cond_id' => 0,
    'reward_id' => 11226020
};
get(11304081)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2013005,
    'country' => 1,
    'reward_id' => 11304081
};
get(11304082)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2009003,
    'country' => 2,
    'reward_id' => 11304082
};
get(11304083)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2015008,
    'country' => 3,
    'reward_id' => 11304083
};
get(11317020)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 17,
    'final_value' => 80,
    'cond_id' => 0,
    'reward_id' => 11317020
};
get(11334010)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 34,
    'final_value' => 10,
    'cond_id' => 0,
    'reward_id' => 11334010
};
get(11313020)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 13,
    'final_value' => 100000,
    'cond_id' => 0,
    'reward_id' => 11313020
};
get(11335010)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 35,
    'final_value' => 500000,
    'cond_id' => 0,
    'reward_id' => 11335010
};
get(11305150)-> #{
    'type' => 1001,
    'sub_type' => 13,
    'cond_type' => 5,
    'final_value' => 13,
    'cond_id' => 1010101,
    'reward_id' => 11305150
};
get(11429020)-> #{
    'type' => 1001,
    'sub_type' => 14,
    'cond_type' => 29,
    'final_value' => 2,
    'cond_id' => 0,
    'cond' => 10,
    'reward_id' => 11429020
};
get(11405160)-> #{
    'type' => 1001,
    'sub_type' => 14,
    'cond_type' => 5,
    'final_value' => 14,
    'cond_id' => 1010101,
    'reward_id' => 11405160
};
get(11436010)-> #{
    'type' => 1001,
    'sub_type' => 14,
    'cond_type' => 36,
    'final_value' => 200,
    'cond_id' => 0,
    'reward_id' => 11436010
};
get(11408020)-> #{
    'type' => 1001,
    'sub_type' => 14,
    'cond_type' => 8,
    'final_value' => 7,
    'cond_id' => 0,
    'reward_id' => 11408020
};
get(11424020)-> #{
    'type' => 1001,
    'sub_type' => 14,
    'cond_type' => 24,
    'final_value' => 5,
    'cond_id' => 0,
    'reward_id' => 11424020
};
get(11412020)-> #{
    'type' => 1001,
    'sub_type' => 14,
    'cond_type' => 12,
    'final_value' => 14,
    'cond_id' => 0,
    'cond' => 106,
    'reward_id' => 11412020
};
get(11504091)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 4014001,
    'country' => 1,
    'reward_id' => 11504091
};
get(11504092)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 4011001,
    'country' => 2,
    'reward_id' => 11504092
};
get(11504093)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 4015001,
    'country' => 3,
    'reward_id' => 11504093
};
get(11537011)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 37,
    'final_value' => 2,
    'cond_id' => 4014001,
    'country' => 1,
    'reward_id' => 11537011
};
get(11537012)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 37,
    'final_value' => 2,
    'cond_id' => 4011001,
    'country' => 2,
    'reward_id' => 11537012
};
get(11537013)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 37,
    'final_value' => 2,
    'cond_id' => 4015001,
    'country' => 3,
    'reward_id' => 11537013
};
get(11538010)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 38,
    'final_value' => 1,
    'cond_id' => 0,
    'reward_id' => 11538010
};
get(11530020)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 30,
    'final_value' => 5,
    'cond_id' => 0,
    'reward_id' => 11530020
};
get(11528020)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 28,
    'final_value' => 1,
    'cond_id' => 12012,
    'reward_id' => 11528020
};
get(11525020)-> #{
    'type' => 1001,
    'sub_type' => 15,
    'cond_type' => 25,
    'final_value' => 1,
    'cond_id' => 105,
    'reward_id' => 11525020
};
get(11604101)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3014001,
    'country' => 1,
    'reward_id' => 11604101
};
get(11604102)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3011001,
    'country' => 2,
    'reward_id' => 11604102
};
get(11604103)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3012001,
    'country' => 3,
    'reward_id' => 11604103
};
get(11639010)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 39,
    'final_value' => 3,
    'cond_id' => 0,
    'cond' => 2,
    'reward_id' => 11639010
};
get(11605170)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 5,
    'final_value' => 15,
    'cond_id' => 1070101,
    'reward_id' => 11605170
};
get(11623020)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 23,
    'final_value' => 3,
    'cond_id' => 0,
    'reward_id' => 11623020
};
get(11640010)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 40,
    'final_value' => 1,
    'cond_id' => 0,
    'cond' => 4,
    'reward_id' => 11640010
};
get(11641010)-> #{
    'type' => 1001,
    'sub_type' => 16,
    'cond_type' => 41,
    'final_value' => 10,
    'cond_id' => 0,
    'reward_id' => 11641010
};
get(11732020)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 32,
    'final_value' => 1,
    'cond_id' => 0,
    'cond' => 5,
    'reward_id' => 11732020
};
get(11742010)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 42,
    'final_value' => 6,
    'cond_id' => 0,
    'reward_id' => 11742010
};
get(11704111)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2007007,
    'country' => 1,
    'reward_id' => 11704111
};
get(11704112)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3013001,
    'country' => 2,
    'reward_id' => 11704112
};
get(11704113)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 3012002,
    'country' => 3,
    'reward_id' => 11704113
};
get(11705180)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 5,
    'final_value' => 5,
    'cond_id' => 1080101,
    'reward_id' => 11705180
};
get(11724030)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 24,
    'final_value' => 10,
    'cond_id' => 0,
    'reward_id' => 11724030
};
get(11734020)-> #{
    'type' => 1001,
    'sub_type' => 17,
    'cond_type' => 34,
    'final_value' => 25,
    'cond_id' => 0,
    'reward_id' => 11734020
};
get(11804121)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2004009,
    'country' => 1,
    'reward_id' => 11804121
};
get(11804122)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2010006,
    'country' => 2,
    'reward_id' => 11804122
};
get(11804123)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 4,
    'final_value' => 1,
    'cond_id' => 2007002,
    'country' => 3,
    'reward_id' => 11804123
};
get(11805190)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 5,
    'final_value' => 16,
    'cond_id' => 1010101,
    'reward_id' => 11805190
};
get(11826030)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 26,
    'final_value' => 60000,
    'cond_id' => 0,
    'reward_id' => 11826030
};
get(11836020)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 36,
    'final_value' => 100,
    'cond_id' => 0,
    'reward_id' => 11836020
};
get(11843010)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 43,
    'final_value' => 1,
    'cond_id' => 0,
    'cond' => 5,
    'reward_id' => 11843010
};
get(11823030)-> #{
    'type' => 1001,
    'sub_type' => 18,
    'cond_type' => 23,
    'final_value' => 10,
    'cond_id' => 0,
    'reward_id' => 11823030
};

get(_N) -> false.
get_list() ->
	[10101010,10102010,10103010,10204011,10204012,10204013,10205010,10205020,10206010,10207010,10304021,10304022,10304023,10305030,10305040,10305050,10306020,10408010,10405060,10409010,10410010,10411010,10505070,10512010,10513010,10514010,10515010,10604031,10604032,10604033,10616010,10617010,10618010,10605080,10704041,10704042,10704043,10710020,10719010,10720010,10721010,10705090,10804051,10804052,10804053,10810030,10822010,10823010,10824010,10805100,10917020,10925010,10905110,10926010,10928010,10928020,11004061,11004062,11004063,11005120,11029010,11011020,11030010,11031010,11105130,11120020,11116020,11105140,11121020,11115020,11204071,11204072,11204073,11220030,11232010,11221030,11233010,11226020,11304081,11304082,11304083,11317020,11334010,11313020,11335010,11305150,11429020,11405160,11436010,11408020,11424020,11412020,11504091,11504092,11504093,11537011,11537012,11537013,11538010,11530020,11528020,11525020,11604101,11604102,11604103,11639010,11605170,11623020,11640010,11641010,11732020,11742010,11704111,11704112,11704113,11705180,11724030,11734020,11804121,11804122,11804123,11805190,11826030,11836020,11843010,11823030].
