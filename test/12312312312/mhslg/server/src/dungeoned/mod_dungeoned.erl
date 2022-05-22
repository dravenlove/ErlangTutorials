%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_dungeoned.erl
%% Created on : 2019-07-12 17:00:00
%% Author: Jiuan
%% Last Modified: 2019-07-12 17:00:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_dungeoned).
-behaviour(mod_server).
-include("common.hrl").
-include("player.hrl").
-include("dungeoned.hrl").
-export([get_pid/0, start/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	async_apply/2
]).
-define(SORT_RANK_TIMEOUT, 10 * 1000).
-record(dungeoned_state, {}).

get_pid() ->
	erlang:whereis(?MODULE).

start() ->
	mongo_poolboy:ensure_index(?MMO_POOL, ?DB_DUNGEONED, {?TUPLE_INT(<<"index">> , 1)}, true),
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:stop(?MODULE).

do_init([]) ->
	{ok, #dungeoned_state{}}.

do_db_init(State, _Args) ->
	Dungeoned = db_dungeoned:load_dungeoned(),
	lib_dungeoned:put_dungeoned(Dungeoned),
	erlang:send_after(?SORT_RANK_TIMEOUT, self(), sort_rank),
	NextNineTime = lib_timer:next_nine_time(),
	?INFO("dungeoned settle ~p~n", [NextNineTime]),
	erlang:send_after(NextNineTime * 1000, self(), settle),
	case lib_dungeoned:get_is_settle() of
		true ->
			erlang:send_after((lib_timer:current_zero_unixtime() - lib_timer:unixtime()) * 1000, self(), new_round);
		_ ->
			skip
	end,
	maps:fold(fun(RoleId,Fight,_)->
		case Fight#dungeoned_fight.state =:= ?FIGHT_STATE_FIGHTING of
			true -> lib_dungeoned:put_fight_map(maps:remove(RoleId,lib_dungeoned:get_fight_map()));
			false-> skip
		end
	end,0,lib_dungeoned:get_fight_map()),
	{noreply, State}.

do_cast({combat_queue_callback, CallbackData}, State) ->
	lib_dungeoned:fight_callback(CallbackData),
	{noreply, State};
do_cast(_Info, State) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
    {reply,State,State}.

do_info(sort_rank, State) ->
	erlang:send_after(?SORT_RANK_TIMEOUT, self(), sort_rank),
	lib_dungeoned:sort_rank(),
	{noreply, State};
do_info(settle, State) ->
	?INFO("dungeoned settle~n", []),
	erlang:send_after(lib_timer:day_second() * 1000, self(), settle),
	lib_dungeoned:settle_rank(),
	{noreply, State};
do_info(new_round, State) ->
	?INFO("dungeoned new_round~n", []),
	lib_dungeoned:new_round(),
	{noreply, State};
do_info(clean_rank, State) ->
	lib_dungeoned:put_rank_list([]),
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, _State) ->
	db_dungeoned:save_dungeoned(lib_dungeoned:get_dungeoned()),
	?INFO("mod_dungeoned stop ~n").

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%%玩家进程接口 异步调用
async_apply(Fun, Args) ->
	mod_server:async_apply(?MODULE, Fun, Args).