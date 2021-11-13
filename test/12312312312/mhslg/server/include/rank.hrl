%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: rank
%%% Created on : 2020/8/27 0027 16:20
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('rank_HRL').
-define('rank_HRL', true).

-define(RANK_FRESH_TIMEOUT, 30 * 1000).
-define(RANK_SAVE_TIMEOUT, 1800 * 1000).
-define(CLUSTER_RANK_FRESH_TIMEOUT, 30 * 1000).
-define(CLUSTER_RANK_SAVE_TIMEOUT, 60 * 1000).

-define(RANK_PLAYER_LEVEL, 1).	%% 等级排行
-define(RANK_PLAYER_FORCE, 2).	%% 战力排行
-define(RANK_CLUSTER_RECHARGE, 2001).	%% 跨服充值排行

-record(ranker, {
	rank_key = undefined,	%% 排行索引键, player_id | league_id
	rank_type = 0,	%% 排行类型, ?RANK_PLAYER_LEVEL等
	rank = 0,		%% 排名
	rank_value = 0,		%% 排行值
	rank_tick = 0,		%% 排行记录更新时间
	player_show = undefined, 	%% 玩家或会长模式信息, #'ProtoShowRole'
	last_rank = 0,	%% 上一次排名
	server_flag = ""	%% 服务器标识
}).

-record(player_rank, {
	id = 0,		%% 玩家id
	show = undefined, 	%% #player_show
	country_id = 0,		%% 国家ID
	max_force_hero = 0,	%% 最高战力英雄id
	is_online = false,	%% 是否在线
	sign_in_tick = 0,	%% 最后一次登录时间
	sign_out_tick = 0,	%% 最后一次登出时间
	level = 0,			%% 等级
	level_update_tick = 0,	%% 等级更新时间
	force = 0,			%% 战力
	force_update_tick = 0,	%% 战力更新时间
	build_val = 0,		%% 建设度
	build_val_update_tick = 0, %% 建设度更新时间
	kills = 0,			%% 歼敌数
	kills_update_tick = 0, %% 歼敌数更新时间
	be_kills = 0,		%% 战损数
	be_kills_update_tick = 0,	%% 战损数 更新时间
	rank0_kills = 0,					%% 季度(根据排行榜配置)歼敌数
	rank0_kills_update_tick = 0,		%% 季度(根据排行榜配置)歼敌数更新时间
	rank0_build_val = 0,				%% 年度(根据排行榜配置)建设度
	rank0_build_val_update_tick = 0,	%% 年度(根据排行榜配置)建设度更新时间

	rend
}).

-record(rank_state, {
	rank_type = 0,	%% 排行类型
	group_id = 0,	%% 分组id
	rank_list = [],	%% 排行榜信息, [#ranker]
	rank_map = #{},	%% 待更新的玩家排行信息, key: player_id, value: #ranker
	fresh_flag = 0,	%% 刷新标识
	save_flag = 0,	%% 保存标识
	cluster_save_key_map = #{}	%% 跨服需要保存的ranker的key
}).

-endif.
