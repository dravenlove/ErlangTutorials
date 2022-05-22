%%--- coding:utf-8 ---
-module(tb_equip_wash).
-export([get/1,get_list/0]).
get(1)-> #{
    'quality' => 5,
    'weight' => 92,
    'hero_strength' => 1
};
get(2)-> #{
    'quality' => 5,
    'weight' => 92,
    'hero_intelect' => 1
};
get(3)-> #{
    'quality' => 5,
    'weight' => 92,
    'hero_spirit' => 1
};
get(4)-> #{
    'quality' => 5,
    'weight' => 92,
    'hero_leadership' => 1
};
get(5)-> #{
    'quality' => 5,
    'weight' => 92,
    'hero_hero_skill_hurt_inc_rate' => 0.05
};
get(6)-> #{
    'quality' => 4,
    'weight' => 296,
    'hero_hero_skill_hurt_inc_rate' => 0.04
};
get(7)-> #{
    'quality' => 3,
    'weight' => 1234,
    'hero_hero_skill_hurt_inc_rate' => 0.03
};
get(8)-> #{
    'quality' => 2,
    'weight' => 1686,
    'hero_hero_skill_hurt_inc_rate' => 0.02
};
get(9)-> #{
    'quality' => 1,
    'weight' => 1844,
    'hero_hero_skill_hurt_inc_rate' => 0.01
};
get(10)-> #{
    'quality' => 5,
    'weight' => 92,
    'bingzhong_hero_skill_hurt_red_rate' => 0.05
};
get(11)-> #{
    'quality' => 4,
    'weight' => 296,
    'bingzhong_hero_skill_hurt_red_rate' => 0.04
};
get(12)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bingzhong_hero_skill_hurt_red_rate' => 0.03
};
get(13)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bingzhong_hero_skill_hurt_red_rate' => 0.02
};
get(14)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bingzhong_hero_skill_hurt_red_rate' => 0.01
};
get(15)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_base_attack' => 30
};
get(16)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_base_attack' => 20
};
get(17)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_base_attack' => 15
};
get(18)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_base_attack' => 10
};
get(19)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_base_attack' => 5
};
get(20)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_base_attack' => 30
};
get(21)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_base_attack' => 20
};
get(22)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_base_attack' => 15
};
get(23)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_base_attack' => 10
};
get(24)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_base_attack' => 5
};
get(25)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_base_attack' => 40
};
get(26)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_base_attack' => 25
};
get(27)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_base_attack' => 20
};
get(28)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_base_attack' => 15
};
get(29)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_base_attack' => 5
};
get(30)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_base_attack' => 40
};
get(31)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_base_attack' => 25
};
get(32)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_base_attack' => 20
};
get(33)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_base_attack' => 15
};
get(34)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_base_attack' => 5
};
get(35)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_base_defence' => 15
};
get(36)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_base_defence' => 10
};
get(37)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_base_defence' => 7
};
get(38)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_base_defence' => 4
};
get(39)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_base_defence' => 2
};
get(40)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_base_defence' => 15
};
get(41)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_base_defence' => 10
};
get(42)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_base_defence' => 7
};
get(43)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_base_defence' => 4
};
get(44)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_base_defence' => 2
};
get(45)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_base_defence' => 20
};
get(46)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_base_defence' => 15
};
get(47)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_base_defence' => 12
};
get(48)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_base_defence' => 8
};
get(49)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_base_defence' => 4
};
get(50)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_base_defence' => 20
};
get(51)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_base_defence' => 15
};
get(52)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_base_defence' => 12
};
get(53)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_base_defence' => 8
};
get(54)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_base_defence' => 4
};
get(55)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_attack' => 90
};
get(56)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_attack' => 65
};
get(57)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_attack' => 40
};
get(58)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_attack' => 25
};
get(59)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_attack' => 10
};
get(60)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_attack' => 90
};
get(61)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_attack' => 65
};
get(62)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_attack' => 40
};
get(63)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_attack' => 25
};
get(64)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_attack' => 10
};
get(65)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_attack' => 120
};
get(66)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_attack' => 90
};
get(67)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_attack' => 60
};
get(68)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_attack' => 40
};
get(69)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_attack' => 20
};
get(70)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_attack' => 120
};
get(71)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_attack' => 90
};
get(72)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_attack' => 60
};
get(73)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_attack' => 40
};
get(74)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_attack' => 20
};
get(75)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_defence' => 40
};
get(76)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_defence' => 30
};
get(77)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_defence' => 20
};
get(78)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_defence' => 10
};
get(79)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_defence' => 5
};
get(80)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_defence' => 40
};
get(81)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_defence' => 30
};
get(82)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_defence' => 20
};
get(83)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_defence' => 10
};
get(84)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_defence' => 5
};
get(85)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_defence' => 40
};
get(86)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_defence' => 30
};
get(87)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_defence' => 20
};
get(88)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_defence' => 10
};
get(89)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_defence' => 5
};
get(90)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_defence' => 40
};
get(91)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_defence' => 30
};
get(92)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_defence' => 20
};
get(93)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_defence' => 10
};
get(94)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_defence' => 5
};
get(95)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_troops' => 120
};
get(96)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_troops' => 80
};
get(97)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_troops' => 50
};
get(98)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_troops' => 30
};
get(99)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_troops' => 20
};
get(100)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_troops' => 120
};
get(101)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_troops' => 80
};
get(102)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_troops' => 50
};
get(103)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_troops' => 30
};
get(104)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_troops' => 20
};
get(105)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_troops' => 120
};
get(106)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_troops' => 80
};
get(107)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_troops' => 50
};
get(108)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_troops' => 30
};
get(109)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_troops' => 20
};
get(110)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_troops' => 120
};
get(111)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_troops' => 80
};
get(112)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_troops' => 50
};
get(113)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_troops' => 30
};
get(114)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_troops' => 20
};
get(115)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_speed' => 3
};
get(116)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_speed' => 2
};
get(117)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_speed' => 1
};
get(118)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_speed' => 3
};
get(119)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_speed' => 2
};
get(120)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_speed' => 1
};
get(121)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_speed' => 3
};
get(122)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_speed' => 2
};
get(123)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_speed' => 1
};
get(124)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_speed' => 3
};
get(125)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_speed' => 2
};
get(126)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_speed' => 1
};
get(127)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_infantry_hurt_inc_rate' => 0.075
};
get(128)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_infantry_hurt_inc_rate' => 0.06
};
get(129)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_infantry_hurt_inc_rate' => 0.045
};
get(130)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_infantry_hurt_inc_rate' => 0.03
};
get(131)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_infantry_hurt_inc_rate' => 0.015
};
get(132)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_infantry_hurt_inc_rate' => 0.075
};
get(133)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_infantry_hurt_inc_rate' => 0.06
};
get(134)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_infantry_hurt_inc_rate' => 0.045
};
get(135)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_infantry_hurt_inc_rate' => 0.03
};
get(136)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_infantry_hurt_inc_rate' => 0.015
};
get(137)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_infantry_hurt_inc_rate' => 0.075
};
get(138)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_infantry_hurt_inc_rate' => 0.06
};
get(139)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_infantry_hurt_inc_rate' => 0.045
};
get(140)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_infantry_hurt_inc_rate' => 0.03
};
get(141)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_infantry_hurt_inc_rate' => 0.015
};
get(142)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_infantry_hurt_inc_rate' => 0.075
};
get(143)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_infantry_hurt_inc_rate' => 0.06
};
get(144)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_infantry_hurt_inc_rate' => 0.045
};
get(145)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_infantry_hurt_inc_rate' => 0.03
};
get(146)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_infantry_hurt_inc_rate' => 0.015
};
get(147)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_cavalry_hurt_inc_rate' => 0.075
};
get(148)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_cavalry_hurt_inc_rate' => 0.06
};
get(149)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_cavalry_hurt_inc_rate' => 0.045
};
get(150)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_cavalry_hurt_inc_rate' => 0.03
};
get(151)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_cavalry_hurt_inc_rate' => 0.015
};
get(152)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_cavalry_hurt_inc_rate' => 0.075
};
get(153)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_cavalry_hurt_inc_rate' => 0.06
};
get(154)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_cavalry_hurt_inc_rate' => 0.045
};
get(155)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_cavalry_hurt_inc_rate' => 0.03
};
get(156)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_cavalry_hurt_inc_rate' => 0.015
};
get(157)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_cavalry_hurt_inc_rate' => 0.075
};
get(158)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_cavalry_hurt_inc_rate' => 0.06
};
get(159)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_cavalry_hurt_inc_rate' => 0.045
};
get(160)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_cavalry_hurt_inc_rate' => 0.03
};
get(161)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_cavalry_hurt_inc_rate' => 0.015
};
get(162)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_cavalry_hurt_inc_rate' => 0.075
};
get(163)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_cavalry_hurt_inc_rate' => 0.06
};
get(164)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_cavalry_hurt_inc_rate' => 0.045
};
get(165)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_cavalry_hurt_inc_rate' => 0.03
};
get(166)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_cavalry_hurt_inc_rate' => 0.015
};
get(167)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_though_hurt_inc_rate' => 0.075
};
get(168)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_though_hurt_inc_rate' => 0.06
};
get(169)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_though_hurt_inc_rate' => 0.045
};
get(170)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_though_hurt_inc_rate' => 0.03
};
get(171)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_though_hurt_inc_rate' => 0.015
};
get(172)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_though_hurt_inc_rate' => 0.075
};
get(173)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_though_hurt_inc_rate' => 0.06
};
get(174)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_though_hurt_inc_rate' => 0.045
};
get(175)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_though_hurt_inc_rate' => 0.03
};
get(176)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_though_hurt_inc_rate' => 0.015
};
get(177)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_though_hurt_inc_rate' => 0.075
};
get(178)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_though_hurt_inc_rate' => 0.06
};
get(179)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_though_hurt_inc_rate' => 0.045
};
get(180)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_though_hurt_inc_rate' => 0.03
};
get(181)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_though_hurt_inc_rate' => 0.015
};
get(182)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_though_hurt_inc_rate' => 0.075
};
get(183)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_though_hurt_inc_rate' => 0.06
};
get(184)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_though_hurt_inc_rate' => 0.045
};
get(185)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_though_hurt_inc_rate' => 0.03
};
get(186)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_though_hurt_inc_rate' => 0.015
};
get(187)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_alchemist_hurt_inc_rate' => 0.075
};
get(188)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_alchemist_hurt_inc_rate' => 0.06
};
get(189)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_alchemist_hurt_inc_rate' => 0.045
};
get(190)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_alchemist_hurt_inc_rate' => 0.03
};
get(191)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_alchemist_hurt_inc_rate' => 0.015
};
get(192)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_alchemist_hurt_inc_rate' => 0.075
};
get(193)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_alchemist_hurt_inc_rate' => 0.06
};
get(194)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_alchemist_hurt_inc_rate' => 0.045
};
get(195)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_alchemist_hurt_inc_rate' => 0.03
};
get(196)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_alchemist_hurt_inc_rate' => 0.015
};
get(197)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_alchemist_hurt_inc_rate' => 0.075
};
get(198)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_alchemist_hurt_inc_rate' => 0.06
};
get(199)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_alchemist_hurt_inc_rate' => 0.045
};
get(200)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_alchemist_hurt_inc_rate' => 0.03
};
get(201)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_alchemist_hurt_inc_rate' => 0.015
};
get(202)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_alchemist_hurt_inc_rate' => 0.075
};
get(203)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_alchemist_hurt_inc_rate' => 0.06
};
get(204)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_alchemist_hurt_inc_rate' => 0.045
};
get(205)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_alchemist_hurt_inc_rate' => 0.03
};
get(206)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_alchemist_hurt_inc_rate' => 0.015
};
get(207)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_infantry_hurt_red_rate' => 0.075
};
get(208)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_infantry_hurt_red_rate' => 0.06
};
get(209)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_infantry_hurt_red_rate' => 0.045
};
get(210)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_infantry_hurt_red_rate' => 0.03
};
get(211)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_infantry_hurt_red_rate' => 0.015
};
get(212)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_infantry_hurt_red_rate' => 0.075
};
get(213)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_infantry_hurt_red_rate' => 0.06
};
get(214)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_infantry_hurt_red_rate' => 0.045
};
get(215)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_infantry_hurt_red_rate' => 0.03
};
get(216)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_infantry_hurt_red_rate' => 0.015
};
get(217)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_infantry_hurt_red_rate' => 0.075
};
get(218)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_infantry_hurt_red_rate' => 0.06
};
get(219)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_infantry_hurt_red_rate' => 0.045
};
get(220)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_infantry_hurt_red_rate' => 0.03
};
get(221)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_infantry_hurt_red_rate' => 0.015
};
get(222)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_infantry_hurt_red_rate' => 0.075
};
get(223)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_infantry_hurt_red_rate' => 0.06
};
get(224)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_infantry_hurt_red_rate' => 0.045
};
get(225)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_infantry_hurt_red_rate' => 0.03
};
get(226)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_infantry_hurt_red_rate' => 0.015
};
get(227)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_cavalry_hurt_red_rate' => 0.075
};
get(228)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_cavalry_hurt_red_rate' => 0.06
};
get(229)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_cavalry_hurt_red_rate' => 0.045
};
get(230)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_cavalry_hurt_red_rate' => 0.03
};
get(231)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_cavalry_hurt_red_rate' => 0.015
};
get(232)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_cavalry_hurt_red_rate' => 0.075
};
get(233)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_cavalry_hurt_red_rate' => 0.06
};
get(234)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_cavalry_hurt_red_rate' => 0.045
};
get(235)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_cavalry_hurt_red_rate' => 0.03
};
get(236)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_cavalry_hurt_red_rate' => 0.015
};
get(237)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_cavalry_hurt_red_rate' => 0.075
};
get(238)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_cavalry_hurt_red_rate' => 0.06
};
get(239)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_cavalry_hurt_red_rate' => 0.045
};
get(240)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_cavalry_hurt_red_rate' => 0.03
};
get(241)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_cavalry_hurt_red_rate' => 0.015
};
get(242)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_cavalry_hurt_red_rate' => 0.075
};
get(243)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_cavalry_hurt_red_rate' => 0.06
};
get(244)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_cavalry_hurt_red_rate' => 0.045
};
get(245)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_cavalry_hurt_red_rate' => 0.03
};
get(246)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_cavalry_hurt_red_rate' => 0.015
};
get(247)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_though_hurt_red_rate' => 0.075
};
get(248)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_though_hurt_red_rate' => 0.06
};
get(249)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_though_hurt_red_rate' => 0.045
};
get(250)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_though_hurt_red_rate' => 0.03
};
get(251)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_though_hurt_red_rate' => 0.015
};
get(252)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_though_hurt_red_rate' => 0.075
};
get(253)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_though_hurt_red_rate' => 0.06
};
get(254)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_though_hurt_red_rate' => 0.045
};
get(255)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_though_hurt_red_rate' => 0.03
};
get(256)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_though_hurt_red_rate' => 0.015
};
get(257)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_though_hurt_red_rate' => 0.075
};
get(258)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_though_hurt_red_rate' => 0.06
};
get(259)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_though_hurt_red_rate' => 0.045
};
get(260)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_though_hurt_red_rate' => 0.03
};
get(261)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_though_hurt_red_rate' => 0.015
};
get(262)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_though_hurt_red_rate' => 0.075
};
get(263)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_though_hurt_red_rate' => 0.06
};
get(264)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_though_hurt_red_rate' => 0.045
};
get(265)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_though_hurt_red_rate' => 0.03
};
get(266)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_though_hurt_red_rate' => 0.015
};
get(267)-> #{
    'quality' => 5,
    'weight' => 92,
    'bubing_alchemist_hurt_red_rate' => 0.075
};
get(268)-> #{
    'quality' => 4,
    'weight' => 296,
    'bubing_alchemist_hurt_red_rate' => 0.06
};
get(269)-> #{
    'quality' => 3,
    'weight' => 1234,
    'bubing_alchemist_hurt_red_rate' => 0.045
};
get(270)-> #{
    'quality' => 2,
    'weight' => 1686,
    'bubing_alchemist_hurt_red_rate' => 0.03
};
get(271)-> #{
    'quality' => 1,
    'weight' => 1844,
    'bubing_alchemist_hurt_red_rate' => 0.015
};
get(272)-> #{
    'quality' => 5,
    'weight' => 92,
    'qibing_alchemist_hurt_red_rate' => 0.075
};
get(273)-> #{
    'quality' => 4,
    'weight' => 296,
    'qibing_alchemist_hurt_red_rate' => 0.06
};
get(274)-> #{
    'quality' => 3,
    'weight' => 1234,
    'qibing_alchemist_hurt_red_rate' => 0.045
};
get(275)-> #{
    'quality' => 2,
    'weight' => 1686,
    'qibing_alchemist_hurt_red_rate' => 0.03
};
get(276)-> #{
    'quality' => 1,
    'weight' => 1844,
    'qibing_alchemist_hurt_red_rate' => 0.015
};
get(277)-> #{
    'quality' => 5,
    'weight' => 92,
    'gongbing_alchemist_hurt_red_rate' => 0.075
};
get(278)-> #{
    'quality' => 4,
    'weight' => 296,
    'gongbing_alchemist_hurt_red_rate' => 0.06
};
get(279)-> #{
    'quality' => 3,
    'weight' => 1234,
    'gongbing_alchemist_hurt_red_rate' => 0.045
};
get(280)-> #{
    'quality' => 2,
    'weight' => 1686,
    'gongbing_alchemist_hurt_red_rate' => 0.03
};
get(281)-> #{
    'quality' => 1,
    'weight' => 1844,
    'gongbing_alchemist_hurt_red_rate' => 0.015
};
get(282)-> #{
    'quality' => 5,
    'weight' => 92,
    'fangshi_alchemist_hurt_red_rate' => 0.075
};
get(283)-> #{
    'quality' => 4,
    'weight' => 296,
    'fangshi_alchemist_hurt_red_rate' => 0.06
};
get(284)-> #{
    'quality' => 3,
    'weight' => 1234,
    'fangshi_alchemist_hurt_red_rate' => 0.045
};
get(285)-> #{
    'quality' => 2,
    'weight' => 1686,
    'fangshi_alchemist_hurt_red_rate' => 0.03
};
get(286)-> #{
    'quality' => 1,
    'weight' => 1844,
    'fangshi_alchemist_hurt_red_rate' => 0.015
};
get(287)-> #{
    'quality' => 5,
    'weight' => 92,
    'wasteland_multi' => 0.15
};
get(288)-> #{
    'quality' => 4,
    'weight' => 296,
    'wasteland_multi' => 0.1
};
get(289)-> #{
    'quality' => 3,
    'weight' => 1234,
    'wasteland_multi' => 0.06
};
get(290)-> #{
    'quality' => 2,
    'weight' => 1686,
    'wasteland_multi' => 0.03
};
get(291)-> #{
    'quality' => 1,
    'weight' => 1844,
    'wasteland_multi' => 0.01
};
get(292)-> #{
    'quality' => 5,
    'weight' => 92,
    'mining_multi' => 0.15
};
get(293)-> #{
    'quality' => 4,
    'weight' => 296,
    'mining_multi' => 0.1
};
get(294)-> #{
    'quality' => 3,
    'weight' => 1234,
    'mining_multi' => 0.06
};
get(295)-> #{
    'quality' => 2,
    'weight' => 1686,
    'mining_multi' => 0.03
};
get(296)-> #{
    'quality' => 1,
    'weight' => 1844,
    'mining_multi' => 0.01
};
get(297)-> #{
    'quality' => 5,
    'weight' => 92,
    'taxation_multi' => 0.15
};
get(298)-> #{
    'quality' => 4,
    'weight' => 296,
    'taxation_multi' => 0.1
};
get(299)-> #{
    'quality' => 3,
    'weight' => 1234,
    'taxation_multi' => 0.06
};
get(300)-> #{
    'quality' => 2,
    'weight' => 1686,
    'taxation_multi' => 0.03
};
get(301)-> #{
    'quality' => 1,
    'weight' => 1844,
    'taxation_multi' => 0.01
};
get(302)-> #{
    'quality' => 5,
    'weight' => 92,
    'generation_wood_multi' => 0.15
};
get(303)-> #{
    'quality' => 4,
    'weight' => 296,
    'generation_wood_multi' => 0.1
};
get(304)-> #{
    'quality' => 3,
    'weight' => 1234,
    'generation_wood_multi' => 0.06
};
get(305)-> #{
    'quality' => 2,
    'weight' => 1686,
    'generation_wood_multi' => 0.03
};
get(306)-> #{
    'quality' => 1,
    'weight' => 1844,
    'generation_wood_multi' => 0.01
};
get(307)-> #{
    'quality' => 5,
    'weight' => 92,
    'march_speed_multi' => 0.1
};
get(308)-> #{
    'quality' => 4,
    'weight' => 296,
    'march_speed_multi' => 0.07
};
get(309)-> #{
    'quality' => 3,
    'weight' => 1234,
    'march_speed_multi' => 0.05
};
get(310)-> #{
    'quality' => 2,
    'weight' => 1686,
    'march_speed_multi' => 0.03
};
get(311)-> #{
    'quality' => 1,
    'weight' => 1844,
    'march_speed_multi' => 0.01
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311].
