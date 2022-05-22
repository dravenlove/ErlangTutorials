%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Jan 2021 2:48 PM
%%%-------------------------------------------------------------------
-module(lib_logistics_center).
-author("df").
-include("common.hrl").
-include("logistics_center.hrl").
-include("inner_city.hrl").
-include("ProtoClient_10130.hrl").
-include("ProtoPublic.hrl").

-define(USE_GOLD,0).
-define(USE_FREE,1).
-define(USE_CRITICAL,2).
%% API
-export([
	get_player_logistics_center/0,
	put_player_logistics_center/1,
	put_player_logistics_center/2,
	player_logistics_center_handler/0,
	request_logistics_center_info/0,
	request_buy_resource/1,
	reset_in_system_reset_time/0,
	add_buy_times/2
	%%get_critical_buy_times/0, %%获取暴击购买次数
	%%add_critical_buy_times/1	%%添加暴击购买次数
]).


get_player_logistics_center() ->
	erlang:get(?ETS_PLAYER_LOGISTICS_CENTER)
.

put_player_logistics_center(Logistics_center) when is_record(Logistics_center, logistics_center)  ->
	put_player_logistics_center(Logistics_center,true)
.
put_player_logistics_center(Logistics_center,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_LOGISTICS_CENTER),
	erlang:put(?ETS_PLAYER_LOGISTICS_CENTER, Logistics_center)
.


ets_init() ->
	ets:new(?ETS_PLAYER_LOGISTICS_CENTER, [?ETS_KEY_POS(#logistics_center.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_LOGISTICS_CENTER, {?TUPLE_INT(id, 1)}, true).

player_logistics_center_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_LOGISTICS_CENTER,
		table_name = ?DBPLAYER_LOGISTICS_CENTER,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_logistics_center:load_player_logistics_center/1,
		save_func = fun db_logistics_center:save_player_logistics_center/1,
		get_func = fun get_player_logistics_center/0,
		put_func = fun put_player_logistics_center/2
	}.

%% 获得今日购买次数
get_buy_times(Type) ->
	Logistics_center = get_player_logistics_center(),
	maps:get(Type, Logistics_center#logistics_center.today_buy_times, 0)
.

%%%% 获取暴击购买次数
%%get_critical_buy_times() ->
%%	Logistics_center = get_player_logistics_center(),
%%	Logistics_center#logistics_center.critical_times.
%%
%%%%
%%add_critical_buy_times(Time) ->
%%	Logistics_center = get_player_logistics_center(),
%%	put_player_logistics_center(Logistics_center#logistics_center{critical_times=Time+Logistics_center#logistics_center.critical_times}).

%% 今日购买次数  +1
add_buy_times(Type) ->
	Logistics_center = get_player_logistics_center(),
	Map = Logistics_center#logistics_center.today_buy_times,
	NowTimes = get_buy_times(Type),
	NewMap = maps:put(Type, (NowTimes + 1), Map),
	put_player_logistics_center(Logistics_center#logistics_center{today_buy_times = NewMap}),
	lib_player_process:process_logistics_center_buy()
.

%% 购买次数  +X
add_buy_times(Type,X) ->
	Logistics_center = get_player_logistics_center(),
	Map = Logistics_center#logistics_center.today_buy_times,
	NowTimes = get_buy_times(Type),
	NewMap = maps:put(Type, (NowTimes + X), Map),
	put_player_logistics_center(Logistics_center#logistics_center{today_buy_times = NewMap}),
	lib_player_process:process_logistics_center_buy().

reduce_buy_times(Type,X) ->
	Logistics_center = get_player_logistics_center(),
	Map = Logistics_center#logistics_center.today_buy_times,
	NowTimes = get_buy_times(Type),
	NewMap = maps:put(Type, (NowTimes - X), Map),
	put_player_logistics_center(Logistics_center#logistics_center{today_buy_times = NewMap}),
	lib_player_process:process_logistics_center_buy().

%% 获得免费次数
get_free_times() ->
	lib_nobility_api:privilege_add(?LOGISTICS_EVERYDAY_FREE_TIME)
.
%% 获取购买资源加成
get_logistics_buy() ->
	lib_nobility_api:privilege_add(?LOGISTICS_BUY)
.
%% 获得购买次数列表
get_buys_times_list() ->
	TypeList = tb_type_and_resources:get_list(),
	type_buys_time(TypeList,[])
.
type_buys_time([Type|TypeList],List) ->
	Times = get_buy_times(Type),
	TypeTimes = #'ProtoKeyValue'{key = Type,value = Times},
	type_buys_time(TypeList,[TypeTimes|List])
;
type_buys_time([],List) ->
	List
.

%% 获得道具
get_item(Tb_map,Type) ->
	#{ 'silver_num' := Silver_num, 'cereal_num' := Cereal_num, 'wood_num' := Wood_num, 'iron_num' := Iron_num, 'crit' := Crit} = Tb_map,
	#{ 'floatvalue' := Multiples } = tb_const:get(crit_multiples),
	Is_crit = case (rand:uniform()+Crit) >= 1 of
				  true  -> Multiples;
				  false -> 1
			  end,
	#{'id' := Item_id} =  tb_type_and_resources:get(Type),
	Addition = get_logistics_buy() + 1,
	case Type of
		1 ->[Item_id,util:floor(Silver_num*Is_crit*Addition),Is_crit];
		2 ->[Item_id,util:floor(Cereal_num*Is_crit*Addition),Is_crit];
 		3 ->[Item_id,util:floor(Wood_num*Is_crit*Addition),Is_crit];
		4 ->[Item_id,util:floor(Iron_num*Is_crit*Addition),Is_crit];

		5 ->[Item_id,util:floor(Silver_num*Multiples*Addition),Multiples];
		6 ->[Item_id,util:floor(Cereal_num*Multiples*Addition),Multiples];
		7 ->[Item_id,util:floor(Wood_num*Multiples*Addition),Multiples];
		8 ->[Item_id,util:floor(Iron_num*Multiples*Addition),Multiples]
	end

.

%% 消耗元宝
consumes_gold(Type) ->
	Times = get_buy_times(Type),
	#{'gold_num' := Gold_num} = tb_times_and_gold:get(Times + 1),
    #{'value' := GoldId} = tb_const:get(gold),
	Item1 = [GoldId,Gold_num],
	Item = lib_item_api:conf_item_to_pack_item(Item1),
	Ret = lib_player_pack:validate_remove(Item),
	?PACK_IS_SUCCESS(Ret),
	lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(?USE_PUB_RECRUIT, Type))
.
%% ----------------------- %%
 
%% 请求资源中心界面
request_logistics_center_info() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_113), ?INFO("功能未开启")),
	BuildingLevel = lib_inner_city_api:building_level(?BUILDING_LOGISTICS_CENTER),
	#{'num' := Num } = tb_buy_times_and_resources:get(BuildingLevel),
	List = get_buys_times_list(),
	Free_times = get_free_times(),
	#logistics_center{today_use_free_times = Use_times} = get_player_logistics_center(),
	Respond = #'Proto50130001'{
		remaining_free_times = (Free_times - Use_times),
		all_times = Num,
		buy_times = List
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("request_logistics_center_info: ~p ~n",[Respond])
.

%% 请求购买资源
request_buy_resource(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_113), ?INFO("功能未开启")),
	#'Proto10130002'{
		type = Type , use_type = Use_type
	} = Msg,
	BuildingLevel = lib_inner_city_api:building_level(?BUILDING_LOGISTICS_CENTER),
	Logistics_center = get_player_logistics_center(),
	#{'num' := Num } = Tb_map =  tb_buy_times_and_resources:get(BuildingLevel),
	Num1=lists:nth(2,lists:nth(Type,get_buys_times_list())),%%对应购买次数
	Buy_times = get_buy_times(Type),
	[Id,Amount,Is_cruel] = get_item(Tb_map,Type),
	Item = [Id,Amount],
	case Use_type of
		?USE_GOLD -> case Buy_times >= Num of
						false-> consumes_gold(Type),
							add_buy_times(Type),
							Item_list = lib_item_api:conf_item_to_pack_item(Item),
							lib_player_pack:auto_insert(Item_list, ?INSERT_SERIAL(?ADD_BUY_RESOURCE, Type),true, 0)
						 ;
						true -> ?DEBUG("资源[~p]，超过购买次数",[Type])
					end;
		?USE_FREE -> Item_list = lib_item_api:conf_item_to_pack_item(Item),
			lib_player_pack:auto_insert(Item_list, ?INSERT_SERIAL(?ADD_BUY_RESOURCE, Type),true, 0),
			put_player_logistics_center(Logistics_center#logistics_center{today_use_free_times = Logistics_center#logistics_center.today_use_free_times + 1});
		%%%%%%%%%%%%%%%%
		?USE_CRITICAL -> case (Num1>0) of
										true->
											Item_list = lib_item_api:conf_item_to_pack_item(Item),
											lib_player_pack:auto_insert(Item_list, ?INSERT_SERIAL(?ADD_BUY_RESOURCE, Type),true, 0),
											reduce_buy_times(Type,1);

											false->?DEBUG("资源[~p]，超过购买次数",[Type])
										 end

	end,
	Cruel = case Is_cruel =:= 1 of
				true -> 0;
				false-> 1
			end,
	List = get_buys_times_list(),
	Free_times = get_free_times(),
	#logistics_center{today_use_free_times = Use_times} = get_player_logistics_center(),
	Respond = #'Proto50130002'{
		remaining_free_times = Free_times - Use_times,
		all_times = Num,
		buy_times = List,
		is_cruel = Cruel,
		item = #'ProtoItem'{id = Id,amount = Amount}
	},
	lib_send:respond_to_client(Respond),
	?DEBUG("request_buy_resource: ~p ~n",[Respond])
.


reset_in_system_reset_time() ->
	Logistics_center = get_player_logistics_center(),
	put_player_logistics_center(Logistics_center#logistics_center{
		today_use_free_times = 0,today_buy_times = maps:new()
	})
.