%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Feb 2021 5:41 PM
%%%-------------------------------------------------------------------
-module(db_hero_busy).
-author("lichaoyu").
-include("common.hrl").
-include("hero_busy.hrl").

%% API
-export([
	load_player_hero_busy/1,
	save_player_hero_busy/1
]).

load_player_hero_busy(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_HERO_BUSY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			HeroBusyList = [bson_to_hero_busy(X) || X <- ?BSON_LIST(Bson, <<"hero_busy_list">>)],
			HeroBusyDict = lists:foldl(
				fun(HeroBusy, Dict) ->
					dict:store(HeroBusy#hero_busy.hero_id, HeroBusy, Dict)
				end, dict:new(), HeroBusyList),
			#player_hero_busy{
				id = PlayerId,
				pasture_limit = ?BSON_LIST(Bson, <<"pasture_limit">>),
				incident_time = lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"incident_time">>)),
				hero_busy_dict = HeroBusyDict
			};
		_ ->
			#player_hero_busy{id = PlayerId}
	end
.
bson_to_hero_busy(Bson) ->
	#hero_busy{
		hero_id = ?BSON_INT(Bson, <<"hero_id">>),
		type = ?BSON_INT(Bson, <<"type">>),
		city_id = ?BSON_INT(Bson, <<"city_id">>),
		incident = ?BSON_INT(Bson, <<"incident">>),
		start_tick = ?BSON_INT(Bson, <<"start_tick">>),
		param = ?BSON_LIST(Bson, <<"param">>),
		finish_tick = ?BSON_INT(Bson, <<"finish_tick">>)
	}
.

save_player_hero_busy(PlayerHeroBusy) ->
	#player_hero_busy{
		id = PlayerId,
		pasture_limit = PastureLimit,
		incident_time = IncidentTime,
		hero_busy_dict = HeroBusyDict
	} = PlayerHeroBusy,
	HeroBusyList = dict:fold(
		fun(_, HeroBusy, List) ->
			[hero_busy_to_bson(HeroBusy) | List]
		end, [], HeroBusyDict),
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"pasture_limit">>, PastureLimit),
		?BSONSET_LIST(<<"incident_time">>, lib_common:map_to_bson_list(IncidentTime)),
		?BSONSET_LIST(<<"hero_busy_list">>, HeroBusyList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_HERO_BUSY, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.
hero_busy_to_bson(HeroBusy) ->
	#hero_busy{
		hero_id = HeroId,
		type = Type,
		city_id = CityId,
		incident = Incident,
		start_tick = StartTick,
		param = Param,
		finish_tick = FinishTick
	} = HeroBusy,
	#{
		?BSONSET_INT(<<"hero_id">>, HeroId),
		?BSONSET_INT(<<"type">>, Type),
		?BSONSET_INT(<<"city_id">>, CityId),
		?BSONSET_INT(<<"incident">>, Incident),
		?BSONSET_INT(<<"start_tick">>, StartTick),
		?BSONSET_LIST(<<"param">>, Param),
		?BSONSET_INT(<<"finish_tick">>, FinishTick)
	}
.
