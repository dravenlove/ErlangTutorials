%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 20. 11月 2020 16:29
%%%-------------------------------------------------------------------
-module(lib_troops).
-author("lichaoyu").
-include("common.hrl").
-include("troops.hrl").
-include("fight.hrl").

%% API
-export([
	put_troops/1,
	get_troops/0,
	player_troops_handler/0,
	sign_in/0,
	sign_out/0,
	troops_march_to_proto/1
]).

-export([
	hero_active/0,
	player_troops/0,
	test/0,
	calculate_foodstuff_and_time/1,
	to_fighting/3					%% 模拟部队战斗
]).

put_troops(Troops) ->
	put_troops(Troops, true).
put_troops(Troops, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_TROOPS),
	erlang:put(?ETS_PLAYER_TROOPS, Troops).

get_troops() ->
	erlang:get(?ETS_PLAYER_TROOPS)
.

ets_init() ->
	ets:new(?ETS_PLAYER_TROOPS, [?ETS_KEY_POS(#player_troops.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_TROOPS, {?TUPLE_INT(id, 1)}, true).

player_troops_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_TROOPS,
		table_name = ?DBPLAYER_TROOPS,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_troops:load_troops/1,
		save_func = fun db_troops:save_troops/1,
		get_func = fun get_troops/0,
		put_func = fun put_troops/2
	}.

sign_in() ->
	Kill = lib_map_api:sync(fun lib_map:gain_notice_country_war_kill/1, [lib_player:player_id()]),
	lib_player_process:process_country_kill(Kill),
	Time = lib_map_api:sync(fun lib_map:gain_notice_country_war_time/1, [lib_player:player_id()]),
	lib_player_process:process_country_time(Time)
.

sign_out() ->
	lib_map_api:async(fun lib_map:del_player_view/1, [lib_player:get_pid(lib_player:player_id())])
.

hero_active() ->
	HeroNum = lib_hero_api:hero_num(),
	case length(lib_troops_api:hero_id_list()) < HeroNum andalso HeroNum =< lib_troops_api:troops_limit() of
		true -> player_troops();
		false -> skip
	end
.

player_troops() ->
	TroopsIdList = lib_troops_api:troops_id_list(),
	lib_troops_api:async(fun lib_troops_api:troops/1, [TroopsIdList], fun lib_player_troops:respond_player_troops/1)
.

%%计算粮草累加，时间最大
calculate_foodstuff_and_time(ConsumeList) ->
	lists:foldl(
		fun(#{foodstuff := Foodstuff, city_times := TotalTime}, {Time1, Foodstuff1}) ->
			Time = lists:sum(TotalTime),
			{?IIF(Time1 > Time, Time1, Time), Foodstuff1 + Foodstuff}
		end, {0, 0}, ConsumeList)
.

troops_march_to_proto(Troops) ->
	#troops{
		troops_id = TroopsId,
		combat_hero = #combat_hero{id = PlayerId, hero_id = HeroId},
		march = #{
			city_lists := CityLists,
			city_times := CityTimes,
			depart_tick := DepartTick
		}
	} = Troops,
	AllTime = lists:sum(CityTimes),
	#'ProtoTroopsNotice'{
		troops_id = TroopsId,
		player_id = PlayerId,
		hero_id = HeroId,
		city_list = CityLists,
		all_time = AllTime,
		remaining_time = DepartTick + AllTime - lib_timer:unixtime_ms(),
		total_time = CityTimes
	}
.

to_fighting(Type, TroopsIdList, Robots) ->
	CombatHeroes = [lib_troops_march:combat_hero(TroopsId) || TroopsId <- TroopsIdList],
	lib_combat_queue_api:sync_call_fight(#req_combat_queue{
		type = Type,
		l_fighters = CombatHeroes,
		r_fighters = Robots
	})
.

test() ->
	lib_troops:to_fighting(1003, [201], lib_combat_queue_api:robot_id_to_fighters(1000016), 6001001)
.

