%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_server_info
%%% Created on : 2020/8/31 0031 17:19
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_server_info).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("cluster.hrl").

-define(SERVER_INFO_FLAG_LIST, server_info_flag_list).
-define(SERVER_INFO_PREV_LIST, server_info_prev_list).

%% API
-export([
	build_index/0,
	get_server_flags/0,
	put_server_flags/1,
	get_server_prevs/0,
	put_server_prevs/1,
	save_server_info/0,
	load_all_server_info/0
]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBSERVER_INFO, {?TUPLE_INT(<<"server_flag">>, 1)}, true),
	ok.

%% 服务器id和标识列表, 单服里执行的接口
get_server_flags() ->
	case erlang:get(?SERVER_INFO_FLAG_LIST) of
		undefined -> [];
		Val -> Val
	end.
put_server_flags(List) ->
	erlang:put(?SERVER_INFO_FLAG_LIST, List).

%% 服务器前缀列表, 单服里执行的接口
get_server_prevs() ->
	case erlang:get(?SERVER_INFO_PREV_LIST) of
		undefined -> [];
		Val -> Val
	end.
put_server_prevs(List) ->
	erlang:put(?SERVER_INFO_PREV_LIST, List).

save_server_info() ->
	PlayerBase = lib_player:get_player_base(),
	ServerInfo = #server_info{
		server_flag = PlayerBase#player_base.server_flag,
		server_name = PlayerBase#player_base.server_name,
		server_prev = PlayerBase#player_base.server_prev,
		open_tick = config:open_tick()
	},
	db_server_info:save_server_info(ServerInfo).

load_all_server_info() ->
	{ServerFlagList, PrevList} = db_server_info:load_all_server_info(),
	put_server_flags(lists:sort(ServerFlagList)),
	put_server_prevs(lists:sort(PrevList)).
