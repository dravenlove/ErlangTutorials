%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 11:12 AM
%%%-------------------------------------------------------------------
-author("df").
%% 大厅位置总数
-define(PLACE,5).

%% 需要开启的位置
-define(ONE_PLACE,	3).
-define(TWO_PLACE,	4).
-define(THREE_PLACE,5).

-record(holy_spirit_hall,{
	id = 0,				%% 玩家id
	hall = dict:new()	%% 大厅信息
}).

-record(hall,{
	id = 0,					%% 大厅id
	level = 1,				%% 大厅等级
	hall_skill_id = 0,		%% 大厅技能id
	battles = dict:new()	%% 阶级信息
}).

-record(battle,{
	place = 0,				%% 位置
	hero_id = 0,			%% 英雄id   0 为未上阵英雄  -1 为该位置未开启
	grade = 0
}).
