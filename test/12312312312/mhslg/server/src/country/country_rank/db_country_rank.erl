%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 1月 2021 11:25
%%%-------------------------------------------------------------------
-module(db_country_rank).
-author("13661").

-include("common.hrl").
-include("country_rank.hrl").

%% API
-export([
	load_rank/2,
	save_rank/1
]).

bson_to_ranker(Bson) ->
	#ranker{
		id = ?BSON_INT(Bson, id),
		rank_type = ?BSON_INT(Bson, rank_type),
		rank = ?BSON_INT(Bson, rank),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		value1 = ?BSON_INT(Bson, value1),
		value2 = ?BSON_INT(Bson, value2),
		update_tick = ?BSON_INT(Bson, update_tick),
		is_online = ?BSON_BOOL(Bson, is_online),
		sign_in_tick = ?BSON_INT(Bson, sign_in_tick),
		sign_out_tick = ?BSON_INT(Bson, sign_out_tick)
	}
.

ranker_to_Bson(Ranker) when is_record(Ranker, ranker) ->
	#{
		?BSONSET_INT(id, Ranker#ranker.id),
		?BSONSET_INT(rank_type, Ranker#ranker.rank_type),
		?BSONSET_INT(rank, Ranker#ranker.rank),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Ranker#ranker.show)),
		?BSONSET_INT(value1, Ranker#ranker.value1),
		?BSONSET_INT(value2, Ranker#ranker.value2),
		?BSONSET_INT(update_tick, Ranker#ranker.update_tick),
		?BSONSET_BOOL(is_online, Ranker#ranker.is_online),
		?BSONSET_INT(sign_in_tick, Ranker#ranker.sign_in_tick),
		?BSONSET_INT(sign_out_tick, Ranker#ranker.sign_out_tick)
	}
.

load_rank(CountryId, RankType) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_COUNTRY_RANK, #{?BSONSET_INT(country_id, CountryId), ?BSONSET_INT(rank_type, RankType)}) of
		Bson = #{} ->
			BsonRankerList = ?BSON_LIST(Bson, ranker_map),
			RankerMap =
			lists:foldl(fun(BsonRanker, Map) ->
				Ranker = bson_to_ranker(BsonRanker),
				maps:put(Ranker#ranker.id, Ranker, Map)
			end, maps:new(), BsonRankerList),

			#rank{
				country_id = CountryId,
				type = RankType,
				ranker_map = RankerMap
			};
		_ -> #rank{
			country_id = CountryId,
			type = RankType
		}
	end
.

save_rank(Rank) when is_record(Rank, rank) ->
	BsonRankerList =
	maps:fold(fun(_, Ranker, List) ->
		[ranker_to_Bson(Ranker) | List]
  	end, [], Rank#rank.ranker_map),

	BsonRankList = [ranker_to_Bson(Ranker) || Ranker <- Rank#rank.rank_list],

	Bson = #{
		?BSONSET_INT(country_id, Rank#rank.country_id),
		?BSONSET_INT(rank_type, Rank#rank.type),
		?BSONSET_LIST(ranker_map, BsonRankerList),
		?BSONSET_LIST(rank_list, BsonRankList)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DB_COUNTRY_RANK, #{
		?BSONSET_INT(country_id, Rank#rank.country_id),
		?BSONSET_INT(rank_type, Rank#rank.type)},
	Bson)
.
