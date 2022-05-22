%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 16. 11月 2020 15:12
%%%-------------------------------------------------------------------
-module(lib_map).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("troops.hrl").
-include("country_war_task.hrl").
-include("ProtoClient_10114.hrl").

%% API
-export([
	put_map/1,				%% 城池数据
	get_map/0,
	init_ets/0,
	load_db/0,
	save_db/0,
	test/2,
	test1/1,
	init_city_building/0,
	process_city_occupy/3		%% 城池被占领时调用
]).
-export([
	insert/1,		%% 地图进程调用
	lookup/0,		%% 全部城池
	lookup/1,		%% 单个城池
	select/1		%% 查询条件
]).

-export([
	put_notice_city/1,			%% 通知城池数据
	get_notice_city/0,
	add_notice_city/1,

	put_notice_troops/1,		%% 通知部队数据
	get_notice_troops/0,
	add_notice_troops/1,

	put_notice_troops_vanish/1,		%% 通知部队销毁数据
	get_notice_troops_vanish/0,
	add_notice_troops_vanish/2,

	put_city_visiting/1,		%% 城池拜访数据
	get_city_visiting/0,

	get_player_view/0,			%% 玩家视野数据
	upd_player_view/2,
	del_player_view/1,
	depart/1,
	recall/3,
	quicken/4,
	arrive/2,

	put_notice_alien_invasion/1,		%% 替玩家存放部队怪物数据
	get_notice_alien_invasion/0,
	add_notice_alien_invasion/2,
	gain_notice_alien_invasion/1,

	add_callback_troops/2,
	del_callback_troops/2,
	gain_callback_troops/1,

	add_notice_country_war/2,
	gain_notice_country_war/1,

	add_notice_country_war_time/2,
	gain_notice_country_war_time/1,

	add_notice_country_war_kill/2,
	gain_notice_country_war_kill/1
]).
-define(MAX, 999999).

put_map(Map) ->
	erlang:put(?ETS_MAP, Map)
.
get_map() ->
	erlang:get(?ETS_MAP)
.

init_ets() ->
	ets:new(?ETS_MAP, [{keypos, #city.id}, named_table, protected, set, {read_concurrency, true}]),
	dict:map(fun(_, V) -> insert(V) end, get_map()),
	?INFO("load ets map success"),
	ets:new(?ETS_TROOPS, [{keypos, #troops.troops_id}, named_table, protected, set, {read_concurrency, true}]),
	dict:map(fun(_, V) -> lib_troops_march:insert(V) end, lib_troops_march:get_troops()),
	?INFO("load ets troops success"),
	ets:new(?ETS_HERO_SKILL_LIKE, ?ETS_OPTIONS_KEYPOS1),
	lib_hero_skill_like:load_hero_skill_like(),
	?INFO("load ets hero_skill_like success")
.
insert(City) ->
	ets:insert(?ETS_MAP, City)
.
lookup() ->
	ets:tab2list(?ETS_MAP)
.
lookup(CityId) ->
	hd(ets:lookup(?ETS_MAP, CityId))
.
select(Info) ->
	ets:select(?ETS_MAP, Info)
.

reset_fight() ->
	New = dict:map(
		fun(_, City) ->
			case City#city.fighting of
				?FIGHTING_NO -> City;
				_Fighting -> %% lib_combat_queue_api:restart_combat_queue(Fighting)
					Dict = lib_troops_march:get_troops(),
					NewDict = lists:foldl(
						fun(TroopsId, D) ->
							case dict:find(TroopsId, D) of
								error -> D;
								{ok, Troops} ->
									dict:store(TroopsId, Troops#troops{state = ?TROOPS_FREE}, D)
							end
						end, Dict, City#city.defend_troops),
					NewDict1 = lists:foldl(
						fun(TroopsId, D) ->
							case dict:find(TroopsId, D) of
								error -> D;
								{ok, Troops} ->
									Country = Troops#troops.combat_hero#combat_hero.country,
									dict:store(TroopsId, Troops#troops{state = ?TROOPS_FREE, city_id = ?COUNTRY_CAPITAL(Country)}, D)
							end
						end, NewDict, City#city.attack_troops),
					lib_troops_march:put_troops(NewDict1),
					City#city{fighting = 0, attack_country = 0, attack_troops = []}
			end
		end, get_map()),
	put_map(New)
.

load_db() ->
	lib_genesis_church:put_genesis_church(dict:new()),	%% 启世教派
	lib_country_war_task:put_country_war_task(#country_war_task{}),	%% 国战任务
	put_notice_city(gb_sets:new()),	%% 通知玩家城池信息
	put_notice_troops(gb_sets:new()),	%% 通知玩家部队更新
	put_notice_troops_vanish(#{}),	%% 部队到达通知消失
	lib_troops_march:put_troops_march([]),	%% 行军数据
	put_player_view(maps:new()),	%% 行军数据
	put_notice_alien_invasion(#{}),	%% 异族入侵
	put_callback_troops(#{}),	%% 部队战斗数据
	put_notice_country_war(#{}),
	put_notice_country_war_time(#{}),
	put_notice_country_war_kill(#{}),

	put_map(db_map:load_all_map()),	%% 城池数据
	init_city_building(),	%% 城池建筑初始化
	lib_troops_march:put_troops(db_troops_march:load_troops()),	%% 部队数据
	lib_country_task:put_country_task(db_country_task:load_country_task()),	%% 国家任务数据

	reset_fight(),
	init_ets(),
	lib_map_api:init_building_prop(),	%% 建筑加成初始化

	Monitor = db_country:load_country_monitor(),
	lib_country:put_country_monitor(Monitor),

	WarehouseGather = db_country_warehouse:load_warehouse_gather(),
	lib_country_warehouse:put_country_warehouse(WarehouseGather),

	CurTick = lib_timer:unixtime(),
	lib_country:process_start(CurTick),
	lib_country:save_monitor(),

	NextHour = lib_timer:next_hour_time(CurTick),
	erlang:send_after(NextHour * 1000, self(), hour_timer),
	put_city_visiting(db_map:load_city_visiting())
.

save_db() ->
	db_troops_march:save_troops(lib_troops_march:get_troops()),
	db_map:save_all_map(lib_map_api:all_city()),
	db_country_task:save_country_task(lib_country_task:get_country_task()),
	lib_country:save_monitor(),
	db_country_warehouse:save_warehouse_gather(lib_country_warehouse:get_country_warehouse()),
	db_map:save_map_time([0, lib_timer:unixtime()]),
	db_map:save_city_visiting(get_city_visiting()),
	lib_hero_skill_like:save_hero_skill_like()
.

init_city_building() ->
	MapDict = get_map(),
	NewMapDict = dict:map(
		fun(CityId, City) ->
			BuildingIdList = lib_city_building_api:building_list(CityId),
			BuildingMap = City#city.building_map,
			NewBuildingMap = lists:foldl(
				fun(BuildingId, Maps) ->
					maps:put(BuildingId, maps:get(BuildingId, BuildingMap, 0), Maps)
				end, maps:new(), BuildingIdList),
			City#city{building_map = NewBuildingMap}
		end, MapDict),
	put_map(NewMapDict)
.

process_city_occupy(CityId, OldCountry, NowCountry) ->
	RunList =
		[
			{fun lib_map_api:deduct_building_count/1, [CityId]},
			{fun city_occupy/2, [CityId, NowCountry]},
			{fun city_be_occupy/2, [CityId, OldCountry]}
		],
	lib_common:try_run(RunList)
.
city_occupy(CityId, NowCountry) ->
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_country_player_fun/4, [NowCountry, fun lib_player_process:process_city_occupy/1, [CityId]])
.
city_be_occupy(CityId, OldCountry) ->
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_country_player_fun/4, [OldCountry, fun lib_player_process:process_city_be_occupy/1, [CityId]])
.

put_notice_city(NoticeCity) ->
	erlang:put(notice_city, NoticeCity)
.
get_notice_city() ->
	erlang:get(notice_city)
.
add_notice_city(Id) ->
	put_notice_city(gb_sets:add(Id, get_notice_city()))
.

put_notice_troops(NoticeTroops) ->
	erlang:put(notice_troops, NoticeTroops)
.
get_notice_troops() ->
	erlang:get(notice_troops)
.
add_notice_troops(Id) when is_integer(Id) -> add_notice_troops([Id]);
add_notice_troops(IdList) ->
	put_notice_troops(lists:foldl(
		fun(Id, GbSets) ->
			gb_sets:add(Id, GbSets)
		end, get_notice_troops(), IdList))
.

put_notice_troops_vanish(NoticeTroopsVanish) ->
	erlang:put(notice_troops_vanish, NoticeTroopsVanish)
.
get_notice_troops_vanish() ->
	erlang:get(notice_troops_vanish)
.
add_notice_troops_vanish(Country, TroopsId) ->
	NVMaps = get_notice_troops_vanish(),
	put_notice_troops_vanish(maps:put(Country, [TroopsId | maps:get(Country, NVMaps, [])], NVMaps))
.

put_player_view(PlayerView) ->
	erlang:put(player_view, PlayerView)
.
get_player_view() ->
	erlang:get(player_view)
.
upd_player_view(PId, CityIdSets) ->
	Maps = get_player_view(),
	put_player_view(maps:put(PId, CityIdSets, Maps)),
	lib_troops_march:troops_march_go_of_country(CityIdSets)
.
del_player_view(PId) ->
	Maps = get_player_view(),
	put_player_view(maps:remove(PId, Maps))
.
depart(TroopsList) ->
	Maps = get_player_view(),
	ProtoList = [lib_troops:troops_march_to_proto(X) || X <- TroopsList],
	maps:map(
		fun(PId, CityIdSets) ->
			Proto = [X || X <- ProtoList, sets:is_element(hd(X#'ProtoTroopsNotice'.city_list), CityIdSets)],
			case Proto of
				[] -> skip;
				_ -> lib_send:respond_to_client_by_pid(PId, #'Proto80114007'{troops_notice = Proto})
			end
		end, Maps)
.
recall(CityId, TroopsId, MarchTime) ->
	Res = #'Proto80114005'{
		troops_id = TroopsId,
		remaining_time = MarchTime
	},
	notice(CityId, Res)
.
quicken(CityId, TroopsId, RemainingTime, Rate) ->
	Res = #'Proto80114004'{
		troops_id = TroopsId,
		remaining_time = RemainingTime,
		rate = trunc(Rate * 100)
	},
	notice(CityId, Res)
.
arrive(CityId, TroopsId) ->
	Res = #'Proto80114006'{
		troops_id = TroopsId
	},
	notice(CityId, Res),
	lib_season_activity_api:arrive_notify(TroopsId)
.
notice(CityId, Res) ->
	Maps = get_player_view(),
	List = maps:to_list(Maps),
	[lib_send:respond_to_client_by_pid(PId, Res) || {PId, CityIdSets} <- List, sets:is_element(CityId, CityIdSets)]
.


put_notice_alien_invasion(NoticeAlienInvasion) ->
	erlang:put(notice_alien_invasion, NoticeAlienInvasion)
.
get_notice_alien_invasion() ->
	erlang:get(notice_alien_invasion)
.
add_notice_alien_invasion(PlayerId, CallBackData) ->
	NAIMaps = get_notice_alien_invasion(),
	put_notice_alien_invasion(maps:put(PlayerId, [CallBackData | maps:get(PlayerId, NAIMaps, [])], NAIMaps))
.
gain_notice_alien_invasion(PlayerId) ->
	NAIMaps = get_notice_alien_invasion(),
	put_notice_alien_invasion(maps:remove(PlayerId, NAIMaps)),
	maps:get(PlayerId, NAIMaps, [])
.

put_callback_troops(NoticeAlienInvasion) ->
	erlang:put(callback_troops, NoticeAlienInvasion)
.
get_callback_troops() ->
	erlang:get(callback_troops)
.
add_callback_troops(CombatId, TroopsIdList) ->
	CTMaps = get_callback_troops(),
	put_callback_troops(maps:put(CombatId, TroopsIdList, CTMaps))
.
del_callback_troops(CombatId, TroopsId) ->
	CTMaps = get_callback_troops(),
	TroopsIdList = maps:get(CombatId, CTMaps, []),
	NewTroopsIdList = lists:delete(TroopsId, TroopsIdList),
	put_callback_troops(maps:put(CombatId, NewTroopsIdList, CTMaps))
.
gain_callback_troops(CombatId) ->
	CTMaps = get_callback_troops(),
	put_callback_troops(maps:remove(CombatId, CTMaps)),
	maps:get(CombatId, CTMaps, [])
.

put_notice_country_war(N) ->
	erlang:put(notice_country_war, N)
.
get_notice_country_war() ->
	erlang:get(notice_country_war)
.
add_notice_country_war(CombatId, PlayerId) ->
	N = get_notice_country_war(),
	put_notice_country_war(maps:put(CombatId, sets:add_element(PlayerId, maps:get(CombatId, N, sets:new())), N))
.
gain_notice_country_war(CombatId) ->
	N = get_notice_country_war(),
	put_notice_country_war(maps:remove(CombatId, N)),
	PlayerSets = maps:get(CombatId, N),
	sets:fold(fun(PlayerId, _) -> add_notice_country_war_time(PlayerId, 1) end, ok, PlayerSets)
.

put_notice_country_war_time(N) ->
	erlang:put(notice_country_war_time, N)
.
get_notice_country_war_time() ->
	erlang:get(notice_country_war_time)
.
add_notice_country_war_time(PlayerId, Time) ->
	case lib_player:get_pid(PlayerId) of
		undefined ->
			NAIMaps = get_notice_country_war_time(),
			put_notice_country_war_time(maps:put(PlayerId, Time + maps:get(PlayerId, NAIMaps, 0), NAIMaps));
		Pid -> mod_server:async_apply(Pid, fun lib_player_process:process_country_time/1, [Time])
	end
.
gain_notice_country_war_time(PlayerId) ->
	NAIMaps = get_notice_country_war_time(),
	put_notice_country_war_time(maps:remove(PlayerId, NAIMaps)),
	maps:get(PlayerId, NAIMaps, 0)
.

put_notice_country_war_kill(N) ->
	erlang:put(notice_country_war_kill, N)
.
get_notice_country_war_kill() ->
	erlang:get(notice_country_war_kill)
.
add_notice_country_war_kill(PlayerId, Kill) ->
	case lib_player:get_pid(PlayerId) of
		undefined ->
			NAIMaps = get_notice_country_war_kill(),
			put_notice_country_war_time(maps:put(PlayerId, Kill + maps:get(PlayerId, NAIMaps, 0), NAIMaps));
		Pid -> mod_server:async_apply(Pid, fun lib_player_process:process_country_kill/1, [Kill])
	end
.
gain_notice_country_war_kill(PlayerId) ->
	NAIMaps = get_notice_country_war_kill(),
	put_notice_country_war_kill(maps:remove(PlayerId, NAIMaps)),
	maps:get(PlayerId, NAIMaps, 0)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test(Start, End) ->
	lib_map_api:async(fun city_map/0, []),
	P = [lib_player:player_country(), Start, End],
	lib_map_api:async(fun dijkstra/3, P),
	lib_map_api:async(fun floyd/3, P)
.
city_map() ->
	CityMap = lists:foldl(
		fun(K, M) ->
			Time = maps:get(time, tb_world_city_road:get(K)),
			{City1, City2} = lib_country_war_task:city(K),
			M1 = maps:get(City1, M, #{}),
			M2 = maps:put(City2, Time, M1),
			maps:put(City1, M2, M)
		end, #{}, tb_world_city_road:get_list()),
	put_city_map1(CityMap),
	AllCity = get_map(),
	put_city_map(maps:fold(
		fun(City, Map, M) ->
			#city{country = Country} = dict:fetch(City, AllCity),
			case maps:find(Country, M) of
				error -> M;
				{_, M1} -> maps:update(Country, maps:put(City, Map, M1), M)
			end
		end, lib_map_api:init_country(#{}), CityMap))
.

test1(Id) ->
	lib_combat_queue_api:join_watching(Id, lib_player:get_player_base())
.

put_city_map(NoticeTroopsVanish) ->
	erlang:put(city_map, NoticeTroopsVanish)
.
get_city_map() ->
	erlang:get(city_map)
.
put_city_map1(NoticeTroopsVanish) ->
	erlang:put(city_map1, NoticeTroopsVanish)
.
get_city_map1() ->
	erlang:get(city_map1)
.
put_city_map2(NoticeTroopsVanish) ->
	erlang:put(city_map2, NoticeTroopsVanish)
.
get_city_map2() ->
	erlang:get(city_map2)
.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

floyd(Country, Start, End) ->
	CityMap = maps:put(End, maps:get(End, get_city_map1()), maps:get(Country, get_city_map())),
	A = lib_timer:unixtime_ms(),
	CityList = maps:keys(CityMap),
	put_city_map2(maps:map(fun(X, Y) -> maps:map(fun(_, _) -> X end, Y) end, CityMap)),
	Matrix = lists:foldl(
		fun(X, M) -> lists:foldl(
			fun(Y, M1) -> lists:foldl(
				fun(Z, M2) ->
					N = get1(Y, X, M2) + get1(X, Z, M2),
					case get1(Y, Z, M2) > N of
						false -> M2;
						true ->
							N2 = get_city_map2(),
							put_city_map2(put1(Y, Z, N2, get1(X, Z, N2))),
							put1(Y, Z, M2, N)
					end
				end, M1, CityList)
			end, M, CityList)
		end, CityMap, CityList),
	Time = get1(Start, End, Matrix),
	Road = road(Start, End, get_city_map2(), [End]),
	?DEBUG("floyd time : ~p", [lib_timer:unixtime_ms() - A]),
	?DEBUG("~p|~p", [Time, Road])
.
road(Start, Start, _, L) -> L;
road(Start, End, Matrix, L) ->
	X = get1(Start, End, Matrix),
	road(Start, X, Matrix, [X | L])
.
get1(I, J, Matrix) -> maps:get(J, maps:get(I, Matrix), ?MAX).
put1(I, J, Matrix, V) -> maps:put(I, maps:put(J, V, maps:get(I, Matrix)), Matrix).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dijkstra(Country, Start, End) ->
	CityMap = maps:put(End, maps:get(End, get_city_map1()), maps:get(Country, get_city_map())),
	A = lib_timer:unixtime_ms(),
	CityList = maps:keys(CityMap),
	Map = maps:fold(
		fun(K, V, M) ->
			maps:put(K, {false, V, Start}, M)
		end, #{Start => {true, 0, 0}}, maps:get(Start, CityMap)),
	Matrix = lists:foldl(
		fun(_, M) ->
			{Y, Small} = lists:foldl(
				fun(J, {X, Min}) ->
					{Flag, V, _} = maps:get(J, M, {false, ?MAX, null}),
					case Flag =/= true andalso V < Min of
						true -> {J, V};
						false -> {X, Min}
					end
				end, {0, ?MAX}, CityList),
			case Y =:= 0 of
				true -> M;
				false ->
					{_, _, B} = maps:get(Y, M),
					M1 = maps:put(Y, {true, Small, B}, M),
					lists:foldl(
						fun(J, M2) ->
							{Flag, V, _} = maps:get(J, M2, {false, ?MAX, null}),
							Va = get1(Y, J, CityMap),
							Tmp = Va + Small,
							case Flag =/= true andalso Tmp < V of
								true -> maps:put(J, {Flag, Tmp, Y}, M2);
								false -> M2
							end
						end, M1, CityList)
			end
		end, Map, CityList),
	{_, Time, Last} = maps:get(End, Matrix),
	Road = road(Last, Matrix, [End]),
	?DEBUG("floyd time : ~p", [lib_timer:unixtime_ms() - A]),
	?DEBUG("~p|~p", [Time, Road])
.
road(0, _, L) -> L;
road(End, Matrix, L) ->
	{_, _, X} = maps:get(End, Matrix),
	road(X, Matrix, [End | L])
.

put_city_visiting(Map) ->
	erlang:put(city_visiting, Map)
.
get_city_visiting() ->
	erlang:get(city_visiting)
.
