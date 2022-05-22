%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: cluster
%%% Created on : 2020/8/31 0031 16:28
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('cluster_HRL').
-define('cluster_HRL', true).

-define(LOOP_TIME, (600 * 1000)).        %% 检查跨服连接的间隔时间

-define(SYNC_NODE_TO_BACKGROUP, 1).		%% 同步#game_node到mod_cluster_backgroup
-define(SYNC_NODE_TO_GAMEGROUP, 2).		%% 同步#game_node到mod_cluster_gamegroup

-define(SYNC_GAMEGROUP_BY_UPDATE, 1).		%% 后台更新分组
-define(SYNC_GAMEGROUP_BY_AUTOGROUP, 2).	%% 自动分组
-define(SYNC_GAMEGROUP_BY_STATE, 3).		%% 状态更新
-define(SYNC_GAMEGROUP_BY_COMGINE, 4).		%% 合服更新分组

-record(server_info, {
	server_flag = "",	%% 服务器标识
	server_name = "",	%% 服务器名
	server_prev = "",	%% 服务器前缀
	open_tick = 0		%% 开服时间戳
}).

-record(game_node, {
	server_id = 0,
	server_flag = <<"">>,	%% 最新的合服标识或新服标识
	server_type = undefined,%% 服务器类型
	open_tick = 0,			%% 该服最早的开服时间
	season = 0,				%% 赛季
	alive_tick = 0,			%% 用于跨服对该节点的存活检查
	node = undefined,		%% 本节点的node信息
	src_server_flags = [],	%% 源单服server_flag列表, 用来查找要合并的服信息, 格式: [<<"server_flag">>]
	src_server_prevs = [],	%% 详细的服务器前缀列表
	version = "",		%% 单服版本号
	is_remove = 0	%% 是否已删除 0 没删除, 1删除
}).

-record(cluster_group, {
	group_id = 0,
	server_list = [],
	update_tick = 0
}).

-record(cluster_server, {
	server_flag = "",
	country = 0
}).

-endif.
