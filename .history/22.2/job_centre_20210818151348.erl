



-module(job_centre).
-export([start_link/0,add_job/1,work_wanted/0,job_done/1,job_centre/0]).

start_link() ->
    register(job_centre,spawn(fun() -> job_centre() end)),
    true.

add_job(F) ->
    case ets:last(job) of
        '$end_of_table' ->
            ets:insert(job,{1,F});
        Key ->
            ets:insert(job,{ets:last(job)+1,F})
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
    JobNumber.

job_centre() ->
    ets:new(job,[named_table,public,ordered_set]),
    ets:new(job_do,[named_table,public,ordered_set]),
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
    end.    



                