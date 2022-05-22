%%--- coding:utf-8 ---
-module(tb_chat_const).
-export([get/1,get_list/0]).
get(chat_limit_1)-> #{
    'jsonvalue' => [
        30,
         10,
         20
    ]
};
get(chat_limit_2)-> #{
    'jsonvalue' => [
        20,
         3,
         2
    ]
};
get(chat_limit_3)-> #{
    'jsonvalue' => [
        3,
         3
    ]
};
get(chat_limit_4)-> #{
    'jsonvalue' => [
        7,
         2,
         3
    ]
};
get(chat_max)-> #{
    
};

get(_N) -> false.
get_list() ->
	[chat_limit_1,chat_limit_2,chat_limit_3,chat_limit_4,chat_max].
