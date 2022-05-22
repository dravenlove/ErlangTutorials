%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 1月 2021 15:06
%%%-------------------------------------------------------------------
-module(db_player_science).
-author("13661").

-include("common.hrl").
-include("science.hrl").

%% API
-export([
	load_player_science/1,
	save_player_science/1
]).

bson_to_science(Bson) ->
	#science{
		id = ?BSON_INT(Bson, id),
		level = ?BSON_INT(Bson, level),
		state = ?BSON_INT(Bson, state),
		start_tick = ?BSON_INT(Bson, start_tick),
		accelerate_time = ?BSON_INT(Bson, accelerate_time)
	}
.

science_to_bson(Science) when is_record(Science, science) ->
	#{
		?BSONSET_INT(id, Science#science.id),
		?BSONSET_INT(level, Science#science.level),
		?BSONSET_INT(state, Science#science.state),
		?BSONSET_INT(start_tick, Science#science.start_tick),
		?BSONSET_INT(accelerate_time, Science#science.accelerate_time)
	}
.

load_player_science(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_SCIENCE, #{?BSONSET_INT(id, PlayerId)}) of
		Res = #{} ->
			BsonScienceList = ?BSON_LIST(Res, science_map),

    			ScienceMap =
    			lists:foldl(fun(BsonScience, Map) ->
    				Science = bson_to_science(BsonScience),
    				maps:put(Science#science.id, Science, Map)
                end, maps:new(), BsonScienceList),

			UpgradeSet =
			maps:fold(fun(ScienceId, #science{state = State}, Set) ->
				?IIF(State =:= ?SCIENCE_STATE_UPGRADE, gb_sets:add_element(ScienceId, Set), Set)
            end, gb_sets:new(), ScienceMap),

			#player_science{
				id = PlayerId,
				is_received = ?BSON_BOOL(Res, is_received),
				science_map = ScienceMap,
				upgrading_set = UpgradeSet
			};
		_ -> #player_science{
			id = PlayerId
		}
	end
.

save_player_science(Data) ->
	PlayerId = Data#player_science.id,

	BsonScienceList = maps:fold(fun(_, Science, List) -> [science_to_bson(Science) | List] end, [], Data#player_science.science_map),

	IsReceived = Data#player_science.is_received,

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(science_map, BsonScienceList),
		?BSONSET_BOOL(is_received, IsReceived)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_SCIENCE,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.