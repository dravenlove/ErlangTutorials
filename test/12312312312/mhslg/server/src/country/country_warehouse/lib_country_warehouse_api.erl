%%%------------------------------------------------------- ------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Dec 2020 11:07 AM
%%%-------------------------------------------------------------------
-module(lib_country_warehouse_api).
-author("df").
-include("country_warehouse.hrl").
-include("common.hrl").
-include("season_and_day.hrl").

%% API 地图进程
-export([
	async_apply/2,
	sync_apply/2,

	get_player_info/1,						%% 获得玩家国家仓库信息
	update_player_info/2,					%% 更改玩家国家仓库信息
	get_country_warehouse/1,				%% 获得国家仓库信息
	update_country_warehouse/1,				%% 更改国家仓库信息
	get_country_quarter_income/2,			%% 获得国家季度库存
	add_country_quarter_income/3,			%% 增加国家季度库存
	reduce_country_quarter_income/3,		%% 减少国家季度库存  成功返回true 失败返回error
	get_country_year_income/2,				%% 获得国家年度库存
	add_country_year_income/3,				%% 增加国家年度库存
	reduce_country_year_income/3,			%% 减少国家年度库存  成功返回true 失败返回error

	add_year_annihilation_and_battle_losses/3,   		%% 增加年度战损和歼敌数
	add_year_construction_values/2,						%% 增加年度建设值
	update_year_box_info/1								%% 更新年度奖励宝箱信息
]).
%% 玩家进程
-export([
	add_year_construction_values/1		%% 增加建设值
]).

%% 异步调用
async_apply(Fun,Parameters) ->
	mod_server:async_apply(mod_map:get_pid(),Fun, Parameters)
.

%% 同步调用
sync_apply(Fun,Parameters) ->
	mod_server:sync_apply(mod_map:get_pid(),Fun, Parameters)
.

get_country_warehouse(CountryId) ->
	Gather = lib_country_warehouse:get_country_warehouse(),
	maps:get(CountryId, Gather#warehouse_gather.country_warehouse_map)
.

update_country_warehouse(CountryWarehouse) when is_record(CountryWarehouse, country_warehouse) ->
	Gather = lib_country_warehouse:get_country_warehouse(),
	CountryWarehouseMap = Gather#warehouse_gather.country_warehouse_map,
	NewMap = maps:put(CountryWarehouse#country_warehouse.country_id, CountryWarehouse, CountryWarehouseMap),
	lib_country_warehouse:put_country_warehouse(Gather#warehouse_gather{country_warehouse_map = NewMap})
.

get_player_info(Player_id) ->
	Gather = lib_country_warehouse:get_country_warehouse(),
	maps:get(Player_id, Gather#warehouse_gather.player_info,#player_country_warehouse{id = Player_id})
.

update_player_info(Player_id,Player_country_warehouse) when is_record(Player_country_warehouse, player_country_warehouse) ->
	Gather = lib_country_warehouse:get_country_warehouse(),
	NewMap = maps:put(Player_id, Player_country_warehouse, Gather#warehouse_gather.player_info),
	lib_country_warehouse:put_country_warehouse(Gather#warehouse_gather{player_info = NewMap})
.

get_country_quarter_income(CountryId,ItemId) ->
	CountryWarehouse = get_country_warehouse(CountryId),
	(?DICT_FETCH(ItemId, CountryWarehouse#country_warehouse.quarter_income_map, #resource{id = ItemId}))#resource.num
.

add_country_quarter_income(CountryId,ItemId,Num) ->
	CountryWarehouse = get_country_warehouse(CountryId),
	RepertoryNum = get_country_quarter_income(CountryId,ItemId),
	Resource = #resource{id = ItemId,num = RepertoryNum + Num},
	NewDict = dict:store(Resource#resource.id, Resource, CountryWarehouse#country_warehouse.quarter_income_map),
	lib_country_warehouse_api:update_country_warehouse(CountryWarehouse#country_warehouse{quarter_income_map = NewDict})
.

reduce_country_quarter_income(CountryId,ItemId,Num) ->
	CountryWarehouse = get_country_warehouse(CountryId),
	RepertoryNum = get_country_quarter_income(CountryId,ItemId),
	try
		?JUDGE_RETURN(RepertoryNum >= Num, "ItemId"),
		Resource = #resource{id = ItemId,num = RepertoryNum - Num},
		NewDict = dict:store(Resource#resource.id, Resource, CountryWarehouse#country_warehouse.quarter_income_map),
		lib_country_warehouse_api:update_country_warehouse(CountryWarehouse#country_warehouse{quarter_income_map = NewDict}),
		true
	catch
		throw:{error, Flag} -> ?DEBUG("item:~p no enough", [Flag])
	end
.

get_country_year_income(CountryId,ItemId) ->
	CountryWarehouse = get_country_warehouse(CountryId),
	#resource{num = Num} = ?DICT_FETCH(ItemId, CountryWarehouse#country_warehouse.year_income_map, #resource{id = ItemId}),
	Num
.

add_country_year_income(CountryId,ItemId,Num) ->
	CountryWarehouse = get_country_warehouse(CountryId),
	RepertoryNum = get_country_year_income(CountryId,ItemId),
	Resource = #resource{id = ItemId,num = RepertoryNum + Num},
	NewDict = dict:store(Resource#resource.id, Resource, CountryWarehouse#country_warehouse.year_income_map),
	lib_country_warehouse_api:update_country_warehouse(CountryWarehouse#country_warehouse{year_income_map = NewDict})
.

reduce_country_year_income(CountryId,ItemId,Num) ->
	CountryWarehouse = get_country_warehouse(CountryId),
	RepertoryNum = get_country_year_income(CountryId,ItemId),
	try
		?JUDGE_RETURN(RepertoryNum >= Num, "ItemId"),
		Resource = #resource{id = ItemId,num = RepertoryNum - Num},
		NewDict = dict:store(Resource#resource.id, Resource, CountryWarehouse#country_warehouse.year_income_map),
		lib_country_warehouse_api:update_country_warehouse(CountryWarehouse#country_warehouse{year_income_map = NewDict}),
		true
	catch
		throw:{error, Flag} -> ?DEBUG("item:~p no enough", [Flag])
	end
.



update_year_box_info(PlayID) ->
	PlayerInfo = get_player_info(PlayID),
	%% 计算宝箱等级
	[Level] = calculate_box_level(PlayID),
	case Level of
		false -> skip;
		_ -> 	Treasure_box = #treasure_box{id = PlayID,box_level = Level},
			lib_country_warehouse:update_box_info(PlayerInfo#player_country_warehouse.country,Treasure_box)
	end
.

%% 计算宝箱等级
calculate_box_level(PlayID) ->
	#player_country_warehouse{
		year_annihilation = Year_annihilation,year_battle_losses = Year_battle_losses,year_construction_value = Year_construction_values
	} = get_player_info(PlayID),
	%% 判断等级公式
	Key_list = tb_year_treasure_box:get_list(),
	Num = Year_annihilation div 300 + Year_battle_losses div 30 + Year_construction_values,
	#{'num' := [BoxMin,_]} = tb_year_treasure_box:get(1),
	case Num > BoxMin of
		true -> lists:filter(fun(K) ->  [Min,Max] = maps:get(num, tb_year_treasure_box:get(K)),Min =< Num andalso Max >= Num  end,Key_list);
		false -> [false]
	end

.

%% 判断是否在累计时间内
judge_is_in_time() ->
	#{'timevalue' := Value1} = tb_const:get(annual_award_time),
	#{'timevalue' := Value2} = tb_const:get(refresh_time),
	{H, M, S} = erlang:time(),
	case ((H  * 3600 + M * 60 + S) >= Value1) or ((H  * 3600 + M * 60 + S) =< Value2) andalso lib_season_and_days_api:get_season_info() =:= ?WINTER of
		true 	-> false;
		false 	-> true
	end
.


add_year_annihilation_and_battle_losses(PlayID,Add_annihilation,Battle_losses)	->
	case judge_is_in_time() of
		true  -> Player_info = get_player_info(PlayID),
			update_player_info(PlayID,Player_info#player_country_warehouse{
				year_annihilation = Player_info#player_country_warehouse.year_annihilation + Add_annihilation,
				year_battle_losses = Player_info#player_country_warehouse.year_battle_losses + Battle_losses
			}),
			update_year_box_info(PlayID);
		false ->    ?DEBUG("正在进行年度结算,无法累计")
	end
.

add_year_construction_values(Construction_value) ->
	async_apply(fun add_year_construction_values/2,[lib_player:player_id(),Construction_value])
.

add_year_construction_values(PlayID,Construction_value)	->
	case judge_is_in_time() of
		true  -> Player_info = get_player_info(PlayID),
			update_player_info(PlayID,Player_info#player_country_warehouse{year_construction_value = Player_info#player_country_warehouse.year_construction_value + Construction_value}),
			update_year_box_info(PlayID);
		false ->    ?DEBUG("正在进行年度结算,无法累计")
	end
.