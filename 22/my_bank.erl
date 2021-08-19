%%1.start() -> gen_server:start_link({local, my_blank}, ?MODULE, [], []).
%%   第一个参数指定服务器访问访问范围，若为local则是创建一个本地服务器，若为global,则创建一个可以被节点集群访问的全局服务器，my_blank是服务器名字，?MODULE指定服务器的回调模块名，什么是回调，就是一个函数调用另一个函数，在gen_server中call会调用handle_call,cast会调用handle_cast等，start最后会调用回调模板的init()函数。

%%2.init([]) -> {ok, State}.
%%很明显这是一个初始化函数，当我们调用start_link()时，会以这个函数为返回结果，并以State为我们服务器的初始状态，它可以用来标示一个列表，一个ETS,DETS，MNESIA的标识符，这样我们旧可以通过标识符调用相应的ETS表，很是方便。

%%3. handle_call({A..},From,State) -> {reply,Reply,NewState}.
%%这个是call的回调函数，只要第一个参数和call的第二个参数相匹配，就调用，然后返回结果的第二个参数代表所返回的值，第三个相当于一个新的状态。

%%4.handle_cast(_Msg, State) -> {noreply, State}.
%%handle_cast是异步的，它只是一种用于信息通讯，告知服务器信息，没有返回结果。


-module(my_bank).
-export([start/0,stop/0,new_account/1,deposit/2,withdraw/2,init/1,handle_cast/2,handle_info/2,terminate/2,code_change/3]).
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
                    Newbalance=Balance-X,
                    case Newbalance>=0 of
                          true ->
                     {thank,Who,balance,Newbalance};
                         false ->
                    {sorry,Who,balance_no_enought}
                    end
            end,
    {reply,Reply,Tab};

handle_call(stop,_From,Tab) ->
    {stop,normal,stopped,Tab}.

handle_cast(_Msg,State) -> {noreply,State}.
handle_info(_Info,State) -> {noreply,State}.
terminate(_Reason,_State) -> ok.
code_change(_OldVsn,State,Extra) -> {ok,State}.
