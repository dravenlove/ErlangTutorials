%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_friend
%%% Created on : 2020/8/21 0021 11:33
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		好友服务进程
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_friend).
-behavior(mod_server).
-author("glendy").
-include("common.hrl").
-include("friend.hrl").

-define(SAVE_FRIEND_TIMEOUT, 10 * 1000).
-define(CLEAR_CACHE_FRIEND_TIMEOUT, 10 * 1000).

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0
]).

get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(get_pid()).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(?SAVE_FRIEND_TIMEOUT, self(), save_timeout),
	erlang:send_after(?CLEAR_CACHE_FRIEND_TIMEOUT, self(), clear_cache_timeout),
	{ok, #friend_state{}}.

do_db_init(State, _Args) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(save_timeout, State) ->
	erlang:send_after(?SAVE_FRIEND_TIMEOUT, self(), save_timeout),
	save_friend_list(),
	{noreply, State};
do_info(clear_cache_timeout, State) ->
	erlang:send_after(?CLEAR_CACHE_FRIEND_TIMEOUT, self(), clear_cache_timeout),
	save_friend_list(),
	clear_friend_cache(),
	{noreply, State};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	save_friend_list(),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

save_friend_list() ->
	CacheMap = lib_friend_base:get_friend_player_save_map(),
	maps:fold(
		fun(Id, _, Acc0) ->
			Friend = lib_friend_base:get_friend(Id),
			db_player_friend:save_player_friend(Friend),
			Acc0
		end, ok, CacheMap),
	lib_friend_base:put_friend_player_save_map(#{}).

clear_friend_cache() ->
	CacheMap = lib_friend_base:get_friend_cache_map(),
	CacheList = lists:sort(fun friend_cache_tick_cmp/2, maps:to_list(CacheMap)),
	NowTick = lib_timer:unixtime(),
	clear_friend_cache(NowTick, CacheList).

friend_cache_tick_cmp(Left, Right) ->
	{LeftId, LeftTick} = Left,
	{RightId, RightTick} = Right,
	try
		?JUDGE_RETURN(LeftTick =:= RightTick, LeftTick < RightTick),
	    LeftId < RightId
	catch
	    throw:{error, Flag} -> Flag
	end.

clear_friend_cache(_NowTick, []) ->
	ok;
clear_friend_cache(NowTick, [{Id, CacheTick} | T]) ->
	if
		CacheTick =< NowTick ->
			lib_friend_base:remove_friend(Id),
			lib_friend_base:remove_friend_cache_tick(Id),
			clear_friend_cache(NowTick, T);
		true ->
			clear_friend_cache(NowTick, [])
	end.