%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_server_info
%%% Created on : 2020/8/31 0031 17:11
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_server_info).
-author("glendy").
-include("common.hrl").
-include("cluster.hrl").

%% API
-export([
	save_server_info/1,
	load_all_server_info/0
]).

save_server_info(ServerInfo) ->
	Bson = server_info_to_bson(ServerInfo),
	mongo_poolboy:async_update(?MMO_POOL, ?DBSERVER_INFO,
		#{?BSONSET_STRING(<<"server_flag">>, ServerInfo#server_info.server_flag)},
		#{<<"$set">> => Bson}).

load_all_server_info() ->
	case mongo_poolboy:find(?MMO_POOL, ?DBSERVER_INFO, #{}) of
		BsonList = [_|_] ->
			lists:foldl(
				fun(Bson, {AccIdList0, AccPrevList0}) ->
					ServerFlag = ?BSON_BIN(Bson, <<"server_flag">>),
					ServerPrev = ?BSON_STRING(Bson, <<"server_prev">>),
					{[ServerFlag | AccIdList0], [ServerPrev | AccPrevList0]}
				end, {[],  []}, BsonList);
		_ ->
			{[], []}
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

server_info_to_bson(ServerInfo) ->
	#{
		?BSONSET_STRING(<<"server_flag">>, ServerInfo#server_info.server_flag),
		?BSONSET_STRING(<<"server_name">>, ServerInfo#server_info.server_name),
		?BSONSET_STRING(<<"server_prev">>, ServerInfo#server_info.server_prev),
		?BSONSET_INT(<<"open_tick">>, ServerInfo#server_info.open_tick)
	}.
