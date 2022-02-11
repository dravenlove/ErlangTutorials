%% 编写一个my_spawn(Mod, FunC, Args)函数.
%% 行为类似spawn(Mod, Func, Args).
%% 如果分裂的进程挂了,分别打印挂掉的原因, 存活时间

-module(whenexit).
-export([
        my_spawn/3
        ,test_function/0
        ]).

-spec my_spawn(Modm Func, Args) -> pid when
    Mod :: atom(),
    Func :: atom(),
    Args :: [T] ,
    T :: term().

my_spawn(Mod, Func, Args) ->
    Pid = spawn(Mod, Func, Args),
    spawn(fun() ->
            {Time1, Time2, _Time3} = os:timestamp(),
            Ref = monitor(process, Pid),
                    receive
                        {'DOWN', Ref, process, Pid, Why} ->
                        io:format("Reason is ~p~n", [Why]),
                        {Time11, Time12, _Time13} = os:timestamp(),
                        Time = (Time11 - Time1) * 1000000 + (Time12 - Time2),
                        io:format("Exist Time is ~p s ~n", [Time])
                    end
            end),
    Pid.

test_function() ->
    receive
        Atom ->
            io:format("~p", [atom_to_list(Atom)]),
            test_function()
    end.

