%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 2月 2021 11:10
%%%-------------------------------------------------------------------
-module(db_meritorious_award_rank).
-author("df").
-include("meritorious_award.hrl").
-include("common.hrl").

%% API
-export([
	load_meritorious_rank/0,
	save_meritorious_rank/1
]).


bson_to_meritorious_rank(Bson) ->
	#meritorious_rank{
		player_id =?BSON_INT(Bson, player_id),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		rank = ?BSON_INT(Bson, rank),
		meritorious = ?BSON_INT(Bson, meritorious),
		tick = ?BSON_INT(Bson, tick)
	}
.

meritorious_rank_to_bson(Meritorious_rank) when is_record(Meritorious_rank, meritorious_rank) ->
	#{
		?BSONSET_INT(player_id,Meritorious_rank#meritorious_rank.player_id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Meritorious_rank#meritorious_rank.show)),
		?BSONSET_INT(rank,Meritorious_rank#meritorious_rank.rank),
		?BSONSET_INT(meritorious,Meritorious_rank#meritorious_rank.meritorious),
		?BSONSET_INT(tick,Meritorious_rank#meritorious_rank.tick)
	}
.


bson_to_meritorious(Bson) ->
	#meritorious{
		player_id =?BSON_INT(Bson, player_id),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		kill_add = ?BSON_FLOAT(Bson, kill_add),
		damage_add = ?BSON_FLOAT(Bson, damage_add),
		meritorious = ?BSON_INT(Bson,  meritorious),
		add_up_meritorious = ?BSON_INT(Bson, add_up_meritorious),
		tick = ?BSON_INT(Bson, tick),
		stage = ?BSON_INT(Bson,  stage),
		award_info = lib_common:bson_list_to_map(?BSON_LIST(Bson, award_info)),
		get_circulation_award = ?BSON_INT(Bson, get_circulation_award),
		circulation_award = ?BSON_INT(Bson, circulation_award)

	}
.

meritorious_to_bson(Meritorious_add) when is_record(Meritorious_add, meritorious) ->
	#{
		?BSONSET_INT(player_id,Meritorious_add#meritorious.player_id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Meritorious_add#meritorious.show)),
		?BSONSET_FLOAT(kill_add,Meritorious_add#meritorious.kill_add),
		?BSONSET_FLOAT(damage_add,Meritorious_add#meritorious.damage_add),
		?BSONSET_INT(meritorious,Meritorious_add#meritorious.meritorious),
		?BSONSET_INT(add_up_meritorious,Meritorious_add#meritorious.add_up_meritorious),
		?BSONSET_INT(tick,Meritorious_add#meritorious.tick),
		?BSONSET_INT(stage,Meritorious_add#meritorious.stage),
		?BSONSET_LIST(award_info,lib_common:map_to_bson_list(Meritorious_add#meritorious.award_info)),
		?BSONSET_INT(get_circulation_award,Meritorious_add#meritorious.get_circulation_award),
		?BSONSET_INT(circulation_award,Meritorious_add#meritorious.circulation_award)

	}
.



load_meritorious_rank() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_MERITORIOUS_RANK, #{?BSONSET_INT(uid, 1)}) of
		Res = #{} ->
			BsonMeritoriousRankList = ?BSON_LIST(Res, rank_map, []),
			MeritoriousRankMap =
				lists:foldl(fun(BsonMeritoriousRank, Map) ->
					MeritoriousRank = bson_to_meritorious_rank(BsonMeritoriousRank),
					maps:put(MeritoriousRank#meritorious_rank.player_id, MeritoriousRank, Map)
							end, maps:new(), BsonMeritoriousRankList),
			BsonMeritoriousList = ?BSON_LIST(Res, meritorious_map, []),
			MeritoriousMap =
				lists:foldl(fun(BsonMeritorious, Map) ->
					Meritorious = bson_to_meritorious(BsonMeritorious),
					maps:put(Meritorious#meritorious.player_id, Meritorious, Map)
							end, maps:new(), BsonMeritoriousList),
			#meritorious_rank_gather{
				system_refresh_tick = ?BSON_INT(Res, system_refresh_tick),
				rank_map =  MeritoriousRankMap,
				meritorious_map = MeritoriousMap
			};
		_ ->
			#meritorious_rank_gather{

			}
	end
.

save_meritorious_rank(Meritorious_rank_gather) when is_record(Meritorious_rank_gather, meritorious_rank_gather) ->
	BsonMeritoriousRankList =
		maps:fold(fun(_, Meritorious_rank, List) ->
			[meritorious_rank_to_bson(Meritorious_rank) | List]
				  end, [], Meritorious_rank_gather#meritorious_rank_gather.rank_map),
	BsonMeritoriousList =
		maps:fold(fun(_, Meritorious, List) ->
			[meritorious_to_bson(Meritorious) | List]
				  end, [], Meritorious_rank_gather#meritorious_rank_gather.meritorious_map),
	Bson =
		#{
			?BSONSET_INT(uid, 1),
			?BSONSET_INT(system_refresh_tick, Meritorious_rank_gather#meritorious_rank_gather.system_refresh_tick),
			?BSONSET_LIST(rank_map, BsonMeritoriousRankList),
			?BSONSET_LIST(meritorious_map, BsonMeritoriousList)
		},

	QueryBson = #{
		?BSONSET_INT(uid, 1)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_MERITORIOUS_RANK, QueryBson, Bson)
.