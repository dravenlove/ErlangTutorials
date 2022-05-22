%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: back_activity
%%% Created on : 2020/8/25 0025 10:39
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('back_activity_HRL').
-define('back_activity_HRL', true).

-define(BACKACT_TIME_TICK, 1).		%% 时间类型: 指定时间戳
-define(BACKACT_TIME_OPEN, 2).		%% 时间类型: 按开服天数
-define(BACKACT_TIME_COMBINE, 3).	%% 时间类型: 按合服天数

-define(BACKACT_STATE_NOSTART, 0).	%% 未开始
-define(BACKACT_STATE_START, 1).	%% 进行中
-define(BACKACT_STATE_STOP, 2).		%% 结束
-define(BACKACT_STATE_DISAPPEAR, 3).	%% 消失

-define(SYNC_BACKACT_STATE_FIX, 1).		%% 后台配置更新修正状态
-define(SYNC_BACKACT_STATE_NORMAL, 2).	%% 根据时间正常变更活动状态

-define(SYNC_PLAYER_BACKACT_LOGIN, 1).		%% 登录同步
-define(SYNC_PLAYER_BACKACT_UPDATE, 2).	%% 后台更新同步
-define(SYNC_PLAYER_BACKACT_STATE, 3).		%% 状态更新同步
-define(SYNC_PLAYER_BACKACT_LOAD, 3).		%% 数据库加载时

-define(BACKACT_TYPE_CUMULATE_RECHARGE, 10001).		%% 累积充值

-record(backactivity, {
	act_index = 0,		%% 活动id
	state = 0,			%% 后台活动状态, ?BACKACT_STATE_NOSTART
	is_open = 0,		%% 0 关闭，1 开启
	start_tick = 0,		%% 开始时间
	end_tick = 0,		%% 结束时间
	disappear_tick = 0,	%% 消失时间
	back_update_tick = 0,	%% 后台更新时间
	config_string = "",	%% 配置信息的erl字符串格式
	conf = #{},			%% 活动配置
	fast_conf = #{},	%% 用于配置预处理
	main_type = 0,		%% 活动主类型
	sort = 0,			%% 客户端分组内的排序，由小到大排列
	main_icon = "",		%% 客户端的主活动图标,不显示则填空
	sub_icon = "",		%% 客户端的子活动图标,不显示则填空
	open_win = "",		%% 客户端打开的窗口
	title = "",			%% 活动标题
	content = "",		%% 活动内容
	level = 0			%% 等级限制
}).

-record(player_backactivity, {
	id = 0,		%% 玩家id
	backact_map = #{},	%% 玩家活动记录, key: 活动id, value: #backact_info
	maintype_map = #{}	%% 根据活动主类型查找所有相关的活动id, key: main_type, value: [活动id]
}).

-record(backact_info, {
	id = 0,			%% 活动id
	main_type = 0,	%% 活动主类型
	is_new = 0,		%% 1 对于玩家新开启的活动, 0 玩家已查看过的活动
	clear_tick = 0,	%% 删除时间, 玩家身上的活动数据延迟一到两天删除,登录时删除
	backactivity = undefined,	%% #backactivity, 不用保存数据库
	cumulate_recharge = undefined	%% #ba_cumulate_recharge
}).

-record(ba_cumulate_recharge, {		%% 累积充值活动
	recharge_money = 0.0,	%% 累积充值金额
	reward_map = #{}		%% 奖励标识, key: conf_id, value: 0 没有奖励，１有奖励，２已领取
}).

-endif.
