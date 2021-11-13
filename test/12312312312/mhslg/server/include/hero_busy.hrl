%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Feb 2021 5:19 PM
%%%-------------------------------------------------------------------

-ifndef('hero_busy_HRL').
-define('hero_busy_HRL', true).

-define(NOTICE_HERO_BUSY_UPDATE, 0).
-define(NOTICE_HERO_BUSY_DELETE, 1).

-define(TYPE_1, 1).		%% 建设
-define(TYPE_2, 2).		%% 征税
-define(TYPE_3, 3).		%% 屯田
-define(TYPE_4, 4).		%% 伐木
-define(TYPE_5, 5).		%% 挖矿
-define(TYPE_6, 6).		%% 围猎
-define(TYPE_7, 7).		%% 拜访

%% 忙碌类型
-define(CITY_BUILDING,	1).	%% 城池建设，param = [BuildingId, Choose]
-define(CITY_INDUSTRY,	2).	%% 产业作业，param = []
-define(CITY_VISITING,	3).	%% 城池拜访，param = []
-define(CITY_OTHER,		3).	%% 其他

-record(player_hero_busy, {
	id = 0,
	pasture_limit = [],				%% 牧场限制英雄id列表，每天重置
	incident_time = maps:new(),		%% 事件触发次数type => val，每天重置
	hero_busy_dict = dict:new()		%% 忙碌的英雄[heroId | #hero_busy{}]
}).

-record(hero_busy, {
	hero_id = 0,		%% 英雄id
	type = 0,			%% 忙碌类型
	city_id = 0,		%% 城池id或产业id
	incident = 0,		%% 触发的事件id
	start_tick = 0,		%% 创建的tick秒
	param = [],			%% 参数
	finish_tick = 0		%% 完成的tick秒
}).

-endif.
