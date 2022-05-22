%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: game_server_sup
%%% Created on : 2020/7/29 0029 17:46
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(server_sup).
-author("glendy").
-include("mysql.hrl").

%% API
-export([]).

-behaviour(supervisor).

%% API
-export([
	start_link/0,
	start_child/4,
	start_child/5,
	stop_child/1,
	delete_child/1
]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).
-define(CHILD_SPEC_NAME(RegName, Mod, StartFunc, Args), {RegName, {Mod, StartFunc, Args}, temporary, infinity, worker, [Mod]}).
-define(CHILD_SPEC_NAME_TYPE(RegName, Mod, StartFunc, Args, Type), {RegName, {Mod, StartFunc, Args}, Type, infinity, worker, [Mod]}).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_child(RegName, Mod, StartFunc, Args) ->
	supervisor:start_child(?MODULE, ?CHILD_SPEC_NAME(RegName, Mod, StartFunc, Args)).
start_child(RegName, Mod, StartFunc, Args, Type) ->
	supervisor:start_child(?MODULE, ?CHILD_SPEC_NAME_TYPE(RegName, Mod, StartFunc, Args, Type)).

stop_child(RegName) ->
	supervisor:terminate_child(?MODULE, RegName).

delete_child(RegName) ->
	supervisor:delete_child(?MODULE, RegName).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, {SupFlags :: {RestartStrategy :: supervisor:strategy(),
		MaxR :: non_neg_integer(), MaxT :: non_neg_integer()},
		[ChildSpec :: supervisor:child_spec()]
	}} |
	ignore |
	{error, Reason :: term()}).
init([]) ->
	RestartStrategy = one_for_one,
	MaxRestarts = 1000,
	MaxSecondsBetweenRestarts = 3600,
	SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

%%	Restart = permanent,
%%	Shutdown = 2000,
%%	Type = worker,
%%	AChild = {'AName', {'AModule', start_link, []},
%%		Restart, Shutdown, Type, ['AModule']},
	SpecChildList = [mysql_poolboy:child_spec(?SERIALDB_POOL, config:mysql_serial_pool_options(), config:mysql_serial_options())],

	{ok, {SupFlags, SpecChildList}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
