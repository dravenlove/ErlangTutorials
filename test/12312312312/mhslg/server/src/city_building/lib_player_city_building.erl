%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Jan 2021 2:53 PM
%%%-------------------------------------------------------------------
-module(lib_player_city_building).
-author("lichaoyu").
-include("common.hrl").
-include("city_building.hrl").
-include("map.hrl").
-include("hero_busy.hrl").
-include("science.hrl").
-include("fight_prop.hrl").
-include("ProtoClient_10133.hrl").

-define(CITY_BUILDING_WAIT, 0).
-define(CITY_BUILDING_MONEY, 1).

%% API
-export([
	get_player_city_building/0,
	put_player_city_building/1,
	player_city_building_handler/0
]).

%% API
-export([
	test/0,
	request_city_building_info/1,	%% 请求城池建设信息
	request_hero_building/1			%% 请求英雄建设
]).

get_player_city_building() ->
	erlang:get(?ETS_PLAYER_CITY_BUILDING).

put_player_city_building(Player_country_info) when is_record(Player_country_info, player_city_building)  ->
	put_player_city_building(Player_country_info,true).
put_player_city_building(Player_country_info,IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_CITY_BUILDING),
	erlang:put(?ETS_PLAYER_CITY_BUILDING, Player_country_info).

ets_init() ->
	ets:new(?ETS_PLAYER_CITY_BUILDING, [?ETS_KEY_POS(#player_city_building.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_CITY_BUILDING, {?TUPLE_INT(id, 1)}, true).

player_city_building_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_CITY_BUILDING,
		table_name = ?DBPLAYER_CITY_BUILDING,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_city_building:load_player_city_building/1,
		save_func = fun db_player_city_building:save_player_city_building/1,
		get_func = fun get_player_city_building/0,
		put_func = fun put_player_city_building/2
	}.

request_city_building_info(Msg) ->
	#'Proto10133001'{
		city_id = CityId
	} = Msg,
	?JUDGE_RETURN(lib_city_building_api:is_building(CityId), ?ERROR_CITY_ID),
	City = lib_player_map:city(CityId),
	?JUDGE_RETURN(lib_player:player_country() =:= City#city.country, ?ERROR_CITY_BUILDING_UNLOCK),
	BuildingMap = City#city.building_map,
	BuildingMapList = maps:to_list(BuildingMap),
	BuildingList = [#'ProtoCityBuilding'{
		building_id = X,
		count = Y,
		lock = case lib_city_building_api:is_open(X, BuildingMap) of true -> 0; false -> 1 end
	} || {X, Y} <- BuildingMapList],
	Res = #'Proto50133001'{
		building = BuildingList,
		add1 = trunc(maps:get(?CITY_EFFECT_9, City#city.building_prop, 0)),
		add2 = trunc(lib_player_science_api:get_effect_value(?EFFECT_BUILD_REWARD_ADD))
	},
	lib_send:respond_to_client(Res)
.

request_hero_building(Msg) ->
	#'Proto10133003'{
		hero_id = HeroId,
		city_id = CityId,
		building_id = BuildingId,
		choose = Choose,
		type = Type
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_109), ?ERROR_NOBILITY_ID),
	?JUDGE_RETURN(lists:member(Choose, maps:get(jsonvalue, tb_const:get(building_choose))), ?ERROR_CITY_BUILDING_TYPE),
	?JUDGE_RETURN(lists:member(BuildingId, lib_city_building_api:building_list(CityId)), ?ERROR_CITY_BUILDING_TYPE),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	lib_hero_busy_api:is_correct(HeroId, ?CITY_BUILDING, CityId, BuildingId),
	City = lib_player_map:city(CityId),
	?JUDGE_RETURN(lib_player:player_country() =:= City#city.country, ?ERROR_CITY_BUILDING_UNLOCK),
	?JUDGE_RETURN(lib_city_building_api:is_open(BuildingId, City#city.building_map), ?ERROR_CITY_BUILDING_UNLOCK),

	#{
		consume := Consume,
		time := Time,
		award := [CountNum, FeatNum]
	} = tb_building_kind:get(BuildingId),
	ConsumeNum = [[I, N * Choose] || [I, N] <- Consume],
	NeedTime = Time * Choose,
	case Type of
		?CITY_BUILDING_WAIT ->
			lib_equip_api:item(ConsumeNum, ?USE_CITY_BUILDING, CityId * 100 + BuildingId),
			NowTick = lib_timer:unixtime(),
			HeroBusy = #hero_busy{
				hero_id = HeroId,
				type = ?CITY_BUILDING,
				city_id = CityId,
				incident = lib_hero_busy_api:incident(?TYPE_1),
				start_tick = NowTick,
				param = [BuildingId, Choose],
				finish_tick = NeedTime + NowTick
			},
			lib_hero_busy_api:u_hero_busy(HeroBusy);
		?CITY_BUILDING_MONEY ->
			GoldNum = lib_equip_api:time_to_gold(NeedTime),
			lib_equip_api:item([[?GOLD_ID, GoldNum] | ConsumeNum], ?USE_CITY_BUILDING, CityId * 100 + BuildingId),
			Feat = trunc(FeatNum * Choose * (100 + lib_player_science_api:get_effect_value(?EFFECT_BUILD_REWARD_ADD)) / 100),
			lib_equip_api:item([?FEAT_ID, Feat], ?ADD_CITY_BUILDING, CityId * 100 + BuildingId)
	end,
	Add = maps:get(?CITY_EFFECT_9, City#city.building_prop, 0),
	HeroAdd = lib_hero_prop:prop_add(HeroId, ?BUILD_VALUE_MULTI) * 100,
	AddCount = trunc(CountNum * Choose * (100 + Add + HeroAdd) / 100),
	lib_player_process:process_city_building(CityId, BuildingId, AddCount),
	Res = #'Proto50133003'{
		building_id = BuildingId,
		value = AddCount
	},
	lib_send:respond_to_client(Res)
.

test() ->
	?DEBUG("~p", [lib_hero_genius:genius_id_list(201)])
.
