%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_special_mongodb
%%% Created on : 2020/9/14 0014 17:49
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_special_mongodb).
-author("glendy").
-include("common.hrl").

%% API
-export([
	find/4,
	find/6,
	update/5,
	update/7,
	close/2
]).

%% 不同的PoolName和Mod对应不同的单独的数据库连接和处理进程
find(PoolName, Mod, Coll, Selector) ->
	find(PoolName, Mod, Coll, Selector, 0, 0).
find(PoolName, Mod, Coll, Selector, Skip, BatchSize) ->
	ProcessName = mod_mongodb:get_process_name(PoolName, Mod),
	mongo_poolboy:check_and_start_mongo({ProcessName, PoolName, Mod}),
	mod_mongodb:find(ProcessName, Coll, Selector, Skip, BatchSize).

%% 更新mongo记录
update(PoolName, Mod, Coll, Selector, Doc) ->
	update(PoolName, Mod, Coll, Selector, Doc, true, false).
update(PoolName, Mod, Coll, Selector, Doc, Upsert, MultiUpdate) ->
	ProcessName = mod_mongodb:get_process_name(PoolName, Mod),
	mongo_poolboy:check_and_start_mongo({ProcessName, PoolName, Mod}),
	mod_mongodb:update(ProcessName, Coll, Selector, Doc, Upsert, MultiUpdate).

%% 关闭不同的PoolName和Mod对应的数据库连接
close(PoolName, Mod) ->
	mod_mongodb:stop(PoolName, Mod).
