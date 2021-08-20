-module(job_centre1).

-behaviour(gen_server).

%% API
-export([start_link/1,add_job/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-define(SERVER,job_centre).
-record(state, {dummy}).

start_link(Name) ->
    gen_server:start_link({local, Name}, ?MODULE, [], []),
    true.
add_job(F)->gen_server:call(?MODULE,{addjob,F}).

init([]) ->
    {ok, Tab=ets:new(?MODULE,[])}.

handle_call({addjob,F}, _From, Tab) ->

    {reply, ok, Tab};

handle_call(stop, _From, Tab) ->
    {stop, normal, stopped, Tab};



handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.



