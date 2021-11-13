%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Dec 2020 3:59 PM
%%%-------------------------------------------------------------------
-module(lib_barrack_train_api).
-author("df").
-include("inner_city.hrl").
-include("common.hrl").
-include("barrack_train.hrl").
%% API
-export([
	inquire_soldier_num/1,					%% 获取兵营里存放士兵的数量
	request_get_store_soldier/2,			%% 领取兵营里的士兵
	request_return_store_soldier/2,			%% 返还兵营里的士兵
	get_open_soldier_level/1,				%% 获取开放兵种等级
	soldier_level_change_inform/2,			%% 兵种等级变更判断
	gm_barrack_train/2,
	add_accumulated_training_num/1,			%% 增加累计训练数量
	get_accumulated_training_num/0,			%% 获取累计训练数量

	initial_soldiers/0						%% 初始化玩家兵力
]).




inquire_soldier_num(Soldier_type) ->
	lib_barrack_train:inquire_soldier_num(Soldier_type)
.


request_get_store_soldier(Soldier_type,Get_Num)	->
	lib_barrack_train:request_get_store_soldier(Soldier_type,Get_Num)
.


request_return_store_soldier(Soldier_type,Get_Num)	->
	lib_barrack_train:request_return_store_soldier(Soldier_type,Get_Num)
.


get_open_soldier_level(Soldier_type) ->
	Barrack_id = lib_barrack_train:corps_of_barrack(Soldier_type),
	Building = lib_inner_city:get_buildings_info(Barrack_id),
	Key = Soldier_type * 100 + Building#building.building_lv,
	Tb = tb_hero_corps_barracks:get(Key),
	case Tb of
		false  -> 1;
		_ 	   -> maps:get(unlock_lv,Tb)
	end
.

soldier_level_change_inform(Barrack_id,Building_lv)	->
	Old_building_lv = Building_lv - 1,
	case Old_building_lv =< 0 of
		true  ->skip;
		false ->
				#{'jsonvalue' := Barrack_corps_list} = tb_const:get(barrack_corps),
				Predicate = fun([E,_]) -> E =:= Barrack_id end,
				[[_,Type]] = lists:filter(Predicate, Barrack_corps_list),
				%% 升级前开放等级
				OldKey = Type * 100 + Old_building_lv,
				#{'unlock_lv' := Old_lv} = tb_hero_corps_barracks:get(OldKey),
				%% 升级后开放等级
				Key = Type * 100 + Building_lv,
				#{'unlock_lv' := NewLevel} = tb_hero_corps_barracks:get(Key),
			%%	?DEBUG("~p-------------~p",[Old_lv,NewLevel]),
				case NewLevel =:= Old_lv of
					true ->skip;
					false ->soldier_level_change(Type,NewLevel)
				end
	end
.

%% 兵种等级变更通知
soldier_level_change(Type,NewLevel) ->
	lib_hero_corps:update_corps_level(Type, NewLevel, true)

.

%% gm命令训练士兵
gm_barrack_train(Soldier_type,Num) ->
	Barrack_id = lib_barrack_train:corps_of_barrack(Soldier_type),
	Barrack = lib_barrack_train:get_barrack_info(Barrack_id),
	OldNum = inquire_soldier_num(Soldier_type),
	lib_barrack_train:update_barrack(Barrack#barrack{store_num = OldNum + Num})
.


add_accumulated_training_num(Num) ->
	Info = lib_barrack_train:get_player_barrack_train(),
	lib_barrack_train:put_player_barrack_train(Info#barrack_train{
		accumulated_training_num = Info#barrack_train.accumulated_training_num + Num
	})
.

get_accumulated_training_num() ->
	Info = lib_barrack_train:get_player_barrack_train(),
	Info#barrack_train.accumulated_training_num
.

initial_soldiers() ->
	Num = maps:get(value, tb_const:get(initial_soldiers),0),
	lists:foreach(fun([Barrack_id,_]) ->
		Barrack = lib_barrack_train:get_barrack_info(Barrack_id),
		lib_barrack_train:update_barrack(Barrack#barrack{store_num = Num})
	end,maps:get(jsonvalue, tb_const:get(barrack_corps)))
.