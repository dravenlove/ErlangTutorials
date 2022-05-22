%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_cluster_send
%%% Created on : 2020/8/31 0031 16:29
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_cluster_send).
-author("glendy").
-include("common.hrl").
-include("cluster.hrl").

%% API
-export([ %% 跨服使用接口
	server_type_async_apply/4,		%% 指定类型的全部服务器异步执行方法
	all_server_async_apply/3,		%% 全部单服异步执行方法
	group_server_async_apply/4,		%% 组中全部单服异步调用方法
	single_async_apply/4,			%% 跨服指定单服进程异步调用方法
	player_async_apply/4,			%% 跨服指定玩家进程异步调用方法
	respond_to_client/3,			%% 跨服返回消息给客户端
	respond_to_client/4				%% 跨服返回消息给客户端
]).

-export([ %% 单服使用接口
	cluster_async_apply/3,			%% 单服指定跨服进程异步调用方法
	cluster_sync_apply/3,			%% 单服指定跨服进程同步调用方法
	world_async_apply/3,			%% 单服指定世界服进程异步调用方法
	world_sync_apply/3,				%% 单服指定世界服进程同步调用方法
	other_server_sync_apply/4		%% 单服指定其他单服进程异步调用方法
]).

get_cluster_node() ->
	lib_cluster_node:get_cluster_node()
.

%% 指定类型的全部服务器异步执行方法
server_type_async_apply(ServerTypeList, RegName, Fun, Args) ->
	GameNodeList = lib_cluster_node:get_game_node_list(),

	NewGameNodeList = 
	lists:filter(fun(GameNode) ->
		lists:member(GameNode#game_node.server_type, ServerTypeList)
	end, GameNodeList),

	lists:map(fun(GameNode) ->
		mod_server:async_apply({RegName, GameNode#game_node.node}, Fun, Args)
	end, NewGameNodeList)
.

%% 全部单服异步执行方法
all_server_async_apply(RegName, Fun, Args) ->
	server_type_async_apply([?SERVER_TYPE_GAME, ?SERVER_TYPE_TEST], RegName, Fun, Args)
.

%% 组中全部单服异步调用方法
group_server_async_apply(GroupId, RegName, Fun, Args) ->
	ServerFlagList = lib_cluster_grouop:group_server_flag_list(GroupId),
	lists:map(fun(ServerFlag) -> 
		case lib_cluster_node:get_node(ServerFlag) of
			undefined -> pass;
			Node -> mod_server:async_apply({RegName, Node}, Fun, Args)
		end
	end, ServerFlagList)
.

%% 跨服指定单服进程异步调用方法
single_async_apply(ServerFlag, RegName, Func, Args) ->
	ClusterTypeList = [?SERVER_TYPE_CLUSTER, ?SERVER_TYPE_WORLD],
	case lists:member(config:server_type(), ClusterTypeList) of
		true ->
			case lib_cluster_node:get_node(ServerFlag) of
				undefined -> ?WARNING("no rout back to single: ~p ~p ~p ~p", [ServerFlag, RegName, Func, Args]);
				Node ->
					mod_server:async_apply({RegName, Node}, Func, Args)
			end;
		false ->
			mod_server:async_apply(RegName, Func, Args)
	end.

%% 跨服指定玩家进程异步调用方法
player_async_apply(ServerFlag, PlayerId, Func, Args) ->
	RegName = lib_player:get_process_name(PlayerId),
	single_async_apply(ServerFlag, RegName, Func, Args).

%% 跨服返回消息给客户端
respond_to_client(ServerFlag, PlayerId, Msg) ->
	player_async_apply(ServerFlag, PlayerId, fun lib_send:respond_to_client/1, [Msg]).
respond_to_client(ServerFlag, PlayerId, Msg, ErrCode) ->
	player_async_apply(ServerFlag, PlayerId, fun lib_send:respond_to_client/2, [Msg, ErrCode]).


%% 单服指定跨服进程异步调用方法
cluster_async_apply(RegName, Func, Args) ->
	ClusterNode = get_cluster_node(),
	mod_server:async_apply({RegName, ClusterNode}, Func, Args).

%% 单服指定跨服进程同步调用方法
cluster_sync_apply(RegName, Func, Args) ->
	ClusterNode = get_cluster_node(),
	mod_server:sync_apply({RegName, ClusterNode}, Func, Args).

%% 单服指定世界服进程异步调用方法
world_async_apply(RegName, Func, Args) ->
	WorldNode = config:world_node(),
	mod_server:async_apply({RegName, WorldNode}, Func, Args).

%% 单服指定世界服进程同步调用方法
world_sync_apply(RegName, Func, Args) ->
	WorldNode = config:world_node(),
	mod_server:sync_apply({RegName, WorldNode}, Func, Args).

%% 单服指定其他单服进程异步调用方法
other_server_sync_apply(ServerFlag, RegName, Func, Args) ->
	cluster_async_apply(mod_cluster, fun single_async_apply/4, [ServerFlag, RegName, Func, Args])
.