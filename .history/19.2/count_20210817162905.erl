%%(2) 制作一个共享的ETS计数表。实现一个名为count:me(Mod,Line)的函数，通过在你的代码里添加count:me(?MODULE, ?LINE)来调用它。每当这个函数被调用时，就给记录自身执行次数的计数器加1。编写一些函数来初始化和读取计数器。

-module(count).

-export([me/2,start/0]).


me(Mod,Line) ->
    Z=ets:file2tab("C:/Users/Administrator/Desktop/work/19.2/count.date"),
    {ok,F}=Z,
    case Z of 
        {ok,_} ->
            case ets:info(F) of
                undefined ->
            E=ets:new(count,[duplicate_bag,public]),
            ets:insert(E,{1,1}),
            ets:tab2file(E,"C:/Users/Administrator/Desktop/work/19.2/count.date");
                
                Other ->
            {ok,E}=ets:file2tab("C:/Users/Administrator/Desktop/work/19.2/count.date"),
            ets:insert(E,{ets:last(E)+1,ets:last(E)+1}),
            ets:tab2file(E,"C:/Users/Administrator/Desktop/work/19.2/count.date")
            end;
        {error,_} -> E=ets:new(count,[duplicate_bag,public]),
        ets:insert(E,{1,1}),
        ets:tab2file(E,"C:/Users/Administrator/Desktop/work/19.2/count.date")
        end.

start() ->
    count:me(?MODULE, ?LINE).

clean() ->
    