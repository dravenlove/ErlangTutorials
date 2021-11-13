%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 十一月 2020 10:29
%%%-------------------------------------------------------------------
-module(db_player_dungeoned).

-include("common.hrl").
-include("dungeoned.hrl").

%% API
-export([
	load_player_dungeoned/1,
	save_player_dungeoned/1
]).

load_player_dungeoned(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_DUNGEONED, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			RewardList = ?BSON_LIST(Bson, reward),
			RewardMap =
			lists:foldl(fun(Bson1, Maps) ->
				ConfId = ?BSON_INT(Bson1, conf_id),
				Amount = ?BSON_INT(Bson1, amount),
				maps:put(ConfId, Amount, Maps)
			end, maps:new(), RewardList),

			#player_dungeoned{
				id = PlayerId,
				cur_season = ?BSON_INT(Bson, cur_season),
				use_times = ?BSON_INT(Bson, use_times),
				buy_times = ?BSON_INT(Bson, buy_times),
				state = ?BSON_INT(Bson, state),
				combat_id = ?BSON_INT(Bson, combat_id),
				cur_floor = ?BSON_INT(Bson, cur_floor),
				reward = RewardMap
			};
		_ ->
			#player_dungeoned{
				id = PlayerId
			}
	end.

save_player_dungeoned(PlayerDungeoned) ->
	PlayerId = PlayerDungeoned#player_dungeoned.id,

	BsonList =
	maps:fold(fun(ConfId, Amount, List) ->
		[#{
			?BSONSET_INT(<<"conf_id">>, ConfId),
			?BSONSET_INT(<<"amount">>, Amount)
		} | List]
	end, [], PlayerDungeoned#player_dungeoned.reward),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_INT(cur_season, PlayerDungeoned#player_dungeoned.cur_season),
		?BSONSET_INT(use_times, PlayerDungeoned#player_dungeoned.use_times),
		?BSONSET_INT(buy_times, PlayerDungeoned#player_dungeoned.buy_times),
		?BSONSET_INT(state, PlayerDungeoned#player_dungeoned.state),
		?BSONSET_INT(combat_id, PlayerDungeoned#player_dungeoned.combat_id),
		?BSONSET_INT(cur_floor, PlayerDungeoned#player_dungeoned.cur_floor),
		?BSONSET_LIST(reward, BsonList)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_DUNGEONED, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson}).