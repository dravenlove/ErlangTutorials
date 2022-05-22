%%--- coding:utf-8 ---
-module(tb_tims_and_gold).
-export([get/1,get_list/0]).
get(1)-> #{
    'gold_num' => 5
};
get(2)-> #{
    'gold_num' => 5
};
get(3)-> #{
    'gold_num' => 5
};
get(4)-> #{
    'gold_num' => 5
};
get(5)-> #{
    'gold_num' => 10
};
get(6)-> #{
    'gold_num' => 10
};
get(7)-> #{
    'gold_num' => 10
};
get(8)-> #{
    'gold_num' => 10
};
get(9)-> #{
    'gold_num' => 15
};
get(10)-> #{
    'gold_num' => 15
};
get(11)-> #{
    'gold_num' => 15
};
get(12)-> #{
    'gold_num' => 15
};
get(13)-> #{
    'gold_num' => 20
};
get(14)-> #{
    'gold_num' => 20
};
get(15)-> #{
    'gold_num' => 20
};
get(16)-> #{
    'gold_num' => 20
};
get(17)-> #{
    'gold_num' => 30
};
get(18)-> #{
    'gold_num' => 30
};
get(19)-> #{
    'gold_num' => 30
};
get(20)-> #{
    'gold_num' => 30
};
get(21)-> #{
    'gold_num' => 40
};
get(22)-> #{
    'gold_num' => 40
};
get(23)-> #{
    'gold_num' => 40
};
get(24)-> #{
    'gold_num' => 40
};
get(25)-> #{
    'gold_num' => 50
};
get(26)-> #{
    'gold_num' => 50
};
get(27)-> #{
    'gold_num' => 50
};
get(28)-> #{
    'gold_num' => 50
};
get(29)-> #{
    'gold_num' => 60
};
get(30)-> #{
    'gold_num' => 60
};
get(31)-> #{
    'gold_num' => 60
};
get(32)-> #{
    'gold_num' => 60
};
get(33)-> #{
    'gold_num' => 70
};
get(34)-> #{
    'gold_num' => 70
};
get(35)-> #{
    'gold_num' => 70
};
get(36)-> #{
    'gold_num' => 70
};
get(37)-> #{
    'gold_num' => 80
};
get(38)-> #{
    'gold_num' => 80
};
get(39)-> #{
    'gold_num' => 80
};
get(40)-> #{
    'gold_num' => 80
};
get(41)-> #{
    'gold_num' => 100
};
get(42)-> #{
    'gold_num' => 100
};
get(43)-> #{
    'gold_num' => 100
};
get(44)-> #{
    'gold_num' => 100
};
get(45)-> #{
    'gold_num' => 120
};
get(46)-> #{
    'gold_num' => 120
};
get(47)-> #{
    'gold_num' => 120
};
get(48)-> #{
    'gold_num' => 120
};
get(49)-> #{
    'gold_num' => 140
};
get(50)-> #{
    'gold_num' => 140
};
get(51)-> #{
    'gold_num' => 140
};
get(52)-> #{
    'gold_num' => 140
};
get(53)-> #{
    'gold_num' => 160
};
get(54)-> #{
    'gold_num' => 160
};
get(55)-> #{
    'gold_num' => 160
};
get(56)-> #{
    'gold_num' => 160
};
get(57)-> #{
    'gold_num' => 180
};
get(58)-> #{
    'gold_num' => 180
};
get(59)-> #{
    'gold_num' => 180
};
get(60)-> #{
    'gold_num' => 180
};
get(61)-> #{
    'gold_num' => 200
};
get(62)-> #{
    'gold_num' => 200
};
get(63)-> #{
    'gold_num' => 200
};
get(64)-> #{
    'gold_num' => 200
};
get(65)-> #{
    'gold_num' => 250
};
get(66)-> #{
    'gold_num' => 250
};
get(67)-> #{
    'gold_num' => 250
};
get(68)-> #{
    'gold_num' => 250
};
get(69)-> #{
    'gold_num' => 300
};
get(70)-> #{
    'gold_num' => 300
};
get(71)-> #{
    'gold_num' => 300
};
get(72)-> #{
    'gold_num' => 300
};
get(73)-> #{
    'gold_num' => 400
};
get(74)-> #{
    'gold_num' => 400
};
get(75)-> #{
    'gold_num' => 400
};
get(76)-> #{
    'gold_num' => 400
};
get(77)-> #{
    'gold_num' => 500
};
get(78)-> #{
    'gold_num' => 500
};
get(79)-> #{
    'gold_num' => 500
};
get(80)-> #{
    'gold_num' => 500
};
get(81)-> #{
    'gold_num' => 600
};
get(82)-> #{
    'gold_num' => 600
};
get(83)-> #{
    'gold_num' => 600
};
get(84)-> #{
    'gold_num' => 600
};
get(85)-> #{
    'gold_num' => 800
};
get(86)-> #{
    'gold_num' => 800
};
get(87)-> #{
    'gold_num' => 800
};
get(88)-> #{
    'gold_num' => 800
};
get(89)-> #{
    'gold_num' => 1000
};
get(90)-> #{
    'gold_num' => 1000
};
get(91)-> #{
    'gold_num' => 1000
};
get(92)-> #{
    'gold_num' => 1000
};
get(93)-> #{
    'gold_num' => 1500
};
get(94)-> #{
    'gold_num' => 1500
};
get(95)-> #{
    'gold_num' => 1500
};
get(96)-> #{
    'gold_num' => 1500
};
get(97)-> #{
    'gold_num' => 2000
};
get(98)-> #{
    'gold_num' => 2000
};
get(99)-> #{
    'gold_num' => 2000
};
get(100)-> #{
    'gold_num' => 2000
};

get(_N) -> false.
get_list() ->
	[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100].
