%%--- coding:utf-8 ---
-module(tb_building_addition).
-export([get/1,get_list/0]).
get(101)-> #{
    'kind' => 1,
    'level' => 1,
    'effect' => #{
        '1' => 2
    }
};
get(102)-> #{
    'kind' => 1,
    'level' => 2,
    'effect' => #{
        '1' => 4
    }
};
get(103)-> #{
    'kind' => 1,
    'level' => 3,
    'effect' => #{
        '1' => 6
    }
};
get(104)-> #{
    'kind' => 1,
    'level' => 4,
    'effect' => #{
        '1' => 8
    }
};
get(105)-> #{
    'kind' => 1,
    'level' => 5,
    'effect' => #{
        '1' => 10
    }
};
get(106)-> #{
    'kind' => 1,
    'level' => 6,
    'effect' => #{
        '1' => 12
    }
};
get(107)-> #{
    'kind' => 1,
    'level' => 7,
    'effect' => #{
        '1' => 14
    }
};
get(108)-> #{
    'kind' => 1,
    'level' => 8,
    'effect' => #{
        '1' => 16
    }
};
get(109)-> #{
    'kind' => 1,
    'level' => 9,
    'effect' => #{
        '1' => 18
    }
};
get(110)-> #{
    'kind' => 1,
    'level' => 10,
    'effect' => #{
        '1' => 20
    }
};
get(201)-> #{
    'kind' => 2,
    'level' => 1,
    'effect' => #{
        '2' => 150,
        '3' => 200
    }
};
get(202)-> #{
    'kind' => 2,
    'level' => 2,
    'effect' => #{
        '2' => 300,
        '3' => 400
    }
};
get(203)-> #{
    'kind' => 2,
    'level' => 3,
    'effect' => #{
        '2' => 450,
        '3' => 600
    }
};
get(204)-> #{
    'kind' => 2,
    'level' => 4,
    'effect' => #{
        '2' => 600,
        '3' => 800
    }
};
get(205)-> #{
    'kind' => 2,
    'level' => 5,
    'effect' => #{
        '2' => 750,
        '3' => 1000
    }
};
get(206)-> #{
    'kind' => 2,
    'level' => 6,
    'effect' => #{
        '2' => 900,
        '3' => 1200
    }
};
get(207)-> #{
    'kind' => 2,
    'level' => 7,
    'effect' => #{
        '2' => 1050,
        '3' => 1400
    }
};
get(208)-> #{
    'kind' => 2,
    'level' => 8,
    'effect' => #{
        '2' => 1200,
        '3' => 1600
    }
};
get(209)-> #{
    'kind' => 2,
    'level' => 9,
    'effect' => #{
        '2' => 1350,
        '3' => 1800
    }
};
get(210)-> #{
    'kind' => 2,
    'level' => 10,
    'effect' => #{
        '2' => 1500,
        '3' => 2000
    }
};
get(301)-> #{
    'kind' => 3,
    'level' => 1,
    'effect' => #{
        '4' => 4
    }
};
get(302)-> #{
    'kind' => 3,
    'level' => 2,
    'effect' => #{
        '4' => 8
    }
};
get(303)-> #{
    'kind' => 3,
    'level' => 3,
    'effect' => #{
        '4' => 12
    }
};
get(304)-> #{
    'kind' => 3,
    'level' => 4,
    'effect' => #{
        '4' => 16
    }
};
get(305)-> #{
    'kind' => 3,
    'level' => 5,
    'effect' => #{
        '4' => 20
    }
};
get(306)-> #{
    'kind' => 3,
    'level' => 6,
    'effect' => #{
        '4' => 24
    }
};
get(307)-> #{
    'kind' => 3,
    'level' => 7,
    'effect' => #{
        '4' => 28
    }
};
get(308)-> #{
    'kind' => 3,
    'level' => 8,
    'effect' => #{
        '4' => 32
    }
};
get(309)-> #{
    'kind' => 3,
    'level' => 9,
    'effect' => #{
        '4' => 36
    }
};
get(310)-> #{
    'kind' => 3,
    'level' => 10,
    'effect' => #{
        '4' => 40
    }
};
get(401)-> #{
    'kind' => 4,
    'level' => 1,
    'effect' => #{
        '5' => 8
    }
};
get(402)-> #{
    'kind' => 4,
    'level' => 2,
    'effect' => #{
        '5' => 16
    }
};
get(403)-> #{
    'kind' => 4,
    'level' => 3,
    'effect' => #{
        '5' => 24
    }
};
get(404)-> #{
    'kind' => 4,
    'level' => 4,
    'effect' => #{
        '5' => 32
    }
};
get(405)-> #{
    'kind' => 4,
    'level' => 5,
    'effect' => #{
        '5' => 40
    }
};
get(406)-> #{
    'kind' => 4,
    'level' => 6,
    'effect' => #{
        '5' => 48
    }
};
get(407)-> #{
    'kind' => 4,
    'level' => 7,
    'effect' => #{
        '5' => 56
    }
};
get(408)-> #{
    'kind' => 4,
    'level' => 8,
    'effect' => #{
        '5' => 64
    }
};
get(409)-> #{
    'kind' => 4,
    'level' => 9,
    'effect' => #{
        '5' => 72
    }
};
get(410)-> #{
    'kind' => 4,
    'level' => 10,
    'effect' => #{
        '5' => 80
    }
};
get(501)-> #{
    'kind' => 5,
    'level' => 1,
    'effect' => #{
        '6' => 10
    }
};
get(601)-> #{
    'kind' => 6,
    'level' => 1,
    'effect' => #{
        '7' => 10
    }
};
get(701)-> #{
    'kind' => 7,
    'level' => 1,
    'effect' => #{
        '8' => 1
    }
};
get(702)-> #{
    'kind' => 7,
    'level' => 2,
    'effect' => #{
        '8' => 2
    }
};
get(703)-> #{
    'kind' => 7,
    'level' => 3,
    'effect' => #{
        '8' => 3
    }
};
get(801)-> #{
    'kind' => 8,
    'level' => 1,
    'effect' => #{
        '3' => 200,
        '9' => 3
    }
};
get(802)-> #{
    'kind' => 8,
    'level' => 2,
    'effect' => #{
        '3' => 400,
        '9' => 6
    }
};
get(803)-> #{
    'kind' => 8,
    'level' => 3,
    'effect' => #{
        '3' => 600,
        '9' => 9
    }
};
get(804)-> #{
    'kind' => 8,
    'level' => 4,
    'effect' => #{
        '3' => 800,
        '9' => 12
    }
};
get(805)-> #{
    'kind' => 8,
    'level' => 5,
    'effect' => #{
        '3' => 1000,
        '9' => 15
    }
};
get(806)-> #{
    'kind' => 8,
    'level' => 6,
    'effect' => #{
        '3' => 1200,
        '9' => 18
    }
};
get(807)-> #{
    'kind' => 8,
    'level' => 7,
    'effect' => #{
        '3' => 1400,
        '9' => 21
    }
};
get(808)-> #{
    'kind' => 8,
    'level' => 8,
    'effect' => #{
        '3' => 1600,
        '9' => 24
    }
};
get(809)-> #{
    'kind' => 8,
    'level' => 9,
    'effect' => #{
        '3' => 1800,
        '9' => 27
    }
};
get(810)-> #{
    'kind' => 8,
    'level' => 10,
    'effect' => #{
        '3' => 2000,
        '9' => 30
    }
};
get(901)-> #{
    'kind' => 9,
    'level' => 1,
    'effect' => #{
        '1' => 2
    }
};
get(902)-> #{
    'kind' => 9,
    'level' => 2,
    'effect' => #{
        '1' => 4
    }
};
get(903)-> #{
    'kind' => 9,
    'level' => 3,
    'effect' => #{
        '1' => 6,
        '10' => 5
    }
};
get(904)-> #{
    'kind' => 9,
    'level' => 4,
    'effect' => #{
        '1' => 8
    }
};
get(905)-> #{
    'kind' => 9,
    'level' => 5,
    'effect' => #{
        '1' => 10
    }
};
get(906)-> #{
    'kind' => 9,
    'level' => 6,
    'effect' => #{
        '1' => 12,
        '10' => 5
    }
};
get(907)-> #{
    'kind' => 9,
    'level' => 7,
    'effect' => #{
        '1' => 14
    }
};
get(908)-> #{
    'kind' => 9,
    'level' => 8,
    'effect' => #{
        '1' => 16
    }
};
get(909)-> #{
    'kind' => 9,
    'level' => 9,
    'effect' => #{
        '1' => 18,
        '10' => 5
    }
};
get(910)-> #{
    'kind' => 9,
    'level' => 10,
    'effect' => #{
        '1' => 20
    }
};
get(1001)-> #{
    'kind' => 10,
    'level' => 1,
    'effect' => #{
        '3' => 300,
        '11' => 2
    }
};
get(1002)-> #{
    'kind' => 10,
    'level' => 2,
    'effect' => #{
        '3' => 600,
        '11' => 4
    }
};
get(1003)-> #{
    'kind' => 10,
    'level' => 3,
    'effect' => #{
        '3' => 900,
        '11' => 6
    }
};
get(1004)-> #{
    'kind' => 10,
    'level' => 4,
    'effect' => #{
        '3' => 1200,
        '11' => 8
    }
};
get(1005)-> #{
    'kind' => 10,
    'level' => 5,
    'effect' => #{
        '3' => 1500,
        '11' => 10
    }
};
get(1006)-> #{
    'kind' => 10,
    'level' => 6,
    'effect' => #{
        '3' => 1800,
        '11' => 12
    }
};
get(1007)-> #{
    'kind' => 10,
    'level' => 7,
    'effect' => #{
        '3' => 2100,
        '11' => 14
    }
};
get(1008)-> #{
    'kind' => 10,
    'level' => 8,
    'effect' => #{
        '3' => 2400,
        '11' => 16
    }
};
get(1009)-> #{
    'kind' => 10,
    'level' => 9,
    'effect' => #{
        '3' => 2700,
        '11' => 18
    }
};
get(1010)-> #{
    'kind' => 10,
    'level' => 10,
    'effect' => #{
        '3' => 3000,
        '11' => 20
    }
};
get(1101)-> #{
    'kind' => 11,
    'level' => 1,
    'effect' => #{
        '1' => 2
    }
};
get(1102)-> #{
    'kind' => 11,
    'level' => 2,
    'effect' => #{
        '1' => 4
    }
};
get(1103)-> #{
    'kind' => 11,
    'level' => 3,
    'effect' => #{
        '1' => 6
    }
};
get(1104)-> #{
    'kind' => 11,
    'level' => 4,
    'effect' => #{
        '1' => 8
    }
};
get(1105)-> #{
    'kind' => 11,
    'level' => 5,
    'effect' => #{
        '1' => 10
    }
};
get(1106)-> #{
    'kind' => 11,
    'level' => 6,
    'effect' => #{
        '1' => 12
    }
};
get(1107)-> #{
    'kind' => 11,
    'level' => 7,
    'effect' => #{
        '1' => 14
    }
};
get(1108)-> #{
    'kind' => 11,
    'level' => 8,
    'effect' => #{
        '1' => 16
    }
};
get(1109)-> #{
    'kind' => 11,
    'level' => 9,
    'effect' => #{
        '1' => 18
    }
};
get(1110)-> #{
    'kind' => 11,
    'level' => 10,
    'effect' => #{
        '1' => 20
    }
};
get(1201)-> #{
    'kind' => 12,
    'level' => 1,
    'effect' => #{
        '1' => 3,
        '12' => 1
    }
};
get(1202)-> #{
    'kind' => 12,
    'level' => 2,
    'effect' => #{
        '1' => 6,
        '12' => 1
    }
};
get(1203)-> #{
    'kind' => 12,
    'level' => 3,
    'effect' => #{
        '1' => 9,
        '12' => 1
    }
};
get(1204)-> #{
    'kind' => 12,
    'level' => 4,
    'effect' => #{
        '1' => 12,
        '12' => 2
    }
};
get(1205)-> #{
    'kind' => 12,
    'level' => 5,
    'effect' => #{
        '1' => 15,
        '12' => 2
    }
};
get(1206)-> #{
    'kind' => 12,
    'level' => 6,
    'effect' => #{
        '1' => 18,
        '12' => 2
    }
};
get(1207)-> #{
    'kind' => 12,
    'level' => 7,
    'effect' => #{
        '1' => 21,
        '12' => 3
    }
};
get(1208)-> #{
    'kind' => 12,
    'level' => 8,
    'effect' => #{
        '1' => 24,
        '12' => 3
    }
};
get(1209)-> #{
    'kind' => 12,
    'level' => 9,
    'effect' => #{
        '1' => 27,
        '12' => 3
    }
};
get(1210)-> #{
    'kind' => 12,
    'level' => 10,
    'effect' => #{
        '1' => 30,
        '12' => 4
    }
};
get(1301)-> #{
    'kind' => 13,
    'level' => 1,
    'effect' => #{
        '13' => 1
    }
};
get(1302)-> #{
    'kind' => 13,
    'level' => 2,
    'effect' => #{
        '13' => 2
    }
};
get(1303)-> #{
    'kind' => 13,
    'level' => 3,
    'effect' => #{
        '13' => 3
    }
};
get(1304)-> #{
    'kind' => 13,
    'level' => 4,
    'effect' => #{
        '13' => 4
    }
};
get(1305)-> #{
    'kind' => 13,
    'level' => 5,
    'effect' => #{
        '13' => 5
    }
};
get(1306)-> #{
    'kind' => 13,
    'level' => 6,
    'effect' => #{
        '13' => 6
    }
};
get(1307)-> #{
    'kind' => 13,
    'level' => 7,
    'effect' => #{
        '13' => 7
    }
};
get(1308)-> #{
    'kind' => 13,
    'level' => 8,
    'effect' => #{
        '13' => 8
    }
};
get(1309)-> #{
    'kind' => 13,
    'level' => 9,
    'effect' => #{
        '13' => 9
    }
};
get(1310)-> #{
    'kind' => 13,
    'level' => 10,
    'effect' => #{
        '13' => 10
    }
};
get(1401)-> #{
    'kind' => 14,
    'level' => 1,
    'effect' => #{
        '2' => 70,
        '3' => 100
    }
};
get(1402)-> #{
    'kind' => 14,
    'level' => 2,
    'effect' => #{
        '2' => 140,
        '3' => 200
    }
};
get(1403)-> #{
    'kind' => 14,
    'level' => 3,
    'effect' => #{
        '2' => 210,
        '3' => 300
    }
};
get(1404)-> #{
    'kind' => 14,
    'level' => 4,
    'effect' => #{
        '2' => 280,
        '3' => 400
    }
};
get(1405)-> #{
    'kind' => 14,
    'level' => 5,
    'effect' => #{
        '2' => 350,
        '3' => 500
    }
};
get(1406)-> #{
    'kind' => 14,
    'level' => 6,
    'effect' => #{
        '2' => 420,
        '3' => 600
    }
};
get(1407)-> #{
    'kind' => 14,
    'level' => 7,
    'effect' => #{
        '2' => 490,
        '3' => 700
    }
};
get(1408)-> #{
    'kind' => 14,
    'level' => 8,
    'effect' => #{
        '2' => 560,
        '3' => 800
    }
};
get(1409)-> #{
    'kind' => 14,
    'level' => 9,
    'effect' => #{
        '2' => 630,
        '3' => 900
    }
};
get(1410)-> #{
    'kind' => 14,
    'level' => 10,
    'effect' => #{
        '2' => 700,
        '3' => 1000
    }
};
get(1501)-> #{
    'kind' => 15,
    'level' => 1,
    'effect' => #{
        '2' => 50,
        '14' => 5
    }
};
get(1502)-> #{
    'kind' => 15,
    'level' => 2,
    'effect' => #{
        '2' => 100,
        '14' => 10
    }
};
get(1503)-> #{
    'kind' => 15,
    'level' => 3,
    'effect' => #{
        '2' => 150,
        '14' => 15
    }
};
get(1504)-> #{
    'kind' => 15,
    'level' => 4,
    'effect' => #{
        '2' => 200,
        '14' => 20
    }
};
get(1505)-> #{
    'kind' => 15,
    'level' => 5,
    'effect' => #{
        '2' => 250,
        '14' => 25
    }
};
get(1506)-> #{
    'kind' => 15,
    'level' => 6,
    'effect' => #{
        '2' => 300,
        '14' => 30
    }
};
get(1507)-> #{
    'kind' => 15,
    'level' => 7,
    'effect' => #{
        '2' => 350,
        '14' => 35
    }
};
get(1508)-> #{
    'kind' => 15,
    'level' => 8,
    'effect' => #{
        '2' => 400,
        '14' => 40
    }
};
get(1509)-> #{
    'kind' => 15,
    'level' => 9,
    'effect' => #{
        '2' => 450,
        '14' => 45
    }
};
get(1510)-> #{
    'kind' => 15,
    'level' => 10,
    'effect' => #{
        '2' => 500,
        '14' => 50
    }
};
get(1601)-> #{
    'kind' => 16,
    'level' => 1,
    'effect' => #{
        '3' => 75,
        '15' => 5
    }
};
get(1602)-> #{
    'kind' => 16,
    'level' => 2,
    'effect' => #{
        '3' => 150,
        '15' => 10
    }
};
get(1603)-> #{
    'kind' => 16,
    'level' => 3,
    'effect' => #{
        '3' => 225,
        '15' => 15
    }
};
get(1604)-> #{
    'kind' => 16,
    'level' => 4,
    'effect' => #{
        '3' => 300,
        '15' => 20
    }
};
get(1605)-> #{
    'kind' => 16,
    'level' => 5,
    'effect' => #{
        '3' => 375,
        '15' => 25
    }
};
get(1606)-> #{
    'kind' => 16,
    'level' => 6,
    'effect' => #{
        '3' => 450,
        '15' => 30
    }
};
get(1607)-> #{
    'kind' => 16,
    'level' => 7,
    'effect' => #{
        '3' => 525,
        '15' => 35
    }
};
get(1608)-> #{
    'kind' => 16,
    'level' => 8,
    'effect' => #{
        '3' => 600,
        '15' => 40
    }
};
get(1609)-> #{
    'kind' => 16,
    'level' => 9,
    'effect' => #{
        '3' => 675,
        '15' => 45
    }
};
get(1610)-> #{
    'kind' => 16,
    'level' => 10,
    'effect' => #{
        '3' => 750,
        '15' => 50
    }
};
get(1701)-> #{
    'kind' => 17,
    'level' => 1,
    'effect' => #{
        '2' => 100,
        '3' => 150
    }
};
get(1702)-> #{
    'kind' => 17,
    'level' => 2,
    'effect' => #{
        '2' => 200,
        '3' => 300
    }
};
get(1703)-> #{
    'kind' => 17,
    'level' => 3,
    'effect' => #{
        '2' => 300,
        '3' => 450
    }
};
get(1704)-> #{
    'kind' => 17,
    'level' => 4,
    'effect' => #{
        '2' => 400,
        '3' => 600
    }
};
get(1705)-> #{
    'kind' => 17,
    'level' => 5,
    'effect' => #{
        '2' => 500,
        '3' => 750
    }
};
get(1706)-> #{
    'kind' => 17,
    'level' => 6,
    'effect' => #{
        '2' => 600,
        '3' => 900
    }
};
get(1707)-> #{
    'kind' => 17,
    'level' => 7,
    'effect' => #{
        '2' => 700,
        '3' => 1050
    }
};
get(1708)-> #{
    'kind' => 17,
    'level' => 8,
    'effect' => #{
        '2' => 800,
        '3' => 1200
    }
};
get(1709)-> #{
    'kind' => 17,
    'level' => 9,
    'effect' => #{
        '2' => 900,
        '3' => 1350
    }
};
get(1710)-> #{
    'kind' => 17,
    'level' => 10,
    'effect' => #{
        '2' => 1000,
        '3' => 1500
    }
};
get(1801)-> #{
    'kind' => 18,
    'level' => 1,
    'effect' => #{
        '16' => 1
    }
};
get(1802)-> #{
    'kind' => 18,
    'level' => 2,
    'effect' => #{
        '16' => 2
    }
};
get(1803)-> #{
    'kind' => 18,
    'level' => 3,
    'effect' => #{
        '16' => 3
    }
};
get(1804)-> #{
    'kind' => 18,
    'level' => 4,
    'effect' => #{
        '16' => 4
    }
};
get(1805)-> #{
    'kind' => 18,
    'level' => 5,
    'effect' => #{
        '16' => 5
    }
};
get(1806)-> #{
    'kind' => 18,
    'level' => 6,
    'effect' => #{
        '16' => 6
    }
};
get(1807)-> #{
    'kind' => 18,
    'level' => 7,
    'effect' => #{
        '16' => 7
    }
};
get(1808)-> #{
    'kind' => 18,
    'level' => 8,
    'effect' => #{
        '16' => 8
    }
};
get(1809)-> #{
    'kind' => 18,
    'level' => 9,
    'effect' => #{
        '16' => 9
    }
};
get(1810)-> #{
    'kind' => 18,
    'level' => 10,
    'effect' => #{
        '16' => 10
    }
};
get(1901)-> #{
    'kind' => 19,
    'level' => 1,
    'effect' => #{
        '4' => 1
    }
};
get(1902)-> #{
    'kind' => 19,
    'level' => 2,
    'effect' => #{
        '4' => 2
    }
};
get(1903)-> #{
    'kind' => 19,
    'level' => 3,
    'effect' => #{
        '4' => 3
    }
};
get(1904)-> #{
    'kind' => 19,
    'level' => 4,
    'effect' => #{
        '4' => 4
    }
};
get(1905)-> #{
    'kind' => 19,
    'level' => 5,
    'effect' => #{
        '4' => 5
    }
};
get(1906)-> #{
    'kind' => 19,
    'level' => 6,
    'effect' => #{
        '4' => 6
    }
};
get(1907)-> #{
    'kind' => 19,
    'level' => 7,
    'effect' => #{
        '4' => 7
    }
};
get(1908)-> #{
    'kind' => 19,
    'level' => 8,
    'effect' => #{
        '4' => 8
    }
};
get(1909)-> #{
    'kind' => 19,
    'level' => 9,
    'effect' => #{
        '4' => 9
    }
};
get(1910)-> #{
    'kind' => 19,
    'level' => 10,
    'effect' => #{
        '4' => 10
    }
};
get(2001)-> #{
    'kind' => 20,
    'level' => 1,
    'effect' => #{
        '2' => 150
    }
};
get(2002)-> #{
    'kind' => 20,
    'level' => 2,
    'effect' => #{
        '2' => 300
    }
};
get(2003)-> #{
    'kind' => 20,
    'level' => 3,
    'effect' => #{
        '2' => 450
    }
};
get(2004)-> #{
    'kind' => 20,
    'level' => 4,
    'effect' => #{
        '2' => 600
    }
};
get(2005)-> #{
    'kind' => 20,
    'level' => 5,
    'effect' => #{
        '2' => 750
    }
};
get(2006)-> #{
    'kind' => 20,
    'level' => 6,
    'effect' => #{
        '2' => 900
    }
};
get(2007)-> #{
    'kind' => 20,
    'level' => 7,
    'effect' => #{
        '2' => 1050
    }
};
get(2008)-> #{
    'kind' => 20,
    'level' => 8,
    'effect' => #{
        '2' => 1200
    }
};
get(2009)-> #{
    'kind' => 20,
    'level' => 9,
    'effect' => #{
        '2' => 1350
    }
};
get(2010)-> #{
    'kind' => 20,
    'level' => 10,
    'effect' => #{
        '2' => 1500
    }
};
get(2101)-> #{
    'kind' => 21,
    'level' => 1,
    'effect' => #{
        '3' => 250
    }
};
get(2102)-> #{
    'kind' => 21,
    'level' => 2,
    'effect' => #{
        '3' => 500
    }
};
get(2103)-> #{
    'kind' => 21,
    'level' => 3,
    'effect' => #{
        '3' => 750
    }
};
get(2104)-> #{
    'kind' => 21,
    'level' => 4,
    'effect' => #{
        '3' => 1000
    }
};
get(2105)-> #{
    'kind' => 21,
    'level' => 5,
    'effect' => #{
        '3' => 1250
    }
};
get(2106)-> #{
    'kind' => 21,
    'level' => 6,
    'effect' => #{
        '3' => 1500
    }
};
get(2107)-> #{
    'kind' => 21,
    'level' => 7,
    'effect' => #{
        '3' => 1750
    }
};
get(2108)-> #{
    'kind' => 21,
    'level' => 8,
    'effect' => #{
        '3' => 2000
    }
};
get(2109)-> #{
    'kind' => 21,
    'level' => 9,
    'effect' => #{
        '3' => 2250
    }
};
get(2110)-> #{
    'kind' => 21,
    'level' => 10,
    'effect' => #{
        '3' => 2500
    }
};
get(2201)-> #{
    'kind' => 22,
    'level' => 1,
    'effect' => #{
        '17' => 1
    }
};
get(2202)-> #{
    'kind' => 22,
    'level' => 2,
    'effect' => #{
        '17' => 2,
        '18' => 1
    }
};
get(2203)-> #{
    'kind' => 22,
    'level' => 3,
    'effect' => #{
        '17' => 3
    }
};
get(2204)-> #{
    'kind' => 22,
    'level' => 4,
    'effect' => #{
        '17' => 4,
        '18' => 2
    }
};
get(2205)-> #{
    'kind' => 22,
    'level' => 5,
    'effect' => #{
        '17' => 5
    }
};
get(2206)-> #{
    'kind' => 22,
    'level' => 6,
    'effect' => #{
        '17' => 6,
        '18' => 3
    }
};
get(2207)-> #{
    'kind' => 22,
    'level' => 7,
    'effect' => #{
        '17' => 7
    }
};
get(2208)-> #{
    'kind' => 22,
    'level' => 8,
    'effect' => #{
        '17' => 8,
        '18' => 4
    }
};
get(2209)-> #{
    'kind' => 22,
    'level' => 9,
    'effect' => #{
        '17' => 9
    }
};
get(2301)-> #{
    'kind' => 23,
    'level' => 1,
    'effect' => #{
        '5' => 6
    }
};
get(2302)-> #{
    'kind' => 23,
    'level' => 2,
    'effect' => #{
        '5' => 12
    }
};
get(2303)-> #{
    'kind' => 23,
    'level' => 3,
    'effect' => #{
        '5' => 18
    }
};
get(2304)-> #{
    'kind' => 23,
    'level' => 4,
    'effect' => #{
        '5' => 24
    }
};
get(2305)-> #{
    'kind' => 23,
    'level' => 5,
    'effect' => #{
        '5' => 30
    }
};
get(2306)-> #{
    'kind' => 23,
    'level' => 6,
    'effect' => #{
        '5' => 36
    }
};
get(2307)-> #{
    'kind' => 23,
    'level' => 7,
    'effect' => #{
        '5' => 42
    }
};
get(2308)-> #{
    'kind' => 23,
    'level' => 8,
    'effect' => #{
        '5' => 48
    }
};
get(2309)-> #{
    'kind' => 23,
    'level' => 9,
    'effect' => #{
        '5' => 54
    }
};
get(2310)-> #{
    'kind' => 23,
    'level' => 10,
    'effect' => #{
        '5' => 60
    }
};

get(_N) -> false.
get_list() ->
	[101,102,103,104,105,106,107,108,109,110,201,202,203,204,205,206,207,208,209,210,301,302,303,304,305,306,307,308,309,310,401,402,403,404,405,406,407,408,409,410,501,601,701,702,703,801,802,803,804,805,806,807,808,809,810,901,902,903,904,905,906,907,908,909,910,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2201,2202,2203,2204,2205,2206,2207,2208,2209,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310].