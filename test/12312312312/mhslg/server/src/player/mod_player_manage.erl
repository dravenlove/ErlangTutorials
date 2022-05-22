%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_player_manage
%%% Created on : 2020/8/5 0005 16:48
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		用于管理全局玩家的停服下线和玩家的ets缓存定时清除
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_player_manage).
-behavior(mod_server).
-author("glendy").
-include("common.hrl").
-include("map.hrl").

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0,
	async_player_login/5,
	async_player_logout/3,
	async_player_cache/2,
	async_all_player_logout/1,
	sync_all_player_list/1,
	async_all_player_notify/2,
	async_country_player_notify/3,
	async_country_player_fun/4
]).

-record(player_manage_state, {
	player_map = #{},		%% key: player_id, value: process_name
	player_sid_map = #{},	%% key: player_id, value: player_sid
	cache_player_map = #{},	%% key: player_id, value: tick
	player_country_pid_map = lists:foldl(fun(Country, Maps) -> maps:put(Country, [], Maps) end, #{}, lib_map_api:player_country()) %% key: country_id, value: pid_list
}).


get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(get_pid()).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(1800 * 1000, self(), clear_cache_timer),
	{ok, #player_manage_state{}}.

do_db_init(State, _Args) ->
	{noreply, State}.
do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(clear_cache_timer, #player_manage_state{cache_player_map = CachePlayerMap} = State) ->
	erlang:send_after(1800 * 1000, self(), clear_cache_timer),
	NewCachePlayerMap = clear_ets_cache(CachePlayerMap),
	{noreply, State#player_manage_state{cache_player_map = NewCachePlayerMap}};


do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

async_player_login(#player_manage_state{player_map = PlayerMap, cache_player_map = CachePlayerMap, player_sid_map = PlayerSidMap, player_country_pid_map = PlayerCountryPidMap} = State, PlayerId, PlayerRegName, PlayerSid, CountryId) ->
	NewState = State#player_manage_state{
		player_map = maps:put(PlayerId, PlayerRegName, PlayerMap),
		player_sid_map = maps:put(PlayerId, PlayerSid, PlayerSidMap),
		cache_player_map = maps:put(PlayerId, lib_timer:unixtime(), CachePlayerMap),
		player_country_pid_map = maps:put(CountryId, [PlayerId | maps:get(CountryId, PlayerCountryPidMap)], PlayerCountryPidMap)
	},
	{ok, NewState}.

async_player_logout(#player_manage_state{player_map = PlayerMap, cache_player_map = CachePlayerMap, player_sid_map = PlayerSidMap, player_country_pid_map = PlayerCountryPidMap} = State, PlayerId, CountryId) ->
	NewState = State#player_manage_state{
		player_map = maps:remove(PlayerId, PlayerMap),
		player_sid_map = maps:remove(PlayerId, PlayerSidMap),
		cache_player_map = maps:put(PlayerId, lib_timer:unixtime(), CachePlayerMap),
		player_country_pid_map = maps:update(CountryId, lists:delete(PlayerId, maps:get(CountryId, PlayerCountryPidMap)), PlayerCountryPidMap)
	},
	{ok, NewState}.

async_player_cache(#player_manage_state{cache_player_map = CachePlayerMap} = State, PlayerId) ->
	NewState = State#player_manage_state{
		cache_player_map = maps:put(PlayerId, lib_timer:unixtime(), CachePlayerMap)
	},
	{ok, NewState}.

async_all_player_logout(#player_manage_state{player_map = PlayerMap}) ->
	maps:fold(
		fun(_PlayerId, PlayerRegName, Acc0) ->
			mod_server:stop(PlayerRegName),
			Acc0
		end, ok, PlayerMap).

sync_all_player_list(#player_manage_state{player_map = PlayerMap}) ->
	maps:to_list(PlayerMap).

cache_player_list_cmp(Left, Right) ->
	{LeftId, LeftTick} = Left,
	{RightId, RightTick} = Right,
	try
		?JUDGE_RETURN(LeftTick =:= RightTick, LeftTick < RightTick),
		LeftId < RightId
	catch
		throw:{error, Flag} -> Flag
	end.
clear_ets_cache(CachePlayerMap) ->
	PlayerList = lists:sort(fun cache_player_list_cmp/2, maps:to_list(CachePlayerMap)),
	NowTick = lib_timer:unixtime(),
	clear_ets_cache(CachePlayerMap, NowTick, PlayerList).
clear_ets_cache(CachePlayerMap, _NowTick, []) ->
	CachePlayerMap;
clear_ets_cache(CachePlayerMap, NowTick, [{PlayerId, Tick} | T]) ->
	if
		Tick + 1800 > NowTick -> CachePlayerMap;
		true ->
			lib_player_data:clear_cache(PlayerId),
			NewCachePlayerMap = maps:remove(PlayerId, CachePlayerMap),
			clear_ets_cache(NewCachePlayerMap, NowTick, T)
	end.

async_all_player_notify(#player_manage_state{player_sid_map = PlayerSidMap}, Msg) ->
	Bin = lib_msg:pack_to_bin(Msg),
	maps:fold(
		fun(_Id, Sid, Acc0) ->
			lib_send:broad_send_by_sid(Sid, Bin),
			Acc0
		end, ok, PlayerSidMap),
	ok.

%%根据国家通知消息
async_country_player_notify(#player_manage_state{player_country_pid_map = PlayerCountryPidMap}, CountryId, Msg) ->
	case maps:is_key(CountryId, PlayerCountryPidMap) of
		false -> skip;
		true ->
			[lib_send:respond_to_client_by_pid(lib_player:get_process_name(PlayerPid), Msg) || PlayerPid <- maps:get(CountryId, PlayerCountryPidMap)]
	end,
	ok.

%%根据国家执行
async_country_player_fun(#player_manage_state{player_country_pid_map = PlayerCountryPidMap}, CountryId, Fun, Args) ->
	case maps:is_key(CountryId, PlayerCountryPidMap) of
		false -> skip;
		true ->
			[mod_server:async_apply(lib_player:get_process_name(PlayerPid), Fun, Args) || PlayerPid <- maps:get(CountryId, PlayerCountryPidMap)]
	end,
	ok.
