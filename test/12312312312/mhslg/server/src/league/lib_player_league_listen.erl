%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_league_listen
%%% Created on : 2020/8/18 0018 17:03
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		其他功能加入的监听接口, 在玩家进程里调用
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_league_listen).
-author("glendy").
-include("common.hrl").
-include("league.hrl").

%% API
-export([
	listen_player_league_change/3,
	listen_player_position_change/3,
	listen_league_level_change/3,
	listen_league_name_change/3
]).

%% 联盟id有变化时调用
listen_player_league_change(_OpType, _OldPlayerLeague, _NewPlayerleague) ->
	lib_player_flag:set_player_show_flag(1),
	ok.

%% 所在联盟的职位有变化时调用
listen_player_position_change(_OpType, _OldPlayerLeague, _NewPlayerleague) ->
	lib_player_flag:set_player_show_flag(1),
	ok.

%% 所在联盟的等级有变化时调用
listen_league_level_change(_OpType, _OldPlayerLeague, _NewPlayerleague) ->
	lib_player_flag:set_player_show_flag(1),
	ok.

%% 所在联盟的名字有变化时调用
listen_league_name_change(_OpType, _OldPlayerLeague, _NewPlayerleague) ->
	lib_player_flag:set_player_show_flag(1),
	ok.
