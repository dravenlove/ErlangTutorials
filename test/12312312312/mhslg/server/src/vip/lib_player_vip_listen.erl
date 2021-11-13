%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_vip_listen
%%% Created on : 2020/8/28 0028 18:12
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_vip_listen).
-author("glendy").
-include("common.hrl").

%% API
-export([
	listen_vip_level_up/3
]).

%% 其他功能在vip升级时调用, 每升一级调用一次
listen_vip_level_up(PlayerId, OldVipLevel, NewVipLevel) ->
	?DEBUG("player vip level up: ~p ~p -> ~p", [PlayerId, OldVipLevel, NewVipLevel]),
	lib_player_flag:set_player_show_flag(1),
	ok.
