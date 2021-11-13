%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2020 2:34 PM
%%%-------------------------------------------------------------------
-module(lib_inner_city).
-author("df").
-include("common.hrl").
-include("inner_city.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10123.hrl").
-include("science.hrl").
%% API
-export([
	get_player_inner_city/0,
	put_player_inner_city/1,
	put_player_inner_city/2,
	player_inner_city_handler/0,
	request_inner_city_info/0,					 	%% 请求内城信息
	request_get_resource_building_item/1,			%% 领取资源建筑道具
	request_building_upgrade/1,						%% 建筑升级
	request_building_upgrade_accelerate/1,			%% 建筑升级加速
	request_open_building/1,						%% 请求开启建筑
	request_building_working/1,						%% 请求建筑工作			获得建筑信息，修改#building{}
	request_accelerate_building_working/3,			%% 请求建筑工作加速
	leisure_building/1,								%% 使建筑变为空闲状态　　Building_id
	request_one_building/1
]).

-export([
	building_state/1,
	inspect_building_is_open/0,
	inspect_is_work_ok/0,							%% 检查工作是否完成
	get_buildings_info/1,							%% 获得单个建筑信息
	update_inner_building/1,						%% 更改建筑信息
	get_building_item/1,							%% 获得单个资源建筑生产道具
	get_industry_increase/1,						%% 爵位加成生产
	notified_resource_building/1,					%% 通知资源建筑刷新
	resource_building_output_update/0				%% 资源建筑刷新定时器
]).

-export([	%% 势力互助
	request_mutual/1,
	request_mutual_list/0,
	request_do_one_mutual/1,
	request_do_player_mutual/1,
	request_do_all_mutual/1,
	request_help_all_mutual/0
]).

get_player_inner_city() ->
	erlang:get(?ETS_PLAYER_INNER_CITY)
.

put_player_inner_city(Inner_city) ->
	put_player_inner_city(Inner_city,true)
.

put_player_inner_city(Inner_city,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_INNER_CITY),
	erlang:put(?ETS_PLAYER_INNER_CITY, Inner_city)
.

ets_init() ->
	ets:new(?ETS_PLAYER_INNER_CITY, [?ETS_KEY_POS(#inner_city.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_INNER_CITY, {?TUPLE_INT(id, 1)}, true).


player_inner_city_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_INNER_CITY,
		table_name = ?DBPLAYER_INNER_CITY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_inner_city:load_inner_city/1,
		save_func = fun db_inner_city:save_inner_city/1,
		get_func = fun get_player_inner_city/0,
		put_func = fun put_player_inner_city/2
	}.


%% 获得单个建筑信息
get_buildings_info(BuildingId) ->
	Player_building = get_player_inner_city(),
	TbBuilding  = tb_building:get(BuildingId),
	#{
		'class_id_big' := Class_id_big,
		'class_id' := Class_id,
		'auto_open' := Auto_open,
		'auto_open_level' := Auto_open_level
	} = TbBuilding,
	%% 判断是否是资源建筑
	Is_resource_building =
	case Class_id_big =:= 112 of
		true -> 1;
		false -> 0
	end,
	Resource_tick =
		case Class_id_big =:= 112 of
			true -> lib_timer:unixtime();
			false -> 0
		end,
	?DICT_FETCH(BuildingId, Player_building#inner_city.buildings_dict, #building{building_id  = BuildingId,class_id_big = Class_id_big,class_id = Class_id,
		building_lv = Auto_open_level,is_open = Auto_open,is_resource_building = Is_resource_building,resource_tick = Resource_tick})
.
%% 更新单个建筑
update_inner_building(Building) when is_record(Building, building) ->
	Player_building = get_player_inner_city(),
	NewBuildingState = dict:store(Building#building.building_id, Building, Player_building#inner_city.buildings_dict),
	put_player_inner_city(Player_building#inner_city{buildings_dict = NewBuildingState})
.

%% 单个建筑状态
building_state(BuildingId) ->
	Building_info = inner_building_info:get_inner_building_info(BuildingId),
	Building = get_buildings_info(BuildingId),
	#building{
		building_id = BuildingId,
		building_lv = Lv,
		building_state = Building_state,
		upgrade_tick = Upgrade_tick,
		remaining_time = Remaining_time,
		upgrade_total_time = Upgrade_total_time,
		is_open = Is_open,
		is_mutual = Is_mutual
	} = Building,
	%% 计算建筑工作剩余时间
	Time = case  Building_state =/= 0 of
			   true  -> Now1 = lib_timer:unixtime(),
				   Elapsed_time  = Now1 - Upgrade_tick,
				   case  Remaining_time - Elapsed_time >= 0 of
					   true	 -> Remaining_time - Elapsed_time;
					   false -> 0
				   end;
			   false -> 0
		   end,
	#'ProtoBuilding'{id = BuildingId, level = Lv, building_state = Building_state,is_open = Is_open,time = Time,total_time = Upgrade_total_time,
		building_info = Building_info,is_can_upgrade = is_can_upgrade(BuildingId),is_mutual = Is_mutual}
.


into_list([BuildingId|Id_list],List) ->
	Building_state = building_state(BuildingId),
	into_list(Id_list,[Building_state|List])
;

into_list([],List) ->
	List.


%% 建筑加入升级列表
add_working_list(Building_id) ->
	Inner_city = get_player_inner_city(),
	List = Inner_city#inner_city.working_list,
	put_player_inner_city(Inner_city#inner_city{working_list = [Building_id|List]})
.

%% 建筑从工作列表去除
remove_for_working_list(Building_id) ->
	Inner_city = get_player_inner_city(),
	List = Inner_city#inner_city.working_list,
	New_list = lists:delete(Building_id, List),
	put_player_inner_city(Inner_city#inner_city{working_list = New_list})
.

%% 建筑工人数量修改 1为增 -1为减
update_building_worker(Type)->
	Inner_city= get_player_inner_city(),
	put_player_inner_city(Inner_city#inner_city{use_construction_workers = Inner_city#inner_city.use_construction_workers + Type})
.

%% 建筑升级成功处理
upgrade_ok(Building)->
	?DEBUG("~p调用升级成功处理!",[Building]),
	case Building#building.is_resource_building =:= 1 of
		true ->	update_inner_building(Building#building{
				building_state = ?BUILDING_LEISURE,upgrade_tick = 0,remaining_time = 0,resource_tick = lib_timer:unixtime()}),
				resource_building_output_update(Building#building.building_id);
		false-> update_inner_building(Building#building{
				building_state = ?BUILDING_LEISURE,upgrade_tick = 0,remaining_time = 0})
	end,
	remove_for_working_list(Building#building.building_id),
	update_building_worker(-1),
	lib_mutual_api:mutual_done(Building#building.building_id)
.
%% 建筑工作完成处理
working_ok(Building)->
	update_inner_building(Building#building{building_state = ?BUILDING_GET_ITEM,upgrade_tick = 0,remaining_time = 0}),
	remove_for_working_list(Building#building.building_id)
.
is_working_ok([Building_id|Upgrade_list],Working_ok_list) ->
	Building = get_buildings_info(Building_id),
	#building{
		upgrade_tick = Upgrade_tick,
		remaining_time = Remaining_time,
		building_state = Building_state
	} = Building,
	%% 计算剩余工作时间
	Now1 = lib_timer:unixtime(),
	Elapsed_time  = Now1 - Upgrade_tick,
	Time = Remaining_time - Elapsed_time,
	%% 升级成功更新信息
	case  Time =< 0 of
			true -> case Building_state =:= ?BUILDING_UPGRADE of
						true  ->upgrade_ok(Building);
						false ->working_ok(Building)
					end,
					is_working_ok(Upgrade_list,[Building_id|Working_ok_list]);
			false -> is_working_ok(Upgrade_list,Working_ok_list)
	end
;

is_working_ok([],Working_ok_list) ->
	Working_ok_list
.


%% 查询剩余可用建筑工人
request_worker_num() ->
	Inner_city = get_player_inner_city(),
	Key = construction_workers,
	Const = tb_const:get(Key),
	#{ 'value' :=  Init} = Const,
	Init + get_nobility_add_construction_workers() - Inner_city#inner_city.use_construction_workers
.

get_building_id_from_tb_building_group([Key|Key_list],List) ->
	#{'building_id':= Building_id} = tb_building_group:get(Key),
	get_building_id_from_tb_building_group(Key_list,[Building_id|List])
;
get_building_id_from_tb_building_group([],List) ->
	List
.
%% 获取建筑组包含的建筑
get_group_building_id(Group_id) ->
	List = tb_building_group:get_list(),
	Key_list = lists:filter(fun(K)->maps:get(building_group_id, tb_building_group:get(K),0) =:= Group_id end,List),
	get_building_id_from_tb_building_group(Key_list,[])
.
%% 检查建筑是否已经在升级
building_is_working(Building_id) ->
	Inner_city = get_player_inner_city(),
	List = Inner_city#inner_city.working_list,
	Predicate = fun(E) -> E =:= Building_id end,
	lists:any(Predicate, List).


%% 判断是否满足升级条件
is_building_can_upgrade(Building_id)->
	Building = get_buildings_info(Building_id),
	#building{building_lv = Lv,class_id_big = Class_id_big,class_id = Class_id} = Building,
	Key = Class_id_big * 10000 + Class_id * 100 + (Lv + 1),
	TbList = tb_building_upgrade:get(Key),
	case TbList =/= false of
		true  -> condition_judge(TbList);
		false -> ?DEBUG("配置表不存在"),false
	end
.

%% 判断建筑是否能够开启
is_building_can_open(Building_id)->
	TbList = tb_building_open:get(Building_id),
	case TbList =/= false of
		true ->
			condition_judge(TbList);
		false -> ?DEBUG("配置表不存在"),false
	end
.

%% 条件判断
condition_judge(TbList) ->
	try
		#{
			'building_a_id' := A_id, 'building_a_num' := A_num, 'building_a_lv' := A_lv,
			'building_b_id' := B_id, 'building_b_num' := B_num, 'building_b_lv' := B_lv,
			'building_c_id' := C_id, 'building_c_num' := C_num, 'building_c_lv' := C_lv,
			'additional_conditions' := Additional_conditions, 'additional_conditions_lv' := Additional_conditions_lv
		} = TbList,

		case A_id =:= 0 of
			true 	-> skip;
			false 	-> Building_id_list = get_group_building_id(A_id),
				?JUDGE_RETURN(judge_upgrade_condition(Building_id_list,A_lv,0) >= A_num,1)
		end,
		case B_id =:= 0 of
			true 	-> skip;
			false 	-> Building_id_list1 = get_group_building_id(B_id),
				?JUDGE_RETURN(judge_upgrade_condition(Building_id_list1,B_lv,0) >= B_num,2)
		end,
		case C_id =:= 0 of
			true 	-> skip;
			false 	-> Building_id_list2 = get_group_building_id(C_id),
				?JUDGE_RETURN(judge_upgrade_condition(Building_id_list2,C_lv,0) >= C_num,3)
		end,
		case Additional_conditions =:= 0 of
			true 	-> skip;
			false 	-> ?JUDGE_RETURN(Additional_conditions_lv >= 0,"特殊")
		end,
		true
	catch
		throw:{error, _Flag} ->
			false
	end
.

%% 判断升级条件
judge_upgrade_condition([Building_id|Building_id_list],Level,Meet_num)->
	Building = get_buildings_info(Building_id),
	case Building#building.building_lv >= Level andalso Building#building.is_open =:= 1 of
		true  -> judge_upgrade_condition(Building_id_list,Level,Meet_num + 1);
		false -> judge_upgrade_condition(Building_id_list,Level,Meet_num)
	end
;
judge_upgrade_condition([],_,Meet_num) ->
	Meet_num
.
%% 获得爵位加成的建筑工数量
get_nobility_add_construction_workers() ->
	lib_nobility_api:privilege_add(?INNER_CITY_BUILDING_QUEUE)
.

-define(COINS_WORKSHOP,	1). %% 铸币工坊
-define(MINE,			2). %% 矿场
-define(FARM,			3). %% 农场
-define(LUMBER_MILL,	4). %% 伐木场
get_industry_increase(Class_id)->
	%% 获得爵位百分比加成　　
	case Class_id  of
		?COINS_WORKSHOP	-> get_coins_mine_industry_increase();
		?MINE			-> get_coins_mine_industry_increase();
		?FARM			-> get_farm_lumber_industry_increase();
		?LUMBER_MILL	-> get_farm_lumber_industry_increase();
		_ -> 1
	end
.
get_science_add(Class_id) ->
	lib_player_science_api:get_effect_value(?EFFECT_INNER_CITY_YIELD_ADD,Class_id) + 1
.

%% 获得农场和伐木场产出加成  float
get_farm_lumber_industry_increase() ->
	[Increase,_] = lib_nobility_api:privilege_add(?INNER_CITY_INDUSTRY_INCREASE),
	Increase + 1
.
%% 获得铸币工厂和矿场产出加成  float
get_coins_mine_industry_increase() ->
	[_,Increase] = lib_nobility_api:privilege_add(?INNER_CITY_INDUSTRY_INCREASE),
	Increase + 1
.

%% 获取某种类型的资源建筑已产生的资源和数量
get_now_resource_and_num(Resource_building_list) ->
	?INFO("Resource_building_list ~p",[Resource_building_list]),
	ItemList =
	lists:foldl(fun(BuildingID,List)->
		[Item_id,Item_num,Max_num,_Production_time,_Harvest_interval] = lib_inner_city:get_building_item(BuildingID),
		?INFO("BuildingID ~p",[BuildingID]),
		?INFO("Item_num ~p",[Item_num]),
		?INFO("_Max_num ~p",[Max_num]),
		[[Item_id,Item_num]|List]
	end,[],Resource_building_list),
	lib_item_api:merge_conf_item_list(ItemList)
.

%% 判断资源建筑中已开启的建筑
resource_building_is_open([Building_id|Building_list],List) ->
	#building{is_open = Is_open} = get_buildings_info(Building_id),
	case Is_open =:= 1 of
		true 	-> resource_building_is_open(Building_list,[Building_id|List]);
		false	-> resource_building_is_open(Building_list,List)
	end
;
resource_building_is_open([],List) ->
	List
.
%% 获得开启的建筑列表
get_open_list(List) ->
	get_open_list(List,[])
.
get_open_list([Id|List],OpenList) ->
	Building = get_buildings_info(Id),
	case (Building#building.is_open =:= 1) or (Building#building.is_open =:= 0) of
		true ->get_open_list(List,[Id|OpenList]);
		false->get_open_list(List,OpenList)
	end
;
get_open_list([],OpenList) ->
	OpenList
.
%% 判断建筑可否开启，解锁状态
unlock_building() ->
	Building_list = tb_building:get_list(),
	unlock_building(Building_list)
.
unlock_building([BuildingId|Building_list]) ->
	Building = get_buildings_info(BuildingId),
	case Building#building.is_open =:= -1 andalso is_building_can_open(BuildingId) of
		true ->update_inner_building(Building#building{is_open = 0});
		false->skip
	end,
	unlock_building(Building_list)
;
unlock_building([])->
	skip
.

%%　获得需要的资源列表
get_item_list(Tb) ->
	#{
		'value' := Money
	} = tb_const:get(money),
	#{
		'value' := Provisions
	} = tb_const:get(provisions),
	#{
		'value' := Wood
	} = tb_const:get(wood),
	#{
		'value' := Iron
	} = tb_const:get(iron),
	MoneyNum = maps:get(money, Tb),
	ProvisionsNum = maps:get(provisions, Tb),
	WoodNum = maps:get(wood, Tb),
	IronNum = maps:get(iron, Tb),
	[[Money,MoneyNum],[Provisions,ProvisionsNum],[Wood,WoodNum],[Iron,IronNum]]
.

-define(UPGRADE_NO,		0).	%% 不可升级
-define(UPGRADE_YES,	1).	%% 可升级
is_can_upgrade(BuildingId) ->
	Building = get_buildings_info(BuildingId),
	case Building#building.building_state =:= ?BUILDING_LEISURE of
		 false -> ?UPGRADE_NO;
		 true  -> case is_building_can_upgrade(BuildingId) of
					   false ->?UPGRADE_NO;
					   true -> #building{class_id_big = Class_id_big,class_id = Class_id,building_lv = Level} = Building,
						   Key = Class_id_big * 10000 + Class_id * 100 + (Level + 1),
						   Resource_Item_list = get_item_list(tb_building_upgrade:get(Key)),
						   Item = lib_item_api:conf_item_list_to_pack_item_list(Resource_Item_list),
						   Ret = lib_player_pack:validate_remove(Item),
						   case Ret =/= false of
							   true  ->?UPGRADE_YES;
							   false ->?UPGRADE_NO
						   end
			end
	end
.

%% --------------以下是外部调用的

%% 检查是否有建筑开启
inspect_building_is_open() ->
	unlock_building(),
	Building_list = tb_building:get_list(),
	List = lists:filter(fun(BuildingId)->Building = get_buildings_info(BuildingId), Building#building.is_open =:= 0 end,Building_list),
	ProtoBuilding = into_list(List,[]),
	case List =/= [] of
		true -> Respond = #'Proto80123006'{
				building_list  = ProtoBuilding
				},
				lib_send:respond_to_client(Respond)
%%				?DEBUG("inspect_building_is_open: ~p ~n",[Respond])
		;
		false -> skip
	end
.


%% 检查是否工作完成
inspect_is_work_ok() ->
	Inner_city = get_player_inner_city(),
	Working_list = Inner_city#inner_city.working_list,
	Working_ok_list = is_working_ok(Working_list,[]),
	ProtoBuilding = into_list(Working_ok_list,[]),
	case Working_ok_list =/= [] of
		true -> 	Respond = #'Proto80123006'{
					building_list  = ProtoBuilding
					},
					lib_send:respond_to_client(Respond),
					?DEBUG("work_ok: ~p ~n",[Respond]);
		false -> skip
	end,
	lib_inner_city_api:working_ok_to_do(Working_ok_list)
.


%% 请求内城信息
request_inner_city_info() ->
	?DEBUG("请求内城信息 "),
	inspect_building_is_open(),
	inspect_is_work_ok(),
	Inner_city = get_player_inner_city(),
	Building_list = tb_building:get_list(),
	List = get_open_list(Building_list),
	ProtoBuilding = into_list(List,[]),
	Init = maps:get(value, tb_const:get(construction_workers)),
	Can_use_workers_num = Init + get_nobility_add_construction_workers() - Inner_city#inner_city.use_construction_workers,
	Respond = #'Proto50123001'{
		building_list = ProtoBuilding,
		workers_num = Can_use_workers_num
	},
	lib_send:respond_to_client(Respond)
%%    ?DEBUG("request_inner_city_info: ~p ~n",[Respond])
.

request_one_building(Msg) ->
	inspect_is_work_ok(),
	#'Proto10123008'{building_id = BuildingId} = Msg,
	Building_state = building_state(BuildingId),
	Inner_city = get_player_inner_city(),
	Init = maps:get(value, tb_const:get(construction_workers)),
	Can_use_workers_num = Init + get_nobility_add_construction_workers() - Inner_city#inner_city.use_construction_workers,
	Respond = #'Proto50123008'{
		info = Building_state,
		workers_num = Can_use_workers_num
	},
	lib_send:respond_to_client(Respond)
.

%% 请求领取资源建筑生成的资源
request_get_resource_building_item(Msg) ->
	?DEBUG("请求领取资源建筑生成的资源"),
	#'Proto10123005'{class_id_big  = Class_id_big,class_id = Class_id } = Msg,
	Building_id_list = tb_building:get_list(),
	Resource_building_list	=
	lists:filter(fun(K)->(maps:get(class_id_big, tb_building:get(K),0) =:= Class_id_big andalso
		maps:get(class_id, tb_building:get(K),0) =:= Class_id) end,Building_id_list),
	Open_Resource_building_list = resource_building_is_open(Resource_building_list,[]),
	[Item_list] = get_now_resource_and_num(Open_Resource_building_list),
	Item = lib_item_api:conf_item_to_pack_item(Item_list),
	lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_BUILDING_RESOURCE, Class_id_big)),
	[resource_building_output_update(BuildingId)||BuildingId <- Open_Resource_building_list],
	[update_inner_building((get_buildings_info(BuildingId))#building{building_state = ?BUILDING_LEISURE,resource_tick = lib_timer:unixtime()})||BuildingId <- Open_Resource_building_list],
	lib_inner_city_api:building_list_state_to_client(Open_Resource_building_list)
.


%% 请求开启建筑
request_open_building(Msg) ->
	#'Proto10123007'{ building_id = Building_id} = Msg,
	%% 开启条件判断
	?JUDGE_RETURN(is_building_can_open(Building_id),?ERROR_UPGRADE_CONDITIONS),
	Item_list = get_item_list(tb_building_open:get(Building_id)),
	Item = lib_item_api:conf_item_list_to_pack_item_list(Item_list),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BUILDING_UPGRADE, Building_id)),
	Building = get_buildings_info(Building_id),
	case Building#building.is_resource_building =:= 1 of
		true	->update_inner_building(Building#building{building_lv =  1,resource_tick = lib_timer:unixtime(),is_open = 1}),
				  resource_building_output_update(Building_id);
		false	->update_inner_building(Building#building{building_lv =  1,is_open = 1})
	end,
	Respond = #'Proto50123007'{building = building_state(Building_id)},
	%% 通知建筑开启
	lib_inner_city_api:building_upgrade_update_prop(Building_id),
	lib_player_process:all_building_open(Building_id),
	lib_send:respond_to_client(Respond),
	inspect_building_is_open(),
	?DEBUG("request_open_building: ~p ~n",[Respond])
.

%% 请求建筑升级
request_building_upgrade(Msg) ->
	#'Proto10123003'{building_id = Building_id,use = Use} = Msg,
	?INFO("Msg ~p",[Msg]),
	#building{building_state = Building_state} = get_buildings_info(Building_id),
		%% 升级条件判断
		?JUDGE_RETURN(is_building_can_upgrade(Building_id),?ERROR_UPGRADE_CONDITIONS),
		%% 建筑处于空闲状态 不在升级、生产....
		?JUDGE_RETURN(Building_state =:= 0,?ERROR_NO_FREE),
		 Building = get_buildings_info(Building_id),
		 #building{class_id_big = Class_id_big,class_id = Class_id,building_lv = Level} = Building,
		 Key = Class_id_big * 10000 + Class_id * 100 + (Level + 1),
		 #{
			 'jsonvalue' := [GoldTime,_]
		 } = tb_const:get(quicken_gold_time),
		 #{
			 'value' := Gold
		 } = tb_const:get(gold),
		Resource_Item_list = get_item_list(tb_building_upgrade:get(Key)),
		Time = maps:get(time, tb_building_upgrade:get(Key)),
		 %%是否向上取整
		 Is_round_up =
			 case (Time rem GoldTime) =:= 0 of
				 true -> 0;
				 false -> 1
			 end,
		 GoldNum = (Time div GoldTime) + Is_round_up,
		 case  Use =:= 2 of
			 true ->
				 New_building = get_buildings_info(Building_id),
				 Item_list = Resource_Item_list,
				 Item = lib_item_api:conf_item_list_to_pack_item_list(Item_list),
				 Ret = lib_player_pack:validate_remove(Item),
				 ?PACK_IS_SUCCESS(Ret),
				 lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BUILDING_UPGRADE, Building_id)),
				 Respond = #'Proto50123003'{building = #'ProtoBuilding'{
					 id = Building_id, level = Level + 1,building_state = 0,time = 0,
					 is_open = New_building#building.is_open}},
				 case Building#building.is_resource_building =:= 1 of
					 true	->  update_inner_building(Building#building{building_lv = Level + 1,resource_tick = lib_timer:unixtime()}),
						 		resource_building_output_update(Building_id);
					 false	->	update_inner_building(Building#building{building_lv = Level + 1})
				 end,
				 %% 通知建筑升级
				 lib_inner_city_api:upgrade_ok(Building#building.building_id,Level + 1),
				 lib_send:respond_to_client(Respond),
				 inspect_building_is_open(),
				 ?DEBUG("required_building_upgrade: ~p ~n",[Respond]);
			 false ->case request_worker_num() > 0 of
						 true	-> case Use of
										1 ->case Building#building.is_resource_building =:= 1 of
												true -> update_inner_building(Building#building{building_lv = Level + 1,resource_tick = lib_timer:unixtime()}),
													resource_building_output_update(Building_id);
												false-> update_inner_building(Building#building{building_lv = Level + 1})
											end;
										0 ->case Time =< 0 of
												true ->  case Building#building.is_resource_building =:= 1 of
															true -> update_inner_building(Building#building{building_lv = Level + 1,resource_tick = lib_timer:unixtime()}),
																	resource_building_output_update(Building_id);
															false-> update_inner_building(Building#building{building_lv = Level + 1})
														 end;
												false -> update_inner_building(Building#building{building_lv = Level + 1,building_state = 1,upgrade_tick = lib_timer:unixtime(),
															remaining_time = Time,upgrade_total_time = Time}),
															add_working_list(Building_id),
															update_building_worker(1)
											 end
									end,
							 		%% 通知建筑升级
							 		lib_inner_city_api:upgrade_ok(Building#building.building_id,Level + 1),
									case Use =:= 1 of
										true  ->
											Item_list = [[Gold,GoldNum]|Resource_Item_list],
											Item = lib_item_api:conf_item_list_to_pack_item_list(Item_list),
											Ret = lib_player_pack:validate_remove(Item),
											?PACK_IS_SUCCESS(Ret),
											lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BUILDING_UPGRADE, Building_id));
										false -> Item_list = Resource_Item_list,
											Item = lib_item_api:conf_item_list_to_pack_item_list(Item_list),
											Ret = lib_player_pack:validate_remove(Item),
											?PACK_IS_SUCCESS(Ret),
											lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BUILDING_UPGRADE, Building_id))
									end,
							 		Respond = #'Proto50123003'{building = building_state(Building_id)},
							 		lib_send:respond_to_client(Respond),
							 		inspect_building_is_open(),
							 		?DEBUG("required_building_upgrade: ~p ~n",[Respond]);
						 false	->?DEBUG("建筑工数量不足")
					 end
		end
.


%% 请求建筑升级加速
request_building_upgrade_accelerate(Msg) ->
	#'Proto10123004'{building_id = Building_id,use = Use,item_id = Item_id,num = Num} = Msg,
	case building_is_working(Building_id) of
		true 	-> 	Inner_city = get_player_inner_city(),
					Buildings = Inner_city#inner_city.buildings_dict,
					Building = dict:fetch(Building_id,Buildings),
					#building{upgrade_tick = Upgrade_tick,remaining_time = Remaining_time} = Building,
					case Use =:= 2 of
						 false ->
								Now_time = lib_timer:unixtime(),
								Remaining_upgrade_time = Remaining_time - (Now_time - Upgrade_tick),
								Item1 = [Item_id,Num],
								Item = lib_item_api:conf_item_to_pack_item(Item1),
								Ret = lib_player_pack:validate_remove(Item),
								?PACK_IS_SUCCESS(Ret),
								lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BUILDING_ACCELERATE, Building_id)),
								%% 道具加速时间
								Accelerate_time =
									case Use of
										%% 使用元宝加速
										0 ->#{
											'jsonvalue' := [GoldTime,_]
										} = tb_const:get(quicken_gold_time),
											(GoldTime * Num);
										%% 使用道具加速
										1 -> #{
											'param1' := ItemTime
										} = tb_item:get(Item_id),
											(ItemTime * Num)
									end,
								New_upgrade_need_time = case (Remaining_upgrade_time - Accelerate_time) =< 0 of
															true -> 0;
															false-> Remaining_upgrade_time - Accelerate_time
														end,
								%% 判断是否加速完直接升级成功
								case New_upgrade_need_time =:= 0 of
									 true ->upgrade_ok(Building);
									 false ->update_inner_building(Building#building{building_id = Building_id,remaining_time = New_upgrade_need_time})
								end;
		 				true ->	upgrade_ok(Building)
			end,
			Respond = #'Proto50123004'{building = building_state(Building_id)},
			lib_send:respond_to_client(Respond),
			?DEBUG("required_building_upgrade_accelerate: ~p ~n",[Respond]);

		false ->?DEBUG("该建筑不在升级，无法加速！~n")
	end

.

request_building_working(BuildingInfo) when is_record(BuildingInfo, building) ->
	?DEBUG("BuildingInfo ~p",[BuildingInfo]),
	Building_id = BuildingInfo#building.building_id,
	case lib_inner_city_api:building_state(Building_id) =:= 0 of
		true  -> update_inner_building(BuildingInfo),
				 add_working_list(Building_id),
				 lib_inner_city_api:building_state_to_client(Building_id);
		false -> ?DEBUG("建筑状态不为0，无法工作")
	end
.

%% Type
%% 建筑加速方式
%%-define(BUILDING_COMPLETE,	0).		%% 直接完成
%%-define(BUILDING_USE_GOLD,	1).		%% 建筑使用黄金
%%-define(BUILDING_USE_ITEM,	2).		%% 建筑使用道具
%% Item = [ITEM_ID,NUM]	 使用黄金为黄金的道具id
request_accelerate_building_working(BuildingId, Type ,[Item_id,Num]) ->
	Building= get_buildings_info(BuildingId),
	case Building#building.building_state =/= 0 of
		 true -> case Type =:= ?BUILDING_COMPLETE of
					  true ->update_inner_building(Building#building{remaining_time = 0});
					  false->Accelerate_time =
						  case Type of
							  %% 使用元宝加速
							  ?BUILDING_USE_GOLD ->
								  [GoldTime,_] = maps:get(jsonvalue, tb_const:get(quicken_gold_time)),
								  (GoldTime * Num);
							  %% 使用道具加速
							  ?BUILDING_USE_ITEM ->
								  ItemTime =  maps:get(param1, tb_item:get(Item_id)),
								  (ItemTime * Num)
						  end,
						  Item = lib_item_api:conf_item_to_pack_item([Item_id,Num]),
						  Ret = lib_player_pack:validate_remove(Item),
						  ?PACK_IS_SUCCESS(Ret),
						  lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_BUILDING_ACCELERATE, BuildingId)),
						  Remaining_time = Building#building.remaining_time - Accelerate_time,
						  update_inner_building(Building#building{remaining_time = Remaining_time}),
						  lib_inner_city_api:building_state_to_client(BuildingId),
						  Remaining_time
			end;
		false -> ?DEBUG("建筑:~p,不在工作状态,不能加速",[BuildingId])
	end

.

leisure_building(BuildingId) ->
	Building= get_buildings_info(BuildingId),
	update_inner_building(Building#building{building_state = ?BUILDING_LEISURE, upgrade_tick = 0, remaining_time = 0, upgrade_total_time = 0}),
	lib_inner_city_api:building_state_to_client(BuildingId)
.

get_building_item(BuildingID) ->
	Building = get_buildings_info(BuildingID),
	#building{resource_tick = Resource_tick,class_id_big = Class_id_big,class_id = Class_id,building_lv = Level} = Building,
	Key = Class_id_big * 10000 + Class_id * 100 + Level,
	Building_production = tb_building_production:get(Key),
	%% 计算资源建筑产出
	#{
		'item_id' := Item_id,
		'production_unit_time' := Production_unit_time,
		'time_yield' := Time_yield,
		'harvest_interval' := Harvest_interval,
		'max_save' := Max_save_time
	} = Building_production,
	Now_time = lib_timer:unixtime(),
	Production_time = Now_time - Resource_tick,
	Increase = get_industry_increase(Class_id),
	Science = get_science_add(Class_id),
	Max_num = util:floor((Max_save_time div Production_unit_time) * Time_yield * Increase * Science),
	Item_num = 	case Harvest_interval > Production_time of
					  true 	-> 0;
					  false	-> ThisItemNum = util:floor((Production_time div Production_unit_time) * Time_yield * Increase * Science),
						  case Production_time > Max_save_time of
							  true 	-> Max_num;
							  false	-> ThisItemNum
						  end
				  end,
%%	?INFO("Increase ~p ;Science ~p",[Increase,Science]),
	case Item_num =:= 0 of true -> skip;false -> update_inner_building(Building#building{building_state = ?BUILDING_GET_ITEM}) end,
	[Item_id,Item_num,Max_num,Production_time,Harvest_interval]
.

%% 势力互助

%% 申请势力互助
request_mutual(Msg) ->
	#'Proto10123009'{building_id = BuildingId} = Msg,
	Building = lib_inner_city_api:building_info(BuildingId),
	lib_inner_city:update_inner_building(Building#building{is_mutual = true}),
	ProtoBuilding = lib_inner_city:building_state(BuildingId),
	ProtoShowRole = lib_player:serialize_show_role(),
	CountryId = lib_player:player_country(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:request_mutual/3,[ProtoShowRole,CountryId,ProtoBuilding]).

%% 请求势力互助列表
request_mutual_list() ->
	PlayerId = lib_player:player_id(),
	CountryId = lib_player:player_country(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:request_mutual_list/2,[CountryId,PlayerId]).

%% 请求对单个建筑进行助力
request_do_one_mutual(Msg) ->
	#'Proto10123011'{mutual = ProtoMutual} = Msg,
	PlayerId = lib_player:player_id(),
	CountryId = lib_player:player_country(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:request_do_one_mutual/3,[CountryId,PlayerId,ProtoMutual]).

%% 请求对玩家所有进行助力
request_do_player_mutual(Msg) ->
	#'Proto10123012'{mutual = ProtoMutual} = Msg,
	PlayerId = lib_player:player_id(),
	CountryId = lib_player:player_country(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:request_do_player_mutual/3,[CountryId,PlayerId,ProtoMutual]).

%% 请求对所有进行助力
request_do_all_mutual(_Msg) ->
%%	#'Proto10123013'{mutual = ProtoMutual} = Msg,
	PlayerId = lib_player:player_id(),
	CountryId = lib_player:player_country(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:request_do_all_mutual/2,[CountryId,PlayerId]).

%% 请求申请帮助
request_help_all_mutual() ->
	PlayerId = lib_player:player_id(),
	CountryId = lib_player:player_country(),
%%	PlayerName = lib_player:player_name(),
	?MUTUAL_ASYNC_APPLY(fun lib_mutual:request_help_all_mutual/2,[PlayerId,CountryId]).

resource_building_output_update() ->
	List = dict:fetch_keys((get_player_inner_city())#inner_city.buildings_dict),
	Resource_building = lists:filter(fun(Building_Id) -> Building = get_buildings_info(Building_Id),Building#building.is_open =:= 1 andalso Building#building.class_id_big =:= 112 end,List),
	[resource_building_output_update(Building_Id) || Building_Id <- Resource_building]
.

notified_resource_building(Building_Id) ->
	lib_inner_city_api:building_state_to_client(Building_Id),
	resource_building_output_update(Building_Id)
.

resource_building_output_update(Building_Id) ->
	[_Item_id,Item_num,Max_num,Production_time,Harvest_interval] = lib_inner_city:get_building_item(Building_Id),
	case Item_num >= Max_num of
		true -> skip;
		false-> Time = case Production_time > Harvest_interval of true -> Harvest_interval - (Production_time rem Harvest_interval); false -> Harvest_interval - Production_time end,
				?INFO("Time ~p resource_building_output_update ~p",[Time,Building_Id]),
				erlang:send_after(Time * 1000, self(), {resource_building_output, Building_Id})
	end
.

