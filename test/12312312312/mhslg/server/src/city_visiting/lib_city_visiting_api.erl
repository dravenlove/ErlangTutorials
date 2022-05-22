%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Feb 2021 10:05 AM
%%%-------------------------------------------------------------------
-module(lib_city_visiting_api).
-author("lichaoyu").
-include("common.hrl").
-include("city_visiting.hrl").
-include("map.hrl").

%% API
-export([			%% 通用
	fragment_id/1,			%% 英雄对应的英雄碎片id
	prop_the_highest/1,		%% 英雄四维属性最高的一项
	section/2,				%% 列表区间中查找位置
	reset_time/0,
	balance/2
]).

-export([			%% 玩家调用
	time/0,				%% 拜访消耗时间
	num/0,				%% 玩家可拜访次数
	visiting_num/1,			%% 城池拜访次数
	add_visiting_num/2,		%% 增加城池拜访次数
	total_num/0				%% 拜访总次数
]).

-export([			%% 地图进程调用
	reset_visiting_hero/0,
	visiting_hero/1,
	visiting_hero/2
]).

fragment_id(HeroId) ->
	maps:get(fragment_id, tb_visiting_hero_weight:get(HeroId))
.

prop_the_highest(HeroId) ->
	PropList = [hero_intelect, hero_spirit, hero_leadership],
	Data = tb_hero:get(HeroId),
	lists:foldl(
		fun(PropName, Highest) ->
			case maps:get(PropName, Data) > maps:get(Highest, Data) of
				true -> PropName;
				false -> Highest
			end
		end, hero_strength, PropList)
.

section(Val, Section) ->
	s(Val, Section, 1)
.
s(V, [F | L], N) when V > F -> s(V, L, N + 1);
s(_, _, N) -> N.

random_hero(Num) ->
	h(Num, maps:new(), [])
.
h(0, _, L) -> L;
h(N, Maps, L) ->
	#{value := MaxNum} = tb_visiting_const:get(x),
	Exclude = maps:fold(
		fun(K, V, List) ->
			case V =:= MaxNum of
				true -> [K | List];
				false -> List
			end
		end, [], Maps),
	HeroIdList = lists:subtract(tb_visiting_hero_weight:get_list(), Exclude),
	NewHeroId = lib_equip_api:random_one_weight(HeroIdList, [maps:get(weight, tb_visiting_hero_weight:get(X)) || X <- HeroIdList]),
	NewMaps = maps:put(NewHeroId, maps:get(NewHeroId, Maps, 0) + 1, Maps),
	h(N - 1, NewMaps, [NewHeroId | L])
.

time() ->
	trunc(maps:get(value, tb_visiting_const:get(time)) * (1 - lib_nobility_api:privilege_add(?VISIT_RATE) / 2))
.

num() ->
	maps:get(value, tb_visiting_const:get(init_num)) %% todo 成就加成
.

player_city_visiting() ->
	lib_player_city_visiting:get_city_visiting()
.
total_num() ->
	#player_city_visiting{total_num = TotalNum} = player_city_visiting(),
	TotalNum
.
city_visiting_maps() ->
	PlayerCityVisiting = player_city_visiting(),
	PlayerCityVisiting#player_city_visiting.city_visiting
.

visiting_num(CityId) ->
	maps:get(CityId, city_visiting_maps(), 0)
.

add_visiting_num(CityId, Num) ->
	#player_city_visiting{
		total_num = TotalNum,
		city_visiting = CityVisitingMaps
	} = PlayerCityVisiting = player_city_visiting(),
	NewNum = maps:get(CityId, city_visiting_maps(), 0) + Num,
	NewCityVisitingMaps = maps:put(CityId, NewNum, CityVisitingMaps),
	NewPlayerCityVisiting = PlayerCityVisiting#player_city_visiting{
		total_num = TotalNum + Num,
		city_visiting = NewCityVisitingMaps
	},
	lib_player_city_visiting:put_city_visiting(NewPlayerCityVisiting)
.

reset_time() ->
	maps:get(timevalue, tb_const:get(refresh_time))
.

%% 刷新拜访英雄，每个势力刷Num个城池，如果城池不够，平均刷新到其他势力
reset_visiting_hero() ->
	CountryList = lib_map_api:player_country(),
	CityIdMaps = dict:fold(
		fun(_, #city{id = CityId, country = Country}, Maps) ->
			case lib_map_api:type(CityId) >= ?CITY_XIAN_CITY of
				false -> Maps;
				true -> maps:put(Country, [CityId | maps:get(Country, Maps, [])], Maps)
			end
		end, maps:new(), lib_map_api:all_city()),
	#{value := Num} = tb_visiting_const:get(refresh_time),
	NumList = [length(maps:get(Country, CityIdMaps)) || Country <- CountryList],
	{CityNumList, _} = balance(NumList, Num),
	HeroIdList = random_hero(lists:sum(CityNumList)),
	CityIdList = lists:foldl(
		fun({N, Country}, List) ->
			lib_random:rand_more(N, maps:get(Country, CityIdMaps)) ++ List
		end, [], lists:zip(CityNumList, CountryList)),
	CityVisitingMap = lists:foldl(
		fun({CityId, HeroId}, Maps) ->
			maps:put(CityId, HeroId, Maps)
		end, maps:new(), lists:zip(CityIdList, HeroIdList)),
	lib_map:put_city_visiting(CityVisitingMap),
	lib_player_city_visiting:notice_city_visiting(CityVisitingMap)
.

%% 给一个平衡值，列表中的每一项需要向平衡值进行靠近，如果小于平衡值则不变有差溢出，大于的则随机平均加溢出的值，使得返回的结果{List, Spill}，
%% Spill 为溢出值，为0时，平衡成功sum(List) 等于 length(List) * Default
balance(List, Default) ->
	L = [X - Default || X <- List],
	Sum = lists:sum(L),
	case Sum =< 0 of
		true -> {List, abs(Sum)};	%% 总和不够，有溢出
		false ->
			{L1, F} = lists:foldr(
				fun(X, {List1, Food}) ->
					case X < 0 of
						true -> {[0 | List1], abs(X) + Food};
						false -> {[X | List1], Food}
					end
				end, {[], 0}, L),
			L2 = f(L1, F),
			{lists:zipwith(fun(X, Y) -> X - Y end, List, L2), 0}
	end
.
f(List, 0) -> List;
f(List, Food) ->
	A = lists:foldl(fun(X, Acc) -> case X =< 0 of true -> Acc; false -> Acc + 1 end end, 0, List),
	Div = Food div A,
	{L2, F} =
		case Div =/= 0 of
			true ->
				lists:foldr(
					fun(X, {List1, Food1}) ->
						case X >= Div of
							true -> {[X - Div | List1], Food1 - Div};
							false -> {[0 | List1], Food1 - X}
						end
					end, {[], Food}, List);
			false ->
				Rem = Food rem A,	%% 剩余随机分
				{B1, B2, _} = lists:foldr(
					fun(X, {List1, Food1, AA}) ->
						case X > 0 andalso Food1 > 0 of
							false -> {[X | List1], Food1, AA};
							true ->
								Flag = lib_random:rand_float(0, 1) < (Food1 / AA),
								case Flag of
									true -> {[X - 1 | List1], Food1 - 1, AA - 1};
									false -> {[X | List1], Food1, AA - 1}
								end
						end
					end, {[], Rem, A}, List),
				{B1, B2}
		end,
	f(L2, F)
.

visiting_hero(CityId) ->
	CityVisitingMap = lib_map:get_city_visiting(),
	maps:get(CityId, CityVisitingMap, 0)
.
visiting_hero(CityId, Country) ->
	case Country =:= lib_map_api:country(CityId) of
		true -> visiting_hero(CityId);
		false -> 0
	end
.
