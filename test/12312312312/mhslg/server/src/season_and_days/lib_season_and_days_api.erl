%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Dec 2020 5:20 PM
%%%-------------------------------------------------------------------
-module(lib_season_and_days_api).
-author("df").
-include("common.hrl").
-include("player.hrl").
-include("cluster.hrl").
-include("season_and_day.hrl").
%% API
-export([
	get_season/0,
	get_season_day/0,
	get_season_info/0,
	day/1,
	season/1,
	holiday_tick/1,
	holiday_tick/2,
	get_name_from_tb/1,

	cur_annual_start_tick/0,	%% 当前年度开始时间
	next_annual_start_tick/0,	%% 下个年度开始时间
	cur_season_start_tick/0,	%% 当前季度开始时间
	next_season_start_tick/0,	%% 下个季度开始时间

	next_season/1,				%% 下个季节开始时间
	next_season/2
]).

%% 获取当前赛季
get_season()->
	config:combine_time()
.

%% 获取赛季天数   过配置时间赛季天数 +1
get_season_day() ->day(lib_timer:unixtime()).

day(Tick) when is_integer(Tick) ->
	day(lib_timer:to_localtime(Tick));
day(Time) when is_tuple(Time) ->
	OpenTime = config:open_datetime(),	%% 由于开服日期时间为{0:0:0}
	{D, {H, _, _}} = calendar:time_difference(OpenTime, Time),
	case H < (lib_timer:refresh_time() div 3600) of true -> D; false -> D + 1 end
.


%% 获取季节信息 春夏秋冬 1234
get_season_info() -> season(lib_timer:unixtime()).

season(Tick) when is_integer(Tick) ->
	season(lib_timer:to_localtime(Tick));
season(Time) when is_tuple(Time) ->
	Day = day(Time),
	case Day rem 4 of
		0 -> ?WINTER;
		1 -> ?SPRING;
		2 -> ?SUMMER;
		3 -> ?AUTUMN
	end
.

holiday_tick(Holiday) ->
	NowTick = lib_timer:unixtime(),
	holiday_tick(Holiday, NowTick)
.
holiday_tick(Holiday, Tick) ->
	Holiday1 = list_to_atom(Holiday),
	{{Year,_,_},{_,_,_}} = lib_timer:to_localtime(Tick),
	case tb_holiday:get(Year) of
		false -> 0;
		YearConf -> maps:get(Holiday1, YearConf, 0)
	end
.

%% 活动节日对应的中文名
get_name_from_tb(Holiday) ->
	Holiday1 = list_to_atom(Holiday),
	#{'name' := Name} = tb_holiday_name:get(Holiday1),
	unicode:characters_to_list(Name, utf8)
.

cur_annual_start_tick() ->
	NowTick = lib_timer:unixtime(),
	Season = get_season_info(),
	{{Y,M,D},{_,_,_}} = lib_timer:to_localtime(NowTick - (Season - 1) * lib_timer:day_second()),
	Tick = lib_timer:unixtime({{Y,M,D},{0,0,0}}),
	#{'timevalue' := RefreshTime} = tb_const:get(refresh_time),
	Tick + RefreshTime.

next_annual_start_tick() ->
	cur_annual_start_tick() + 4 * lib_timer:day_second().

cur_season_start_tick() ->
	{{Y,M,D},{_,_,_}} = lib_timer:to_localtime(lib_timer:unixtime()),
	Tick = lib_timer:unixtime({{Y,M,D},{0,0,0}}),
	#{'timevalue' := RefreshTime} = tb_const:get(refresh_time),
	Tick + RefreshTime.

cur_season_start_tick(NowTick) ->
	{{Y,M,D},{_,_,_}} = lib_timer:to_localtime(NowTick),
	Tick = lib_timer:unixtime({{Y,M,D},{0,0,0}}),
	#{'timevalue' := RefreshTime} = tb_const:get(refresh_time),
	Tick + RefreshTime.

next_season_start_tick() ->
	cur_season_start_tick() + lib_timer:day_second().

next_season(Season) ->
	Tick = lib_timer:unixtime(),
	next_season(Season,Tick)
.

next_season(Season,Tick) ->
	NowSeason = season(Tick),
	Day =
	case Season > NowSeason of
		 true -> Season - NowSeason;
		 false-> 4 - (NowSeason - Season)
	end,
	cur_season_start_tick(Tick) + Day * lib_timer:day_second()
.
