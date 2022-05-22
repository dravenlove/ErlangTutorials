%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_league_manager
%%% Created on : 2020/8/15 0015 13:08
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_league_manager).
-behavior(mod_server).
-author("glendy").
-include("log.hrl").
-include("league.hrl").

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0,
	sync_all_league_async_stop/1
]).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(?MODULE).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(60 * 1000, self(), check_timeout),
	{ok, #league_manage_state{}}.

do_db_init(State, []) ->
	{LeagueIdMap, LeagueNameMap, PlayerLeagueMap} = db_league:load_all_league_for_manage(),
	maps:fold(
		fun(LeagueId, _, Acc0) ->
			LeagueProgressName = mod_league:get_process_name(LeagueId),
			server_sup:start_child(LeagueProgressName, mod_league, start_link, [LeagueId, false]),
			Acc0
		end, ok, LeagueIdMap),
	{noreply, State#league_manage_state{
		league_id_name_map = LeagueIdMap,
		league_name_id_map = LeagueNameMap,
		player_league_map = PlayerLeagueMap
	}}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(check_timeout, State) ->
	erlang:send_after(60 * 1000, self(), check_timeout),
	NewState0 = check_wait_create_timeout(State),
	{noreply, NewState0};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, _State) ->
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

get_pid() ->
	erlang:whereis(?MODULE).

sync_all_league_async_stop(State) ->
	#league_manage_state{
		league_id_name_map = LeagueIdMap
	} = State,
	maps:fold(
		fun(LeagueId, _, AccLeagueList0) ->
			LeaguePid = mod_league:get_pid(LeagueId),
			mod_server:stop(LeaguePid),
			[LeagueId | AccLeagueList0]
		end, [], LeagueIdMap).

check_wait_create_timeout(State) ->
	#league_manage_state{
		wait_create_league_map = WaitCreateMap,
		player_league_map = PlayerLeagueMap,
		league_name_id_map = LeagueNameMap
	} = State,
	NowTick = lib_timer:unixtime(),
	{NewWaitCreateMap, NewPlayerLeagueMap, NewLeagueNameMap} = maps:fold(
		fun(PlayerId, WaitLeague, {AccWaitCreateMap0, AccPlayerLeagueMap0, AccLeagueNameMap0}) ->
			if
				WaitLeague#wait_league.timeout_tick =< NowTick ->
					?INFO("create league timeout: ~w", [WaitLeague]),
					AccWaitCreateMap1 = maps:remove(PlayerId, AccLeagueNameMap0),
					AccPlayerLeagueMap1 = maps:remove(PlayerId, AccPlayerLeagueMap0),
					AccLeagueNameMap1 = maps:remove(WaitLeague#wait_league.league_name, AccLeagueNameMap0),
					{AccWaitCreateMap1, AccPlayerLeagueMap1, AccLeagueNameMap1};
				true ->
					{AccWaitCreateMap0, AccPlayerLeagueMap0, AccLeagueNameMap0}
			end
		end, {WaitCreateMap, PlayerLeagueMap, LeagueNameMap}, WaitCreateMap),
	State#league_manage_state{
		wait_create_league_map = NewWaitCreateMap,
		player_league_map = NewPlayerLeagueMap,
		league_name_id_map = NewLeagueNameMap
	}.
