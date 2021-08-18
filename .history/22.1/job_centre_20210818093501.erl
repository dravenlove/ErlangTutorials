%%在下面这些练习里，我们将用job_centre模块制作一个服务器，它用gen_server实现一种
%%任务管理服务。任务中心（job center）持有一个必须完成的任务队列，这些任务会被编号，任何
%%人都能向队列添加任务。工人可以从队列请求任务，并告诉任务中心已经执行了某项任务。任务
%%是由fun表示的，要执行任务F，工人必须执行F()函数。
%%(1) 实现任务中心的基本功能，它的接口如下。
%% job_centre:start_link() -> true
%%启动任务中心服务器。
%% job_centre:add_job(F) -> JobNumber
%%添加任务F到任务队列，然后返回一个整数任务编号。
%% job_centre:work_wanted() -> {JobNumber,F} | no
%%请求任务。如果工人想要一个任务，就调用job_centre:work_wanted()。如果队列里
%%有任务，就会返回一个{JobNumber, F}元组。工人执行F()来完成任务。如果队列里没
%%有任务，则会返回no。请确保同一项任务每次只分配给一个工人，并确保系统是公平的，
%%意思是任务按照请求的顺序进行分配。
%% job_centre:job_done(JobNumber)
%%发出任务完成的信号。如果工人完成了某一项任务，就必须调用job_centre:job_done
%%(JobNumber)。

-module(job_centre).
-export([start_link/0,factory/0,add_job/1,work_wanted/0,job_done/1]).

start_link() ->
    register(factory,spawn(fun() -> factory() end)).

add_job(F) -> 
    
    

work_wanted() ->
    case  of

job_done(JobNumber) ->


factory()->
    receive
        {From,Response} ->
            case Response of
                {add_job,_} ->
                    {add_job,F}=Response,
                    From ! {self(),add_job(F)};

                {work_wanted,_} ->
                    From ! {self(),work_wanted()};

                {job_done,_} ->
                    {job_done,JobNumber}=Response,
                    From ! {self(),job_done(JobNumber)}
                end.