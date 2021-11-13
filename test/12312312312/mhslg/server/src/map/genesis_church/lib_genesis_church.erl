%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 23. Mar 2021 5:49 PM
%%%-------------------------------------------------------------------
-module(lib_genesis_church).
-author("lichaoyu").
-include("common.hrl").
-include("troops.hrl").
-include("genesis_church.hrl").
-include("ProtoClient_10114.hrl").
-define(GENESIS_CHURCH, genesis_church).

%% API
-export([
	put_genesis_church/1,
	get_genesis_church/0,
	clean/0,
	check/0,
	create_small/0,
	create_big/0,
	arrive_city/1,
	genesis_church_to_proto/1
]).

put_genesis_church(GenesisChurch) ->
	erlang:put(?GENESIS_CHURCH, GenesisChurch)
.
get_genesis_church() ->
	erlang:get(?GENESIS_CHURCH)
.

u_genesis_church(GCDict) ->
	put_genesis_church(dict:fold(
		fun(City, GenesisChurch, D) ->
			dict:store(City, GenesisChurch, D)
		end, get_genesis_church(), GCDict)),
	lib_player_map:notice_genesis_church(0, GCDict)
.
d_genesis_church(CityList) ->
	put_genesis_church(lists:foldl(
		fun(City, D) ->
			dict:erase(City, D)
		end, get_genesis_church(), CityList)),
	lib_player_map:notice_genesis_church(1, CityList)
.
clean() ->
	CityList = dict:fetch_keys(get_genesis_church()),
	put_genesis_church(dict:new()),
	lib_player_map:notice_genesis_church(1, CityList)
.

check() ->
	GCDict = get_genesis_church(),
	NowTick = lib_timer:unixtime(),
	GCList = dict:fold(
		fun(_, GenesisChurch, L) ->
			case GenesisChurch#genesis_church.arrive_tick > NowTick of
				true -> L;
				false -> [GenesisChurch | L]
			end
		end, [], GCDict),
	case GCList =:= [] of
		true -> skip;
		false ->
			CityIdList = lists:foldl(
				fun(GenesisChurch, L) ->
					%% todo 攻城
					%%arrive_city(GenesisChurch),
					[GenesisChurch#genesis_church.city | L]
				end, [], GCList),
			d_genesis_church(CityIdList)
	end
.

create_small() ->
	[MoneyNum, TransportNum] = maps:get(jsonvalue, tb_genesis_church_const:get(small_num)),
	[T, W] = maps:get(jsonvalue, tb_genesis_church_const:get(small_refresh_weight)),
	WeightMaps = maps:from_list(lists:zip(T, W)),
	CoordList = maps:get(jsonvalue, tb_genesis_church_const:get(coord)),
	ArriveTick = maps:get(value, tb_genesis_church_const:get(arrive_time)) + lib_timer:unixtime(),
	u_genesis_church(lists:foldl(
		fun(Country, D) ->
			CityIdList = lib_map_api:country_city(Country),
			WeightList = [maps:get(lib_map_api:type(X), WeightMaps) || X <- CityIdList],
			IdList = lib_equip_api:random_num_weight(CityIdList, WeightList, MoneyNum + TransportNum),
			MoneyCityList = lib_random:rand_more(MoneyNum, IdList),
			TransportCityList = lists:subtract(IdList, MoneyCityList),
			GenesisChurch = #genesis_church{level = ?LEVEL_SMALL, arrive_tick = ArriveTick},
			Dict1 = lists:foldl(
				fun(City, D1) ->
					Robot = robot(?LEVEL_SMALL, ?ROBOT_MONEY),
					dict:store(City, GenesisChurch#genesis_church{city = City, coord = lib_random:rand_one(CoordList), robot = Robot, monster = monster(Robot)}, D1)
				end, D, MoneyCityList),
			lists:foldl(
				fun(City, D1) ->
					Robot = robot(?LEVEL_SMALL, ?ROBOT_TRANSPORT),
					dict:store(City, GenesisChurch#genesis_church{city = City, coord = lib_random:rand_one(CoordList), robot = Robot, monster = monster(Robot)}, D1)
				end, Dict1, TransportCityList)
		end, dict:new(), lib_map_api:player_country())),
	?DEBUG("create small genesis church")
.
monster(Robot) ->
	lib_random:rand_one(maps:get(monster_id_list, tb_robot:get(Robot)))
.

create_big() ->
	OpenDay = lib_season_and_days_api:get_season_day() - maps:get(value, tb_genesis_church_const:get(big_open_day)),
	case ?IIF(OpenDay < 0, 1, OpenDay) rem maps:get(value, tb_genesis_church_const:get(big_interval)) =:= 0 of
		false -> skip;
		true ->
			CityIdList = maps:get(jsonvalue, tb_genesis_church_const:get(big_refresh)),
			ArriveTick = maps:get(value, tb_genesis_church_const:get(arrive_time)) + lib_timer:unixtime(),
			u_genesis_church(lists:foldl(
				fun(CityId, D) ->
					Robot = robot(?LEVEL_BIG, ?ROBOT_MONEY),
					dict:store(CityId, #genesis_church{
						city = CityId,
						level = ?LEVEL_BIG,
						robot = Robot,
						monster = monster(Robot),
						arrive_tick = ArriveTick
					}, D)
				end, dict:new(), CityIdList)),
			?DEBUG("create big genesis church")
	end
.

robot(Level, Type) ->
	Season = lib_season_and_days_api:get_season(),
	#{
		robot_id := RobotIdList,
		robot_weight := WeightList
	} = tb_genesis_church_robot:get(Level * 100 + Type * 10 + Season),
	lib_equip_api:random_one_weight(RobotIdList, WeightList)
.

arrive_city(#genesis_church{city = City, level = Level, robot = Robot}) ->
	Num =
		case Level of
			?LEVEL_SMALL ->
				[TroopsNumList, NumList] = maps:get(jsonvalue, tb_genesis_church_const:get(small_troops_num)),
				TroopsNum = lib_map_api:troops_num(City),
				lists:nth(lib_city_visiting_api:section(TroopsNum, TroopsNumList), NumList);
			?LEVEL_BIG ->
				[_, NumList] = maps:get(jsonvalue, tb_genesis_church_const:get(big_troops_num)),
				lists:nth(lib_season_and_days_api:get_season_info() + 1, NumList)
		end,
	NowTick = lib_timer:unixtime(),
	TroopsList = [#troops{
		troops_id = City * 1000 + X,
		combat_hero = lib_robot_api:genesis_church_robot(Robot),
		state = ?TROOPS_MOVING,
		city_id = 0,
		march = ?MARCH([0, City], [0], NowTick)
	} || X <- lists:seq(1, Num)],
	lib_troops_api:u_troops(TroopsList)
.

genesis_church_to_proto(Data) ->
	case is_list(Data) of
		true ->
			lists:foldl(
				fun(City, L) ->
					[#'ProtoGenesisChurch'{city = City} | L]
				end, [], Data);
		false ->
			NowTick = lib_timer:unixtime(),
			ArriveTime = maps:get(value, tb_genesis_church_const:get(arrive_time)),
			Distance = maps:get(value, tb_genesis_church_const:get(distance)),
			dict:fold(
				fun(_, #genesis_church{city = City, coord = Coord, monster = Monster, arrive_tick = ArriveTick}, L) ->
					Time = ArriveTick - NowTick,
					[#'ProtoGenesisChurch'{
						city = City,
						coord = Coord,
						monster = Monster,
						distance = Distance * Time div ArriveTime,
						time = Time
					} | L]
				end, [], Data)
	end
.

