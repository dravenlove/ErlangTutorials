
-module(my_bank).
-export([start/0,stop/0,new_account/1,deposit/2,withdraw/2,init/1]).
-define(SERVER,bank).
-export([handle_call/3]).

start() ->gen_server:start_link({global,?SERVER},?MODULE,[],[]).
stop() ->gen_server:call(?MODULE,stop).

new_account(Who) -> gen_server:call(?MODULE,{new,Who}).
deposit(Who,Amount) ->gen_server:call(?MODULE,{add,Who,Amount}).
withdraw(Who,Amount) ->gen_server:call(?MODULE,{remove,Who,Amount}).

init([]) -> {ok,ets:new(?MODULE,[])}.

handle_call({new,Who},_From,Tab) ->
    Reply = case ets:lookup(Tab,Who) of
                [] -> ets:insert(Tab,{Who,0}),
                    {welcome,Who};
                [_] ->{Who,had_been_register}
            end,
    {reply,Reply,Tab};

handle_call({add,Who,X},_From,Tab) ->
    Reply = case ets:lookup(Tab,Who) of 
                [] -> 
                    no_this_people;
                [{Who,Balance}]->
                    Newbalance = Balance +X,
                    ets:insert(Tab,{Who,Newbalance}),
                    {thank,Who,balance,Newbalance}
            end,
    {reply,Reply,Tab};

handle_call({remove,Who,X},_From,Tab) ->
    Reply = case ets:lookup(Tab,Who) of 
                [] -> 
                    no_this_people;
                [{Who,Balance}]->
                    case Newbalance=Balance-X,
                         Newbalance>=0    of
                          true ->
                     {thank,Who,balance,Newbalance};
                         false ->
                    {sorry,Who,balance_no_enought}
                    end
            end,
    {reply,Reply,Tab}.