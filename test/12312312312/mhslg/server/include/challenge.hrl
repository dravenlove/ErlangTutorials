%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 3月 2021 15:57
%%%-------------------------------------------------------------------
-author("df").
-include("player.hrl").
-define(NO_START_TIME,	0).		%% 未开始时间
-define(GUESS_TIME,		1).		%% 竞猜时间
-define(RUN_TIME,		2).		%% 攻守擂时间
-define(OVER_TIME,		3).		%% 结果展示时间
-define(ACTIVITY_OVER,	4).		%% 结束时间

-define(CHALLENGE_HERO, 	1).	%% 英雄王座
-define(CHALLENGE_TROOPS, 	2).	%% 兵种王座

-define(CHALLENGE_JOIN,		0).	%% 玩家进入功能
-define(CHALLENGE_LEAVEN,	1).	%% 玩家离开功能

-define(CHALLENGE_BROAD_END, 1017).
-define(CHALLENGE_BROAD, 1018).

-record(player_challenge,{
	id = 0,
	guess_type = 0,					%% 竞猜类型
	attack_time = 0,				%% 可攻擂次数
	attack_tick = 0,				%% 上次攻擂时间
	buy_time = 0,					%% 购买次数
	item = []						%% 未领取道具
}).


-record(player_challenge_fight,{
	id = 0,
	tick = 0,						%% 开始排队时间
	show = #player_show{},			%% #player_show
	hero_list = [],					%% [#hero_base{}]
	fighters = [],					%% 集结列表（#combat_hero）
	hero_troop = maps:new()			%% 英雄剩余血量
}).

-record(challenge_hero_troop,{
	hero_id = 0,
	all_troop = 0,			%%　总兵力
	now_troop = 0			%%　剩余兵力
}).

-record(defend_order,{
	id = 0,							%% 擂主id
	tick = 0,						%% 当选擂主时间
	win_time = 0					%% 胜利次数
}).

-record(challenge,{
	type = 0,									%% 王座类型
	defend_info = #player_challenge_fight{},	%% 擂主信息
	defend_order = #defend_order{},				%% 擂主其他信息
	attack_info = maps:new(),					%% 攻擂信息
	attack_num = 0,								%% 攻擂人数
	attack_id = [],								%% 攻擂者id
	attack_buff = [],							%% 攻擂buff
	pond = 0,									%% 奖池数
	now_record_id = 0,							%% 正在战斗的回放id
	report = maps:new()							%% 战报 MAP => #challenge_report{}

}).

-record(challenge_guess,{
	type = 0,		%% 王座类型
	tick = 0,		%% 更新时间
	num = 0			%% 人数
}).

-record(challenge_report,{
	record_id = 0,				%% 录像id
	tick = 0,
	l_id = 0,
	l_show = #player_show{},
	r_id = 0,
	r_show = #player_show{},
	win = 0,					%% 胜利者 0 => left  1 => right
	award = 0,					%% 获得道具
	winner = 0					%% 擂主 0 => left  1 => right

}).

-record(challenge_gather,{
	stage = 0,						%% 活动阶段
	fight_type = 0,					%% 战斗状态
	challenge_map = maps:new(),		%% 王座信息MAP => #challenge{}
	guess_map = maps:new(),			%% 竞猜MAP => #challenge_guess{}
	player_map = maps:new(),		%% 玩家MAP => #player_challenge{}
	online_list = [],				%% 使用本功能的玩家列表 　
	report_list = []				%% 战报界面的玩家列表 　
}).