%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_server
%%% Created on : 2020/7/29 0029 21:05
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_server).
-author("glendy").
-include("common.hrl").
%%-include("ProtoClient_10100.hrl").

%% API
-export([
	start/0,
	stop/0
]).

start() ->
	net_kernel:set_net_ticktime(600),			 %% 节点心跳时间间隔
	start_common(),

	case config:server_type() of
		?SERVER_TYPE_MERGE -> start_as_merge();
		?SERVER_TYPE_WORLD ->
			start_as_world(),
			server_sup:start_child(mod_global_timer, mod_global_timer, start_link, [], transient);
		?SERVER_TYPE_CLUSTER ->
			start_as_cluster(),
			server_sup:start_child(mod_global_timer, mod_global_timer, start_link, [], transient);
		?SERVER_TYPE_GAME ->
			start_as_single(),
			server_sup:start_child(mod_global_timer, mod_global_timer, start_link, [], transient);
		?SERVER_TYPE_TEST ->
			start_as_single(),
			server_sup:start_child(mod_global_timer, mod_global_timer, start_link, [], transient)
	end,
%%	start_as_cluster(),
	lib_game_cache:set_service_start_tick(),
	ok.

start_common() ->
	server_sup:start_child(mod_logger, mod_logger, start_link, [], transient),
	server_sup:start_child(mod_http_request, mod_http_request, start_link, [], transient),
	mod_mongodb:start_link(?MMO_POOL),
	mod_mongodb:start_link(?BACK_POOL),
	lib_ets:init(),
	lib_config_api:reload(),
	lib_mongodb:build_index(),
	lib_counter:init(),
	server_sup:start_child(mod_fight_manager, mod_fight_manager, start_link, [], transient),
	mod_combat_queue:start(),

	ok.

%% 游戏单服启动代码
start_as_single() ->
	try
		LoopMap = lib_season:single_init(),
		mod_season:start_link(LoopMap)
	catch
		Type : Reason ->
			?ERROR("mod season init error ~p:~p, ~p", [Type, Reason, erlang:get_stacktrace()]),
			case config:server_type() of
				?SERVER_TYPE_TEST -> skip;
				_ -> main:stop()
			end
	end,

	db_player_base:all_player_offline(),
	db_player_mail:delete_overtime_offline_mail(),
	server_sup:start_child(mod_cluster, mod_cluster, start_link, [], transient),
	server_sup:start_child(mod_serial, mod_serial, start_link, [], transient),
%%	server_sup:start_child(mod_chat, mod_chat, start_link, [], transient),
	mod_chat_block:start(),
	mod_backstage_chat_limit:start(),
	mod_chat:start_link(),

	server_sup:start_child(mod_player_manage, mod_player_manage, start_link, [], transient),
	server_sup:start_child(mod_league_manager, mod_league_manager, start_link, [], transient),
	server_sup:start_child(mod_friend, mod_friend, start_link, [], transient),
	server_sup:start_child(mod_backactivity, mod_backactivity, start_link, [], transient),
	%%mod_rank:start_all(),
	server_sup:start_child(mod_backban, mod_backban, start_link, [], transient),
	server_sup:start_child(mod_backmail, mod_backmail, start_link, [], transient),
	mod_accept:start(config:server_port(), lib_base_routing),
	% mod_backstage_activity_monitor:start(),
	mod_city:start(),
	mod_map:start(),	%%地图系统进程启动
	mod_country_rank:start_all(),
	mod_rank0:start_all(),
	mod_dungeoned:start(),
	mod_arena:start(),
	mod_expedition:start(), %%　探险进程(包含 龙殿寻宝)
	mod_alien:start_all(),
	mod_challenge:start(),	%% 擂台赛进程
	mod_meritorious_rank:start(),
	%%mod_honour_top:start(),
	mod_activity_monitor:start(),
	mod_mutual:start(),
	mod_season_activity:start(),
	ok.

%% 跨服启动代码
start_as_cluster() ->
	LoopMap = lib_season:cluster_init(),
	mod_season:start_link(LoopMap),

	% mod_cluster_gamegroup:start(),
	% server_sup:start_child(mod_cluster_backgroup, mod_cluster_backgroup, start_link, [], transient),
	server_sup:start_child(mod_cluster, mod_cluster, start_link, [], transient),
	server_sup:start_child(mod_cluster_group, mod_cluster_group, start_link, [], transient),

	RunList = [
		fun mod_activity_monitor:start/0
	],

	lib_common:try_run(RunList),
	ok.

%% 大世界启动代码
start_as_world() ->
	LoopMap = lib_season:world_init(),
	mod_season:start_link(LoopMap),

	server_sup:start_child(mod_cluster, mod_cluster, start_link, [], transient),

	RunList = [
		fun mod_activity_monitor:start/0
	],

	lib_common:try_run(RunList)
.

stop() ->
	?INFO("game stop..."),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> stop_as_merge();
		?SERVER_TYPE_WORLD -> 
			stop_as_world(),
			mod_global_timer:stop();
		?SERVER_TYPE_CLUSTER ->
			stop_as_cluster(),
			mod_global_timer:stop();
		?SERVER_TYPE_GAME ->
			stop_as_single(),
			mod_global_timer:stop();
		?SERVER_TYPE_TEST ->
			stop_as_single(),
			mod_global_timer:stop()
	end,
%%	stop_as_cluster(),
	stop_common(),
	ok.

stop_common() ->
	mod_combat_queue:stop(),
	mod_http_request:stop(),
	mod_mongodb:stop(?MMO_POOL),
	mod_mongodb:stop(?BACK_POOL),
	mod_logger:stop(),
	ok.

%% 游戏单服停服保存的代码
stop_as_single() ->
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_logout/1),
	PlayerList = mod_server:sync_status(mod_player_manage:get_pid(), fun mod_player_manage:sync_all_player_list/1),
	check_all_player_offline(PlayerList),
	mod_player_manage:stop(),
	LeagueList = mod_server:sync_status(mod_league_manager:get_pid(), fun mod_league_manager:sync_all_league_async_stop/1),

	ApplyList = [
		{fun check_all_league_stop/1, [LeagueList]},
		{fun mod_league_manager:stop/0, []},
		{fun mod_friend:stop/0, []},
		{fun mod_backactivity:stop/0, []},
		%%{fun mod_rank:stop_all/0, []},
		{fun mod_backban:stop/0, []},
		{fun mod_backmail:stop/0, []},
		% {fun mod_backstage_activity_monitor:stop/0, []},
		{fun mod_cluster:stop/0, []},
		{fun mod_serial:stop/0, []},
		{fun mod_map:stop/0, []},
		{fun mod_country_rank:stop_all/0, []},
		{fun mod_rank0:stop_all/0, []},
		{fun mod_chat:stop/0,[]},
		{fun mod_chat_block:stop/0,[]},
		{fun mod_backstage_chat_limit:stop/0,[]},
		{fun mod_dungeoned:stop/0,[]},
		{fun mod_expedition:stop/0,[]},
		fun mod_arena:stop/0,
		fun mod_alien:stop_all/0,
		fun mod_challenge:stop/0,
		fun mod_meritorious_rank:stop/0,
		fun mod_honour_top:stop/0,
		fun mod_activity_monitor:stop/0,

		fun mod_season:stop/0
	],
	lib_common:try_run(ApplyList),
	ok.

%% 跨服停服保存的代码
stop_as_cluster() ->
	RunList = [

		fun mod_activity_monitor:stop/0,

		fun mod_cluster:stop/0,
		fun mod_cluster_group:stop/0,
		fun mod_season:stop/0
	],

	lib_common:try_run(RunList),
	ok.

stop_as_world() ->
	RunList = [

		fun mod_activity_monitor:stop/0,

		fun mod_cluster:stop/0,
		fun mod_season:stop/0
	],

	lib_common:try_run(RunList)
.

start_as_merge() ->
	server_sup:start_child(mod_merge, mod_merge, start_link, [], transient),
	main:stop(),
	ok.

stop_as_merge() ->
	mod_merge:stop(),
	mod_merge_mongodb:stop(),
	ok.


check_process_stoped(Pid) ->
	lib_timer:sleep(1000),
	case erlang:is_pid(Pid) andalso erlang:is_process_alive(Pid) of
		false -> skip;
		true -> check_process_stoped(Pid)
	end.

check_all_player_offline([]) ->
	ok;
check_all_player_offline([{_, PlayerRegName} | T]) ->
	PlayerPid = erlang:whereis(PlayerRegName),
	check_process_stoped(PlayerPid),
	check_all_player_offline(T).

check_all_league_stop([]) ->
	ok;
check_all_league_stop([LeagueId | T]) ->
	LeaguePid = mod_league:get_pid(LeagueId),
	check_process_stoped(LeaguePid),
	check_all_league_stop(T).