%%(3) 对hello.erl做一些小小的改动。在shell里编译并运行它们。如果有错，中止Erlang shell并重启shell。


-module(hello).
-export([start/0]).

start() ->
    io:format("Hello world~n").