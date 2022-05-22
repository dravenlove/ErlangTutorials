%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 29. Dec 2020 8:48 PM
%%%-------------------------------------------------------------------
-module(lib_troops_api).
-author("lichaoyu").
-include("map.hrl").
-include("common.hrl").
-include("fight_prop.hrl").
-include("troops.hrl").

%% API
-export([			%% 通用
	index/2						%% 获取列表元素的位置
]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([			%% 玩家进程调用
	async/2,				%% 异步获取地图进程部队数据，不回调
	async/3,				%% 异步获取地图进程部队数据，回调
	sync/2,					%% 同步获取地图进程部队数据

	is_troops/1,			%% 该英雄是否创建部队
	is_free/1,				%% 部队是否空闲
	is_city/1,				%% 城池是否有玩家部队
	is_cross/1,				%% 是否能跨城战斗
	troops_id/1,			%% 根据英雄id获取部队id
	troops_id_list/0,		%% 获取玩家全部部队idList，部队id = 玩家id * 1000 + 英雄id
	hero_id_list/0,			%% 已创建部队的英雄列表
	troops_limit/0,			%% 获取玩家可创建部队数量，部队槽数
	u_hero_id/1,			%% 创建部队需记录
	d_hero_id/1,			%% 解散部队需记录
	u_hero_id_list/1
]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([			%% 地图进程调用，部队管理
	all_troops/0,			%% 获取全部部队信息
	troops/1,					%% 根据部队id获取部队
	troops/2,					%% 根据部队id判断城池获取部队
	city_troops/2,				%% 获取在该城池且空闲的部队

	combat_hero/1,				%% 部队战斗信息
	country/1,					%% 部队所属势力
	state/1,					%% 部队状态
	city_id/1,					%% 部队当前所在城池id

	%%TODO
	consume/2,					%% 部队消耗
	depart/3,					%% 部队出发
	create/1,					%% 部队创建
	quicken/2,					%% 部队加速
	recall/1,					%% 部队撤回
	dissolve/2,					%% 按照回首都通路解散部队，返还兵力
	repair/2,					%% 部队补兵
	extrude/5,					%% 部队突进
	withdraw/5,					%% 部队撤退
	re_troops/1,				%% 重置部队
	u_combat_hero/1,
	u_troops/1,					%% 更新部队信息

	u_troops_march/0,			%% 部队行军定时刷新

	d_troops/1					%% 按troopsId解散部队
]).
-export([
	to_fighting/5,
	to_fighting/6
]).

-define(PID, mod_map:get_pid()).

road_to_atom(CityId1, CityId2) ->
	list_to_existing_atom("a" ++ integer_to_list(CityId1) ++ "_" ++ integer_to_list(CityId2))
.
consume_time_list(Road, Country, Troops, Add) ->
	tb_world_city_road:get_list(),%%将原子导入，可以放在服务器开始
	road_time(Road, {[], 0}, Country, Troops, Add)
.
road_time([CityId1 | [CityId2 | _] = Road], {TimeList, Provisions}, Country, Troops, {Add1, Add2}) ->
	K = road_to_atom(CityId1, CityId2),
	Time = maps:get(time, tb_world_city_road:get(K)) * (100 - lib_map_api:capital_building_prop(?CITY_EFFECT_7, Country)),
	AddTime = util:ceil(Time / (lib_map_api:building_prop(?CITY_EFFECT_4, CityId1) + Add1 + 100)),
	AddProvisions = util:ceil(calc_provisions(Troops, AddTime) * (100 - Add2 - lib_map_api:building_prop(?CITY_EFFECT_11, CityId1)) / 100) + Provisions,
	road_time(Road, {[AddTime * 1000 | TimeList], AddProvisions}, Country, Troops, {Add1, Add2});
road_time(_, {TimeList, Provisions} , _, _Troops, _) ->
	{lists:reverse(TimeList), Provisions}
.

calc_provisions(Troops, Time) ->
	%% 消耗 = 基础消耗 + 额外消耗 = （兵力 * 行军时间 * 0.000185） + （兵力 * 0.016） = 兵力 * （时间 * 0.000185 + 0.016）
	[Base, Extra] = maps:get(jsonvalue, tb_const:get(troops_march_consume)),
	Troops * (Base * Time + Extra)
.

%%参数说明[调用方法名，参数，回调方法名]
async(Fun, Arg) when is_function(Fun) ->
	mod_server:async_apply(?PID, fun async_choose_fun/4, [self(), Fun, Arg, false])
.
async(Fun, Arg, BackFun) when is_function(Fun), is_function(BackFun) ->
	mod_server:async_apply(?PID, fun async_choose_fun/4, [self(), Fun, Arg, BackFun])
.
async_choose_fun(Dest, Fun, Arg, BackFun) ->
	case BackFun of
		false ->
			erlang:apply(Fun, Arg);
		_ ->
			mod_server:async_apply(Dest, BackFun, [erlang:apply(Fun, Arg)])
	end
.

sync(Fun, Arg) when is_function(Fun) ->
	mod_server:sync_apply(?PID, fun sync_choose_fun/2, [Fun, Arg])
.

sync_choose_fun(Fun, Arg) ->
	erlang:apply(Fun, Arg)
.

player_troops() -> lib_troops:get_troops().

is_troops(HeroId) ->
	lists:member(HeroId, (player_troops())#player_troops.hero_id)
.
is_free(HeroId) ->
	case is_troops(HeroId) of
		true ->
			TroopsId = troops_id(HeroId),
			(lib_troops_march:lookup(TroopsId))#troops.state =:= ?TROOPS_FREE;
		false -> true
	end
.
is_city(CityId) ->
	PlayerId = (player_troops())#player_troops.id,
	DefendTroops = (lib_player_map:city(CityId))#city.defend_troops,
	lists:any(fun(Id) -> Id div 1000 =:= PlayerId end, DefendTroops)
.
is_cross(Type) ->
	case Type of
		?CALL_FIGHT_TYPE_INDUSTRY -> lib_nobility_api:privilege_add(?CROSS_CITY_OCCUPY_INDUSTRY);
		?CALL_FIGHT_TYPE_GOVERNMENT_TASK -> lib_nobility_api:privilege_add(?CROSS_CITY_ATTACK_THIEF);
		?CALL_FIGHT_TYPE_PUPPET -> lib_nobility_api:privilege_add(?CROSS_CITY_HERO_COMBAT);
		_ -> 0
	end =/= 0
.

troops_id(HeroId) when is_integer(HeroId) ->
	(player_troops())#player_troops.id * 1000 + HeroId;
troops_id(HeroIdList) when is_list(HeroIdList) ->
	PlayerId = (player_troops())#player_troops.id,
	[PlayerId * 1000 + HeroId || HeroId <- HeroIdList]
.
troops_id_list() ->
	#player_troops{
		id = PlayerId,
		hero_id = HeroIdList
	} = player_troops(),
	[PlayerId * 1000 + HeroId || HeroId <- HeroIdList]
.
hero_id_list() ->
	(player_troops())#player_troops.hero_id
.
troops_limit() ->
	maps:get(value, tb_const:get(initial_troops_num)) + lib_nobility_api:privilege_add(?FORMATION_INCREASE)
.
u_hero_id(HeroId) ->
	u_hero_id_list([HeroId | hero_id_list()])
.
d_hero_id(HeroId) ->
	u_hero_id_list(lists:delete(HeroId, hero_id_list()))
.
u_hero_id_list(HeroIdList) ->
	NewTroops = (player_troops())#player_troops{hero_id = HeroIdList},
	lib_troops:put_troops(NewTroops)
.

all_troops() ->
	lib_troops_march:get_troops()
.
troops(TroopsId) when is_integer(TroopsId) ->
	dict:fetch(TroopsId, all_troops());
troops(TroopsIdList) when is_list(TroopsIdList) ->
	AllTroops = all_troops(),
	[Y || X <- TroopsIdList, (Y = util:dict_get(X, AllTroops, 0)) =/= 0]
.
troops(TroopsIdList, CityId) ->
	Country = lib_map_api:country(CityId),
	TroopsList = troops(TroopsIdList),
	[X || X <- TroopsList, X#troops.combat_hero#combat_hero.country =:= Country]
.
city_troops(TroopsIdList, CityId) ->
	TroopsList = troops(TroopsIdList),
	[X || X <- TroopsList, X#troops.state =:= ?TROOPS_FREE, X#troops.city_id =:= CityId]
.

combat_hero(TroopsId) ->
	(troops(TroopsId))#troops.combat_hero
.
country(TroopsId) ->
	(combat_hero(TroopsId))#combat_hero.country
.
state(TroopsId) ->
	(troops(TroopsId))#troops.state
.
city_id(TroopsId) ->
	(troops(TroopsId))#troops.city_id
.

create(Troops) ->
	lib_map_api:a_defend_troops(Troops#troops.troops_id, Troops#troops.city_id),
	u_troops(Troops)
.
depart(TroopsList) ->
	lib_troops_march:put_troops_march(lists:foldl(
		fun(#troops{troops_id = TroopsId, city_id = CityId}, L) ->
			lib_map_api:d_defend_troops(TroopsId, CityId),
			[TroopsId | L]
		end, lib_troops_march:get_troops_march(), TroopsList)),
	u_troops(TroopsList)
.

consume(TroopsList, {Add1, Add2}) ->
	try
		Fun =
			fun(Maps) ->
				#troops{
					combat_hero = #combat_hero{
						country = Country,
						prop_dict = PropDict,
						former = #combat_army{cur_troops = Former},
						latter = #combat_army{cur_troops = Latter}
					},
					state = State
				} = troops(maps:get(id, Maps)),
				?JUDGE_RETURN(State =:= ?TROOPS_FREE, ?ERROR_TROOPS_ERROR),
				Add = {util:dict_get(?MARCH_SPEED_MULTI, PropDict, 0) * 100 + Add1, Add2},
				{CityTimes, Foodstuff} = consume_time_list(maps:get(city_lists, Maps), Country, Former + Latter, Add),
				Maps#{foodstuff => Foodstuff, city_times => CityTimes}
			end,
		[Fun(X) || X <- TroopsList]
	catch
		_:Error -> Error
	end
.
depart(TroopsList, ProvisionsNum, {Add1, Add2}) ->
	try
		NowTick = lib_timer:unixtime_ms(),
		{Provisions, TroopsMarchList} = lists:foldl(
			fun(#{id := TroopsId, city_lists := CityLists}, {P, L}) ->
				#troops{
					combat_hero = #combat_hero{
						country = Country,
						prop_dict = PropDict,
						former = #combat_army{cur_troops = Former, troops = TotalFormer},
						latter = #combat_army{cur_troops = Latter, troops = TotalLatter}
					},
					city_id = CityId,
					state = State
				} = Troops = troops(TroopsId),
				CutTroops = Former + Latter,
				?JUDGE_RETURN(State =:= ?TROOPS_FREE, ?ERROR_TROOPS_ERROR),
				?JUDGE_RETURN(CutTroops =/= 0, ?ERROR_TROOPS_ERROR),
				?JUDGE_RETURN(CutTroops >= (TotalFormer + TotalLatter) / 2 orelse lib_map_api:country(lists:last(CityLists)) =:= Country, ?ERROR_TROOPS_ERROR),
				?JUDGE_RETURN(hd(CityLists) =:= CityId, ?ERROR_TROOPS_ERROR),
				Add = {util:dict_get(?MARCH_SPEED_MULTI, PropDict, 0) * 100 + Add1, Add2},
				{CityTimes, Foodstuff} = consume_time_list(CityLists, Country, CutTroops, Add),
				NewTroops = Troops#troops{
					state = ?TROOPS_MOVING,
					march = ?MARCH(CityLists, CityTimes, NowTick)
				},
				{P + Foodstuff, [NewTroops | L]}
			end, {0, []}, TroopsList),
		?JUDGE_RETURN(ProvisionsNum >= Provisions, ?ERROR_ITEM_AMOUNT),
		depart(TroopsMarchList),
		lib_map:depart(TroopsMarchList),
		Provisions
	catch
		_:Error -> Error
	end
.
quicken(TroopsId, Rate) ->
	try
		#troops{
			city_id = CityId,
			state = State,
			march = March
		} = Troops = troops(TroopsId),
		?JUDGE_RETURN(State =:= ?TROOPS_MOVING, ?ERROR_TROOPS_ERROR),
		#{city_times := CityTimes, depart_tick := DepartTick} = March,
		NowTick = lib_timer:unixtime_ms(),
		NewCityTimes = q(NowTick - DepartTick, Rate, CityTimes),
		NewTroops = Troops#troops{march = maps:put(city_times, NewCityTimes, March)},
		AllTime = lists:sum(NewCityTimes),
		u_troops(NewTroops),
		lib_map:quicken(CityId, TroopsId, DepartTick + AllTime - NowTick, Rate),
		?SUCCESS
	catch
		_:Error -> Error
	end
.
q(Time, Rate, CityTimes) ->
	q(Time, Rate, CityTimes, [])
.
q(0, R, [T | Ts], L) ->
	q(0, R, Ts, [trunc(R * T) | L]);
q(N, R, [T | Ts], L) when N > T ->
	q(N - T, R, Ts, [T | L]);
q(N, R, [T | Ts], L) ->
	q(0, R, Ts, [trunc(R * (T - N)) + N | L]);
q(_, _, [], L) ->
	lists:reverse(L)
.
recall(TroopsId) ->
	try
		#troops{
			state = State,
			city_id = CityId,
			march = March
		} = Troops = troops(TroopsId),
		?JUDGE_RETURN(State =:= ?TROOPS_MOVING, ?ERROR_TROOPS_ERROR),
		#{
			city_lists := [FirstId, SecondId | _],
			depart_tick := DepartTick
		} = March,
		NowTick = lib_timer:unixtime_ms(),
		MarchTime = NowTick - DepartTick,
		?JUDGE_RETURN(MarchTime =< ?RECALL_TIME, ?ERROR_TROOPS_TIMEOUT),
		?JUDGE_RETURN(FirstId =:= CityId, ?ERROR_TROOPS_CITYOUT),
		?JUDGE_RETURN(not maps:is_key(is, March), ?ERROR_TROOPS_ERROR),
		NewTroops = Troops#troops{
			city_id = SecondId,
			march = maps:put(is, 0, ?MARCH([SecondId, FirstId], [MarchTime], NowTick))
		},
		u_troops(NewTroops),
		lib_map:recall(CityId, TroopsId, MarchTime),
		?SUCCESS
	catch
		_:Error -> Error
	end
.
dissolve(TroopsId, RoadList) ->
	try
		#troops{
			combat_hero = #combat_hero{country = Country, former = Former, latter = Latter},
			city_id = CityId,
			state = State
		} = troops(TroopsId),
		?JUDGE_RETURN(State =:= ?TROOPS_FREE, ?ERROR_TROOPS_ERROR),
		?JUDGE_RETURN(lib_map_api:building_level(11, CityId) > 4, ?ERROR_TROOPS_BUILDING_LEVEL),
		[?JUDGE_BREAK(lib_map_api:country(X) =:= Country) || X <- RoadList],
		?JUDGE_BREAK(lists:last(RoadList) =:= ?COUNTRY_CAPITAL(Country)),
		lib_map_api:d_defend_troops(TroopsId, CityId),
		d_troops(TroopsId),
		{Former#combat_army.cur_troops, Latter#combat_army.cur_troops}
	catch
		_:Error -> Error
	end
.
repair(TroopsId, Param) when is_integer(TroopsId) ->
	try
		#troops{
			state = State,
			combat_hero = CombatHero = #combat_hero{
				former = Former = #combat_army{cur_troops = NowQianJun, troops = TotalQianJun},
				latter = Latter = #combat_army{cur_troops = NowHouJun, troops = TotalHouJun}
			},
			city_id = CityId
		} = Troops = troops(TroopsId),
		?JUDGE_RETURN(State =:= ?TROOPS_FREE, ?ERROR_TROOPS_ERROR),
		?JUDGE_RETURN(lib_map_api:building_level(11, CityId) > 0, ?ERROR_TROOPS_BUILDING_LEVEL),
		QianJun = TotalQianJun - NowQianJun,
		HouJun = TotalHouJun - NowHouJun,
		?JUDGE_RETURN(QianJun + HouJun > 0, ?ERROR_TROOPS_FULL),
		[GoldNum, TroopsNum] = maps:get(jsonvalue, tb_const:get(additional_soldiers)),
		{NewQianJun, NewHouJun, Back} =
			case Param of
				{QianJunNum, HouJunNum} ->%%正常补兵
					Q = ?IIF(QianJunNum > QianJun, QianJun, QianJunNum),
					H = ?IIF(HouJunNum > HouJun, HouJun, HouJunNum),
					NeedNum = GoldNum * util:ceil((QianJun - Q + HouJun - H) / TroopsNum),
					{NowQianJun + Q, NowHouJun + H, {Q, H, NeedNum}};
				TotalNum ->%%元宝补兵
					NeedNum = GoldNum * util:ceil((QianJun + HouJun) / TroopsNum),
					?JUDGE_RETURN(TotalNum >= NeedNum, ?ERROR_GOLD_AMOUNT),
					{TotalQianJun, TotalHouJun, NeedNum}
			end,
		NewTroops = Troops#troops{
			combat_hero = CombatHero#combat_hero{
				former = Former#combat_army{cur_troops = NewQianJun},
				latter = Latter#combat_army{cur_troops = NewHouJun}
			}
		},
		case NowQianJun + NowHouJun of
			0 -> lib_map_api:a_defend_troops(TroopsId, CityId);
			_ -> skip
		end,
		u_troops(NewTroops),
		Back
	catch
		_:Error -> Error
	end
;
repair(TroopsIdList, Param) ->
	try
		TroopsList = troops(TroopsIdList),
		lists:foldl(
			fun(Troops, P) ->
				try
					#troops{
						state = State,
						combat_hero = CombatHero = #combat_hero{
							hero_id = HeroId,
							former = Former = #combat_army{cur_troops = NowQianJun, troops = TotalQianJun},
							latter = Latter = #combat_army{cur_troops = NowHouJun, troops = TotalHouJun}
						},
						city_id = CityId
					} = Troops,
					?JUDGE_RETURN(State =:= ?TROOPS_FREE, ?ERROR_TROOPS_ERROR),
					?JUDGE_RETURN(lib_map_api:building_level(11, CityId) > 0, ?ERROR_TROOPS_BUILDING_LEVEL),
					QianJun = TotalQianJun - NowQianJun,
					HouJun = TotalHouJun - NowHouJun,
					?JUDGE_RETURN(QianJun + HouJun > 0, ?ERROR_TROOPS_FULL),
					FrontType = lib_hero_api:hero_front_corps(HeroId),
					BackType = lib_hero_api:hero_back_corps(HeroId),
					A = maps:get(FrontType, P),
					B = maps:get(BackType, P),
					?JUDGE_RETURN(A + B > 0, ?ERROR_BARRACK_DEFICIENCY),
					{NewQianJun, P1} =
						case A < QianJun of
							true -> {A + NowQianJun, maps:put(FrontType, 0, P)};
							false -> {QianJun + NowQianJun, maps:put(FrontType, A - QianJun, P)}
						end,
					{NewHouJun, P2} =
						case B < HouJun of
							true -> {B + NowHouJun, maps:put(BackType, 0, P1)};
							false -> {HouJun + NowHouJun, maps:put(BackType, B - HouJun, P1)}
						end,
					NewTroops = Troops#troops{
						combat_hero = CombatHero#combat_hero{
							former = Former#combat_army{cur_troops = NewQianJun},
							latter = Latter#combat_army{cur_troops = NewHouJun}
						}
					},
					case NowQianJun + NowHouJun of
						0 -> lib_map_api:a_defend_troops(Troops#troops.troops_id, CityId);
						_ -> skip
					end,
					u_troops(NewTroops),
					P2
				catch
				    _:_ -> P
				end
			end, Param, TroopsList)
	catch
		_:Error -> Error
	end
.
index(M, L) ->
	index(M, L, 1)
.
index(M, [M | _], N) -> N;
index(M, [_ | L], N) ->
	index(M, L, N + 1);
index(_, [], N) -> N
.
extrude(TroopsId, GoalCityId, ProvisionsNum, PlayerBase, {Add1, Add2}) ->
	try
		#troops{
			combat_hero = #combat_hero{country = Country, prop_dict = PropDict, former = Former, latter = Latter},
			city_id = CityId,
			state = State
		} = Troops = troops(TroopsId),
		?JUDGE_RETURN(State =:= ?TROOPS_FIGHTING, ?ERROR_TROOPS_ERROR),
		CurTroops = Former#combat_army.cur_troops + Latter#combat_army.cur_troops,
		?JUDGE_RETURN(CurTroops >= (Former#combat_army.troops + Latter#combat_army.troops) / 2, ?ERROR_TROOPS_ERROR),
		CityLists = [CityId, GoalCityId],
		Add = {util:dict_get(?MARCH_SPEED_MULTI, PropDict, 0) * 100 + Add1, Add2},
		{CityTimes, Provisions} = consume_time_list(CityLists, Country, CurTroops, Add),
		?JUDGE_RETURN(ProvisionsNum >= Provisions, ?ERROR_ITEM_AMOUNT),
		?JUDGE_RETURN(lib_map_api:country(GoalCityId) =/= Country, ?ERROR_TROOPS_ERROR),
		City = lib_map_api:city(CityId),
		case City#city.country of
			Country ->
				?JUDGE_RETURN(index(TroopsId, City#city.defend_troops) > 5, ?ERROR_TROOPS_ERROR),
				lib_map_api:d_defend_troops(TroopsId, CityId);
			_ ->
				?JUDGE_RETURN(index(TroopsId, City#city.attack_troops) > 5, ?ERROR_TROOPS_ERROR),
				lib_map_api:d_attack_troops(TroopsId, CityId)
		end,
		lib_combat_queue_api:quit_combat_queue(City#city.fighting, PlayerBase, Troops#troops.combat_hero#combat_hero.hero_id),
		NewTroops = Troops#troops{
			state = ?TROOPS_MOVING,
			march = ?MARCH(CityLists, CityTimes, lib_timer:unixtime_ms())
		},
		depart([NewTroops]),
		lib_map:depart([NewTroops]),
		Provisions
	catch
		_:Error -> Error
	end
.
withdraw(TroopsId, GoalCityId, ProvisionsNum, PlayerBase, {Add1, Add2}) ->
	try
		#troops{
			combat_hero = CombatHero = #combat_hero{
				country = Country,
				prop_dict = PropDict,
				former = Former = #combat_army{
					troops = FormerTroops,
					cur_troops = FormerCurTroops
				},
				latter = Latter = #combat_army{
					troops = LatterTroops,
					cur_troops = LatterCurTroops
				}
			},
			city_id = CityId,
			state = State
		} = Troops = troops(TroopsId),
		?JUDGE_RETURN(State =:= ?TROOPS_FIGHTING, ?ERROR_TROOPS_ERROR),
		CurTroops = FormerCurTroops + LatterCurTroops,
		CityLists = [CityId, GoalCityId],
		Add = {util:dict_get(?MARCH_SPEED_MULTI, PropDict, 0) * 100 + Add1, Add2},
		{CityTimes, Provisions} = consume_time_list(CityLists, Country, CurTroops, Add),
		?JUDGE_RETURN(ProvisionsNum >= Provisions, ?ERROR_ITEM_AMOUNT),
		?JUDGE_RETURN(lib_map_api:country(GoalCityId) =:= Country, ?ERROR_TROOPS_ERROR),
		City = lib_map_api:city(CityId),
		case City#city.country of
			Country ->
				?JUDGE_RETURN(index(TroopsId, City#city.defend_troops) > 5, ?ERROR_TROOPS_ERROR),
				lib_map_api:d_defend_troops(TroopsId, CityId);
			_ ->
				?JUDGE_RETURN(index(TroopsId, City#city.attack_troops) > 5, ?ERROR_TROOPS_ERROR),
				lib_map_api:d_attack_troops(TroopsId, CityId)
		end,
		lib_combat_queue_api:quit_combat_queue(City#city.fighting, PlayerBase, CombatHero#combat_hero.hero_id),
		TotalTroops = FormerTroops + LatterTroops,
		{NewFormerCurTroops, NewLatterCurTroops} =
			case CurTroops < TotalTroops / 2 of
				true -> {FormerCurTroops, LatterCurTroops};
				false ->
					Rate = 1 - 0.25 / CurTroops * TotalTroops,
					{trunc(FormerCurTroops * Rate), trunc(LatterCurTroops * Rate)}
			end,
		NewTroops = Troops#troops{
			combat_hero = CombatHero#combat_hero{
				former = Former#combat_army{cur_troops = NewFormerCurTroops},
				latter = Latter#combat_army{cur_troops = NewLatterCurTroops}
			},
			state = ?TROOPS_MOVING,
			march = ?MARCH(CityLists, CityTimes, lib_timer:unixtime_ms())
		},
		depart([NewTroops]),
		lib_map:depart([NewTroops]),
		Provisions
	catch
		_:Error -> Error
	end
.
re_troops(TroopsId) ->
	Troops = troops(TroopsId),
	CombatHero = Troops#troops.combat_hero,
	Former = CombatHero#combat_hero.former,
	Latter = CombatHero#combat_hero.latter,
	NewTroops = Troops#troops{
		combat_hero = CombatHero#combat_hero{
			former = Former#combat_army{cur_troops = 0},
			latter = Latter#combat_army{cur_troops = 0}
		},
		state = ?TROOPS_FREE,
		city_id = ?COUNTRY_CAPITAL(CombatHero#combat_hero.country)
	},
	u_troops(NewTroops)
.

u_combat_hero(CombatHero) ->
	PlayerId = CombatHero#combat_hero.id,
	Troops = troops(PlayerId * 1000 + CombatHero#combat_hero.hero_id),
	OldCombatHero = Troops#troops.combat_hero,
	OldFormerNum = OldCombatHero#combat_hero.former#combat_army.cur_troops,
	OldLatterNum = OldCombatHero#combat_hero.latter#combat_army.cur_troops,
	Former = CombatHero#combat_hero.former,
	Latter = CombatHero#combat_hero.latter,
	FormerNum = Former#combat_army.troops,
	LatterNum = Latter#combat_army.troops,
	FNum = OldFormerNum - FormerNum,
	LNum = OldLatterNum - LatterNum,
	NewFormerNum =
		case FNum > 0 of
			true ->
				mod_server:async_apply(lib_player:get_pid(PlayerId), fun lib_barrack_train_api:request_return_store_soldier/2, [Former#combat_army.type, FNum]),
				FormerNum;
			false -> OldFormerNum
		end,
	NewLatterNum =
		case LNum > 0 of
			true ->
				mod_server:async_apply(lib_player:get_pid(PlayerId), fun lib_barrack_train_api:request_return_store_soldier/2, [Latter#combat_army.type, LNum]),
				LatterNum;
			false -> OldLatterNum
		end,
	NewCombatHero = CombatHero#combat_hero{
		former = Former#combat_army{cur_troops = NewFormerNum},
		latter = Latter#combat_army{cur_troops = NewLatterNum}
	},
	u_troops(Troops#troops{combat_hero = NewCombatHero})
.

u_troops(Troops) when is_record(Troops, troops) ->
	u_troops([Troops]);
u_troops(TroopsList) when is_list(TroopsList) ->
	AllTroops = all_troops(),
	NewAllTroops = lists:foldl(
		fun(Troops, Dict) ->
			lib_map:add_notice_troops(Troops#troops.combat_hero#combat_hero.id),
			dict:store(Troops#troops.troops_id, Troops, Dict)
		end, AllTroops, TroopsList),
	lib_troops_march:put_troops(NewAllTroops),
	[lib_troops_march:insert(X) || X <- TroopsList]
.
u_troops_march() ->
	NowTick = lib_timer:unixtime_ms(),
	TroopsList = troops(lib_troops_march:get_troops_march()),
	NewTroopsMarch = [Troops#troops.troops_id || #troops{march = March} = Troops <- TroopsList,
		(NowCityId = now_city(maps:get(city_times, March), NowTick - maps:get(depart_tick, March), maps:get(city_lists, March))) =:= Troops#troops.city_id
		orelse lib_city_defense_api:pass_city(Troops, NowCityId) =:= pass],
	lib_troops_march:put_troops_march(NewTroopsMarch)
.
now_city(CityTimes, Time, CityLists) ->
	N = n(CityTimes, Time, 1),
	lists:nth(N, CityLists)
.
n([R | Ts], T, N) when T >= R ->
	n(Ts, T - R, N + 1);
n(_, _, N) ->
	N
.

d_troops(TroopsId) when is_integer(TroopsId) ->
	d_troops([TroopsId]);
d_troops(TroopsIdList) when is_list(TroopsIdList) ->
	AllTroops = all_troops(),
	NewAllTroops = lists:foldl(
		fun(TroopsId, Dict) ->
			dict:erase(TroopsId, Dict)
		end, AllTroops, TroopsIdList),
	lib_troops_march:put_troops(NewAllTroops)
.

to_fighting(Type, Params, TroopsIdList, Monsters, CityId) ->
	to_fighting(Type, Params, TroopsIdList, Monsters, CityId, false)
.
to_fighting(Type, Params, TroopsIdList, Monsters, CityId, IsCross) ->
	TroopsList = troops(TroopsIdList),
	Cross = ?IIF(IsCross, true, CityId),
	{CombatHeroes, List} = to_fighting(TroopsList, Cross, {[], [], []}),
	case CombatHeroes =:= [] orelse Monsters =:= [] of
		true -> 0;
		_ ->
			CombatId = lib_combat_queue_api:async_call_fight(#req_combat_queue{
				type = Type,
				params = Params,
				l_fighters = CombatHeroes,
				r_fighters = Monsters
			}),
			lib_map:add_callback_troops(CombatId, List),
			CombatId
	end
.
to_fighting([Troops | TroopsList], Cross, {List1, List2, List3}) ->
	L =
		case Cross =:= true orelse Cross =:= Troops#troops.city_id andalso Troops#troops.state =:= ?TROOPS_FREE  of
			true ->
				TroopsId = Troops#troops.troops_id,
				lib_map_api:d_defend_troops(TroopsId, Troops#troops.city_id),
				{[Troops#troops.combat_hero | List1], [Troops#troops{state = ?TROOPS_FIGHTING} | List2], [TroopsId | List3]};
			false -> {List1, List2, List3}
		end,
	to_fighting(TroopsList, Cross, L)
;
to_fighting(_, _, {List1, List2, List3}) ->
	u_troops(List2),
	{List1, List3}
.
