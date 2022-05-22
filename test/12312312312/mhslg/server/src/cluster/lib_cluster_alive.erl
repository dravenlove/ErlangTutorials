%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_cluster_alive
%%% Created on : 2020/8/31 0031 16:24
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		处理跨服连接的心跳
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_cluster_alive).
-author("glendy").
-include("common.hrl").
-include("cluster.hrl").

-define(ALIVE_TIMEOUT_SEC, 1800).

%% API
-export([
	ping_cluster/0,
	ping_test_cluster/0,
	ping_world/0,
	check_game_node_alive/0
]).

%% 单服调用接口
ping_cluster() ->
	try
		do_ping_cluster(false)
	catch
		_:Reason ->
			?WARNING("ping_cluster fail,Reason:~w",[Reason]),
			10 * 1000
	end.

%% 测试单服调用接口
ping_test_cluster() ->
	try
		do_ping_cluster(true)
	catch
		_:Reason ->
			?WARNING("ping_cluster fail,Reason:~w",[Reason]),
			10*1000
	end.

ping_world() ->
	try 
		TypeList = [?SERVER_TYPE_TEST, ?SERVER_TYPE_GAME, ?SERVER_TYPE_CLUSTER],
		?JUDGE_RETURN(lists:member(config:server_type(), TypeList), -1),

		WorldNode = config:world_node(),
		case net_adm:ping(WorldNode) of
			pong ->
				OpenTick = config:open_tick(),
				NowTick = lib_timer:unixtime(),
				try
					?JUDGE_RETURN(OpenTick =< NowTick, -1),
					lib_cluster_node:async_game_node_to_cluster(WorldNode),
					?INFO("pond world node: ~p success ~n", [WorldNode]),
					ok
				catch
					throw:{error, Flag} -> Flag
				end,
				?LOOP_TIME;
			_Err ->
				?WARNING("============== ping world node:~p fail =============~n", [WorldNode]),
				10 * 1000
		end
	catch
		throw: _ -> 10 * 1000;
		Type: Reason ->
			?ERROR("ping world error ~p:~p, ~p", [Type, Reason, erlang:get_stacktrace()]) ,
			10 * 1000
	end
.

%% 跨服检查单服节点的存活
check_game_node_alive() ->
	CurTick = lib_timer:unixtime(),
	GameNodeList = lib_cluster_node:get_game_node_list(),
	RemoveNodeList = 
	lib_common:list_foldl(fun(GameNode, List) -> 
		?JUDGE_CONTINUE(GameNode#game_node.alive_tick + ?ALIVE_TIMEOUT_SEC < CurTick),
		[GameNode | List]
	end, [], GameNodeList),

	lists:map(fun(GameNode) -> 
		#game_node{
			server_flag = ServerFlag,
			node = Node,
			alive_tick = AliveTick
		} = GameNode,
		?INFO("~ts ~p no alive remove ~p", [ServerFlag, Node, AliveTick]),
		lib_cluster_node:remove_game_node(ServerFlag)	
	end, RemoveNodeList)
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_ping_cluster(IsTest) ->
	case config:server_type() of
		?SERVER_TYPE_WORLD -> ?LOOP_TIME;
		?SERVER_TYPE_CLUSTER -> ?LOOP_TIME;
		_ ->
			ClusterNode = lib_cluster_node:get_cluster_node(IsTest),
			case net_adm:ping(ClusterNode) of
				pong ->
					OpenTick = config:open_tick(),
					NowTick = lib_timer:unixtime(),
					try
						?JUDGE_RETURN(OpenTick =< NowTick, -1),
						lib_cluster_node:async_game_node_to_cluster(ClusterNode),
						?INFO("pond cluster node: ~p success test[~p] ~n", [ClusterNode, IsTest]),
						ok
					catch
						throw:{error, Flag} -> Flag
					end,
					?LOOP_TIME;
				_Err ->
					?WARNING("============== ping cluster node:~p fail test[~p] =============~n", [ClusterNode, IsTest]),
					10 * 1000
			end
	end.