%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 16. 11月 2020 14:39
%%%-------------------------------------------------------------------
-module(db_map).
-author("lichaoyu").
-include("common.hrl").
-include("player.hrl").
-include("map.hrl").


%% API
-export([
	load_map_time/0,
	save_map_time/1,
	load_all_map/0,
	save_all_map/1,
	load_city_visiting/0,
	save_city_visiting/1
]).

load_all_map() ->
	load_map(tb_world_city:get_list(), dict:new())
.

load_map([], CityDict) -> CityDict;
load_map([CityId | CityIdList], CityDict) ->
	Conf = tb_world_city:get(CityId),
	case maps:get(type, Conf) =:= ?WORLD_CITY of
		false -> load_map(CityIdList, CityDict);
		true ->
			City =
				case mongo_poolboy:find_one(?MMO_POOL, ?DB_MAP, #{?BSONSET_INT(<<"id">>, CityId)}) of
					Bson = #{} ->
						TaxBsonList = ?BSON_LIST(Bson, tax_revenue_map),
						TaxMap = lib_common:bson_list_to_map(TaxBsonList),
						SendTaxBsonList = ?BSON_LIST(Bson, send_tax_revenue_map),
						SendTaxMap = lib_common:bson_list_to_map(SendTaxBsonList),
						#city{
							id = CityId,
							country = ?BSON_INT(Bson, <<"country">>),
							fighting = ?BSON_INT(Bson, <<"fighting">>),
							antiwar = ?BSON_INT(Bson, <<"antiwar">>),
							master_id = ?BSON_INT(Bson, <<"master_id">>),
							master_name = ?BSON_STRING(Bson, <<"master_name">>),
							master_icon = ?BSON_INT(Bson, <<"master_icon">>),
							tax_revenue_map = TaxMap,
							send_tax_revenue_map = SendTaxMap,
							tax_revenue_reset_tick = ?BSON_INT(Bson, tax_revenue_reset_tick),
							tax_revenue_produce_tick = ?BSON_INT(Bson, tax_revenue_produce_tick),
							tax_revenue_send_tick = ?BSON_INT(Bson, tax_revenue_send_tick),
							deduct_protect_tick = ?BSON_INT(Bson, <<"deduct_protect_tick">>),
							building_map = lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"building_map">>)),
							guard_num = lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"guard_num">>)),
							defend_troops = ?BSON_LIST(Bson, <<"defend_troops">>),
							attack_country = ?BSON_INT(Bson, <<"attack_country">>),
							attack_troops = ?BSON_LIST(Bson, <<"attack_troops">>),
							occupy_tick = ?BSON_INT(Bson, <<"occupy_tick">>)
						};
					_ ->
						#city{id = CityId, country = maps:get(country, Conf)}
				end,
			load_map(CityIdList, dict:store(CityId, City, CityDict))
	end
.

save_all_map(CityDict) ->
	A = dict:fold(fun(CityId, City, Acc) ->
		save_map(CityId, City),
		Acc+1
	end, 0, CityDict),
	?DEBUG("save ~p city", [A])
.

%%根据id保存城池的信息
save_map(Id, City) ->
	TaxBsonList = lib_common:map_to_bson_list(City#city.tax_revenue_map),
	SendTaxBsonList = lib_common:map_to_bson_list(City#city.send_tax_revenue_map),

	Bson = #{
		?BSONSET_INT(id, Id),
		?BSONSET_INT(country, City#city.country),
		?BSONSET_INT(fighting, City#city.fighting),
		?BSONSET_INT(antiwar, City#city.antiwar),
		?BSONSET_INT(master_id, City#city.master_id),
		?BSONSET_STRING(master_name, City#city.master_name),
		?BSONSET_INT(<<"master_icon">>, City#city.master_icon),
		?BSONSET_LIST(tax_revenue_map, TaxBsonList),
		?BSONSET_LIST(send_tax_revenue_map, SendTaxBsonList),
		?BSONSET_INT(tax_revenue_reset_tick, City#city.tax_revenue_reset_tick),
		?BSONSET_INT(tax_revenue_produce_tick, City#city.tax_revenue_produce_tick),
		?BSONSET_INT(tax_revenue_send_tick, City#city.tax_revenue_send_tick),
		?BSONSET_INT(<<"deduct_protect_tick">>, City#city.deduct_protect_tick),
		?BSONSET_LIST(<<"building_map">>, lib_common:map_to_bson_list(City#city.building_map)),
		?BSONSET_LIST(<<"guard_num">>, lib_common:map_to_bson_list(City#city.guard_num)),
		?BSONSET_LIST(<<"defend_troops">>, City#city.defend_troops),
		?BSONSET_INT(<<"attack_country">>, City#city.attack_country),
		?BSONSET_LIST(<<"attack_troops">>, City#city.attack_troops),
		?BSONSET_INT(<<"occupy_tick">>, City#city.occupy_tick)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_MAP, #{?BSONSET_INT(id, Id)}, #{<<"$set">> => Bson})
.

load_map_time() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_MAP, #{?BSONSET_INT(<<"id">>, 1)}) of
		Bson = #{} -> ?BSON_LIST(Bson, <<"map_time">>);
		_ -> [0, 0]
	end
.
save_map_time(MapTime) ->
	Bson = #{?BSONSET_LIST(<<"map_time">>, MapTime)},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_MAP, #{?BSONSET_INT(<<"id">>, 1)}, #{<<"$set">> => Bson})
.

load_city_visiting() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_MAP, #{?BSONSET_INT(<<"id">>, 2)}) of
		Bson = #{} -> lib_common:bson_list_to_map(?BSON_LIST(Bson, <<"city_visiting_list">>));
		_ -> maps:new()
	end
.
save_city_visiting(CityVisitingMap) ->
	Bson = #{?BSONSET_LIST(<<"city_visiting_list">>, lib_common:map_to_bson_list(CityVisitingMap))},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_MAP, #{?BSONSET_INT(<<"id">>, 2)}, #{<<"$set">> => Bson})
.

