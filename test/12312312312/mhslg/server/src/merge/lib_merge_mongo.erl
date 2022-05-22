%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_merge_mongo
%%% Created on : 2020/10/19 15:42
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_merge_mongo).
-author("glendy").
-include("common.hrl").

-define(MERGE_MONGO_INDEX, merge_mongo_index).

%% API
-export([
	get_master_host/0,
	get_master_port/0,
	get_master_mmo/0,
	get_master_back/0,
	fetch_mongo_index/0,
	dropDatabase/1,
	count/3,
	find/5,
	find_one/3,
	update/6,
	insert/3,
	delete/4,
	sync_status/2,
	async_status/2
]).

get_master_host() ->
	[Host | _T] = config:merge_master(),
	Host.

get_master_port() ->
	[_Host, Port | _T] = config:merge_master(),
	Port.

get_master_mmo() ->
	[_Host, _Port, MMO | _T] = config:merge_master(),
	MMO.

get_master_back() ->
	[_Host, _Port, _MMO, Back] = config:merge_master(),
	Back.

fetch_mongo_index() ->
	Val =
		case erlang:get(?MERGE_MONGO_INDEX) of
			undefined -> 1;
			V -> V
		end,
	erlang:put(?MERGE_MONGO_INDEX, Val + 1),
	Val.

dropDatabase(Connection) ->
	mc_worker_api:command(Connection, {<<"dropDatabase">>, 1}).

count(Connection, Coll, Selector) ->
	mc_worker_api:count(Connection, Coll, Selector).

find(Connection, Coll, Selector, Skip, BatchSize) ->
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

find_one(Connection, Coll, Selector) ->
	mc_worker_api:find_one(Connection, Coll, Selector).

update(Connection, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	mc_worker_api:update(Connection, Coll, Selector, Doc, Upsert, MultiUpdate).

insert(Connection, Coll, Docs) ->
	mc_worker_api:insert(Connection, Coll, Docs, {<<"w">>, 1}).

delete(Connection, Coll, Selector, N) ->
	mc_worker_api:delete_limit(Connection, Coll, Selector, N).


sync_status(Func, Args) ->
	MongoIdx = lib_merge_mongo:fetch_mongo_index(),
	mod_server:sync_status(mod_merge_mongodb:get_pid(MongoIdx), Func, Args, infinity).

async_status(Func, Args) ->
	MongoIdx = lib_merge_mongo:fetch_mongo_index(),
	mod_server:async_status(mod_merge_mongodb:get_pid(MongoIdx), Func, Args).