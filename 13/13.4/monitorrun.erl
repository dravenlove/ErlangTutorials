%% 编写一个程序让他创建一个每隔5s就打印一次"我还在运行"的注册进程
%% 编写一个函数监控该进程,如果进程挂了就重启它.
%% 启动公共进程和监视进程,然后摧毁公共进程,检查他是否会重启

-module(monitorrun).
-export([
        start/0,
        monitorprocess/0,
        run_spawn/0
        ]).

-define(TIMING, 10000).
-define(END,     5000).

start() ->
    spawn(monitorrun, monitorprocess, []).

monitorprocess() ->
    Pid = spawn(monitorrun,run_spawn, []),
    spawn(fun() ->
            Ref = monitor(process, Pid),
            receive
                {'DOWN', Ref, process, _Pid, _Why} ->
                    io:format("process have been dead, reboot process"),
                    monitorprocess()
            end
        end).


run_spawn() ->
    receive
        {timeout, _, _} ->
            io:format("process have been dead2"),
            exit(accident)
    after ?TIMING ->
        io:format("i am running, Pid is ~p ~n", [self()]),
        run_spawn()
    end.
