%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 2月 2021 10:08
%%%-------------------------------------------------------------------
-module(db_dragon_palace_adventure).
-author("df").

-include("common.hrl").
-include("dragon_palace_adventure.hrl").
-include("hero.hrl").
%% API
-export([
	load_dragon_palace_adventure_gather/0,
	save_dragon_palace_adventure_gather/1
]).

dragon_palace_adventure_to_bson(Player) when is_record(Player, dragon_palace_adventure) ->
	BsonBeRobsList =
		dict:fold(fun(_BeRob, BeRob, List) ->
			[#{
				?BSONSET_INT(type, BeRob#be_rob.type),
				?BSONSET_INT(time, BeRob#be_rob.time)
			} | List]
				  end, [], Player#dragon_palace_adventure.be_robs),
	BsonAdventureInfoList =
		dict:fold(fun(_AdventureInfo, AdventureInfo, List) ->
			[#{
				?BSONSET_INT(type, AdventureInfo#adventure.type),
				?BSONSET_INT(expedition_state, AdventureInfo#adventure.expedition_state),
				?BSONSET_INT(start_tick, AdventureInfo#adventure.start_tick),
				?BSONSET_LIST(hero_list, [lib_hero_api:hero_base_to_bson(HeroBase) || HeroBase <- AdventureInfo#adventure.hero_list]),
				?BSONSET_LIST(dragon_gem, AdventureInfo#adventure.dragon_gem),
				?BSONSET_LIST(item, AdventureInfo#adventure.item),
				?BSONSET_INT(be_rob_dragon_gem, AdventureInfo#adventure.be_rob_dragon_gem),
				?BSONSET_INT(be_rob, AdventureInfo#adventure.be_rob),
				?BSONSET_INT(be_rob_success, AdventureInfo#adventure.be_rob_success)
			} | List]
				  end, [], Player#dragon_palace_adventure.adventure_info),
	BsonRobInfoList =
		dict:fold(fun(_RobInfo, RobInfo, List) ->
			[#{
				?BSONSET_INT(combat_id, RobInfo#rob.combat_id),
				?BSONSET_INT(player_id, RobInfo#rob.player_id),
				?BSONSET_BSON(show, lib_common:player_show_to_bson(RobInfo#rob.show)),
				?BSONSET_INT(tick, RobInfo#rob.tick),
				?BSONSET_INT(type, RobInfo#rob.type),
				?BSONSET_INT(star, RobInfo#rob.star),
				?BSONSET_LIST(fight_info, lib_common:map_to_bson_list(RobInfo#rob.fight_info)),
				?BSONSET_LIST(adverse_fight_info, lib_common:map_to_bson_list(RobInfo#rob.adverse_fight_info)),
				?BSONSET_LIST(item, RobInfo#rob.item),
				?BSONSET_INT(record_id, RobInfo#rob.record_id),
				?BSONSET_INT(is_revenge_success, RobInfo#rob.is_revenge_success)
			} | List]
				  end, [], Player#dragon_palace_adventure.rob_info),
	BsonBeRobInfoList =
		dict:fold(fun(_BeRobInfo, BeRobInfo, List) ->
			[#{
				?BSONSET_INT(combat_id, BeRobInfo#rob.combat_id),
				?BSONSET_INT(player_id, BeRobInfo#rob.player_id),
				?BSONSET_BSON(show, lib_common:player_show_to_bson(BeRobInfo#rob.show)),
				?BSONSET_INT(tick, BeRobInfo#rob.tick),
				?BSONSET_INT(type, BeRobInfo#rob.type),
				?BSONSET_INT(star, BeRobInfo#rob.star),
				?BSONSET_LIST(fight_info, lib_common:map_to_bson_list(BeRobInfo#rob.fight_info)),
				?BSONSET_LIST(adverse_fight_info, lib_common:map_to_bson_list(BeRobInfo#rob.adverse_fight_info)),
				?BSONSET_LIST(item, BeRobInfo#rob.item),
				?BSONSET_INT(record_id, BeRobInfo#rob.record_id),
				?BSONSET_INT(is_revenge_success, BeRobInfo#rob.is_revenge_success)
			} | List]
				  end, [], Player#dragon_palace_adventure.be_rob_info),
	#{
		?BSONSET_INT(player_id, Player#dragon_palace_adventure.player_id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Player#dragon_palace_adventure.show)),
		?BSONSET_INT(rob_time, Player#dragon_palace_adventure.rob_time),
		?BSONSET_LIST(be_robs, BsonBeRobsList),
		?BSONSET_INT(astrology_id, Player#dragon_palace_adventure.astrology_id),
		?BSONSET_INT(free_astrology_time, Player#dragon_palace_adventure.free_astrology_time),
		?BSONSET_INT(rob_player_id, Player#dragon_palace_adventure.rob_player_id),
		?BSONSET_LIST(adventure_info, BsonAdventureInfoList),
		?BSONSET_LIST(rob_info, BsonRobInfoList),
		?BSONSET_LIST(be_rob_info, BsonBeRobInfoList)
	}
.

bson_to_dragon_palace_adventure(Bson) ->

	BsonBeRobsList = ?BSON_LIST(Bson, be_robs, []),
	BeRobsMap =
		lists:foldl(fun(BsonBeRobs, Dict) ->
			Type = ?BSON_INT(BsonBeRobs, type),
			dict:store(Type, #be_rob{
				type = Type,
				time = ?BSON_INT(BsonBeRobs, time)
			}, Dict)
					end, dict:new(), BsonBeRobsList),

	BsonAdventureInfoList = ?BSON_LIST(Bson, adventure_info, []),
	AdventureInfoMap =
		lists:foldl(fun(BsonAdventureInfo, Dict) ->
			Type = ?BSON_INT(BsonAdventureInfo, type),
			dict:store(Type, #adventure{
				type = Type,
				expedition_state = ?BSON_INT(BsonAdventureInfo, expedition_state),
				start_tick = ?BSON_INT(BsonAdventureInfo, start_tick),
				hero_list = [lib_hero_api:bson_to_hero_base(BsonHeroBase) || BsonHeroBase <- ?BSON_LIST(BsonAdventureInfo, hero_list)],
				dragon_gem = ?BSON_LIST(BsonAdventureInfo, dragon_gem),
				item = ?BSON_LIST(BsonAdventureInfo, item),
				be_rob_dragon_gem = ?BSON_INT(BsonAdventureInfo, be_rob_dragon_gem),
				be_rob = ?BSON_INT(BsonAdventureInfo, be_rob),
				be_rob_success = ?BSON_INT(BsonAdventureInfo, be_rob_success)

			}, Dict)
					end, dict:new(), BsonAdventureInfoList),

	BsonRobInfoList = ?BSON_LIST(Bson, rob_info, []),
	RobInfoMap =
		lists:foldl(fun(BsonRobInfo, Dict) ->
			Combat_id = ?BSON_INT(BsonRobInfo, combat_id),
			dict:store(Combat_id, #rob{
				combat_id = Combat_id,
				player_id = ?BSON_INT(BsonRobInfo, player_id),
				show = lib_common:bson_to_player_show(?BSON_BSON(BsonRobInfo, show)),
				tick = ?BSON_INT(BsonRobInfo, tick),
				type = ?BSON_INT(BsonRobInfo, type),
				star = ?BSON_INT(BsonRobInfo, star),
				fight_info = lib_common:bson_list_to_map(?BSON_LIST(BsonRobInfo, fight_info)),
				adverse_fight_info = lib_common:bson_list_to_map(?BSON_LIST(BsonRobInfo, adverse_fight_info)),
				item = ?BSON_LIST(BsonRobInfo, item),
				record_id = ?BSON_INT(BsonRobInfo, record_id)
			}, Dict)
					end, dict:new(), BsonRobInfoList),

	BsonBeRobInfoList = ?BSON_LIST(Bson, be_rob_info, []),
	BeRobInfoMap =
		lists:foldl(fun(BsonBeRobInfo, Dict) ->
			Combat_id = ?BSON_INT(BsonBeRobInfo, combat_id),
			dict:store(Combat_id, #rob{
				combat_id = Combat_id,
				player_id = ?BSON_INT(BsonBeRobInfo, player_id),
				show = lib_common:bson_to_player_show(?BSON_BSON(BsonBeRobInfo, show)),
				tick = ?BSON_INT(BsonBeRobInfo, tick),
				type = ?BSON_INT(BsonBeRobInfo, type),
				star = ?BSON_INT(BsonBeRobInfo, star),
				fight_info = lib_common:bson_list_to_map(?BSON_LIST(BsonBeRobInfo, fight_info)),
				adverse_fight_info = lib_common:bson_list_to_map(?BSON_LIST(BsonBeRobInfo, adverse_fight_info)),
				item = ?BSON_LIST(BsonBeRobInfo, item),
				record_id = ?BSON_INT(BsonBeRobInfo, record_id)
			}, Dict)
					end, dict:new(), BsonBeRobInfoList),

	#dragon_palace_adventure{
		player_id = ?BSON_INT(Bson, player_id),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		rob_time = ?BSON_INT(Bson, rob_time),
		be_robs = BeRobsMap,
		astrology_id = ?BSON_INT(Bson, astrology_id),
		free_astrology_time = ?BSON_INT(Bson, free_astrology_time),
		rob_player_id = ?BSON_INT(Bson, rob_player_id),
		adventure_info = AdventureInfoMap,
		rob_info = RobInfoMap,
		be_rob_info = BeRobInfoMap
	}
.

adventure_to_bson(Adventure) when is_record(Adventure, adventure_info) ->
	#{
		?BSONSET_INT(key, Adventure#adventure_info.key),
		?BSONSET_INT(id, Adventure#adventure_info.id),
		?BSONSET_INT(type, Adventure#adventure_info.type)
	}
.

bson_to_adventure(AdventureBson) ->
	#adventure_info{
		key = ?BSON_INT(AdventureBson, key),
		id = ?BSON_INT(AdventureBson, id),
		type = ?BSON_INT(AdventureBson, type)
	}
.

load_dragon_palace_adventure_gather() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_DRAGON_PALACE_ADVENTURE, #{?BSONSET_INT(uid, 1)}) of
		Res = #{} ->
			BsonDragonPalaceAdventureList = ?BSON_LIST(Res, dragon_palace_adventure_map, []),
			Dragon_palace_adventure_map =
				lists:foldl(fun(Bson1, Map1) ->
					Dragon_palace_adventure = bson_to_dragon_palace_adventure(Bson1),
					maps:put(Dragon_palace_adventure#dragon_palace_adventure.player_id, Dragon_palace_adventure, Map1)
				end, maps:new(), BsonDragonPalaceAdventureList),
			BsonAdventureList = ?BSON_LIST(Res, adventure_info_map, []),
			Adventure_info_map =
				lists:foldl(fun(Bson2, Map2) ->
					Adventure = bson_to_adventure(Bson2),
					maps:put(Adventure#adventure_info.key, Adventure, Map2)
				end, maps:new(), BsonAdventureList),
			#dragon_palace_adventure_gather{
				dragon_palace_adventure_map = Dragon_palace_adventure_map,
				adventure_info_map = Adventure_info_map,
				start_tick = ?BSON_INT(Res, start_tick),
				system_refresh_tick = ?BSON_INT(Res, system_refresh_tick)
			};
		_ ->
			#dragon_palace_adventure_gather{
			}
	end
.

save_dragon_palace_adventure_gather(Gather) when is_record(Gather, dragon_palace_adventure_gather) ->
	BsonPlayerList =
		maps:fold(fun(_, Player, List) ->
			[dragon_palace_adventure_to_bson(Player) | List]
		end, [], Gather#dragon_palace_adventure_gather.dragon_palace_adventure_map),
	BsonAdventureList =
		maps:fold(fun(_, Adventure, List) ->
			[adventure_to_bson(Adventure) | List]
		end, [], Gather#dragon_palace_adventure_gather.adventure_info_map),
	Bson =
		#{
			?BSONSET_INT(uid, 1),
			?BSONSET_LIST(dragon_palace_adventure_map, BsonPlayerList),
			?BSONSET_LIST(adventure_info_map, BsonAdventureList),
			?BSONSET_INT(start_tick, Gather#dragon_palace_adventure_gather.start_tick),
			?BSONSET_INT(system_refresh_tick, Gather#dragon_palace_adventure_gather.system_refresh_tick)
		},
	QueryBson = #{
		?BSONSET_INT(uid, 1)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_DRAGON_PALACE_ADVENTURE, QueryBson, Bson)
.