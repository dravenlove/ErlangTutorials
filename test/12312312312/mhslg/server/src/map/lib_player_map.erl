%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 03. 12月 2020 23:10
%%%-------------------------------------------------------------------
-module(lib_player_map).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("player.hrl").
-include("troops.hrl").
-include("ProtoClient_10114.hrl").

%% API
-export([	%% ets，通用
	city/0,				%% 所有城池
	city/1,				%% 单个城池
	country_city/1,		%% 所属势力城池列表
	city_occupy_tick/1,	%% 城池上次被占领时间
	city_fight/1,		%% 城池战斗状态
	city_country/1

]).
-export([
	request_all_map/0,
	request_genesis_church/0,
	notice_genesis_church/2,
	notice_city/0,
	notice_troops/0,
	notice_troops_vanish/0,
	request_city_detail/1,
	request_update_view/1
]).
-export([
	change_player_base/1
]).

city() ->
	lib_map:lookup()
.
city(CityId) ->
	lib_map:lookup(CityId)
.
country_city(Country) ->
	Select = #city{
		country = Country,
		id = '$1',
		_ = '_'
	},
	lib_map:select([{Select, [], ['$1']}])
.
city_occupy_tick(CityId) ->
	(city(CityId))#city.occupy_tick
.
city_fight(CityId) ->
	(city(CityId))#city.fighting
.
city_country(CityId) ->
	(city(CityId))#city.country
.

city_to_proto(#city{id = Id} = City) ->
	#'ProtoMap'{
		id = Id,
		country = City#city.country,
		master = City#city.master_name,
		icon = City#city.master_icon,
		fighting = City#city.fighting,
		guard = #'ProtoGuard'{
			guard_level = lib_city_defense_api:guard_level(Id),
			guard_num = ?GUARD_NUM(City#city.guard_num),
			defend_num = length([X || X <- City#city.defend_troops, X > 10]),
			supplement = 0,
			dissolve = 0,
			embrasured = 0,
			cannon = 0,
			attack_country = City#city.attack_country,
			attack_num = length(City#city.attack_troops)
		},
		is_open = City#city.master_order#master_order.is_in_open,
		start_tick = City#city.master_order#master_order.start_tick
	}
.

request_all_map() ->
	CityList = city(),
	ProtoCityList = [city_to_proto(X) || X <- CityList],
	Res = #'Proto50114001'{back_map_list = ProtoCityList},
	lib_send:respond_to_client(Res)
.


request_genesis_church() ->
	lib_map_api:async(fun lib_genesis_church:get_genesis_church/0, [], fun genesis_church/1)
.

genesis_church(GenesisChurchDict) ->
	case GenesisChurchDict =:= dict:new() of
		true -> skip;
		false ->
			Res = #'Proto50114010'{
				gensis_church = lib_genesis_church:genesis_church_to_proto(GenesisChurchDict)
			},
			lib_send:respond_to_client(Res)
	end
.

notice_genesis_church(Type, Data) ->
	Res = #'Proto80114010'{
		type = Type,
		genesis_church = lib_genesis_church:genesis_church_to_proto(Data)
	},
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_notify/2, [Res])
.

notice_city() ->
	case gb_sets:to_list(lib_map:get_notice_city()) of
		[] -> skip;
		CityIdList ->
			CityList = lib_map_api:city(CityIdList),
			ProtoList = [city_to_proto(X) || X <- CityList],
			Res = #'Proto80114001'{
				back_map_list = ProtoList
			},
			mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_notify/2, [Res]),
			lib_map:put_notice_city(gb_sets:new())
	end
.

notice_troops() ->
	PlayerIdList = gb_sets:to_list(lib_map:get_notice_troops()),
	[mod_server:async_apply(lib_player:get_process_name(PlayerId), fun lib_troops:player_troops/0) || PlayerId <- PlayerIdList],
	lib_map:put_notice_troops(gb_sets:new())
.

notice_troops_vanish() ->
	maps:map(
		fun(Country, TroopsIdList) ->
			case lists:member(Country, lib_map_api:player_country()) of
				false -> skip;
				true -> [mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_country_player_notify/3, [Country, #'Proto80114006'{troops_id = TroopsId}]) || TroopsId <-TroopsIdList]
			end
		end, lib_map:get_notice_troops_vanish()),
	lib_map:put_notice_troops_vanish(#{})
.

request_city_detail(Msg) ->
	#'Proto10114011'{
		city_id = CityId
	} = Msg,
	lib_map_api:async(fun city_detail/1, [CityId], fun respond_city_detail/1)
.
city_detail(CityId) ->
	City = lib_map_api:city(CityId),
	RevenueMap = City#city.send_tax_revenue_map,
	TroopsList = lib_troops_api:troops(City#city.defend_troops),
	TroopsMaps = lists:foldl(
		fun(Troops, M) ->
			K = Troops#troops.combat_hero#combat_hero.name,
			N = Troops#troops.combat_hero#combat_hero.former#combat_army.cur_troops + Troops#troops.combat_hero#combat_hero.latter#combat_army.cur_troops,
			{N1, N2} = maps:get(K, M, {0, 0}),
			maps:put(K, {N1 + 1, N2 + N}, M)
		end, maps:new(), TroopsList),
	MapsList = maps:to_list(TroopsMaps),
	ProtoTroopsList = [#'ProtoTroopsDetail'{
		name = K,
		num = N1,
		soldier = N2
	} || {K, {N1, N2}} <- MapsList],
	#'Proto50114011'{
		gold = maps:get(?GOLD_ID, RevenueMap, 0),
		silver = maps:get(?MONEY_ID, RevenueMap, 0),
		food = maps:get(?PROVISIONS_ID, RevenueMap, 0),
		troops_list = ProtoTroopsList
	}
.
respond_city_detail(Res) ->
	lib_send:respond_to_client(Res)
.

request_update_view(Msg) ->
	#'Proto10114100'{
		city_id = CityIdList
	} = Msg,
	CityIdSets = sets:from_list(CityIdList),
	lib_map_api:async(fun lib_map:upd_player_view/2, [lib_player:get_pid(lib_player:player_id()), CityIdSets], fun lib_player_troops:respond_map_troops_march/1)
.


change_player_base(PlayerBase) ->
	case PlayerBase#player_base.city_id of
		0 -> skip;
		CityId -> lib_map_api:async(fun lib_map_api:u_city_player/2, [CityId, PlayerBase])
	end
.
