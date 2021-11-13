-module(clock).
-export([getclock/0]).

getclock()->
Date=erlang:tuple_to_list(erlang:date()),
Time=erlang:tuple_to_list(erlang:time()),

Clock=Date++Time,
io:format("~B.~B.~B. ~B:~B:~B",Clock).

