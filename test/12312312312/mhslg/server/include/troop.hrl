%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 27. Aug 2021 5:52 PM
%%%-------------------------------------------------------------------

-ifndef('troop_HRL').
-define('troop_HRL', true).

-define(TROOP_CITY,		0).
-define(TROOP_STOP,		1).
-define(TROOP_MOVE,		2).
-define(TROOP_COMBAT,	3).

-record(troop, {	%% 新部队数据
	x,					%% x坐标
	y,					%% y坐标
	state = 0,
	pos_list = [],		%% 路径坐标[{x,y}]
	city_id = 0,
	combat_hero

}).

-endif.
