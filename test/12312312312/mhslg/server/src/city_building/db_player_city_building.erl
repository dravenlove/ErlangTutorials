%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十一月 2020 18:28
%%%-------------------------------------------------------------------
-module(db_player_city_building).

-include("common.hrl").
-include("city_building.hrl").

%% API
-export([
	load_player_city_building/1,
	save_player_city_building/1
]).

load_player_city_building(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_CITY_BUILDING, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_city_building{
				id = PlayerId,
				total_feat = ?BSON_INT(Bson, <<"total_feat">>),
				total_build_val = ?BSON_INT(Bson, <<"total_build_val">>)
			};
		_ ->
			#player_city_building{id = PlayerId}
	end.

save_player_city_building(CityBuilding) ->
	PlayerId = CityBuilding#player_city_building.id,

	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_INT(<<"total_feat">>, CityBuilding#player_city_building.total_feat),
		?BSONSET_INT(<<"total_build_val">>, CityBuilding#player_city_building.total_build_val)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_CITY_BUILDING,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).