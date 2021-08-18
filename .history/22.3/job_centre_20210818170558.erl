%%(3) 添加监视工人进程的代码。如果某个工人进程挂了，请确保它所执行的任务被返回到等待完成的任务池里。

-module(job_centre).
-export([start_link/0,add_job/1,work_wanted/0,job_done/1,job_centre/0,statistics/0,worker_pid/3]).

start_link() ->
    register(job_centre,spawn(fun() -> job_centre() end)),
    true.

add_job(F) ->
    case ets:last(job) of
        '$end_of_table' ->
            ets:insert(job,{1,F}),
            ets:insert(job_do,{1,F});
        Key ->
            ets:insert(job,{ets:last(job_do)+1,F}),
            ets:insert(job_do,{ets:last(job_do)+1,F})
        end,
    
    ets:last(job).

work_wanted() ->
    case ets:last(job) of
        '$end_of_table' ->
            no;
        Key ->
            %%ets:tod_dets(job,"C:/Users/Administrator/Desktop/work/22.1/job.date"),
            [{JobNumber,F}]=ets:lookup(job,ets:first(job)),
            ets:delete(job,ets:first(job)),
            {JobNumber,F}            
        end.

job_done(JobNumber)->
    ets:insert(job_done,ets:first(job_do,JobNumber)),
    ets:delete(job_do,ets:first(job_do,JobNumber)),
    JobNumber.

job_centre() ->
    case [ets:info(job),ets:info(job_do),ets:info(job_done)] of
        [false,_,_] ->
    ets:new(job,[named_table,public,ordered_set]),
    ets:new(job_do,[named_table,public,ordered_set]),
    ets:new(job_done,[named_table,public,ordered_set]);
        [true,true,true] ->
    receive
        {From,{add_job,F}} ->
            add_job(F),
            From ! {self(),add_job(F)};

        {From,{work_wanted}} ->
            work_wanted(),
            From ! {self(),work_wanted()};

        {From,{job_done,JobNumber}} ->   
            job_done(JobNumber),
            From ! {self(),job_done(JobNumber)}
        end,
        job_centre()    
    end.

statistics() ->
    io:format("job is ~p",[ets:i(job)]),
    io:format("job_do is ~p",[ets:i(job_do)]),
    io:format("job_done is ~p",[ets:i(job_done)]).

worker_pid(Worker,JobNumber,Job) ->
    case erlang:is_pid(Worker) of
            false ->
            ets:insert(job,{JobNumber,Job}),
            io:format("Add this job success!");
            true -> 
                io:format("Worker is worker")
            end.