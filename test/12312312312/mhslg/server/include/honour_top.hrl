%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 5月 2021 11:08
%%%-------------------------------------------------------------------
-author("df").
-include("player.hrl").
-define(START_STAGE,  	1).	%% 开始阶段
-define(EIGHT_STAGE,  	7).	%% 八强赛阶段
-define(OVER_STAGE,   	8).	%% 结束数据处理
-define(OVER_STAGE_2,   9).	%% 数据处理完成
-define(ACTIVITY_OVER,  0).	%% 活动结束
-define(APPLY_MAX, 			lib_honour_top_api:const(max_apply,value)).			%% 报名人数上限
-define(GROUP_NUM,			lib_honour_top_api:const(single_group,value)).		%% 分组人数
-define(EIGHT_GROUP_NUM,	lib_honour_top_api:const(eight_single_group,value)).%% 八强赛分组人数
-define(MONEY,				lib_honour_top_api:const(money,value)).				%% 活动货币
-define(ALL_TIMES,			lib_honour_top_api:const(start_times,value)).		%% 每个阶段比赛轮次
-define(BET_START,			lib_honour_top_api:const(bat_start,timevalue)).		%% 押注开始时间
-define(BET_OVER,			lib_honour_top_api:const(bat_over,timevalue)).		%% 押注结束时间

-define(HONOUR_TOP_AWARD_MAIL_ID,           1017).
-define(HONOUR_TOP_BET_AWARD_MAIL_ID,       1018).

-record(honour_top_gather,{
	stage = 0,
	times = 0,
	player_map = maps:new(),	%% 玩家信息
	bet_map = maps:new(),		%% 押注八强信息
	stage_map = maps:new(),		%% 活动阶段分组
	fight_mod = 0,
	fight_group_id = 0,
	fight_report_id = 0,
	fight_list = [],
	fight_over_list = [],
	apply_num = 0,				%% 参加人数
	top_eight = maps:new(),		%% Rank => #player_honour_top 活动前八名
	is_fight = 0,
	online_player = []
}).

-record(player_honour_top,{
	player_id = 0,
	is_robot = 0,
	show = #player_show{},
	is_apply = 0,
	is_worship = 0,
	bet = 0,				%% 押注组
	group_map = maps:new(),	%% MAP stage => #player_group_map
	hero_info = []			%% [#hero_base{}]
}).

-record(player_group_map,{
	stage = 0,				%% 活动阶段
	group = 0				%% 组
}).

%% 固定八个
-record(bet_map,{
	id = 0,							%% 名次
	be_bet_show = #player_show{},	%% 被竞猜者
	money = 0,						%% 总币数
	player_bet = maps:new() 		%% MAP player_id => #player_bet{}
}).

-record(player_bet,{
	player_id = 0,
	bet_money = 0
}).

-record(stage_map,{
	stage = 0,
	group = maps:new() %% MAP group => #group_map{}
}).

-record(group_map,{
	group_id = 0,
	player_grade_info = maps:new(),	%% MAP	rank => #player_grade_info{}
	report_map = maps:new()			%% MAP	times => #report_map{}
}).

-record(player_grade_info,{
	player_id = 0,
	rank = 0,					%% 初始战斗顺序
	win = 0,
	lose = 0
}).

-record(report_map,{
	times = 0,					%% 场次
	reports = maps:new()		%% MAP	id => #report{}
}).

-record(report,{
	id = 0,						%% 战报id,表示某场次战斗的先后顺序
	record_id = 0,				%% 录像id
	l_id = 0,
	l_show = #player_show{},
	r_id = 0,
	r_show = #player_show{},
	win = 0						%% 胜利者 0 => left  1 => right
}).

-record(top_eight,{
	rand = 0,
	player_id = 0,
	show = #player_show{},
	show_hero_id = 0
}).