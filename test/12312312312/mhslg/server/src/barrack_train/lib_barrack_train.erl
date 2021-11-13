%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Dec 2020 3:58 PM
%%%-------------------------------------------------------------------
-module(lib_barrack_train).
-author("df").
-include("common.hrl").
-include("barrack_train.hrl").
-include("inner_city.hrl").
-include("country_task.hrl").
-include("ProtoClient_10127.hrl").
-include("ProtoPublic.hrl").
-include("science.hrl").
%% API
-export([
	get_player_barrack_train/0,
	put_player_barrack_train/1,
	put_player_barrack_train/2,
	player_barrack_train_handler/0
]).
-export([
	request_barrack_train/1,
	request_get_barrack_info/1,
	request_train_accelerate/1,
	auto_train/1,
	get_soldier/1
]).
-export([
	get_barrack_info/1,
	update_barrack/1,
	sign_in/0,
	inquire_soldier_num/1,
	request_get_store_soldier/2,
	request_return_store_soldier/2,
	corps_of_barrack/1,					%% 兵种对应的兵营
	barrack_auto_train/0,
	get_max_num/1
]).

get_player_barrack_train() ->
	erlang:get(?ETS_PLAYER_BARRACK_TRAIN)
.

put_player_barrack_train(Barrack_train) ->
	put_player_barrack_train(Barrack_train,true)
.

put_player_barrack_train(Barrack_train,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BARRACK_TRAIN),
	erlang:put(?ETS_PLAYER_BARRACK_TRAIN, Barrack_train)
.

ets_init() ->
	ets:new(?ETS_PLAYER_BARRACK_TRAIN, [?ETS_KEY_POS(#barrack_train.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_BARRACK_TRAIN, {?TUPLE_INT(id, 1)}, true).


player_barrack_train_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BARRACK_TRAIN,
		table_name = ?DBPLAYER_BARRACK_TRAIN,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_barrack_train:load_barrack_train/1,
		save_func = fun db_barrack_train:save_barrack_train/1,
		get_func = fun get_player_barrack_train/0,
		put_func = fun put_player_barrack_train/2
	}.

%% 获得单个建筑信息
get_barrack_info(Barrack_id) ->
	Player_barrack_train = get_player_barrack_train(),
	Barrack_of_corps = barrack_of_corps(maps:get(jsonvalue, tb_const:get(barrack_corps)),Barrack_id),
	[[_,Soldier_type]] = Barrack_of_corps,
	?DICT_FETCH(Barrack_id, Player_barrack_train#barrack_train.barracks, #barrack{barrack_id  = Barrack_id,soldier_type = Soldier_type})
.

%% 更新单个建筑
update_barrack(Barrack) when is_record(Barrack, barrack) ->
	Player_barrack_train = get_player_barrack_train(),
	NewBarrackState = dict:store(Barrack#barrack.barrack_id, Barrack, Player_barrack_train#barrack_train.barracks),
	put_player_barrack_train(Player_barrack_train#barrack_train{barracks = NewBarrackState})
.

%% 判断兵营对应的兵种
barrack_of_corps(Barrack_corps_list,Barrack_id) ->
	Predicate = fun([E,_]) -> E =:= Barrack_id end,
	lists:filter(Predicate, Barrack_corps_list)
.

%% 判断兵种对应的兵营
corps_of_barrack(Soldier_type) ->
	#{'jsonvalue' := Barrack_corps_list} = tb_const:get(barrack_corps),
	[[Barrack_id,_]] = corps_of_barrack(Barrack_corps_list,Soldier_type),
	Barrack_id
.
corps_of_barrack(Barrack_corps_list,Soldier_type) ->
	Predicate = fun([_,E]) -> E =:= Soldier_type end,
	lists:filter(Predicate, Barrack_corps_list)
.

%% 获取爵位训练加成
nobility_addition() ->
	1 - lib_nobility_api:privilege_add(?TRAIN_SOLDIER_RESOURCE)
.

%% 判断兵营是否在训练
is_barrack_train(Barrack_id) ->
	Player_barrack_train = get_player_barrack_train(),
	Predicate = fun(E) -> E == Barrack_id end,
	case  lists:any(Predicate, Player_barrack_train#barrack_train.train_list) of
		true 	-> false;
		false 	-> true
	end
.



%% 把兵营加入训练列表
barrack_join_train_list(Barrack_id) ->
	Barrack_train = get_player_barrack_train(),
	List = Barrack_train#barrack_train.train_list,
	put_player_barrack_train(Barrack_train#barrack_train{train_list = [Barrack_id|List]})
.

%% 把兵营从训练列表中去除
barrack_wipe_of_train_list(Barrack_id) ->
	Barrack_train = get_player_barrack_train(),
	List = Barrack_train#barrack_train.train_list,
	New_list = lists:delete(Barrack_id,List),
	put_player_barrack_train(Barrack_train#barrack_train{train_list = New_list})
.


%% 判断存储军队是否超过了最高储存数量
is_exceed_max_training(Barrack_id)->
	Barrack = get_barrack_info(Barrack_id),
	#barrack{store_num = Store_num,train_num = Train_num} = Barrack,
	case (Store_num + Train_num) >= get_max_num(Barrack_id) of
		true 	-> false;
		false 	-> true
	end
.
get_max_num(Barrack_id) ->
	Barrack = get_barrack_info(Barrack_id),
	#barrack{soldier_type = Type} = Barrack,
	Building_level = lib_inner_city_api:building_level(Barrack_id),
	Key = Type * 100 + Building_level,
	#{	'repertory' := Max_num} = tb_hero_corps_barracks:get(Key),
	%% 星树科技加成
	ScienceAdd = science_add_max(Type),
	util:ceil(Max_num * ScienceAdd)
.
science_add_max(Type) ->
	1 + lib_player_science_api:get_effect_value(?EFFECT_ARMS_MAX_NUMBER_ADD,Type)
.
science_reduce_train_resource() ->
	1 - lib_player_science_api:get_effect_value(?EFFECT_BARRACKS_TRAIN_COST_REDUCE)
.
science_reduce_train_time(Type) ->
	1 - lib_player_science_api:get_effect_value(?EFFECT_ARMS_TRAIN_TIME_REDUCE,Type)
.
science_add_tran_num(Type) ->
	1 + lib_player_science_api:get_effect_value(?EFFECT_ARMS_TRAIN_NUMBER_ADD,Type)
.
%% 请求兵营训练士兵
request_barrack_train(Msg)	->
	?INFO("请求训练 ~p",[Msg]),
	#'Proto10127001'{building_id = Barrack_id,type = Type,num = Train_num,
		training_type = Training_type} = Msg,
	Barrack = get_barrack_info(Barrack_id),
	Building_level = lib_inner_city_api:building_level(Barrack_id),
	Key = Type * 100 + Building_level,
	#{	'max_training' := Max_training,
		'training_time' := Training_time,
		'item_id' := Item_id,
		'num' := Num
	} = tb_hero_corps_barracks:get(Key),
	[[_,Soldier_Type]] = barrack_of_corps(maps:get(jsonvalue, tb_const:get(barrack_corps)),Barrack_id),
	?JUDGE_RETURN(is_exceed_max_training(Barrack_id), ?ERROR_BARRACK_FILL),
	try
		?JUDGE_RETURN(lib_inner_city_api:building_is_open(Barrack_id), 0),
		?JUDGE_RETURN(lib_inner_city_api:building_state(Barrack_id) =:= ?BUILDING_LEISURE, 1),
		?JUDGE_RETURN((Max_training >= Train_num), 3),
		?JUDGE_RETURN((Soldier_Type =:= Type), 4),
		NewNum = Num * nobility_addition() * science_reduce_train_resource(),
		%% 训练士兵消耗
		Item_num  = trunc(NewNum * Train_num/10),
		Item_list = [Item_id,Item_num],
		Item = lib_item_api:conf_item_to_pack_item(Item_list),
		Ret = lib_player_pack:validate_remove(Item),
		?PACK_IS_SUCCESS(Ret),
		lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BARRACK_TRAIN, Type)),
		Time = util:ceil((((Train_num div 10) * Training_time) div 1000) * science_reduce_train_time(Type)),
		update_barrack(Barrack#barrack{soldier_type = Type,is_train = 1,train_num = Train_num}),
		barrack_join_train_list(Barrack_id),
		case Training_type of
			%% 使用时间训练
			0 -> %% 更改建筑状态为正在训练
				Building = lib_inner_city:get_buildings_info(Barrack_id),
				lib_inner_city:request_building_working(Building#building{
					building_state = ?BUILDING_TRAINING,upgrade_tick = lib_timer:unixtime(),remaining_time = Time, upgrade_total_time = Time
				});
			%% 使用元宝训练
			1 ->
				GoldNum = lib_equip_api:time_to_gold(Time),
				Gold_list = [?GOLD_ID,GoldNum],
				GoldItem = lib_item_api:conf_item_to_pack_item(Gold_list),
				Ret = lib_player_pack:validate_remove(GoldItem),
				?PACK_IS_SUCCESS(Ret),
				lib_player_pack:auto_remove(GoldItem, ?REMOVE_SERIAL(?USE_BARRACK_TRAIN, ?GOLD_ID)),
				Building = lib_inner_city:get_buildings_info(Barrack_id),
				lib_inner_city:request_building_working(Building#building{
					building_state = ?BUILDING_GET_ITEM,upgrade_tick = 0,remaining_time = 0, upgrade_total_time = 0
				})
		end,
		lib_country_task_api:add(?ADD_TRAIN_SOLDIER, Train_num),
		lib_player_process:process_barrack_train(Type, Train_num),
		lib_send:respond_to_client(?MSG_RETURN_TRAIN_SOLDIER),
		?DEBUG("request_barrack_train: ~n")
	catch
		throw:{error, Flag} -> ?DEBUG("请求训练错误:~p",[Flag])
	end
.

%% 请求获取兵营信息
request_get_barrack_info(Msg) ->
	#'Proto10127002'{building_id = Barrack_id} = Msg,
	Barrack = get_barrack_info(Barrack_id),
	#barrack{is_train = Is_train,train_num = Train_num,store_num = Store_num } = Barrack,
	Respond = #'Proto50127002'{storage_num = Store_num, train_type= Is_train, train_num = Train_num },
	lib_send:respond_to_client(Respond),
	?DEBUG("request_barrack_info: ~p ~n",[Respond])

.
-define(USE_GOLD,1).
-define(USE_ITEM,2).
%% 请求训练加速
request_train_accelerate(Msg) ->
	#'Proto10127003'{
		building_id = Barrack_id,
		item_type = Item_type,
		item_id = Item_id,
		num = Num
	} = Msg,
	case  lib_inner_city_api:building_state(Barrack_id) =:= ?BUILDING_TRAINING of
		true	-> lib_inner_city:request_accelerate_building_working(Barrack_id,Item_type,[Item_id,Num]);
		false	->?DEBUG("兵营: ~p不在训练,无法加速 ~n",[Barrack_id])
	end
.

%% 自动训练
auto_train(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_111), ?INFO("功能未开启")),
	#'Proto10127004'{
		type = Type
	} = Msg,
	?DEBUG("自动训练  ~p",[Msg]),
	#{'value' := Nobility_Id} = tb_const:get(auto_train_nobility_id),
	case lib_nobility_api:is_open(Nobility_Id) of
		true ->	Player_barrack_train = get_player_barrack_train(),
			put_player_barrack_train(Player_barrack_train#barrack_train{auto_train_type = Type}),
			sign_in(),
			barrack_auto_train(),
			lib_send:respond_to_client(?MSG_RETURN_AUTO_TRAIN);
		false -> ?DEBUG("自动训练特权未开启")
	end

.

sign_in() ->
	Player_barrack_train = get_player_barrack_train(),
	Respond = #'Proto80127006'{type = Player_barrack_train#barrack_train.auto_train_type},
	lib_send:respond_to_client(Respond),
	?DEBUG("Auto_train sign_in ~p",[Respond])
.

%% 自动训练调用
barrack_auto_train() ->
	Player_barrack_train = get_player_barrack_train(),
	case  Player_barrack_train#barrack_train.auto_train_type =:= 1 of
		true -> List = maps:get(jsonvalue, tb_const:get(barrack_corps)),
				judge_training(List,0);
		false->skip
	end

.

%% 请求领取训练完成士兵
get_soldier(Msg) ->
	#'Proto10127007'{
		barrack_id  = Barrack_id,
		num = Num
	} = Msg,
	Barrack = get_barrack_info(Barrack_id),
	update_barrack(Barrack#barrack{soldier_type = Barrack#barrack.soldier_type,is_train = 0,train_num = 0,
		store_num = Barrack#barrack.store_num + Num}),
	barrack_wipe_of_train_list(Barrack_id),
	Building = lib_inner_city:get_buildings_info(Barrack_id),
	lib_inner_city:update_inner_building(Building#building{
		building_state = ?BUILDING_LEISURE,upgrade_tick = 0,remaining_time = 0,upgrade_total_time = 0
	}),
	%% 更改兵营状态为空闲状态
	lib_inner_city:leisure_building(Barrack_id),
	lib_barrack_train_api:add_accumulated_training_num(Num),
	lib_send:respond_to_client(?MSG_RETURN_GET_SOLDIER),
	barrack_auto_train()
.


judge_training([[BarrackId,Soldier_type]|BarrackId_list],Max_num) ->
	Barrack = lib_inner_city:get_buildings_info(BarrackId),
	is_training_ok(BarrackId),
	try
	    ?JUDGE_RETURN(Barrack#building.is_open =:= 1,0),
		?JUDGE_RETURN(is_barrack_train(BarrackId),1),
		?JUDGE_RETURN(is_exceed_max_training(BarrackId),0),
		?JUDGE_RETURN(Barrack#building.building_state =:= ?BUILDING_LEISURE,0),
		?DEBUG("建筑~p，可训练",[BarrackId]),
		Building_level = lib_inner_city_api:building_level(BarrackId),
		Key = Soldier_type * 100 + Building_level,
		#{	'max_training' := Max_training,
			'item_id' := Item_id,
			'num' := Num
		} = tb_hero_corps_barracks:get(Key),
		New_Max_training = trunc(Max_training * science_add_tran_num(Soldier_type)),
		NewNum = util:ceil(Num * nobility_addition() * science_reduce_train_resource()),
		Item_num  = NewNum * New_Max_training/10,
		Pack_num = lib_player_pack:count_by_id(Item_id),
		case Item_num =< Pack_num of
			true -> request_barrack_train(#'Proto10127001'{building_id = BarrackId,type = Soldier_type,num = New_Max_training, training_type = 0});
			false-> Train_num = trunc((Pack_num div NewNum) * 10),
					?JUDGE_RETURN(Train_num =< 0,0),
					request_barrack_train(#'Proto10127001'{building_id = BarrackId,type = Soldier_type,num = Train_num, training_type = 0})
		end,
		erlang:send_after(maps:get(value, tb_const:get(auto_train_interval)), self(), auto_to_train)
	catch
	    throw:{error,0} -> judge_training(BarrackId_list,Max_num + 1);
		throw:{error,1} -> judge_training(BarrackId_list,Max_num)
	end;

judge_training([],Max_num) ->
	List = maps:get(jsonvalue, tb_const:get(barrack_corps)),
	if
		Max_num =:= length(List) 				-> close_auto_train();
		true 									-> erlang:send_after(maps:get(value, tb_const:get(auto_train_interval)), self(), auto_to_train)
	end
.

%% 判断是否为训练完成的兵营
is_training_ok(BarrackId) ->
	Building = lib_inner_city:get_buildings_info(BarrackId),
	Barrack_train = get_barrack_info(BarrackId),
	case Building#building.building_state =:= ?BUILDING_GET_ITEM of
		 true -> get_soldier(#'Proto10127007'{barrack_id  = BarrackId, num = Barrack_train#barrack.train_num});
		 false-> skip
	end
.

%% 关闭自动训练
close_auto_train() ->
	Player_barrack_train = get_player_barrack_train(),
	put_player_barrack_train(Player_barrack_train#barrack_train{auto_train_type = 0}),
	New_Player_barrack_train = get_player_barrack_train(),
	Respond = #'Proto80127006'{type = New_Player_barrack_train#barrack_train.auto_train_type},
	lib_send:respond_to_client(Respond),
	?DEBUG("Auto_train start ~p",[Respond])
.

%% 查询某个类型的士兵数量
inquire_soldier_num(Soldier_type)->
	Barrack_id = corps_of_barrack(Soldier_type),
	Barrack = get_barrack_info(Barrack_id),
	?DEBUG("store_num:~p",[Barrack#barrack.store_num]),
	Barrack#barrack.store_num
.

%% 请求领取存储士兵
request_get_store_soldier(Soldier_type,Get_Num) ->
	Barrack_id = corps_of_barrack(Soldier_type),
	Barrack = get_barrack_info(Barrack_id),
	Store_num = Barrack#barrack.store_num,
	Num =
	case Store_num >= Get_Num of
		true	-> update_barrack(Barrack#barrack{store_num = Store_num - Get_Num}),
			?DEBUG("Get_Num:~p",[Get_Num]),
			Get_Num;
		false	-> update_barrack(Barrack#barrack{store_num = 0}),
			?DEBUG("Store_num:~p",[Store_num]),
			Store_num
	end,
	lib_inner_city_api:building_state_to_client(Barrack_id),
	Num
.

%% 请求归还士兵到兵营
request_return_store_soldier(Soldier_type,Get_Num) ->
	Barrack_id = corps_of_barrack(Soldier_type),
	Barrack = get_barrack_info(Barrack_id),
	Store_num = Barrack#barrack.store_num,
	update_barrack(Barrack#barrack{store_num = Store_num + Get_Num}),
	lib_inner_city_api:building_state_to_client(Barrack_id)
.

