%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. Apr 2021 3:44 PM
%%%-------------------------------------------------------------------
-module(lib_country_task).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("country_task.hrl").

-define(COUNTRY_TASK, country_task).

%% API
-export([
	put_country_task/1,
	get_country_task/0,

	city_confirm/3,						%% 返回已占领的城池idList
	city_confirm_building/4,			%% 返回已占领并符合建筑条件的城池idList
	city_confirm_building/3				%% 返回势力符合建筑条件的城池数量
]).

put_country_task(Map) ->
	erlang:put(?COUNTRY_TASK, Map)
.
get_country_task() ->
	erlang:get(?COUNTRY_TASK)
.

city_confirm(Country, CityIdList, F) ->
	[#'ProtoCountryTask'{
		id = X,
		current = case F of true -> 1; false -> case lib_map_api:country(X) of Country -> 1; _ -> 0 end end,
		target = 1
	} || X <- CityIdList]
.
city_confirm_building(Country, CityIdList, BuildingId, Level) when is_integer(BuildingId) ->
	[#'ProtoCountryTask'{
		id = X,
		current =
		case (City = lib_map_api:city(X))#city.country of
			Country -> lib_city_building_api:level(BuildingId, maps:get(BuildingId, City#city.building_map));
			_ -> 0
		end,
		target = Level
	} || X <- CityIdList];
city_confirm_building(Country, [CityId], BuildingIdList, Level) ->
	#city{country = C, building_map = BuildingMap} = lib_map_api:city(CityId),
	[#'ProtoCountryTask'{
		id = X,
		current = case C of Country -> lib_city_building_api:level(X, maps:get(X, BuildingMap)); _ -> 0 end,
		target = Level
	} || X <- BuildingIdList]
.
city_confirm_building(Country, BuildingId, Level) ->
	dict:fold(
		fun(CityId, #city{country = C, building_map = BuildingMap}, L) ->
			case Country =:= C andalso maps:is_key(BuildingId, BuildingMap) of
				false -> L;
				true ->
					[#'ProtoCountryTask'{
						id = CityId,
						current = lib_city_building_api:level(BuildingId, maps:get(BuildingId, BuildingMap)),
						target = Level
					} | L]
			end
		end, [], lib_map_api:all_city())
.




