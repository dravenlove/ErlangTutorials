%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 03. Feb 2021 4:11 PM
%%%-------------------------------------------------------------------
-module(db_city_industry).
-author("lichaoyu").
-include("common.hrl").
-include("city_industry.hrl").

%% API
-export([
	load_player_city_industry/1,
	save_player_city_industry/1
]).

load_player_city_industry(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_CITY_INDUSTRY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			CityIndustryList = [bson_to_city_industry(X) || X <- ?BSON_LIST(Bson, <<"city_industry_list">>)],
			CityIndustryDict = lists:foldl(
				fun(CityIndustry, Dict) ->
					dict:store(CityIndustry#city_industry.id, CityIndustry, Dict)
				end, dict:new(), CityIndustryList),
			#player_city_industry{
				id = PlayerId,
				total_map = lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"total_list">>)),
				city_industry = CityIndustryDict
			};
		_ ->
			#player_city_industry{id = PlayerId}
	end
.
bson_to_city_industry(Bson) ->
	#city_industry{
		id = ?BSON_INT(Bson, <<"id">>),
		hold_tick = ?BSON_INT(Bson, <<"hold_tick">>),
		last_tick = ?BSON_INT(Bson, <<"last_tick">>),
		work_time = ?BSON_INT(Bson, <<"work_time">>),
		reset_tick = ?BSON_INT(Bson, <<"reset_tick">>)
	}
.

save_player_city_industry(PlayerCityIndustry) ->
	#player_city_industry{
		id = PlayerId,
		total_map = TotalMap,
		city_industry = CityIndustryDict
	} = PlayerCityIndustry,
	CityIndustryList = dict:fold(
		fun(_, CityIndustry, List) ->
			[city_industry_to_bson(CityIndustry) | List]
		end, [], CityIndustryDict),
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"total_list">>, lib_common:map_to_bson_list(TotalMap)),
		?BSONSET_LIST(<<"city_industry_list">>, CityIndustryList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_CITY_INDUSTRY, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.
city_industry_to_bson(CityIndustry) ->
	#city_industry{
		id = Id,
		hold_tick = HoldTick,
		last_tick = LastTick,
		work_time = WorkTime,
		reset_tick = ResetTick
	} = CityIndustry,
	#{
		?BSONSET_INT(<<"id">>, Id),
		?BSONSET_INT(<<"hold_tick">>, HoldTick),
		?BSONSET_INT(<<"last_tick">>, LastTick),
		?BSONSET_INT(<<"work_time">>, WorkTime),
		?BSONSET_INT(<<"reset_tick">>, ResetTick)
	}
.
