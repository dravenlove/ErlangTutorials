%% 编写一个环形计时器,创建一个由N个进程组成的环.
%% 把一条信息沿着环转发M次,总共发送信息N*M次
%% 记录不同N,M值所花费时间

-module(round).

-export([
        start/3,
        createprocess/1,
        launch/3
        ]).
-define(FIRST, '1').


start(N, M, Message) ->
    createprocess(N),
    launch(N, M, Message).

launch(N, M, Message) ->
    whereis(?FIRST) ! {?FIRST, list_to_atom(integer_to_list(N)), 1, M, Message},
    ok.

%% 创建N个进程,分别用register注册他们的名字
createprocess(N) ->
    List = lists:seq(1, N),
    lists:map(fun(X) ->
    register(list_to_atom(integer_to_list(X)), spawn(fun() ->loop() end))
              end, List).

%% 进程函数
loop() ->
    receive
        {_End, _End, End_time, End_time, Message} ->
            io:format("This is last process,it have running ~p times,it's message is ~p ~nAll success ~n", [End_time, Message]);
        {Now, End, End_time, End_time, Message} ->
            io:format("This is last time,This is ~p process,it have running ~p times,it's message is ~p ~n", [Now, End_time, Message]),
            {NextPid, NextName} = get_next_pid(Now),
            NextPid ! {NextName, End, End_time, End_time, Message};
        {End, End, Time, End_time, Message} ->
            io:format("This is last process,it have running ~p times,it's message is ~p ~n", [Time, Message]),
            First = get_first_pid(),
            First ! {?FIRST, End, Time + 1, End_time, Message},
            loop();
        {Now, End, Time, End_time, Message} ->
            io:format("This is ~p process,it have running ~p times,it's message is ~p ~n", [Now, Time, Message]),
            {NextPid, NextName} = get_next_pid(Now),
            NextPid ! {NextName, End, Time, End_time, Message},
            loop()
end.

get_first_pid() ->
    case whereis(?FIRST) of
        undefined ->
            io:format("First process have been died"),
            0;
        Pid -> Pid
    end.


get_next_pid(Now) ->
    case is_atom(Now) of
        false ->
            io:format("Next process have not exist"),
            {0,0};
        true ->
            List = lists:reverse(atom_to_list(Now)),
            Num = for(1, length(List), fun(X) -> 
                                round((lists:nth(X, List) - 48) * math:pow(10, X-1))    
                                end)+1,
            Atom = list_to_atom(integer_to_list(Num)),
            Next_Pid = case whereis(Atom) of
                undefined ->0;
                Pid -> Pid
            end,
            {Next_Pid, Atom}        
    end.          

for(M, M, F) ->F(M);
for(N, M, F) ->for(N+1, M, F)+F(N).