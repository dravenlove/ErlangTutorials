%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_flag
%%% Created on : 2020/8/27 0027 20:49
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_flag).
-author("glendy").
-include("common.hrl").
-include("rank.hrl").

-define(PLAYER_FLAG(Type), {player_flag, Type}).
-define(RANK_PLAYER_FLAG(RankType), {rank_player_flag, RankType}).

%% API
-export([
	set_player_force_flag/1,
	get_player_force_flag/0,

	set_player_show_flag/1,
	get_player_show_flag/0,

	set_player_level_flag/1,
	get_player_level_flag/0
]).

-export([
	set_rank_player_level/1,
	get_rank_player_level/0,

	set_rank_player_force/1,
	get_rank_player_force/0
]).

put_player_flag(Type, Val) ->
	erlang:put(?PLAYER_FLAG(Type), Val).

get_player_flag(Type) ->
	case erlang:get(?PLAYER_FLAG(Type)) of
		undefined -> 0;
		Val -> Val
	end.

%% 战力更新标识
set_player_force_flag(Val) ->
	put_player_flag(player_force, Val).
get_player_force_flag() ->
	get_player_flag(player_force).

%% #ProtoShowRole显示模型信息更新标识
set_player_show_flag(Val) ->
	put_player_flag(player_show, Val).
get_player_show_flag() ->
	get_player_flag(player_show).

%% 等级更新标识
set_player_level_flag(Val) ->
	put_player_flag(player_level, Val).
get_player_level_flag() ->
	get_player_flag(player_level).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 排行更新标识
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
put_rank_player_flag(RankType, Val) ->
	erlang:put(?RANK_PLAYER_FLAG(RankType), Val).
get_rank_player_flag(RankType) ->
	case erlang:get(?RANK_PLAYER_FLAG(RankType)) of
		undefined -> 0;
		Val -> Val
	end.

%% 等级排行更新标识
set_rank_player_level(Val) ->
	put_rank_player_flag(?RANK_PLAYER_LEVEL, Val).
get_rank_player_level() ->
	get_rank_player_flag(?RANK_PLAYER_LEVEL).

%% 战力排行更新标识
set_rank_player_force(Val) ->
	put_rank_player_flag(?RANK_PLAYER_FORCE, Val).
get_rank_player_force() ->
	get_rank_player_flag(?RANK_PLAYER_FORCE).



