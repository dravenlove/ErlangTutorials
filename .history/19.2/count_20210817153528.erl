%%(2) 制作一个共享的ETS计数表。实现一个名为count:me(Mod,Line)的函数，通过在你的代码里添加count:me(?MODULE, ?LINE)来调用它。每当这个函数被调用时，就给记录自身执行次数的计数器加1。编写一些函数来初始化和读取计数器。

-module(count).
-export([me/2]).



me(Mod,Line) ->
    case ets:info(count) of
        undefined ->
    ets:new(count,[duplicate_bag,public]),
    ;
        true ->
        end.