%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十一月 2020 10:29
%%%-------------------------------------------------------------------
-module(db_player_function_open).
-author("13661").

-include("common.hrl").

%% API
-export([
	load_player_function_open/1,
	save_player_function_open/1
]).

function_to_bson(Function) when is_record(Function, function) ->
	#{
		?BSONSET_INT(function_id, Function#function.function_id),
		?BSONSET_BOOL(function_is_open, Function#function.function_is_open)
	}
.

bson_to_function(Bson) ->
	#function{
		function_id = ?BSON_INT(Bson, function_id),
		function_is_open = ?BSON_BOOL(Bson, function_is_open)
	}
.

load_player_function_open(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_FUNCTION_OPEN, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BsonChapterList = ?BSON_LIST(Bson, function_dict),
			FunctionDict =
			lists:foldl(fun(BsonFunction, Dict) ->
				Function = bson_to_function(BsonFunction),
				dict:store(Function#function.function_id, Function, Dict)
			end, dict:new(), BsonChapterList),

			#player_function_open{
				id = PlayerId,
				function_dict = FunctionDict
			};
		_ ->
			#player_function_open{
				id = PlayerId
			}
	end
.

save_player_function_open(PlayerFunctionOpen) when is_record(PlayerFunctionOpen, player_function_open) ->
	PlayerId = PlayerFunctionOpen#player_function_open.id,

	BsonFunctionList =
	dict:fold(fun(_FunctionId, Function, List) ->
		case Function#function.function_is_open of
			false -> List;
			true -> [function_to_bson(Function) | List]
		end
	end, [], PlayerFunctionOpen#player_function_open.function_dict),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(function_dict, BsonFunctionList)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_FUNCTION_OPEN,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.