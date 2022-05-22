-module(test).
-export([job_centre/0]).

job_centre() ->
    Etsid=ets:file2tab("C:/Users/Administrator/Desktop/work/22.1/job.date"),
    receive
        {From,{add_job,_}} ->
            From ! {self(),1};

        {From,{work_wanted,_}} ->
            From ! {self(),2};

        {From,{job_done,_}} ->   
            From ! {self(),3}
    end.    