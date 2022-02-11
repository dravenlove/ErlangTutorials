-module(myspawn).
-export([
        start/0,
        my_spawn/3,
        func/0
        ]).

start() ->
    my_spawn(myspawn, func, []).

my_spawn(Mod, Func, Args) ->
    Pid = spawn(Mod, Func, Args),
    spawn(fun() ->
                Ref = monitor(process, Pid),
                receive
                    {'DOWN', Ref, process, Pid, _Why} ->
                        io:format("rebooting~n"),
                        spawn(Mod, Func, Args),
                        io:format("reboot success~n"),
                        monitor(process, Pid)
                end
            end),
    Pid.

func() ->
    receive
        {ok, Message} ->
            exit(Message)
    after 5000 ->
        io:format("running~n"),
        func()
    end.