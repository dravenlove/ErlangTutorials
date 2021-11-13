%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Feb 2021 10:04 AM
%%%-------------------------------------------------------------------
-module(db_city_visiting).
-author("lichaoyu").
-include("common.hrl").
-include("city_visiting.hrl").

%% API
-export([
	load_player_city_visiting/1,
	save_player_city_visiting/1
]).

load_player_city_visiting(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_CITY_VISITING, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			CityIndustryMap = lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"city_visiting">>)),
			#player_city_visiting{
				id = PlayerId,
				city_visiting = CityIndustryMap
			};
		_ ->
			#player_city_visiting{id = PlayerId}
	end
.

save_player_city_visiting(PlayerCityVisiting) ->
	#player_city_visiting{
		id = PlayerId,
		city_visiting = CityVisitingMap
	} = PlayerCityVisiting,
	CityVisitingList = lib_common:map_to_bson_list(CityVisitingMap),
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"city_visiting">>, CityVisitingList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_CITY_VISITING, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.
