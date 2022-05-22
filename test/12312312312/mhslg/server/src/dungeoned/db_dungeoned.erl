%%%-------------------------------------------------------------------
%%% @author Jiuan
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十一月 2020 10:29
%%%-------------------------------------------------------------------
-module(db_dungeoned).

-include("common.hrl").
-include("dungeoned.hrl").

%% API
-export([
	load_dungeoned/0,
	save_dungeoned/1
]).

load_dungeoned() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_DUNGEONED, #{?BSONSET_INT(<<"index">>, 1)}) of
		Bson = #{} ->
			#dungeoned{
				rank_list = bson_list_to_rank_list(?BSON_LIST(Bson, rank_list)),
				fight_map = bson_list_to_fight_map(?BSON_LIST(Bson, fight_map)),
				is_settle = ?BSON_BOOL(Bson, is_settle)
			};
		_ ->
			#dungeoned{}
	end.

bson_list_to_rank_list(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		[#dungeoned_rank{
			id = ?BSON_INT(Bson, id),
			kills = ?BSON_INT(Bson, kills),
			tick = ?BSON_INT(Bson, tick),
			show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show))
		} | Acc]
	end, [], BsonList).

bson_list_to_fight_map(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		RoleId = ?BSON_INT(Bson, role_id),
		maps:put(RoleId, #dungeoned_fight{
			combat_id = ?BSON_INT(Bson, combat_id),
			state = ?BSON_INT(Bson, state),
			cur_floor = ?BSON_INT(Bson, cur_floor),
			reward = bson_list_to_reward(?BSON_LIST(Bson, reward))
		}, Acc)
	end, maps:new(), BsonList).

bson_list_to_reward(BsonList) ->
	lists:foldl(fun(Bson, Acc) ->
		ConfId = ?BSON_INT(Bson, conf_id),
		Amount = ?BSON_INT(Bson, amount),
		maps:put(ConfId, Amount, Acc)
	end, maps:new(), BsonList).


save_dungeoned(Dungeoned) ->
	Bson = #{
		?BSONSET_INT(index, 1),
		?BSONSET_BOOL(is_settle, Dungeoned#dungeoned.is_settle),
		?BSONSET_LIST(rank_list, rank_list_to_bson_list(Dungeoned#dungeoned.rank_list)),
		?BSONSET_LIST(fight_map, fight_map_to_bson_list(Dungeoned#dungeoned.fight_map))
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_DUNGEONED, #{?BSONSET_INT(<<"index">>, 1)}, #{<<"$set">> => Bson}).

rank_list_to_bson_list(RankList) ->
	lists:foldl(fun(Ranker, Acc) ->
		[#{
			?BSONSET_INT(id, Ranker#dungeoned_rank.id),
			?BSONSET_INT(kills, Ranker#dungeoned_rank.kills),
			?BSONSET_INT(tick, Ranker#dungeoned_rank.tick),
			?BSONSET_BSON(show, lib_common:player_show_to_bson(Ranker#dungeoned_rank.show))
		} | Acc]
	end, [], RankList).

fight_map_to_bson_list(FightMap) ->
	maps:fold(fun(RoleId, Detail, Acc) ->
		[#{
			?BSONSET_INT(role_id, RoleId),
			?BSONSET_INT(combat_id, Detail#dungeoned_fight.combat_id),
			?BSONSET_INT(state, Detail#dungeoned_fight.state),
			?BSONSET_INT(cur_floor, Detail#dungeoned_fight.cur_floor),
			?BSONSET_LIST(reward, reward_map_to_bson_list(Detail#dungeoned_fight.reward))
		} | Acc]
	end, [], FightMap).

reward_map_to_bson_list(Reward) ->
	maps:fold(fun(K, V, Acc) ->
		[#{
			?BSONSET_INT(conf_id, K),
			?BSONSET_INT(amount, V)
		} | Acc]
	end, [], Reward).