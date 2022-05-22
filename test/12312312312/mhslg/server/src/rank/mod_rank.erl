%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_rank
%%% Created on : 2020/8/27 0027 16:04
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_rank).
-behavior(mod_server).
-author("glendy").
-include("common.hrl").
-include("rank.hrl").

-export([start_link/1, stop/1, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_process_name/1,
	get_pid/1,
	start_all/0,
	stop_all/0
]).

get_process_name(RankType) ->
	lib_types:to_atom("rank_" ++ lib_types:to_list(RankType)).

get_pid(RankType) ->
	ProcessName = get_process_name(RankType),
	erlang:whereis(ProcessName).

start_link(RankType) ->
	ProcessName = get_process_name(RankType),
	mod_server:start_link({local, ProcessName}, ?MODULE, [RankType], []).

stop(RankType) ->
	mod_server:sync_stop(get_pid(RankType)).

do_init([RankType]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(?RANK_FRESH_TIMEOUT, self(), fresh_timeout),
	erlang:send_after(?RANK_SAVE_TIMEOUT, self(), save_timeout),
	?INFO("mod_rank start: ~p", [RankType]),
	{ok, #rank_state{rank_type = RankType}}.

do_db_init(State, [RankType]) ->
	?DEBUG("rank load db: ~p", [RankType]),
	RankMap = db_rank:load_rank_list(RankType),
	NewState = lib_rank_base:fresh_rank_list(State#rank_state{rank_map = RankMap, fresh_flag = 1}),
	{noreply, NewState}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(fresh_timeout, State) ->
	erlang:send_after(?RANK_FRESH_TIMEOUT, self(), fresh_timeout),
	NewState = lib_rank_base:fresh_rank_list(State),
	{noreply, NewState};
do_info(save_timeout, State) ->
	erlang:send_after(?RANK_SAVE_TIMEOUT, self(), save_timeout),
	NewState = lib_rank_base:save_rank_list(State),
	{noreply, NewState};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, State) ->
	NewState0 = lib_rank_base:fresh_rank_list(State),
	lib_rank_base:save_rank_list(NewState0),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%% 启动所有的排行进程
start_all() ->
	start_all(tb_rank:get_list()).
start_all([]) ->
	ok;
start_all([RankType | T]) ->
	RegName = get_process_name(RankType),
	server_sup:start_child(RegName, mod_rank, start_link, [RankType], transient),
	start_all(T).

%% 停止所有的排行进程
stop_all() ->
	stop_all(tb_rank:get_list()).
stop_all([]) ->
	ok;
stop_all([RankType | T]) ->
	mod_rank:stop(RankType),
	stop_all(T).

