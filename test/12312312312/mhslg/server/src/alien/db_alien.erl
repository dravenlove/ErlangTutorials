%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十一月 2020 10:29
%%%-------------------------------------------------------------------
-module(db_alien).

-include("common.hrl").
-include("alien.hrl").

%% API
-export([
	load_alien/1,
	save_alien/1
]).

load_alien(CountryId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_ALIEN, #{?BSONSET_INT(<<"country_id">>, CountryId)}) of
		Bson = #{} ->
			#alien{
				country_id = ?BSON_INT(Bson, country_id),
				detail_map = bson_list_to_detail_map(?BSON_LIST(Bson, detail_map)),
				player_map = bson_list_to_player_map(?BSON_LIST(Bson, player_map))
			};
		_ ->
			#alien{
				country_id = CountryId,
				detail_map = bson_list_to_detail_map([])
			}
	end.

bson_list_to_detail_map(BsonList) ->
	bson_list_to_detail_map(lists:reverse(tb_alien:get_list()), BsonList, maps:new()).
bson_list_to_detail_map([Floor | FloorList], [Bson | BsonList], DetailMap) ->
	bson_list_to_detail_map(FloorList, BsonList, maps:put(Floor, #alien_detail{
		floor = Floor,
		open_state = ?BSON_INT(Bson, open_state),
		state = ?BSON_INT(Bson, state),
		fight_tick = ?BSON_INT(Bson, fight_tick),
		buff_refresh_tick = ?BSON_INT(Bson, buff_refresh_tick),
		buff_list = ?BSON_LIST(Bson, buff_list),
		robot_id = ?BSON_INT(Bson, robot_id),
		hero_base = lib_hero_api:bson_to_hero_base(?BSON_BSON(Bson, hero_base)),
		fighters = db_combat_queue:bson_list_to_fighters(?BSON_LIST(Bson, fighters)),
		build_up_tick = ?BSON_INT(Bson, build_up_tick)
	}, DetailMap));
bson_list_to_detail_map([Floor | FloorList], [], DetailMap) ->
	Conf = tb_alien:get(Floor),
	bson_list_to_detail_map(FloorList, [], maps:put(Floor, #alien_detail{
		floor = Floor,
		open_state = maps:get(open_state, Conf, 0)
	}, DetailMap));
bson_list_to_detail_map([], _, DetailMap) ->
	DetailMap.

bson_list_to_player_map(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		RoleId = ?BSON_INT(Bson, role_id),
		maps:put(RoleId, #alien_player{
			role_id = RoleId,
			use_hero_list = ?BSON_LIST(Bson, use_hero_list),
			reward_list = bson_list_to_use_reward_list(?BSON_LIST(Bson, reward_list)),
			floor_list = ?BSON_LIST(Bson, <<"floor_list">>),
			count = ?BSON_INT(Bson, <<"count">>)
		}, Acc)
	end, maps:new(), BsonList).

bson_list_to_use_reward_list(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		[#alien_reward{
			item_id = ?BSON_INT(Bson, item_id),
			amount = ?BSON_INT(Bson, amount),
			floor = ?BSON_INT(Bson, floor),
			get_tick = ?BSON_INT(Bson, get_tick)
		} | Acc]
	end, [], BsonList).


save_alien(Alien) ->
	Bson = #{
		?BSONSET_INT(country_id, Alien#alien.country_id),
		?BSONSET_LIST(detail_map, detail_map_to_bson_list(Alien#alien.detail_map)),
		?BSONSET_LIST(player_map, player_map_to_bson_list(Alien#alien.player_map))
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_ALIEN, #{?BSONSET_INT(<<"country_id">>, Alien#alien.country_id)}, #{<<"$set">> => Bson}).

detail_map_to_bson_list(DetailMap) ->
	maps:fold(fun(Floor, Detail, Acc) ->
		[#{
			?BSONSET_INT(floor, Floor),
			?BSONSET_INT(state, Detail#alien_detail.state),
			?BSONSET_INT(open_state, Detail#alien_detail.open_state),
			?BSONSET_INT(buff_refresh_tick, Detail#alien_detail.buff_refresh_tick),
			?BSONSET_LIST(buff_list, Detail#alien_detail.buff_list),
			?BSONSET_INT(robot_id, Detail#alien_detail.robot_id),
			?BSONSET_BSON(hero_base, lib_hero_api:hero_base_to_bson(Detail#alien_detail.hero_base)),
			?BSONSET_LIST(fighters, db_combat_queue:fighters_to_bson_list(Detail#alien_detail.fighters)),
			?BSONSET_INT(build_up_tick, Detail#alien_detail.build_up_tick)
		} | Acc]
	end, [], DetailMap).

player_map_to_bson_list(PlayerMap) ->
	maps:fold(fun(RoleId, Player, Acc) ->
		[#{
			?BSONSET_INT(role_id, RoleId),
			?BSONSET_LIST(use_hero_list, Player#alien_player.use_hero_list),
			?BSONSET_LIST(reward_list, reward_list_to_bson_list(Player#alien_player.reward_list)),
			?BSONSET_LIST(<<"floor_list">>, Player#alien_player.floor_list),
			?BSONSET_INT(<<"count">>, Player#alien_player.count)
		} | Acc]
	end, [], PlayerMap).

reward_list_to_bson_list(RewardList) ->
	lists:foldl(fun(Reward, Acc) ->
		[#{
			?BSONSET_INT(item_id, Reward#alien_reward.item_id),
			?BSONSET_INT(amount, Reward#alien_reward.amount),
			?BSONSET_INT(floor, Reward#alien_reward.floor),
			?BSONSET_INT(get_tick, Reward#alien_reward.get_tick)
		} | Acc]
	end, [], RewardList).