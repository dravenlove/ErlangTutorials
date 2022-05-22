%%--- coding:utf-8 ---
-module(tb_hero_star_to_hall_score).
-export([get/1,get_list/0]).
get(100)-> #{
    'quality' => 1,
    'star' => 0,
    'hall_score' => 200
};
get(101)-> #{
    'quality' => 1,
    'star' => 1,
    'hall_score' => 207
};
get(102)-> #{
    'quality' => 1,
    'star' => 2,
    'hall_score' => 215
};
get(103)-> #{
    'quality' => 1,
    'star' => 3,
    'hall_score' => 224
};
get(104)-> #{
    'quality' => 1,
    'star' => 4,
    'hall_score' => 234
};
get(105)-> #{
    'quality' => 1,
    'star' => 5,
    'hall_score' => 245
};
get(106)-> #{
    'quality' => 1,
    'star' => 6,
    'hall_score' => 264
};
get(107)-> #{
    'quality' => 1,
    'star' => 7,
    'hall_score' => 284
};
get(108)-> #{
    'quality' => 1,
    'star' => 8,
    'hall_score' => 306
};
get(109)-> #{
    'quality' => 1,
    'star' => 9,
    'hall_score' => 330
};
get(110)-> #{
    'quality' => 1,
    'star' => 10,
    'hall_score' => 356
};
get(111)-> #{
    'quality' => 1,
    'star' => 11,
    'hall_score' => 384
};
get(112)-> #{
    'quality' => 1,
    'star' => 12,
    'hall_score' => 396
};
get(113)-> #{
    'quality' => 1,
    'star' => 13,
    'hall_score' => 448
};
get(114)-> #{
    'quality' => 1,
    'star' => 14,
    'hall_score' => 502
};
get(115)-> #{
    'quality' => 1,
    'star' => 15,
    'hall_score' => 558
};
get(116)-> #{
    'quality' => 1,
    'star' => 16,
    'hall_score' => 616
};
get(117)-> #{
    'quality' => 1,
    'star' => 17,
    'hall_score' => 676
};
get(118)-> #{
    'quality' => 1,
    'star' => 18,
    'hall_score' => 900
};
get(200)-> #{
    'quality' => 2,
    'star' => 0,
    'hall_score' => 300
};
get(201)-> #{
    'quality' => 2,
    'star' => 1,
    'hall_score' => 350
};
get(202)-> #{
    'quality' => 2,
    'star' => 2,
    'hall_score' => 400
};
get(203)-> #{
    'quality' => 2,
    'star' => 3,
    'hall_score' => 450
};
get(204)-> #{
    'quality' => 2,
    'star' => 4,
    'hall_score' => 500
};
get(205)-> #{
    'quality' => 2,
    'star' => 5,
    'hall_score' => 550
};
get(206)-> #{
    'quality' => 2,
    'star' => 6,
    'hall_score' => 750
};
get(207)-> #{
    'quality' => 2,
    'star' => 7,
    'hall_score' => 850
};
get(208)-> #{
    'quality' => 2,
    'star' => 8,
    'hall_score' => 950
};
get(209)-> #{
    'quality' => 2,
    'star' => 9,
    'hall_score' => 1050
};
get(210)-> #{
    'quality' => 2,
    'star' => 10,
    'hall_score' => 1150
};
get(211)-> #{
    'quality' => 2,
    'star' => 11,
    'hall_score' => 1250
};
get(212)-> #{
    'quality' => 2,
    'star' => 12,
    'hall_score' => 1650
};
get(213)-> #{
    'quality' => 2,
    'star' => 13,
    'hall_score' => 1800
};
get(214)-> #{
    'quality' => 2,
    'star' => 14,
    'hall_score' => 1950
};
get(215)-> #{
    'quality' => 2,
    'star' => 15,
    'hall_score' => 2100
};
get(216)-> #{
    'quality' => 2,
    'star' => 16,
    'hall_score' => 2250
};
get(217)-> #{
    'quality' => 2,
    'star' => 17,
    'hall_score' => 2400
};
get(218)-> #{
    'quality' => 2,
    'star' => 18,
    'hall_score' => 3000
};
get(300)-> #{
    'quality' => 3,
    'star' => 0,
    'hall_score' => 360
};
get(301)-> #{
    'quality' => 3,
    'star' => 1,
    'hall_score' => 440
};
get(302)-> #{
    'quality' => 3,
    'star' => 2,
    'hall_score' => 520
};
get(303)-> #{
    'quality' => 3,
    'star' => 3,
    'hall_score' => 600
};
get(304)-> #{
    'quality' => 3,
    'star' => 4,
    'hall_score' => 680
};
get(305)-> #{
    'quality' => 3,
    'star' => 5,
    'hall_score' => 760
};
get(306)-> #{
    'quality' => 3,
    'star' => 6,
    'hall_score' => 1080
};
get(307)-> #{
    'quality' => 3,
    'star' => 7,
    'hall_score' => 1240
};
get(308)-> #{
    'quality' => 3,
    'star' => 8,
    'hall_score' => 1400
};
get(309)-> #{
    'quality' => 3,
    'star' => 9,
    'hall_score' => 1560
};
get(310)-> #{
    'quality' => 3,
    'star' => 10,
    'hall_score' => 1720
};
get(311)-> #{
    'quality' => 3,
    'star' => 11,
    'hall_score' => 1880
};
get(312)-> #{
    'quality' => 3,
    'star' => 12,
    'hall_score' => 2520
};
get(313)-> #{
    'quality' => 3,
    'star' => 13,
    'hall_score' => 2760
};
get(314)-> #{
    'quality' => 3,
    'star' => 14,
    'hall_score' => 3000
};
get(315)-> #{
    'quality' => 3,
    'star' => 15,
    'hall_score' => 3240
};
get(316)-> #{
    'quality' => 3,
    'star' => 16,
    'hall_score' => 3480
};
get(317)-> #{
    'quality' => 3,
    'star' => 17,
    'hall_score' => 3720
};
get(318)-> #{
    'quality' => 3,
    'star' => 18,
    'hall_score' => 4680
};
get(400)-> #{
    'quality' => 4,
    'star' => 0,
    'hall_score' => 380
};
get(401)-> #{
    'quality' => 4,
    'star' => 1,
    'hall_score' => 450
};
get(402)-> #{
    'quality' => 4,
    'star' => 2,
    'hall_score' => 520
};
get(403)-> #{
    'quality' => 4,
    'star' => 3,
    'hall_score' => 590
};
get(404)-> #{
    'quality' => 4,
    'star' => 4,
    'hall_score' => 660
};
get(405)-> #{
    'quality' => 4,
    'star' => 5,
    'hall_score' => 730
};
get(406)-> #{
    'quality' => 4,
    'star' => 6,
    'hall_score' => 1010
};
get(407)-> #{
    'quality' => 4,
    'star' => 7,
    'hall_score' => 1150
};
get(408)-> #{
    'quality' => 4,
    'star' => 8,
    'hall_score' => 1290
};
get(409)-> #{
    'quality' => 4,
    'star' => 9,
    'hall_score' => 1430
};
get(410)-> #{
    'quality' => 4,
    'star' => 10,
    'hall_score' => 1570
};
get(411)-> #{
    'quality' => 4,
    'star' => 11,
    'hall_score' => 1710
};
get(412)-> #{
    'quality' => 4,
    'star' => 12,
    'hall_score' => 2270
};
get(413)-> #{
    'quality' => 4,
    'star' => 13,
    'hall_score' => 2480
};
get(414)-> #{
    'quality' => 4,
    'star' => 14,
    'hall_score' => 2690
};
get(415)-> #{
    'quality' => 4,
    'star' => 15,
    'hall_score' => 2900
};
get(416)-> #{
    'quality' => 4,
    'star' => 16,
    'hall_score' => 3110
};
get(417)-> #{
    'quality' => 4,
    'star' => 17,
    'hall_score' => 3320
};
get(418)-> #{
    'quality' => 4,
    'star' => 18,
    'hall_score' => 4160
};
get(500)-> #{
    'quality' => 5,
    'star' => 0,
    'hall_score' => 460
};
get(501)-> #{
    'quality' => 5,
    'star' => 1,
    'hall_score' => 560
};
get(502)-> #{
    'quality' => 5,
    'star' => 2,
    'hall_score' => 660
};
get(503)-> #{
    'quality' => 5,
    'star' => 3,
    'hall_score' => 760
};
get(504)-> #{
    'quality' => 5,
    'star' => 4,
    'hall_score' => 860
};
get(505)-> #{
    'quality' => 5,
    'star' => 5,
    'hall_score' => 960
};
get(506)-> #{
    'quality' => 5,
    'star' => 6,
    'hall_score' => 1360
};
get(507)-> #{
    'quality' => 5,
    'star' => 7,
    'hall_score' => 1560
};
get(508)-> #{
    'quality' => 5,
    'star' => 8,
    'hall_score' => 1760
};
get(509)-> #{
    'quality' => 5,
    'star' => 9,
    'hall_score' => 1960
};
get(510)-> #{
    'quality' => 5,
    'star' => 10,
    'hall_score' => 2160
};
get(511)-> #{
    'quality' => 5,
    'star' => 11,
    'hall_score' => 2360
};
get(512)-> #{
    'quality' => 5,
    'star' => 12,
    'hall_score' => 3160
};
get(513)-> #{
    'quality' => 5,
    'star' => 13,
    'hall_score' => 3460
};
get(514)-> #{
    'quality' => 5,
    'star' => 14,
    'hall_score' => 3760
};
get(515)-> #{
    'quality' => 5,
    'star' => 15,
    'hall_score' => 4060
};
get(516)-> #{
    'quality' => 5,
    'star' => 16,
    'hall_score' => 4360
};
get(517)-> #{
    'quality' => 5,
    'star' => 17,
    'hall_score' => 4660
};
get(518)-> #{
    'quality' => 5,
    'star' => 18,
    'hall_score' => 5860
};

get(_N) -> false.
get_list() ->
	[100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518].
