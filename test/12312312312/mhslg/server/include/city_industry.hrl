%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 03. Feb 2021 4:13 PM
%%%-------------------------------------------------------------------

-ifndef('city_industry_HRL').
-define('city_industry_HRL', true).

-define(CITY_INDUSTRY_UPDATE, 0).
-define(CITY_INDUSTRY_DELETE, 1).

-define(INDUSTRY_NO,		0).	%% 不能作业
-define(INDUSTRY_GET_ITEM,	1).	%% 作业获得物品
-define(INDUSTRY_GET_PIECES,2).	%% 作业获得当前英雄的碎片

-record(city_industry, {
	id = 0,
	hold_tick = 0,		%% 占领时的时间秒
	last_tick = 0,		%% 上一次领取的时间秒
	work_time = 0,		%% 产业作业次数
	reset_tick = 0		%% 产业作业次数重置时间秒
}).

-record(player_city_industry, {
	id = 0,
	total_map = maps:new(),		%% 产业类型作业次数，type => num
	city_industry = dict:new()	%% [CityId * 100 + Index | #city_industry{}]
}).

-endif.
