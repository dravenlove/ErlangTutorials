%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. 6月 2021 15:46
%%%-------------------------------------------------------------------
-module(inner_building_info).
-author("df").
-include("hero_crops_study.hrl").
-include("inner_city.hrl").
-include("barrack_train.hrl").
-include("common.hrl").
-include("ProtoPublic.hrl").

%% API
-export([
	get_inner_building_info/1
]).


get_inner_building_info(BuildingID) ->
	Config = tb_building:get(BuildingID),
	Building = lib_inner_city_api:building_info(BuildingID),
	case Building#building.is_open =/= 1 of
  		true -> #'ProtoBuildingInfo'{};
		false-> #'ProtoBuildingInfo'{
			building_item = get_building_item(BuildingID,maps:get(class_id_big,Config)),
			barrack_train = get_barrack_train(BuildingID,maps:get(class_id_big,Config)),
			equip_tips = get_equip_tips(BuildingID)
		}
	end
.


%%================%%
%% 自行添加判断，不属于自己建筑返回 undefined 即可
get_building_item(BuildingID,112) ->
	[Item_id,Item_num,Max_num,_Production_time,_Harvest_interval] = lib_inner_city:get_building_item(BuildingID),
	#'ProtoBuildingItem'{
		item_id = Item_id,num = Item_num, max_num = Max_num
	}
;
get_building_item(BuildingID,106) ->
	Barrack = lib_barrack_train:get_barrack_info(BuildingID),
	case lib_inner_city_api:building_state(BuildingID) =/= ?BUILDING_GET_ITEM of
		true -> #'ProtoBuildingItem'{item_id = 0,num = 0};
		false-> #'ProtoBuildingItem'{item_id = Barrack#barrack.soldier_type,num = Barrack#barrack.train_num}
	end
;
get_building_item(_BuildingID,_ClassBig) ->
	undefined
.

get_barrack_train(BuildingID,106) ->
	Barrack = lib_barrack_train:get_barrack_info(BuildingID),
	Max = lib_barrack_train:get_max_num(BuildingID),
	Crops_study = lib_hero_crops_study_api:get_crops_study(Barrack#barrack.soldier_type),
	#'ProtoEnlistedMan'{
		type = Barrack#barrack.soldier_type,num = Barrack#barrack.store_num,max_num = Max,
		study_time = Crops_study#crops_study.study_time,time = lib_hero_crops_study_api:get_recovery_time(Barrack#barrack.soldier_type)
	}
;
get_barrack_train(_BuildingID,_ClassBig) ->
	undefined
.

get_equip_tips(?BUILDING_SKY_MELTING_POT) ->
	{K, V} = lib_player_equip:get_tips(),
	#'ProtoKeyValue'{
		key = K,
		value = V
	}
;
get_equip_tips(_BuildingID) ->
	undefined
.
