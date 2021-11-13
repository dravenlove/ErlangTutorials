%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_cluster_gamenode
%%% Created on : 2020/9/10 0010 11:22
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_cluster_gamenode).
-author("glendy").
-include("common.hrl").
-include("cluster.hrl").

%% API
-export([
	load_all_game_node/0,
	remove_game_node/1,
	save_game_node/1
]).

load_all_game_node() ->
	case mongo_poolboy:find(?BACK_POOL, ?DBBACK_GAME_NODE, #{?BSONSET_INT(<<"is_remove">>, 0)}) of
		BsonList = [_|_] ->
			lists:foldl(
				fun(Bson, AccGameNodeList0) ->
					GameNode = bson_to_game_node(Bson),
					[GameNode | AccGameNodeList0]
				end, [], BsonList);
		_ ->
			[]
	end.

bson_to_game_node(Bson) ->
	#game_node{
		server_id = ?BSON_INT(Bson, <<"server_id">>),
		server_flag = ?BSON_BIN(Bson, <<"server_flag">>),
		open_tick = ?BSON_INT(Bson, <<"open_tick">>),
%%		alive_tick = ?BSON_INT(Bson, <<"alive_tick">>),
		alive_tick = lib_timer:unixtime(),
		node = lib_types:to_atom(?BSON_BIN(Bson, <<"node">>)),
		src_server_flags = lists:sort(?BSON_LIST(Bson, <<"src_server_flags">>)),
		src_server_prevs = lists:sort(?BSON_STRING_LIST(Bson, <<"src_server_prevs">>)),
		version = ?BSON_STRING(Bson, <<"version">>),
		is_remove = ?BSON_INT(Bson, <<"is_remove">>)
	}.

remove_game_node(ServerFlag) ->
	mongo_poolboy:async_delete(?BACK_POOL, ?DBBACK_GAME_NODE, #{?BSONSET_STRING(<<"server_flag">>, ServerFlag)}).

save_game_node(GameNode) ->
	#game_node{
		server_flag = ServerFlag,
		is_remove = IsRemove
	} = GameNode,
	if
		IsRemove =:= 1 -> remove_game_node(ServerFlag);
		true ->
			Bson = game_node_to_bson(GameNode),
			mongo_poolboy:async_update(?BACK_POOL, ?DBBACK_GAME_NODE,
				#{?BSONSET_STRING(<<"server_flag">>, ServerFlag)},
				#{<<"$set">> => Bson})
	end.

game_node_to_bson(GameNode) ->
	#{
		?BSONSET_INT(<<"server_id">>, GameNode#game_node.server_id),
		?BSONSET_STRING(<<"server_flag">>, GameNode#game_node.server_flag),
		?BSONSET_INT(<<"open_tick">>, GameNode#game_node.open_tick),
		?BSONSET_INT(<<"alive_tick">>, GameNode#game_node.alive_tick),
		?BSONSET_STRING(<<"node">>, GameNode#game_node.node),
		?BSONSET_LIST(<<"src_server_flags">>, GameNode#game_node.src_server_flags),
		?BSONSET_STRING_LIST(<<"src_server_prevs">>, GameNode#game_node.src_server_prevs),
		?BSONSET_STRING(<<"version">>, GameNode#game_node.version),
		?BSONSET_INT(<<"is_remove">>, GameNode#game_node.is_remove)
	}.
