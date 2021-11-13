%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 十二月 2019 11:14
%%%-------------------------------------------------------------------
-author("13661").

% -define(ETS_ACTIVITY_TABLE, ets_activity_table).

-define(BACK_ACT_NONE, 	10000).	%%


-define(ACTIVITY_TIME_TYPE_TICK, 1).	%%准确时间
-define(ACTIVITY_TIME_TYPE_OPEN_DAY, 2).%%开服天数

-define(TERMINATION_TYPE_NORMAL, 1).	%%正常终止

-record(activity, {
	id = 0,					%%全局唯一ID, 后台负责自增
	main_type = 0,			%%主类型
	sub_type = 0,			%%子类型
	group_type = 0,			%%组类型
	is_cluster = false,		%%是否是跨服活动

	title = "",				%%标题
	content = "",			%%内容
	icon = "",				%%图标

	level_limit = 0,		%%等级限制

	time_type = 0,			%%开启时间类型
	start_day = 0,			%%开服第几天开启
	end_day = 0,			%%开服第几天结束
	start_tick = 0,			%%指定时间开启
	end_tick = 0,			%%指定时间结束
	update_tick = 0,		%%更新时间

	version = 0,			%%版本
	sort = 0,				%%排序

	is_initialized = false, %%是否已初始化
	is_started = false,		%%是否已开始
	is_ended = false,		%%时候已结束
	is_close = false,		%%是否已关闭

	is_hide = false,		%%是否隐藏显示

	state = 0,				%%状态, 暂无用

	daily_reset_tick = 0,	%%每天重置的时间

	is_open_timeout = false,%%是否已开启计时器
	timeout_tick = 0,		%%计时器超时时间

	extra_value = undefined,%%额外值
	client_value = 0,		%%发给客户端的额外值

	config_str = "",		%%配置的字符串
	config_bson = undefined,%%配置的bson
	config = undefined,		%%配置 字符串 or bson 解析出的配置
	data = undefined		%%每个活动的额外数据
}).

-record(activity_state, {
	is_new = false,	%%是否是新活动
	is_init = false %%是否已初始化
}).

-record(activity_monitor_state, {

}).