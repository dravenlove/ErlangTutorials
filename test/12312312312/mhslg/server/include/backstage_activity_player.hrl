%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 十二月 2019 16:59
%%%-------------------------------------------------------------------
-author("13661").

-record(activity_detail, {
	id = 0,				%%唯一ID
	main_type = 0,		%%主类型
	sub_type = 0,		%%子类型
	group_type = 0,		%%组类型
	is_cluster = false, %%是否是跨服活动
	update_tick = 0,	%%更新时间
	version = 0,		%%版本
	is_click = false, 	%%是否已点击
	data = undefined	%%活动的player数据
}).

-record(player_back_act,  {
	id = 0, %%玩家ID
	act_detail_dict = dict:new(), %%玩家活动数据
	event_cache_list = []
}).

-record(daily_task, {
	free_time = 0,			%%免费次数
	pay_time = 0,				%%花费消耗次数
	pay_cost = 0,				%%消耗多少
	task_have = dict:new(), %%Key:任务id  val：进度
	refresh_time = 0  %%玩家一天刷新次数
}).