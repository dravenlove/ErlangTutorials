%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_combat_queue.erl
%% Created on : 2019-07-12 17:00:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-07-12 17:00:00
%% Description:
%% 回合制战斗进程管理器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_combat_queue).
-behaviour(mod_server).
-include("common.hrl").
-include("player.hrl").
-include("combat_queue.hrl").
-export([start/0, stop/0, start_link/1, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	combat_queue/3,
	join_combat_queue/5,
	quit_combat_queue/6,
	quic_combat_queue/4,
	insert_combat_buff/3,
	remove_combat_buff/3,
	restart_combat_queue/1,
	join_watching/2,
	quit_watching/2,
	request_rank/2
]).
-define(QUEUE_PROCESS_SIZE, 20).
-define(HANDLE_TINEOUT, 1 * 1000).

-record(combat_queue_state, {
	index = 0
}).
queue_process_pid(Index) ->
	erlang:whereis(queue_process_name(Index)).
queue_process_name(Index) ->
	lib_types:to_atom("queue_" ++ lib_types:to_list(Index)).

start() ->
	mongo_poolboy:ensure_index(?MMO_POOL, ?DB_COMBAT_QUEUE, {?TUPLE_INT(<<"index">> , 1)}, true),
	mongo_poolboy:ensure_index(?MMO_POOL, ?DB_FIGHT_RECORD, {?TUPLE_INT(<<"record_id">> , 1)}, true),
	lists:foreach(fun(Index) ->
		start_link(Index)
	end, lists:seq(1, ?QUEUE_PROCESS_SIZE)).

stop() ->
	lists:foreach(fun(Index) ->
		mod_server:stop(queue_process_pid(Index))
	end, lists:seq(1, ?QUEUE_PROCESS_SIZE)).

start_link(Index) ->
	ProgressName = queue_process_name(Index),
	mod_server:start_link({local, ProgressName}, ?MODULE, [Index], []).

do_init([Index]) ->
	?INFO("mod_combat_queue started : ~p  [~p]~n", [self(), Index]),
	{ok, #combat_queue_state{index = Index}}.

do_db_init(State, _Args) ->
	CombatQueue = db_combat_queue:load_combat_queue(State#combat_queue_state.index),
	lib_combat_queue:put_combat_queue(CombatQueue),
	erlang:send_after(?HANDLE_TINEOUT, self(), handle),
	{noreply, State}.


do_cast({fight_result, FightResult, ProtoDetail}, State) ->
	lib_combat_queue:fight_result(FightResult, ProtoDetail),
	{noreply, State};
do_cast({combat_queue, CombatQueueId, ReqCombatQueue, CallBackModule}, State) ->
	?INFO("start combat_queue ~p~n", [CombatQueueId]),
	lib_combat_queue:new_combat_queue(CombatQueueId, ReqCombatQueue, CallBackModule),
	{noreply, State};
do_cast({join_combat_queue, CombatQueueId, Fighters, CallBackModule, Params}, State) ->
	lib_combat_queue:join_combat_queue(CombatQueueId, Fighters, CallBackModule, Params),
	{noreply, State};
do_cast({quit_combat_queue, CombatQueueId, PlayerShow, HeroId, CallBackModule, Params}, State) ->
	lib_combat_queue:quit_combat_queue(CombatQueueId, PlayerShow, HeroId, CallBackModule, Params),
	{noreply, State};
do_cast({quic_combat_queue, CombatQueueId, CallBackModule, Params}, State) ->
	lib_combat_queue:quic_combat_queue(CombatQueueId, CallBackModule, Params),
	{noreply, State};
do_cast({insert_combat_buff, CombatQueueId, InsertType, BuffList}, State) ->
	lib_combat_queue:insert_combat_buff(CombatQueueId, InsertType, BuffList),
	{noreply, State};
do_cast({remove_combat_buff, CombatQueueId, RemoveType, BuffList}, State) ->
	lib_combat_queue:remove_combat_buff(CombatQueueId, RemoveType, BuffList),
	{noreply, State};
do_cast({join_watching, CombatQueueId, PlayerData}, State) ->
	lib_combat_queue:join_watching(CombatQueueId, PlayerData),
	{noreply, State};
do_cast({quit_watching, CombatQueueId, PlayerId}, State) ->
	lib_combat_queue:quit_watching(CombatQueueId, PlayerId),
	{noreply, State};
do_cast({restart_combat_queue, CombatQueueId}, State) ->
	lib_combat_queue:restart_combat_queue(CombatQueueId),
	{noreply, State};
do_cast({request_rank, CombatQueueId, PlayerId}, State) ->
	lib_combat_queue:request_rank(CombatQueueId, PlayerId),
	{noreply, State};
do_cast(_Info, State) ->
	{noreply, State}.

do_call({join_combat_queue, CombatQueueId, Fighters}, _From, State) ->
	CallbackFlag =
	try
		lists:foreach(fun(Fighter) ->
			lib_combat_queue:join_combat_queue(CombatQueueId, Fighter)
		end, lists:reverse(Fighters)),
		true
	catch
	    _:_  -> false
	end,
	{reply,CallbackFlag,State};
do_call({quit_combat_queue, CombatQueueId, PlayerShow, HeroId}, _From, State) ->
	CallbackFlag =
	try
		lib_combat_queue:quit_combat_queue(CombatQueueId, PlayerShow, HeroId),
		true
	catch
		_:_  -> false
	end,
	{reply,CallbackFlag,State};
do_call({quic_combat_queue, CombatQueueId}, _From, State) ->
	CallbackFlag =
	try
		lib_combat_queue:quic_combat_queue(CombatQueueId),
		true
	catch
		_:_  -> false
	end,
	{reply,CallbackFlag,State};
do_call(_Info, _From, State) ->
    {reply,State,State}.

do_info(handle, State) ->
	lib_combat_queue:handle(),
	erlang:send_after(?HANDLE_TINEOUT, self(), handle),
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, State) ->
	CombatQueue = lib_combat_queue:get_combat_queue(),
	db_combat_queue:save_combat_queue(State#combat_queue_state.index, CombatQueue),
	?INFO("mod_combat_queue stop ~n").

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

get_combat_index(CombatId) ->
	CombatId rem ?QUEUE_PROCESS_SIZE + 1.


combat_queue(ReqCombatQueue, ReqWay, CallBackModule) ->
	?INFO("ReqWay ~p",[ReqWay]),
	if
		ReqWay =:= sync ->
			lib_combat_queue:call_fight(ReqCombatQueue, CallBackModule);
		ReqWay =:= async ->
			Conf = tb_fight:get(ReqCombatQueue#req_combat_queue.type),
			NewReqCombatQueue = ReqCombatQueue#req_combat_queue{
				interval_type = maps:get(interval_type, Conf),
				interval = maps:get(interval, Conf),
				count_down = maps:get(count_down, Conf),
				drums_limit = maps:get(drums_limit, Conf)
			},
			CombatQueueId = lib_counter:get_combat_queue_id(),
			mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {combat_queue, CombatQueueId, NewReqCombatQueue, CallBackModule}),
			CombatQueueId;
		true -> ?ERROR("request combat queue Params error: ~p~n", [ReqWay]), error
	end.

join_combat_queue(CombatQueueId, Fighters, ReqWay, CallBackModule, Params) ->
	if
		ReqWay =:= sync ->
			mod_server:call(queue_process_pid(get_combat_index(CombatQueueId)), {join_combat_queue, CombatQueueId, Fighters});
		ReqWay =:= async ->
			mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {join_combat_queue, CombatQueueId, Fighters, CallBackModule, Params});
		true -> ?ERROR("request join combat queue Params error: ~p~n", [ReqWay]), error
	end.


quit_combat_queue(CombatQueueId, PlayerShow, HeroId, ReqWay, CallBackModule, Params) ->
	if
		ReqWay =:= sync ->
			mod_server:call(queue_process_pid(get_combat_index(CombatQueueId)), {quit_combat_queue, CombatQueueId, PlayerShow, HeroId});
		ReqWay =:= async ->
			mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {quit_combat_queue, CombatQueueId, PlayerShow, HeroId, CallBackModule, Params});
		true -> ?ERROR("request quit combat queue Params error: ~p~n", [ReqWay]), error
	end.


quic_combat_queue(CombatQueueId, ReqWay, CallBackModule, Params) ->
	if
		ReqWay =:= sync ->
			mod_server:call(queue_process_pid(get_combat_index(CombatQueueId)), {quic_combat_queue, CombatQueueId});
		ReqWay =:= async ->
			mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {quic_combat_queue, CombatQueueId, CallBackModule, Params});
		true -> ?ERROR("request quic combat queue Params error: ~p~n", [ReqWay]), error
	end.

insert_combat_buff(CombatQueueId, InsertType, BuffList) ->
	mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {insert_combat_buff, CombatQueueId, InsertType, BuffList}).

remove_combat_buff(CombatQueueId, RemoveType, BuffList) ->
	mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {remove_combat_buff, CombatQueueId, RemoveType, BuffList}).

join_watching(CombatQueueId, PlayerBase) ->
	mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {join_watching, CombatQueueId, #watching_player{
		id = PlayerBase#player_base.id,
		sid = PlayerBase#player_base.sid,
		country = PlayerBase#player_base.country
	}}).
quit_watching(CombatQueueId, PlayerId) ->
	mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {quit_watching, CombatQueueId, PlayerId}).

restart_combat_queue(CombatQueueId) ->
	mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {restart_combat_queue, CombatQueueId}).

request_rank(CombatQueueId, PlayerId) ->
	mod_server:cast(queue_process_pid(get_combat_index(CombatQueueId)), {request_rank, CombatQueueId, PlayerId}).