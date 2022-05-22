%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_merge_mongodb
%%% Created on : 2020/10/16 15:50
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_merge_mongodb).
-author("glendy").
-include("common.hrl").
-include("merge.hrl").

-export([start_link/1, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_process_name/1,
	get_pid/1,
	start/0,
	stop/0
]).

get_process_name(Index0) ->
	Index  =
		if
			Index0 > 0 -> (Index0 - 1) rem pool_size() + 1;
			true -> 1
		end,
	lib_types:to_atom("merge_mongodb_" ++ lib_types:to_list(Index)).

get_pid(Index) ->
	ProcessName = get_process_name(Index),
	whereis(ProcessName).

pool_size() ->
	config:merge_mongo_pool_size().

start() ->
	start(pool_size()).
start(Size) when Size =< 0 ->
	ok;
start(Size) ->
	ProcessName = get_process_name(Size),
	server_sup:start_child(ProcessName, mod_merge_mongodb, start_link, [Size], transient),
	start(Size - 1).

start_link(Index) ->
	ProcessName = get_process_name(Index),
%%	?DEBUG("merge_mongo start: ~p", [ProcessName]),
	mod_server:start_link({local, ProcessName}, ?MODULE, [Index], []).

stop() ->
	stop(pool_size()).
stop(Size) when Size =< 0 ->
	ok;
stop(Size) ->
	ProcessName = get_process_name(Size),
	mod_server:sync_stop(ProcessName),
	?DEBUG("merge_mongo stop: ~p", [ProcessName]),
	stop(Size - 1).

do_init([Index]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(10 * 1000, self(), second_timer),
	State0 = init_mongo_args(#merge_mongo_state{index = Index}),
	State = check_all_mongo_reconnect(State0),
	{ok, State}.

do_db_init(State, _IndexList) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.


do_info(second_timer, State) ->
	erlang:send_after(1000, self(), second_timer),
	NewState = check_all_mongo_reconnect(State),
	{noreply, NewState};
do_info({'EXIT', _Pid, normal}, State) ->
	{noreply, State};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init_mongo_args(State) ->
	MasterConf = config:merge_master(),
	{MasterMMO, MasterBackStage} = init_mongo_args_by_conf(MasterConf),
	State1 = State#merge_mongo_state{
		master_mmo = MasterMMO,
		master_backstage = MasterBackStage
	},
	SlaveConf = config:merge_slave(),
	init_slave_mongo_args_by_conf(State1, SlaveConf).

init_mongo_args_by_conf(Conf) ->
	[IP, Port, MMO, BackStage] = Conf,
	{
		#{
			conn => undefined,
			is_close => true,
			mongoargs=> [
				{host, IP},
				{port, Port},
				{database, MMO}
			]
		},
		#{
			conn => undefined,
			is_close => true,
			mongoargs=> [
				{host, IP},
				{port, Port},
				{database, BackStage}
			]
		}
	}.

init_slave_mongo_args_by_conf(State, []) ->
	State;
init_slave_mongo_args_by_conf(State, [Conf | T]) ->
	Slave = init_mongo_args_by_conf(Conf),
	NewState = State#merge_mongo_state{
		slave = [Slave | State#merge_mongo_state.slave]
	},
	init_slave_mongo_args_by_conf(NewState, T).

connect_mongodb(MongoArgs) ->
	try
		case mc_worker_api:connect(MongoArgs) of
			{ok, Connection} ->
				Connection;
			{error, Reason} ->
				?INFO("mongo connect error: ~p", [Reason]),
				undefined
		end
	catch
		_:TryReason ->
			?ERROR("mongo connect exception: ~w", [TryReason]),
			undefined
	end.

check_all_mongo_reconnect(State) ->
	MasterMMO = check_mongo_reconnect(State#merge_mongo_state.master_mmo),
	MasterBack = check_mongo_reconnect(State#merge_mongo_state.master_backstage),
	SlaveList = lists:foldr(
		fun({SlaveMMO0, SlaveBack0}, AccSlaveList0) ->
			SlaveMMO1 = check_mongo_reconnect(SlaveMMO0),
			SlaveBack1 = check_mongo_reconnect(SlaveBack0),
			[{SlaveMMO1, SlaveBack1} | AccSlaveList0]
		end, [], State#merge_mongo_state.slave),
	State#merge_mongo_state{
		master_mmo = MasterMMO,
		master_backstage = MasterBack,
		slave = SlaveList
	}.

check_mongo_reconnect(MongoArgMap) ->
	#{conn:=Connection, is_close:=IsClose, mongoargs:=MongoArgs} = MongoArgMap,
	IsPid = (erlang:is_pid(Connection) andalso erlang:is_process_alive(Connection)),
	if
		IsClose =:= true orelse IsPid =:= false ->
			if
				IsPid =:= true -> mc_worker_api:disconnect(Connection);
				true -> skip
			end,
			case connect_mongodb(MongoArgs) of
				undefined ->
					MongoArgMap#{
						conn => undefined,
						is_close => true
					};
				NewConnection ->
%%					?INFO("reconnect mongodb: ~p ~p", [MongoArgs, Connection]),
					MongoArgMap#{
						conn => NewConnection,
						is_close => false
					}
			end;
		true -> MongoArgMap
	end.
