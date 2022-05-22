%%--- coding:utf-8 ---
-module(tb_continuous_recharge).
-export([get/1,get_list/0]).
get(10001)-> #{
    'serial_number' => 100
};
get(10002)-> #{
    'serial_number' => 100
};
get(10003)-> #{
    'serial_number' => 100
};
get(10101)-> #{
    'serial_number' => 101
};
get(10102)-> #{
    'serial_number' => 101
};
get(10103)-> #{
    'serial_number' => 101
};
get(10104)-> #{
    'serial_number' => 101
};
get(10105)-> #{
    'serial_number' => 101
};
get(10106)-> #{
    'serial_number' => 101
};
get(10201)-> #{
    'serial_number' => 102
};
get(10202)-> #{
    'serial_number' => 102
};
get(10203)-> #{
    'serial_number' => 102
};
get(10204)-> #{
    'serial_number' => 102
};
get(10205)-> #{
    'serial_number' => 102
};
get(10206)-> #{
    'serial_number' => 102
};
get(10207)-> #{
    'serial_number' => 102
};

get(_N) -> false.
get_list() ->
	[10001,10002,10003,10101,10102,10103,10104,10105,10106,10201,10202,10203,10204,10205,10206,10207].
