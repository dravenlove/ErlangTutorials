%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_fight_manager.erl
%% Created on : 2019-07-12 17:00:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-07-12 17:00:00
%% Description:
%% 战斗进程管理器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_fight_manager).
-behaviour(mod_server).
-include("common.hrl").
-include("fight.hrl").
-export([start/0, start_link/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	fetch_fight_pid/0,
	giveback_fight/1,
	handle/0,
	fight/1,
	fight/2
]).

-record(fight_manager_state, {
	auto_id = 0,
	used_list = [],
	free_list = []
}).

start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], []).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	?INFO("mod_fight_manager started [~p]~n", [self()]),
	{ok, #fight_manager_state{}}.

do_db_init(State, _Args) ->
	{noreply, State}.

do_cast({giveback, Pid}, #fight_manager_state{used_list = UsedList, free_list = FreeList} = State) ->
	mod_server:cast(Pid, {clear_process_dict}),
	NewUsedList = lists:delete(Pid, UsedList),
	{noreply, State#fight_manager_state{used_list = NewUsedList, free_list = [Pid | FreeList]}};
do_cast({stop_free_fight}, State) ->
	NewState = stop_free_fight_process(State),
	{noreply, NewState};
do_cast(_Info, State) ->
	{noreply, State}.

do_call({select_pid}, _From, #fight_manager_state{auto_id = AutoId, used_list = UsedList, free_list = FreeList} = State) ->
	{Pid, NewAutoId, NewUsedList, NewFreeList} =
		if
			length(FreeList) > 0 ->
				[Pid0 | NewFreeList0] = FreeList,
				{Pid0, AutoId, [Pid0 | UsedList], NewFreeList0};
			true ->
				PName = lib_types:to_atom("fight_" ++ lib_types:to_list(AutoId + 1)),
				{ok, Pid0} = mod_fight:start(PName),
				{Pid0, AutoId + 1, [Pid0 | UsedList], FreeList}
		end,
	{reply, Pid, State#fight_manager_state{auto_id = NewAutoId, used_list = NewUsedList, free_list = NewFreeList}};
do_call(_Info, _From, State) ->
	{reply,State,State}.

do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, _State) ->
	?INFO("mod_fight_manager stop ~n").

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

fetch_fight_pid() ->
	mod_server:call(?MODULE, {select_pid}).

giveback_fight(Pid) ->
	mod_server:cast(?MODULE, {giveback, Pid}).

%% 每天六点停止过多的空闲回合战斗进程, 回收超过当前used_list一半的数量的空闲进程
stop_free_fight_process(#fight_manager_state{used_list = UsedList, free_list = FreeList} = State) ->
	UsedLen = length(UsedList) div 2,
	FreeLen = length(FreeList),
	NewFreeList =
		if
			UsedLen =< 0 -> FreeList;
			FreeLen > UsedLen -> stop_free_fight_process(FreeList, FreeLen - UsedLen);
			true -> FreeList
		end,
	State#fight_manager_state{free_list = NewFreeList}.

stop_free_fight_process(FreeList, 0) ->
	FreeList;
stop_free_fight_process([Pid | T], Len) ->
	mod_server:cast(Pid, stop),
	?INFO("stop free fight [~p]~n", Pid),
	stop_free_fight_process(T, Len - 1).

handle() ->
	mod_server:cast(?MODULE, {stop_free_fight}).

fight(CombatQueue) ->
	fight(CombatQueue, async).
fight(CombatQueue, Type) ->
	if
		Type =:= async -> mod_server:cast(fetch_fight_pid(), {fight, CombatQueue, erlang:self()});
		Type =:= sync -> mod_server:call(fetch_fight_pid(), {fight, CombatQueue}, 100 * 1000);
		true -> ?ERROR("fight error type:~p~n", [Type])
	end.