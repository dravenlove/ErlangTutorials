%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_ets
%%% Created on : 2020/7/30 0030 20:32
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_ets).
-author("glendy").
-include("base.hrl").
-include("ets.hrl").
-include("player.hrl").

%% API
-export([
	init/0
]).

init() ->
	ets:new(?ETS_GLOBAL_CACHE, ?ETS_OPTIONS_KEYPOS1),
	lib_cluster_node:ets_init(),
	lib_friend_base:ets_init(),
	lib_season:init_ets(),
	lists:foreach(
		fun(#player_handler{ets_init_func = Func}) ->
			if
				Func =/= undefined -> Func();
				true -> skip
			end
		end, lib_player_handler:get_handlers()),
	ok.
