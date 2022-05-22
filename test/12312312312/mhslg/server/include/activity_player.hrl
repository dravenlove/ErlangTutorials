%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 六月 2021 17:28
%%%-------------------------------------------------------------------
-author("13661").
-define(BOX_NO_RECEIVED,	0).
-define(BOX_RECEIVED,		1).

-record(activity_detail, {
	id = 0,				%%唯一ID
    server_type = 0,    %%服务器类型
    system_type = 0,    %%系统类型
	main_type = 0,		%%主类型
	sub_type = 0,		%%子类型
	is_click = false, 	%%是否已点击
	data = undefined	%%活动的player数据
}).

-record(player_activity,  {
	id = 0, %%玩家ID
	act_detail_map = maps:new(), %%玩家活动数据
	event_cache_list = []
}).

-record(daily_task, {
	free_time = 0,			%%免费次数
	pay_time = 0,				%%花费消耗次数
	pay_cost = 0,				%%消耗多少
	task_have = dict:new(), %%Key:任务id  val：进度
	refresh_time = 0  %%玩家一天刷新次数
}).


%%累计充值
-record(acc_recharge_grade,{
	index = 0,
	recharge_number = 0,
	state = 0
}).
-record(cumulatice_recharge,{
	acc = 0,			%% 活动累计充值
	grade_map = maps:new()
}).

%%武帝套装
-record(mars_suit_grade,{
	index = 0,
	recharge_number = 0,
	state = 0
}).

-record(today_recharge,{
	acc = 0
}).

%% 玩家开服冲榜
-record(player_open_server,{
	day_award = 0	%% 0 未领取 1 已领取
}).