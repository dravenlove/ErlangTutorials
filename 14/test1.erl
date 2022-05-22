%% 启动一个简单的名称服务器

%% 这个是第一个实例,目的是为了测试非分布式的程序

-module(test1).
-export([
    start/0,
    store/2,
    lookup/1
]).

start() ->
    register(kvs, spawn(fun() -> loop() end)).

store(K, V) ->
    rpc({store, K, V}).

lookup(K) ->
    rpc({lookup, K}).

rpc(Q) ->
    kvs ! {self(), Q},
    receive
        {kvs, Reply} ->
            Reply
    end.

loop() ->
    receive
        {From, {store, K, V}} ->
            put(K, {true, V}),
            From ! {kvs, true},
            loop();
        {From, {lookup, K}} ->
            From ! {kvs, get(K)},
            loop()
    end.
