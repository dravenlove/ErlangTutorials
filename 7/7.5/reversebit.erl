%% 编写一个函数反转某个二进制包含的位

-module(reversebit).
-export([
        reversebit/1
        ]).

    reversebit(Binary) ->
        Lists = lists:reverse([X || <<X : 1>> <= Binary]),
        io:format("~p",[Lists]),
        list_to_binary(Lists).