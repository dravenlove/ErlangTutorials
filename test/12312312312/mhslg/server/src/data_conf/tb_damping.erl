%%--- coding:utf-8 ---
-module(tb_damping).
-export([get/1,get_list/0]).
get(1)-> #{
    'value' => 0.4
};
get(2)-> #{
    'value' => 0.396
};
get(3)-> #{
    'value' => 0.392
};
get(4)-> #{
    'value' => 0.388
};
get(5)-> #{
    'value' => 0.384
};
get(6)-> #{
    'value' => 0.38
};
get(7)-> #{
    'value' => 0.376
};
get(8)-> #{
    'value' => 0.372
};
get(9)-> #{
    'value' => 0.368
};
get(10)-> #{
    'value' => 0.364
};
get(11)-> #{
    'value' => 0.36
};
get(12)-> #{
    'value' => 0.356
};
get(13)-> #{
    'value' => 0.352
};
get(14)-> #{
    'value' => 0.348
};
get(15)-> #{
    'value' => 0.344
};
get(16)-> #{
    'value' => 0.34
};
get(17)-> #{
    'value' => 0.336
};
get(18)-> #{
    'value' => 0.332
};
get(19)-> #{
    'value' => 0.328
};
get(20)-> #{
    'value' => 0.324
};
get(21)-> #{
    'value' => 0.32
};
get(22)-> #{
    'value' => 0.316
};
get(23)-> #{
    'value' => 0.312
};
get(24)-> #{
    'value' => 0.308
};
get(25)-> #{
    'value' => 0.304
};
get(26)-> #{
    'value' => 0.3
};
get(27)-> #{
    'value' => 0.296
};
get(28)-> #{
    'value' => 0.292
};
get(29)-> #{
    'value' => 0.288
};
get(30)-> #{
    'value' => 0.284
};
get(31)-> #{
    'value' => 0.28
};
get(32)-> #{
    'value' => 0.276
};
get(33)-> #{
    'value' => 0.272
};
get(34)-> #{
    'value' => 0.268
};
get(35)-> #{
    'value' => 0.264
};
get(36)-> #{
    'value' => 0.26
};
get(37)-> #{
    'value' => 0.256
};
get(38)-> #{
    'value' => 0.252
};
get(39)-> #{
    'value' => 0.248
};
get(40)-> #{
    'value' => 0.244
};
get(41)-> #{
    'value' => 0.24
};
get(42)-> #{
    'value' => 0.236
};
get(43)-> #{
    'value' => 0.232
};
get(44)-> #{
    'value' => 0.228
};
get(45)-> #{
    'value' => 0.224
};
get(46)-> #{
    'value' => 0.22
};
get(47)-> #{
    'value' => 0.216
};
get(48)-> #{
    'value' => 0.212
};
get(49)-> #{
    'value' => 0.208
};
get(50)-> #{
    'value' => 0.204
};
get(51)-> #{
    'value' => 0.2
};
get(52)-> #{
    'value' => 0.196
};
get(53)-> #{
    'value' => 0.192
};
get(54)-> #{
    'value' => 0.188
};
get(55)-> #{
    'value' => 0.184
};
get(56)-> #{
    'value' => 0.18
};
get(57)-> #{
    'value' => 0.176
};
get(58)-> #{
    'value' => 0.172
};
get(59)-> #{
    'value' => 0.168
};
get(60)-> #{
    'value' => 0.164
};
get(61)-> #{
    'value' => 0.16
};
get(62)-> #{
    'value' => 0.156
};
get(63)-> #{
    'value' => 0.152
};
get(64)-> #{
    'value' => 0.148
};
get(65)-> #{
    'value' => 0.144
};
get(66)-> #{
    'value' => 0.14
};
get(67)-> #{
    'value' => 0.136
};
get(68)-> #{
    'value' => 0.132
};
get(69)-> #{
    'value' => 0.128
};
get(70)-> #{
    'value' => 0.124
};
get(71)-> #{
    'value' => 0.12
};
get(72)-> #{
    'value' => 0.116
};
get(73)-> #{
    'value' => 0.112
};
get(74)-> #{
    'value' => 0.108
};
get(75)-> #{
    'value' => 0.104
};
get(76)-> #{
    'value' => 0.1
};
get(77)-> #{
    'value' => 0.096
};
get(78)-> #{
    'value' => 0.092
};
get(79)-> #{
    'value' => 0.088
};
get(80)-> #{
    'value' => 0.084
};
get(81)-> #{
    'value' => 0.08
};
get(82)-> #{
    'value' => 0.076
};
get(83)-> #{
    'value' => 0.072
};
get(84)-> #{
    'value' => 0.068
};
get(85)-> #{
    'value' => 0.064
};
get(86)-> #{
    'value' => 0.06
};
get(87)-> #{
    'value' => 0.056
};
get(88)-> #{
    'value' => 0.052
};
get(89)-> #{
    'value' => 0.048
};
get(90)-> #{
    'value' => 0.044
};
get(91)-> #{
    'value' => 0.04
};
get(92)-> #{
    'value' => 0.036
};
get(93)-> #{
    'value' => 0.032
};
get(94)-> #{
    'value' => 0.028
};
get(95)-> #{
    'value' => 0.024
};
get(96)-> #{
    'value' => 0.02
};
get(97)-> #{
    'value' => 0.016
};
get(98)-> #{
    'value' => 0.012
};
get(99)-> #{
    'value' => 0.00800000000000001
};
get(100)-> #{
    'value' => 0.0
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100].
