%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%	地图系统功能API
%%% @end
%%% Created : 11. 12月 2020 17:04
%%%-------------------------------------------------------------------
-module(lib_map_api).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("player.hrl").
-include("ProtoClient_10114.hrl").

%% API
-export([			%% 通用
	is_cityId/1,					%% 城池id是否存在
	type/1,							%% 根据城池id获取类型
	name/1,							%% 城池名称
	all_country/0,					%% 全部势力
	player_country/0,				%% 玩家势力
	init_country/1,					%% 初始化势力容器
	tear/2
]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([			%% 其他进程调用，如玩家进程
	async/2,				%% 异步获取地图进程数据，不回调
	async/3,				%% 异步获取地图进程数据，回调
	sync/2					%% 同步获取地图进程数据
]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([			%% 地图进程调用
	all_city/0,							%% 获取全部城池信息
	city_id_list/0,						%% 全部城池id
	city/1,								%% 根据城池id获取城池信息

	country/1,							%% 所属势力
	fighting/1,							%% 战斗状态
	antiwar/1,							%% 是否免战
	master_id/1,						%% 城主id
	country_type_city/2,				%% 根据类型和势力获取城池idList
	country_city/1,						%% 根据势力获取城池idList
	no_fight_country_city/1,			%% 根据势力获取未战斗的城池idList

	country_city_maps/0,

	u_city_player/2,					%% 更新城池玩家城主
	u_city_country/2,					%% 更新城池所属势力
	u_city_attack/5,					%% 国战开战更新
	u_city/1							%% 更新城池信息
]).
-export([
	master_order_info/1,						%% 城主令信息
	update_master_order/2,						%% 更新城主令信息
	master_order_is_open/1,						%% 城主令是否在开启中
	city_hour_tax_revenue/1						%% 获取城池每小时税收产出
]).
-export([
	capital_building_prop/2,	%% 获取首都建设加成
	building_prop/2,			%% 获取建设加成
	building_prop/3,			%% 按国家获取建筑加成
	init_building_prop/0,

	building_map/1,			%% 获取城池的建设度dict
	building_map/2,			%% 玩家获取时传入势力，不能获取其他势力建设度
	u_building_map/2,		%% 更新城池建设度
	building_level/2,			%% 获取建筑等级
	building_count/2,			%% 获取建筑建设度
	add_building_count/3,		%% 累计建筑建设度
	deduct_building_count/1		%% 城池被占领扣除百分比建设度
]).
-export([		%% 部队信息
	troops_num/1,
	a_defend_troops/2,
	d_defend_troops/2,
	a_attack_troops/2,
	d_attack_troops/2,
	d_guard_num/2
]).

-define(PID, mod_map:get_pid()).

is_cityId(CityId) ->
	is_map(tb_world_city:get(CityId))
.
type(CityId) ->
	maps:get(citytype, tb_world_city:get(CityId))
.
name(CityId) ->
	maps:get(name, tb_world_city:get(CityId))
.
all_country() ->
	tb_country:get_list()
.
player_country() ->
	tb_role_country:get_list()
.
init_country(Default) ->
	lists:foldl(
		fun(Country, M) ->
			maps:put(Country, Default, M)
		end, #{}, player_country())
.

%%参数说明[调用方法名，参数，回调方法名]
%%例：获取根据id获取城池信息async(fun get_city_by_cityId/2, [CityId], fun back/1)
async(Fun, Arg) when is_function(Fun) ->
	mod_server:async_apply(?PID, fun async_choose_fun/2, [Fun, Arg])
.
async(Fun, Arg, BackFun) when is_function(Fun), is_function(BackFun) ->
	mod_server:async_apply(?PID, fun async_choose_fun/4, [self(), Fun, Arg, BackFun])
.
async_choose_fun(Fun, Arg) ->
	erlang:apply(Fun, Arg)
.
async_choose_fun(Dest, Fun, Arg, BackFun) ->
	mod_server:async_apply(Dest, BackFun, [async_choose_fun(Fun, Arg)])
.

sync(Fun, Arg) when is_function(Fun) ->
	mod_server:sync_apply(?PID, fun sync_choose_fun/2, [Fun, Arg])
.
sync_choose_fun(Fun, Arg) ->
	erlang:apply(Fun, Arg)
.

all_city() ->
	lib_map:get_map()
.
city_id_list() ->
	dict:fetch_keys(all_city())
.
city(CityId) when is_integer(CityId) ->
	dict:fetch(CityId, all_city());
city(CityIdList) ->
	AllCity = all_city(),
	[dict:fetch(X, AllCity) || X <- CityIdList]
.

country(CityId) ->
	(city(CityId))#city.country
.
fighting(CityId) ->
	(city(CityId))#city.fighting
.
antiwar(CityId) ->
	(city(CityId))#city.antiwar
.
master_id(CityId) ->
	(city(CityId))#city.master_id
.
country_type_city(Type, Country) ->
	dict:fold(
		fun(CityId, City, List) ->
			case City#city.country =:= Country andalso Type =:= type(CityId) of
				true -> [CityId | List];
				false -> List
			end
		end, [], all_city())
.
country_city(Country) ->
	dict:fold(
		fun(CityId, City, List) ->
			case City#city.country of
				Country -> [CityId | List];
				_ -> List
			end
		end, [], all_city())
.

no_fight_country_city(Country) ->
	lib_common:dict_fold(
		fun(CityId, City, List) ->
			?JUDGE_CONTINUE(City#city.fighting =:= ?FIGHTING_NO),
			case City#city.country of
				Country -> [CityId | List];
				_ -> List
			end
		end, [], all_city())
.

country_city_maps() ->
	dict:fold(
		fun(_, #city{id = CityId, country = Country}, M) ->
			case maps:is_key(Country, M) of
				false -> M;
				true -> maps:update(Country, [CityId | maps:get(Country, M)], M)
			end
		end, lib_map_api:init_country([]), all_city())
.

u_city_player(CityId, Player) when is_record(Player, player_base) ->
	City = city(CityId),
	NewCity = City#city{
		master_id = Player#player_base.id,
		master_name = Player#player_base.name,
		master_icon = Player#player_base.head_icon
	},
	u_city(NewCity)
.
u_city_country(CityId, Country) ->
	City = city(CityId),
	NewCity = City#city{
		country = Country
	},
	u_city(NewCity)
.
u_city_attack(CityId, CombatId, DefendTroops, AttackCountry, AttackTroops) ->
	City = city(CityId),
	NewCity = City#city{
		fighting = CombatId,
		defend_troops = DefendTroops,
		attack_country = AttackCountry,
		attack_troops = AttackTroops
	},
	u_city(NewCity)
.

u_city(City) ->
	AllCity = all_city(),
	CityId = City#city.id,
	NewAllCity = dict:store(CityId, City, AllCity),
	lib_map:add_notice_city(CityId),
	lib_map:put_map(NewAllCity),
	lib_map:insert(City)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

master_order_info(CityId) ->
	City = city(CityId),
	City#city.master_order
.

update_master_order(CityId, Order) when is_record(Order, master_order) ->
	City = city(CityId),
	u_city(City#city{master_order = Order})
.

master_order_is_open(CityId) ->
	Order = master_order_info(CityId),
	Order#master_order.is_in_open
.

city_hour_tax_revenue(CityId) ->
	case tb_world_city:get(CityId) of
		false -> [];
		Conf -> maps:get(tax_revenue, Conf, [])
	end
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

capital_building_prop(Type, Country) ->
	building_prop(Type, Country, ?COUNTRY_CAPITAL(Country))
.
building_prop(Type, CityId) ->
	City = city(CityId),
	BuildingProp = City#city.building_prop,
	maps:get(Type, BuildingProp, 0)
.
building_prop(Type, Country, CityId) ->
	City = city(CityId),
	case City#city.country of
		Country ->
			BuildingProp = City#city.building_prop,
			maps:get(Type, BuildingProp, 0);
		_ -> 0
	end
.

init_building_prop() ->
	dict:map(fun(CityId, _City) -> calc_building_prop(CityId) end, all_city())
.
calc_building_prop(CityId) ->
	City = city(CityId),
	BuildingMap = City#city.building_map,
	BuildingProp = maps:fold(
		fun(BuildingId, Count, Map) ->
			Level = lib_city_building_api:level(BuildingId, Count),
			case tb_building_addition:get(BuildingId * 100 + Level) of
				false -> Map;
				Conf -> util:maps_merge(maps:get(effect, Conf), Map)
			end
		end, maps:new(), BuildingMap),
	u_city(City#city{building_prop = BuildingProp})
.

building_map(CityId) ->
	City = city(CityId),
	City#city.building_map
.
building_map(CityId, Country) ->
	#city{
		country = WCountry,
		building_map = BuildingMap
	} = city(CityId),
	case Country =:= WCountry of true -> BuildingMap; false -> maps:new() end
.
u_building_map(CityId, BuildingMap) ->
	City = city(CityId),
	NewCity = City#city{
		building_map = BuildingMap
	},
	u_city(NewCity)
.
building_level(BuildingId, CityId) ->
	case building_count(BuildingId, CityId) of
		false -> 0;
		Count -> lib_city_building_api:level(BuildingId, Count)
	end
.
building_count(BuildingId, CityId) ->
	maps:get(BuildingId, building_map(CityId), false)
.
add_building_count(BuildingId, CityId, Count) ->
	BuildingMap = building_map(CityId),
	OldCount = maps:get(BuildingId, BuildingMap),
	NewCount = OldCount + Count,
	LimitCount = lists:last(maps:get(level, tb_building_kind:get(BuildingId))),
	LastCount = case NewCount > LimitCount of true -> LimitCount;false -> NewCount end,
	u_building_map(CityId, maps:update(BuildingId, LastCount, BuildingMap)),
	case lib_city_building_api:level(BuildingId, OldCount) =:= lib_city_building_api:level(BuildingId, LastCount) of
		true -> skip;
		false -> calc_building_prop(CityId)
	end
.
deduct_building_count(CityId) ->
	#city{
		deduct_protect_tick = DeductProtectTick,
		building_map = BuildingMap
	} = City = city(CityId),
	NowTick = lib_timer:unixtime(),
	case DeductProtectTick < NowTick of
		false -> skip;
		true ->
			#{value := Time} = tb_const:get(deduct_protect_tick),
			NewDeductProtectTick = NowTick + Time,
			NewBuildingMap = maps:map(
				fun(BuildingId, Count) ->
					#{deduct := Deduct} = tb_building_kind:get(BuildingId),
					trunc(Count * (100 - Deduct) / 100)
				end, BuildingMap),
			u_city(City#city{deduct_protect_tick = NewDeductProtectTick, building_map = NewBuildingMap}),
			calc_building_prop(CityId)
	end
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

troops_num(CityId) ->
	#city{fighting = Fighting, guard_num = G, defend_troops = D} = city(CityId),
	case Fighting of
		?FIGHTING_NO -> ?GUARD_NUM(G);
		_ -> 0
	end + length(D)
.
tear(I, L) ->
	tear(I, L, [], 0)
.
tear(I, [], L, _) -> lists:reverse([I | L]);
tear(I, [D | L], T, N) when N < 5; D > 10 ->
	tear(I, L, [D | T], N + 1);
tear(I, L, T, _) ->
	lists:reverse(T) ++ [I | L]
.
a_defend_troops(TroopsId, CityId) ->
	City = city(CityId),
	DeFendTroops = City#city.defend_troops,
	NewDeFendTroops =
		case City#city.fighting of
			?FIGHTING_NO -> [TroopsId | DeFendTroops];
			_ -> tear(TroopsId, DeFendTroops)
		end,
	u_city(City#city{defend_troops = NewDeFendTroops})
.
d_defend_troops(TroopsId, CityId) ->
	City = city(CityId),
	u_city(City#city{defend_troops = lists:delete(TroopsId, City#city.defend_troops)})
.
a_attack_troops(TroopsId, CityId) ->
	City = city(CityId),
	u_city(City#city{attack_troops = City#city.attack_troops ++ [TroopsId]})
.
d_attack_troops(TroopsId, CityId) ->
	City = city(CityId),
	u_city(City#city{attack_troops = lists:delete(TroopsId, City#city.attack_troops)})
.

d_guard_num(CityId, Type) ->
	#city{guard_num = GuardNum} = WorldCity = city(CityId),
	u_city(WorldCity#city{guard_num = maps:put(Type, maps:get(Type, GuardNum) - 1, GuardNum)})
.


