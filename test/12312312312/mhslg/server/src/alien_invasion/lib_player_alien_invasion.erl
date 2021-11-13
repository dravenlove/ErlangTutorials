%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 08. Jul 2021 5:28 PM
%%%-------------------------------------------------------------------
-module(lib_player_alien_invasion).
-author("lichaoyu").
-include("common.hrl").
-include("alien_invasion.hrl").
-include("clearing.hrl").
-include("combat_queue.hrl").
-include("fight.hrl").

%% API
-export([
	sign_in/0,
	check_fresh/0,
	fresh_monster/2,
	request_alien_invasion_fight/2,
	respond_alien_invasion_fight/2
]).
-export([
	put_alien_invasion/1,
	get_alien_invasion/0,
	player_alien_invasion_handler/0
]).

-define(MONSTER_TYPE_3,		3).	%% 困难
-define(CONF_ID(Type, PlayerLevel), Type * 1000 + PlayerLevel).

put_alien_invasion(AlienInvasion) ->
	put_alien_invasion(AlienInvasion, true).
put_alien_invasion(AlienInvasion, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_ALIEN_INVASION),
	erlang:put(?ETS_PLAYER_ALIEN_INVASION, AlienInvasion).

get_alien_invasion() ->
	erlang:get(?ETS_PLAYER_ALIEN_INVASION).

ets_init() ->
	ets:new(?ETS_PLAYER_ALIEN_INVASION, [?ETS_KEY_POS(#player_alien_invasion.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_PLAYER_ALIEN_INVASION, {?TUPLE_INT(id, 1)}, true).

player_alien_invasion_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_ALIEN_INVASION,
		table_name = ?DBPLAYER_PLAYER_ALIEN_INVASION,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_alien_invasion:load_player_alien_invasion/1,
		save_func = fun db_alien_invasion:save_player_alien_invasion/1,
		get_func = fun get_alien_invasion/0,
		put_func = fun put_alien_invasion/2
	}.

sign_in() ->
	PlayerId = lib_player:player_id(),
	CallBackList0 = lib_map_api:sync(fun lib_map:gain_notice_alien_invasion/1, [PlayerId]),
	CallBackList = lists:reverse(CallBackList0),
	[respond_alien_invasion_fight(ClearingId, CallBack) || {ClearingId, CallBack} <- CallBackList]
.

check_fresh() ->
	FreshList = maps:get(jsonvalue, tb_alien_invasion_const:get(fresh_time)),
	check_fresh(FreshList, false)
.
check_fresh([Key | FreshList], Flag) ->
	Conf = tb_alien_invasion_const:get(Key),
	PlayerAlienInvasion = get_alien_invasion(),
	Tick = PlayerAlienInvasion#player_alien_invasion.tick,
	NextTick = lib_timer:next_time_unixtime(maps:get(timevalue, Conf), Tick),
	NowTick = lib_timer:unixtime(),
	Flag1 =
		if
			NextTick =< NowTick ->
				fresh_monster(maps:get(value, Conf), NextTick),
				true;
			true -> Flag
		end,
	check_fresh(FreshList, Flag1)
;
check_fresh(_, false) ->
	skip
;
check_fresh(_, true) ->
	check_fresh()
.

fresh_monster(TotalNum, Tick) ->
	FreshLimit = maps:get(value, tb_alien_invasion_const:get(fresh_limit)),
	PlayerAlienInvasion = get_alien_invasion(),
	PlayerCountry = lib_player:player_country(),
	CountryCityList0 = lib_player_map:country_city(PlayerCountry),
	CountryCityList = [City || City <- CountryCityList0, lib_bounty_mission_api:is_finish(City)],
	ConstConfig = tb_alien_invasion_const:get(PlayerCountry),
	FreshCityList = maps:get(jsonvalue, ConstConfig),
	CanFreshCityList = [City || City <- FreshCityList, lists:member(City, CountryCityList)],
	HaveCityList = lib_map_clearing_api:have_city_list(?TYPE_ALIEN_INVASION),
	ReCityList = CanFreshCityList -- HaveCityList,
	ReCityNum = length(ReCityList),
	FreshTime = FreshLimit - length(HaveCityList),
	FreshNum = lists:min([ReCityNum, FreshTime, TotalNum]),
	CityIdList = lib_random:rand_more(FreshNum, ReCityList),
	alien_invasion(FreshNum, CityIdList),
	SaveTime = PlayerAlienInvasion#player_alien_invasion.save_time,
	NewSaveTime = save_time(TotalNum - FreshNum, SaveTime),
	NewPlayerAlienInvasion = PlayerAlienInvasion#player_alien_invasion{
		tick = Tick,
		save_time = NewSaveTime
	},
	put_alien_invasion(NewPlayerAlienInvasion)
.
alien_invasion(0, _) ->
	skip
;
alien_invasion(FreshNum, CityIdList) ->
	WeightTypeList = maps:get(jsonvalue, tb_alien_invasion_const:get(weight_list)),
	InitList = lists:duplicate(FreshNum, WeightTypeList),
	RandTypeList = rand_type_list(InitList, {[], false}),
	PlayerLevel = lib_player:player_level(),
	lists:map(
		fun({CityId, Type}) ->
			ConfId = ?CONF_ID(Type, PlayerLevel),
			Conf = tb_alien_invasion_monster:get(ConfId),
			Num = maps:get(monster_num, Conf),
			AlienInvasion = #alien_invasion{
				num = Num,
				conf_id = ConfId
			},
			lib_map_clearing_api:city_task(CityId, ?TYPE_ALIEN_INVASION, AlienInvasion)
		end, lists:zip(CityIdList, RandTypeList))
.
rand_type_list([[TypeList, WeightList] | InitList], {List, false}) ->
	Type = lib_equip_api:random_one_weight(TypeList, WeightList),
	rand_type_list(InitList, {[Type | List], Type =:= ?MONSTER_TYPE_3})
;
rand_type_list([[TypeList, WeightList] | InitList], {List, Flag}) ->
	Type = lib_equip_api:random_one_weight(lists:droplast(TypeList), lists:droplast(WeightList)),
	rand_type_list(InitList, {[Type | List], Flag})
;
rand_type_list(_, {List, _Flag}) ->
	List
.

save_time(0, SaveTime) ->
	SaveTime
;
save_time(ReTime, SaveTime) ->
	SaveLimit = maps:get(value, tb_alien_invasion_const:get(save_limit)),
	T = ReTime + SaveTime,
	?IIF(T > SaveLimit, SaveLimit, T)
.


request_alien_invasion_fight(ClearingId, HeroIdList) ->
	Clearing = lib_map_clearing_api:map_clearing(ClearingId),
	AlienInvasion = Clearing#map_clearing.data,
	?JUDGE_RETURN(AlienInvasion#alien_invasion.num =/= 0, ?ERROR_GOTTEN_REWARD),
	?JUDGE_RETURN(AlienInvasion#alien_invasion.combat_id =:= 0, ?ERROR_TROOPS_ERROR),
	Conf = tb_alien_invasion_monster:get(AlienInvasion#alien_invasion.conf_id),
	Num = maps:get(monster_num, Conf),
	Type = maps:get(type, Conf),
	Level = maps:get(monster_level, Conf),
	{_RobotId, MonsterList} = lib_robot_api:alien_invasion_robot(Type, Level, Num),
	TroopsIdList = lib_troops_api:troops_id(HeroIdList),
	PlayerId = lib_player:player_id(),
	Params = {?CALL_FIGHT_TYPE_ALIEN_INVASION, PlayerId, ClearingId},
	CityId = Clearing#map_clearing.city_id,
	Args = [?CALL_FIGHT_TYPE_ALIEN_INVASION, Params, TroopsIdList, MonsterList, CityId],
	CombatId = lib_troops_api:sync(fun lib_troops_api:to_fighting/5, Args),
	?JUDGE_RETURN(CombatId =/= 0, ?ERROR_TROOPS_ERROR),
	lib_map_clearing_api:u_clearing(Clearing#map_clearing{data = AlienInvasion#alien_invasion{combat_id = CombatId}})
.
respond_alien_invasion_fight(ClearingId, CallBackData) when is_record(CallBackData, combat_callback) ->
	MapClearing = lib_map_clearing_api:map_clearing(ClearingId),
	AlienInvasion = MapClearing#map_clearing.data,
	lib_map_clearing_api:u_clearing(MapClearing#map_clearing{data = AlienInvasion#alien_invasion{combat_id = 0}})
;
respond_alien_invasion_fight(ClearingId, CallBackData) ->
	FightResult = CallBackData#callback_data2.fight_result,
	RWastage = FightResult#fight_result.r_wastage,
	case RWastage#fight_wastage.is_win of
		true -> skip;
		false ->
			MapClearing = lib_map_clearing_api:map_clearing(ClearingId),
			AlienInvasion = MapClearing#map_clearing.data,
			NewNum = AlienInvasion#alien_invasion.num - 1,
			lib_map_clearing_api:u_clearing(MapClearing#map_clearing{data = AlienInvasion#alien_invasion{num = NewNum}})
	end,
	lib_player_process:process_alien_invasion_kill(FightResult#fight_result.l_wastage#fight_wastage.kills)
.

