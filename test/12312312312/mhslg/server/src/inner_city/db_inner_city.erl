%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2020 2:34 PM
%%%-------------------------------------------------------------------
-module(db_inner_city).
-author("df").
-include("inner_city.hrl").
-include("common.hrl").
-include("player.hrl").
%% API
-export([
	load_inner_city/1,
	save_inner_city/1
]).



load_inner_city(PlayerId) ->
	?DEBUG("调用load inner city"),
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_INNER_CITY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BuildingList = ?BSON_LIST(Bson, <<"buildings_dict">>),
			Buildings_dict =
				lists:foldl(fun(Bson1, Dict) ->
					BuildingId = ?BSON_INT(Bson1, building_id),
					dict:store(BuildingId, #building{
						building_id = BuildingId,
						building_lv = ?BSON_INT(Bson1, building_lv),
						class_id_big = ?BSON_INT(Bson1, class_id_big),
						class_id = ?BSON_INT(Bson1, class_id),
						building_state  = ?BSON_INT(Bson1, building_state),
						upgrade_tick = ?BSON_INT(Bson1, upgrade_tick),
						remaining_time = ?BSON_INT(Bson1, remaining_time),
						upgrade_total_time = ?BSON_INT(Bson1, upgrade_total_time),
						is_open = ?BSON_INT(Bson1, is_open),
						is_resource_building = ?BSON_INT(Bson1, is_resource_building),
						resource_tick = ?BSON_INT(Bson1, resource_tick)
					}, Dict)
							end, dict:new(), BuildingList),
			#inner_city{
				id = PlayerId,
				use_construction_workers = ?BSON_INT(Bson, use_construction_workers),
				buildings_dict = Buildings_dict,
				working_list = ?BSON_LIST(Bson, working_list)
			}
		;
		_ ->
			#inner_city{
				id = PlayerId
			}

	end.

save_inner_city(Inner_city) when is_record(Inner_city, inner_city) ->
	PlayerId = Inner_city#inner_city.id,
	BuildingsList =
		dict:fold(fun(_PlayerId, Building_list, List) ->
			[#{
				?BSONSET_INT(<<"building_id">>, Building_list#building.building_id),
				?BSONSET_INT(<<"building_lv">>, Building_list#building.building_lv),
				?BSONSET_INT(<<"class_id_big">>, Building_list#building.class_id_big),
				?BSONSET_INT(<<"class_id">>, Building_list#building.class_id),
				?BSONSET_INT(<<"building_state">>, Building_list#building.building_state),
				?BSONSET_INT(<<"upgrade_tick">>, Building_list#building.upgrade_tick),
				?BSONSET_INT(<<"remaining_time">>, Building_list#building.remaining_time),
				?BSONSET_INT(<<"upgrade_total_time">>, Building_list#building.upgrade_total_time),
				?BSONSET_INT(<<"is_open">>, Building_list#building.is_open),
				?BSONSET_INT(<<"is_resource_building">>, Building_list#building.is_resource_building),
				?BSONSET_INT(<<"resource_tick">>, Building_list#building.resource_tick)
			} | List]
				  end, [], Inner_city#inner_city.buildings_dict),
	Bson = #{
		?BSONSET_INT(<<"id">>,PlayerId),
		?BSONSET_INT(<<"use_construction_workers">>,Inner_city#inner_city.use_construction_workers),
		?BSONSET_LIST(<<"buildings_dict">>,BuildingsList),
		?BSONSET_LIST(<<"working_list">>,Inner_city#inner_city.working_list)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_INNER_CITY,
		#{?BSONSET_INT(player_id, PlayerId)},
		#{<<"$set">> => Bson}).
