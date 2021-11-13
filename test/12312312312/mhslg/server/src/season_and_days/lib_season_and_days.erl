%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 11月 2020 20:29
%%%-------------------------------------------------------------------
-module(lib_season_and_days).
-author("df").
-include("player.hrl").
-include("ProtoClient_10122.hrl").
-include("common.hrl").
-include("season_and_day.hrl").


%% API


-export([
	request_season_info/0,
	request_season_and_day_info/0
]).



%%请求季节界面
request_season_info() ->
	Now_season = lib_season_and_days_api:get_season_info(),
	Msg = #'Proto50122001'{
		season = Now_season
	},
	lib_send:respond_to_client(Msg)
.



%% 请求赛季和天数信息
request_season_and_day_info() ->
	Now_season = lib_season_and_days_api:get_season(),
	Now_day = lib_season_and_days_api:get_season_day(),
	Word_season = lib_season_and_days_api:get_season_info(),
	Msg = #'Proto50122002'{
		season = Now_season,
		day = Now_day,
		word_season = Word_season
	},
	lib_send:respond_to_client(Msg),
	?INFO("Msg ~p",[Msg])
.