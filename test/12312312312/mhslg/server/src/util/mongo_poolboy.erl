%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mongo_poolboy.erl
%% Created on : 2019-05-10 14:24:52
%% Author: glendy ganby@163.com
%% Last Modified: 2019-05-10 20:20:17
%% Description:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mongo_poolboy).
-include("mongodb.hrl").
-include("log.hrl").
-export([
	get_mongo_pool_size/1,
	insert/3, insert/4,
	update/4, update/6,
%%	update_no_block/4, update_no_block/6, update_no_block/10,
	async_update/4, async_update/6, async_update/10,
	delete/3, async_delete/3, delete_one/3, async_delete_one/3,
	find_one/3,
	find/3, find/5,
	async_find/8,
	ensure_index/3,
	ensure_index/4,
	async_ensure_index/3,
	async_ensure_index/4,
	count/3,
	transaction/3,
	check_and_start_mongo/1
]).

-define(MONGO_AUTO_INDEX, mongo_auto_index).
-define(MONGO_POOL_SIZE(Pool), {mongo_pool_size, Pool}).

get_mongo_auto_index() ->
	case erlang:get(?MONGO_AUTO_INDEX) of
		undefined -> lib_random:rand(50);
		Val -> Val
	end.

get_mongo_pool_size(PoolName) ->
	case erlang:get(?MONGO_POOL_SIZE(PoolName)) of
		undefined ->
			Size =
				case PoolName of
					?MMO_POOL -> config:mmo_pool_size();
					?BACK_POOL -> config:backstage_pool_size();
					_ -> 5
				end,
			erlang:put(?MONGO_POOL_SIZE(PoolName), Size),
			Size;
		Val -> Val
	end.

get_mongo_pname(PoolName) ->
	Index = get_mongo_auto_index(),
	PoolSize = get_mongo_pool_size(PoolName),
	Val = Index rem PoolSize + 1,
	erlang:put(?MONGO_AUTO_INDEX, (Index rem 1023 + 1)),
	{mod_mongodb:get_process_name(PoolName, Val), PoolName, Val}.

insert(PoolName, Coll, Docs) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:insert(ProcessName, Coll, Docs).

insert(PoolName, Coll, Docs, WC) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:insert(ProcessName, Coll, Docs, WC).

%% 更新mongo记录
update(PoolName, Coll, Selector, Doc) ->
    update(PoolName, Coll, Selector, Doc, true, false).

%% 更新mongo记录
%% Upsert -> true | false 记录不存在时是否插入;
%% MultiUpdate -> true | false 是否要更新多条记录
update(PoolName, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:update(ProcessName, Coll, Selector, Doc, Upsert, MultiUpdate).

%%%% 异步更新数据库
%%update_no_block(PoolName, Coll, Selector, Doc) ->
%%	update_no_block(PoolName, Coll, Selector, Doc, true, false).
%%update_no_block(PoolName, Coll, Selector, Doc, Upsert, MultiUpdate) ->
%%	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
%%	mod_mongodb:async_update(ProcessName, Coll, Selector, Doc, Upsert, MultiUpdate).
%%update_no_block(PoolName, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackMod, CallbackFunc, CallbackArgs) ->
%%	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
%%	mod_mongodb:async_update(ProcessName, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackMod, CallbackFunc, CallbackArgs).

%% 异步更新数据库
async_update(PoolName, Coll, Selector, Doc) ->
	async_update(PoolName, Coll, Selector, Doc, true, false).
async_update(PoolName, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:async_update(ProcessName, Coll, Selector, Doc, Upsert, MultiUpdate).
async_update(PoolName, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackMod, CallbackFunc, CallbackArgs) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:async_update(ProcessName, Coll, Selector, Doc, Upsert, MultiUpdate, CallbackPid, CallbackMod, CallbackFunc, CallbackArgs).

delete(PoolName, Coll, Selector) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
    mod_mongodb:delete(ProcessName, Coll, Selector).
async_delete(PoolName, Coll, Selector) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:async_delete(ProcessName, Coll, Selector).

delete_one(PoolName, Coll, Selector) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:delete_one(ProcessName, Coll, Selector).
async_delete_one(PoolName, Coll, Selector) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:async_delete_one(ProcessName, Coll, Selector).

find_one(PoolName, Coll, Selector) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
    mod_mongodb:find_one(ProcessName, Coll, Selector).

find(PoolName, Coll, Selector) ->
    find(PoolName, Coll, Selector, 0, 0).
find(PoolName, Coll, Selector, Skip, BatchSize) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
    mod_mongodb:find(ProcessName, Coll, Selector, Skip, BatchSize).

async_find(PoolName, Coll, Selector, Skip, BatchSize, CallBackPid, CallBackFun, CallBackArg) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:async_find(ProcessName, Coll, Selector, Skip, BatchSize, CallBackPid, CallBackFun, CallBackArg).

ensure_index(PoolName, Coll, IndexFields) ->
	ensure_index(PoolName, Coll, IndexFields, false).
ensure_index(PoolName, Coll, IndexFields, Unique) ->
	IndexSpec = #{<<"key">> => IndexFields, <<"unique">> => Unique},
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:ensure_index(ProcessName, Coll, IndexSpec).

async_ensure_index(PoolName, Coll, IndexFields) ->
	async_ensure_index(PoolName, Coll, IndexFields, false).
async_ensure_index(PoolName, Coll, IndexFields, Unique) ->
	IndexSpec = #{<<"key">> => IndexFields, <<"unique">> => Unique},
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:async_ensure_index(ProcessName, Coll, IndexSpec).

count(PoolName, Coll, Selector) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	mod_mongodb:count(ProcessName, Coll, Selector).

%% 批量处理mongo数据库操作的请求
transaction(PoolName, TransactionFun, Args) when is_function(TransactionFun, 2) ->
	ProcessName = check_and_start_mongo(get_mongo_pname(PoolName)),
	TransactionFun(ProcessName, Args).

%% 支持热更调大数据库池大小
check_and_start_mongo({ProgressName, PoolName, Index}) ->
	Pid = erlang:whereis(ProgressName),
	case (erlang:is_pid(Pid) andalso erlang:is_process_alive(Pid)) of
		true -> ProgressName;
		_ ->
			mod_mongodb:start(PoolName, Index),
			ProgressName
	end.
