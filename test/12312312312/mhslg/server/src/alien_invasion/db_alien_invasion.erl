%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 08. Jul 2021 5:28 PM
%%%-------------------------------------------------------------------
-module(db_alien_invasion).
-author("lichaoyu").
-include("common.hrl").
-include("alien_invasion.hrl").

%% API
-export([
	load_player_alien_invasion/1,
	save_player_alien_invasion/1
]).

load_player_alien_invasion(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_PLAYER_ALIEN_INVASION, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_alien_invasion{
				id = PlayerId,
				tick = ?BSON_INT(Bson, <<"tick">>),
				save_time = ?BSON_INT(Bson, <<"save_time">>)
			};
		_ ->
			#player_alien_invasion{
				id = PlayerId,
				tick = lib_timer:unixtime()
			}
	end
.
%%list_to_alien_invasion(List) ->
%%	lists:foldl(
%%		fun(Bson, Dict) ->
%%			City = ?BSON_INT(Bson, <<"key">>),
%%			ClearingId = ?BSON_STRING(Bson, <<"clearing_id">>),
%%			Fighters = db_combat_queue:bson_list_to_fighters(?BSON_LIST(Bson, <<"value">>)),
%%			dict:store(City, {ClearingId, Fighters}, Dict)
%%		end, dict:new(), List)
%%.


save_player_alien_invasion(PlayerAlienInvasion) ->
	PlayerId = PlayerAlienInvasion#player_alien_invasion.id,
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_INT(<<"tick">>, PlayerAlienInvasion#player_alien_invasion.tick),
		?BSONSET_INT(<<"save_time">>, PlayerAlienInvasion#player_alien_invasion.save_time)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_PLAYER_ALIEN_INVASION, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.
%%alien_invasion_to_list(AlienInvasionDict) ->
%%	dict:fold(
%%		fun(City, {ClearingId, Fighters}, List) ->
%%			[#{
%%				?BSONSET_INT(<<"key">>, City),
%%				?BSONSET_STRING(<<"clearing_id">>, ClearingId),
%%				?BSONSET_LIST(<<"value">>, db_combat_queue:fighters_to_bson_list(Fighters))
%%			} | List]
%%		end, [], AlienInvasionDict)
%%.
