%% 测量一下进程分裂需要的时间

-module(testtime).
-export([
        test/1
        ]).

test(N) ->
    Max = erlang:system_info(process_limit),
    io:format("Max process limit = ~p~n", [Max]),
    statistics(runtime),
    statistics(wall_clock),
    for(1, N, fun() -> spawn(fun() -> wait() end) end),
    io:format("Total_run_time, Time_since_last = ~p~n", [statistics(runtime)]),
    io:format("Total_Wallclock_time, Wallclock_since_last = ~p~n", [statistics(wall_clock)]).


wait() ->
    receive
        die -> void
    end.

for(N, N, F) ->[F()];
for(I, N, F) ->[F(), for(I+1, N, F)].