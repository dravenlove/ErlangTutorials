%%%-------------------------------------------------------------------
%%% @author User
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%% @end
%%%-------------------------------------------------------------------
-module(bank).

-behaviour(gen_server).

-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
    code_change/3]).

-export([start/0,stop/0,create_account/1,deposit/2,withdraw/2,check/1]).

-define(SERVER, ?MODULE).

-record(bank_state, {
    list = []   %%[{People,Number}]
}).

%%%===================================================================
%%% Spawning and gen_server implementation
%%%===================================================================

start() ->
    gen_server:start_link({global,?SERVER},?MODULE,[],[]).
stop() ->
    gen_server:call(?MODULE,stop).
create_account(People) ->
    gen_server:call(?MODULE,{new,People}).
deposit(People,Number) ->
    gen_server:call(?MODULE,{deposit,People,Number}).
withdraw(People,Number) ->
    gen_server:call(?MODULE,{withdraw,People,Number}).
check(People) ->
    gen_server:call(?MODULE,{check,People}).

start_link(A) ->
    gen_server:start_link({local, A}, ?MODULE, [], []).

init([]) ->
    {ok, #bank_state{}}.

handle_call({new, People}, _From, _State = #bank_state{}) ->
    Res = case erlang:get(People) of
              undefined ->
                  erlang:put(People,0),
                  ok;
              _ ->
                  false
          end,
    State1 = #bank_state{list=erlang:get()},
    {reply, Res, State1};
handle_call({deposit,People,Number}, _From, _State = #bank_state{}) ->
    Res = case erlang:get(People) of
              undefined ->
                  false;
              V ->
                  erlang:put(People, V + Number),
                  V + Number
          end,
    State1 = #bank_state{list=erlang:get()},
    {reply, Res, State1};
handle_call({withdraw,People,Number}, _From, _State = #bank_state{}) ->
    Res = case erlang:get(People) of
              undefined ->
                  false;
              V ->
                  case V >= Number of
                      true ->
                          erlang:put(People, V - Number),
                          V - Number;
                      false ->
                          false
                  end
          end,
    State1 = #bank_state{list=erlang:get()},
    {reply, Res, State1};
handle_call({check,People}, _From, _State = #bank_state{}) ->
    Res = case erlang:get(People) of
              undefined ->
                  false;
              V ->
                  V
          end,
    State1 = #bank_state{list=erlang:get()},
    {reply, Res, State1};

handle_call(_Request, _From, State = #bank_state{}) ->
    {reply, ok, State}.

handle_cast(_Request, State = #bank_state{}) ->
    {noreply, State}.

handle_info(_Info, State = #bank_state{}) ->
    {noreply, State}.

terminate(_Reason, _State = #bank_state{}) ->
    ok.

code_change(_OldVsn, State = #bank_state{}, _Extra) ->
    {ok, State}.




%%%===================================================================
%%% Internal functions
%%%===================================================================
