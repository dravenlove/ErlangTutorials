%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 8月 2021 15:06
%%%-------------------------------------------------------------------
-module(db_open_server_rank).
-author("df").
-include("common.hrl").
-include("activity.hrl").
-include("activity_player.hrl").

%% API
-export([
	bson_to_player_info/1,
	player_info_to_bson/1,

	bson_to_data/1,
	data_to_bson/1
]).

bson_to_player_info(Bson) ->
	#player_open_server{
		day_award = ?BSON_INT(Bson, day_award)
	}
.
player_info_to_bson(Data) ->
	#{
		?BSONSET_INT(day_award, Data#player_open_server.day_award)
	}
.

bson_to_data(Bson) ->
	BsonTaskList = ?BSON_LIST(Bson, map),
	Map =
		lists:foldl(fun(BsonOpenServer, Map) ->
			Open_server = bson_to_open_server(BsonOpenServer),
			maps:put(Open_server#open_server.type, Open_server, Map)
		end, maps:new(), BsonTaskList),

	#activity_open_server{
		map = Map
	}
.
bson_to_open_server(Bson) ->
	BsonTaskList = ?BSON_LIST(Bson, map),
	Map =
		lists:foldl(fun(BsonPlayer, Map) ->
			Player = bson_to_player_data(BsonPlayer),
			maps:put(Player#open_server_rank.player_id, Player, Map)
		end, maps:new(), BsonTaskList),

	#open_server{
		type = ?BSON_INT(Bson, type),
		map = Map
	}
.
bson_to_player_data(Bson) ->
	BsonTaskList = ?BSON_LIST(Bson, task_map, []),
	Task_map =
		lists:foldl(fun(BsonTask, Map) ->
			Task = #open_server_task{
				task_id = ?BSON_INT(BsonTask, task_id),
				task_grade = ?BSON_INT(BsonTask, task_grade),
				state = ?BSON_INT(BsonTask, state)
			},
			maps:put(Task#open_server_task.task_id, Task, Map)
		end, maps:new(), BsonTaskList),

	#open_server_rank{
		player_id = ?BSON_INT(Bson, player_id),
		rank = ?BSON_INT(Bson, rank),
		rank_grade = ?BSON_INT(Bson, rank_grade),
		tick = ?BSON_INT(Bson, tick),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		task_map = Task_map
	}
.
data_to_bson(Data) ->
	Map = Data#activity_open_server.map,
	BsonList =
		maps:fold(fun(_, Info, List) ->
			BsonTask = open_server_to_bson(Info),
			[BsonTask | List]
		end, [], Map),

	#{
		?BSONSET_LIST(map, BsonList)
	}
.
open_server_to_bson(Data) ->
	Map = Data#open_server.map,
	BsonList =
		maps:fold(fun(_, Info, List) ->
			BsonTask = player_data_to_bson(Info),
			[BsonTask | List]
		end, [], Map),

	#{
		?BSONSET_INT(type, Data#open_server.type),
		?BSONSET_LIST(map, BsonList)
	}
.
player_data_to_bson(Data) ->
	Task_map = Data#open_server_rank.task_map,
	BsonTaskList =
		maps:fold(fun(_, Task, List) ->
			BsonTask = #{
				?BSONSET_INT(task_id, Task#open_server_task.task_id),
				?BSONSET_INT(task_grade, Task#open_server_task.task_grade),
				?BSONSET_INT(state, Task#open_server_task.state)
			},
			[BsonTask | List]
		end, [], Task_map),

	#{
		?BSONSET_INT(player_id, Data#open_server_rank.player_id),
		?BSONSET_INT(rank, Data#open_server_rank.rank),
		?BSONSET_INT(rank_grade, Data#open_server_rank.rank_grade),
		?BSONSET_INT(tick, Data#open_server_rank.tick),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Data#open_server_rank.show)),
		?BSONSET_LIST(task_map, BsonTaskList)
	}
.