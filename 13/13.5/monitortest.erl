%% 编写一个函数启动和监视多个工作进程,如果任何一个工作进程非正常终止就重启它

-module(monitortest).
-export([
        start/4,
        test/0,
        monitor_process/4
        ]).

-spec start(
    Mod :: atom(),
    Func :: atom(),
    Args :: list(),
    N    :: integer()
) -> pid().


start(Mod, Func, Args, N) ->
    spawn(monitortest, monitor_process, [Mod, Func, Args, N]).

monitor_process(Mod, Func, Args, N) ->
    List = lists:seq(1, N),
    PidL = [ spawn(Mod, Func, Args) ||  _X<- List],
    process_flag(trap_exit, true),
    [monitor(process, Pid) ||  Pid<- PidL],
        receive
            {'DOWN', _Ref,process,_Pid,Why} ->
                io:format("~p ~n", [Why]),
                spawn_link(Mod, Func, Args)
        end.

test() ->
    receive 
        {ok, _}->
            test();
        {nope, _}->
            io:format("i have been dead!"),
            exit({monitortest, test, []})
    after 5000 ->
        io:format("I'm running, ~p process ~n", [self()])
        ,test()
    end.









