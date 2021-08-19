-module().

-behaviour(gen_server).

-define(SERVER,server).

-export([start_link/0]).

-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2,code_change/3]).

start_link() -> gen_server:start_link({local,?SERVER},?MODULE,[],[]).
init([]) ->{ok,State}.

