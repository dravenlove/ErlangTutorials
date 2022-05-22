%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_server.erl
%% Created on : 2019-05-05 21:04:47
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-06 22:03:49
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_server).
-author('glendy <ganby@163.com>').
-behaviour(gen_server).
-compile(inline).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-export([start/3, start/4, start_link/3, start_link/4, stop/1, sync_stop/1]).
-export([
  call/2,
  call/3,
  sync_apply/2,
  sync_apply/3,
  sync_apply/4,
  sync_status/2,
  sync_status/3,
  sync_status/4
]).
-export([
  cast/2,
  async_apply/2,
  async_apply/3,
  async_status/2,
  async_status/3
]).
-export([i/1, p/1]). %% 其他接口

-include("log.hrl").
-define(CALLBACK_MODULE, callback_module).

%%%=========================================================================
%%%  API
%%%=========================================================================
-callback do_init(Args :: term()) ->
  {ok, State :: term()} | {ok, State :: term(), timeout() | hibernate} |
  {stop, Reason :: term()} | ignore.

-callback do_db_init(State :: term(), Args :: term()) ->
  {noreply, NewState :: term()} |
  {noreply, NewState :: term(), timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: term()}.

-callback do_call(Request :: term(), From :: {pid(), Tag :: term()},
    State :: term()) ->
  {reply, Reply :: term(), NewState :: term()} |
  {reply, Reply :: term(), NewState :: term(), timeout() | hibernate} |
  {noreply, NewState :: term()} |
  {noreply, NewState :: term(), timeout() | hibernate} |
  {stop, Reason :: term(), Reply :: term(), NewState :: term()} |
  {stop, Reason :: term(), NewState :: term()}.
-callback do_cast(Request :: term(), State :: term()) ->
  {noreply, NewState :: term()} |
  {noreply, NewState :: term(), timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: term()}.
-callback do_info(Info :: timeout() | term(), State :: term()) ->
  {ok, NewState :: term()} |
  {noreply, NewState :: term()} |
  {noreply, NewState :: term(), timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: term()}.
-callback do_terminate(Reason :: (normal | shutdown | {shutdown, term()} |
term()),
    State :: term()) ->
  term().
-callback do_code_change(Info :: term(), State :: term()) ->
  {ok, NewState :: term()} |
  {noreply, NewState :: term()} |
  {noreply, NewState :: term(), timeout() | hibernate} |
  {stop, Reason :: term(), NewState :: term()}.


start(Mod, Args, Otps) ->
  gen_server:start(?MODULE, [Mod, Args], Otps).
start(Name, Mod, Args, Otps) ->
  gen_server:start(Name, ?MODULE, [Mod, Args], Otps).

start_link(Mod, Args, Otps) ->
  gen_server:start_link(?MODULE, [Mod, Args], Otps).
start_link(Name, Mod, Args, Otps) ->
  gen_server:start_link(Name, ?MODULE, [Mod, Args], Otps).

init([Mod, Args]) ->
  try
    put_callback_mod(Mod),
    InitRet = Mod:do_init(Args),
    cast(self(), {db_init, Args}),
    ?INFO("mod_server[~w] start", [Mod]),
    InitRet
  catch
    _:Reason ->
      ?WARNING("start ~w fail,Args:~w, ~n ~p ~n, Reason:~w", [Mod, Args, erlang:get_stacktrace(), Reason]),
      util:sleep(1000),
      {error, Reason}
  end.

handle_call(Info, From, State) ->
  try
    do_call(Info, From, State)
  catch
    _:Reason ->
      ?WARNING("~w error reason of do_call,Reason:~w,From:~w,Info:~w ~n ~p", [get_callback_mod(), Reason, From, Info, erlang:get_stacktrace()]),
      {reply, ok, State}
  end.

handle_cast(Info, State) ->
  try
    do_cast(Info, State)
  catch
    _:Reason ->
      ?WARNING("~w error reason of do_cast,Reason:~p,~n~p~n,Info:~w", [get_callback_mod(), Reason, erlang:get_stacktrace(), Info]),
      {noreply, State}
  end.

handle_info(Info, State) ->
  try
    do_info(Info, State)
  catch
    _:Reason ->
      ?WARNING("~w error reason of do_info,Reason:~w,Info:~w,~n~p", [get_callback_mod(), Reason, Info, erlang:get_stacktrace()]),
      {noreply, State}
  end.

terminate(Reason, State) ->
  Mod = get_callback_mod(),
  ?INFO("~w stop...", [Mod]),
  try
    Mod:do_terminate(Reason, State)
  catch
    _:Res -> ?INFO("stop ~p ERROR ~p, ~n ~p", [Mod, Res, erlang:get_stacktrace()])
  end,
  {stop, Reason, State}.

code_change(_OldVsn, State, _Extra) ->
  do_code_change(?MODULE, State).

do_code_change(_Mod, State) ->
  Mod = get_callback_mod(),
  ?INFO("code_change ~w", [Mod]),
  Mod:do_code_change(Mod, State).

%% 同步调用接口
do_call({sync_apply, Fun}, _From, State) ->
  Reply = Fun(),
  {reply, Reply, State};
do_call({sync_apply, Fun, Args}, _From, State) ->
  Reply = erlang:apply(Fun, Args),
  {reply, Reply, State};

%% 同步调用首参是进程状态State
do_call({sync_status, Fun}, _From, State) ->
  case Fun(State) of
    {ok, Reply, NewState} ->
      {reply, Reply, NewState};
    Reply ->
      {reply, Reply, State}
  end;
do_call({sync_status, Fun, Args}, _From, State) ->
  case erlang:apply(Fun, [State | Args]) of
    {ok, Reply, NewState} ->
      {reply, Reply, NewState};
    Reply ->
      {reply, Reply, State}
  end;

%% 同步获取进程的state
do_call(get_status, _From, State) ->
  {reply, State, State};

%% 同步停止进程
do_call(stop, _From, State) ->
  Mod = get_callback_mod(),
  ?INFO("SYNC STOP[~w]", [Mod]),
  {stop, normal, ok, State};

do_call(Info, From, State) ->
  Mod = get_callback_mod(),
  Mod:do_call(Info, From, State).

%% 异步调用接口
do_cast({async_apply, Fun}, State) ->
  Fun(),
  {noreply, State};
do_cast({async_apply, Fun, Args}, State) ->
  erlang:apply(Fun, Args),
  {noreply, State};

%% 异步调用接口，首参是进程状态State
do_cast({async_status, Fun}, State) ->
  case Fun(State) of
    {ok, NewState} ->
      {noreply, NewState};
    _ ->
      {noreply, State}
  end;
do_cast({async_status, Fun, Args}, State) ->
  case erlang:apply(Fun, [State | Args]) of
    {ok, NewState} ->
      {noreply, NewState};
    _ ->
      {noreply, State}
  end;

%% 异步停止进程
do_cast(stop, State) ->
  Mod = get_callback_mod(),
  ?INFO("cast STOP[~w]", [Mod]),
  {stop, normal, State};

%% 异步加载数据库
do_cast({db_init, Args}, State) ->
  Mod = get_callback_mod(),
  Mod:do_db_init(State, Args);

do_cast(Info, State) ->
  Mod = get_callback_mod(),
  Mod:do_cast(Info, State).

%% 处理停止进程的消息stop
do_info(stop, State) ->
  {stop, normal, State};

do_info(Info, State) ->
  Mod = get_callback_mod(),
  Mod:do_info(Info, State).

put_callback_mod(Mod) ->
  put(?CALLBACK_MODULE, Mod).
get_callback_mod() ->
  get(?CALLBACK_MODULE).

%% 同步发送消息
call(Pid, Msg) ->
  gen_server:call(Pid, Msg).
call(Pid, Msg, TimeOut) when is_integer(TimeOut) orelse TimeOut =:= infinity ->
  gen_server:call(Pid, Msg, TimeOut).

%% @doc 同步函数调用
sync_apply(Pid, Fun) ->
  call(Pid, {sync_apply, Fun}).
sync_apply(Pid, Fun, TimeOut) when is_integer(TimeOut) orelse TimeOut =:= infinity ->
  call(Pid, {sync_apply, Fun}, TimeOut);
sync_apply(Pid, Fun, Args) when is_list(Args) ->
  call(Pid, {sync_apply, Fun, Args}).
sync_apply(Pid, Fun, Args, TimeOut) when is_integer(TimeOut) orelse TimeOut =:= infinity ->
  call(Pid, {sync_apply, Fun, Args}, TimeOut).

sync_status(Pid, Fun) ->
  call(Pid, {sync_status, Fun}).
sync_status(Pid, Fun, TimeOut) when is_integer(TimeOut) orelse TimeOut =:= infinity ->
  call(Pid, {sync_status, Fun}, TimeOut);
sync_status(Pid, Fun, Args) when is_list(Args) ->
  call(Pid, {sync_status, Fun, Args}).
sync_status(Pid, Fun, Args, TimeOut) when is_integer(TimeOut) orelse TimeOut =:= infinity ->
  call(Pid, {sync_status, Fun, Args}, TimeOut).

%% @doc 同步停止进程
sync_stop(Pid) ->
  call(Pid, stop, infinity).

%% @doc 异步发送消息
cast(Pid, Msg) ->
  gen_server:cast(Pid, Msg).

%% 异步调用函数
async_apply(Pid, Fun) ->
  cast(Pid, {async_apply, Fun}).
async_apply(Pid, Fun, Args) ->
  cast(Pid, {async_apply, Fun, Args}).
async_status(Pid, Fun) ->
  cast(Pid, {async_status, Fun}).
async_status(Pid, Fun, Args) ->
  cast(Pid, {async_status, Fun, Args}).

%% @doc 停止进程 cast 方式
stop(Pid)->
  cast(Pid, stop).

%% @doc 调试接口,获取状态
i(Pid) ->
  call(Pid, get_status).
p(Pid) ->
  case i(Pid) of
    undefined ->
      undefined;
    State ->
      ?WARNING("~p", [tuple_to_list(State)])
  end.
