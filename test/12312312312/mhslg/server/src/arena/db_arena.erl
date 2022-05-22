%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 11:31
%%%-------------------------------------------------------------------
-module(db_arena).
-author("13661").

-include("common.hrl").
-include("arena.hrl").

%% API
-export([
	load_monitor/0,
	save_monitor/1
]).

bson_to_record(Bson) ->
	#arena_record{
		first_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, first_show)),
		second_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, second_show)),
		first_hero_list = [lib_hero_api:bson_to_hero_base(HeroBson) || HeroBson <- ?BSON_LIST(Bson, first_hero_list)],
		second_hero_list = [lib_hero_api:bson_to_hero_base(HeroBson) || HeroBson <- ?BSON_LIST(Bson, second_hero_list)],
		result_list = ?BSON_LIST(Bson, result_list),
		first_rank = ?BSON_INT(Bson, first_rank),
		second_rank = ?BSON_INT(Bson, second_rank),
		win_type = ?BSON_INT(Bson, win_type),
		tick = ?BSON_INT(Bson, tick)
	}
.

record_to_bson(Record) when is_record(Record, arena_record) ->
	#{
		?BSONSET_BSON(first_show, lib_common:player_show_to_bson(Record#arena_record.first_show)),
		?BSONSET_BSON(second_show, lib_common:player_show_to_bson(Record#arena_record.second_show)),
		?BSONSET_LIST(first_hero_list, [lib_hero_api:hero_base_to_bson(HeroBase) || HeroBase <- Record#arena_record.first_hero_list]),
		?BSONSET_LIST(second_hero_list, [lib_hero_api:hero_base_to_bson(HeroBase) || HeroBase <- Record#arena_record.second_hero_list]),
		?BSONSET_LIST(result_list, Record#arena_record.result_list),
		?BSONSET_INT(first_rank, Record#arena_record.first_rank),
		?BSONSET_INT(second_rank, Record#arena_record.second_rank),
		?BSONSET_INT(win_type, Record#arena_record.win_type),
		?BSONSET_INT(tick, Record#arena_record.tick)
	}
.

bson_to_player(Bson) ->
	#arena_player{
		is_robot = ?BSON_BOOL(Bson, is_robot),
		id = ?BSON_INT(Bson, id),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		hero_list = [lib_hero_api:bson_to_hero_base(BsonHeroBase) || BsonHeroBase <- ?BSON_LIST(Bson, hero_list)],
		force = ?BSON_INT(Bson, force),
		rank = ?BSON_INT(Bson, rank),
		top_rank = ?BSON_INT(Bson, top_rank),
		history_list = [bson_to_record(BsonRecord) || BsonRecord <- ?BSON_LIST(Bson, history_list)]
	}
.

player_to_bson(Player) when is_record(Player, arena_player) ->
	#{
		?BSONSET_BOOL(is_robot, Player#arena_player.is_robot),
		?BSONSET_INT(id, Player#arena_player.id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Player#arena_player.show)),
		?BSONSET_LIST(hero_list, [lib_hero_api:hero_base_to_bson(HeroBase) || HeroBase <- Player#arena_player.hero_list]),
		?BSONSET_INT(force, Player#arena_player.force),
		?BSONSET_INT(rank, Player#arena_player.rank),
		?BSONSET_INT(top_rank, Player#arena_player.top_rank),
		?BSONSET_LIST(history_list, [record_to_bson(Record) || Record <- Player#arena_player.history_list])
	}
.

load_monitor() ->
	PlayerMap =
	case mongo_poolboy:find(?MMO_POOL, ?DB_ARENA_PLAYER, #{}) of
		[_ | _] = PlayerBsonList ->
			lists:foldl(fun(PlayerBson, Map) ->
				Player = bson_to_player(PlayerBson),
				maps:put(Player#arena_player.id, Player#arena_player{rank = 0}, Map)
            end, maps:new(), PlayerBsonList);
		_ ->
			maps:new()
	end,

	case mongo_poolboy:find_one(?MMO_POOL, ?DB_ARENA, #{?BSONSET_INT(id, 1)}) of
		Res = #{} ->
			RankList = array:from_list(?BSON_LIST(Res, rank_list), 0),
			NewPlayerMap = 
			lib_common:fold(fun(Rank, Map) -> 
				Id = array:get(Rank - 1, RankList),
				?JUDGE_CONTINUE(maps:is_key(Id, Map), Map),

				Player = maps:get(Id, Map),
				maps:put(Id, Player#arena_player{rank = Rank}, Map)
			end, PlayerMap, 1, array:size(RankList)),
			#arena_monitor{
				is_init = ?BSON_BOOL(Res, is_init),
				rank_list = array:from_list(?BSON_LIST(Res, rank_list), 0),
				player_map = NewPlayerMap,
				rank_settlement_tick = ?BSON_INT(Res, rank_settlement_tick)
			};
		_ -> #arena_monitor{}
	end
.

save_monitor(Monitor) when is_record(Monitor, arena_monitor) ->
	maps:map(fun(_, Player) ->
		PlayerBson = player_to_bson(Player),
		mongo_poolboy:async_update(?MMO_POOL, ?DB_ARENA_PLAYER, #{?BSONSET_INT(id, Player#arena_player.id)}, PlayerBson)
    end, Monitor#arena_monitor.player_map),

	Bson = #{
		?BSONSET_INT(id, 1),
		?BSONSET_BOOL(is_init, Monitor#arena_monitor.is_init),
		?BSONSET_LIST(rank_list, array:to_list(Monitor#arena_monitor.rank_list)),
		?BSONSET_INT(rank_settlement_tick, Monitor#arena_monitor.rank_settlement_tick)
	},

	QueryBson = #{
		?BSONSET_INT(id, 1)
	},
	
	mongo_poolboy:async_update(?MMO_POOL, ?DB_ARENA, QueryBson, Bson)
.