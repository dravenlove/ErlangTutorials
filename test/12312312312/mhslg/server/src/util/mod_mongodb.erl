%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_mongodb
%%% Created on : 2020/5/11 0011 14:37
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_mongodb).
-behaviour(mod_server).
-author("glendy").
-include("log.hrl").
-include("mongodb.hrl").

-export([start_link/1, start_link/2, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	start/1, start/2,
	stop/1, stop/2,
%%	get_child_spec_list/2,
	get_process_name/2,
	insert/3, insert/4, do_insert/4,
	update/4, update/6, do_update/6,
	update_no_block/4, update_no_block/6,
	async_update/4, async_update/6, async_update/9, do_async_update/9,
	delete/3, delete_one/3, do_delete/4,
	async_delete/3, async_delete_one/3, async_delete/7, do_async_delete/7,
	find_one/3, do_find_one/3,
	async_find_one/3, async_find_one/6, do_async_find_one/6,
	find/3, find/5, find/6, do_find/5,
	async_find/3, async_find/5, async_find/8, do_async_find/8,
	ensure_index/3, do_ensure_index/3,
	async_ensure_index/3, async_ensure_index/6, do_async_ensure_index/6,
	count/3, do_count/3,
	async_count/3, async_count/6, do_async_count/6
]).

-define(MAX_WAIT_OP, 100).	%% 每次定时处理的最大操作数
-define(MONGO_WAIT_OP_LIST, mongo_wait_op_list).	%% 等待操作的列表
-define(POOL_IDX_TO_ATOM(PoolName, Index), {pool_idx_to_atom, PoolName, Index}).
-define(MONGO_ERROR_TRY_TIMES, 3).

get_process_name(PoolName, Index) ->
	case erlang:get(?POOL_IDX_TO_ATOM(PoolName, Index)) of
		undefined ->
			Atom = lib_types:to_atom(lib_types:to_list(PoolName) ++ lib_types:to_list(Index)),
			erlang:put(?POOL_IDX_TO_ATOM(PoolName, Index), Atom),
			Atom;
		Val -> Val
	end.

%%get_child_spec_list(PoolName, Size) ->
%%	get_child_spec_list([], PoolName, Size).
%%get_child_spec_list(ChildSpecList, _PoolName, Size) when Size =< 0 ->
%%	ChildSpecList;
%%get_child_spec_list(ChildSpecList, PoolName, Size) ->
%%	ProcessName = get_process_name(PoolName, Size),
%%	ChildSpec = ?CHILD_SPEC_MONGO(ProcessName, ?MODULE, [PoolName, Size]),
%%	get_child_spec_list([ChildSpec | ChildSpecList], PoolName, Size - 1).

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

start(PoolName) ->
	PoolSize = mongo_poolboy:get_mongo_pool_size(PoolName),
	process_start(PoolName, PoolSize),
	ok.

process_start(_PoolName, CurSize) when CurSize =< 0 ->
	ok;
process_start(PoolName, CurSize) ->
	start(PoolName, CurSize),
	process_start(PoolName, CurSize - 1).

start(PoolName, Index) ->
	ProcessName = get_process_name(PoolName, Index),
	mod_server:start({local, ProcessName}, ?MODULE, [PoolName, Index], []).

stop(PoolName) ->
	PoolSize = mongo_poolboy:get_mongo_pool_size(PoolName),
	process_stop(PoolName, PoolSize),
	ok.

process_stop(_PoolName, CurSize) when CurSize =< 0 ->
	ok;
process_stop(PoolName, CurSize) ->
	stop(PoolName, CurSize),
	process_stop(PoolName, CurSize - 1).

stop(PoolName, Index) ->
	ProcessName = get_process_name(PoolName, Index),
	mod_server:sync_stop(ProcessName).
%%	mod_server:sync_stop(ProcessName),
%%	server_sup:stop_child(ProcessName).

start_link(PoolName) ->
	PoolSize = mongo_poolboy:get_mongo_pool_size(PoolName),
	process_start_link(PoolName, PoolSize),
	ok.
process_start_link(_PoolName, CurSize) when CurSize =< 0 ->
	ok;
process_start_link(PoolName, CurSize) ->
	ProcessName = get_process_name(PoolName, CurSize),
	server_sup:start_child(ProcessName, ?MODULE, start_link, [PoolName, CurSize], transient),
%%	start_link(PoolName, CurSize),
	process_start_link(PoolName, CurSize - 1).
start_link(PoolName, Index) ->
	ProcessName = get_process_name(PoolName, Index),
	mod_server:start_link({local, ProcessName}, ?MODULE, [PoolName, Index], []).

do_init([PoolName, Index]) ->
	?INFO("mod_mongodb start: ~p ~p", [PoolName, Index]),
	erlang:system_flag(fullsweep_after, 10),
	erlang:send_after(10 * 1000, self(), second_timer),
	MongoArgs = get_mongo_options(PoolName),
	case connect_mongodb(MongoArgs) of
		undefined -> {ok, #mongo_state{is_close = true, mongoargs = MongoArgs}};
		Connection ->
			{ok, #mongo_state{conn = Connection, is_close = false, mongoargs = MongoArgs}}
	end.

do_db_init(State, _Args) ->
	{noreply, State}.

do_cast(Info, State) ->
	?ERROR("no mongo cast req: ~p", [Info]),
	{noreply, State}.

do_call(Info, _From, State) ->
	?ERROR("no mongo call req: ~p", [Info]),
	{reply,State,State}.

do_info(second_timer, State) ->
	erlang:send_after(1000, self(), second_timer),
	NewState1 = check_mongo_reconnect(State),
	process_op_list(NewState1),
	{noreply, NewState1};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, State) ->
	Len = length(get_wait_operate_list()),
	#mongo_state{conn = Connection} = process_op_list(State, max(?MAX_WAIT_OP, Len), get_wait_operate_list()),
	if
		Connection =/= undefined ->
			?INFO("diconnect mongodb: ~p", [Connection]),
			mc_worker_api:disconnect(Connection);
		true -> skip
	end,
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

get_mongo_options(?MMO_POOL) ->
	[
		{host, config:mongo_host()},
		{port, config:mongo_port()},
		{database, config:mongo_mmo_db()}
	];
get_mongo_options(?BACK_POOL) ->
	[
		{host, config:mongo_host()},
		{port, config:mongo_port()},
		{database, config:mongo_back_db()}
	];
get_mongo_options(_PoolName) ->
	throw({error, no_recoginze_pool_name}).

get_wait_operate_list() ->
	case erlang:get(?MONGO_WAIT_OP_LIST) of
		undefined -> [];
		Val -> Val
	end.

put_wait_operate_list(List) ->
	erlang:put(?MONGO_WAIT_OP_LIST, List).

append_wait_operate_list(WaitOp) ->
	List = get_wait_operate_list(),
	put_wait_operate_list(List ++ [WaitOp]).

check_mongo_reconnect(#mongo_state{conn = Connection, is_close = IsClose, mongoargs = MongoArgs} = State) ->
	IsPid = (erlang:is_pid(Connection) andalso erlang:is_process_alive(Connection)),
	if
		IsClose =:= true orelse IsPid =:= false ->
			if
				IsPid =:= true -> mc_worker_api:disconnect(Connection);
				true -> skip
			end,
			case connect_mongodb(MongoArgs) of
				undefined -> State#mongo_state{conn = undefined, is_close = true};
				NewConnection ->
					?INFO("reconnect mongodb: ~p ~p", [MongoArgs, Connection]),
					State#mongo_state{conn = NewConnection, is_close = false}
			end;
		true -> State
	end.

process_op_list(State) ->
	process_op_list(State, ?MAX_WAIT_OP, get_wait_operate_list()).
process_op_list(State, _MaxOpSize, []) ->
	State;
process_op_list(State, MaxOpSize, [WaitOp | T])->
	put_wait_operate_list(T),
	NewState = process_mongo_operate(State, WaitOp),
	if
		MaxOpSize =< 1 -> NewState;
		true -> process_op_list(NewState, MaxOpSize - 1, T)
	end.

process_mongo_operate(#mongo_state{conn = Connection} = State, {insert, Coll, Docs, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		Res = mc_worker_api:insert(Connection, Coll, Docs, {<<"w">>, 1}),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async insert error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES ->
					NewWaitOp = {insert, Coll, Docs, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(#mongo_state{conn = Connection} = State, {update, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		Res = mc_worker_api:update(Connection, Coll, Selector, Doc, Upsert, MultiUpdate),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async update error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES ->
					NewWaitOp = {update, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(#mongo_state{conn = Connection} = State, {delete, Coll, Selector, N, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		Res = mc_worker_api:delete_limit(Connection, Coll, Selector, N),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async delete error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES->
					NewWaitOp = {delete, Coll, Selector, N, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(#mongo_state{conn = Connection} = State, {find_one, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		Bson = mc_worker_api:find_one(Connection, Coll, Selector),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Bson)
	catch
		_:Reason ->
			?ERROR("mongo async find_one error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES ->
					NewWaitOp = {find_one, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(#mongo_state{conn = Connection} = State, {find, Coll, Selector, Skip, BatchSize, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		{ok, Cursor} = mc_worker_api:find(Connection, Coll, Selector, #{skip => Skip, batchsize => BatchSize}),
		BsonList =
			if
				BatchSize > 0 -> mc_cursor:take(Cursor, BatchSize);
				true -> mc_cursor:rest(Cursor)
			end,
		mc_cursor:close(Cursor),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, BsonList)
	catch
		_:Reason ->
			?ERROR("mongo async find error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES ->
					NewWaitOp = {find, Coll, Selector, Skip, BatchSize, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(#mongo_state{conn = Connection} = State, {ensure_index, Coll, IndexSpec, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		Res = mc_worker_api:ensure_index(Connection, Coll, IndexSpec),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async ensure_index error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES ->
					NewWaitOp = {ensure_index, Coll, IndexSpec, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(#mongo_state{conn = Connection} = State, {count, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs, RunTimes}) ->
	try
		Count = mc_worker_api:count(Connection, Coll, Selector),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Count)
	catch
		_:Reason ->
			?ERROR("mongo async count error: ~p", [Reason]),
			if
				RunTimes =< ?MONGO_ERROR_TRY_TIMES ->
					NewWaitOp = {count, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs, RunTimes + 1},
					append_wait_operate_list(NewWaitOp);
				true -> skip
			end
	end,
	State;
process_mongo_operate(State, WaitOp) ->
	?ERROR("no mongo operate: ~w ~n", [WaitOp]),
	State.

async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res) ->
	IsPid = (erlang:is_pid(CallbackPid) andalso erlang:is_process_alive(CallbackPid)),
	NewCallbackArgs =
		if
			is_list(CallbackArgs) -> [Res | CallbackArgs];
			true -> CallbackArgs
		end,
	if
		IsPid =:= true andalso CallbackFunc =/= undefined andalso erlang:is_list(NewCallbackArgs) =:= true ->
			try
				mod_server:async_apply(CallbackPid, CallbackFunc, NewCallbackArgs)
			catch
			    _:Reason ->
					?ERROR("async callback[~p ~p:~p(~w)]: reason ~w ~n ~p", [CallbackPid, CallbackFunc, NewCallbackArgs, Reason, erlang:get_stacktrace()])
			end;
		true -> skip
	end.

%% 同步阻塞的数据库插入操作
insert(WorkerPid, Coll, Docs) ->
	insert(WorkerPid, Coll, Docs, {<<"w">>, 1}).
insert(WorkerPid, Coll, Docs, WC) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_insert/4, [Coll, Docs, WC], ?DEFAULT_MONGO_TIMEOUT).
do_insert(#mongo_state{conn = Connection}, Coll, Docs, WC) ->
	mc_worker_api:insert(Connection, Coll, Docs, WC).

%% 同步阻塞的数据库更新操作
update(WorkerPid, Coll, Selector, Doc) ->
	update(WorkerPid, Coll, Selector, Doc, true, false).
update(WorkerPid, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_update/6, [Coll, Selector, Doc, Upsert, MultiUpdate], ?DEFAULT_MONGO_TIMEOUT).
do_update(#mongo_state{conn = Connection}, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	mc_worker_api:update(Connection, Coll, Selector, Doc, Upsert, MultiUpdate).

%% 异步的数据库更新操作
update_no_block(WorkerPid, Coll, Selector, Doc) ->
	async_update(WorkerPid, Coll, Selector, Doc).
update_no_block(WorkerPid, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	async_update(WorkerPid, Coll, Selector, Doc, Upsert, MultiUpdate).

%% 异步的数据库更新操作
async_update(WorkerPid, Coll, Selector, Doc) ->
	async_update(WorkerPid, Coll, Selector, Doc, true, false).
async_update(WorkerPid, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	async_update(WorkerPid, Coll, Selector, Doc, Upsert, MultiUpdate, undefined, undefined, []).
async_update(WorkerPid, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackFunc, CallbackArgs) ->
	mod_server:async_status(WorkerPid, fun mod_mongodb:do_async_update/9, [Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackFunc, CallbackArgs]).
do_async_update(#mongo_state{conn = Connection}, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackFunc, CallbackArgs) ->
	try
		Res = mc_worker_api:update(Connection, Coll, Selector, Doc, Upsert, MultiUpdate),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async update error: ~p", [Reason]),
			WaitOp = {update, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackFunc, CallbackArgs, 1},
			append_wait_operate_list(WaitOp)
	end,
	ok.

%% 同步阻塞的数据库删除操作
delete(WorkerPid, Coll, Selector) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_delete/4, [Coll, Selector, 0], ?DEFAULT_MONGO_TIMEOUT).
%% 同步阻塞的数据库删除单条记录操作
delete_one(WorkerPid, Coll, Selector) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_delete/4, [Coll, Selector, 1], ?DEFAULT_MONGO_TIMEOUT).
do_delete(#mongo_state{conn = Connection}, Coll, Selector, N) ->
	mc_worker_api:delete_limit(Connection, Coll, Selector, N).

%% 异步的数据库删除操作
async_delete(WorkerPid, Coll, Selector) ->
	async_delete(WorkerPid, Coll, Selector, 0, undefined, undefined, []).
async_delete_one(WorkerPid, Coll, Selector) ->
	async_delete(WorkerPid, Coll, Selector, 1, undefined, undefined, []).
async_delete(WorkerPid, Coll, Selector, N, CallbackPid, CallbackFunc, CallbackArgs) ->
	mod_server:async_status(WorkerPid, fun mod_mongodb:do_async_delete/7, [Coll, Selector, N, CallbackPid, CallbackFunc, CallbackArgs]).
do_async_delete(#mongo_state{conn = Connection}, Coll, Selector, N, CallbackPid, CallbackFunc, CallbackArgs) ->
	try
		Res = mc_worker_api:delete_limit(Connection, Coll, Selector, N),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async delete error: ~p", [Reason]),
			WaitOp = {delete, Coll, Selector, N, CallbackPid, CallbackFunc, CallbackArgs, 1},
			append_wait_operate_list(WaitOp)
	end,
	ok.

%% 同步阻塞的数据库查找单条记录操作
find_one(WorkerPid, Coll, Selector) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_find_one/3, [Coll, Selector], ?DEFAULT_MONGO_TIMEOUT).
do_find_one(#mongo_state{conn = Connection}, Coll, Selector) ->
	mc_worker_api:find_one(Connection, Coll, Selector).

%% 异步的数据库查找单条记录操作
async_find_one(WorkerPid, Coll, Selector) ->
	async_find_one(WorkerPid, Coll, Selector, undefined, undefined, []).
async_find_one(WorkerPid, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs) ->
	mod_server:async_status(WorkerPid, fun mod_mongodb:do_async_find_one/6, [Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs]).
do_async_find_one(#mongo_state{conn = Connection}, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs) ->
	try
		Bson = mc_worker_api:find_one(Connection, Coll, Selector),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Bson)
	catch
		_:Reason ->
			?ERROR("mongo async find_one error: ~p", [Reason]),
			WaitOp = {find_one, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs, 1},
			append_wait_operate_list(WaitOp)
	end,
	ok.

%% 同步阻塞的数据库查找所有记录操作
find(WorkerPid, Coll, Selector) ->
	find(WorkerPid, Coll, Selector, 0, 0).
find(WorkerPid, Coll, Selector, Skip, BatchSize) ->
	find(WorkerPid, Coll, Selector, Skip, BatchSize, ?DEFAULT_MONGO_TIMEOUT).
find(WorkerPid, Coll, Selector, Skip, BatchSize, Timeout) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_find/5, [Coll, Selector, Skip, BatchSize], Timeout).
do_find(#mongo_state{conn = Connection}, Coll, Selector, Skip, BatchSize) ->
	try
		{ok, Cursor} = mc_worker_api:find(Connection, Coll, Selector, #{skip => Skip, batchsize => BatchSize}),
		BsonList =
			if
				BatchSize > 0 -> mc_cursor:take(Cursor, BatchSize);
				true -> mc_cursor:rest(Cursor)
			end,
		mc_cursor:close(Cursor),
		BsonList
	catch
		_:_Reason -> []
	end.

async_find(WorkerPid, Coll, Selector) ->
	async_find(WorkerPid, Coll, Selector, 0, 0).
async_find(WorkerPid, Coll, Selector, Skip, BatchSize) ->
	async_find(WorkerPid, Coll, Selector, Skip, BatchSize, undefined, undefined, []).
async_find(WorkerPid, Coll, Selector, Skip, BatchSize, CallbackPid, CallbackFunc, CallbackArgs) ->
	mod_server:async_status(WorkerPid, fun mod_mongodb:do_async_find/8, [Coll, Selector, Skip, BatchSize, CallbackPid, CallbackFunc, CallbackArgs]).
do_async_find(#mongo_state{conn = Connection}, Coll, Selector, Skip, BatchSize, CallbackPid, CallbackFunc, CallbackArgs) ->
	BsonList =
		try
			{ok, Cursor} = mc_worker_api:find(Connection, Coll, Selector, #{skip => Skip, batchsize => BatchSize}),
			BsonList0 =
				if
					BatchSize > 0 -> mc_cursor:take(Cursor, BatchSize);
					true -> mc_cursor:rest(Cursor)
				end,
			mc_cursor:close(Cursor),
			BsonList0
		catch
			_:_Reason -> []
		end,
	async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, BsonList),
	ok.

%% 同步阻塞建立索引
ensure_index(WorkerPid, Coll, IndexSpec) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_ensure_index/3, [Coll, IndexSpec], ?DEFAULT_MONGO_TIMEOUT).
do_ensure_index(#mongo_state{conn = Connection}, Coll, IndexSpec) ->
	mc_worker_api:ensure_index(Connection, Coll, IndexSpec).

%% 异步建立索引
async_ensure_index(WorkerPid, Coll, IndexSpec) ->
	async_ensure_index(WorkerPid, Coll, IndexSpec, undefined, undefined, []).
async_ensure_index(WorkerPid, Coll, IndexSpec, CallbackPid, CallbackFunc, CallbackArgs) ->
	mod_server:async_status(WorkerPid, fun mod_mongodb:do_async_ensure_index/6, [Coll, IndexSpec, CallbackPid, CallbackFunc, CallbackArgs]).
do_async_ensure_index(#mongo_state{conn = Connection}, Coll, IndexSpec, CallbackPid, CallbackFunc, CallbackArgs) ->
	try
		Res = mc_worker_api:ensure_index(Connection, Coll, IndexSpec),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Res)
	catch
		_:Reason ->
			?ERROR("mongo async ensure_index error: ~p", [Reason]),
			WaitOp = {ensure_index, Coll, IndexSpec, CallbackPid, CallbackFunc, CallbackArgs, 1},
			append_wait_operate_list(WaitOp)
	end,
	ok.

%% 同步阻塞取数据库记录数
count(WorkerPid, Coll, Selector) ->
	mod_server:sync_status(WorkerPid, fun mod_mongodb:do_count/3, [Coll, Selector], ?DEFAULT_MONGO_TIMEOUT).
do_count(#mongo_state{conn = Connection}, Coll, Selector) ->
	mc_worker_api:count(Connection, Coll, Selector).

%% 异步取数据库记录数
async_count(WorkerPid, Coll, Selector) ->
	async_count(WorkerPid, Coll, Selector, undefined, undefined, []).
async_count(WorkerPid, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs) ->
	mod_server:async_status(WorkerPid, fun mod_mongodb:do_async_count/6, [Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs]).
do_async_count(#mongo_state{conn = Connection}, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs) ->
	try
		Count = mc_worker_api:count(Connection, Coll, Selector),
		async_callback_func(CallbackPid, CallbackFunc, CallbackArgs, Count)
	catch
		_:Reason ->
			?ERROR("mongo async count error: ~p", [Reason]),
			WaitOp = {count, Coll, Selector, CallbackPid, CallbackFunc, CallbackArgs, 1},
			append_wait_operate_list(WaitOp)
	end,
	ok.
