%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 28. Jul 2021 7:45 PM
%%%-------------------------------------------------------------------

-ifndef('clearing_HRL').
-define('clearing_HRL', true).

-define(TYPE_BOUNTY_MISSION,		1).		%% 赏金任务
-define(TYPE_PUPPET,				2).		%% 混沌傀儡
-define(TYPE_GOVERNMENT_TASK,		3).		%% 政务任务
-define(TYPE_ALIEN_INVASION,		4).		%% 异族入侵

-record(player_map_clearing, {	%% 玩家地图空地信息
	id = 0,						%% player_id
	city_indexes,				%% CityId => [ClearingId]
	map_clearing = dict:new()	%% [ClearingId | #map_clearing{}]
}).

-record(map_clearing, {		%% 空地信息
	id = "",
	type = 0,		%% 类型
	city_id = 0,	%% 城池id
	data			%% 数据
}).
-record(alien_invasion, {	%% 异族入侵
	combat_id = 0,	%% 战斗id
	num = 0,		%% 剩余数量
	conf_id = 0		%% 配置id
}).

-endif.
