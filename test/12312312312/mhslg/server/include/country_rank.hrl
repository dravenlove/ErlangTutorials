%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 1月 2021 11:11
%%%-------------------------------------------------------------------
-author("13661").

-define(RANK_TYPE_LEVEL, 		1).
-define(RANK_TYPE_FORCE, 		2).
-define(RANK_TYPE_KILLS, 		3).
-define(RANK_TYPE_BUILD,		4).
-define(RANK_TYPE_BE_KILLS,		5).
-define(RANK_TYPE_LIST, [?RANK_TYPE_LEVEL, ?RANK_TYPE_FORCE, ?RANK_TYPE_KILLS, ?RANK_TYPE_BUILD, ?RANK_TYPE_BE_KILLS]).

-define(RANK_MAX_NUMBER, 100).

-record(ranker, {
	rank_type = 0,		%% 排行类型
	rank = 0,			%% 排名

	id = 0,				%% 玩家ID
	show = 0,			%% #player_show
	value1 = 0,			%% 值1
	value2 = 0,			%% 值2
	update_tick = 0,	%% 值更新时间

	is_online = false,	%% 是否在线
	sign_in_tick = 0,	%% 登陆时间
	sign_out_tick = 0	%% 登出时间
}).

-record(rank, {
	country_id = 0,				%% 国家ID
	type = 0,					%% 排行类型
	rank_list = [],				%% 待定
	ranker_map = maps:new()		%% 玩家MAP PlayerId => #ranker
}).

-record(rank_state, {
	country_id = 0,
	type = 0
}).