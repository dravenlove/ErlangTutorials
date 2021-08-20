-module(job_centre1).

-behaviour(gen_server).

%% API
-export([start_link/1,add_job/1,work_wanted/0,job_done/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-define(SERVER,job_centre).
-record(state, {dummy}).

start_link(Name) ->
    gen_server:start_link({local, Name}, ?MODULE, [], []),
    true.
add_job(F) ->
    gen_server:call(?MODULE,{addjob,F}).
work_wanted() ->
    gen_server:call(?MODULE,{work_want,[]}).
job_done(JobNumber) ->
    gen_server:call(?MODULE,{job_done,JobNumber}).


init([]) ->
    {ok, ets:new(?MODULE,[named_table,ordered_set])}.

handle_call({addjob,F}, _From, Tab) ->
    Reply=case ets:last(?MODULE) of
        '$end_of_table' ->
            ets:insert(?MODULE,{1,F}),
            1;
        Key ->
             ets:insert(?MODULE,{ets:last(?MODULE)+1,F}),
             ets:last(?MODULE)
            end.

    {reply,Reply,Tab};

handle_call({work_wanted,[]}, _From, Tab) ->

    {reply,Reply,Tab};

handle_call({job_done,JobNumber}, _From, Tab) ->

    {reply,Reply,Tab}.



handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.



