%%--- coding:utf-8 ---
-module(tb_star_upgrade).
-export([get/1,get_list/0]).
get(101)-> #{
    'type' => 1,
    'level' => 1,
    'l_type' => 0,
    'r_type' => 1500
};
get(102)-> #{
    'type' => 1,
    'level' => 2,
    'l_type' => 1500,
    'r_type' => 2500
};
get(103)-> #{
    'type' => 1,
    'level' => 3,
    'l_type' => 2500,
    'r_type' => 4000
};
get(104)-> #{
    'type' => 1,
    'level' => 4,
    'l_type' => 4000,
    'r_type' => 6000
};
get(105)-> #{
    'type' => 1,
    'level' => 5,
    'l_type' => 6000,
    'r_type' => 9000
};
get(106)-> #{
    'type' => 1,
    'level' => 6,
    'l_type' => 9000,
    'r_type' => 12000
};
get(107)-> #{
    'type' => 1,
    'level' => 7,
    'l_type' => 12000,
    'r_type' => 15000
};
get(108)-> #{
    'type' => 1,
    'level' => 8,
    'l_type' => 15000,
    'r_type' => 18000
};
get(109)-> #{
    'type' => 1,
    'level' => 9,
    'l_type' => 18000,
    'r_type' => 21000
};
get(110)-> #{
    'type' => 1,
    'level' => 10,
    'l_type' => 21000,
    'r_type' => 24000
};
get(111)-> #{
    'type' => 1,
    'level' => 11,
    'l_type' => 24000,
    'r_type' => 27000
};
get(112)-> #{
    'type' => 1,
    'level' => 12,
    'l_type' => 27000,
    'r_type' => 30000
};
get(113)-> #{
    'type' => 1,
    'level' => 13,
    'l_type' => 30000,
    'r_type' => 33000
};
get(114)-> #{
    'type' => 1,
    'level' => 14,
    'l_type' => 33000,
    'r_type' => 36000
};
get(115)-> #{
    'type' => 1,
    'level' => 15,
    'l_type' => 36000,
    'r_type' => 39000
};
get(116)-> #{
    'type' => 1,
    'level' => 16,
    'l_type' => 39000,
    'r_type' => 42000
};
get(117)-> #{
    'type' => 1,
    'level' => 17,
    'l_type' => 42000,
    'r_type' => 45000
};
get(118)-> #{
    'type' => 1,
    'level' => 18,
    'l_type' => 45000,
    'r_type' => 48000
};
get(119)-> #{
    'type' => 1,
    'level' => 19,
    'l_type' => 48000,
    'r_type' => 51000
};
get(120)-> #{
    'type' => 1,
    'level' => 20,
    'l_type' => 51000,
    'r_type' => 54000
};
get(121)-> #{
    'type' => 1,
    'level' => 21,
    'l_type' => 54000,
    'r_type' => 57000
};
get(122)-> #{
    'type' => 1,
    'level' => 22,
    'l_type' => 57000,
    'r_type' => 60000
};
get(123)-> #{
    'type' => 1,
    'level' => 23,
    'l_type' => 60000,
    'r_type' => 63000
};
get(124)-> #{
    'type' => 1,
    'level' => 24,
    'l_type' => 63000,
    'r_type' => 66000
};
get(125)-> #{
    'type' => 1,
    'level' => 25,
    'l_type' => 66000,
    'r_type' => 69000
};
get(126)-> #{
    'type' => 1,
    'level' => 26,
    'l_type' => 69000,
    'r_type' => 72000
};
get(127)-> #{
    'type' => 1,
    'level' => 27,
    'l_type' => 72000,
    'r_type' => 75000
};
get(128)-> #{
    'type' => 1,
    'level' => 28,
    'l_type' => 75000,
    'r_type' => 78000
};
get(129)-> #{
    'type' => 1,
    'level' => 29,
    'l_type' => 78000,
    'r_type' => 81000
};
get(130)-> #{
    'type' => 1,
    'level' => 30,
    'l_type' => 81000,
    'r_type' => 84000
};
get(131)-> #{
    'type' => 1,
    'level' => 31,
    'l_type' => 84000,
    'r_type' => 87000
};
get(132)-> #{
    'type' => 1,
    'level' => 32,
    'l_type' => 87000,
    'r_type' => 90000
};
get(133)-> #{
    'type' => 1,
    'level' => 33,
    'l_type' => 90000,
    'r_type' => 93000
};
get(134)-> #{
    'type' => 1,
    'level' => 34,
    'l_type' => 93000,
    'r_type' => 96000
};
get(135)-> #{
    'type' => 1,
    'level' => 35,
    'l_type' => 96000,
    'r_type' => 99000
};
get(136)-> #{
    'type' => 1,
    'level' => 36,
    'l_type' => 99000,
    'r_type' => 102000
};
get(137)-> #{
    'type' => 1,
    'level' => 37,
    'l_type' => 102000,
    'r_type' => 105000
};
get(138)-> #{
    'type' => 1,
    'level' => 38,
    'l_type' => 105000,
    'r_type' => 108000
};
get(139)-> #{
    'type' => 1,
    'level' => 39,
    'l_type' => 108000,
    'r_type' => 111000
};
get(140)-> #{
    'type' => 1,
    'level' => 40,
    'l_type' => 111000,
    'r_type' => 114000
};
get(141)-> #{
    'type' => 1,
    'level' => 41,
    'l_type' => 114000,
    'r_type' => 117000
};
get(142)-> #{
    'type' => 1,
    'level' => 42,
    'l_type' => 117000,
    'r_type' => 120000
};
get(143)-> #{
    'type' => 1,
    'level' => 43,
    'l_type' => 120000,
    'r_type' => 123000
};
get(144)-> #{
    'type' => 1,
    'level' => 44,
    'l_type' => 123000,
    'r_type' => 126000
};
get(145)-> #{
    'type' => 1,
    'level' => 45,
    'l_type' => 126000,
    'r_type' => 129000
};
get(146)-> #{
    'type' => 1,
    'level' => 46,
    'l_type' => 129000,
    'r_type' => 132000
};
get(147)-> #{
    'type' => 1,
    'level' => 47,
    'l_type' => 132000,
    'r_type' => 135000
};
get(148)-> #{
    'type' => 1,
    'level' => 48,
    'l_type' => 135000,
    'r_type' => 138000
};
get(149)-> #{
    'type' => 1,
    'level' => 49,
    'l_type' => 138000,
    'r_type' => 141000
};
get(150)-> #{
    'type' => 1,
    'level' => 50,
    'l_type' => 141000,
    'r_type' => 144000
};
get(201)-> #{
    'type' => 2,
    'level' => 1,
    'l_type' => 0,
    'r_type' => 250
};
get(202)-> #{
    'type' => 2,
    'level' => 2,
    'l_type' => 250,
    'r_type' => 500
};
get(203)-> #{
    'type' => 2,
    'level' => 3,
    'l_type' => 500,
    'r_type' => 1000
};
get(204)-> #{
    'type' => 2,
    'level' => 4,
    'l_type' => 1000,
    'r_type' => 2000
};
get(205)-> #{
    'type' => 2,
    'level' => 5,
    'l_type' => 2000,
    'r_type' => 3000
};
get(206)-> #{
    'type' => 2,
    'level' => 6,
    'l_type' => 3000,
    'r_type' => 4000
};
get(207)-> #{
    'type' => 2,
    'level' => 7,
    'l_type' => 4000,
    'r_type' => 5000
};
get(208)-> #{
    'type' => 2,
    'level' => 8,
    'l_type' => 5000,
    'r_type' => 6000
};
get(209)-> #{
    'type' => 2,
    'level' => 9,
    'l_type' => 6000,
    'r_type' => 7000
};
get(210)-> #{
    'type' => 2,
    'level' => 10,
    'l_type' => 7000,
    'r_type' => 8000
};
get(211)-> #{
    'type' => 2,
    'level' => 11,
    'l_type' => 8000,
    'r_type' => 9000
};
get(212)-> #{
    'type' => 2,
    'level' => 12,
    'l_type' => 9000,
    'r_type' => 10000
};
get(213)-> #{
    'type' => 2,
    'level' => 13,
    'l_type' => 10000,
    'r_type' => 11000
};
get(214)-> #{
    'type' => 2,
    'level' => 14,
    'l_type' => 11000,
    'r_type' => 12000
};
get(215)-> #{
    'type' => 2,
    'level' => 15,
    'l_type' => 12000,
    'r_type' => 13000
};
get(216)-> #{
    'type' => 2,
    'level' => 16,
    'l_type' => 13000,
    'r_type' => 14000
};
get(217)-> #{
    'type' => 2,
    'level' => 17,
    'l_type' => 14000,
    'r_type' => 15000
};
get(218)-> #{
    'type' => 2,
    'level' => 18,
    'l_type' => 15000,
    'r_type' => 16000
};
get(219)-> #{
    'type' => 2,
    'level' => 19,
    'l_type' => 16000,
    'r_type' => 17000
};
get(220)-> #{
    'type' => 2,
    'level' => 20,
    'l_type' => 17000,
    'r_type' => 18000
};
get(221)-> #{
    'type' => 2,
    'level' => 21,
    'l_type' => 18000,
    'r_type' => 19000
};
get(222)-> #{
    'type' => 2,
    'level' => 22,
    'l_type' => 19000,
    'r_type' => 20000
};
get(223)-> #{
    'type' => 2,
    'level' => 23,
    'l_type' => 20000,
    'r_type' => 21000
};
get(224)-> #{
    'type' => 2,
    'level' => 24,
    'l_type' => 21000,
    'r_type' => 22000
};
get(225)-> #{
    'type' => 2,
    'level' => 25,
    'l_type' => 22000,
    'r_type' => 23000
};
get(226)-> #{
    'type' => 2,
    'level' => 26,
    'l_type' => 23000,
    'r_type' => 24000
};
get(227)-> #{
    'type' => 2,
    'level' => 27,
    'l_type' => 24000,
    'r_type' => 25000
};
get(228)-> #{
    'type' => 2,
    'level' => 28,
    'l_type' => 25000,
    'r_type' => 26000
};
get(229)-> #{
    'type' => 2,
    'level' => 29,
    'l_type' => 26000,
    'r_type' => 27000
};
get(230)-> #{
    'type' => 2,
    'level' => 30,
    'l_type' => 27000,
    'r_type' => 28000
};
get(231)-> #{
    'type' => 2,
    'level' => 31,
    'l_type' => 28000,
    'r_type' => 29000
};
get(232)-> #{
    'type' => 2,
    'level' => 32,
    'l_type' => 29000,
    'r_type' => 30000
};
get(233)-> #{
    'type' => 2,
    'level' => 33,
    'l_type' => 30000,
    'r_type' => 31000
};
get(234)-> #{
    'type' => 2,
    'level' => 34,
    'l_type' => 31000,
    'r_type' => 32000
};
get(235)-> #{
    'type' => 2,
    'level' => 35,
    'l_type' => 32000,
    'r_type' => 33000
};
get(236)-> #{
    'type' => 2,
    'level' => 36,
    'l_type' => 33000,
    'r_type' => 34000
};
get(237)-> #{
    'type' => 2,
    'level' => 37,
    'l_type' => 34000,
    'r_type' => 35000
};
get(238)-> #{
    'type' => 2,
    'level' => 38,
    'l_type' => 35000,
    'r_type' => 36000
};
get(239)-> #{
    'type' => 2,
    'level' => 39,
    'l_type' => 36000,
    'r_type' => 37000
};
get(240)-> #{
    'type' => 2,
    'level' => 40,
    'l_type' => 37000,
    'r_type' => 38000
};
get(241)-> #{
    'type' => 2,
    'level' => 41,
    'l_type' => 38000,
    'r_type' => 39000
};
get(242)-> #{
    'type' => 2,
    'level' => 42,
    'l_type' => 39000,
    'r_type' => 40000
};
get(243)-> #{
    'type' => 2,
    'level' => 43,
    'l_type' => 40000,
    'r_type' => 41000
};
get(244)-> #{
    'type' => 2,
    'level' => 44,
    'l_type' => 41000,
    'r_type' => 42000
};
get(245)-> #{
    'type' => 2,
    'level' => 45,
    'l_type' => 42000,
    'r_type' => 43000
};
get(246)-> #{
    'type' => 2,
    'level' => 46,
    'l_type' => 43000,
    'r_type' => 44000
};
get(247)-> #{
    'type' => 2,
    'level' => 47,
    'l_type' => 44000,
    'r_type' => 45000
};
get(248)-> #{
    'type' => 2,
    'level' => 48,
    'l_type' => 45000,
    'r_type' => 46000
};
get(249)-> #{
    'type' => 2,
    'level' => 49,
    'l_type' => 46000,
    'r_type' => 47000
};
get(250)-> #{
    'type' => 2,
    'level' => 50,
    'l_type' => 47000,
    'r_type' => 48000
};
get(301)-> #{
    'type' => 3,
    'level' => 1,
    'l_type' => 0,
    'r_type' => 50
};
get(302)-> #{
    'type' => 3,
    'level' => 2,
    'l_type' => 50,
    'r_type' => 100
};
get(303)-> #{
    'type' => 3,
    'level' => 3,
    'l_type' => 100,
    'r_type' => 150
};
get(304)-> #{
    'type' => 3,
    'level' => 4,
    'l_type' => 150,
    'r_type' => 200
};
get(305)-> #{
    'type' => 3,
    'level' => 5,
    'l_type' => 200,
    'r_type' => 250
};
get(306)-> #{
    'type' => 3,
    'level' => 6,
    'l_type' => 250,
    'r_type' => 300
};
get(307)-> #{
    'type' => 3,
    'level' => 7,
    'l_type' => 300,
    'r_type' => 350
};
get(308)-> #{
    'type' => 3,
    'level' => 8,
    'l_type' => 350,
    'r_type' => 400
};
get(309)-> #{
    'type' => 3,
    'level' => 9,
    'l_type' => 400,
    'r_type' => 450
};
get(310)-> #{
    'type' => 3,
    'level' => 10,
    'l_type' => 450,
    'r_type' => 500
};
get(311)-> #{
    'type' => 3,
    'level' => 11,
    'l_type' => 500,
    'r_type' => 550
};
get(312)-> #{
    'type' => 3,
    'level' => 12,
    'l_type' => 550,
    'r_type' => 600
};
get(313)-> #{
    'type' => 3,
    'level' => 13,
    'l_type' => 600,
    'r_type' => 650
};
get(314)-> #{
    'type' => 3,
    'level' => 14,
    'l_type' => 650,
    'r_type' => 700
};
get(315)-> #{
    'type' => 3,
    'level' => 15,
    'l_type' => 700,
    'r_type' => 750
};
get(316)-> #{
    'type' => 3,
    'level' => 16,
    'l_type' => 750,
    'r_type' => 800
};
get(317)-> #{
    'type' => 3,
    'level' => 17,
    'l_type' => 800,
    'r_type' => 850
};
get(318)-> #{
    'type' => 3,
    'level' => 18,
    'l_type' => 850,
    'r_type' => 900
};
get(319)-> #{
    'type' => 3,
    'level' => 19,
    'l_type' => 900,
    'r_type' => 950
};
get(320)-> #{
    'type' => 3,
    'level' => 20,
    'l_type' => 950,
    'r_type' => 1000
};
get(321)-> #{
    'type' => 3,
    'level' => 21,
    'l_type' => 1000,
    'r_type' => 1050
};
get(322)-> #{
    'type' => 3,
    'level' => 22,
    'l_type' => 1050,
    'r_type' => 1100
};
get(323)-> #{
    'type' => 3,
    'level' => 23,
    'l_type' => 1100,
    'r_type' => 1150
};
get(324)-> #{
    'type' => 3,
    'level' => 24,
    'l_type' => 1150,
    'r_type' => 1200
};
get(325)-> #{
    'type' => 3,
    'level' => 25,
    'l_type' => 1200,
    'r_type' => 1250
};
get(326)-> #{
    'type' => 3,
    'level' => 26,
    'l_type' => 1250,
    'r_type' => 1300
};
get(327)-> #{
    'type' => 3,
    'level' => 27,
    'l_type' => 1300,
    'r_type' => 1350
};
get(328)-> #{
    'type' => 3,
    'level' => 28,
    'l_type' => 1350,
    'r_type' => 1400
};
get(329)-> #{
    'type' => 3,
    'level' => 29,
    'l_type' => 1400,
    'r_type' => 1450
};
get(330)-> #{
    'type' => 3,
    'level' => 30,
    'l_type' => 1450,
    'r_type' => 1500
};
get(331)-> #{
    'type' => 3,
    'level' => 31,
    'l_type' => 1500,
    'r_type' => 1550
};
get(332)-> #{
    'type' => 3,
    'level' => 32,
    'l_type' => 1550,
    'r_type' => 1600
};
get(333)-> #{
    'type' => 3,
    'level' => 33,
    'l_type' => 1600,
    'r_type' => 1650
};
get(334)-> #{
    'type' => 3,
    'level' => 34,
    'l_type' => 1650,
    'r_type' => 1700
};
get(335)-> #{
    'type' => 3,
    'level' => 35,
    'l_type' => 1700,
    'r_type' => 1750
};
get(336)-> #{
    'type' => 3,
    'level' => 36,
    'l_type' => 1750,
    'r_type' => 1800
};
get(337)-> #{
    'type' => 3,
    'level' => 37,
    'l_type' => 1800,
    'r_type' => 1850
};
get(338)-> #{
    'type' => 3,
    'level' => 38,
    'l_type' => 1850,
    'r_type' => 1900
};
get(339)-> #{
    'type' => 3,
    'level' => 39,
    'l_type' => 1900,
    'r_type' => 1950
};
get(340)-> #{
    'type' => 3,
    'level' => 40,
    'l_type' => 1950,
    'r_type' => 2000
};
get(341)-> #{
    'type' => 3,
    'level' => 41,
    'l_type' => 2000,
    'r_type' => 2050
};
get(342)-> #{
    'type' => 3,
    'level' => 42,
    'l_type' => 2050,
    'r_type' => 2100
};
get(343)-> #{
    'type' => 3,
    'level' => 43,
    'l_type' => 2100,
    'r_type' => 2150
};
get(344)-> #{
    'type' => 3,
    'level' => 44,
    'l_type' => 2150,
    'r_type' => 2200
};
get(345)-> #{
    'type' => 3,
    'level' => 45,
    'l_type' => 2200,
    'r_type' => 2250
};
get(346)-> #{
    'type' => 3,
    'level' => 46,
    'l_type' => 2250,
    'r_type' => 2300
};
get(347)-> #{
    'type' => 3,
    'level' => 47,
    'l_type' => 2300,
    'r_type' => 2350
};
get(348)-> #{
    'type' => 3,
    'level' => 48,
    'l_type' => 2350,
    'r_type' => 2400
};
get(349)-> #{
    'type' => 3,
    'level' => 49,
    'l_type' => 2400,
    'r_type' => 2450
};
get(350)-> #{
    'type' => 3,
    'level' => 50,
    'l_type' => 2450,
    'r_type' => 2500
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350].
