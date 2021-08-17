%%(2) 制作一个共享的ETS计数表。实现一个名为count:me(Mod,Line)的函数，通过在你的代码里添加count:me(?MODULE, ?LINE)来调用它。每当这个函数被调用时，就给记录自身执行次数的计数器加1。编写一些函数来初始化和读取计数器。

-module(count).

-export([me/2,start/0,clean/0]).


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
                    case ets:last(F) of
                        '$end_of_table' ->
                            ets:insert(F,{1,1}),
                            ets:tab2file(F,"C:/Users/Administrator/Desktop/work/19.2/count.date");

                        true ->
                            {ok,P}=ets:file2tab("C:/Users/Administrator/Desktop/work/19.2/count.date"),
                            ets:insert(P,{ets:last(P)+1,ets:last(P)+1}),
                            ets:tab2file(P,"C:/Users/Administrator/Desktop/work/19.2/count.date")
                            end
                end;

        {error,_} -> 
        E=ets:new(count,[duplicate_bag,public]),
        ets:insert(E,{1,1}),
        ets:tab2file(E,"C:/Users/Administrator/Desktop/work/19.2/count.date")
        end.

start() ->
    count:me(?MODULE, ?LINE).

clean() ->
     {ok,Z}=ets:file2tab("C:/Users/Administrator/Desktop/work/19.2/count.date"),
     ets:delete_all_objects(Z),
     ets:tab2file(Z,"C:/Users/Administrator/Desktop/work/19.2/count.date").
