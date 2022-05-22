%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Feb 2021 10:06 AM
%%%-------------------------------------------------------------------
-module(lib_player_city_visiting).
-author("lichaoyu").
-include("common.hrl").
-include("hero_busy.hrl").
-include("city_visiting.hrl").
-include("ProtoClient_10141.hrl").

%% API
-export([
	request_hero_visiting/1,		%% 请求英雄城池拜访
	request_city_visiting_info/0,	%% 请求城池拜访信息
	notice_city_visiting/1
]).

-export([
	put_city_visiting/1,
	get_city_visiting/0,
	player_city_visiting_handler/0,
	clear/0,
	test/0
]).

-define(STATE_TIME, 0).		%% 等待时间
-define(STATE_MONEY, 1).	%% 使用元宝

put_city_visiting(CityVisiting) ->
	put_city_visiting(CityVisiting, true).
put_city_visiting(CityVisiting, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_CITY_VISITING),
	erlang:put(?ETS_PLAYER_CITY_VISITING, CityVisiting).

get_city_visiting() ->
	erlang:get(?ETS_PLAYER_CITY_VISITING).

ets_init() ->
	ets:new(?ETS_PLAYER_CITY_VISITING, [?ETS_KEY_POS(#player_city_visiting.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_CITY_VISITING, {?TUPLE_INT(id, 1)}, true).

player_city_visiting_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_CITY_VISITING,
		table_name = ?DBPLAYER_CITY_VISITING,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_city_visiting:load_player_city_visiting/1,
		save_func = fun db_city_visiting:save_player_city_visiting/1,
		get_func = fun get_city_visiting/0,
		put_func = fun put_city_visiting/2
	}.

clear() ->
	PlayerCityVisiting = get_city_visiting(),
	put_city_visiting(PlayerCityVisiting#player_city_visiting{city_visiting = maps:new()})
.

request_hero_visiting(Msg) ->
	#'Proto10141001'{
		city_id = CityId,
		hero_id = HeroId,
		type = Type
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_127), ?ERROR_MANSION_LEVEL),
	?JUDGE_RETURN(lib_map_api:is_cityId(CityId), ?ERROR_CONFIG_NOT_EXISTENT),
	?JUDGE_RETURN(lib_bounty_mission_api:is_finish(CityId), ?ERROR_BOUNTY_MISSION),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	lib_hero_busy_api:is_correct(HeroId, ?CITY_VISITING, CityId, 0),
	Num = lib_city_visiting_api:num() - lib_city_visiting_api:visiting_num(CityId),
	?JUDGE_RETURN(Num > 0, ?ERROR_CITY_VISITING_ID),
	VisitingHero = lib_map_api:sync(fun lib_city_visiting_api:visiting_hero/2, [CityId, lib_player:player_country()]),
	?JUDGE_RETURN(VisitingHero =/= 0, ?ERROR_CITY_VISITING_ID),
	?JUDGE_RETURN(HeroId =/= VisitingHero, ?ERROR_HERO_VISITING_SAME),

	Consume = maps:get(jsonvalue, tb_visiting_const:get(item)),
	NowTick = lib_timer:unixtime(),
	Time = lib_city_visiting_api:time(),
	{FinishTick, NewConsume} =
		case Type of
			?STATE_TIME -> {NowTick + Time, Consume};
			?STATE_MONEY -> {NowTick, [[?GOLD_ID, lib_equip_api:time_to_gold(Time)] | Consume]}
	 	end,
	lib_equip_api:item(NewConsume, ?USE_CITY_VISITING, CityId),
	HeroBusy = #hero_busy{
		hero_id = HeroId,
		type = ?CITY_VISITING,
		city_id = CityId,
		incident = lib_hero_busy_api:incident(?TYPE_7),
		start_tick = NowTick,
		param = [VisitingHero],
		finish_tick = FinishTick
	},
	lib_hero_busy_api:u_hero_busy(HeroBusy),
	lib_player_process:process_city_visiting(CityId),
	lib_city_visiting_api:add_visiting_num(CityId, 1),
	Res = #'Proto80141002'{
		city_visiting = #'ProtoCityVisiting'{
			city_id = CityId,
			hero = VisitingHero,
			num = Num - 1
		}
	},
	lib_send:respond_to_client(Res)
.

request_city_visiting_info() ->
	lib_map_api:async(fun lib_map:get_city_visiting/0, [], fun respond_city_visiting_info/1)
.
respond_city_visiting_info(CityVisitingMap) ->
	Num = lib_city_visiting_api:num(),
	CityVisitingList = maps:fold(
		fun(CityId, HeroId, List) ->
			[#'ProtoCityVisiting'{
				city_id = CityId,
				hero = HeroId,
				num = Num - lib_city_visiting_api:visiting_num(CityId)
			} | List]
		end, [], CityVisitingMap),
	Res = #'Proto50141002'{
		city_visiting = CityVisitingList
	},
	lib_send:respond_to_client(Res)
.
notice_city_visiting(CityVisitingMap) ->
	CityVisitingList = maps:fold(
		fun(CityId, HeroId, List) ->
			[#'ProtoCityVisiting'{
				city_id = CityId,
				hero = HeroId,
				num = 1
			} | List]
		end, [], CityVisitingMap),
	Res = #'Proto50141002'{
		city_visiting = CityVisitingList
	},
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_notify/2, [Res])
.

test() ->
	A = lib_timer:unixtime_ms(),
	f(10000, 0),
	?DEBUG("~p", [lib_timer:unixtime_ms() - A])
.
f(0, M) -> M;
f(N, _M) -> f(N - 1, lib_player_map:request_all_map()).
