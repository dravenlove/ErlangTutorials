-module(job_centre1).

-behaviour(gen_server).

%% API
-export([start_link/0,add_job/1,work_wanted/0,job_done/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-define(SERVER,job_centre).
-record(state, {dummy}).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
    true.
add_job(F) ->
    gen_server:call(?MODULE,{addjob,F}).
work_wanted() ->
    gen_server:call(?MODULE,{work_want,[]}).
job_done(JobNumber) ->
    gen_server:call(?MODULE,{job_done,JobNumber}).


init([]) ->
        spawn(fun()->ets:new(job,[named_table,ordered_set]),
        ets:new(job_do,[named_table,ordered_set]),
        ets:new(job_done,[named_table,ordered_set])end),
    {ok,[]]}.

handle_call({addjob,F}, _From, Tab) ->
    Reply=case ets:last(job) of
        '$end_of_table' ->
            ets:insert(job,{1,F}),
            ets:insert(job_do,{1,F}),
            1;
        Key ->
             ets:insert(job,{ets:last(job)+1,F}),
             ets:insert(job_do,{ets:last(job)+1,F}),
             ets:last(job)
            end,
    {reply,Reply,Tab};

handle_call({work_wanted,[]}, _From, Tab) ->
    Reply=
        case ets:last(job) of
        '$end_of_table' ->
            no;
        Key ->
            [{JobNumber,F}]=ets:lookup(job,ets:first(job)),
            ets:delete(job,ets:first(job)),
            {JobNumber,F}
        end,
    {reply,Reply,Tab};

handle_call({job_done,JobNumber}, _From, Tab) ->
        ets:insert(job_done,ets:first(job_do,JobNumber)),
        ets:delete(job_do,ets:first(job_do,JobNumber)),
        Reply=JobNumber,
    {reply,Reply,Tab}.



handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.



