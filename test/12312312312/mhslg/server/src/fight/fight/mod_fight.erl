%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_onebyonefight.erl
%% Created on : 2019-07-02 17:17:00
%% Author: glendy ganby@163.com
%% Last Modified: 2019-07-02 17:17:00
%% Description:
%% 战斗公式解释器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_fight).
-behaviour(mod_server).
-include("common.hrl").
-include("combat_queue.hrl").
-export([start/1, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	fight_over/0
]).

-record(fight_state, {
	pname = undefined	%% 进程名
}).

start(PName) ->
	mod_server:start({local, PName}, ?MODULE, [PName], []).

do_init([PName]) ->
	?INFO("fight started [~p]~n", [PName]),
	{ok, #fight_state{pname = PName}}.

do_db_init(State, _Args) ->
	{noreply, State}.

do_cast({fight, CombatQueue, CallModule}, State) ->
	{Result, ProtoDetail} = lib_fight:fight(CombatQueue),
	mod_server:cast(CallModule, {fight_result, Result, ProtoDetail}),
	mod_fight_manager:giveback_fight(self()),
	{noreply, State};
do_cast({clear_process_dict}, State) ->
	clear_process_dict(),
	{noreply, State};
do_cast(_Info, State) ->
	{noreply, State}.

do_call({fight, CombatQueue}, _From, State) ->
	{Result, ProtoDetail} = lib_fight:fight(CombatQueue),
	mod_fight_manager:giveback_fight(self()),
	{reply,{Result, ProtoDetail},State};
do_call(_Info, _From, State) ->
    {reply,State,State}.

do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, _State) ->
    ?INFO("scene manager stop ~n").

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

fight_over() ->
	mod_fight_manager:giveback_fight(self()).

clear_process_dict() ->
	erlang:erase(hurt),
	erlang:erase(die_object),
	erlang:erase(cur_round),
	erlang:erase(rank_init),
	erlang:erase(combat_queue),
	erlang:erase(proto_fight_detail),
	erlang:erase(proto_fight),
	erlang:erase(proto_process),
	erlang:erase(proto_effect),
	erlang:erase(skill_prefix),
	erlang:erase(l_skill_active_times),
	erlang:erase(r_skill_active_times),
	rend.