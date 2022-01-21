-module(pack_and_unpack).

-export([
        pack/0,
        unpack/0
        ]).

pack() ->
    <<1:1, 2:10, 3:5 >>.

unpack() ->
    <<A:1, B:10, C:5>> = <<1:1, 2:10, 3:5 >>,
    io:format("A = ~p~nB = ~p~nC = ~p~n", [A,B,C]).