%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: merge
%%% Created on : 2020/10/16 16:00
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('merge_HRL').
-define('merge_HRL', true).

-define(ETS_PLAYER_RENAME, ets_player_rename).
-define(ETS_PLAYER_NAME_COUNT, ets_player_name_count).
-define(ETS_LEAGUE_RENAME, ets_league_rename).
-define(ETS_LEAGUE_NAME_COUNT, ets_league_name_count).

-record(merge_mongo_state, {
	index = 0,
	master_mmo = #{},   %% #{conn =>连接对象, is_close=>true|false, mongoargs=>连接参数}
	master_backstage = #{},
	slave = []     %%[{mmo#{}, backstage#{}}]
}).

-record(player_rename, {
	id = 0,          %% 玩家id
	name = "",       %% 原玩家名
	rename = ""      %% 玩家改名
}).

-record(league_rename, {
	id = 0,         %% 联盟id
	name = "",      %% 原联盟名
	rename = ""     %% 联盟改名
}).

-endif.
