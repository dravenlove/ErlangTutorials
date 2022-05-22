%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 12月 2020 16:16
%%%-------------------------------------------------------------------
-author("13661").

-define(AUTHORITY_APPOINT_POS, appoint_pos). 		%% 任命官职
-define(AUTHORITY_MODIFY_NOTICE, modify_notice).	%% 修改公告
-define(AUTHORITY_SIEGE_ORDER, siege_order).		%% 攻城令
-define(AUTHORITY_DEFENSIVE_ORDER, defensive_order).%% 守城令
-define(AUTHORITY_TRAIN_ORDER, train_order).		%% 训练令
-define(AUTHORITY_BUILD_ORDER, build_order).		%% 建筑令
-define(AUTHORITY_PROHIBIT_ORDER, prohibit_order).	%% 禁兵令
-define(AUTHORITY_APPOINT_DM, appoint_dm).	%% 任命城主

-define(COUNTRY_POS_NONE,	0).		%% 无官职
-define(COUNTRY_POS_KING,	1).		%% 国王
-define(COUNTRY_POS_PRINCE,	0).		%% 王子

-define(ORDER_TYPE_SIEGE,			1).	%% 攻城令
-define(ORDER_TYPE_DEFENSIVE,		2).	%% 守城令
-define(ORDER_TYPE_TRAIN,			3).	%% 训练令
-define(ORDER_TYPE_BUILD,			4).	%% 建筑令
-define(ORDER_TYPE_PROHIBIT,		5).	%% 禁兵令

-define(STAGE_TYPE_DU_CITY_0,		0).
-define(STAGE_TYPE_DU_CITY_1,		1).
-define(STAGE_TYPE_DU_CITY_2,		2).
-define(STAGE_TYPE_DU_CITY_3,		3).
-define(STAGE_TYPE_DU_CITY_4,		4).
-define(STAGE_TYPE_WIN,				100).

-record(player_country, {
	id = 0,				%% 玩家ID
	notice_uuid = 0		%% 公告uuid
}).

-record(country_player, {
	id = 0,				%% 玩家ID
	country_id = 0,		%% 国家ID
	show = undefined,	%% #player_show
	pos = 0,			%% 官职
	pos_name_id = 0,	%% 官职名ID
	city_id = 0,		%% 担任城主的城池ID
	can_appoint_master = false,	%% 是否开启功能
	fief_map = maps:new(),		%% 封地奖励map Id => Amount
	recv_tax_revenue_tick = 0, 	%% 接受税收时间
	hero = undefined,
	rend
}).

-record(impeach, {
	uuid = 0,					%% UUID
	is_in_impeach = false,		%% 是否在弹劾中
	req_impeach_id = 0,			%% 请求弹劾的玩家ID
	req_impeach_tick = 0,		%% 请求弹劾的时间
	tag_impeach_id = 0,			%% 弹劾的目标玩家ID
	a_votes_number = 0,			%% a得票数量	请求弹劾的玩家
	b_votes_number = 0,			%% b得票数量 被弹劾的玩家
	votes_list = [],			%% 已投票的玩家列表[player_id]
	rank_list = []				%% 可投票的玩家ID列表[player_id]
}).

-record(military_orders, { %%军令
	uuid = 0,				%% UUID
	type = 0,				%% 军令类型
	is_in_open = false,		%% 是否开启
	start_tick = 0,			%% 开启时间
	city_id = 0,			%% 城池ID
	open_times = 0			%% 开启次数
}).

-record(country,{
	id = 0,				%% 国家ID
	notice = "",		%% 公告
	notice_uuid = 0,	%% 公告UUID
	pos_map = maps:new(), %% 官职MAP, 官职ID => 玩家ID

	king_change_tick = 0,		%% 国王变更时间
	impeach_info = #impeach{},	%% 弹劾信息

	order_map = maps:new(),		%% 兵令MAP, 兵令类型 => #military_orders

	cur_stage = 0,	%% 当前阶段
	max_stage = 0,	%% 最大阶段
	rend
}).

-record(country_monitor, {
	send_salary_tick = 0,		%% 发送俸禄时间
	reset_everyday_tick = 0,	%% 每天重置时间
	country_map = maps:new(), 	%% 国家MAP CountryId => #country
	player_map = maps:new()		%% 玩家MAP PlayerId => #country_player
}).