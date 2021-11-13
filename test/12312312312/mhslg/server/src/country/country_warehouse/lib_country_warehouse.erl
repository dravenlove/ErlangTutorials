%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Dec 2020 3:50 PM
%%%-------------------------------------------------------------------
-module(lib_country_warehouse).
-author("df").
-include("common.hrl").
-include("player.hrl").
-include("country_warehouse.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10128.hrl").
-include("season_and_day.hrl").

-define(COUNTRY_WAREHOUSE_KEY, country_warehouse_key).

%% API
-export([
	get_country_warehouse/0,
	put_country_warehouse/1
]).
-export([
	get_treasure_box_info/2,
	update_box_info/2,

	reset_country_warehouse_info/0,
	add_recharge_dividends_to_country/1,
	get_country_warehouse_info/0,
	get_country_dividends/1,
	grant_year_award/0,

	pay_axes/0,
	pay_tribute/0,

	sign_in/0
]).

get_country_warehouse() ->
	erlang:get(?COUNTRY_WAREHOUSE_KEY)
.
put_country_warehouse(Country_warehouse) when is_record(Country_warehouse, warehouse_gather)  ->
	erlang:put(?COUNTRY_WAREHOUSE_KEY,Country_warehouse)
.

%% 获得玩家宝箱信息
get_treasure_box_info(CountryId,PlayerId) ->
	Country_warehouse = lib_country_warehouse_api:get_country_warehouse(CountryId),
	?DICT_FETCH(PlayerId, Country_warehouse#country_warehouse.player_treasure_box_dict, #treasure_box{id = PlayerId})
.
%% 更新单个玩家宝箱信息
update_box_info(CountryId,Treasure_box) when is_record(Treasure_box, treasure_box) ->
	Country_warehouse = lib_country_warehouse_api:get_country_warehouse(CountryId),
	NewTreasureBox = dict:store(Treasure_box#treasure_box.id, Treasure_box, Country_warehouse#country_warehouse.player_treasure_box_dict),
	lib_country_warehouse_api:update_country_warehouse(Country_warehouse#country_warehouse{player_treasure_box_dict = NewTreasureBox})
.

%% 增加分红充值信息
add_recharge_dividends(CountryId,Recharge_dividends) when is_record(Recharge_dividends, recharge_dividends) ->
	Country_warehouse = lib_country_warehouse_api:get_country_warehouse(CountryId),
	Dict = Country_warehouse#country_warehouse.recharges_dict,
	List = dict:fetch_keys(Dict),
	Id = case List =:= [] of
			 true -> 1 ;
			 false-> lists:last(List) + 1
		end,
	A = Recharge_dividends#recharge_dividends{id = Id},
	NewRechargeDividends = dict:store(A#recharge_dividends.id, A, Country_warehouse#country_warehouse.recharges_dict),
	lib_country_warehouse_api:update_country_warehouse(Country_warehouse#country_warehouse{recharges_dict = NewRechargeDividends})
.




%% 获得未领取的红包数
get_red_packet_num(Tick,Dict) ->
	Key_list = dict:fetch_keys(Dict),
	red_packet_num(Tick,Dict,Key_list,0)
.

red_packet_num(Tick,Dict,[Key|Key_list],Sum) ->
	#recharge_dividends{
		recharge_tick = Recharge_tick,
		num = Num
	} = dict:fetch(Key, Dict),
	case Recharge_tick >= Tick of
		true 	-> red_packet_num(Tick,Dict,Key_list,Sum+Num);
		false 	-> red_packet_num(Tick,Dict,Key_list,Sum)
	end
;
red_packet_num(_Tick,_Dict,[],Sum) ->
	Sum
.
%% 玩家分红充值信息
get_player_recharge_list(Dict) ->
	Key_list = dict:fetch_keys(Dict),
	dict_to_proto(Dict,Key_list,[])
.

dict_to_proto(Dict,[Key|Key_list],ProtoRechargeDividends) ->
	#recharge_dividends{
		name = Name,
		official_position = Official_position,
		is_chatelain = Is_chatelain,
		num = Num
	} = dict:fetch(Key, Dict),
	RechargeDividends = #'ProtoRechargeDividends'{
		name = Name,
		official_position = Official_position,
		is_chatelain = Is_chatelain,
		num = Num
	},
	dict_to_proto(Dict,Key_list,[RechargeDividends|ProtoRechargeDividends])
;

dict_to_proto(_Dict,[],ProtoRechargeDividends) ->
	ProtoRechargeDividends
.

found_item(Now_weight,[Key|Key_list]) ->
	#{  'item_id'  := Item_id,
		'item_num' := Item_num,
		'weight'   := Weight} = tb_pool_and_weight:get(Key),
	New_weight = Now_weight - Weight,
	case New_weight =< 0 of
		true 	->[Item_id,Item_num];
		false 	->found_item(New_weight,Key_list)
	end
.
%% 从池子里面计算出一个随机的道具信息
get_item_from_pool() ->
	Tb_list = tb_pool_and_weight:get_list(),
	%% 获得池子的权数总和
	Total_weight = lists:foldl(fun(X, Sum) -> maps:get(weight, tb_pool_and_weight:get(X),0) + Sum end, 0, Tb_list),
	Now_weight  = trunc(Total_weight * rand:uniform()),
	found_item(Now_weight,Tb_list)
.



%% 从红包中获取道具
get_item_form_red_packet(Num,Item_list) ->
	case Num =:= 0 of
		true 	->  Item_list;
		false  	->	case Item_list =:= [] of
						   true -> Item = get_item_from_pool(),
							       get_item_form_red_packet(Num - 1,[Item|Item_list]);
						   false->
							   		Item = get_item_from_pool(),
							  		 NewList = merge_similar_item(Item,Item_list),
							  		 get_item_form_red_packet(Num - 1,NewList)
					end
	end
.
merge_similar_item([Id,Num],[[Id1,Num1]|Item_list]) ->
	case Id =:= Id1 of
		true  -> [[Id, Num + Num1]|Item_list];
		false ->  NewList = Item_list ++ [[Id1,Num1]],
				 merge_similar_item([Id,Num],NewList,Id1)
	end
.


%% 合并同类道具
merge_similar_item([Id,Num],[[Id1,Num1]|Item_list],AnchorId) ->
	case Id =:= Id1 of
		true  -> Item_list ++ [[Id, Num + Num1]];
		false -> case  Id1 =:= AnchorId of
					   true  -> [[Id,Num],[Id1,Num1]|Item_list];
					   false ->	 merge_similar_item([Id,Num],Item_list ++ [[Id1,Num1]],AnchorId)
					end
	end


.
%% 更新领取红包时间
update_get_red_packet_tick(PlayerID) ->
	Player_info = lib_country_warehouse_api:get_player_info(PlayerID),
	lib_country_warehouse_api:update_player_info(PlayerID,Player_info#player_country_warehouse{
		get_red_packet_tick = lib_timer:unixtime()
	})
.


%%　向玩家发送奖励
send_reward_to_mail([PlayerId|KeyList],CountryId) ->
	lib_country_warehouse_api:update_year_box_info(PlayerId),
	#treasure_box{box_level = BoxLevel} = get_treasure_box_info(CountryId,PlayerId),
	Box = tb_year_treasure_box:get(BoxLevel),
	%% 获取国库数量
	CountWarehouse_gold = lib_country_warehouse_api:get_country_year_income(CountryId,?GOLD_ID),
	CountWarehouse_silver = lib_country_warehouse_api:get_country_year_income(CountryId,?MONEY_ID),
	CountWarehouse_cereals = lib_country_warehouse_api:get_country_year_income(CountryId,?PROVISIONS_ID),
	#{'value' := Gold} = tb_const:get(gold),
	#{'value' := Money} = tb_const:get(money),
	#{'value' := Provisions} = tb_const:get(provisions),
	#{
		'gold_multiple' := Gold_multiple,
		'silver_multiple' := Silver_multiple,
		'cereals_multiple' := Cereals_multiple
	} = Box,
	Item_list = [[Gold,erlang:trunc(CountWarehouse_gold*Gold_multiple) ],[Money,erlang:trunc(CountWarehouse_silver*Silver_multiple) ],
		[Provisions,erlang:trunc(CountWarehouse_cereals*Cereals_multiple)]],
	lib_mail_api:fast_send_mail(PlayerId, ?COUNTRY_YEAR_AWARD_MAIL_ID, [],
		lib_item_api:conf_item_list_to_pack_item_list(Item_list), ?ADD_COUNTRY_YEAR_AWARD),
	send_reward_to_mail(KeyList,CountryId)
;
send_reward_to_mail([],_CountryId) ->
	skip
.

%%-----------------------玩家进程调用

%% 请求国家仓库界面
get_country_warehouse_info()	->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_122), ?INFO("功能未开启")),
	PlayerId = lib_player:player_id(),
	%% 异步调用国家进行向前端发送国家仓库界面信息
	mod_server:async_apply(mod_map:get_pid(), fun country_warehouse_info_to_client/2, [PlayerId,lib_player:get_pid(PlayerId)])
.

country_warehouse_info_to_client(PlayerId,Player_pid)	->
	lib_country_warehouse_api:update_year_box_info(PlayerId),
	#player_country_warehouse{
		country = Country,
		get_red_packet_tick = Get_red_packet_tick,
		year_annihilation = Year_annihilation,
		year_battle_losses = Year_battle_losses,
		year_construction_value = Year_construction_values
	} = lib_country_warehouse_api:get_player_info(PlayerId),
	#country_warehouse{
		recharges_dict = Dict
	}  = lib_country_warehouse_api:get_country_warehouse(Country),
	Quarter_gold = lib_country_warehouse_api:get_country_quarter_income(Country,?GOLD_ID),
	Quarter_silver = lib_country_warehouse_api:get_country_quarter_income(Country,?MONEY_ID),
	Quarter_cereals= lib_country_warehouse_api:get_country_quarter_income(Country,?PROVISIONS_ID),
	Gold_repertory = lib_country_warehouse_api:get_country_year_income(Country,?GOLD_ID),
	Silver_repertory = lib_country_warehouse_api:get_country_year_income(Country,?MONEY_ID),
	Cereals_repertory = lib_country_warehouse_api:get_country_year_income(Country,?PROVISIONS_ID),
	Red_packet_num = get_red_packet_num(Get_red_packet_tick,Dict),
	Recharge_list = get_player_recharge_list(Dict),
	#treasure_box{box_level = BoxLevel} = get_treasure_box_info(Country,PlayerId),
	Respond = #'Proto50128102'{
		red_packet_num = Red_packet_num,
		year_annihilation = Year_annihilation,
		year_battle_losses = Year_battle_losses,
		year_construction_values = Year_construction_values,
		quarter_gold = 	Quarter_gold,
		quarter_silver = Quarter_silver,
		quarter_cereals = Quarter_cereals,
		gold_repertory = Gold_repertory,
		silver_repertory = Silver_repertory,
		cereals_repertory = Cereals_repertory,
		recharge_list = Recharge_list,
		box_level = BoxLevel
	},

	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("get_country_warehouse_info:~p",[Respond])
.


%% 请求领取国家分红
get_country_dividends(Msg)	->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_122), ?INFO("功能未开启")),
	#'Proto10128101'{num = Num} = Msg,
	Item = get_item_form_red_packet(Num,[]),
	Item_list = lib_item_api:conf_item_list_to_pack_item_list(Item),
	lib_player_pack:auto_insert(Item_list, ?INSERT_SERIAL(?ADD_COUNTRY_DIVIDENDS, Num)),
	%%回复客户端
	lib_send:respond_to_client(#'Proto50128101'{result = 1}),
	mod_server:async_apply(mod_map:get_pid(),fun update_get_red_packet_tick/1,[lib_player:player_id()])
.

%% 增加国家分红信息
add_recharge_dividends_to_country(Num) ->
	#player_base{name = Name,country = CountryId,country_pos = Country_pos, city_id = City_id} = lib_player:get_player_base(),
	Is_chatelain = 	case City_id =:= 0 of
					true -> 0;
					false ->1
				end,
	Recharge_dividends = #recharge_dividends{
		recharge_tick = lib_timer:unixtime(), name = Name,
		official_position = Country_pos, is_chatelain = Is_chatelain, num = Num},
	mod_server:sync_apply(mod_map:get_pid(), fun add_recharge_dividends/2, [CountryId,Recharge_dividends]),
	%% 重新发送信息给前端
	get_country_warehouse_info()

.
%%-----------------------地图进程定时调用

%% 冬季定时重置国家仓库信息
reset_country_warehouse_info() ->
	CountryList = tb_role_country:get_list(),
	reset_country_warehouse_info(CountryList)

.
reset_country_warehouse_info([CountryId|CountryList]) ->
	Country_warehouse = lib_country_warehouse_api:get_country_warehouse(CountryId),
	lib_country_warehouse_api:update_country_warehouse(Country_warehouse#country_warehouse{
		year_income_map = dict:new(),player_treasure_box_dict = dict:new()
	}),
	reset_country_warehouse_info(CountryList)
;
reset_country_warehouse_info([]) ->
	skip
.


grant_year_award() ->
	CountryList = tb_role_country:get_list(),
	%% 向玩家发放年度奖励
	country_grant_year_award(CountryList),
	%% 清空玩家数据
	Gather = lib_country_warehouse:get_country_warehouse(),
	lists:foreach(fun(PlayerID)->
		PlayerInfo = lib_country_warehouse_api:get_player_info(PlayerID),
		lib_country_warehouse_api:update_player_info(PlayerID,PlayerInfo#player_country_warehouse{
			get_red_packet_tick = 0, year_annihilation = 0, year_battle_losses = 0
		})
	end,maps:keys(Gather#warehouse_gather.player_info))
.

country_grant_year_award([CountryId|CountryList])->
	%% 获取国库的玩家宝箱信息
	#country_warehouse{player_treasure_box_dict = Award_dict} = lib_country_warehouse_api:get_country_warehouse(CountryId),
	Key_list = dict:fetch_keys(Award_dict),
	%% 遍历列表发送宝箱邮件
	send_reward_to_mail(Key_list,CountryId),
	country_grant_year_award(CountryList)
;
country_grant_year_award([]) ->
	skip
.

%% 交税
pay_axes()	->
	CountryList = tb_role_country:get_list(),
	pay_axes_to_country(CountryList)
.
%% 更改季度收入信息
update_quarter_silver(CountryId,ItemId,Num) ->
	CountryWarehouse = lib_country_warehouse_api:get_country_warehouse(CountryId),
	Resource = #resource{id = ItemId,num = Num},
	NewDict = dict:store(Resource#resource.id, Resource, CountryWarehouse#country_warehouse.quarter_income_map),
	lib_country_warehouse_api:update_country_warehouse(CountryWarehouse#country_warehouse{quarter_income_map = NewDict})
.

%% 单个国家收税
pay_axes_to_country([Country|CountryList])->
	%%　　获取相应国家的城池信息
	City_list = lib_map_api:country_city(Country),
	[GoldNum,SilverNum,CerealsNum] = calculate_revenue(City_list,0,0,0),
	%% 修改季节收入
	update_quarter_silver(Country,?GOLD_ID,GoldNum),
	update_quarter_silver(Country,?MONEY_ID,SilverNum),
	update_quarter_silver(Country,?PROVISIONS_ID,CerealsNum),
	%% 增加国库库存
	lib_country_warehouse_api:add_country_year_income(Country,?GOLD_ID,GoldNum),
	lib_country_warehouse_api:add_country_year_income(Country,?MONEY_ID,SilverNum),
	lib_country_warehouse_api:add_country_year_income(Country,?PROVISIONS_ID,CerealsNum),
	pay_axes_to_country(CountryList)
;
pay_axes_to_country([])->
	skip
.

%% 国家所属城池税收累计
calculate_revenue([City_id|City_list],GoldNum,SilverNum,CerealsNum)->
	%% 获取城池的税收信息
	ItemList = lib_map_api:city_hour_tax_revenue(City_id),
	Gold = lists:filter(fun([Id,_]) -> Id =:= ?GOLD_ID end,ItemList),
	HourGoldNum =
	case Gold of
		[] -> 0;
		_ -> [[_,HourNum]] = Gold,HourNum
	end,
	Silver = lists:filter(fun([Id,_]) -> Id =:= ?MONEY_ID end,ItemList),
	HourSilverNum =
		case Silver of
			[] -> 0;
			_ -> [[_,HourNum1]] = Silver,HourNum1
		end,
	Cereals  = lists:filter(fun([Id,_]) -> Id =:= ?PROVISIONS_ID end,ItemList),
	HourCerealsNum =
		case Cereals of
			[] -> 0;
			_ -> [[_,HourNum2]] = Cereals,HourNum2
		end,
	OneGoldNum = HourGoldNum * 24,OneSilverNum = HourSilverNum * 24,OneCerealsNum = HourCerealsNum * 24,
	%% 交税
	calculate_revenue(City_list,GoldNum + OneGoldNum,SilverNum + OneSilverNum,CerealsNum + OneCerealsNum)

;
calculate_revenue([],GoldNum,SilverNum,CerealsNum)	->
	[GoldNum,SilverNum,CerealsNum]
.

%% 提交贡品
pay_tribute()	->
	Season = lib_season_and_days_api:get_season(),
	%% 判断是否为第2赛季 且为 冬季
	case Season =:= 2 of
		true -> 	%% todo 获得圣山争夺战战败国列表
					Lose_Vanquished_Country_list = [],
					%% todo 获得圣山争夺战战胜国
					Win_Country = 1,
					[GoldNum,SilverNum,CerealsNum] = get_tribute_num(Lose_Vanquished_Country_list,0,0,0),
					%% 增加战胜国国库
					lib_country_warehouse_api:add_country_year_income(Win_Country,?GOLD_ID,GoldNum),
					lib_country_warehouse_api:add_country_year_income(Win_Country,?MONEY_ID,SilverNum),
					lib_country_warehouse_api:add_country_year_income(Win_Country,?PROVISIONS_ID,CerealsNum)
					;
		false -> skip
	end
.

%% 获取贡品数量
get_tribute_num([Country|List],Gold,Silver,Cereal)	->
	#{'floatvalue' := Multiplying_power} = tb_const:get(tribute_percentage),
	GoldNum = lib_country_warehouse_api:get_country_year_income(Country,?GOLD_ID),
	SilverNum = lib_country_warehouse_api:get_country_year_income(Country,?MONEY_ID),
	CerealsNum = lib_country_warehouse_api:get_country_year_income(Country,?PROVISIONS_ID),
	get_tribute_num(List,Gold + erlang:trunc(GoldNum * Multiplying_power),Silver + erlang:trunc(SilverNum * Multiplying_power),
		Cereal + erlang:trunc(CerealsNum * Multiplying_power))
;

get_tribute_num([],Gold,Silver,Cereal) ->
	[Gold,Silver,Cereal]
.

sign_in() ->
	mod_server:async_apply(mod_map:get_pid(),fun sign_in/1, [lib_player:player_show()])
.
sign_in(PlayerShow) ->
	PlayerId = PlayerShow#player_show.id,
	PlayerInfo = lib_country_warehouse_api:get_player_info(PlayerId),
	lib_country_warehouse_api:update_player_info(PlayerId,PlayerInfo#player_country_warehouse{country = PlayerShow#player_show.country})
.
