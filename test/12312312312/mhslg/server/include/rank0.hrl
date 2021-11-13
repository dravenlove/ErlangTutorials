%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 1月 2021 11:11
%%%-------------------------------------------------------------------

-define(RANK_RANGE_COUNTRY, 1).	%% 国家
-define(RANK_RANGE_SERVER, 	2). %% 服务器

-define(RANK_TYPE_FORCE, 1).	%% 战力排行
-define(RANK_TYPE_HERO,  2).	%% 英雄排行
-define(RANK_TYPE_KILLS, 3).	%% 歼敌排行
-define(RANK_TYPE_BUILD, 4).	%% 建设排行

-define(RANK_RESET_TYPE0, 0).	%% 不重置
-define(RANK_RESET_TYPE1, 1).	%% 季度重置
-define(RANK_RESET_TYPE2, 2).	%% 年度重置

-define(RANK_CONFIG_KEY(Range, Type), Range * 1000 + Type).

-record(ranker, {
	rank_type = 0,		%% 排行类型
	rank = 0,			%% 排名

	id = 0,					%% 玩家ID
	max_force_hero = 0,		%% 最高战力英雄id
	show = undefined,		%% #player_show
	hero_base = undefined,	%% #hero_base
	value = 0,				%% 值
	update_tick = 0			%% 值更新时间
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