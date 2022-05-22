%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_cluster
%%% Created on : 2020/8/31 0031 16:08
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		处理单服与跨服的心跳连接
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_cluster).
-behaviour(mod_server).
-author("glendy").
-include("common.hrl").

-record(cluster_state, {
	loop_timer_ref = undefined
}).

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
	mod_server:sync_stop(?MODULE).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	ok = net_kernel:monitor_nodes(true,[{node_type,all}]),
	{LoopTimerRef} =
		case config:server_type() of
			?SERVER_TYPE_WORLD ->
				erlang:send_after(1800 * 1000, self(), alive_check),
				erlang:send_after(180 * 1000, self(), cache_save),
				{undefined};
			?SERVER_TYPE_CLUSTER ->
				erlang:send_after(1800 * 1000, self(), alive_check),
				erlang:send_after(180 * 1000, self(), cache_save),
				erlang:send_after(10 * 1000, self(), ping_world),
				{undefined};
			?SERVER_TYPE_TEST ->
				erlang:send_after(10 * 1000, self(), ping_world),
				LoopTimerRef1 = erlang:send_after(10 * 1000, self(), ping_cluster),
				{LoopTimerRef1};
			?SERVER_TYPE_GAME ->
				% erlang:send_after(1000, self(), cluster_node),
				erlang:send_after(10 * 1000, self(), ping_world),
				LoopTimerRef2 = erlang:send_after(10 * 1000, self(), ping_cluster),
				{LoopTimerRef2}
		end,
	{ok, #cluster_state{loop_timer_ref = LoopTimerRef}}.

do_db_init(State, _Args) ->
	case config:server_type() of
		?SERVER_TYPE_WORLD ->
			skip;
		?SERVER_TYPE_CLUSTER ->
			lib_cluster_alive:ping_world(),
			%% 加载数据库读取game_node
			% lib_cluster_node:load_all_game_node();
%%			db_cluster:load_all_game_node(),
%%			?INFO("mod_cluster db loaded ~n"),
%%			lib_cluster_api:put_mod_cluster_start(true);
			skip;
		?SERVER_TYPE_TEST ->
			lib_server_info:load_all_server_info(),
			lib_cluster_alive:ping_test_cluster(),
			lib_cluster_alive:ping_world();
		?SERVER_TYPE_GAME ->
			lib_server_info:load_all_server_info(),
			lib_cluster_alive:ping_cluster(),
			lib_cluster_alive:ping_world();
		_ -> skip
	end,
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply, State, State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(ping_cluster, State) ->
	TimerRef0 = erlang:send_after(10 * 1000, self(), ping_cluster),
	TimerRef1 =
		case config:server_type() of
			?SERVER_TYPE_TEST ->
				%%测试服需要检查跨服是正式的还是测试，正式跨服拒绝连接
				NextMicroSec = lib_cluster_alive:ping_test_cluster(),
				erlang:cancel_timer(TimerRef0),
				erlang:send_after(NextMicroSec, self(), ping_cluster);
			?SERVER_TYPE_GAME ->
				NextMicroSec = lib_cluster_alive:ping_cluster(),
				erlang:cancel_timer(TimerRef0),
				erlang:send_after(NextMicroSec, self(), ping_cluster)
		end,
	{noreply, State#cluster_state{loop_timer_ref = TimerRef1}};
do_info(ping_world, State) ->
	NextMicroSec = lib_cluster_alive:ping_world(),
	erlang:send_after(NextMicroSec, self(), ping_world),

	{noreply, State}
;
do_info(alive_check, State) ->
	erlang:send_after(1800 * 1000, self(), alive_check),
	%% 检查当前存活节点哪些已没有心跳
	lib_cluster_alive:check_game_node_alive(),
	{noreply, State};
do_info(cache_save, State) ->
	erlang:send_after(180 * 1000, self(), cache_save),
	%% 定时保存存活的节点
	% lib_cluster_node:save_cache_game_node(),
	{noreply, State};
do_info({nodeup, Node}, State) ->
	?INFO("node connect ~p", [Node]),
	{noreply, State};
do_info({nodedown, Node}, State) ->
	?INFO("node disconnect ~p", [Node]),
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, _State) ->
	% lib_cluster_node:save_cache_game_node(),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.
