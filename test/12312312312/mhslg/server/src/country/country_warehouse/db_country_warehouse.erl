%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Dec 2020 10:15 AM
%%%-------------------------------------------------------------------
-module(db_country_warehouse).
-author("df").
-include("common.hrl").
-include("country_warehouse.hrl").


%% API
-export([
	load_warehouse_gather/0,
	save_warehouse_gather/1
]).


bson_to_country_warehouse(Bson) ->
	RechargesList = ?BSON_LIST(Bson, recharges_dict),
	RechargesDict =
		lists:foldl(fun(Bson1, Dict) ->
			Barrack_id = ?BSON_INT(Bson1, barrack_id),
			dict:store(Barrack_id, #recharge_dividends{
				id  = Barrack_id,
				recharge_tick = ?BSON_INT(Bson1, recharge_tick),
				name  = ?BSON_STRING(Bson1, name),
				official_position = ?BSON_INT(Bson1, official_position),
				is_chatelain = ?BSON_INT(Bson1, is_chatelain),
				num = ?BSON_INT(Bson1, num)
			}, Dict)
					end, dict:new(), RechargesList),
	TreasureBoxList = ?BSON_LIST(Bson, player_treasure_box_dict),
	BarrackDict =
		lists:foldl(fun(Bson2, Dict) ->
			Id = ?BSON_INT(Bson2, id),
			dict:store(Id, #treasure_box{
				id  = Id,
				box_level = ?BSON_INT(Bson2, box_level)
			}, Dict)
					end, dict:new(), TreasureBoxList),
	BsonQuarterIncomeList = ?BSON_LIST(Bson, quarter_income_map),
	QuarterIncomeMap =
		lists:foldl(fun(Bson3, Dict) ->
			Id = ?BSON_INT(Bson3, id),
			dict:store(Id, #resource{
				id  = Id,
				num = ?BSON_INT(Bson3, num)
			}, Dict)
					end, dict:new(), BsonQuarterIncomeList),
	BsonYearIncomeList = ?BSON_LIST(Bson, year_income_map),
	YearIncomeMap =
		lists:foldl(fun(Bson4, Dict) ->
			Id = ?BSON_INT(Bson4, id),
			dict:store(Id, #resource{
				id  = Id,
				num = ?BSON_INT(Bson4, num)
			}, Dict)
					end, dict:new(), BsonYearIncomeList),
	#country_warehouse{
		country_id =?BSON_INT(Bson, id),
		quarter_income_map = QuarterIncomeMap,
		year_income_map = YearIncomeMap,
		recharges_dict = RechargesDict,
		player_treasure_box_dict = BarrackDict
	}
.

country_warehouse_to_bson(Country_warehouse) when is_record(Country_warehouse, country_warehouse) ->
	Country_Id = Country_warehouse#country_warehouse.country_id,
	RechargesList =
		dict:fold(fun(_Barrack_id, Recharge_dividends, List) ->
			[#{
				?BSONSET_INT(id, Recharge_dividends#recharge_dividends.id),
				?BSONSET_INT(recharge_tick, Recharge_dividends#recharge_dividends.recharge_tick),
				?BSONSET_STRING(name, Recharge_dividends#recharge_dividends.name),
				?BSONSET_INT(official_position, Recharge_dividends#recharge_dividends.official_position),
				?BSONSET_INT(is_chatelain, Recharge_dividends#recharge_dividends.is_chatelain),
				?BSONSET_INT(num, Recharge_dividends#recharge_dividends.num)
			} | List]
				  end, [], Country_warehouse#country_warehouse.recharges_dict),
	TreasureBoxList =
		dict:fold(fun(_Player_id, Treasure_box, List) ->
			[#{
				?BSONSET_INT(id, Treasure_box#treasure_box.id),
				?BSONSET_INT(box_level, Treasure_box#treasure_box.box_level)
			} | List]
				  end, [], Country_warehouse#country_warehouse.player_treasure_box_dict),
	QuarterIncomeList =
		dict:fold(fun(_Item_id, QuarterResource, List) ->
			[#{
				?BSONSET_INT(id, QuarterResource#resource.id),
				?BSONSET_INT(num, QuarterResource#resource.num)
			} | List]
				  end, [], Country_warehouse#country_warehouse.quarter_income_map),
	YearIncomeList =
		dict:fold(fun(_Item_id, YearResource, List) ->
			[#{
				?BSONSET_INT(id, YearResource#resource.id),
				?BSONSET_INT(num, YearResource#resource.num)
			} | List]
				  end, [], Country_warehouse#country_warehouse.year_income_map),
	#{
		?BSONSET_INT(id,Country_Id),
		?BSONSET_LIST(quarter_income_map,QuarterIncomeList),
		?BSONSET_LIST(year_income_map,YearIncomeList),
		?BSONSET_LIST(recharges_dict,RechargesList),
		?BSONSET_LIST(player_treasure_box_dict,TreasureBoxList)
	}
.


player_info_to_bson(Player_info) ->
	#{
		?BSONSET_INT(id,Player_info#player_country_warehouse.id),
		?BSONSET_INT(country,Player_info#player_country_warehouse.country),
		?BSONSET_INT(get_red_packet_tick, Player_info#player_country_warehouse.get_red_packet_tick),
		?BSONSET_INT(year_annihilation, Player_info#player_country_warehouse.year_annihilation),
		?BSONSET_INT(year_battle_losses, Player_info#player_country_warehouse.year_battle_losses),
		?BSONSET_INT(year_construction_value, Player_info#player_country_warehouse.year_construction_value)
	}
.

bson_to_player_info(Bson) ->
	#player_country_warehouse{
		id = ?BSON_INT(Bson,  id),
		country = ?BSON_INT(Bson,  country),
		get_red_packet_tick = ?BSON_INT(Bson,  get_red_packet_tick),
		year_annihilation = ?BSON_INT(Bson,  year_annihilation),
		year_battle_losses = ?BSON_INT(Bson,  year_battle_losses),
		year_construction_value = ?BSON_INT(Bson,  year_construction_value)
	}
.

load_warehouse_gather() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_COUNTRY_WAREHOUSE, #{?BSONSET_INT(uid, 1)}) of
	Res = #{} ->
		BsonCountryWarehouseList = ?BSON_LIST(Res, country_warehouse_map, []),
		CountryWarehouseMap =
		lists:foldl(fun(BsonCountryWarehouse, Map) ->
			CountryWarehouse = bson_to_country_warehouse(BsonCountryWarehouse),
			maps:put(CountryWarehouse#country_warehouse.country_id, CountryWarehouse, Map)
		end, maps:new(), BsonCountryWarehouseList),
		CountryIdList = tb_role_country:get_list(),
		NewCountryWarehouseMap =
		lists:foldl(fun(CountryId, Map) ->
			Country = maps:get(CountryId, CountryWarehouseMap, #country_warehouse{country_id = CountryId}),
			maps:put(CountryId, Country, Map)
		end, maps:new(), CountryIdList),
		BsonPlayerInfoList = ?BSON_LIST(Res, player_info, []),
		PlayerInfoMap =
		lists:foldl(fun(BsonPlayerInfo, Map) ->
			PlayerInfo = bson_to_player_info(BsonPlayerInfo),
			maps:put(PlayerInfo#player_country_warehouse.id, PlayerInfo, Map)
		end, maps:new(), BsonPlayerInfoList),
		#warehouse_gather{
			country_warehouse_map =  NewCountryWarehouseMap,
			player_info = PlayerInfoMap
		};
	_ ->
		CountryIdList = tb_role_country:get_list(),
		CountryWarehouseMap =
		lists:foldl(fun(CountryId, Map) ->
			maps:put(CountryId, #country_warehouse{country_id = CountryId}, Map)
		end, maps:new(), CountryIdList),

		#warehouse_gather{
			country_warehouse_map = CountryWarehouseMap
		}
	end
.


save_warehouse_gather(Warehouse_gather) when is_record(Warehouse_gather, warehouse_gather) ->
	BsonCountryWarehouseList =
		maps:fold(fun(_, CountryWarehouse, List) ->
			[country_warehouse_to_bson(CountryWarehouse) | List]
				  end, [], Warehouse_gather#warehouse_gather.country_warehouse_map),
	BsonPlayerInfoList =
		maps:fold(fun(_, Player_info, List) ->
			[player_info_to_bson(Player_info) | List]
				  end, [], Warehouse_gather#warehouse_gather.player_info),
	Bson =
		#{
			?BSONSET_INT(uid, 1),
			?BSONSET_LIST(country_warehouse_map, BsonCountryWarehouseList),
			?BSONSET_LIST(player_info, BsonPlayerInfoList)
		},

	QueryBson = #{
		?BSONSET_INT(uid, 1)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_COUNTRY_WAREHOUSE, QueryBson, Bson)
.

