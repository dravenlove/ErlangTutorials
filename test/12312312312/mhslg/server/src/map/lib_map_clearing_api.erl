%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 21. Jan 2021 10:15 AM
%%%-------------------------------------------------------------------
-module(lib_map_clearing_api).
-author("lichaoyu").
-include("common.hrl").
-include("clearing.hrl").

%% API
-export([			%% 需玩家调用
	clearing_json_to_dict/0,		%% 读取地图空地json配置,key:CityId,value:[ClearingId]
	remain_clearing/1,				%% 获取城池还剩下的空地列表
	clearing/1,						%% 获取城池剩余空地，没有返回false
	city_id/1,						%% 获取空地对应的城池

	map_clearing/1,
	json_to_maps/0,
	type/1,					%% 类型
	map_clearing/0,			%% 玩家的空地dict
	is_clearing/1,			%% 空地是否被使用
	have_city_list/1,		%% 类型空地城池


	city_task/3,			%% 为城池指派任务占用空地
	u_clearing/1,			%% 更新空地信息
	u_clearing/2,			%% true通知false不通知
	d_clearing_by_type/2,
	d_clearing/1,			%% 删除空地信息
	d_clearing/2			%% true通知false不通知
]).

-define(NOTICE_UPDATE,	0).		%% 通知更新
-define(NOTICE_DELETE,	1).		%% 通知删除

clearing_json_list() ->
	{_, A} = file:open("ebin/mapCityTrrigerDic.json", [raw, binary]),
	{_, B} = file:read(A, 1024*1024),
	jsx:decode(B)
.

clearing_json_to_dict() ->
	JsonList = clearing_json_list(),
	lists:foldl(
		fun({CityId, List}, Dict) ->
			Value = [binary_to_list(X) || X <- List],
			dict:store(binary_to_integer(CityId), Value, Dict)
		end, dict:new(), JsonList)
.

json_to_maps() ->
	JsonList = clearing_json_list(),
	MapClearing = map_clearing(),
	CityIndexes = lists:foldl(
		fun({CityId, List}, Maps) ->
			Value = [Y || X <- List, not dict:is_key(Y = binary_to_list(X), MapClearing)],
			Key = binary_to_integer(CityId),
			maps:put(Key, Value, Maps)
		end, maps:new(), JsonList),
	u_city_indexes(CityIndexes)
.

remain_clearing(CityId) ->
	CityIndexes = city_indexes(),
	maps:get(CityId, CityIndexes, [])
.

clearing(CityId) ->
	case remain_clearing(CityId) of
		[] -> false;
		L -> hd(L)
	end
.

city_id(ClearingId) ->
	(dict:fetch(ClearingId, map_clearing()))#map_clearing.city_id
.

player_map_clearing() ->
	lib_player_map_clearing:get_map_clearing()
.
city_indexes() ->
	(player_map_clearing())#player_map_clearing.city_indexes
.
map_clearing() ->
	(player_map_clearing())#player_map_clearing.map_clearing
.

is_clearing(ClearingId) ->
	dict:is_key(ClearingId, map_clearing())
.
map_clearing(ClearingId) ->
	dict:fetch(ClearingId, map_clearing())
.
type(ClearingId) ->
	#map_clearing{type = Type} = dict:fetch(ClearingId, map_clearing()),
	Type
.
have_city_list(Type) ->
	MapClearing = map_clearing(),
	dict:fold(
		fun(_, Clearing, List) ->
			case Clearing#map_clearing.type =:= Type of
				true -> [Clearing#map_clearing.city_id | List];
				false -> List
			end
		end, [], MapClearing)
.

city_task(CityId, Type, Data) ->
	CityIndexes = city_indexes(),
	case maps:get(CityId, CityIndexes, []) of
		[] -> false;
		[ClearingId | L] ->
			Clearing = #map_clearing{
				id = ClearingId,
				type = Type,
				city_id = CityId,
				data = Data
			},
			u_clearing(Clearing),
			u_city_indexes(maps:update(CityId, L, CityIndexes)),
			ClearingId
	end
.
u_city_indexes(CityIndexes) ->
	PlayerMapClearing = player_map_clearing(),
	lib_player_map_clearing:put_map_clearing(PlayerMapClearing#player_map_clearing{city_indexes = CityIndexes})
.
u_clearing(MapClearing) ->
	u_clearing(MapClearing, true).
u_clearing(MapClearing, Flag) when is_record(MapClearing, map_clearing) ->
	ClearingDict = map_clearing(),
	u_player_clearing(dict:store(MapClearing#map_clearing.id, MapClearing, ClearingDict)),
	case Flag of true -> lib_player_map_clearing:notice_map_clearing(?NOTICE_UPDATE, MapClearing); false -> skip end
.
u_player_clearing(ClearingDict) ->
	PlayerMapClearing = player_map_clearing(),
	lib_player_map_clearing:put_map_clearing(PlayerMapClearing#player_map_clearing{map_clearing = ClearingDict})
.
d_clearing_by_type(Type, CityId) ->
	ClearingDict = map_clearing(),
	catch dict:map(
		fun(ClearingId, Clearing) ->
			case Clearing#map_clearing.type =:= Type andalso Clearing#map_clearing.city_id =:= CityId of
				true -> d_clearing(ClearingId);
				false -> skip
			end
		end, ClearingDict)
.
d_clearing(ClearingId) ->
	d_clearing(ClearingId, true).
d_clearing(ClearingId, Flag) ->
	ClearingDict = map_clearing(),
	u_player_clearing(dict:erase(ClearingId, ClearingDict)),
	case Flag of true -> lib_player_map_clearing:notice_map_clearing(?NOTICE_DELETE, #map_clearing{id = ClearingId}); false -> skip end,
	json_to_maps() %% todo
.
