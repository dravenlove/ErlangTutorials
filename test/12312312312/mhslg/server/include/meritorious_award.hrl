%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 2月 2021 11:01
%%%-------------------------------------------------------------------
-author("df").
-define(MAP_MERITORIOUS_DAY_AWARD, 	1013).		%% 每日战功排行榜邮件
-define(MAP_MERITORIOUS_YEAR_AWARD, 1014).		%% 每年战功排行榜邮件
-define(MAP_UNRECEIVED_AWARD, 		1015).		%% 未领取奖励邮件
-record(meritorious_rank,{
	player_id = 0,
	show = 0,						%% #player_show
	rank = 0,						%% 排名
	meritorious = 0,				%% 战功
	tick = 0						%% 更新时间
}).

-record(meritorious,{
	player_id = 0,
	show = 0,						%% #player_show
	kill_add = 0.0,					%% 玩家特权杀敌加成
	damage_add = 0.0,				%% 玩家特权战损加成
	meritorious = 0,				%% 战功
	add_up_meritorious = 0,			%% 累计获得的战功(爵位使用)
	tick = 0,						%% 更新时间
	stage = 1,						%% 阶段
	award_info = maps:new(),		%% 奖励信息  key => 档次 value => 状态 0 未开启 1 未领取 已领取
	get_circulation_award = 0,		%% 已领取的循环奖励
	circulation_award = 0			%% 未领取的循环奖励
}).


-record(meritorious_rank_gather,{
	system_refresh_tick = 0,		%% 系统更新时间tick
	rank_map = maps:new(),			%% 战功排行榜 MAP  player_id => #meritorious_rank
	meritorious_map = maps:new()	%% 战功MAP 	player_id => #meritorious_add
}).