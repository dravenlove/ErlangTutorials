%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_game_cache
%%% Created on : 2020/7/30 0030 20:31
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%	  跟游戏业务相关的缓存接口
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_game_cache).
-author("glendy").
-include("common.hrl").

%% API
-export([
	set_service_start_tick/0,
	get_service_start_tick/0,
	get_player_cache/2,
	get_player_cache/4,
	update_player_cache/3,
	update_player_cache/4,
	get_league_cache/1,
	get_league_member_cache/2
]).

-define(SERVER_START_TICK, server_start_tick).

%% 设置服务启动时间
set_service_start_tick() ->
	lib_cache:set(?SERVER_START_TICK, lib_timer:unixtime()).
%% 获取服务启动时间
get_service_start_tick() ->
	lib_cache:fetch(?SERVER_START_TICK).

get_player_cache(?ETS_PLAYER_FRIEND, PlayerId) ->
	case ets:lookup(?ETS_PLAYER_FRIEND, PlayerId) of
		[Data] ->
			?DEBUG("get from friend cache: ~p", [PlayerId]),
			Data;
		[] ->
			case db_player_friend:load_player_friend(PlayerId) of
				undefined -> undefined;
				DBData ->
					update_player_cache(?ETS_PLAYER_FRIEND, PlayerId, DBData, true),
					DBData
			end
	end;
get_player_cache(Ets, PlayerId) ->
	case lib_player_handler:get_handler(Ets) of
		#player_handler{load_func = LoadFunc} ->
			get_player_cache(Ets, PlayerId, LoadFunc, true);
		_ -> undefined
	end.
get_player_cache(Ets, PlayerId, LoadFunc, IsSyncManage) ->
	case ets:lookup(Ets, PlayerId) of
		[Data] ->
			?DEBUG("get from cache: ~p ~p", [Ets, PlayerId]),
			Data;
		[] ->
			DBData = LoadFunc(PlayerId),
			update_player_cache(Ets, PlayerId, DBData, IsSyncManage),
			DBData
	end.

update_player_cache(Ets, PlayerId, Data) ->
	update_player_cache(Ets, PlayerId, Data, true).
update_player_cache(Ets, PlayerId, Data, IsSyncManage) ->
	ets:insert(Ets, Data),
	if
		IsSyncManage =:= true ->
			mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_player_cache/2, [PlayerId]);
		true -> skip
	end.

get_league_cache(LeagueId) ->
	case ets:lookup(?ETS_LEAGUE, LeagueId) of
		[Data] ->
			Data;
		[] ->
			undefined
	end.

get_league_member_cache(LeagueId, MemberId) ->
	case ets:lookup(?ETS_LEAGUE_MEMBER, {LeagueId, MemberId}) of
		[Data] ->
			Data;
		[] ->
			undefined
	end.
