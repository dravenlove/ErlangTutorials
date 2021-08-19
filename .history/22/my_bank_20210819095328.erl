
-module(my_bank).
-export([start/0,stop/0,new_account/1,deposit/2,withdraw/2]).

start() ->gen_server:start_link({local,?SERVER}

stop() ->gen_server:call(?MODULE,stop).