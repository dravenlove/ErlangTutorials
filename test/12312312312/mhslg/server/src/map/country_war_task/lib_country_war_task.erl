%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 09. Apr 2021 5:28 PM
%%%-------------------------------------------------------------------
-module(lib_country_war_task).
-author("lichaoyu").
-include("common.hrl").
-include("map.hrl").
-include("fight.hrl").
-include("country_war_task.hrl").
-include("ProtoClient_10148.hrl").
-define(COUNTRY_WAR_TASK, country_war_task).
%% API
-export([
	put_country_war_task/1,
	get_country_war_task/0,
	check/0,
	test/0,
	test1/0,
	city/1,
	border_city/0,
	start_task/0,
	country_buff/1
]).
-export([
	request_info/0
]).

put_country_war_task(CountryWarTask) ->
	erlang:put(?COUNTRY_WAR_TASK, CountryWarTask)
.
get_country_war_task() ->
	erlang:get(?COUNTRY_WAR_TASK)
.

check() ->
	#country_war_task{tick = Tick} = get_country_war_task(),
	case Tick =:= 0 orelse Tick > lib_timer:unixtime() of
		true -> skip;
		false -> next_task()
	end
.
test() ->
	border_city(),
	start_task().
test1() ->
	next_task().
request_info() ->
	lib_map_api:async(fun info/0, [], fun info/1)
.
info() ->
	get_country_war_task().
info(CountryWarTask) ->
	#country_war_task{
		type = Type
	} = CountryWarTask,
	Proto = #'Proto50148001'{type = Type},
	Country = lib_player:player_country(),
	Res =
		case Type of
			?TYPE_TASK_0 -> Proto;
			?TYPE_TASK_1 -> Proto#'Proto50148001'{time = CountryWarTask#country_war_task.tick - lib_timer:unixtime()};
			?TYPE_TASK_4 ->
				Proto#'Proto50148001'{
					city_id = maps:get(Country, CountryWarTask#country_war_task.param, []),
					finish = maps:get(Country, CountryWarTask#country_war_task.finish, [])
				};
			_ ->
				Proto#'Proto50148001'{
					time = CountryWarTask#country_war_task.tick - lib_timer:unixtime(),
					city_id = maps:get(Country, CountryWarTask#country_war_task.param, []),
					finish = maps:get(Country, CountryWarTask#country_war_task.finish, [])
				}
		end,
	lib_send:respond_to_client(Res)
.

border_city() ->
	OpenDay = lib_season_and_days_api:get_season_day() - maps:get(value, tb_country_war_task_const:get(open_day)),
	case ?IIF(OpenDay < 0, 1, OpenDay) rem maps:get(value, tb_country_war_task_const:get(interval_day)) =:= 0 of
		false -> skip;
		true ->
			ConnectCityMaps = connect_city(),
			Param = maps:map(
				fun(_, CityList) ->
					[X || X <- CityList, lists:subtract(maps:get(X, ConnectCityMaps, []), CityList) =/= []]
				end, lib_map_api:country_city_maps()),
			CountryWarTask = get_country_war_task(),
			put_country_war_task(CountryWarTask#country_war_task{
				type = ?TYPE_TASK_0,
				param = Param
			})
	end
.

connect_city() ->
	lists:foldl(
		fun(K, D) ->
			{City1, City2} = city(K),
			maps:put(City1, [City2 | maps:get(City1, D, [])], D)
		end, #{}, tb_world_city_road:get_list())
.
city(K) ->
	[_ | L] = erlang:atom_to_list(K),
	{C1, [_ | C2]} = lists:split(7, L),
	{erlang:list_to_integer(C1), erlang:list_to_integer(C2)}
.

start_task() ->
	OpenDay = lib_season_and_days_api:get_season_day() - maps:get(value, tb_country_war_task_const:get(open_day)),
	case ?IIF(OpenDay < 0, 1, OpenDay) rem maps:get(value, tb_country_war_task_const:get(interval_day)) =:= 0 of
		false -> skip;
		true -> next_task()
	end
.
next_task() ->
	#country_war_task{
		type = Type,
		param = Param,
		finish = Finish
	} = CountryWarTask = get_country_war_task(),
	NewParam =
		case Type of
			?TYPE_TASK_1 ->
				lists:foldl(
					fun(Key, M) ->
						{Country1, Country2} = country(Key),
						FixCityList = maps:get(jsonvalue, tb_country_war_task_const:get(Key)),
						BorderCityList = lists:append(maps:get(Country1, Param, []), maps:get(Country2, Param, [])),
						CityList = [X || X <- FixCityList, lists:member(X, BorderCityList)],
						CityList1 = case CityList =:= [] of true -> FixCityList;false -> CityList end,
						CityId = lib_random:rand_one(CityList1),
						M1 = maps:put(Country1, [CityId | maps:get(Country1, M, [])], M),
						maps:put(Country2, [CityId | maps:get(Country2, M1, [])], M1)
					end, #{}, country_key());
			_ -> Param
		end,
	NewFinish =
		case Type of
			?TYPE_TASK_2 ->
				Param1 = maps:map(
					fun(Country, CityList) ->
						[X || X <- CityList, lib_map_api:country(X) =:= Country]
					end, Param),
				insert_combat_buff(Param1),
				Param1;
			_ -> maps:new()
		end,
	Tick =
		case Type of
			?TYPE_TASK_3 -> remove_combat_buff(Finish), 0;
			_ -> lib_timer:next_hour_unixtime(lib_timer:unixtime())
		end,
	put_country_war_task(CountryWarTask#country_war_task{
		type = Type + 1,
		tick = Tick,
		param = NewParam,
		finish = NewFinish
	})
.

country_key() ->
	c(lib_map_api:player_country(), [])
.
c([_], L) -> L;
c([C | S], L) ->
	c(S, lists:append([country_key(C, X) || X <- S], L))
.

country_key(Country1, Country2) ->
	case Country1 < Country2 of
		true -> Country1 * 10 + Country2;
		false -> Country2 * 10 + Country1
	end
.
country(Key) ->
	{Key div 10, Key rem 10}
.

insert_combat_buff(Param) ->
	?DEBUG("加成"),
	combat_buff(fun lib_combat_queue_api:insert_combat_buff/3, Param)
.

remove_combat_buff(Param) ->
	?DEBUG("移除"),
	combat_buff(fun lib_combat_queue_api:remove_combat_buff/3, Param)
.

combat_buff(Fun, Param) ->
	P = maps:map(
		fun(_, CityList) ->
			length(CityList)
		end, Param),
	?DEBUG("~p", [P]),
	dict:map(
		fun(_, City) ->
			case City#city.fighting of
				?FIGHTING_NO -> skip;
				CombatId ->
					case maps:find(City#city.country, P) of
						error -> skip;
						{ok, R} -> Fun(CombatId, ?FIGHTER_TYPE_R, fight_buff(R))
					end,
					case maps:find(City#city.attack_country, P) of
						error -> skip;
						{ok, L} -> Fun(CombatId, ?FIGHTER_TYPE_L, fight_buff(L))
					end
			end
		end, lib_map_api:all_city())
.

fight_buff(1) ->
	maps:get(jsonvalue, tb_country_war_task_const:get(fight_buff));
fight_buff(N) ->
	fight_buff(1) ++ fight_buff(N - 1)
.

country_buff(Country) ->
	#country_war_task{finish = Finish} = get_country_war_task(),
	case maps:get(Country, Finish, []) of
		[] -> [];
		N -> fight_buff(length(N))
	end
.
