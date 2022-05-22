%% 用章节的on_exit()函数完成
%% %% 如果分裂的进程挂了,分别打印挂掉的原因, 存活时间

%% on_exit(Pid, Fun) ->
%%              spawn(fun()) ->
%%                  Ref = monitor(process, Pid),
%%                  receive
%%                      {'DOWN', Ref, process, Pid, Why} ->
%%                          Fun(Why)    
%%                  end
%%              end).

-module(onexitfinish).
-export([
        on_exit/1
        ]).

on_exit(Pid) ->
    spawn(fun() ->
        {Time1, Time2, _Time3} = os:timestamp(),
        Ref = monitor(process, Pid),
        receive 
            {'DOWN', Ref, process, Pid, Why} ->
                {Time11, Time12, _Time13} = os:timestamp(),
                Time = (Time11 - Time1) * 1000000 + (Time12 - Time2),
                io:format("Reason is ~p~n", [Why]),
                io:format("Exist Time is ~p s ~n", [Time])
        end
    end).