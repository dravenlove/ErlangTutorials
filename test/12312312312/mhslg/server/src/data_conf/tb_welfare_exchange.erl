%%--- coding:utf-8 ---
-module(tb_welfare_exchange).
-export([get/1,get_list/0]).
get(1006)-> #{
    'type' => 1,
    'level' => 6,
    'trigger_val' => 45000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1061,
             25
        ],
         [
            1062,
             25
        ],
         [
            1063,
             25
        ],
         [
            1064,
             25
        ]
    ]
};
get(2006)-> #{
    'type' => 2,
    'level' => 6,
    'trigger_val' => 90000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1071,
             25
        ],
         [
            1072,
             25
        ],
         [
            1073,
             25
        ],
         [
            1074,
             25
        ]
    ]
};
get(3006)-> #{
    'type' => 3,
    'level' => 6,
    'trigger_val' => 90000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1081,
             25
        ],
         [
            1082,
             25
        ],
         [
            1083,
             25
        ],
         [
            1084,
             25
        ]
    ]
};
get(4006)-> #{
    'type' => 4,
    'level' => 6,
    'trigger_val' => 90000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1091,
             25
        ],
         [
            1092,
             25
        ],
         [
            1093,
             25
        ],
         [
            1094,
             25
        ]
    ]
};
get(1007)-> #{
    'type' => 1,
    'level' => 7,
    'trigger_val' => 50000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1101,
             25
        ],
         [
            1102,
             25
        ],
         [
            1103,
             25
        ],
         [
            1104,
             25
        ]
    ]
};
get(2007)-> #{
    'type' => 2,
    'level' => 7,
    'trigger_val' => 100000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1111,
             25
        ],
         [
            1112,
             25
        ],
         [
            1113,
             25
        ],
         [
            1114,
             25
        ]
    ]
};
get(3007)-> #{
    'type' => 3,
    'level' => 7,
    'trigger_val' => 100000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1121,
             25
        ],
         [
            1122,
             25
        ],
         [
            1123,
             25
        ],
         [
            1124,
             25
        ]
    ]
};
get(4007)-> #{
    'type' => 4,
    'level' => 7,
    'trigger_val' => 100000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1131,
             25
        ],
         [
            1132,
             25
        ],
         [
            1133,
             25
        ],
         [
            1134,
             25
        ]
    ]
};
get(1008)-> #{
    'type' => 1,
    'level' => 8,
    'trigger_val' => 55000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1141,
             25
        ],
         [
            1142,
             25
        ],
         [
            1143,
             25
        ],
         [
            1144,
             25
        ]
    ]
};
get(2008)-> #{
    'type' => 2,
    'level' => 8,
    'trigger_val' => 110000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1151,
             25
        ],
         [
            1152,
             25
        ],
         [
            1153,
             25
        ],
         [
            1154,
             25
        ]
    ]
};
get(3008)-> #{
    'type' => 3,
    'level' => 8,
    'trigger_val' => 110000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1161,
             25
        ],
         [
            1162,
             25
        ],
         [
            1163,
             25
        ],
         [
            1164,
             25
        ]
    ]
};
get(4008)-> #{
    'type' => 4,
    'level' => 8,
    'trigger_val' => 110000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1171,
             25
        ],
         [
            1172,
             25
        ],
         [
            1173,
             25
        ],
         [
            1174,
             25
        ]
    ]
};
get(1009)-> #{
    'type' => 1,
    'level' => 9,
    'trigger_val' => 60000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1181,
             25
        ],
         [
            1182,
             25
        ],
         [
            1183,
             25
        ],
         [
            1184,
             25
        ]
    ]
};
get(2009)-> #{
    'type' => 2,
    'level' => 9,
    'trigger_val' => 120000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1191,
             20
        ],
         [
            1192,
             20
        ],
         [
            1193,
             30
        ],
         [
            1194,
             30
        ]
    ]
};
get(3009)-> #{
    'type' => 3,
    'level' => 9,
    'trigger_val' => 120000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1201,
             20
        ],
         [
            1202,
             20
        ],
         [
            1203,
             30
        ],
         [
            1204,
             30
        ]
    ]
};
get(4009)-> #{
    'type' => 4,
    'level' => 9,
    'trigger_val' => 120000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1211,
             20
        ],
         [
            1212,
             20
        ],
         [
            1213,
             30
        ],
         [
            1214,
             30
        ]
    ]
};
get(1010)-> #{
    'type' => 1,
    'level' => 10,
    'trigger_val' => 70000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1221,
             20
        ],
         [
            1222,
             20
        ],
         [
            1223,
             30
        ],
         [
            1224,
             30
        ]
    ]
};
get(2010)-> #{
    'type' => 2,
    'level' => 10,
    'trigger_val' => 140000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1231,
             15
        ],
         [
            1232,
             15
        ],
         [
            1233,
             15
        ],
         [
            1234,
             30
        ],
         [
            1235,
             25
        ]
    ]
};
get(3010)-> #{
    'type' => 3,
    'level' => 10,
    'trigger_val' => 140000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1241,
             15
        ],
         [
            1242,
             15
        ],
         [
            1243,
             15
        ],
         [
            1244,
             30
        ],
         [
            1245,
             25
        ]
    ]
};
get(4010)-> #{
    'type' => 4,
    'level' => 10,
    'trigger_val' => 140000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1251,
             10
        ],
         [
            1252,
             15
        ],
         [
            1253,
             15
        ],
         [
            1254,
             20
        ],
         [
            1255,
             20
        ],
         [
            1256,
             20
        ]
    ]
};
get(1011)-> #{
    'type' => 1,
    'level' => 11,
    'trigger_val' => 80000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1261,
             10
        ],
         [
            1262,
             15
        ],
         [
            1263,
             15
        ],
         [
            1264,
             20
        ],
         [
            1265,
             20
        ],
         [
            1266,
             20
        ]
    ]
};
get(2011)-> #{
    'type' => 2,
    'level' => 11,
    'trigger_val' => 160000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1271,
             10
        ],
         [
            1272,
             15
        ],
         [
            1273,
             15
        ],
         [
            1274,
             20
        ],
         [
            1275,
             20
        ],
         [
            1276,
             20
        ]
    ]
};
get(3011)-> #{
    'type' => 3,
    'level' => 11,
    'trigger_val' => 160000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1281,
             10
        ],
         [
            1282,
             15
        ],
         [
            1283,
             15
        ],
         [
            1284,
             20
        ],
         [
            1285,
             20
        ],
         [
            1286,
             20
        ]
    ]
};
get(4011)-> #{
    'type' => 4,
    'level' => 11,
    'trigger_val' => 160000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1291,
             10
        ],
         [
            1292,
             15
        ],
         [
            1293,
             15
        ],
         [
            1294,
             20
        ],
         [
            1295,
             20
        ],
         [
            1296,
             20
        ]
    ]
};
get(1012)-> #{
    'type' => 1,
    'level' => 12,
    'trigger_val' => 90000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            1301,
             10
        ],
         [
            1302,
             15
        ],
         [
            1303,
             15
        ],
         [
            1304,
             20
        ],
         [
            1305,
             20
        ],
         [
            1306,
             20
        ]
    ]
};
get(2012)-> #{
    'type' => 2,
    'level' => 12,
    'trigger_val' => 180000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2061,
             25
        ],
         [
            2062,
             25
        ],
         [
            2063,
             25
        ],
         [
            2064,
             25
        ]
    ]
};
get(3012)-> #{
    'type' => 3,
    'level' => 12,
    'trigger_val' => 180000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2071,
             25
        ],
         [
            2072,
             25
        ],
         [
            2073,
             25
        ],
         [
            2074,
             25
        ]
    ]
};
get(4012)-> #{
    'type' => 4,
    'level' => 12,
    'trigger_val' => 180000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2081,
             25
        ],
         [
            2082,
             25
        ],
         [
            2083,
             25
        ],
         [
            2084,
             25
        ]
    ]
};
get(1013)-> #{
    'type' => 1,
    'level' => 13,
    'trigger_val' => 100000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2091,
             25
        ],
         [
            2092,
             25
        ],
         [
            2093,
             25
        ],
         [
            2094,
             25
        ]
    ]
};
get(2013)-> #{
    'type' => 2,
    'level' => 13,
    'trigger_val' => 200000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2101,
             25
        ],
         [
            2102,
             25
        ],
         [
            2103,
             25
        ],
         [
            2104,
             25
        ]
    ]
};
get(3013)-> #{
    'type' => 3,
    'level' => 13,
    'trigger_val' => 200000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2111,
             25
        ],
         [
            2112,
             25
        ],
         [
            2113,
             25
        ],
         [
            2114,
             25
        ]
    ]
};
get(4013)-> #{
    'type' => 4,
    'level' => 13,
    'trigger_val' => 200000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2121,
             25
        ],
         [
            2122,
             25
        ],
         [
            2123,
             25
        ],
         [
            2124,
             25
        ]
    ]
};
get(1014)-> #{
    'type' => 1,
    'level' => 14,
    'trigger_val' => 110000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2131,
             25
        ],
         [
            2132,
             25
        ],
         [
            2133,
             25
        ],
         [
            2134,
             25
        ]
    ]
};
get(2014)-> #{
    'type' => 2,
    'level' => 14,
    'trigger_val' => 220000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2141,
             25
        ],
         [
            2142,
             25
        ],
         [
            2143,
             25
        ],
         [
            2144,
             25
        ]
    ]
};
get(3014)-> #{
    'type' => 3,
    'level' => 14,
    'trigger_val' => 220000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2151,
             25
        ],
         [
            2152,
             25
        ],
         [
            2153,
             25
        ],
         [
            2154,
             25
        ]
    ]
};
get(4014)-> #{
    'type' => 4,
    'level' => 14,
    'trigger_val' => 220000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2161,
             25
        ],
         [
            2162,
             25
        ],
         [
            2163,
             25
        ],
         [
            2164,
             25
        ]
    ]
};
get(1015)-> #{
    'type' => 1,
    'level' => 15,
    'trigger_val' => 120000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2171,
             25
        ],
         [
            2172,
             25
        ],
         [
            2173,
             25
        ],
         [
            2174,
             25
        ]
    ]
};
get(2015)-> #{
    'type' => 2,
    'level' => 15,
    'trigger_val' => 240000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2181,
             25
        ],
         [
            2182,
             25
        ],
         [
            2183,
             25
        ],
         [
            2184,
             25
        ]
    ]
};
get(3015)-> #{
    'type' => 3,
    'level' => 15,
    'trigger_val' => 240000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2191,
             20
        ],
         [
            2192,
             20
        ],
         [
            2193,
             30
        ],
         [
            2194,
             30
        ]
    ]
};
get(4015)-> #{
    'type' => 4,
    'level' => 15,
    'trigger_val' => 240000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2201,
             20
        ],
         [
            2202,
             20
        ],
         [
            2203,
             30
        ],
         [
            2204,
             30
        ]
    ]
};
get(1016)-> #{
    'type' => 1,
    'level' => 16,
    'trigger_val' => 140000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2211,
             20
        ],
         [
            2212,
             20
        ],
         [
            2213,
             30
        ],
         [
            2214,
             30
        ]
    ]
};
get(2016)-> #{
    'type' => 2,
    'level' => 16,
    'trigger_val' => 280000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2221,
             20
        ],
         [
            2222,
             20
        ],
         [
            2223,
             30
        ],
         [
            2224,
             30
        ]
    ]
};
get(3016)-> #{
    'type' => 3,
    'level' => 16,
    'trigger_val' => 280000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2231,
             15
        ],
         [
            2232,
             15
        ],
         [
            2233,
             15
        ],
         [
            2234,
             30
        ],
         [
            2235,
             25
        ]
    ]
};
get(4016)-> #{
    'type' => 4,
    'level' => 16,
    'trigger_val' => 280000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2241,
             15
        ],
         [
            2242,
             15
        ],
         [
            2243,
             15
        ],
         [
            2244,
             30
        ],
         [
            2245,
             25
        ]
    ]
};
get(1017)-> #{
    'type' => 1,
    'level' => 17,
    'trigger_val' => 160000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2251,
             10
        ],
         [
            2252,
             15
        ],
         [
            2253,
             15
        ],
         [
            2254,
             20
        ],
         [
            2255,
             20
        ],
         [
            2256,
             20
        ]
    ]
};
get(2017)-> #{
    'type' => 2,
    'level' => 17,
    'trigger_val' => 320000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2261,
             10
        ],
         [
            2262,
             15
        ],
         [
            2263,
             15
        ],
         [
            2264,
             20
        ],
         [
            2265,
             20
        ],
         [
            2266,
             20
        ]
    ]
};
get(3017)-> #{
    'type' => 3,
    'level' => 17,
    'trigger_val' => 320000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2271,
             10
        ],
         [
            2272,
             15
        ],
         [
            2273,
             15
        ],
         [
            2274,
             20
        ],
         [
            2275,
             20
        ],
         [
            2276,
             20
        ]
    ]
};
get(4017)-> #{
    'type' => 4,
    'level' => 17,
    'trigger_val' => 320000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2281,
             10
        ],
         [
            2282,
             15
        ],
         [
            2283,
             15
        ],
         [
            2284,
             20
        ],
         [
            2285,
             20
        ],
         [
            2286,
             20
        ]
    ]
};
get(1018)-> #{
    'type' => 1,
    'level' => 18,
    'trigger_val' => 180000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2291,
             10
        ],
         [
            2292,
             15
        ],
         [
            2293,
             15
        ],
         [
            2294,
             20
        ],
         [
            2295,
             20
        ],
         [
            2296,
             20
        ]
    ]
};
get(2018)-> #{
    'type' => 2,
    'level' => 18,
    'trigger_val' => 360000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            2301,
             10
        ],
         [
            2302,
             15
        ],
         [
            2303,
             15
        ],
         [
            2304,
             20
        ],
         [
            2305,
             20
        ],
         [
            2306,
             20
        ]
    ]
};
get(3018)-> #{
    'type' => 3,
    'level' => 18,
    'trigger_val' => 360000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3061,
             25
        ],
         [
            3062,
             25
        ],
         [
            3063,
             25
        ],
         [
            3064,
             25
        ]
    ]
};
get(4018)-> #{
    'type' => 4,
    'level' => 18,
    'trigger_val' => 360000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3071,
             25
        ],
         [
            3072,
             25
        ],
         [
            3073,
             25
        ],
         [
            3074,
             25
        ]
    ]
};
get(1019)-> #{
    'type' => 1,
    'level' => 19,
    'trigger_val' => 200000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3081,
             25
        ],
         [
            3082,
             25
        ],
         [
            3083,
             25
        ],
         [
            3084,
             25
        ]
    ]
};
get(2019)-> #{
    'type' => 2,
    'level' => 19,
    'trigger_val' => 400000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3091,
             25
        ],
         [
            3092,
             25
        ],
         [
            3093,
             25
        ],
         [
            3094,
             25
        ]
    ]
};
get(3019)-> #{
    'type' => 3,
    'level' => 19,
    'trigger_val' => 400000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3101,
             25
        ],
         [
            3102,
             25
        ],
         [
            3103,
             25
        ],
         [
            3104,
             25
        ]
    ]
};
get(4019)-> #{
    'type' => 4,
    'level' => 19,
    'trigger_val' => 400000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3111,
             25
        ],
         [
            3112,
             25
        ],
         [
            3113,
             25
        ],
         [
            3114,
             25
        ]
    ]
};
get(1020)-> #{
    'type' => 1,
    'level' => 20,
    'trigger_val' => 220000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3121,
             25
        ],
         [
            3122,
             25
        ],
         [
            3123,
             25
        ],
         [
            3124,
             25
        ]
    ]
};
get(2020)-> #{
    'type' => 2,
    'level' => 20,
    'trigger_val' => 440000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3131,
             25
        ],
         [
            3132,
             25
        ],
         [
            3133,
             25
        ],
         [
            3134,
             25
        ]
    ]
};
get(3020)-> #{
    'type' => 3,
    'level' => 20,
    'trigger_val' => 440000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3141,
             25
        ],
         [
            3142,
             25
        ],
         [
            3143,
             25
        ],
         [
            3144,
             25
        ]
    ]
};
get(4020)-> #{
    'type' => 4,
    'level' => 20,
    'trigger_val' => 440000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3151,
             25
        ],
         [
            3152,
             25
        ],
         [
            3153,
             25
        ],
         [
            3154,
             25
        ]
    ]
};
get(1021)-> #{
    'type' => 1,
    'level' => 21,
    'trigger_val' => 240000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3161,
             25
        ],
         [
            3162,
             25
        ],
         [
            3163,
             25
        ],
         [
            3164,
             25
        ]
    ]
};
get(2021)-> #{
    'type' => 2,
    'level' => 21,
    'trigger_val' => 480000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3171,
             25
        ],
         [
            3172,
             25
        ],
         [
            3173,
             25
        ],
         [
            3174,
             25
        ]
    ]
};
get(3021)-> #{
    'type' => 3,
    'level' => 21,
    'trigger_val' => 480000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3181,
             25
        ],
         [
            3182,
             25
        ],
         [
            3183,
             25
        ],
         [
            3184,
             25
        ]
    ]
};
get(4021)-> #{
    'type' => 4,
    'level' => 21,
    'trigger_val' => 480000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3191,
             20
        ],
         [
            3192,
             20
        ],
         [
            3193,
             30
        ],
         [
            3194,
             30
        ]
    ]
};
get(1022)-> #{
    'type' => 1,
    'level' => 22,
    'trigger_val' => 260000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3201,
             20
        ],
         [
            3202,
             20
        ],
         [
            3203,
             30
        ],
         [
            3204,
             30
        ]
    ]
};
get(2022)-> #{
    'type' => 2,
    'level' => 22,
    'trigger_val' => 520000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3211,
             20
        ],
         [
            3212,
             20
        ],
         [
            3213,
             30
        ],
         [
            3214,
             30
        ]
    ]
};
get(3022)-> #{
    'type' => 3,
    'level' => 22,
    'trigger_val' => 520000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3221,
             20
        ],
         [
            3222,
             20
        ],
         [
            3223,
             30
        ],
         [
            3224,
             30
        ]
    ]
};
get(4022)-> #{
    'type' => 4,
    'level' => 22,
    'trigger_val' => 520000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3231,
             15
        ],
         [
            3232,
             15
        ],
         [
            3233,
             15
        ],
         [
            3234,
             30
        ],
         [
            3235,
             25
        ]
    ]
};
get(1023)-> #{
    'type' => 1,
    'level' => 23,
    'trigger_val' => 280000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3241,
             15
        ],
         [
            3242,
             15
        ],
         [
            3243,
             15
        ],
         [
            3244,
             30
        ],
         [
            3245,
             25
        ]
    ]
};
get(2023)-> #{
    'type' => 2,
    'level' => 23,
    'trigger_val' => 560000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3251,
             10
        ],
         [
            3252,
             15
        ],
         [
            3253,
             15
        ],
         [
            3254,
             20
        ],
         [
            3255,
             20
        ],
         [
            3256,
             20
        ]
    ]
};
get(3023)-> #{
    'type' => 3,
    'level' => 23,
    'trigger_val' => 560000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3261,
             10
        ],
         [
            3262,
             15
        ],
         [
            3263,
             15
        ],
         [
            3264,
             20
        ],
         [
            3265,
             20
        ],
         [
            3266,
             20
        ]
    ]
};
get(4023)-> #{
    'type' => 4,
    'level' => 23,
    'trigger_val' => 560000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3271,
             10
        ],
         [
            3272,
             15
        ],
         [
            3273,
             15
        ],
         [
            3274,
             20
        ],
         [
            3275,
             20
        ],
         [
            3276,
             20
        ]
    ]
};
get(1024)-> #{
    'type' => 1,
    'level' => 24,
    'trigger_val' => 300000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3281,
             10
        ],
         [
            3282,
             15
        ],
         [
            3283,
             15
        ],
         [
            3284,
             20
        ],
         [
            3285,
             20
        ],
         [
            3286,
             20
        ]
    ]
};
get(2024)-> #{
    'type' => 2,
    'level' => 24,
    'trigger_val' => 600000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3291,
             10
        ],
         [
            3292,
             15
        ],
         [
            3293,
             15
        ],
         [
            3294,
             20
        ],
         [
            3295,
             20
        ],
         [
            3296,
             20
        ]
    ]
};
get(3024)-> #{
    'type' => 3,
    'level' => 24,
    'trigger_val' => 600000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            3301,
             10
        ],
         [
            3302,
             15
        ],
         [
            3303,
             15
        ],
         [
            3304,
             20
        ],
         [
            3305,
             20
        ],
         [
            3306,
             20
        ]
    ]
};
get(4024)-> #{
    'type' => 4,
    'level' => 24,
    'trigger_val' => 600000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4061,
             25
        ],
         [
            4062,
             25
        ],
         [
            4063,
             25
        ],
         [
            4064,
             25
        ]
    ]
};
get(1025)-> #{
    'type' => 1,
    'level' => 25,
    'trigger_val' => 320000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4071,
             25
        ],
         [
            4072,
             25
        ],
         [
            4073,
             25
        ],
         [
            4074,
             25
        ]
    ]
};
get(2025)-> #{
    'type' => 2,
    'level' => 25,
    'trigger_val' => 640000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4081,
             25
        ],
         [
            4082,
             25
        ],
         [
            4083,
             25
        ],
         [
            4084,
             25
        ]
    ]
};
get(3025)-> #{
    'type' => 3,
    'level' => 25,
    'trigger_val' => 640000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4091,
             25
        ],
         [
            4092,
             25
        ],
         [
            4093,
             25
        ],
         [
            4094,
             25
        ]
    ]
};
get(4025)-> #{
    'type' => 4,
    'level' => 25,
    'trigger_val' => 640000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4101,
             25
        ],
         [
            4102,
             25
        ],
         [
            4103,
             25
        ],
         [
            4104,
             25
        ]
    ]
};
get(1026)-> #{
    'type' => 1,
    'level' => 26,
    'trigger_val' => 340000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4111,
             25
        ],
         [
            4112,
             25
        ],
         [
            4113,
             25
        ],
         [
            4114,
             25
        ]
    ]
};
get(2026)-> #{
    'type' => 2,
    'level' => 26,
    'trigger_val' => 680000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4121,
             25
        ],
         [
            4122,
             25
        ],
         [
            4123,
             25
        ],
         [
            4124,
             25
        ]
    ]
};
get(3026)-> #{
    'type' => 3,
    'level' => 26,
    'trigger_val' => 680000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4131,
             25
        ],
         [
            4132,
             25
        ],
         [
            4133,
             25
        ],
         [
            4134,
             25
        ]
    ]
};
get(4026)-> #{
    'type' => 4,
    'level' => 26,
    'trigger_val' => 680000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4141,
             25
        ],
         [
            4142,
             25
        ],
         [
            4143,
             25
        ],
         [
            4144,
             25
        ]
    ]
};
get(1027)-> #{
    'type' => 1,
    'level' => 27,
    'trigger_val' => 360000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4151,
             25
        ],
         [
            4152,
             25
        ],
         [
            4153,
             25
        ],
         [
            4154,
             25
        ]
    ]
};
get(2027)-> #{
    'type' => 2,
    'level' => 27,
    'trigger_val' => 720000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4161,
             25
        ],
         [
            4162,
             25
        ],
         [
            4163,
             25
        ],
         [
            4164,
             25
        ]
    ]
};
get(3027)-> #{
    'type' => 3,
    'level' => 27,
    'trigger_val' => 720000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4171,
             25
        ],
         [
            4172,
             25
        ],
         [
            4173,
             25
        ],
         [
            4174,
             25
        ]
    ]
};
get(4027)-> #{
    'type' => 4,
    'level' => 27,
    'trigger_val' => 720000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4181,
             25
        ],
         [
            4182,
             25
        ],
         [
            4183,
             25
        ],
         [
            4184,
             25
        ]
    ]
};
get(1028)-> #{
    'type' => 1,
    'level' => 28,
    'trigger_val' => 380000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4191,
             20
        ],
         [
            4192,
             20
        ],
         [
            4193,
             30
        ],
         [
            4194,
             30
        ]
    ]
};
get(2028)-> #{
    'type' => 2,
    'level' => 28,
    'trigger_val' => 760000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4201,
             20
        ],
         [
            4202,
             20
        ],
         [
            4203,
             30
        ],
         [
            4204,
             30
        ]
    ]
};
get(3028)-> #{
    'type' => 3,
    'level' => 28,
    'trigger_val' => 760000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4211,
             20
        ],
         [
            4212,
             20
        ],
         [
            4213,
             30
        ],
         [
            4214,
             30
        ]
    ]
};
get(4028)-> #{
    'type' => 4,
    'level' => 28,
    'trigger_val' => 760000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4221,
             20
        ],
         [
            4222,
             20
        ],
         [
            4223,
             30
        ],
         [
            4224,
             30
        ]
    ]
};
get(1029)-> #{
    'type' => 1,
    'level' => 29,
    'trigger_val' => 400000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4231,
             15
        ],
         [
            4232,
             15
        ],
         [
            4233,
             15
        ],
         [
            4234,
             30
        ],
         [
            4235,
             25
        ]
    ]
};
get(2029)-> #{
    'type' => 2,
    'level' => 29,
    'trigger_val' => 800000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4241,
             15
        ],
         [
            4242,
             15
        ],
         [
            4243,
             15
        ],
         [
            4244,
             30
        ],
         [
            4245,
             25
        ]
    ]
};
get(3029)-> #{
    'type' => 3,
    'level' => 29,
    'trigger_val' => 800000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4251,
             10
        ],
         [
            4252,
             15
        ],
         [
            4253,
             15
        ],
         [
            4254,
             20
        ],
         [
            4255,
             20
        ],
         [
            4256,
             20
        ]
    ]
};
get(4029)-> #{
    'type' => 4,
    'level' => 29,
    'trigger_val' => 800000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4261,
             10
        ],
         [
            4262,
             15
        ],
         [
            4263,
             15
        ],
         [
            4264,
             20
        ],
         [
            4265,
             20
        ],
         [
            4266,
             20
        ]
    ]
};
get(1030)-> #{
    'type' => 1,
    'level' => 30,
    'trigger_val' => 420000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4271,
             10
        ],
         [
            4272,
             15
        ],
         [
            4273,
             15
        ],
         [
            4274,
             20
        ],
         [
            4275,
             20
        ],
         [
            4276,
             20
        ]
    ]
};
get(2030)-> #{
    'type' => 2,
    'level' => 30,
    'trigger_val' => 840000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4281,
             10
        ],
         [
            4282,
             15
        ],
         [
            4283,
             15
        ],
         [
            4284,
             20
        ],
         [
            4285,
             20
        ],
         [
            4286,
             20
        ]
    ]
};
get(3030)-> #{
    'type' => 3,
    'level' => 30,
    'trigger_val' => 840000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4291,
             10
        ],
         [
            4292,
             15
        ],
         [
            4293,
             15
        ],
         [
            4294,
             20
        ],
         [
            4295,
             20
        ],
         [
            4296,
             20
        ]
    ]
};
get(4030)-> #{
    'type' => 4,
    'level' => 30,
    'trigger_val' => 840000,
    'takt_time' => 7200,
    'all_weight' => 100,
    'event_weight' => [
        [
            4301,
             10
        ],
         [
            4302,
             15
        ],
         [
            4303,
             15
        ],
         [
            4304,
             20
        ],
         [
            4305,
             20
        ],
         [
            4306,
             20
        ]
    ]
};

get(_N) -> false.
get_list() ->
	[1006,2006,3006,4006,1007,2007,3007,4007,1008,2008,3008,4008,1009,2009,3009,4009,1010,2010,3010,4010,1011,2011,3011,4011,1012,2012,3012,4012,1013,2013,3013,4013,1014,2014,3014,4014,1015,2015,3015,4015,1016,2016,3016,4016,1017,2017,3017,4017,1018,2018,3018,4018,1019,2019,3019,4019,1020,2020,3020,4020,1021,2021,3021,4021,1022,2022,3022,4022,1023,2023,3023,4023,1024,2024,3024,4024,1025,2025,3025,4025,1026,2026,3026,4026,1027,2027,3027,4027,1028,2028,3028,4028,1029,2029,3029,4029,1030,2030,3030,4030].
