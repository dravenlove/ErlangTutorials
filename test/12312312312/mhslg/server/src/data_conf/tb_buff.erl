%%--- coding:utf-8 ---
-module(tb_buff).
-export([get/1,get_list/0]).
get(1001001)-> #{
    'group' => 1001,
    'level' => 1,
    'round' => 2,
    'buff_type' => 2,
    'type' => 1001,
    'value_a' => 1.0
};
get(1002001)-> #{
    'group' => 1002,
    'level' => 1,
    'round' => 2,
    'buff_type' => 2,
    'type' => 1002,
    'value_a' => 0.1,
    'value_b' => 0.1
};
get(1003001)-> #{
    'group' => 1003,
    'level' => 1,
    'round' => 3,
    'buff_type' => 2,
    'type' => 1003,
    'value_a' => 30.0
};
get(1004001)-> #{
    'group' => 1004,
    'level' => 1,
    'round' => 1,
    'buff_type' => 2,
    'type' => 1004
};
get(1005001)-> #{
    'group' => 1005,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 1005,
    'value_a' => 0.1
};
get(1006001)-> #{
    'group' => 1006,
    'level' => 1,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.31,
    'value_b' => 0.31,
    'value_c' => 0.25
};
get(1007001)-> #{
    'group' => 1007,
    'level' => 1,
    'round' => 3,
    'buff_type' => 2,
    'type' => 1007,
    'value_a' => 0.05
};
get(1008001)-> #{
    'group' => 1008,
    'level' => 1,
    'round' => 2,
    'buff_type' => 2,
    'type' => 1008,
    'value_a' => 0.05,
    'value_b' => 0.05,
    'value_c' => 0.5
};
get(1009001)-> #{
    'group' => 1009,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.5
};
get(1010001)-> #{
    'group' => 1010,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.06
};
get(1011001)-> #{
    'group' => 1011,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.06
};
get(1012001)-> #{
    'group' => 1012,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"speed"/utf8>>,
    'value_a' => 5.0
};
get(1013001)-> #{
    'group' => 1013,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.06
};
get(1013002)-> #{
    'group' => 1013,
    'level' => 2,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.07
};
get(1013003)-> #{
    'group' => 1013,
    'level' => 3,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.08
};
get(1013004)-> #{
    'group' => 1013,
    'level' => 4,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.09
};
get(1013005)-> #{
    'group' => 1013,
    'level' => 5,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.1
};
get(1013006)-> #{
    'group' => 1013,
    'level' => 6,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.11
};
get(1013007)-> #{
    'group' => 1013,
    'level' => 7,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.12
};
get(1013008)-> #{
    'group' => 1013,
    'level' => 8,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.13
};
get(1013009)-> #{
    'group' => 1013,
    'level' => 9,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.14
};
get(1013010)-> #{
    'group' => 1013,
    'level' => 10,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.15
};
get(1013011)-> #{
    'group' => 1013,
    'level' => 11,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.16
};
get(1013012)-> #{
    'group' => 1013,
    'level' => 12,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.17
};
get(1013013)-> #{
    'group' => 1013,
    'level' => 13,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.18
};
get(1013014)-> #{
    'group' => 1013,
    'level' => 14,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.19
};
get(1013015)-> #{
    'group' => 1013,
    'level' => 15,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.2
};
get(1013016)-> #{
    'group' => 1013,
    'level' => 16,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.21
};
get(1013017)-> #{
    'group' => 1013,
    'level' => 17,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.22
};
get(1013018)-> #{
    'group' => 1013,
    'level' => 18,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.23
};
get(1013019)-> #{
    'group' => 1013,
    'level' => 19,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.24
};
get(1013020)-> #{
    'group' => 1013,
    'level' => 20,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.25
};
get(1013021)-> #{
    'group' => 1013,
    'level' => 21,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.26
};
get(1013022)-> #{
    'group' => 1013,
    'level' => 22,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.27
};
get(1013023)-> #{
    'group' => 1013,
    'level' => 23,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.28
};
get(1013024)-> #{
    'group' => 1013,
    'level' => 24,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.29
};
get(1013025)-> #{
    'group' => 1013,
    'level' => 25,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.3
};
get(1013026)-> #{
    'group' => 1013,
    'level' => 26,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.305
};
get(1013027)-> #{
    'group' => 1013,
    'level' => 27,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.31
};
get(1013028)-> #{
    'group' => 1013,
    'level' => 28,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.315
};
get(1013029)-> #{
    'group' => 1013,
    'level' => 29,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.32
};
get(1013030)-> #{
    'group' => 1013,
    'level' => 30,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.325
};
get(1014001)-> #{
    'group' => 1014,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.06
};
get(1014002)-> #{
    'group' => 1014,
    'level' => 2,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.07
};
get(1014003)-> #{
    'group' => 1014,
    'level' => 3,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.08
};
get(1014004)-> #{
    'group' => 1014,
    'level' => 4,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.09
};
get(1014005)-> #{
    'group' => 1014,
    'level' => 5,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.1
};
get(1014006)-> #{
    'group' => 1014,
    'level' => 6,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.11
};
get(1014007)-> #{
    'group' => 1014,
    'level' => 7,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.12
};
get(1014008)-> #{
    'group' => 1014,
    'level' => 8,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.13
};
get(1014009)-> #{
    'group' => 1014,
    'level' => 9,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.14
};
get(1014010)-> #{
    'group' => 1014,
    'level' => 10,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.15
};
get(1014011)-> #{
    'group' => 1014,
    'level' => 11,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.16
};
get(1014012)-> #{
    'group' => 1014,
    'level' => 12,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.17
};
get(1014013)-> #{
    'group' => 1014,
    'level' => 13,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.18
};
get(1014014)-> #{
    'group' => 1014,
    'level' => 14,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.19
};
get(1014015)-> #{
    'group' => 1014,
    'level' => 15,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.2
};
get(1014016)-> #{
    'group' => 1014,
    'level' => 16,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.21
};
get(1014017)-> #{
    'group' => 1014,
    'level' => 17,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.22
};
get(1014018)-> #{
    'group' => 1014,
    'level' => 18,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.23
};
get(1014019)-> #{
    'group' => 1014,
    'level' => 19,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.24
};
get(1014020)-> #{
    'group' => 1014,
    'level' => 20,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.25
};
get(1014021)-> #{
    'group' => 1014,
    'level' => 21,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.26
};
get(1014022)-> #{
    'group' => 1014,
    'level' => 22,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.27
};
get(1014023)-> #{
    'group' => 1014,
    'level' => 23,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.28
};
get(1014024)-> #{
    'group' => 1014,
    'level' => 24,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.29
};
get(1014025)-> #{
    'group' => 1014,
    'level' => 25,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.3
};
get(1014026)-> #{
    'group' => 1014,
    'level' => 26,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.305
};
get(1014027)-> #{
    'group' => 1014,
    'level' => 27,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.31
};
get(1014028)-> #{
    'group' => 1014,
    'level' => 28,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.315
};
get(1014029)-> #{
    'group' => 1014,
    'level' => 29,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.32
};
get(1014030)-> #{
    'group' => 1014,
    'level' => 30,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.325
};
get(1015001)-> #{
    'group' => 1015,
    'level' => 1,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.2
};
get(1015002)-> #{
    'group' => 1015,
    'level' => 2,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.22
};
get(1015003)-> #{
    'group' => 1015,
    'level' => 3,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.24
};
get(1015004)-> #{
    'group' => 1015,
    'level' => 4,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.26
};
get(1015005)-> #{
    'group' => 1015,
    'level' => 5,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.28
};
get(1015006)-> #{
    'group' => 1015,
    'level' => 6,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.3
};
get(1015007)-> #{
    'group' => 1015,
    'level' => 7,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.32
};
get(1015008)-> #{
    'group' => 1015,
    'level' => 8,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.34
};
get(1015009)-> #{
    'group' => 1015,
    'level' => 9,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.36
};
get(1015010)-> #{
    'group' => 1015,
    'level' => 10,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.38
};
get(1015011)-> #{
    'group' => 1015,
    'level' => 11,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.4
};
get(1015012)-> #{
    'group' => 1015,
    'level' => 12,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.42
};
get(1015013)-> #{
    'group' => 1015,
    'level' => 13,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.44
};
get(1015014)-> #{
    'group' => 1015,
    'level' => 14,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.46
};
get(1015015)-> #{
    'group' => 1015,
    'level' => 15,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.48
};
get(1015016)-> #{
    'group' => 1015,
    'level' => 16,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(1015017)-> #{
    'group' => 1015,
    'level' => 17,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.52
};
get(1015018)-> #{
    'group' => 1015,
    'level' => 18,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.54
};
get(1015019)-> #{
    'group' => 1015,
    'level' => 19,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.56
};
get(1015020)-> #{
    'group' => 1015,
    'level' => 20,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.58
};
get(1015021)-> #{
    'group' => 1015,
    'level' => 21,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.6
};
get(1015022)-> #{
    'group' => 1015,
    'level' => 22,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.62
};
get(1015023)-> #{
    'group' => 1015,
    'level' => 23,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.64
};
get(1015024)-> #{
    'group' => 1015,
    'level' => 24,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.66
};
get(1015025)-> #{
    'group' => 1015,
    'level' => 25,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.68
};
get(1015026)-> #{
    'group' => 1015,
    'level' => 26,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.685
};
get(1015027)-> #{
    'group' => 1015,
    'level' => 27,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.69
};
get(1015028)-> #{
    'group' => 1015,
    'level' => 28,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.695
};
get(1015029)-> #{
    'group' => 1015,
    'level' => 29,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.7
};
get(1015030)-> #{
    'group' => 1015,
    'level' => 30,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.705
};
get(1016001)-> #{
    'group' => 1016,
    'level' => 1,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hero_skill_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(1017001)-> #{
    'group' => 1017,
    'level' => 1,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.3
};
get(1017002)-> #{
    'group' => 1017,
    'level' => 2,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.32
};
get(1017003)-> #{
    'group' => 1017,
    'level' => 3,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.34
};
get(1017004)-> #{
    'group' => 1017,
    'level' => 4,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.36
};
get(1017005)-> #{
    'group' => 1017,
    'level' => 5,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.38
};
get(1017006)-> #{
    'group' => 1017,
    'level' => 6,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.4
};
get(1017007)-> #{
    'group' => 1017,
    'level' => 7,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.42
};
get(1017008)-> #{
    'group' => 1017,
    'level' => 8,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.44
};
get(1017009)-> #{
    'group' => 1017,
    'level' => 9,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.46
};
get(1017010)-> #{
    'group' => 1017,
    'level' => 10,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.48
};
get(1017011)-> #{
    'group' => 1017,
    'level' => 11,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(1017012)-> #{
    'group' => 1017,
    'level' => 12,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.52
};
get(1017013)-> #{
    'group' => 1017,
    'level' => 13,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.54
};
get(1017014)-> #{
    'group' => 1017,
    'level' => 14,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.56
};
get(1017015)-> #{
    'group' => 1017,
    'level' => 15,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.58
};
get(1017016)-> #{
    'group' => 1017,
    'level' => 16,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.6
};
get(1017017)-> #{
    'group' => 1017,
    'level' => 17,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.62
};
get(1017018)-> #{
    'group' => 1017,
    'level' => 18,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.64
};
get(1017019)-> #{
    'group' => 1017,
    'level' => 19,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.66
};
get(1017020)-> #{
    'group' => 1017,
    'level' => 20,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.68
};
get(1017021)-> #{
    'group' => 1017,
    'level' => 21,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.7
};
get(1017022)-> #{
    'group' => 1017,
    'level' => 22,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.72
};
get(1017023)-> #{
    'group' => 1017,
    'level' => 23,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.74
};
get(1017024)-> #{
    'group' => 1017,
    'level' => 24,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.76
};
get(1017025)-> #{
    'group' => 1017,
    'level' => 25,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.78
};
get(1017026)-> #{
    'group' => 1017,
    'level' => 26,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.79
};
get(1017027)-> #{
    'group' => 1017,
    'level' => 27,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.8
};
get(1017028)-> #{
    'group' => 1017,
    'level' => 28,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.81
};
get(1017029)-> #{
    'group' => 1017,
    'level' => 29,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.82
};
get(1017030)-> #{
    'group' => 1017,
    'level' => 30,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.83
};
get(1018001)-> #{
    'group' => 1018,
    'level' => 1,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.05
};
get(1019001)-> #{
    'group' => 1019,
    'level' => 1,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.18
};
get(1019002)-> #{
    'group' => 1019,
    'level' => 2,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.196
};
get(1019003)-> #{
    'group' => 1019,
    'level' => 3,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.212
};
get(1019004)-> #{
    'group' => 1019,
    'level' => 4,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.228
};
get(1019005)-> #{
    'group' => 1019,
    'level' => 5,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.244
};
get(1019006)-> #{
    'group' => 1019,
    'level' => 6,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.26
};
get(1019007)-> #{
    'group' => 1019,
    'level' => 7,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.276
};
get(1019008)-> #{
    'group' => 1019,
    'level' => 8,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.292
};
get(1019009)-> #{
    'group' => 1019,
    'level' => 9,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.308
};
get(1019010)-> #{
    'group' => 1019,
    'level' => 10,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.324
};
get(1019011)-> #{
    'group' => 1019,
    'level' => 11,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.34
};
get(1019012)-> #{
    'group' => 1019,
    'level' => 12,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.356
};
get(1019013)-> #{
    'group' => 1019,
    'level' => 13,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.372
};
get(1019014)-> #{
    'group' => 1019,
    'level' => 14,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.388
};
get(1019015)-> #{
    'group' => 1019,
    'level' => 15,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.404
};
get(1019016)-> #{
    'group' => 1019,
    'level' => 16,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.42
};
get(1019017)-> #{
    'group' => 1019,
    'level' => 17,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.436
};
get(1019018)-> #{
    'group' => 1019,
    'level' => 18,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.452
};
get(1019019)-> #{
    'group' => 1019,
    'level' => 19,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.468
};
get(1019020)-> #{
    'group' => 1019,
    'level' => 20,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.484
};
get(1019021)-> #{
    'group' => 1019,
    'level' => 21,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.5
};
get(1019022)-> #{
    'group' => 1019,
    'level' => 22,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.516
};
get(1019023)-> #{
    'group' => 1019,
    'level' => 23,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.532
};
get(1019024)-> #{
    'group' => 1019,
    'level' => 24,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.548
};
get(1019025)-> #{
    'group' => 1019,
    'level' => 25,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.564
};
get(1019026)-> #{
    'group' => 1019,
    'level' => 26,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.58
};
get(1019027)-> #{
    'group' => 1019,
    'level' => 27,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.596
};
get(1019028)-> #{
    'group' => 1019,
    'level' => 28,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.612
};
get(1019029)-> #{
    'group' => 1019,
    'level' => 29,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.628
};
get(1019030)-> #{
    'group' => 1019,
    'level' => 30,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.644
};
get(1020001)-> #{
    'group' => 1020,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.45
};
get(1020002)-> #{
    'group' => 1020,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.5
};
get(1020003)-> #{
    'group' => 1020,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.55
};
get(1020004)-> #{
    'group' => 1020,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.6
};
get(1020005)-> #{
    'group' => 1020,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.65
};
get(1020006)-> #{
    'group' => 1020,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.7
};
get(1020007)-> #{
    'group' => 1020,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.75
};
get(1020008)-> #{
    'group' => 1020,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.8
};
get(1020009)-> #{
    'group' => 1020,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.85
};
get(1020010)-> #{
    'group' => 1020,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.9
};
get(1020011)-> #{
    'group' => 1020,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.95
};
get(1020012)-> #{
    'group' => 1020,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 1.0
};
get(1020013)-> #{
    'group' => 1020,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 1.05
};
get(1020014)-> #{
    'group' => 1020,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 1.1
};
get(1020015)-> #{
    'group' => 1020,
    'level' => 15,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 1.15
};
get(1020016)-> #{
    'group' => 1020,
    'level' => 16,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 1.2
};
get(1020017)-> #{
    'group' => 1020,
    'level' => 17,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.25,
    'value_b' => 0.5
};
get(1020018)-> #{
    'group' => 1020,
    'level' => 18,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.3,
    'value_b' => 0.5
};
get(1020019)-> #{
    'group' => 1020,
    'level' => 19,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.35,
    'value_b' => 0.5
};
get(1020020)-> #{
    'group' => 1020,
    'level' => 20,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.4,
    'value_b' => 0.5
};
get(1020021)-> #{
    'group' => 1020,
    'level' => 21,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.45,
    'value_b' => 0.5
};
get(1020022)-> #{
    'group' => 1020,
    'level' => 22,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.5,
    'value_b' => 0.5
};
get(1020023)-> #{
    'group' => 1020,
    'level' => 23,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.55,
    'value_b' => 0.5
};
get(1020024)-> #{
    'group' => 1020,
    'level' => 24,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.6,
    'value_b' => 0.5
};
get(1020025)-> #{
    'group' => 1020,
    'level' => 25,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.65,
    'value_b' => 0.5
};
get(1020026)-> #{
    'group' => 1020,
    'level' => 26,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.7,
    'value_b' => 0.5
};
get(1020027)-> #{
    'group' => 1020,
    'level' => 27,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.75,
    'value_b' => 0.5
};
get(1020028)-> #{
    'group' => 1020,
    'level' => 28,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.8,
    'value_b' => 0.5
};
get(1020029)-> #{
    'group' => 1020,
    'level' => 29,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.85,
    'value_b' => 0.5
};
get(1020030)-> #{
    'group' => 1020,
    'level' => 30,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1010,
    'value_a' => 1.9,
    'value_b' => 0.5
};
get(1021001)-> #{
    'group' => 1021,
    'level' => 1,
    'round' => 1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.2
};
get(1022001)-> #{
    'group' => 1022,
    'level' => 1,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.15,
    'value_b' => 0.15,
    'value_c' => 0.16
};
get(1022002)-> #{
    'group' => 1022,
    'level' => 2,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.16,
    'value_b' => 0.16,
    'value_c' => 0.168
};
get(1022003)-> #{
    'group' => 1022,
    'level' => 3,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.17,
    'value_b' => 0.17,
    'value_c' => 0.176
};
get(1022004)-> #{
    'group' => 1022,
    'level' => 4,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.18,
    'value_b' => 0.18,
    'value_c' => 0.184
};
get(1022005)-> #{
    'group' => 1022,
    'level' => 5,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.19,
    'value_b' => 0.19,
    'value_c' => 0.192
};
get(1022006)-> #{
    'group' => 1022,
    'level' => 6,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.2,
    'value_b' => 0.2,
    'value_c' => 0.2
};
get(1022007)-> #{
    'group' => 1022,
    'level' => 7,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.21,
    'value_b' => 0.21,
    'value_c' => 0.208
};
get(1022008)-> #{
    'group' => 1022,
    'level' => 8,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.22,
    'value_b' => 0.22,
    'value_c' => 0.216
};
get(1022009)-> #{
    'group' => 1022,
    'level' => 9,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.23,
    'value_b' => 0.23,
    'value_c' => 0.224
};
get(1022010)-> #{
    'group' => 1022,
    'level' => 10,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.24,
    'value_b' => 0.24,
    'value_c' => 0.232
};
get(1022011)-> #{
    'group' => 1022,
    'level' => 11,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.25,
    'value_b' => 0.25,
    'value_c' => 0.24
};
get(1022012)-> #{
    'group' => 1022,
    'level' => 12,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.26,
    'value_b' => 0.26,
    'value_c' => 0.248
};
get(1022013)-> #{
    'group' => 1022,
    'level' => 13,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.27,
    'value_b' => 0.27,
    'value_c' => 0.256
};
get(1022014)-> #{
    'group' => 1022,
    'level' => 14,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.28,
    'value_b' => 0.28,
    'value_c' => 0.264
};
get(1022015)-> #{
    'group' => 1022,
    'level' => 15,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.29,
    'value_b' => 0.29,
    'value_c' => 0.272
};
get(1022016)-> #{
    'group' => 1022,
    'level' => 16,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.3,
    'value_b' => 0.3,
    'value_c' => 0.28
};
get(1022017)-> #{
    'group' => 1022,
    'level' => 17,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.31,
    'value_b' => 0.31,
    'value_c' => 0.288
};
get(1022018)-> #{
    'group' => 1022,
    'level' => 18,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.32,
    'value_b' => 0.32,
    'value_c' => 0.296
};
get(1022019)-> #{
    'group' => 1022,
    'level' => 19,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.33,
    'value_b' => 0.33,
    'value_c' => 0.304
};
get(1022020)-> #{
    'group' => 1022,
    'level' => 20,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.34,
    'value_b' => 0.34,
    'value_c' => 0.312
};
get(1022021)-> #{
    'group' => 1022,
    'level' => 21,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.35,
    'value_b' => 0.35,
    'value_c' => 0.32
};
get(1022022)-> #{
    'group' => 1022,
    'level' => 22,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.36,
    'value_b' => 0.36,
    'value_c' => 0.328
};
get(1022023)-> #{
    'group' => 1022,
    'level' => 23,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.37,
    'value_b' => 0.37,
    'value_c' => 0.336
};
get(1022024)-> #{
    'group' => 1022,
    'level' => 24,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.38,
    'value_b' => 0.38,
    'value_c' => 0.344
};
get(1022025)-> #{
    'group' => 1022,
    'level' => 25,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.39,
    'value_b' => 0.39,
    'value_c' => 0.352
};
get(1022026)-> #{
    'group' => 1022,
    'level' => 26,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.4,
    'value_b' => 0.4,
    'value_c' => 0.36
};
get(1022027)-> #{
    'group' => 1022,
    'level' => 27,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.41,
    'value_b' => 0.41,
    'value_c' => 0.368
};
get(1022028)-> #{
    'group' => 1022,
    'level' => 28,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.42,
    'value_b' => 0.42,
    'value_c' => 0.376
};
get(1022029)-> #{
    'group' => 1022,
    'level' => 29,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.43,
    'value_b' => 0.43,
    'value_c' => 0.384
};
get(1022030)-> #{
    'group' => 1022,
    'level' => 30,
    'round' => 3,
    'buff_type' => 1,
    'type' => 1006,
    'value_a' => 0.44,
    'value_b' => 0.44,
    'value_c' => 0.392
};
get(1023001)-> #{
    'group' => 1023,
    'level' => 1,
    'round' => 1,
    'buff_type' => 1,
    'type' => 1005,
    'value_a' => 0.1
};
get(1024001)-> #{
    'group' => 1024,
    'level' => 1,
    'round' => 1,
    'buff_type' => 2,
    'type' => 1004
};
get(1025001)-> #{
    'group' => 1025,
    'level' => 1,
    'round' => 3,
    'buff_type' => 2,
    'type' => 1004
};
get(1026001)-> #{
    'group' => 1026,
    'level' => 1,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.02
};
get(1026002)-> #{
    'group' => 1026,
    'level' => 2,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.022
};
get(1026003)-> #{
    'group' => 1026,
    'level' => 3,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.024
};
get(1026004)-> #{
    'group' => 1026,
    'level' => 4,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.026
};
get(1026005)-> #{
    'group' => 1026,
    'level' => 5,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.028
};
get(1026006)-> #{
    'group' => 1026,
    'level' => 6,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.03
};
get(1026007)-> #{
    'group' => 1026,
    'level' => 7,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.032
};
get(1026008)-> #{
    'group' => 1026,
    'level' => 8,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.034
};
get(1026009)-> #{
    'group' => 1026,
    'level' => 9,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.036
};
get(1026010)-> #{
    'group' => 1026,
    'level' => 10,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.038
};
get(1026011)-> #{
    'group' => 1026,
    'level' => 11,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.04
};
get(1026012)-> #{
    'group' => 1026,
    'level' => 12,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.042
};
get(1026013)-> #{
    'group' => 1026,
    'level' => 13,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.044
};
get(1026014)-> #{
    'group' => 1026,
    'level' => 14,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.046
};
get(1026015)-> #{
    'group' => 1026,
    'level' => 15,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.048
};
get(1026016)-> #{
    'group' => 1026,
    'level' => 16,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.05
};
get(1026017)-> #{
    'group' => 1026,
    'level' => 17,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.052
};
get(1026018)-> #{
    'group' => 1026,
    'level' => 18,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.054
};
get(1026019)-> #{
    'group' => 1026,
    'level' => 19,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.056
};
get(1026020)-> #{
    'group' => 1026,
    'level' => 20,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.058
};
get(1026021)-> #{
    'group' => 1026,
    'level' => 21,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.06
};
get(1026022)-> #{
    'group' => 1026,
    'level' => 22,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.062
};
get(1026023)-> #{
    'group' => 1026,
    'level' => 23,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.064
};
get(1026024)-> #{
    'group' => 1026,
    'level' => 24,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.066
};
get(1026025)-> #{
    'group' => 1026,
    'level' => 25,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.068
};
get(1026026)-> #{
    'group' => 1026,
    'level' => 26,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.07
};
get(1026027)-> #{
    'group' => 1026,
    'level' => 27,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.072
};
get(1026028)-> #{
    'group' => 1026,
    'level' => 28,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.074
};
get(1026029)-> #{
    'group' => 1026,
    'level' => 29,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.076
};
get(1026030)-> #{
    'group' => 1026,
    'level' => 30,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.078
};
get(1027001)-> #{
    'group' => 1027,
    'level' => 1,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.02
};
get(1027002)-> #{
    'group' => 1027,
    'level' => 2,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.022
};
get(1027003)-> #{
    'group' => 1027,
    'level' => 3,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.024
};
get(1027004)-> #{
    'group' => 1027,
    'level' => 4,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.026
};
get(1027005)-> #{
    'group' => 1027,
    'level' => 5,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.028
};
get(1027006)-> #{
    'group' => 1027,
    'level' => 6,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.03
};
get(1027007)-> #{
    'group' => 1027,
    'level' => 7,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.032
};
get(1027008)-> #{
    'group' => 1027,
    'level' => 8,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.034
};
get(1027009)-> #{
    'group' => 1027,
    'level' => 9,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.036
};
get(1027010)-> #{
    'group' => 1027,
    'level' => 10,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.038
};
get(1027011)-> #{
    'group' => 1027,
    'level' => 11,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.04
};
get(1027012)-> #{
    'group' => 1027,
    'level' => 12,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.042
};
get(1027013)-> #{
    'group' => 1027,
    'level' => 13,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.044
};
get(1027014)-> #{
    'group' => 1027,
    'level' => 14,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.046
};
get(1027015)-> #{
    'group' => 1027,
    'level' => 15,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.048
};
get(1027016)-> #{
    'group' => 1027,
    'level' => 16,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.05
};
get(1027017)-> #{
    'group' => 1027,
    'level' => 17,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.052
};
get(1027018)-> #{
    'group' => 1027,
    'level' => 18,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.054
};
get(1027019)-> #{
    'group' => 1027,
    'level' => 19,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.056
};
get(1027020)-> #{
    'group' => 1027,
    'level' => 20,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.058
};
get(1027021)-> #{
    'group' => 1027,
    'level' => 21,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.06
};
get(1027022)-> #{
    'group' => 1027,
    'level' => 22,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.062
};
get(1027023)-> #{
    'group' => 1027,
    'level' => 23,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.064
};
get(1027024)-> #{
    'group' => 1027,
    'level' => 24,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.066
};
get(1027025)-> #{
    'group' => 1027,
    'level' => 25,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.068
};
get(1027026)-> #{
    'group' => 1027,
    'level' => 26,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.07
};
get(1027027)-> #{
    'group' => 1027,
    'level' => 27,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.072
};
get(1027028)-> #{
    'group' => 1027,
    'level' => 28,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.074
};
get(1027029)-> #{
    'group' => 1027,
    'level' => 29,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.076
};
get(1027030)-> #{
    'group' => 1027,
    'level' => 30,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.078
};
get(1028001)-> #{
    'group' => 1028,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 1011,
    'value_a' => 0.1
};
get(1029001)-> #{
    'group' => 1029,
    'level' => 1,
    'round' => 0,
    'buff_type' => 2,
    'type' => 2002,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.03
};
get(1030001)-> #{
    'group' => 1030,
    'level' => 1,
    'round' => 0,
    'buff_type' => 2,
    'type' => 2002,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.03
};
get(1031001)-> #{
    'group' => 1031,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.06
};
get(1031002)-> #{
    'group' => 1031,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.07
};
get(1031003)-> #{
    'group' => 1031,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.08
};
get(1031004)-> #{
    'group' => 1031,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.09
};
get(1031005)-> #{
    'group' => 1031,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.1
};
get(1031006)-> #{
    'group' => 1031,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.11
};
get(1031007)-> #{
    'group' => 1031,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.12
};
get(1031008)-> #{
    'group' => 1031,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.13
};
get(1031009)-> #{
    'group' => 1031,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.14
};
get(1031010)-> #{
    'group' => 1031,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.15
};
get(1031011)-> #{
    'group' => 1031,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.16
};
get(1031012)-> #{
    'group' => 1031,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.17
};
get(1031013)-> #{
    'group' => 1031,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.18
};
get(1031014)-> #{
    'group' => 1031,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.19
};
get(1031015)-> #{
    'group' => 1031,
    'level' => 15,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.2
};
get(1031016)-> #{
    'group' => 1031,
    'level' => 16,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.21
};
get(1031017)-> #{
    'group' => 1031,
    'level' => 17,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.22
};
get(1031018)-> #{
    'group' => 1031,
    'level' => 18,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.23
};
get(1031019)-> #{
    'group' => 1031,
    'level' => 19,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.24
};
get(1031020)-> #{
    'group' => 1031,
    'level' => 20,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.25
};
get(1031021)-> #{
    'group' => 1031,
    'level' => 21,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.26
};
get(1031022)-> #{
    'group' => 1031,
    'level' => 22,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.27
};
get(1031023)-> #{
    'group' => 1031,
    'level' => 23,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.28
};
get(1031024)-> #{
    'group' => 1031,
    'level' => 24,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.29
};
get(1031025)-> #{
    'group' => 1031,
    'level' => 25,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.3
};
get(1031026)-> #{
    'group' => 1031,
    'level' => 26,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.31
};
get(1031027)-> #{
    'group' => 1031,
    'level' => 27,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.32
};
get(1031028)-> #{
    'group' => 1031,
    'level' => 28,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.33
};
get(1031029)-> #{
    'group' => 1031,
    'level' => 29,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.34
};
get(1031030)-> #{
    'group' => 1031,
    'level' => 30,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1012,
    'value_a' => 0.35
};
get(1032001)-> #{
    'group' => 1032,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.06
};
get(1032002)-> #{
    'group' => 1032,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.07
};
get(1032003)-> #{
    'group' => 1032,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.08
};
get(1032004)-> #{
    'group' => 1032,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.09
};
get(1032005)-> #{
    'group' => 1032,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.1
};
get(1032006)-> #{
    'group' => 1032,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.11
};
get(1032007)-> #{
    'group' => 1032,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.12
};
get(1032008)-> #{
    'group' => 1032,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.13
};
get(1032009)-> #{
    'group' => 1032,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.14
};
get(1032010)-> #{
    'group' => 1032,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.15
};
get(1032011)-> #{
    'group' => 1032,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.16
};
get(1032012)-> #{
    'group' => 1032,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.17
};
get(1032013)-> #{
    'group' => 1032,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.18
};
get(1032014)-> #{
    'group' => 1032,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.19
};
get(1032015)-> #{
    'group' => 1032,
    'level' => 15,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.2
};
get(1032016)-> #{
    'group' => 1032,
    'level' => 16,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.21
};
get(1032017)-> #{
    'group' => 1032,
    'level' => 17,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.22
};
get(1032018)-> #{
    'group' => 1032,
    'level' => 18,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.23
};
get(1032019)-> #{
    'group' => 1032,
    'level' => 19,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.24
};
get(1032020)-> #{
    'group' => 1032,
    'level' => 20,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.25
};
get(1032021)-> #{
    'group' => 1032,
    'level' => 21,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.26
};
get(1032022)-> #{
    'group' => 1032,
    'level' => 22,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.27
};
get(1032023)-> #{
    'group' => 1032,
    'level' => 23,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.28
};
get(1032024)-> #{
    'group' => 1032,
    'level' => 24,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.29
};
get(1032025)-> #{
    'group' => 1032,
    'level' => 25,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.3
};
get(1032026)-> #{
    'group' => 1032,
    'level' => 26,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.31
};
get(1032027)-> #{
    'group' => 1032,
    'level' => 27,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.32
};
get(1032028)-> #{
    'group' => 1032,
    'level' => 28,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.33
};
get(1032029)-> #{
    'group' => 1032,
    'level' => 29,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.34
};
get(1032030)-> #{
    'group' => 1032,
    'level' => 30,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1011,
    'value_a' => 0.35
};
get(1033001)-> #{
    'group' => 1033,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.3,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033002)-> #{
    'group' => 1033,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.325,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033003)-> #{
    'group' => 1033,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.35,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033004)-> #{
    'group' => 1033,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.375,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033005)-> #{
    'group' => 1033,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.4,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033006)-> #{
    'group' => 1033,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.425,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033007)-> #{
    'group' => 1033,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.45,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033008)-> #{
    'group' => 1033,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.475,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033009)-> #{
    'group' => 1033,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.5,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033010)-> #{
    'group' => 1033,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.525,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033011)-> #{
    'group' => 1033,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.55,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033012)-> #{
    'group' => 1033,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.575,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033013)-> #{
    'group' => 1033,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.6,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033014)-> #{
    'group' => 1033,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.625,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033015)-> #{
    'group' => 1033,
    'level' => 15,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.65,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033016)-> #{
    'group' => 1033,
    'level' => 16,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.675,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033017)-> #{
    'group' => 1033,
    'level' => 17,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.7,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033018)-> #{
    'group' => 1033,
    'level' => 18,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.725,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033019)-> #{
    'group' => 1033,
    'level' => 19,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.75,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033020)-> #{
    'group' => 1033,
    'level' => 20,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.775,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033021)-> #{
    'group' => 1033,
    'level' => 21,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.8,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033022)-> #{
    'group' => 1033,
    'level' => 22,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.825,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033023)-> #{
    'group' => 1033,
    'level' => 23,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.85,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033024)-> #{
    'group' => 1033,
    'level' => 24,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.875000000000001,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033025)-> #{
    'group' => 1033,
    'level' => 25,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.900000000000001,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033026)-> #{
    'group' => 1033,
    'level' => 26,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.925000000000001,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033027)-> #{
    'group' => 1033,
    'level' => 27,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.950000000000001,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033028)-> #{
    'group' => 1033,
    'level' => 28,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.975000000000001,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033029)-> #{
    'group' => 1033,
    'level' => 29,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 1.0,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1033030)-> #{
    'group' => 1033,
    'level' => 30,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 1.025,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        }
    ]
};
get(1034001)-> #{
    'group' => 1034,
    'level' => 1,
    'round' => 0,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"qianjun_attack_rate"/utf8>>,
    'value_a' => 0.3
};
get(1035001)-> #{
    'group' => 1035,
    'level' => 1,
    'round' => 0,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"houjun_attack_rate"/utf8>>,
    'value_a' => 0.25
};
get(1036001)-> #{
    'group' => 1036,
    'level' => 1,
    'round' => 0,
    'buff_type' => 2,
    'type' => 1013
};
get(1037001)-> #{
    'group' => 1037,
    'level' => 1,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.08
};
get(1037002)-> #{
    'group' => 1037,
    'level' => 2,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.084
};
get(1037003)-> #{
    'group' => 1037,
    'level' => 3,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.088
};
get(1037004)-> #{
    'group' => 1037,
    'level' => 4,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.092
};
get(1037005)-> #{
    'group' => 1037,
    'level' => 5,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.096
};
get(1037006)-> #{
    'group' => 1037,
    'level' => 6,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.1
};
get(1037007)-> #{
    'group' => 1037,
    'level' => 7,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.104
};
get(1037008)-> #{
    'group' => 1037,
    'level' => 8,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.108
};
get(1037009)-> #{
    'group' => 1037,
    'level' => 9,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.112
};
get(1037010)-> #{
    'group' => 1037,
    'level' => 10,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.116
};
get(1037011)-> #{
    'group' => 1037,
    'level' => 11,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.12
};
get(1037012)-> #{
    'group' => 1037,
    'level' => 12,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.124
};
get(1037013)-> #{
    'group' => 1037,
    'level' => 13,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.128
};
get(1037014)-> #{
    'group' => 1037,
    'level' => 14,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.132
};
get(1037015)-> #{
    'group' => 1037,
    'level' => 15,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.136
};
get(1037016)-> #{
    'group' => 1037,
    'level' => 16,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.14
};
get(1037017)-> #{
    'group' => 1037,
    'level' => 17,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.144
};
get(1037018)-> #{
    'group' => 1037,
    'level' => 18,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.148
};
get(1037019)-> #{
    'group' => 1037,
    'level' => 19,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.152
};
get(1037020)-> #{
    'group' => 1037,
    'level' => 20,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.156
};
get(1037021)-> #{
    'group' => 1037,
    'level' => 21,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.16
};
get(1037022)-> #{
    'group' => 1037,
    'level' => 22,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.164
};
get(1037023)-> #{
    'group' => 1037,
    'level' => 23,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.168
};
get(1037024)-> #{
    'group' => 1037,
    'level' => 24,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.172
};
get(1037025)-> #{
    'group' => 1037,
    'level' => 25,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.176
};
get(1037026)-> #{
    'group' => 1037,
    'level' => 26,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.18
};
get(1037027)-> #{
    'group' => 1037,
    'level' => 27,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.184
};
get(1037028)-> #{
    'group' => 1037,
    'level' => 28,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.188
};
get(1037029)-> #{
    'group' => 1037,
    'level' => 29,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.192
};
get(1037030)-> #{
    'group' => 1037,
    'level' => 30,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.196
};
get(1038001)-> #{
    'group' => 1038,
    'level' => 1,
    'round' => 3,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"speed"/utf8>>,
    'value_a' => 30.0
};
get(1039001)-> #{
    'group' => 1039,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.7,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039002)-> #{
    'group' => 1039,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.725,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039003)-> #{
    'group' => 1039,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.75,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039004)-> #{
    'group' => 1039,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.775,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039005)-> #{
    'group' => 1039,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.8,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039006)-> #{
    'group' => 1039,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.825,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039007)-> #{
    'group' => 1039,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.85,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039008)-> #{
    'group' => 1039,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.875,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039009)-> #{
    'group' => 1039,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.9,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039010)-> #{
    'group' => 1039,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.925,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039011)-> #{
    'group' => 1039,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.95,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039012)-> #{
    'group' => 1039,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 0.975,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039013)-> #{
    'group' => 1039,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 1.0,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1039014)-> #{
    'group' => 1039,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1014,
    'value_a' => 1.025,
    'value_json' => [
        #{
            'value_str' => <<"hurt_inc_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"hurt_red_rate"/utf8>>,
            'value' => 0.3
        },
         #{
            'value_str' => <<"bingzhong_parry"/utf8>>,
            'value' => 0.4
        }
    ]
};
get(1040001)-> #{
    'group' => 1040,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.02
};
get(1040002)-> #{
    'group' => 1040,
    'level' => 2,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.021
};
get(1040003)-> #{
    'group' => 1040,
    'level' => 3,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.021
};
get(1040004)-> #{
    'group' => 1040,
    'level' => 4,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.022
};
get(1040005)-> #{
    'group' => 1040,
    'level' => 5,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.022
};
get(1040006)-> #{
    'group' => 1040,
    'level' => 6,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.023
};
get(1040007)-> #{
    'group' => 1040,
    'level' => 7,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.023
};
get(1040008)-> #{
    'group' => 1040,
    'level' => 8,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.024
};
get(1040009)-> #{
    'group' => 1040,
    'level' => 9,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.024
};
get(1040010)-> #{
    'group' => 1040,
    'level' => 10,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.025
};
get(1040011)-> #{
    'group' => 1040,
    'level' => 11,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.025
};
get(1040012)-> #{
    'group' => 1040,
    'level' => 12,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.026
};
get(1040013)-> #{
    'group' => 1040,
    'level' => 13,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.026
};
get(1040014)-> #{
    'group' => 1040,
    'level' => 14,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.027
};
get(1040015)-> #{
    'group' => 1040,
    'level' => 15,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.027
};
get(1040016)-> #{
    'group' => 1040,
    'level' => 16,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.028
};
get(1040017)-> #{
    'group' => 1040,
    'level' => 17,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.028
};
get(1040018)-> #{
    'group' => 1040,
    'level' => 18,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.029
};
get(1040019)-> #{
    'group' => 1040,
    'level' => 19,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.029
};
get(1040020)-> #{
    'group' => 1040,
    'level' => 20,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.03
};
get(1040021)-> #{
    'group' => 1040,
    'level' => 21,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.03
};
get(1040022)-> #{
    'group' => 1040,
    'level' => 22,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.031
};
get(1040023)-> #{
    'group' => 1040,
    'level' => 23,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.031
};
get(1040024)-> #{
    'group' => 1040,
    'level' => 24,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.032
};
get(1040025)-> #{
    'group' => 1040,
    'level' => 25,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.032
};
get(1040026)-> #{
    'group' => 1040,
    'level' => 26,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.033
};
get(1040027)-> #{
    'group' => 1040,
    'level' => 27,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.033
};
get(1040028)-> #{
    'group' => 1040,
    'level' => 28,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.034
};
get(1040029)-> #{
    'group' => 1040,
    'level' => 29,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.034
};
get(1040030)-> #{
    'group' => 1040,
    'level' => 30,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.035
};
get(1040031)-> #{
    'group' => 1040,
    'level' => 31,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.035
};
get(1040032)-> #{
    'group' => 1040,
    'level' => 32,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.036
};
get(1040033)-> #{
    'group' => 1040,
    'level' => 33,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.036
};
get(1040034)-> #{
    'group' => 1040,
    'level' => 34,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.037
};
get(1040035)-> #{
    'group' => 1040,
    'level' => 35,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.037
};
get(1040036)-> #{
    'group' => 1040,
    'level' => 36,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.038
};
get(1040037)-> #{
    'group' => 1040,
    'level' => 37,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.038
};
get(1040038)-> #{
    'group' => 1040,
    'level' => 38,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.039
};
get(1040039)-> #{
    'group' => 1040,
    'level' => 39,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.039
};
get(1040040)-> #{
    'group' => 1040,
    'level' => 40,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.04
};
get(1040041)-> #{
    'group' => 1040,
    'level' => 41,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.04
};
get(1040042)-> #{
    'group' => 1040,
    'level' => 42,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.041
};
get(1040043)-> #{
    'group' => 1040,
    'level' => 43,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.041
};
get(1040044)-> #{
    'group' => 1040,
    'level' => 44,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.042
};
get(1040045)-> #{
    'group' => 1040,
    'level' => 45,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.042
};
get(1040046)-> #{
    'group' => 1040,
    'level' => 46,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.043
};
get(1040047)-> #{
    'group' => 1040,
    'level' => 47,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.043
};
get(1040048)-> #{
    'group' => 1040,
    'level' => 48,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.044
};
get(1040049)-> #{
    'group' => 1040,
    'level' => 49,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.044
};
get(1040050)-> #{
    'group' => 1040,
    'level' => 50,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.045
};
get(1040051)-> #{
    'group' => 1040,
    'level' => 51,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.045
};
get(1040052)-> #{
    'group' => 1040,
    'level' => 52,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.046
};
get(1040053)-> #{
    'group' => 1040,
    'level' => 53,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.046
};
get(1040054)-> #{
    'group' => 1040,
    'level' => 54,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.047
};
get(1040055)-> #{
    'group' => 1040,
    'level' => 55,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.047
};
get(1040056)-> #{
    'group' => 1040,
    'level' => 56,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.048
};
get(1040057)-> #{
    'group' => 1040,
    'level' => 57,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.048
};
get(1040058)-> #{
    'group' => 1040,
    'level' => 58,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.049
};
get(1040059)-> #{
    'group' => 1040,
    'level' => 59,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.049
};
get(1040060)-> #{
    'group' => 1040,
    'level' => 60,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.05
};
get(1040061)-> #{
    'group' => 1040,
    'level' => 61,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.05
};
get(1040062)-> #{
    'group' => 1040,
    'level' => 62,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.051
};
get(1040063)-> #{
    'group' => 1040,
    'level' => 63,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.051
};
get(1040064)-> #{
    'group' => 1040,
    'level' => 64,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.052
};
get(1040065)-> #{
    'group' => 1040,
    'level' => 65,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.052
};
get(1040066)-> #{
    'group' => 1040,
    'level' => 66,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.053
};
get(1040067)-> #{
    'group' => 1040,
    'level' => 67,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.053
};
get(1040068)-> #{
    'group' => 1040,
    'level' => 68,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.054
};
get(1040069)-> #{
    'group' => 1040,
    'level' => 69,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.054
};
get(1040070)-> #{
    'group' => 1040,
    'level' => 70,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.055
};
get(1040071)-> #{
    'group' => 1040,
    'level' => 71,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.055
};
get(1040072)-> #{
    'group' => 1040,
    'level' => 72,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.056
};
get(1040073)-> #{
    'group' => 1040,
    'level' => 73,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.056
};
get(1040074)-> #{
    'group' => 1040,
    'level' => 74,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.057
};
get(1040075)-> #{
    'group' => 1040,
    'level' => 75,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.057
};
get(1040076)-> #{
    'group' => 1040,
    'level' => 76,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.058
};
get(1040077)-> #{
    'group' => 1040,
    'level' => 77,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.058
};
get(1040078)-> #{
    'group' => 1040,
    'level' => 78,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.0589999999999999
};
get(1040079)-> #{
    'group' => 1040,
    'level' => 79,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.0589999999999999
};
get(1040080)-> #{
    'group' => 1040,
    'level' => 80,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.06
};
get(1040081)-> #{
    'group' => 1040,
    'level' => 81,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.06
};
get(1040082)-> #{
    'group' => 1040,
    'level' => 82,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.061
};
get(1040083)-> #{
    'group' => 1040,
    'level' => 83,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.061
};
get(1040084)-> #{
    'group' => 1040,
    'level' => 84,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.062
};
get(1040085)-> #{
    'group' => 1040,
    'level' => 85,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.062
};
get(1040086)-> #{
    'group' => 1040,
    'level' => 86,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.063
};
get(1040087)-> #{
    'group' => 1040,
    'level' => 87,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.063
};
get(1040088)-> #{
    'group' => 1040,
    'level' => 88,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.064
};
get(1040089)-> #{
    'group' => 1040,
    'level' => 89,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.064
};
get(1040090)-> #{
    'group' => 1040,
    'level' => 90,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.065
};
get(1040091)-> #{
    'group' => 1040,
    'level' => 91,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.065
};
get(1040092)-> #{
    'group' => 1040,
    'level' => 92,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.066
};
get(1040093)-> #{
    'group' => 1040,
    'level' => 93,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.066
};
get(1040094)-> #{
    'group' => 1040,
    'level' => 94,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.067
};
get(1040095)-> #{
    'group' => 1040,
    'level' => 95,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.067
};
get(1040096)-> #{
    'group' => 1040,
    'level' => 96,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.068
};
get(1040097)-> #{
    'group' => 1040,
    'level' => 97,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.068
};
get(1040098)-> #{
    'group' => 1040,
    'level' => 98,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.069
};
get(1040099)-> #{
    'group' => 1040,
    'level' => 99,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.069
};
get(1040100)-> #{
    'group' => 1040,
    'level' => 100,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.07
};
get(1040101)-> #{
    'group' => 1040,
    'level' => 101,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.07
};
get(1040102)-> #{
    'group' => 1040,
    'level' => 102,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.071
};
get(1040103)-> #{
    'group' => 1040,
    'level' => 103,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.071
};
get(1040104)-> #{
    'group' => 1040,
    'level' => 104,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.072
};
get(1040105)-> #{
    'group' => 1040,
    'level' => 105,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.072
};
get(1040106)-> #{
    'group' => 1040,
    'level' => 106,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.073
};
get(1040107)-> #{
    'group' => 1040,
    'level' => 107,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.073
};
get(1040108)-> #{
    'group' => 1040,
    'level' => 108,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.074
};
get(1040109)-> #{
    'group' => 1040,
    'level' => 109,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.074
};
get(1040110)-> #{
    'group' => 1040,
    'level' => 110,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.075
};
get(1040111)-> #{
    'group' => 1040,
    'level' => 111,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.075
};
get(1040112)-> #{
    'group' => 1040,
    'level' => 112,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.076
};
get(1040113)-> #{
    'group' => 1040,
    'level' => 113,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.076
};
get(1040114)-> #{
    'group' => 1040,
    'level' => 114,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.077
};
get(1040115)-> #{
    'group' => 1040,
    'level' => 115,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.077
};
get(1040116)-> #{
    'group' => 1040,
    'level' => 116,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.078
};
get(1040117)-> #{
    'group' => 1040,
    'level' => 117,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.078
};
get(1040118)-> #{
    'group' => 1040,
    'level' => 118,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.079
};
get(1040119)-> #{
    'group' => 1040,
    'level' => 119,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.079
};
get(1040120)-> #{
    'group' => 1040,
    'level' => 120,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.08
};
get(1040121)-> #{
    'group' => 1040,
    'level' => 121,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.08
};
get(1040122)-> #{
    'group' => 1040,
    'level' => 122,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.081
};
get(1040123)-> #{
    'group' => 1040,
    'level' => 123,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.081
};
get(1040124)-> #{
    'group' => 1040,
    'level' => 124,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.082
};
get(1040125)-> #{
    'group' => 1040,
    'level' => 125,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.082
};
get(1040126)-> #{
    'group' => 1040,
    'level' => 126,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.083
};
get(1040127)-> #{
    'group' => 1040,
    'level' => 127,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.083
};
get(1040128)-> #{
    'group' => 1040,
    'level' => 128,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.084
};
get(1040129)-> #{
    'group' => 1040,
    'level' => 129,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.084
};
get(1040130)-> #{
    'group' => 1040,
    'level' => 130,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.085
};
get(1040131)-> #{
    'group' => 1040,
    'level' => 131,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.085
};
get(1040132)-> #{
    'group' => 1040,
    'level' => 132,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.086
};
get(1040133)-> #{
    'group' => 1040,
    'level' => 133,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.086
};
get(1040134)-> #{
    'group' => 1040,
    'level' => 134,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.087
};
get(1040135)-> #{
    'group' => 1040,
    'level' => 135,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.087
};
get(1040136)-> #{
    'group' => 1040,
    'level' => 136,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.088
};
get(1040137)-> #{
    'group' => 1040,
    'level' => 137,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.088
};
get(1040138)-> #{
    'group' => 1040,
    'level' => 138,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.089
};
get(1040139)-> #{
    'group' => 1040,
    'level' => 139,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.089
};
get(1040140)-> #{
    'group' => 1040,
    'level' => 140,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.09
};
get(1040141)-> #{
    'group' => 1040,
    'level' => 141,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.09
};
get(1040142)-> #{
    'group' => 1040,
    'level' => 142,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.091
};
get(1040143)-> #{
    'group' => 1040,
    'level' => 143,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.091
};
get(1040144)-> #{
    'group' => 1040,
    'level' => 144,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.092
};
get(1040145)-> #{
    'group' => 1040,
    'level' => 145,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.092
};
get(1040146)-> #{
    'group' => 1040,
    'level' => 146,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.093
};
get(1040147)-> #{
    'group' => 1040,
    'level' => 147,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.093
};
get(1040148)-> #{
    'group' => 1040,
    'level' => 148,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.094
};
get(1040149)-> #{
    'group' => 1040,
    'level' => 149,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.094
};
get(1040150)-> #{
    'group' => 1040,
    'level' => 150,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.095
};
get(1041001)-> #{
    'group' => 1041,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.02
};
get(1041002)-> #{
    'group' => 1041,
    'level' => 2,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.021
};
get(1041003)-> #{
    'group' => 1041,
    'level' => 3,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.021
};
get(1041004)-> #{
    'group' => 1041,
    'level' => 4,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.022
};
get(1041005)-> #{
    'group' => 1041,
    'level' => 5,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.022
};
get(1041006)-> #{
    'group' => 1041,
    'level' => 6,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.023
};
get(1041007)-> #{
    'group' => 1041,
    'level' => 7,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.023
};
get(1041008)-> #{
    'group' => 1041,
    'level' => 8,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.024
};
get(1041009)-> #{
    'group' => 1041,
    'level' => 9,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.024
};
get(1041010)-> #{
    'group' => 1041,
    'level' => 10,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.025
};
get(1041011)-> #{
    'group' => 1041,
    'level' => 11,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.025
};
get(1041012)-> #{
    'group' => 1041,
    'level' => 12,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.026
};
get(1041013)-> #{
    'group' => 1041,
    'level' => 13,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.026
};
get(1041014)-> #{
    'group' => 1041,
    'level' => 14,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.027
};
get(1041015)-> #{
    'group' => 1041,
    'level' => 15,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.027
};
get(1041016)-> #{
    'group' => 1041,
    'level' => 16,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.028
};
get(1041017)-> #{
    'group' => 1041,
    'level' => 17,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.028
};
get(1041018)-> #{
    'group' => 1041,
    'level' => 18,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.029
};
get(1041019)-> #{
    'group' => 1041,
    'level' => 19,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.029
};
get(1041020)-> #{
    'group' => 1041,
    'level' => 20,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.03
};
get(1041021)-> #{
    'group' => 1041,
    'level' => 21,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.03
};
get(1041022)-> #{
    'group' => 1041,
    'level' => 22,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.031
};
get(1041023)-> #{
    'group' => 1041,
    'level' => 23,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.031
};
get(1041024)-> #{
    'group' => 1041,
    'level' => 24,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.032
};
get(1041025)-> #{
    'group' => 1041,
    'level' => 25,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.032
};
get(1041026)-> #{
    'group' => 1041,
    'level' => 26,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.033
};
get(1041027)-> #{
    'group' => 1041,
    'level' => 27,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.033
};
get(1041028)-> #{
    'group' => 1041,
    'level' => 28,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.034
};
get(1041029)-> #{
    'group' => 1041,
    'level' => 29,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.034
};
get(1041030)-> #{
    'group' => 1041,
    'level' => 30,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.035
};
get(1041031)-> #{
    'group' => 1041,
    'level' => 31,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.035
};
get(1041032)-> #{
    'group' => 1041,
    'level' => 32,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.036
};
get(1041033)-> #{
    'group' => 1041,
    'level' => 33,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.036
};
get(1041034)-> #{
    'group' => 1041,
    'level' => 34,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.037
};
get(1041035)-> #{
    'group' => 1041,
    'level' => 35,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.037
};
get(1041036)-> #{
    'group' => 1041,
    'level' => 36,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.038
};
get(1041037)-> #{
    'group' => 1041,
    'level' => 37,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.038
};
get(1041038)-> #{
    'group' => 1041,
    'level' => 38,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.039
};
get(1041039)-> #{
    'group' => 1041,
    'level' => 39,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.039
};
get(1041040)-> #{
    'group' => 1041,
    'level' => 40,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.04
};
get(1041041)-> #{
    'group' => 1041,
    'level' => 41,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.04
};
get(1041042)-> #{
    'group' => 1041,
    'level' => 42,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.041
};
get(1041043)-> #{
    'group' => 1041,
    'level' => 43,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.041
};
get(1041044)-> #{
    'group' => 1041,
    'level' => 44,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.042
};
get(1041045)-> #{
    'group' => 1041,
    'level' => 45,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.042
};
get(1041046)-> #{
    'group' => 1041,
    'level' => 46,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.043
};
get(1041047)-> #{
    'group' => 1041,
    'level' => 47,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.043
};
get(1041048)-> #{
    'group' => 1041,
    'level' => 48,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.044
};
get(1041049)-> #{
    'group' => 1041,
    'level' => 49,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.044
};
get(1041050)-> #{
    'group' => 1041,
    'level' => 50,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.045
};
get(1041051)-> #{
    'group' => 1041,
    'level' => 51,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.045
};
get(1041052)-> #{
    'group' => 1041,
    'level' => 52,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.046
};
get(1041053)-> #{
    'group' => 1041,
    'level' => 53,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.046
};
get(1041054)-> #{
    'group' => 1041,
    'level' => 54,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.047
};
get(1041055)-> #{
    'group' => 1041,
    'level' => 55,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.047
};
get(1041056)-> #{
    'group' => 1041,
    'level' => 56,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.048
};
get(1041057)-> #{
    'group' => 1041,
    'level' => 57,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.048
};
get(1041058)-> #{
    'group' => 1041,
    'level' => 58,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.049
};
get(1041059)-> #{
    'group' => 1041,
    'level' => 59,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.049
};
get(1041060)-> #{
    'group' => 1041,
    'level' => 60,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.05
};
get(1041061)-> #{
    'group' => 1041,
    'level' => 61,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.05
};
get(1041062)-> #{
    'group' => 1041,
    'level' => 62,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.051
};
get(1041063)-> #{
    'group' => 1041,
    'level' => 63,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.051
};
get(1041064)-> #{
    'group' => 1041,
    'level' => 64,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.052
};
get(1041065)-> #{
    'group' => 1041,
    'level' => 65,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.052
};
get(1041066)-> #{
    'group' => 1041,
    'level' => 66,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.053
};
get(1041067)-> #{
    'group' => 1041,
    'level' => 67,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.053
};
get(1041068)-> #{
    'group' => 1041,
    'level' => 68,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.054
};
get(1041069)-> #{
    'group' => 1041,
    'level' => 69,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.054
};
get(1041070)-> #{
    'group' => 1041,
    'level' => 70,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.055
};
get(1041071)-> #{
    'group' => 1041,
    'level' => 71,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.055
};
get(1041072)-> #{
    'group' => 1041,
    'level' => 72,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.056
};
get(1041073)-> #{
    'group' => 1041,
    'level' => 73,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.056
};
get(1041074)-> #{
    'group' => 1041,
    'level' => 74,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.057
};
get(1041075)-> #{
    'group' => 1041,
    'level' => 75,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.057
};
get(1041076)-> #{
    'group' => 1041,
    'level' => 76,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.058
};
get(1041077)-> #{
    'group' => 1041,
    'level' => 77,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.058
};
get(1041078)-> #{
    'group' => 1041,
    'level' => 78,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.0589999999999999
};
get(1041079)-> #{
    'group' => 1041,
    'level' => 79,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.0589999999999999
};
get(1041080)-> #{
    'group' => 1041,
    'level' => 80,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.06
};
get(1041081)-> #{
    'group' => 1041,
    'level' => 81,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.06
};
get(1041082)-> #{
    'group' => 1041,
    'level' => 82,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.061
};
get(1041083)-> #{
    'group' => 1041,
    'level' => 83,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.061
};
get(1041084)-> #{
    'group' => 1041,
    'level' => 84,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.062
};
get(1041085)-> #{
    'group' => 1041,
    'level' => 85,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.062
};
get(1041086)-> #{
    'group' => 1041,
    'level' => 86,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.063
};
get(1041087)-> #{
    'group' => 1041,
    'level' => 87,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.063
};
get(1041088)-> #{
    'group' => 1041,
    'level' => 88,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.064
};
get(1041089)-> #{
    'group' => 1041,
    'level' => 89,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.064
};
get(1041090)-> #{
    'group' => 1041,
    'level' => 90,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.065
};
get(1041091)-> #{
    'group' => 1041,
    'level' => 91,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.065
};
get(1041092)-> #{
    'group' => 1041,
    'level' => 92,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.066
};
get(1041093)-> #{
    'group' => 1041,
    'level' => 93,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.066
};
get(1041094)-> #{
    'group' => 1041,
    'level' => 94,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.067
};
get(1041095)-> #{
    'group' => 1041,
    'level' => 95,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.067
};
get(1041096)-> #{
    'group' => 1041,
    'level' => 96,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.068
};
get(1041097)-> #{
    'group' => 1041,
    'level' => 97,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.068
};
get(1041098)-> #{
    'group' => 1041,
    'level' => 98,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.069
};
get(1041099)-> #{
    'group' => 1041,
    'level' => 99,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.069
};
get(1041100)-> #{
    'group' => 1041,
    'level' => 100,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.07
};
get(1041101)-> #{
    'group' => 1041,
    'level' => 101,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.07
};
get(1041102)-> #{
    'group' => 1041,
    'level' => 102,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.071
};
get(1041103)-> #{
    'group' => 1041,
    'level' => 103,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.071
};
get(1041104)-> #{
    'group' => 1041,
    'level' => 104,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.072
};
get(1041105)-> #{
    'group' => 1041,
    'level' => 105,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.072
};
get(1041106)-> #{
    'group' => 1041,
    'level' => 106,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.073
};
get(1041107)-> #{
    'group' => 1041,
    'level' => 107,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.073
};
get(1041108)-> #{
    'group' => 1041,
    'level' => 108,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.074
};
get(1041109)-> #{
    'group' => 1041,
    'level' => 109,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.074
};
get(1041110)-> #{
    'group' => 1041,
    'level' => 110,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.075
};
get(1041111)-> #{
    'group' => 1041,
    'level' => 111,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.075
};
get(1041112)-> #{
    'group' => 1041,
    'level' => 112,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.076
};
get(1041113)-> #{
    'group' => 1041,
    'level' => 113,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.076
};
get(1041114)-> #{
    'group' => 1041,
    'level' => 114,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.077
};
get(1041115)-> #{
    'group' => 1041,
    'level' => 115,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.077
};
get(1041116)-> #{
    'group' => 1041,
    'level' => 116,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.078
};
get(1041117)-> #{
    'group' => 1041,
    'level' => 117,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.078
};
get(1041118)-> #{
    'group' => 1041,
    'level' => 118,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.079
};
get(1041119)-> #{
    'group' => 1041,
    'level' => 119,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.079
};
get(1041120)-> #{
    'group' => 1041,
    'level' => 120,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.08
};
get(1041121)-> #{
    'group' => 1041,
    'level' => 121,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.08
};
get(1041122)-> #{
    'group' => 1041,
    'level' => 122,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.081
};
get(1041123)-> #{
    'group' => 1041,
    'level' => 123,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.081
};
get(1041124)-> #{
    'group' => 1041,
    'level' => 124,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.082
};
get(1041125)-> #{
    'group' => 1041,
    'level' => 125,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.082
};
get(1041126)-> #{
    'group' => 1041,
    'level' => 126,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.083
};
get(1041127)-> #{
    'group' => 1041,
    'level' => 127,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.083
};
get(1041128)-> #{
    'group' => 1041,
    'level' => 128,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.084
};
get(1041129)-> #{
    'group' => 1041,
    'level' => 129,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.084
};
get(1041130)-> #{
    'group' => 1041,
    'level' => 130,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.085
};
get(1041131)-> #{
    'group' => 1041,
    'level' => 131,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.085
};
get(1041132)-> #{
    'group' => 1041,
    'level' => 132,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.086
};
get(1041133)-> #{
    'group' => 1041,
    'level' => 133,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.086
};
get(1041134)-> #{
    'group' => 1041,
    'level' => 134,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.087
};
get(1041135)-> #{
    'group' => 1041,
    'level' => 135,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.087
};
get(1041136)-> #{
    'group' => 1041,
    'level' => 136,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.088
};
get(1041137)-> #{
    'group' => 1041,
    'level' => 137,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.088
};
get(1041138)-> #{
    'group' => 1041,
    'level' => 138,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.089
};
get(1041139)-> #{
    'group' => 1041,
    'level' => 139,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.089
};
get(1041140)-> #{
    'group' => 1041,
    'level' => 140,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.09
};
get(1041141)-> #{
    'group' => 1041,
    'level' => 141,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.09
};
get(1041142)-> #{
    'group' => 1041,
    'level' => 142,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.091
};
get(1041143)-> #{
    'group' => 1041,
    'level' => 143,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.091
};
get(1041144)-> #{
    'group' => 1041,
    'level' => 144,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.092
};
get(1041145)-> #{
    'group' => 1041,
    'level' => 145,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.092
};
get(1041146)-> #{
    'group' => 1041,
    'level' => 146,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.093
};
get(1041147)-> #{
    'group' => 1041,
    'level' => 147,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.093
};
get(1041148)-> #{
    'group' => 1041,
    'level' => 148,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.094
};
get(1041149)-> #{
    'group' => 1041,
    'level' => 149,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.094
};
get(1041150)-> #{
    'group' => 1041,
    'level' => 150,
    'round' => 2,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.095
};
get(1042001)-> #{
    'group' => 1042,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.07
};
get(1043001)-> #{
    'group' => 1043,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.07
};
get(1044001)-> #{
    'group' => 1044,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.06
};
get(1045001)-> #{
    'group' => 1045,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_crit"/utf8>>,
    'value_a' => 0.06
};
get(1046001)-> #{
    'group' => 1046,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.15
};
get(1047001)-> #{
    'group' => 1047,
    'level' => 1,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.05
};
get(1048001)-> #{
    'group' => 1048,
    'level' => 1,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.05
};
get(1049001)-> #{
    'group' => 1049,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1009,
    'value_a' => 0.5
};
get(1050001)-> #{
    'group' => 1050,
    'level' => 1,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.3
};
get(1050002)-> #{
    'group' => 1050,
    'level' => 2,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.32
};
get(1050003)-> #{
    'group' => 1050,
    'level' => 3,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.34
};
get(1050004)-> #{
    'group' => 1050,
    'level' => 4,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.36
};
get(1050005)-> #{
    'group' => 1050,
    'level' => 5,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.38
};
get(1050006)-> #{
    'group' => 1050,
    'level' => 6,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.4
};
get(1050007)-> #{
    'group' => 1050,
    'level' => 7,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.42
};
get(1050008)-> #{
    'group' => 1050,
    'level' => 8,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.44
};
get(1050009)-> #{
    'group' => 1050,
    'level' => 9,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.46
};
get(1050010)-> #{
    'group' => 1050,
    'level' => 10,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.48
};
get(1050011)-> #{
    'group' => 1050,
    'level' => 11,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(1050012)-> #{
    'group' => 1050,
    'level' => 12,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.52
};
get(1050013)-> #{
    'group' => 1050,
    'level' => 13,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.54
};
get(1050014)-> #{
    'group' => 1050,
    'level' => 14,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.56
};
get(1050015)-> #{
    'group' => 1050,
    'level' => 15,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.58
};
get(1050016)-> #{
    'group' => 1050,
    'level' => 16,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.6
};
get(1050017)-> #{
    'group' => 1050,
    'level' => 17,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.62
};
get(1050018)-> #{
    'group' => 1050,
    'level' => 18,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.64
};
get(1050019)-> #{
    'group' => 1050,
    'level' => 19,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.66
};
get(1050020)-> #{
    'group' => 1050,
    'level' => 20,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.68
};
get(1050021)-> #{
    'group' => 1050,
    'level' => 21,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.7
};
get(1050022)-> #{
    'group' => 1050,
    'level' => 22,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.72
};
get(1050023)-> #{
    'group' => 1050,
    'level' => 23,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.74
};
get(1050024)-> #{
    'group' => 1050,
    'level' => 24,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.76
};
get(1050025)-> #{
    'group' => 1050,
    'level' => 25,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.78
};
get(1050026)-> #{
    'group' => 1050,
    'level' => 26,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.79
};
get(1050027)-> #{
    'group' => 1050,
    'level' => 27,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.8
};
get(1050028)-> #{
    'group' => 1050,
    'level' => 28,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.81
};
get(1050029)-> #{
    'group' => 1050,
    'level' => 29,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.82
};
get(1050030)-> #{
    'group' => 1050,
    'level' => 30,
    'round' => 3,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"former_hurt_red_rate"/utf8>>,
    'value_a' => 0.83
};
get(1051001)-> #{
    'group' => 1051,
    'level' => 1,
    'round' => 4,
    'buff_type' => 2,
    'type' => 1001,
    'value_a' => 1.0
};
get(1052001)-> #{
    'group' => 1052,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 1005,
    'value_a' => 0.03
};
get(1053001)-> #{
    'group' => 1053,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_inc_rate"/utf8>>,
    'value_a' => 0.15
};
get(1054001)-> #{
    'group' => 1054,
    'level' => 1,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.3
};
get(1055002)-> #{
    'group' => 1055,
    'level' => 2,
    'round' => 2,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_parry"/utf8>>,
    'value_a' => 99.0
};
get(1056001)-> #{
    'group' => 1056,
    'level' => 1,
    'round' => 2,
    'buff_type' => 1,
    'type' => 1005,
    'value_a' => 0.2
};
get(1057001)-> #{
    'group' => 1057,
    'level' => 1,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hero_skill_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(1058001)-> #{
    'group' => 1058,
    'level' => 1,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.3
};
get(1058002)-> #{
    'group' => 1058,
    'level' => 2,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.32
};
get(1058003)-> #{
    'group' => 1058,
    'level' => 3,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.34
};
get(1058004)-> #{
    'group' => 1058,
    'level' => 4,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.36
};
get(1058005)-> #{
    'group' => 1058,
    'level' => 5,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.38
};
get(1058006)-> #{
    'group' => 1058,
    'level' => 6,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.4
};
get(1058007)-> #{
    'group' => 1058,
    'level' => 7,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.42
};
get(1058008)-> #{
    'group' => 1058,
    'level' => 8,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.44
};
get(1058009)-> #{
    'group' => 1058,
    'level' => 9,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.46
};
get(1058010)-> #{
    'group' => 1058,
    'level' => 10,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.48
};
get(1058011)-> #{
    'group' => 1058,
    'level' => 11,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(1058012)-> #{
    'group' => 1058,
    'level' => 12,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.52
};
get(1058013)-> #{
    'group' => 1058,
    'level' => 13,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.54
};
get(1058014)-> #{
    'group' => 1058,
    'level' => 14,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.56
};
get(1058015)-> #{
    'group' => 1058,
    'level' => 15,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.58
};
get(1058016)-> #{
    'group' => 1058,
    'level' => 16,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.6
};
get(1058017)-> #{
    'group' => 1058,
    'level' => 17,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.62
};
get(1058018)-> #{
    'group' => 1058,
    'level' => 18,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.64
};
get(1058019)-> #{
    'group' => 1058,
    'level' => 19,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.66
};
get(1058020)-> #{
    'group' => 1058,
    'level' => 20,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.68
};
get(1058021)-> #{
    'group' => 1058,
    'level' => 21,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.7
};
get(1058022)-> #{
    'group' => 1058,
    'level' => 22,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.72
};
get(1058023)-> #{
    'group' => 1058,
    'level' => 23,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.74
};
get(1058024)-> #{
    'group' => 1058,
    'level' => 24,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.76
};
get(1058025)-> #{
    'group' => 1058,
    'level' => 25,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.78
};
get(1058026)-> #{
    'group' => 1058,
    'level' => 26,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.79
};
get(1058027)-> #{
    'group' => 1058,
    'level' => 27,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.8
};
get(1058028)-> #{
    'group' => 1058,
    'level' => 28,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.81
};
get(1058029)-> #{
    'group' => 1058,
    'level' => 29,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.82
};
get(1058030)-> #{
    'group' => 1058,
    'level' => 30,
    'round' => 4,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"later_hurt_red_rate"/utf8>>,
    'value_a' => 0.83
};
get(1059001)-> #{
    'group' => 1059,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 1015
};
get(1060001)-> #{
    'group' => 1060,
    'level' => 1,
    'round' => 1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10100001)-> #{
    'group' => 10100,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10100002)-> #{
    'group' => 10100,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10100003)-> #{
    'group' => 10100,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10100004)-> #{
    'group' => 10100,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10100005)-> #{
    'group' => 10100,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10100006)-> #{
    'group' => 10100,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10100007)-> #{
    'group' => 10100,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10100008)-> #{
    'group' => 10100,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10100009)-> #{
    'group' => 10100,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10100010)-> #{
    'group' => 10100,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10100011)-> #{
    'group' => 10100,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10100012)-> #{
    'group' => 10100,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"infantry_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10101001)-> #{
    'group' => 10101,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10101002)-> #{
    'group' => 10101,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10101003)-> #{
    'group' => 10101,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10101004)-> #{
    'group' => 10101,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10101005)-> #{
    'group' => 10101,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10101006)-> #{
    'group' => 10101,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10101007)-> #{
    'group' => 10101,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10101008)-> #{
    'group' => 10101,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10101009)-> #{
    'group' => 10101,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10101010)-> #{
    'group' => 10101,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10101011)-> #{
    'group' => 10101,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10101012)-> #{
    'group' => 10101,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"cavalry_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10102001)-> #{
    'group' => 10102,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10102002)-> #{
    'group' => 10102,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10102003)-> #{
    'group' => 10102,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10102004)-> #{
    'group' => 10102,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10102005)-> #{
    'group' => 10102,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10102006)-> #{
    'group' => 10102,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10102007)-> #{
    'group' => 10102,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10102008)-> #{
    'group' => 10102,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10102009)-> #{
    'group' => 10102,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10102010)-> #{
    'group' => 10102,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10102011)-> #{
    'group' => 10102,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10102012)-> #{
    'group' => 10102,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"though_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10103001)-> #{
    'group' => 10103,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10103002)-> #{
    'group' => 10103,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10103003)-> #{
    'group' => 10103,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10103004)-> #{
    'group' => 10103,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10103005)-> #{
    'group' => 10103,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10103006)-> #{
    'group' => 10103,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10103007)-> #{
    'group' => 10103,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10103008)-> #{
    'group' => 10103,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10103009)-> #{
    'group' => 10103,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10103010)-> #{
    'group' => 10103,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10103011)-> #{
    'group' => 10103,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10103012)-> #{
    'group' => 10103,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"alchemist_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10104001)-> #{
    'group' => 10104,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10104002)-> #{
    'group' => 10104,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10104003)-> #{
    'group' => 10104,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10104004)-> #{
    'group' => 10104,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10104005)-> #{
    'group' => 10104,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10104006)-> #{
    'group' => 10104,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10104007)-> #{
    'group' => 10104,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10104008)-> #{
    'group' => 10104,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10104009)-> #{
    'group' => 10104,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10104010)-> #{
    'group' => 10104,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10104011)-> #{
    'group' => 10104,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10104012)-> #{
    'group' => 10104,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"general_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10105001)-> #{
    'group' => 10105,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10105002)-> #{
    'group' => 10105,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10105003)-> #{
    'group' => 10105,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10105004)-> #{
    'group' => 10105,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10105005)-> #{
    'group' => 10105,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10105006)-> #{
    'group' => 10105,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10105007)-> #{
    'group' => 10105,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10105008)-> #{
    'group' => 10105,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10105009)-> #{
    'group' => 10105,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10105010)-> #{
    'group' => 10105,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10105011)-> #{
    'group' => 10105,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10105012)-> #{
    'group' => 10105,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"civilian_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10106001)-> #{
    'group' => 10106,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10106002)-> #{
    'group' => 10106,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10106003)-> #{
    'group' => 10106,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10106004)-> #{
    'group' => 10106,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10106005)-> #{
    'group' => 10106,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10106006)-> #{
    'group' => 10106,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10106007)-> #{
    'group' => 10106,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10106008)-> #{
    'group' => 10106,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10106009)-> #{
    'group' => 10106,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10106010)-> #{
    'group' => 10106,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10106011)-> #{
    'group' => 10106,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10106012)-> #{
    'group' => 10106,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"generalist_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10107001)-> #{
    'group' => 10107,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10107002)-> #{
    'group' => 10107,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10107003)-> #{
    'group' => 10107,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 0.75
};
get(10107004)-> #{
    'group' => 10107,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 1.0
};
get(10107005)-> #{
    'group' => 10107,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 1.25
};
get(10107006)-> #{
    'group' => 10107,
    'level' => 6,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 1.5
};
get(10107007)-> #{
    'group' => 10107,
    'level' => 7,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 1.75
};
get(10107008)-> #{
    'group' => 10107,
    'level' => 8,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 2.0
};
get(10107009)-> #{
    'group' => 10107,
    'level' => 9,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 2.25
};
get(10107010)-> #{
    'group' => 10107,
    'level' => 10,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 2.5
};
get(10107011)-> #{
    'group' => 10107,
    'level' => 11,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 2.75
};
get(10107012)-> #{
    'group' => 10107,
    'level' => 12,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"woman_hurt_red_rate"/utf8>>,
    'value_a' => 3.0
};
get(10200001)-> #{
    'group' => 10200,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.2
};
get(10201001)-> #{
    'group' => 10201,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.2
};
get(10200002)-> #{
    'group' => 10200,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_attack_rate"/utf8>>,
    'value_a' => 0.4
};
get(10201002)-> #{
    'group' => 10201,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_defence_rate"/utf8>>,
    'value_a' => 0.4
};
get(10300001)-> #{
    'group' => 10300,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.25
};
get(10301001)-> #{
    'group' => 10301,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.25
};
get(10300002)-> #{
    'group' => 10300,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.5
};
get(10301002)-> #{
    'group' => 10301,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.5
};
get(10300003)-> #{
    'group' => 10300,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 0.75
};
get(10301003)-> #{
    'group' => 10301,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 0.75
};
get(10300004)-> #{
    'group' => 10300,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 1.0
};
get(10301004)-> #{
    'group' => 10301,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 1.0
};
get(10300005)-> #{
    'group' => 10300,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 1.25
};
get(10301005)-> #{
    'group' => 10301,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 1.25
};
get(10300006)-> #{
    'group' => 10300,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 1.5
};
get(10301006)-> #{
    'group' => 10301,
    'level' => 6,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 1.5
};
get(10300007)-> #{
    'group' => 10300,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 1.75
};
get(10301007)-> #{
    'group' => 10301,
    'level' => 7,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 1.75
};
get(10300008)-> #{
    'group' => 10300,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 2.0
};
get(10301008)-> #{
    'group' => 10301,
    'level' => 8,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 2.0
};
get(10300009)-> #{
    'group' => 10300,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 2.25
};
get(10301009)-> #{
    'group' => 10301,
    'level' => 9,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 2.25
};
get(10300010)-> #{
    'group' => 10300,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 2.5
};
get(10301010)-> #{
    'group' => 10301,
    'level' => 10,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 2.5
};
get(10300011)-> #{
    'group' => 10300,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 2.75
};
get(10301011)-> #{
    'group' => 10301,
    'level' => 11,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 2.75
};
get(10300012)-> #{
    'group' => 10300,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 3.0
};
get(10301012)-> #{
    'group' => 10301,
    'level' => 12,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 3.0
};
get(10300013)-> #{
    'group' => 10300,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 3.25
};
get(10301013)-> #{
    'group' => 10301,
    'level' => 13,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 3.25
};
get(10300014)-> #{
    'group' => 10300,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 3.5
};
get(10301014)-> #{
    'group' => 10301,
    'level' => 14,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 3.5
};
get(10300015)-> #{
    'group' => 10300,
    'level' => 15,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 3.75
};
get(10301015)-> #{
    'group' => 10301,
    'level' => 15,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 3.75
};
get(10300016)-> #{
    'group' => 10300,
    'level' => 16,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 4.0
};
get(10301016)-> #{
    'group' => 10301,
    'level' => 16,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 4.0
};
get(10300017)-> #{
    'group' => 10300,
    'level' => 17,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 4.25
};
get(10301017)-> #{
    'group' => 10301,
    'level' => 17,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 4.25
};
get(10300018)-> #{
    'group' => 10300,
    'level' => 18,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 4.5
};
get(10301018)-> #{
    'group' => 10301,
    'level' => 18,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 4.5
};
get(10300019)-> #{
    'group' => 10300,
    'level' => 19,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 4.75
};
get(10301019)-> #{
    'group' => 10301,
    'level' => 19,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 4.75
};
get(10300020)-> #{
    'group' => 10300,
    'level' => 20,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 5.0
};
get(10301020)-> #{
    'group' => 10301,
    'level' => 20,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 5.0
};
get(10300021)-> #{
    'group' => 10300,
    'level' => 21,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 5.25
};
get(10301021)-> #{
    'group' => 10301,
    'level' => 21,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 5.25
};
get(10300022)-> #{
    'group' => 10300,
    'level' => 22,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 5.5
};
get(10301022)-> #{
    'group' => 10301,
    'level' => 22,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 5.5
};
get(10300023)-> #{
    'group' => 10300,
    'level' => 23,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 5.75
};
get(10301023)-> #{
    'group' => 10301,
    'level' => 23,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 5.75
};
get(10300024)-> #{
    'group' => 10300,
    'level' => 24,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 6.0
};
get(10301024)-> #{
    'group' => 10301,
    'level' => 24,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 6.0
};
get(10300025)-> #{
    'group' => 10300,
    'level' => 25,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 6.25
};
get(10301025)-> #{
    'group' => 10301,
    'level' => 25,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 6.25
};
get(10300026)-> #{
    'group' => 10300,
    'level' => 26,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 6.5
};
get(10301026)-> #{
    'group' => 10301,
    'level' => 26,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 6.5
};
get(10300027)-> #{
    'group' => 10300,
    'level' => 27,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 6.75
};
get(10301027)-> #{
    'group' => 10301,
    'level' => 27,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 6.75
};
get(10300028)-> #{
    'group' => 10300,
    'level' => 28,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 7.0
};
get(10301028)-> #{
    'group' => 10301,
    'level' => 28,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 7.0
};
get(10300029)-> #{
    'group' => 10300,
    'level' => 29,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 7.25
};
get(10301029)-> #{
    'group' => 10301,
    'level' => 29,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 7.25
};
get(10300030)-> #{
    'group' => 10300,
    'level' => 30,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 7.5
};
get(10301030)-> #{
    'group' => 10301,
    'level' => 30,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 7.5
};
get(10300031)-> #{
    'group' => 10300,
    'level' => 31,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 7.75
};
get(10301031)-> #{
    'group' => 10301,
    'level' => 31,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 7.75
};
get(10300032)-> #{
    'group' => 10300,
    'level' => 32,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 8.0
};
get(10301032)-> #{
    'group' => 10301,
    'level' => 32,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 8.0
};
get(10300033)-> #{
    'group' => 10300,
    'level' => 33,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 8.25
};
get(10301033)-> #{
    'group' => 10301,
    'level' => 33,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 8.25
};
get(10300034)-> #{
    'group' => 10300,
    'level' => 34,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 8.5
};
get(10301034)-> #{
    'group' => 10301,
    'level' => 34,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 8.5
};
get(10300035)-> #{
    'group' => 10300,
    'level' => 35,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 8.75
};
get(10301035)-> #{
    'group' => 10301,
    'level' => 35,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 8.75
};
get(10300036)-> #{
    'group' => 10300,
    'level' => 36,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 9.0
};
get(10301036)-> #{
    'group' => 10301,
    'level' => 36,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 9.0
};
get(10300037)-> #{
    'group' => 10300,
    'level' => 37,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 9.25
};
get(10301037)-> #{
    'group' => 10301,
    'level' => 37,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 9.25
};
get(10300038)-> #{
    'group' => 10300,
    'level' => 38,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 9.5
};
get(10301038)-> #{
    'group' => 10301,
    'level' => 38,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 9.5
};
get(10300039)-> #{
    'group' => 10300,
    'level' => 39,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 9.75
};
get(10301039)-> #{
    'group' => 10301,
    'level' => 39,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 9.75
};
get(10300040)-> #{
    'group' => 10300,
    'level' => 40,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 10.0
};
get(10301040)-> #{
    'group' => 10301,
    'level' => 40,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 10.0
};
get(10300041)-> #{
    'group' => 10300,
    'level' => 41,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 10.25
};
get(10301041)-> #{
    'group' => 10301,
    'level' => 41,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 10.25
};
get(10300042)-> #{
    'group' => 10300,
    'level' => 42,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 10.5
};
get(10301042)-> #{
    'group' => 10301,
    'level' => 42,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 10.5
};
get(10300043)-> #{
    'group' => 10300,
    'level' => 43,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 10.75
};
get(10301043)-> #{
    'group' => 10301,
    'level' => 43,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 10.75
};
get(10300044)-> #{
    'group' => 10300,
    'level' => 44,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 11.0
};
get(10301044)-> #{
    'group' => 10301,
    'level' => 44,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 11.0
};
get(10300045)-> #{
    'group' => 10300,
    'level' => 45,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 11.25
};
get(10301045)-> #{
    'group' => 10301,
    'level' => 45,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 11.25
};
get(10300046)-> #{
    'group' => 10300,
    'level' => 46,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 11.5
};
get(10301046)-> #{
    'group' => 10301,
    'level' => 46,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 11.5
};
get(10300047)-> #{
    'group' => 10300,
    'level' => 47,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 11.75
};
get(10301047)-> #{
    'group' => 10301,
    'level' => 47,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 11.75
};
get(10300048)-> #{
    'group' => 10300,
    'level' => 48,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 12.0
};
get(10301048)-> #{
    'group' => 10301,
    'level' => 48,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 12.0
};
get(10300049)-> #{
    'group' => 10300,
    'level' => 49,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 12.25
};
get(10301049)-> #{
    'group' => 10301,
    'level' => 49,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 12.25
};
get(10300050)-> #{
    'group' => 10300,
    'level' => 50,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 12.5
};
get(10301050)-> #{
    'group' => 10301,
    'level' => 50,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 12.5
};
get(10300051)-> #{
    'group' => 10300,
    'level' => 51,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 12.75
};
get(10301051)-> #{
    'group' => 10301,
    'level' => 51,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 12.75
};
get(10300052)-> #{
    'group' => 10300,
    'level' => 52,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 13.0
};
get(10301052)-> #{
    'group' => 10301,
    'level' => 52,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 13.0
};
get(10300053)-> #{
    'group' => 10300,
    'level' => 53,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 13.25
};
get(10301053)-> #{
    'group' => 10301,
    'level' => 53,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 13.25
};
get(10300054)-> #{
    'group' => 10300,
    'level' => 54,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 13.5
};
get(10301054)-> #{
    'group' => 10301,
    'level' => 54,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 13.5
};
get(10300055)-> #{
    'group' => 10300,
    'level' => 55,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 13.75
};
get(10301055)-> #{
    'group' => 10301,
    'level' => 55,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 13.75
};
get(10300056)-> #{
    'group' => 10300,
    'level' => 56,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 14.0
};
get(10301056)-> #{
    'group' => 10301,
    'level' => 56,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 14.0
};
get(10300057)-> #{
    'group' => 10300,
    'level' => 57,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 14.25
};
get(10301057)-> #{
    'group' => 10301,
    'level' => 57,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 14.25
};
get(10300058)-> #{
    'group' => 10300,
    'level' => 58,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 14.5
};
get(10301058)-> #{
    'group' => 10301,
    'level' => 58,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 14.5
};
get(10300059)-> #{
    'group' => 10300,
    'level' => 59,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 14.75
};
get(10301059)-> #{
    'group' => 10301,
    'level' => 59,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 14.75
};
get(10300060)-> #{
    'group' => 10300,
    'level' => 60,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 15.0
};
get(10301060)-> #{
    'group' => 10301,
    'level' => 60,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 15.0
};
get(10300061)-> #{
    'group' => 10300,
    'level' => 61,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 15.25
};
get(10301061)-> #{
    'group' => 10301,
    'level' => 61,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 15.25
};
get(10300062)-> #{
    'group' => 10300,
    'level' => 62,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 15.5
};
get(10301062)-> #{
    'group' => 10301,
    'level' => 62,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 15.5
};
get(10300063)-> #{
    'group' => 10300,
    'level' => 63,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 15.75
};
get(10301063)-> #{
    'group' => 10301,
    'level' => 63,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 15.75
};
get(10300064)-> #{
    'group' => 10300,
    'level' => 64,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 16.0
};
get(10301064)-> #{
    'group' => 10301,
    'level' => 64,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 16.0
};
get(10300065)-> #{
    'group' => 10300,
    'level' => 65,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 16.25
};
get(10301065)-> #{
    'group' => 10301,
    'level' => 65,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 16.25
};
get(10300066)-> #{
    'group' => 10300,
    'level' => 66,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 16.5
};
get(10301066)-> #{
    'group' => 10301,
    'level' => 66,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 16.5
};
get(10300067)-> #{
    'group' => 10300,
    'level' => 67,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 16.75
};
get(10301067)-> #{
    'group' => 10301,
    'level' => 67,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 16.75
};
get(10300068)-> #{
    'group' => 10300,
    'level' => 68,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 17.0
};
get(10301068)-> #{
    'group' => 10301,
    'level' => 68,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 17.0
};
get(10300069)-> #{
    'group' => 10300,
    'level' => 69,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 17.25
};
get(10301069)-> #{
    'group' => 10301,
    'level' => 69,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 17.25
};
get(10300070)-> #{
    'group' => 10300,
    'level' => 70,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 17.5
};
get(10301070)-> #{
    'group' => 10301,
    'level' => 70,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 17.5
};
get(10300071)-> #{
    'group' => 10300,
    'level' => 71,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 17.75
};
get(10301071)-> #{
    'group' => 10301,
    'level' => 71,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 17.75
};
get(10300072)-> #{
    'group' => 10300,
    'level' => 72,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 18.0
};
get(10301072)-> #{
    'group' => 10301,
    'level' => 72,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 18.0
};
get(10300073)-> #{
    'group' => 10300,
    'level' => 73,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 18.25
};
get(10301073)-> #{
    'group' => 10301,
    'level' => 73,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 18.25
};
get(10300074)-> #{
    'group' => 10300,
    'level' => 74,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 18.5
};
get(10301074)-> #{
    'group' => 10301,
    'level' => 74,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 18.5
};
get(10300075)-> #{
    'group' => 10300,
    'level' => 75,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 18.75
};
get(10301075)-> #{
    'group' => 10301,
    'level' => 75,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 18.75
};
get(10300076)-> #{
    'group' => 10300,
    'level' => 76,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 19.0
};
get(10301076)-> #{
    'group' => 10301,
    'level' => 76,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 19.0
};
get(10300077)-> #{
    'group' => 10300,
    'level' => 77,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 19.25
};
get(10301077)-> #{
    'group' => 10301,
    'level' => 77,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 19.25
};
get(10300078)-> #{
    'group' => 10300,
    'level' => 78,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 19.5
};
get(10301078)-> #{
    'group' => 10301,
    'level' => 78,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 19.5
};
get(10300079)-> #{
    'group' => 10300,
    'level' => 79,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 19.75
};
get(10301079)-> #{
    'group' => 10301,
    'level' => 79,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 19.75
};
get(10300080)-> #{
    'group' => 10300,
    'level' => 80,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 20.0
};
get(10301080)-> #{
    'group' => 10301,
    'level' => 80,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 20.0
};
get(10300081)-> #{
    'group' => 10300,
    'level' => 81,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 20.25
};
get(10301081)-> #{
    'group' => 10301,
    'level' => 81,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 20.25
};
get(10300082)-> #{
    'group' => 10300,
    'level' => 82,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 20.5
};
get(10301082)-> #{
    'group' => 10301,
    'level' => 82,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 20.5
};
get(10300083)-> #{
    'group' => 10300,
    'level' => 83,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 20.75
};
get(10301083)-> #{
    'group' => 10301,
    'level' => 83,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 20.75
};
get(10300084)-> #{
    'group' => 10300,
    'level' => 84,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 21.0
};
get(10301084)-> #{
    'group' => 10301,
    'level' => 84,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 21.0
};
get(10300085)-> #{
    'group' => 10300,
    'level' => 85,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 21.25
};
get(10301085)-> #{
    'group' => 10301,
    'level' => 85,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 21.25
};
get(10300086)-> #{
    'group' => 10300,
    'level' => 86,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 21.5
};
get(10301086)-> #{
    'group' => 10301,
    'level' => 86,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 21.5
};
get(10300087)-> #{
    'group' => 10300,
    'level' => 87,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 21.75
};
get(10301087)-> #{
    'group' => 10301,
    'level' => 87,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 21.75
};
get(10300088)-> #{
    'group' => 10300,
    'level' => 88,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 22.0
};
get(10301088)-> #{
    'group' => 10301,
    'level' => 88,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 22.0
};
get(10300089)-> #{
    'group' => 10300,
    'level' => 89,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 22.25
};
get(10301089)-> #{
    'group' => 10301,
    'level' => 89,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 22.25
};
get(10300090)-> #{
    'group' => 10300,
    'level' => 90,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 22.5
};
get(10301090)-> #{
    'group' => 10301,
    'level' => 90,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 22.5
};
get(10300091)-> #{
    'group' => 10300,
    'level' => 91,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 22.75
};
get(10301091)-> #{
    'group' => 10301,
    'level' => 91,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 22.75
};
get(10300092)-> #{
    'group' => 10300,
    'level' => 92,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 23.0
};
get(10301092)-> #{
    'group' => 10301,
    'level' => 92,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 23.0
};
get(10300093)-> #{
    'group' => 10300,
    'level' => 93,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 23.25
};
get(10301093)-> #{
    'group' => 10301,
    'level' => 93,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 23.25
};
get(10300094)-> #{
    'group' => 10300,
    'level' => 94,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 23.5
};
get(10301094)-> #{
    'group' => 10301,
    'level' => 94,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 23.5
};
get(10300095)-> #{
    'group' => 10300,
    'level' => 95,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 23.75
};
get(10301095)-> #{
    'group' => 10301,
    'level' => 95,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 23.75
};
get(10300096)-> #{
    'group' => 10300,
    'level' => 96,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 24.0
};
get(10301096)-> #{
    'group' => 10301,
    'level' => 96,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 24.0
};
get(10300097)-> #{
    'group' => 10300,
    'level' => 97,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 24.25
};
get(10301097)-> #{
    'group' => 10301,
    'level' => 97,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 24.25
};
get(10300098)-> #{
    'group' => 10300,
    'level' => 98,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 24.5
};
get(10301098)-> #{
    'group' => 10301,
    'level' => 98,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 24.5
};
get(10300099)-> #{
    'group' => 10300,
    'level' => 99,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 24.75
};
get(10301099)-> #{
    'group' => 10301,
    'level' => 99,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 24.75
};
get(10300100)-> #{
    'group' => 10300,
    'level' => 100,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"attack_rate"/utf8>>,
    'value_a' => 25.0
};
get(10301100)-> #{
    'group' => 10301,
    'level' => 100,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"defence_rate"/utf8>>,
    'value_a' => 25.0
};
get(10400001)-> #{
    'group' => 10400,
    'level' => 1,
    'round' => 0,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_inc_rate"/utf8>>,
    'value_a' => 0.25
};
get(10400002)-> #{
    'group' => 10400,
    'level' => 2,
    'round' => 0,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"hurt_red_rate"/utf8>>,
    'value_a' => 0.25
};
get(10400003)-> #{
    'group' => 10400,
    'level' => 3,
    'round' => 0,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"march_speed_multi"/utf8>>,
    'value_a' => 0.25
};
get(10500001)-> #{
    'group' => 10500,
    'level' => 1,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_inc_rate"/utf8>>,
    'value_a' => 0.2
};
get(10501001)-> #{
    'group' => 10501,
    'level' => 1,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_red_rate"/utf8>>,
    'value_a' => 0.2
};
get(10500002)-> #{
    'group' => 10500,
    'level' => 2,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_inc_rate"/utf8>>,
    'value_a' => 0.3
};
get(10501002)-> #{
    'group' => 10501,
    'level' => 2,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_red_rate"/utf8>>,
    'value_a' => 0.3
};
get(10500003)-> #{
    'group' => 10500,
    'level' => 3,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_inc_rate"/utf8>>,
    'value_a' => 0.4
};
get(10501003)-> #{
    'group' => 10501,
    'level' => 3,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_red_rate"/utf8>>,
    'value_a' => 0.4
};
get(10500004)-> #{
    'group' => 10500,
    'level' => 4,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_inc_rate"/utf8>>,
    'value_a' => 0.5
};
get(10501004)-> #{
    'group' => 10501,
    'level' => 4,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_red_rate"/utf8>>,
    'value_a' => 0.5
};
get(10500005)-> #{
    'group' => 10500,
    'level' => 5,
    'round' => -1,
    'buff_type' => 1,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_inc_rate"/utf8>>,
    'value_a' => 0.6
};
get(10501005)-> #{
    'group' => 10501,
    'level' => 5,
    'round' => -1,
    'buff_type' => 2,
    'type' => 2001,
    'value_str' => <<"bingzhong_hurt_red_rate"/utf8>>,
    'value_a' => 0.6
};

get(_N) -> false.
get_list() ->
	[1001001,1002001,1003001,1004001,1005001,1006001,1007001,1008001,1009001,1010001,1011001,1012001,1013001,1013002,1013003,1013004,1013005,1013006,1013007,1013008,1013009,1013010,1013011,1013012,1013013,1013014,1013015,1013016,1013017,1013018,1013019,1013020,1013021,1013022,1013023,1013024,1013025,1013026,1013027,1013028,1013029,1013030,1014001,1014002,1014003,1014004,1014005,1014006,1014007,1014008,1014009,1014010,1014011,1014012,1014013,1014014,1014015,1014016,1014017,1014018,1014019,1014020,1014021,1014022,1014023,1014024,1014025,1014026,1014027,1014028,1014029,1014030,1015001,1015002,1015003,1015004,1015005,1015006,1015007,1015008,1015009,1015010,1015011,1015012,1015013,1015014,1015015,1015016,1015017,1015018,1015019,1015020,1015021,1015022,1015023,1015024,1015025,1015026,1015027,1015028,1015029,1015030,1016001,1017001,1017002,1017003,1017004,1017005,1017006,1017007,1017008,1017009,1017010,1017011,1017012,1017013,1017014,1017015,1017016,1017017,1017018,1017019,1017020,1017021,1017022,1017023,1017024,1017025,1017026,1017027,1017028,1017029,1017030,1018001,1019001,1019002,1019003,1019004,1019005,1019006,1019007,1019008,1019009,1019010,1019011,1019012,1019013,1019014,1019015,1019016,1019017,1019018,1019019,1019020,1019021,1019022,1019023,1019024,1019025,1019026,1019027,1019028,1019029,1019030,1020001,1020002,1020003,1020004,1020005,1020006,1020007,1020008,1020009,1020010,1020011,1020012,1020013,1020014,1020015,1020016,1020017,1020018,1020019,1020020,1020021,1020022,1020023,1020024,1020025,1020026,1020027,1020028,1020029,1020030,1021001,1022001,1022002,1022003,1022004,1022005,1022006,1022007,1022008,1022009,1022010,1022011,1022012,1022013,1022014,1022015,1022016,1022017,1022018,1022019,1022020,1022021,1022022,1022023,1022024,1022025,1022026,1022027,1022028,1022029,1022030,1023001,1024001,1025001,1026001,1026002,1026003,1026004,1026005,1026006,1026007,1026008,1026009,1026010,1026011,1026012,1026013,1026014,1026015,1026016,1026017,1026018,1026019,1026020,1026021,1026022,1026023,1026024,1026025,1026026,1026027,1026028,1026029,1026030,1027001,1027002,1027003,1027004,1027005,1027006,1027007,1027008,1027009,1027010,1027011,1027012,1027013,1027014,1027015,1027016,1027017,1027018,1027019,1027020,1027021,1027022,1027023,1027024,1027025,1027026,1027027,1027028,1027029,1027030,1028001,1029001,1030001,1031001,1031002,1031003,1031004,1031005,1031006,1031007,1031008,1031009,1031010,1031011,1031012,1031013,1031014,1031015,1031016,1031017,1031018,1031019,1031020,1031021,1031022,1031023,1031024,1031025,1031026,1031027,1031028,1031029,1031030,1032001,1032002,1032003,1032004,1032005,1032006,1032007,1032008,1032009,1032010,1032011,1032012,1032013,1032014,1032015,1032016,1032017,1032018,1032019,1032020,1032021,1032022,1032023,1032024,1032025,1032026,1032027,1032028,1032029,1032030,1033001,1033002,1033003,1033004,1033005,1033006,1033007,1033008,1033009,1033010,1033011,1033012,1033013,1033014,1033015,1033016,1033017,1033018,1033019,1033020,1033021,1033022,1033023,1033024,1033025,1033026,1033027,1033028,1033029,1033030,1034001,1035001,1036001,1037001,1037002,1037003,1037004,1037005,1037006,1037007,1037008,1037009,1037010,1037011,1037012,1037013,1037014,1037015,1037016,1037017,1037018,1037019,1037020,1037021,1037022,1037023,1037024,1037025,1037026,1037027,1037028,1037029,1037030,1038001,1039001,1039002,1039003,1039004,1039005,1039006,1039007,1039008,1039009,1039010,1039011,1039012,1039013,1039014,1040001,1040002,1040003,1040004,1040005,1040006,1040007,1040008,1040009,1040010,1040011,1040012,1040013,1040014,1040015,1040016,1040017,1040018,1040019,1040020,1040021,1040022,1040023,1040024,1040025,1040026,1040027,1040028,1040029,1040030,1040031,1040032,1040033,1040034,1040035,1040036,1040037,1040038,1040039,1040040,1040041,1040042,1040043,1040044,1040045,1040046,1040047,1040048,1040049,1040050,1040051,1040052,1040053,1040054,1040055,1040056,1040057,1040058,1040059,1040060,1040061,1040062,1040063,1040064,1040065,1040066,1040067,1040068,1040069,1040070,1040071,1040072,1040073,1040074,1040075,1040076,1040077,1040078,1040079,1040080,1040081,1040082,1040083,1040084,1040085,1040086,1040087,1040088,1040089,1040090,1040091,1040092,1040093,1040094,1040095,1040096,1040097,1040098,1040099,1040100,1040101,1040102,1040103,1040104,1040105,1040106,1040107,1040108,1040109,1040110,1040111,1040112,1040113,1040114,1040115,1040116,1040117,1040118,1040119,1040120,1040121,1040122,1040123,1040124,1040125,1040126,1040127,1040128,1040129,1040130,1040131,1040132,1040133,1040134,1040135,1040136,1040137,1040138,1040139,1040140,1040141,1040142,1040143,1040144,1040145,1040146,1040147,1040148,1040149,1040150,1041001,1041002,1041003,1041004,1041005,1041006,1041007,1041008,1041009,1041010,1041011,1041012,1041013,1041014,1041015,1041016,1041017,1041018,1041019,1041020,1041021,1041022,1041023,1041024,1041025,1041026,1041027,1041028,1041029,1041030,1041031,1041032,1041033,1041034,1041035,1041036,1041037,1041038,1041039,1041040,1041041,1041042,1041043,1041044,1041045,1041046,1041047,1041048,1041049,1041050,1041051,1041052,1041053,1041054,1041055,1041056,1041057,1041058,1041059,1041060,1041061,1041062,1041063,1041064,1041065,1041066,1041067,1041068,1041069,1041070,1041071,1041072,1041073,1041074,1041075,1041076,1041077,1041078,1041079,1041080,1041081,1041082,1041083,1041084,1041085,1041086,1041087,1041088,1041089,1041090,1041091,1041092,1041093,1041094,1041095,1041096,1041097,1041098,1041099,1041100,1041101,1041102,1041103,1041104,1041105,1041106,1041107,1041108,1041109,1041110,1041111,1041112,1041113,1041114,1041115,1041116,1041117,1041118,1041119,1041120,1041121,1041122,1041123,1041124,1041125,1041126,1041127,1041128,1041129,1041130,1041131,1041132,1041133,1041134,1041135,1041136,1041137,1041138,1041139,1041140,1041141,1041142,1041143,1041144,1041145,1041146,1041147,1041148,1041149,1041150,1042001,1043001,1044001,1045001,1046001,1047001,1048001,1049001,1050001,1050002,1050003,1050004,1050005,1050006,1050007,1050008,1050009,1050010,1050011,1050012,1050013,1050014,1050015,1050016,1050017,1050018,1050019,1050020,1050021,1050022,1050023,1050024,1050025,1050026,1050027,1050028,1050029,1050030,1051001,1052001,1053001,1054001,1055002,1056001,1057001,1058001,1058002,1058003,1058004,1058005,1058006,1058007,1058008,1058009,1058010,1058011,1058012,1058013,1058014,1058015,1058016,1058017,1058018,1058019,1058020,1058021,1058022,1058023,1058024,1058025,1058026,1058027,1058028,1058029,1058030,1059001,1060001,10100001,10100002,10100003,10100004,10100005,10100006,10100007,10100008,10100009,10100010,10100011,10100012,10101001,10101002,10101003,10101004,10101005,10101006,10101007,10101008,10101009,10101010,10101011,10101012,10102001,10102002,10102003,10102004,10102005,10102006,10102007,10102008,10102009,10102010,10102011,10102012,10103001,10103002,10103003,10103004,10103005,10103006,10103007,10103008,10103009,10103010,10103011,10103012,10104001,10104002,10104003,10104004,10104005,10104006,10104007,10104008,10104009,10104010,10104011,10104012,10105001,10105002,10105003,10105004,10105005,10105006,10105007,10105008,10105009,10105010,10105011,10105012,10106001,10106002,10106003,10106004,10106005,10106006,10106007,10106008,10106009,10106010,10106011,10106012,10107001,10107002,10107003,10107004,10107005,10107006,10107007,10107008,10107009,10107010,10107011,10107012,10200001,10201001,10200002,10201002,10300001,10301001,10300002,10301002,10300003,10301003,10300004,10301004,10300005,10301005,10300006,10301006,10300007,10301007,10300008,10301008,10300009,10301009,10300010,10301010,10300011,10301011,10300012,10301012,10300013,10301013,10300014,10301014,10300015,10301015,10300016,10301016,10300017,10301017,10300018,10301018,10300019,10301019,10300020,10301020,10300021,10301021,10300022,10301022,10300023,10301023,10300024,10301024,10300025,10301025,10300026,10301026,10300027,10301027,10300028,10301028,10300029,10301029,10300030,10301030,10300031,10301031,10300032,10301032,10300033,10301033,10300034,10301034,10300035,10301035,10300036,10301036,10300037,10301037,10300038,10301038,10300039,10301039,10300040,10301040,10300041,10301041,10300042,10301042,10300043,10301043,10300044,10301044,10300045,10301045,10300046,10301046,10300047,10301047,10300048,10301048,10300049,10301049,10300050,10301050,10300051,10301051,10300052,10301052,10300053,10301053,10300054,10301054,10300055,10301055,10300056,10301056,10300057,10301057,10300058,10301058,10300059,10301059,10300060,10301060,10300061,10301061,10300062,10301062,10300063,10301063,10300064,10301064,10300065,10301065,10300066,10301066,10300067,10301067,10300068,10301068,10300069,10301069,10300070,10301070,10300071,10301071,10300072,10301072,10300073,10301073,10300074,10301074,10300075,10301075,10300076,10301076,10300077,10301077,10300078,10301078,10300079,10301079,10300080,10301080,10300081,10301081,10300082,10301082,10300083,10301083,10300084,10301084,10300085,10301085,10300086,10301086,10300087,10301087,10300088,10301088,10300089,10301089,10300090,10301090,10300091,10301091,10300092,10301092,10300093,10301093,10300094,10301094,10300095,10301095,10300096,10301096,10300097,10301097,10300098,10301098,10300099,10301099,10300100,10301100,10400001,10400002,10400003,10500001,10501001,10500002,10501002,10500003,10501003,10500004,10501004,10500005,10501005].
