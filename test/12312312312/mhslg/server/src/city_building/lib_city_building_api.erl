%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Jan 2021 2:55 PM
%%%-------------------------------------------------------------------
-module(lib_city_building_api).
-author("lichaoyu").
-include("common.hrl").
-include("city_building.hrl").

%% API
-export([		%% 通用
	building_list/1,
	city_build_val/1,		%% 城池的总建设值
	is_building/1,			%% 城池是否能建设
	level/2					%% 获取建筑的等级
]).
-export([		%% 玩家调用
	is_open/2,			%% 建筑是否开启
	add_total_feat/1,	%% 累计功勋值
	total_feat/0,		%% 功勋值
	add_build_val/1,	%% 累计建设值
	total_build_val/0	%% 总建设值
%%	annual_build_val/0,	%% 年度建设值
%%	season_build_val/0	%% 季度建设值
]).

building_list(CityId) ->
	case tb_city_building:get(CityId) of
		false -> [];
		TbCityBuilding -> lists:umerge(maps:values(TbCityBuilding))
	end
.
city_build_val(CityId) ->
	BuildingIdList = building_list(CityId),
	ValList = [
		begin
			Conf = tb_building_kind:get(BuildingId),
			LevelList = maps:get(level, Conf),
			lists:last(LevelList)
		end || BuildingId <- BuildingIdList],
	lists:sum(ValList)
.

is_building(CityId) ->
	is_map(tb_city_building:get(CityId))
.
level(BuildingId, Count) ->
	Level = maps:get(level, tb_building_kind:get(BuildingId)),
	l(Level, Count, 0)
.
l([], _, N) -> N;
l([L | List], Count, N) when L =< Count -> l(List, Count, N + 1);
l(_, _, N)-> N.

is_open(BuildingId, BuildingMap) ->
	try
		#{
			open_one := OpenOne,
			open_two := OpenTwo
		} = tb_building_kind:get(BuildingId),
		[?JUDGE_RETURN(lib_city_building_api:level(Id, maps:get(Id, BuildingMap)) >= L, ?ERROR_CITY_BUILDING_UNLOCK) || [Id, L] <- OpenOne],
		[case T of
			 ?TYPE_NOBILITY -> ?JUDGE_RETURN(lib_nobility_api:is_reach(L), ?ERROR_NOBILITY_ID);
			 ?TYPE_COUNTRY_TASK -> ?JUDGE_RETURN(lib_country_task_api:is_finish(L), ?ERROR_COUNTRY_TASK)
		 end || [T, L] <- OpenTwo],
		true
	catch
		_:_ -> false
	end
.

player_city_building() -> lib_player_city_building:get_player_city_building().

add_total_feat(Feat) ->
	CityBuilding = player_city_building(),
	lib_player_city_building:put_player_city_building(CityBuilding#player_city_building{
		total_feat = CityBuilding#player_city_building.total_feat + Feat
	})
.

total_feat() ->
	(player_city_building())#player_city_building.total_feat
.

add_build_val(Val) ->
	CityBuilding = player_city_building(),
	lib_player_city_building:put_player_city_building(CityBuilding#player_city_building{
		total_build_val = CityBuilding#player_city_building.total_build_val + Val
	})
.

total_build_val() ->
	(player_city_building())#player_city_building.total_build_val
.