%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%	地图城池进程，管理城池区块
%%% @end
%%% Created : 26. Aug 2021 10:16 AM
%%%-------------------------------------------------------------------
-module(mod_city).
-author("lichaoyu").
-include("log.hrl").
-include("troop.hrl").
-include("map.hrl").
-include("combat_queue.hrl").


%% API
-export([start/0, stop/0, pid/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	get_troop_info/1,
	create_troop/1,
	troop_march/3
]).

start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], [])
.

stop() ->
	mod_server:sync_stop(?MODULE)
.

pid() ->
	whereis(?MODULE)
.

do_init([]) ->
	?DEBUG("mod_city_init: ~p ~n",[1]),
	{ok, undefined}
.

do_db_init(State, _Args) ->
	erlang:send_after(1000, self(), init),
	put(troop_info, maps:new()),
	{noreply, State}
.

do_call(_Info, _From, State) ->
	{reply, State, State}
.

do_cast({update_troop, Troop}, State) ->
	TroopInfo = get(troop_info),
	PlayerId = Troop#troop.combat_hero#combat_hero.id,
	HeroId = Troop#troop.combat_hero#combat_hero.hero_id,
	Troops = maps:get(PlayerId, TroopInfo, #{}),
	NewTroops = maps:put(HeroId, Troop, Troops),
	NewTroopInfo = maps:put(PlayerId, NewTroops, TroopInfo),
	put(troop_info, NewTroopInfo),
	{noreply, State}
;
do_cast({delete_troop, Troop}, State) ->
	TroopInfo = get(troop_info),
	PlayerId = Troop#troop.combat_hero#combat_hero.id,
	HeroId = Troop#troop.combat_hero#combat_hero.hero_id,
	Troops = maps:get(PlayerId, TroopInfo, #{}),
	NewTroops = maps:remove(HeroId, Troops),
	NewTroopInfo = maps:put(PlayerId, NewTroops, TroopInfo),
	put(troop_info, NewTroopInfo),
	{noreply, State}
;
do_cast(_Info, State) ->
	{noreply, State}
.

do_info(init, State) ->
	Config = "1",	%% todo 配置获取
	BlockList = lib_block:block_list(Config),
	lib_block:block_run(BlockList),
	[mod_block:start_link(Block) || Block <- BlockList],
	erlang:garbage_collect(),
	{noreply, State}
;
do_info(_Info, State) ->
	{noreply, State}
.

do_terminate(_Reason, _State) ->
	ok
.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}
.

get_troop_info(PlayerId) ->
	TroopInfo = get(troop_info),
	maps:get(PlayerId, TroopInfo, #{})
.

create_troop(Troop) ->
	TroopInfo = get(troop_info),
	CombatHero = Troop#troop.combat_hero,
	PlayerId = CombatHero#combat_hero.id,
	HeroId = CombatHero#combat_hero.hero_id,
	Country = CombatHero#combat_hero.country,
	%% todo
	Capital = 6010001 + Country * 100,

	Troops = maps:get(PlayerId, TroopInfo, #{}),
	case maps:is_key(HeroId, Troops) of
		true -> false;
		false ->
			NewTroop = Troop#troop{city_id = Capital},
			NewTroops = maps:put(HeroId, NewTroop, Troops),
			NewTroopInfo = maps:put(PlayerId, NewTroops, TroopInfo),
			put(troop_info, NewTroopInfo),
			Pid = lib_player:get_pid(PlayerId),
			mod_server:async_apply(Pid, fun lib_player_troop:notice_troop/2, [0, [NewTroop]]),
			true
	end
.

troop_march(PlayerId, HeroId, PosList) ->
	TroopInfo = get(troop_info),
	Troops = maps:get(PlayerId, TroopInfo, #{}),
	case maps:find(HeroId, Troops) of
		error -> false;
		{ok, Troop} ->
			NewTroop = Troop#troop{pos_list = PosList},
			Pid = lib_block:pid(NewTroop#troop.city_id),
			mod_server:cast(Pid, {troop_march, NewTroop}),
			true
	end
.

