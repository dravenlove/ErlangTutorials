
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
    