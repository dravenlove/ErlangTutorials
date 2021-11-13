%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_cluster_node
%%% Created on : 2020/8/31 0031 16:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_cluster_node).
-author("glendy").
-include("common.hrl").
-include("cluster.hrl").

-define(GAME_NODE_SERVER_FLAG(Flag), {game_node_server_flag, Flag}).
-define(NODE_SERVER_FLAG(Flag), {node_server_flag, Flag}).
-define(GAME_NODE_CACHE_MAPS, game_node_cache_maps).

%% API
-export([
	ets_init/0,
	get_cluster_node/0,
	get_cluster_node/1,
	get_node/1,
	get_game_node/1,
	update_game_node/2,
	remove_game_node/1,
	get_game_node_list/0
	% load_all_game_node/0
	% save_cache_game_node/0
]).

-export([
	async_game_node_to_cluster/1,
	async_game_node/2
]).

ets_init() ->
	ets:new(?ETS_SERVER_NODE, ?ETS_OPTIONS_KEYPOS1),
	ets:new(?ETS_GAME_NODE, ?ETS_OPTIONS_KEYPOS1),
	ok.

server_game_node() ->
	#game_node{
		server_id = config:server_id(),
		server_flag = lib_types:to_binary(config:server_flag()),
		server_type = config:server_type(),
		open_tick = config:open_tick(),
		node = node(),
		src_server_flags = lib_server_info:get_server_flags(),
		src_server_prevs = lib_server_info:get_server_prevs(),
		version = game_version:v()
	}
.

get_cluster_node() ->
	get_cluster_node(false)
.
get_cluster_node(_IsTest) ->
	config:cluster_node().
%%	if
%%		IsTest =:= true -> config:cluster_node();
%%		true ->
%%			case global_data_ram:get(?CLUSTER_NODE, undefined) of
%%				undefined -> config:cluster_node();
%%				Node -> Node#cluster_node.node
%%			end
%%	end.

put_node(ServerFlag, Node) ->
	% erlang:put(?NODE_SERVER_FLAG(ServerFlag), Node),
	ets:insert(?ETS_SERVER_NODE, {lib_types:to_binary(ServerFlag), Node})
.

put_game_node(ServerFlag, GameNode) ->
	% erlang:put(?GAME_NODE_SERVER_FLAG(ServerFlag), GameNode)
	ets:insert(?ETS_GAME_NODE, {lib_types:to_binary(ServerFlag), GameNode})
.

get_node(ServerFlag) ->
	% erlang:get(?NODE_SERVER_FLAG(ServerFlag)).
	case ets:lookup(?ETS_SERVER_NODE, lib_types:to_binary(ServerFlag)) of
		[{_, Node}] -> Node;
		_ -> undefined
	end.

get_game_node(ServerFlag) ->
	% erlang:get(?GAME_NODE_SERVER_FLAG(ServerFlag)).
	case ets:lookup(?ETS_SERVER_NODE, lib_types:to_binary(ServerFlag)) of
		[{_, GameNode}] -> GameNode;
		_ -> undefined
	end
.

erase_node(ServerFlag) ->
	% erlang:erase(?NODE_SERVER_FLAG(ServerFlag))
	ets:delete(?ETS_SERVER_NODE, lib_types:to_binary(ServerFlag))
.

erase_game_node(ServerFlag) ->
	% erlang:erase(?GAME_NODE_SERVER_FLAG(ServerFlag))
	ets:delete(?ETS_GAME_NODE, lib_types:to_binary(ServerFlag))
.

update_game_node(GameNode, _IsSaveDb) ->
	#game_node{
		server_flag = ServerFlag,
		src_server_flags = SrcServerFlagList,
		node = Node
	} = GameNode,

	lists:foreach(
		fun(SrcServerFlag) ->
			erase_game_node(SrcServerFlag),
			put_node(SrcServerFlag, Node)
		end, SrcServerFlagList),
	put_game_node(ServerFlag, GameNode),
	put_node(ServerFlag, Node),
	% if
	% 	IsSaveDb =:= true -> insert_game_node_cache(ServerFlag);
	% 	true -> skip
	% end.
	skip.

remove_game_node(GameNode) ->
	#game_node{
		server_flag = ServerFlag,
		src_server_flags = SrcServerFlagList
	} = GameNode,
	erase_game_node(ServerFlag),
	erase_node(ServerFlag),
	lists:foreach(
		fun(SrcServerFlag) ->
			erase_game_node(SrcServerFlag),
			erase_node(SrcServerFlag)
		end, SrcServerFlagList).

get_game_node_list() ->
	[Node || {_, Node} <- ets:tab2list(?ETS_GAME_NODE)]
.

% get_game_node_cache_map() ->
% 	case erlang:get(?GAME_NODE_CACHE_MAPS) of
% 		undefined -> #{};
% 		Maps -> Maps
% 	end.

% put_game_node_cache_map(Maps) ->
% 	erlang:put(?GAME_NODE_CACHE_MAPS, Maps).

% insert_game_node_cache(ServerFlag) ->
% 	Maps = get_game_node_cache_map(),
% 	put_game_node_cache_map(maps:put(ServerFlag, 1, Maps)).

% load_all_game_node() ->
% 	GameNodeList = db_cluster_gamenode:load_all_game_node(),
% 	lists:foreach(
% 		fun(GameNode) ->
% 			update_game_node(GameNode, false)
% 		end, GameNodeList).

% save_cache_game_node() ->
% 	Maps = get_game_node_cache_map(),
% 	maps:fold(
% 		fun(ServerFlag, _, Acc0) ->
% 			case get_game_node(ServerFlag) of
% 				undefined ->
% 					db_cluster_gamenode:remove_game_node(ServerFlag);
% 				#game_node{server_flag = ServerFlag, is_remove = IsRemove} = GameNode ->
% 					if
% 						IsRemove =:= 1 ->
% 							remove_game_node(GameNode),
% 							db_cluster_gamenode:remove_game_node(ServerFlag);
% 						true ->
% 							db_cluster_gamenode:save_game_node(GameNode)
% 					end
% 			end,
% 			Acc0
% 		end, ok, Maps),
% 	put_game_node_cache_map(#{}).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 单服调用, 同步#game_node信息
async_game_node_to_cluster(ClusterNode) ->
	GameNode = server_game_node(),
	mod_server:async_apply({mod_cluster, ClusterNode}, fun lib_cluster_node:async_game_node/2, [GameNode, game_version:v()])
.

%% 跨服的mod_cluster进程里调用, 单服同步#game_node信息到跨服
async_game_node(GameNode, Version) ->
	try
		?INFO("node connected ~p ~p ~p ~p", [GameNode#game_node.server_flag, GameNode#game_node.node, Version, game_version:v()]),
		case Version =/= game_version:v() of
			true ->
				?WARNING("game node version different: ~ts ~p ~p ~p", [GameNode#game_node.server_flag, GameNode#game_node.node, Version, game_version:v()]),
				throw({error, -1});
			_ -> skip
		end,
		% OrgGameNode = get_game_node(GameNode#game_node.server_flag),
		NowTick = lib_timer:unixtime(),
		NewGameNode = GameNode#game_node{alive_tick = NowTick},
		update_game_node(NewGameNode, true),
		% ?JUDGE_RETURN(is_different_server_flag(OrgGameNode, NewGameNode) =:= true, -1),
		%% GameNode有变化，一般是合服或重启后，需要通知分组更新或记录当前游戏服
		pass
	catch
	    throw:{error, _ErrCode} -> skip
	end.

% is_different_server_flag(OrgGameNode, NewGameNode) ->
% 	try
% 		?JUDGE_RETURN(OrgGameNode =/= undefined, true),
% 		#game_node{
% 			node = OrgNode,
% 			server_flag = OrgServerFlag,
% 			src_server_flags = OrgSrcServerFlagList
% 		} = OrgGameNode,
% 		#game_node{
% 			node = NewNode,
% 			server_flag = NewServerFlag,
% 			src_server_flags = NewSrcServerFlagList
% 		} = NewGameNode,
% 		?JUDGE_RETURN(OrgNode =:= NewNode, true),
% 		?JUDGE_RETURN(OrgServerFlag =:= NewServerFlag, true),
% 		?JUDGE_RETURN(OrgSrcServerFlagList =:= NewSrcServerFlagList, true),
% 		false
% 	catch
% 	    throw:{error, Flag} -> Flag
% 	end.
