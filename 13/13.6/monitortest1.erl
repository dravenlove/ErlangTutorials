%% 编写一个函数启动和监视多个进程.
%% 如果任何一个工作进程非正常重启,摧毁所有进程,然后重启他们.

-module(monitortest1).
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
    spawn(monitortest1, monitor_process, [Mod, Func, Args, N]).

monitor_process(Mod, Func, Args, N) ->
    List = lists:seq(1, N),
    PidL = [ spawn(Mod, Func, Args) ||  _X<- List],
    [monitor(process, Pid) ||  Pid<- PidL],
        receive
        {'DOWN', _Ref,process,_Pid,Why} ->
            io:format("~p ~n", [Why]),
            [exit(Pid1, test) ||  Pid1<- PidL ],
            start(Mod, Func, Args, N)
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