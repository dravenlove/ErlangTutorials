%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 12月 2020 16:09
%%%-------------------------------------------------------------------
-module(lib_country).
-author("13661").

-include("common.hrl").
-include("country.hrl").
-include("map.hrl").
-include("country_warehouse.hrl").

-define(MONITOR_KEY, country_key).
-define(RECHARGE_REBATE_MAIL,	1006). %% 国王充值王子返利邮件
-define(TAX_REVENUE_MAIL,		1004). %% 城主税收邮件
-define(SALARY_MAIL,			1005). %% 官员俸禄邮件

%% API
-export([
	get_country_monitor/0,
	put_country_monitor/1,
	save_monitor/0,
	build_index/0
]).
-export([
	process_sign_in/6,
	process_sign_out/1,
	process_client_load_complete/1,
	process_player_show_update/2,
	process_player_hero_update/2,
	process_recharge/2,
	process_fief_reward_update/2,
	process_can_appoint_master_update/2
]).
-export([
	process_start/1,
	process_reset_everyday/0,
	process_impeach_timeout/2,
	process_order_timeout/3,
	process_master_order_timeout/2,
	process_city_change/3,
	process_hour_timeout/0
]).
-export([
	sync_player_pos_name/1,
	sync_player_city_id/1,
	start_timer/3,
	open_order/3,
	open_master_order/1,
	send_tax_revenue_mail/3
]).
-export([
	test_get_king/1
]).

get_country_monitor() ->
	erlang:get(?MONITOR_KEY)
.

put_country_monitor(Monitor) when is_record(Monitor, country_monitor) ->
	erlang:put(?MONITOR_KEY, Monitor)
.

save_monitor() ->
	db_country:save_country_monitor(get_country_monitor())
.

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_COUNTRY_PLAYER, {?TUPLE_INT(id, 1)}, true)
.

process_sign_in(PlayerId, CountryId, CanAppointMaster, Show, RewardMap, Hero) ->
	case lib_country_api:is_have_player(PlayerId) of
		false ->
			Player = #country_player{
				id = PlayerId,
				country_id = CountryId,
				can_appoint_master = CanAppointMaster,
				show = Show,
				fief_map = RewardMap,
				hero = Hero
			},
			lib_country_api:update_player(Player);
		true ->
			Player = lib_country_api:player_info(PlayerId),
			lib_country_api:update_player(Player#country_player{
				show = Show,
				fief_map = RewardMap,
				hero = Hero
			})
	end,

	sync_player_pos_name(PlayerId),
	sync_player_city_id(PlayerId)
.

process_sign_out(_PlayerId) ->
	skip
.

process_client_load_complete(PlayerId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Country = lib_country_api:country_info(CountryId),
	mod_player:async_apply(PlayerId, fun lib_player_country:notify_notice/2, [Country#country.notice_uuid, Country#country.notice])
.

process_player_show_update(PlayerId, PlayerShow) ->
	case lib_country_api:is_have_player(PlayerId) of
		false -> skip;
		true ->
			Player = lib_country_api:player_info(PlayerId),
			lib_country_api:update_player(Player#country_player{
				show = PlayerShow
			})
	end
.
process_player_hero_update(PlayerId, Hero) ->
	case lib_country_api:is_have_player(PlayerId) of
		false -> skip;
		true ->
			Player = lib_country_api:player_info(PlayerId),
			lib_country_api:update_player(Player#country_player{
				hero = Hero
			})
	end
.

process_recharge(PlayerId, Money) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	KingId = lib_country_api:country_king_id(CountryId),
	PrinceId = lib_country_api:pos_player(CountryId, ?COUNTRY_POS_PRINCE),
	case KingId =:= PlayerId andalso PrinceId > 0 of
		false -> skip;
		true ->
			PosNameId = lib_country_api:player_pos_name_id(PrinceId),
			PosName = lib_country_api:pos_name(PosNameId),

			Rebate = lib_country_setting:king_change_rebate(),
			RebateGold = Money * Rebate,
			Mail1 = lib_mail_api:create_sys_mail(?ADD_KING_RECHARGE_REBATE),
			Mail2 = lib_mail_api:set_title_content(Mail1, ?RECHARGE_REBATE_MAIL, [Money, PosName, RebateGold]),
			Mail3 = lib_mail_api:add_item(Mail2, ?ITEM_ID_GOLD, RebateGold),
			lib_mail_api:send(Mail3, PrinceId)
	end
.

process_fief_reward_update(PlayerId, RewardMap) ->
	case lib_country_api:is_have_player(PlayerId) of
		false -> skip;
		true ->
			Player = lib_country_api:player_info(PlayerId),
			lib_country_api:update_player(Player#country_player{fief_map = RewardMap})
	end
.

process_can_appoint_master_update(PlayerId, CanAppointMaster) ->
	case lib_country_api:is_have_player(PlayerId) of
		false -> skip;
		true ->
			Player = lib_country_api:player_info(PlayerId),
			lib_country_api:update_player(Player#country_player{can_appoint_master = CanAppointMaster})
	end
.

process_start(CurTick) ->
	init_player_city_id(),
	update_stage(),
	init_player_pos(),
	check_reset_everyday(),
	check_send_salary(),
	init_tax_revenue(CurTick),
	init_order_timeout(),
	init_master_order_timeout(),
	init_impeach_timeout()
.

process_reset_everyday() ->
	check_reset_everyday()
.

process_impeach_timeout(CountryId, UUID) ->
	?INFO("country impeach timeout start ~p ~p", [CountryId, UUID]),

	ImpeachInfo = lib_country_api:impeach_info(CountryId),
	#impeach{
		uuid = CurUUID,
		is_in_impeach = IsInImpeach,
		tag_impeach_id = TagImpeachId,
		req_impeach_id = ReqImpeachId,
		a_votes_number = ANumber,
		b_votes_number = BNumber
	} = ImpeachInfo,

	try
		?JUDGE_RETURN(IsInImpeach andalso CurUUID =:= UUID, -1),

		?INFO("country impeach timeout end ~p ~p", [CountryId, UUID]),
		lib_country_api:update_impeach(CountryId, ImpeachInfo#impeach{is_in_impeach = false}),
		case ANumber > BNumber of
			false ->
				?INFO("country ~p impeach fail, ~p:~p ~p:~p", [CountryId, ReqImpeachId,  ANumber, TagImpeachId, BNumber]);
			true ->
				?INFO("country ~p impeach success, ~p:~p ~p:~p", [CountryId, ReqImpeachId,  ANumber, TagImpeachId, BNumber]),
				lib_country_api:appoint_pos(CountryId, ?COUNTRY_POS_KING, ReqImpeachId),
				lib_country_api:set_king_change_tick(CountryId, lib_timer:unixtime())
		end
	catch
	    throw: {error, _} -> skip
	end
.

process_order_timeout(CountryId, Type, UUID) ->
	?INFO("country order timeout start ~p ~p ~p", [CountryId, Type, UUID]),

	Order = lib_country_api:order_info(CountryId, Type),
	case Order#military_orders.is_in_open andalso Order#military_orders.uuid =:= UUID of
		false -> skip;
		true ->
			lib_country_api:update_order(CountryId, Order#military_orders{is_in_open = false}),
			?INFO("country order timeout end ~p ~p ~p", [CountryId, Type, UUID])
	end
.

process_master_order_timeout(CityId, UUID) ->
	?INFO("country master order timeout start ~p ~p ~p", [CityId, UUID]),

	Order = lib_map_api:master_order_info(CityId),
	case Order#master_order.is_in_open andalso Order#master_order.uuid =:= UUID of
		false -> skip;
		true ->
			lib_map_api:update_master_order(CityId, Order#master_order{is_in_open = false}),
			?INFO("country master order timeout end ~p ~p ~p", [CityId, UUID])
	end
.

process_city_change(CityId, OldCountryId, NewCountryId) ->
	case OldCountryId > 0 of
		false -> skip;
		true ->
			OldOrder = lib_country_api:order_info(OldCountryId, ?ORDER_TYPE_DEFENSIVE),
			case OldOrder#military_orders.is_in_open of
				true -> lib_country_api:update_order(OldCountryId,OldOrder#military_orders{is_in_open = false});
				false -> skip
			end
	end,

	CountryIdList = tb_role_country:get_list(),
	lib_common:list_map(fun(CountryId) ->
		Order = lib_country_api:order_info(CountryId, ?ORDER_TYPE_SIEGE),
		?JUDGE_CONTINUE(Order#military_orders.is_in_open),
		?JUDGE_CONTINUE(Order#military_orders.city_id =:= CityId),

		lib_country_api:update_order(CountryId, Order#military_orders{is_in_open = false})
  	end, CountryIdList),

	update_stage(OldCountryId),
	update_stage(NewCountryId)
.

process_hour_timeout() ->
	CurTick = lib_timer:unixtime(),
	[StartHour, EndHour] = lib_country_setting:tax_revenue_time(),
	{_, {Hour,_,_}} = lib_timer:to_localtime(CurTick),
	process_add_tax_revenue(CurTick),

	case Hour =:= StartHour of
		false -> skip;
		true -> process_send_tax_revenue(CurTick)
	end,

	case Hour =:= EndHour of
		false -> skip;
		true -> process_reset_tax_revenue(CurTick)
	end,

	check_send_salary()
.

process_add_tax_revenue(CurTick) ->
	?INFO("country add tax revenue"),
	CurHourTick = lib_timer:current_hour_unixtime(CurTick),
	[StartHour, EndHour] = lib_country_setting:tax_revenue_time(),
	{_, {Hour,_,_}} = lib_timer:to_localtime(CurTick),
	CityDict = lib_map_api:all_city(),
	dict:map(
		fun(CityId, City) ->
			TaxMap = City#city.tax_revenue_map,
			SendTaxMap = City#city.send_tax_revenue_map,
			Produce = lib_map_api:city_hour_tax_revenue(CityId),
			Flag = Hour =< StartHour orelse Hour > EndHour,
			{NewTaxMap, NewSendTaxMap} = lists:foldl(
				fun([Id, Amount], {Map1, Map2}) ->
					AddAmount = trunc((hour_add(Id, CityId) + capital_add(Id, City#city.country) + Amount) * (100 + hour_per(Id, CityId)) / 100),
					{maps:put(Id, maps:get(Id, Map1, 0) + AddAmount, Map1),
						case Flag of
							false -> Map2;
							true -> maps:put(Id, maps:get(Id, Map2, 0) + AddAmount, Map2)
						end}
				end, {TaxMap, SendTaxMap}, Produce),
			lib_map_api:u_city(City#city{
				tax_revenue_map = NewTaxMap,
				send_tax_revenue_map = NewSendTaxMap,
				tax_revenue_produce_tick = CurHourTick
			})
		end, CityDict)
.
hour_add(Id, CityId) ->
	G = ?GOLD_ID,
	M = ?MONEY_ID,
	P = ?PROVISIONS_ID,
	case Id of
		G -> lib_map_api:building_prop(?CITY_EFFECT_5, CityId);
		M -> lib_map_api:building_prop(?CITY_EFFECT_2, CityId);
		P -> lib_map_api:building_prop(?CITY_EFFECT_3, CityId);
		_ -> 0
	end
.
capital_add(Id, Country) ->
	case lists:member(Country, lib_map_api:player_country()) of
		true ->
			P = ?PROVISIONS_ID,
			case Id of
				P -> lib_map_api:capital_building_prop(?CITY_EFFECT_6, Country);
				_ -> 0
			end;
		false -> 0
	end
.
hour_per(Id, CityId) ->
	M = ?MONEY_ID,
	P = ?PROVISIONS_ID,
	case Id of
		M -> lib_map_api:building_prop(?CITY_EFFECT_14, CityId);
		P -> lib_map_api:building_prop(?CITY_EFFECT_15, CityId);
		_ -> 0
	end
.

process_send_tax_revenue(CurTick) ->
	?INFO("country send tax revenue"),

	CurZeroTick = lib_timer:current_zero_unixtime(CurTick),
	CityMap = lib_common:dict_to_map(lib_map_api:all_city()),
	lib_common:map_map(fun(CityId, City) ->
		try
			#city{
				master_id = MasterId,
				send_tax_revenue_map = SendTaxMap
			} = City,

			?JUDGE_CONTINUE(MasterId > 0),

			send_tax_revenue_mail(CityId, MasterId, SendTaxMap),

			lib_map_api:u_city(City#city{
				send_tax_revenue_map = maps:new(),
				tax_revenue_send_tick = CurZeroTick
			})
		catch
			throw: continue -> skip;
		    Type: Reason -> ?ERROR("city ~p send tax revenue error ~p, ~p", [CityId, Type, Reason])
		end
 	end, CityMap)
.

process_reset_tax_revenue(CurTick) ->
	?INFO("country tax revenue"),

	CurZeroTick = lib_timer:current_zero_unixtime(CurTick),
	CityMap = lib_common:dict_to_map(lib_map_api:all_city()),
	lib_common:map_map(fun(CityId, City) ->
		try
%%			#world_city{
%%				country = CountryId,
%%				tax_revenue_map = TaxMap
%%			} = City,

%%			case CountryId > 0 of
%%				false -> skip;
%%				true ->
%%					maps:map(fun(Id, Amount) ->
%%						lib_country_warehouse_api:add_country_year_income(CountryId, Id, Amount)
%%				 	end, TaxMap)
%%			end,

			lib_map_api:u_city(City#city{
				send_tax_revenue_map = maps:new(),
				tax_revenue_map = maps:new(),
				tax_revenue_reset_tick = CurZeroTick,
				tax_revenue_send_tick = CurZeroTick
			})
		catch
		    Type: Reason -> ?ERROR("city ~p reset tax revenue error ~p, ~p", [CityId, Type, Reason])
		end
   	end, CityMap)
.

check_reset_everyday() ->
	Monitor = get_country_monitor(),

	CurTick = lib_timer:unixtime(),
	SendTick = Monitor#country_monitor.reset_everyday_tick,
	case not lib_timer:is_same_day(SendTick, CurTick) of
		false -> skip;
		true ->
			put_country_monitor(Monitor#country_monitor{reset_everyday_tick = CurTick}),
			reset_everyday()
	end
.
reset_everyday() ->
	?INFO("country reset everyday"),

	CountryIdList = tb_role_country:get_list(),
	lists:map(fun(CountryId) ->
		OrderTypeList = tb_country_order:get_list(),
		lists:map(fun(OrderType) ->
			Order = lib_country_api:order_info(CountryId, OrderType),
			lib_country_api:update_order(CountryId, Order#military_orders{open_times = 0})
	  	end, OrderTypeList)
  	end, CountryIdList)
.

init_order_timeout() ->
	CurTick = lib_timer:unixtime(),
	lib_common:list_map(fun(CountryId) ->
		Country = lib_country_api:country_info(CountryId),
		lib_common:map_map(fun(Type, Order) ->
			#military_orders{
				is_in_open = IsInOpen,
				start_tick = StartTick,
				uuid = UUID
			} = Order,

			?JUDGE_CONTINUE(IsInOpen),
			TimeoutTick = StartTick + lib_country_setting:order_duration(Type),

			case TimeoutTick < CurTick of
				true -> process_order_timeout(CountryId, Type, UUID);
				false -> start_timer((TimeoutTick - CurTick) * 1000, fun process_order_timeout/3, [CountryId, Type, UUID])
			end
	   	end, Country#country.order_map)
	end, tb_role_country:get_list())
.

init_master_order_timeout() ->
	CurTick = lib_timer:unixtime(),
	lib_common:map_map(fun(CityId, City) ->
		Order = City#city.master_order,
		#master_order{
			uuid = UUID,
			is_in_open = IsInOpen,
			start_tick = StartTick
		} = Order,

		?JUDGE_CONTINUE(IsInOpen),
		TimeoutTick = StartTick + lib_country_setting:city_master_order_duration(),

		case TimeoutTick < CurTick of
			true -> process_master_order_timeout(CityId, UUID);
			false -> start_timer((TimeoutTick - CurTick) * 1000, fun process_master_order_timeout/2, [CityId, UUID])
		end
	end, lib_common:dict_to_map(lib_map_api:all_city()))
.

init_impeach_timeout() ->
	CurTick = lib_timer:unixtime(),
	lib_common:list_map(fun(CountryId) ->
		Country = lib_country_api:country_info(CountryId),
		Impeach = Country#country.impeach_info,
		#impeach{
			uuid = UUID,
			is_in_impeach = IsInImpeach,
			req_impeach_tick = StartTick
		} = Impeach,

		?JUDGE_CONTINUE(IsInImpeach),
		TimeoutTick = StartTick + lib_country_setting:impeach_duration(),

		case TimeoutTick < CurTick of
			true -> process_impeach_timeout(CountryId, UUID);
			false -> start_timer((TimeoutTick - CurTick) * 1000, fun process_impeach_timeout/2, [CountryId, UUID])
		end
	end, tb_role_country:get_list())
.

init_player_city_id() ->
	CityMap = lib_common:dict_to_map(lib_map_api:all_city()),
	PlayerCityMap =
	maps:fold(fun(CityId, City, Map) ->
		MasterId = City#city.master_id,
		?IIF(MasterId =/= 0, maps:put(MasterId, CityId, Map), Map)
  	end, maps:new(), CityMap),

	Monitor = get_country_monitor(),
	NewPlayerMap =
	maps:fold(fun(PlayerId, CityId, PlayerMap) ->
		case maps:is_key(PlayerId, PlayerCityMap) of
			false ->
				?ERROR("init set player city error no player, ~p ~p", [CityId, PlayerId]);
			true ->
				Player = maps:get(PlayerId, PlayerMap),
				NewPlayer = Player#country_player{city_id = CityId},
				maps:put(PlayerId, NewPlayer, PlayerMap)
		end
  	end, Monitor#country_monitor.player_map, PlayerCityMap),
	put_country_monitor(Monitor#country_monitor{player_map = NewPlayerMap})
.

init_player_pos() ->
	Monitor = get_country_monitor(),
	CountryMap = Monitor#country_monitor.country_map,

	maps:map(fun(CountryId, Country) ->
		PosMap = Country#country.pos_map,
		Stage = Country#country.cur_stage,
		lib_common:map_map(fun(Pos, PlayerId) ->
			?JUDGE_CONTINUE(PlayerId > 0),
			?JUDGE_CONTINUE(lib_country_api:is_have_player(PlayerId)),

			Player = lib_country_api:player_info(PlayerId),
			PosNameId = lib_country_api:calc_pos_name_id(CountryId, Stage, Pos),
			lib_country_api:update_player(Player#country_player{pos = Pos, pos_name_id = PosNameId})
        end, PosMap)
    end, CountryMap)
.

send_tax_revenue_mail(CityId, MasterId, SendTaxMap) ->
	[RateA, RateB, RateC] = lib_country_setting:tax_revenue_rate(),

	A = lib_common:floor(maps:get(?GOLD_ID, SendTaxMap, 0) * RateA),
	B = lib_common:floor(maps:get(?MONEY_ID, SendTaxMap, 0) * RateB),
	C = lib_common:floor(maps:get(?PROVISIONS_ID, SendTaxMap, 0) * RateC),

	ItemObjList = ?IIF(A > 0, [?ITEM_OBJ(?GOLD_ID, A)], []) ++ ?IIF(B > 0, [?ITEM_OBJ(?MONEY_ID, B)], []) ++ ?IIF(C > 0, [?ITEM_OBJ(?PROVISIONS_ID, C)], []),

	CityName = lib_map_api:name(CityId),
	Mail1 = lib_mail_api:create_sys_mail(?ADD_MASTER_TAX_REVENUE),
	Mail2 = lib_mail_api:set_title_content(Mail1, ?TAX_REVENUE_MAIL, [CityName, A, B, C]),
	Mail3 = lib_mail_api:add_item_list(Mail2, lib_item_api:item_obj_list_to_pack_item_list(ItemObjList)),
	lib_mail_api:send(Mail3, MasterId)
.

check_send_salary() ->
	Monitor = get_country_monitor(),

	CurTick = lib_timer:unixtime(),
	{_,{CurHour,_,_}} = lib_timer:to_localtime(CurTick),
	SendHour = lib_country_setting:send_salary_time(),
	SendTick = Monitor#country_monitor.send_salary_tick,
	case not lib_timer:is_same_day(SendTick, CurTick) andalso CurHour >= SendHour of
		false -> skip;
		true ->
			put_country_monitor(Monitor#country_monitor{send_salary_tick = CurTick}),
			send_salary()
	end
.
send_salary() ->
	?INFO("country send_salary start"),

	lists:map(fun(CountryId) ->
		Country = lib_country_api:country_info(CountryId),
		PosMap = Country#country.pos_map,
		lib_common:map_map(fun(Pos, PlayerId) ->
			try
				?JUDGE_CONTINUE(PlayerId > 0),
				?JUDGE_CONTINUE(lib_country_api:is_have_player(PlayerId)),
				Player = lib_country_api:player_info(PlayerId),

				Conf = tb_country_pos:get(Pos),
				?JUDGE_CONTINUE(Conf =/= false),

				WorldRate = maps:get(world_rate, Conf, 0),
				FiefRate = maps:get(fief_rate, Conf, 0),

				FixedReward =
					case maps:find(items, Conf) of
						error -> ?CONTINUE;
						{ok, Value} -> Value
					end,
				WorldReward = [], 	%% todo 获取世界产出
				FiefReward = [ [Id, Amount] || {Id, Amount} <- maps:to_list(Player#country_player.fief_map)],
				TotalReward = lib_item_api:multi_conf_item_list(WorldReward, WorldRate / 100) ++ lib_item_api:multi_conf_item_list(FiefReward, FiefRate / 100) ++ FixedReward,

				ItemList = lib_item_api:conf_item_list_to_pack_item_list(TotalReward),
				PosNameId = lib_country_api:player_pos_name_id(PlayerId),
				PosName = lib_country_api:pos_name(PosNameId),

				Mail1 = lib_mail_api:create_sys_mail(?ADD_COUNTRY_POS_SALARY),
				Mail2 = lib_mail_api:set_title_content(Mail1, ?SALARY_MAIL, [PosName]),
				Mail3 = lib_mail_api:add_item_list(Mail2, ItemList),
				lib_mail_api:send(Mail3, PlayerId),

				?INFO("country ~p send_salary ~p, ~p ~p:~ts", [CountryId, Pos, PlayerId, PosNameId, PosName])
			catch
			    throw: continue -> skip;
				Type: Reason -> ?ERROR("country ~p send_salary error ~p ~p, ~p", [CountryId, Pos, Type, Reason])
			end
	   	end, PosMap)
  	end, tb_role_country:get_list())
.

sync_player_pos_name(PlayerId) ->
	PosNameId = lib_country_api:player_pos_name_id(PlayerId),
	mod_player:async_apply(PlayerId, fun lib_player_country:update_county_pos/1, [PosNameId])
.

sync_player_city_id(PlayerId) ->
	CityId = lib_country_api:player_city(PlayerId),
	mod_player:async_apply(PlayerId, fun lib_player_country:update_city_id/1, [CityId])
.

start_timer(TimeOut , Fun, Arg) ->
	erlang:send_after(TimeOut, self(), {timer, Fun, Arg})
.

open_order(CountryId, Type, CityId) ->
	Order = lib_country_api:order_info(CountryId, Type),
	OldTimes = Order#military_orders.open_times,
	UUID = lib_country_api:generate_uuid(),
	lib_country_api:update_order(CountryId, Order#military_orders{
		uuid = UUID,
		is_in_open = true,
		start_tick = lib_timer:unixtime(),
		city_id = CityId,
		open_times = OldTimes + 1
	}),

	DurationSec = lib_country_setting:order_duration(Type),

	start_timer(DurationSec * 1000, fun process_order_timeout/3, [CountryId, Type, UUID]),
	?INFO("country open order ~p ~p ~p ~p", [CountryId, Type, CityId, UUID])
.

open_master_order(CityId) ->
	Order = lib_map_api:master_order_info(CityId),
	UUID = lib_country_api:generate_uuid(),

	lib_map_api:update_master_order(CityId, Order#master_order{
		uuid = UUID,
		is_in_open = true,
		start_tick = lib_timer:unixtime()
	}),

	DurationSec = lib_country_setting:city_master_order_duration(),

	start_timer(DurationSec * 1000, fun process_master_order_timeout/2, [CityId, UUID]),
	?INFO("country open master order ~p ~p", [CityId, UUID])
.

update_stage() ->
	lists:map(fun(CountryId) ->
		update_stage(CountryId)
  	end, tb_role_country:get_list())
.
update_stage(CountryId) ->
	try
		?JUDGE_RETURN(tb_role_country:get(CountryId) =/= false, -1),

		Country = lib_country_api:country_info(CountryId),
		#country{
			cur_stage = CurStage,
			max_stage = MaxStage
		} = Country,
		?JUDGE_RETURN(CurStage =/= ?STAGE_TYPE_WIN, -1),

		Number = length(lib_map_api:country_type_city(?CITY_DU_CITY, CountryId)),

		IsWin = false, %%todo 圣山争夺战是否胜利

		NewStage =
		case IsWin of
			true -> ?STAGE_TYPE_WIN;
			false ->
				case Number of
					0 -> ?STAGE_TYPE_DU_CITY_0;
					1 -> ?STAGE_TYPE_DU_CITY_1;
					2 -> ?STAGE_TYPE_DU_CITY_2;
					3 -> ?STAGE_TYPE_DU_CITY_3;
					_ -> ?STAGE_TYPE_DU_CITY_4
				end
		end,

		NewMaxStage = max(NewStage, MaxStage),
		lib_country_api:update_country(Country#country{
			cur_stage = NewStage,
			max_stage = NewMaxStage
		}),

		case NewStage =/= CurStage of
			false -> skip;
			true -> process_cur_stage_change(CountryId, NewStage)
		end,

		?INFO("country update stage ~p ~p:~p ~p:~p", [CountryId, CurStage, NewStage, MaxStage, NewMaxStage])
	catch
	    throw: {error, _} -> skip
	end
.

process_cur_stage_change(CountryId, _Stage) ->
	update_all_player_pos_name(CountryId),
	sync_all_player_pos_name(CountryId)
.

sync_all_player_pos_name(CountryId) ->
	Country = lib_country_api:country_info(CountryId),
	PosMap = Country#country.pos_map,

	lib_common:map_map(fun(_, PlayerId) ->
		?JUDGE_CONTINUE(PlayerId > 0),
		sync_player_pos_name(PlayerId)
   	end, PosMap)
.

update_all_player_pos_name(CountryId) ->
	Country = lib_country_api:country_info(CountryId),
	CurStage = Country#country.cur_stage,
	PosMap = Country#country.pos_map,

	lib_common:map_map(fun(Pos, PlayerId) ->
		?JUDGE_CONTINUE(PlayerId > 0),
		Player = lib_country_api:player_info(PlayerId),
		PosNameId = lib_country_api:calc_pos_name_id(CountryId, CurStage, Pos),
		lib_country_api:update_player(Player#country_player{pos_name_id = PosNameId})
 	end, PosMap)
.

init_tax_revenue(CurTick) ->
	CurZeroTick = lib_timer:current_zero_unixtime(CurTick),
	[StartHour, EndHour] = lib_country_setting:tax_revenue_time(),
	CityMap = lib_common:dict_to_map(lib_map_api:all_city()),
	lib_common:map_map(fun(CityId, City) ->
		try
			#city{
				master_id = MasterId,
				country = CountryId,
				send_tax_revenue_map = SendTaxMap,
				tax_revenue_send_tick = SendTick
			} = City,

			?JUDGE_CONTINUE(CurTick >= SendTick + lib_timer:day_second() + StartHour * lib_timer:hour_second() andalso MasterId > 0),

			send_tax_revenue_mail(CountryId, MasterId, SendTaxMap),
			lib_map_api:u_city(City#city{
				send_tax_revenue_map = maps:new(),
				tax_revenue_reset_tick = CurZeroTick
			})
		catch
		    throw: continue -> skip;
			Type: Reason -> ?ERROR("city ~p init tax revenue send error ~p, ~p", [CityId, Type, Reason])
		end
 	end, CityMap),

	lib_common:map_map(fun(CityId, City) ->
		try
			#city{
				tax_revenue_send_tick = ResetTick
			} = City,
			?JUDGE_CONTINUE(CurTick >= ResetTick + lib_timer:day_second() + EndHour * lib_timer:hour_second()),

			lib_map_api:u_city(City#city{
				send_tax_revenue_map = maps:new(),
				tax_revenue_reset_tick = CurZeroTick,
				tax_revenue_send_tick = CurZeroTick
			})
		catch
		    throw: continue -> skip;
			Type: Reason -> ?ERROR("city ~p init tax revenue reset error ~p, ~p", [CityId, Type, Reason])
		end
   	end, CityMap)
.

%%re_calc_tax_revenue(CurTick) ->
%%	CurTick = lib_timer:unixtime(),
%%	CurZeroTick = lib_timer:current_zero_unixtime(CurTick),
%%	CurHourTick = lib_timer:current_hour_unixtime(CurTick),
%%	[StartHour, EndHour] = lib_country_setting:tax_revenue_time(),
%%	CityMap = lib_map_api:get_all_city(),
%%	lib_common:map_map(fun(CityId, City) ->
%%		#world_city{
%%			country = CountryId,
%%			tax_revenue_map = TaxMap,
%%			send_tax_revenue_map = SendTaxMap,
%%			tax_revenue_reset_tick = ResetTick,
%%			tax_revenue_produce_tick = ProduceTick
%%		} = City,
%%
%%		HourProduce = lib_map_api:city_hour_tax_revenue(CityId),
%%
%%		case CurTick >= ResetTick + lib_timer:day_second() + EndHour * lib_timer:hour_second() of
%%			false -> %%时间没有跨越一次重置
%%				ProduceHour = (CurHourTick - ProduceTick) div lib_timer:hour_second(), %% 需要增加的产出时间
%%				Produces = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour),
%%				NewTaxMap =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, TaxMap, Produces),
%%				lib_map_api:update_city_by_city(City#world_city{
%%					tax_revenue_map = NewTaxMap,
%%					tax_revenue_produce_tick = CurHourTick
%%				});
%%			true ->
%%				PrevResetTick = lib_timer:prev_hour_unixtime(EndHour, CurTick),
%%				ProduceHour = max((PrevResetTick - ProduceTick) div lib_timer:hour_second(), 0), %% 现有产出加上这个时间的产出, 入库后重置
%%				Produces = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour),
%%
%%				case CountryId > 0 of
%%					false -> skip;
%%					true ->
%%						lists:foldl(fun([Id, Amount], Map) ->
%%							OldAmount = maps:get(Id, Map, 0),
%%							lib_country_warehouse_api:add_country_year_income(CountryId, Id, Amount + OldAmount)
%%						end, TaxMap, Produces)
%%				end,
%%
%%				ProduceHour2 = (CurHourTick - max(PrevResetTick, ProduceTick)) div lib_timer:hour_second(), %% 重置后的产出时间
%%				Produces2 = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour2),
%%				NewTaxMap =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, maps:new(), Produces2),
%%
%%				NewResetTick = lib_timer:current_zero_unixtime(PrevResetTick),
%%				lib_map_api:update_city_by_city(City#world_city{
%%					tax_revenue_map = NewTaxMap,
%%					send_tax_revenue_map = NewTaxMap,
%%					tax_revenue_reset_tick = NewResetTick,
%%					tax_revenue_send_tick = NewResetTick,
%%					tax_revenue_produce_tick = CurHourTick
%%				})
%%		end
%% 	end, CityMap)
%%.

%%calc_tax_revenue() ->
%%	CurTick = lib_timer:unixtime(),
%%	CurZeroTick = lib_timer:current_zero_unixtime(CurTick),
%%	CurHourTick = lib_timer:current_hour_unixtime(CurTick),
%%	CountryId = 0,
%%	CityIdList = lib_map_api:get_city_by_country(CountryId),
%%	[StartHour, EndHour] = lib_country_setting:tax_revenue_time(),
%%
%%	lib_common:map_map(fun(CityId) ->
%%		City = lib_map_api:get_city_by_cityId(CityId),
%%		#world_city{
%%			master_id = MasterId,
%%			send_tax_revenue_map = SendTaxMap
%%		} = City,
%%		ProduceTick = City#world_cit        y.tax_revenue_produce_tick,
%%		SendTick = City#world_city.tax_revenue_send_tick,
%%
%%		HourProduce = lib_map_api:city_hour_tax_revenue(CityId),
%%
%%		case CurTick >= SendTick + lib_timer:day_second() + StartHour * lib_timer:hour_second() of
%%			false -> %%时间没有跨越一次发送
%%				ProduceHour = (CurHourTick - ProduceTick) div lib_timer:hour_second(), %% 需要增加的产出时间
%%				Produces = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour),
%%				NewSendTaxMap =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, SendTaxMap, Produces),
%%				lib_map_api:update_city_by_city(City#world_city{
%%					send_tax_revenue_map = NewSendTaxMap
%%				});
%%			true ->
%%				PrevSendTick = lib_timer:prev_hour_unixtime(StartHour, CurTick),
%%				DiffDay = (lib_timer:current_zero_unixtime(PrevSendTick) - SendTick) div lib_timer:day_second(),
%%				DiffHour = max((DiffDay - 1) * (EndHour - StartHour), 0), %% StartHour => EndHour 这段时间不累计
%%				ProduceHour = max((PrevSendTick - ProduceTick) div lib_timer:hour_second() - DiffHour, 0), %% 现有产出加上这个时间的产出, 发送后重置
%%
%%				Produces = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour),
%%				NewSendTaxMap =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, SendTaxMap, Produces),
%%
%%				NewSendTaxMap2 =
%%				case MasterId > 0 of
%%					false -> NewSendTaxMap;
%%					true ->
%%						A = maps:get(0, NewSendTaxMap, 0) * 0.1,
%%						B = maps:get(0, NewSendTaxMap, 0) * 0.1,
%%						C = maps:get(0, NewSendTaxMap, 0) * 0.1,
%%						ItemObjList = [?ITEM_OBJ(0, A), ?ITEM_OBJ(0, B), ?ITEM_OBJ(0, C)],
%%
%%						CityName = "",
%%						Mail1 = lib_mail_api:create_sys_mail(0),
%%						Mail2 = lib_mail_api:set_title_content(Mail1, ?TAX_REVENUE_MAIL, [CityName, A, B, C]),
%%						Mail3 = lib_mail_api:add_item_list(Mail2, lib_item_api:item_obj_list_to_pack_item_list(ItemObjList)),
%%						lib_mail_api:send(Mail3, MasterId),
%%
%%						maps:new()
%%				end,
%%
%%				ProduceHour2 = max((
%%					min(CurHourTick, CurZeroTick + StartHour * lib_timer:hour_second()) -
%%					max(PrevSendTick + (EndHour - StartHour) * lib_timer:hour_second(), ProduceTick)
%%				) div lib_timer:hour_second(), 0), %% 发送后的产出时间
%%				Produces2 = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour2),
%%
%%				NewSendTaxMap3 =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, NewSendTaxMap2, Produces2),
%%				lib_map_api:update_city_by_city(City#world_city{
%%					send_tax_revenue_map = NewSendTaxMap3,
%%					tax_revenue_send_tick = PrevSendTick
%%				})
%%		end
%%  	end, CityIdList),
%%
%%	lib_common:map_map(fun(CityId) ->
%%		City = lib_map_api:get_city_by_cityId(CityId),
%%		#world_city{
%%			tax_revenue_map = TaxMap,
%%			send_tax_revenue_map = SendTaxMap
%%		} = City,
%%		ResetTick = City#world_city.tax_revenue_reset_tick,
%%		ProduceTick = City#world_city.tax_revenue_produce_tick,
%%
%%		HourProduce = lib_map_api:city_hour_tax_revenue(CityId),
%%
%%		case CurTick >= ResetTick + lib_timer:day_second() + EndHour * lib_timer:hour_second() of
%%			false -> %%时间没有跨越一次重置
%%				ProduceHour = (CurHourTick - ProduceTick) div lib_timer:hour_second(), %% 需要增加的产出时间
%%				Produces = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour),
%%				NewTaxMap =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, TaxMap, Produces),
%%				lib_map_api:update_city_by_city(City#world_city{
%%					tax_revenue_map = NewTaxMap,
%%					tax_revenue_produce_tick = CurHourTick
%%				});
%%			true ->
%%				PrevResetTick = lib_timer:prev_hour_unixtime(EndHour, CurTick),
%%				ProduceHour = max((PrevResetTick - ProduceTick) div lib_timer:hour_second(), 0), %% 现有产出加上这个时间的产出, 入库后重置
%%				Produces = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour),
%%
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					lib_country_warehouse_api:add_country_warehouse_year(CountryId, Id, Amount + OldAmount)
%%				end, TaxMap, Produces),
%%
%%				ProduceHour2 = (CurHourTick - max(PrevResetTick, ProduceTick)) div lib_timer:hour_second(), %% 重置后的产出时间
%%				Produces2 = lib_item_api:multi_conf_item_list(HourProduce, ProduceHour2),
%%				NewTaxMap =
%%				lists:foldl(fun([Id, Amount], Map) ->
%%					OldAmount = maps:get(Id, Map, 0),
%%					maps:put(Id, OldAmount + Amount, Map)
%%				end, TaxMap, Produces2),
%%
%%				lib_map_api:update_city_by_city(City#world_city{
%%					tax_revenue_map = NewTaxMap,
%%					tax_revenue_reset_tick = PrevResetTick,
%%					tax_revenue_produce_tick = CurHourTick
%%				})
%%		end
%%	end, CityIdList)
%%.

test_get_king(PlayerId) ->
	Country = lib_country_api:player_country_id(PlayerId),
%%	KingId = lib_country_api:country_king_id(Country),
%%
%%	case KingId of
%%		0 ->
			lib_country_api:appoint_pos(Country, ?COUNTRY_POS_KING, PlayerId)
%%	end
.