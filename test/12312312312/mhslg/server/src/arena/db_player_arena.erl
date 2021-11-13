%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 2月 2021 11:41
%%%-------------------------------------------------------------------
-module(db_player_arena).
-author("13661").

-include("common.hrl").
-include("arena.hrl").

%% API
-export([
	load_player_arena/1,
	save_player_arena/1
]).

load_player_arena(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_PLAYER_ARENA, #{?BSONSET_INT(id, PlayerId)}) of
		Res = #{} ->
			#player_arena{
				id = PlayerId,
				challenge_times = ?BSON_INT(Res, challenge_times),
				buy_times = ?BSON_INT(Res, buy_times),
				refresh_tick = ?BSON_INT(Res, refresh_tick)
			};
		_ -> #player_arena{
			id = PlayerId
		}
	end
.

save_player_arena(PlayerArena) ->
	PlayerId = PlayerArena#player_arena.id,
	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_INT(challenge_times, PlayerArena#player_arena.challenge_times),
		?BSONSET_INT(buy_times, PlayerArena#player_arena.buy_times),
		?BSONSET_INT(refresh_tick, PlayerArena#player_arena.refresh_tick)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_ARENA,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson})
.