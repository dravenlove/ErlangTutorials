%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_recharge
%%% Created on : 2020/8/28 0028 11:31
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		充值相关数据保存在player_money里
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_recharge).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("recharge.hrl").
-include("ProtoClient_10110.hrl").

%% API
-export([
	check_recharge_order/0,
	notify_recharge_info/0,
	recharge_http_return/2,
	sign_in/0
]).

-export([
	test_recharge_command/1
]).

get_recharge_info(RechargeId) ->
	Player_money = lib_money_api:get_player_money(),
	maps:get(RechargeId,Player_money#player_money.recharge_map,#recharge_info{recharge_id = RechargeId})
.
update_recharge_info(Recharge) when is_record(Recharge,recharge_info)->
	Player_money = lib_money_api:get_player_money(),
	NewMap = maps:put(Recharge#recharge_info.recharge_id,Recharge,Player_money#player_money.recharge_map),
	lib_money_api:put_player_money(Player_money#player_money{
		recharge_map = NewMap
	}, true)
.
notify_recharge_info() ->
	#player_money{
		id = PlayerId,
		have_first = Have_first,
		get_first = Get_first,
		recharge_map = RechargeTimesMap
	} = lib_money_api:get_player_money(),
	ProtoRechargeList = [recharge_info_to_proto(Recharge) || {_,Recharge} <- maps:to_list(RechargeTimesMap)],
	Respond = #'Proto80110003'{
		recharge_info = ProtoRechargeList,
		have_first = Have_first,
		get_first = Get_first
	},
	?DEBUG("recharge pannel: ~p ~w", [PlayerId, Respond]),
	lib_send:respond_to_client(Respond).

recharge_info_to_proto(Recharge) ->
	#'ProtoRecharge'{
		recharge_id = Recharge#recharge_info.recharge_id,
		buy_time = Recharge#recharge_info.buy_time,
		refresh_tick = Recharge#recharge_info.refresh_tick,
		total_by_time = Recharge#recharge_info.total_by_time
	}
.


%% 读取充值订单
check_recharge_order() ->
	BsonList = db_player_recharge:fetch_all_recharge_order(lib_player:player_id()),
	check_recharge_order(BsonList),
	ok.

check_recharge_order([]) ->
	ok;
check_recharge_order([Bson | T]) ->
	try
		OrderId = ?BSON_STRING(Bson, <<"order_id">>),
		OrderMoneyType = ?BSON_INT(Bson, <<"money_type">>),
		OrderMoney = ?BSON_FLOAT(Bson, <<"money">>),
		OrderGold = ?BSON_INT(Bson, <<"gold">>),
		IsTest = ?BSON_INT(Bson, <<"is_test">>),
		RechargeId = ?BSON_INT(Bson, <<"conf_id">>),
		#player_base{
			agent_code = AgentCode,
			market = Market,
			server_flag = ServerFlag
		} = lib_player:get_player_base(),
		db_player_recharge:update_recharge_order_flag(OrderId, AgentCode, Market, ServerFlag),
		Conf = tb_recharge:get(RechargeId),
		if
			Conf =/= false ->
				ConfMoneyType = maps:get(money_type, Conf, 1),
				ConfMoney = maps:get(money, Conf, 0.0),
				ConfGold = maps:get(gold, Conf, 0),
				if
					ConfMoney =/= OrderMoney orelse ConfGold =/= OrderGold ->
						?ERROR("recharge order check money and gold: ~ts ~p money[~p ~p] gold[~p ~p]", [
							OrderId, RechargeId, OrderMoney, ConfMoney, OrderGold, ConfGold
						]),
						throw({error, -1});
					true -> skip
				end,
				Type = maps:get(type, Conf, 0),
				case Type of
					?RECHARGE_TYPE_NORMAL ->
						recharge_money_by_normal(OrderId, RechargeId, ConfMoneyType, ConfMoney, ConfGold),
						lib_player_process:process_recharge_gold(RechargeId, ConfMoney, ConfGold);
					_ ->
						?ERROR("recharge order no type: ~ts ~p ~p", [OrderId, RechargeId, Type]),
						throw({error, -1})
				end,
				lib_player_recharge_listen:listen_recharge_money(RechargeId, ConfMoney, ConfGold),
				lib_player_process:process_recharge_all(RechargeId, ConfMoney, ConfGold);
			IsTest =:= 1 andalso Conf =:= false ->
				recharge_money_without_conf(OrderMoneyType, OrderMoney, OrderGold),
				lib_player_recharge_listen:listen_recharge_money(0, OrderMoney, OrderGold),
				lib_player_process:process_recharge_gold(0, OrderMoney, OrderGold),
				lib_player_process:process_recharge_money(0, OrderMoney, OrderGold),
				lib_player_process:process_recharge_all(0, OrderMoney, OrderGold);
			true ->
				?ERROR("recharge order: ~ts ~p ~p ~p ~p ~w", [OrderId, OrderMoney, OrderGold, IsTest, RechargeId, Conf]),
				throw({error, -1})
		end,
		Recharge = get_recharge_info(RechargeId),
		update_recharge_info(Recharge#recharge_info{
			buy_time = Recharge#recharge_info.buy_time + 1,total_by_time =  Recharge#recharge_info.total_by_time + 1
		}),
		add_country_red_packet(RechargeId),
		lib_send:respond_to_client(#'Proto80110002'{recharge_id = RechargeId}),
		NewRecharge = get_recharge_info(RechargeId),
		lib_send:respond_to_client(#'Proto80110003'{recharge_info = [recharge_info_to_proto(NewRecharge)]}),
		ok
	catch
	    throw:{error, _ErrCode} -> skip
	end,
	check_recharge_order(T).

%% 直接充指定元宝
recharge_money_without_conf(MoneyType, Money, Gold) ->
	lib_player_pack:auto_insert(
		#item{item_id = ?ITEM_ID_GOLD, amount = Gold},
		#serial_obj{insert_serial_type = ?ADD_RECHARGE, currency_type = MoneyType, currency = Money},
		true, ?PACK_TIPS1),
	#player_money{
		total_recharge_money = TotalMoney,
		total_recharge_gold = TotalGold
	} = PlayerMoney = lib_money_api:get_player_money(),
	lib_money_api:put_player_money(PlayerMoney#player_money{
		total_recharge_money = TotalMoney + Money,
		total_recharge_gold = TotalGold + Gold
	}, true),
	ok.

%% 普通充值
recharge_money_by_normal(_OrderId, RechargeId, MoneyType, Money, Gold) ->
%%	Rebate = get_recharge_rebate(ConfId),
	lib_player_pack:auto_insert(
%%		#item{item_id = ?ITEM_ID_GOLD, amount = Gold + Rebate},
		#item{item_id = ?ITEM_ID_GOLD, amount = Gold},
		#serial_obj{insert_serial_type = ?ADD_RECHARGE, insert_sub_type = RechargeId, currency_type = MoneyType, currency = Money},
		true, ?PACK_TIPS1),
	ok.

%% 增加势力分享红包
add_country_red_packet(RechargeId) ->
	Conf = tb_recharge:get(RechargeId),
	case Conf =:= false orelse maps:get(redbag_acount,Conf,[]) =:= [] of
		true -> skip;
		false-> ?INFO("A ~p",[maps:get(redbag_acount,Conf,[])]),
				[Min,Max] =  maps:get(redbag_acount,Conf,[]),
			    Num = util:rand(Min,Max),
				lib_country_warehouse:add_recharge_dividends_to_country(Num)
	end
.

sign_in() ->
	http_role_info()
.

http_role_info() ->
	DataMap =lib_player:get_date_map(),
	lib_http_api:async_post(config:get_post_url(), DataMap, lib_player:get_pid(lib_player:player_id()), fun lib_player_recharge:recharge_http_return/2, 0)
.

recharge_http_return(RespondBody,_) ->
	<<"{\"code\":1,\"isForeverCard\":",Binary:1/binary,",\"msg\":\"success\"}">> = RespondBody,
	HaveForeverCard = binary_to_integer(Binary),
	case HaveForeverCard =:= 1 of
		true -> Recharge = get_recharge_info(?FOREVER_CARD),
			    update_recharge_info(Recharge#recharge_info{buy_time = 1,total_by_time = 1});
		false-> skip
	end,
	lists:foreach(fun(RechargeId)->
		Conf = tb_recharge:get(RechargeId),
		Type = maps:get(buy_limit_type,Conf),
		CurTick = lib_timer:unixtime(),
		NewRecharge = get_recharge_info(RechargeId),
		case NewRecharge#recharge_info.refresh_tick > CurTick of
			true -> skip;
			false-> update_refresh_time(NewRecharge,CurTick,Type)
		end
	end, tb_recharge:get_list())
.

update_refresh_time(Recharge,CurTick,?BUY_LIMIT_TYPE_1) ->
	Next_tick = lib_timer:cur_refresh_tick(CurTick),
	update_recharge_info(Recharge#recharge_info{buy_time = 0,refresh_tick = Next_tick})
;
update_refresh_time(Recharge,CurTick,?BUY_LIMIT_TYPE_2) ->
	Next_tick = lib_timer:next_week_zero_time(CurTick) + lib_timer:refresh_time(),
	update_recharge_info(Recharge#recharge_info{buy_time = 0,refresh_tick = Next_tick})
;
update_refresh_time(Recharge,CurTick,?BUY_LIMIT_TYPE_3) ->
	Tick = lib_timer:next_week_zero_time(CurTick) - lib_timer:day_second() + lib_timer:refresh_time(),
	Next_tick = case Tick =< CurTick of
					 true -> Tick;
					 false-> Tick + lib_timer:day_second() * 7
	end,
	update_recharge_info(Recharge#recharge_info{buy_time = 0,refresh_tick = Next_tick})
;
update_refresh_time(Recharge,CurTick,?BUY_LIMIT_TYPE_4) ->
	Next_tick = lib_timer:next_month_zero_time(CurTick) + lib_timer:refresh_time(),
	update_recharge_info(Recharge#recharge_info{buy_time = 0,refresh_tick = Next_tick})
;
update_refresh_time(_Recharge,_CurTick,_Type) ->
	skip
.
%% 根据已充值次数判断是否有返利
%%get_recharge_rebate(_ConfId) -> 0.
%%	#{
%%		doubletime:=MaxTimes,
%%		rebate:=Rebate
%%	} = tb_recharge:get(ConfId),
%%	#player_money{
%%		recharge_times_map = RechargeTimesMap
%%	} = lib_money_api:get_player_money(),
%%	RechargeTimes = maps:get(ConfId, RechargeTimesMap, 0),
%%	if
%%		RechargeTimes < MaxTimes -> Rebate;
%%		true -> 0
%%	end.
%%
%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%test_recharge_command(Par1, Par2, Par3, Par4) ->
%%	if
%%		Par1 =:= 0 ->
%%			request_recharge_pannel();
%%		Par1 =:= 1 ->
%%			%% 充值指定档次
%%			ConfId = Par2,
%%			#{
%%				money:=Money,
%%				money_type:=MoneyType,
%%				gold:=Gold
%%			} = tb_recharge:get(ConfId),
%%			lib_player_process:process_recharge_money(ConfId, Money, Gold),
%%			db_player_recharge:save_test_order(lib_player:player_id(), ConfId, MoneyType, Money, Gold);
%%		Par1 =:= 2 ->
%%			%% 充值任意元宝
%%			MoneyType =
%%				if
%%					Par3 > 0 -> Par3;
%%					true -> 1
%%				end,
%%			lib_player_process:process_recharge_gold(0, Par2 / 10.0, Par2),
%%			db_player_recharge:save_test_order(lib_player:player_id(), 0, MoneyType, Par2 / 10.0, Par2);
%%		true ->
%%			?WARNING("test recharge: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
%%	end.

test_recharge_command(RechargeId) ->
	Conf = tb_recharge:get(RechargeId),
	?JUDGE_RETURN(Conf =/= false,?ERROR_CLIENT_OPERATOR),
	db_player_recharge:save_test_order(lib_player:player_id(), RechargeId, maps:get(money_type,Conf),  maps:get(money,Conf),  maps:get(gold,Conf))
.