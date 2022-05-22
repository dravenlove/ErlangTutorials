%% 编写一个my_spawn()函数,行为类似spawn(Mod,Func,Args)
%% 如果分裂进程超过Time秒就销毁.

-module(monitortime).
-export([
        my_spawn/4
        ]).

my_spawn(Mod, Func, Args, Time) ->
    Pid = spawn(Mod, Func, Args),
    Ref = monitor(process, Pid),
    receive
        {'DOWN', Ref, process, Pid, Why} ->
            io:format("Reason is ~p~n", [Why])
        after Time * 1000 ->
            exit(Pid, timeout)
    end.