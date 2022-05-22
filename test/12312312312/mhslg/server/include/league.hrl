%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: league
%%% Created on : 2020/8/15 0015 11:56
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		联盟宗派数据
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('league_HRL').
-define('league_HRL', true).

-define(LEAGUE_RIGHT_SET_ASSISTANT, 1).		%% 授权副会长职位
-define(LEAGUE_RIGHT_SET_ELITE, 2).			%% 授权精英职位
-define(LEAGUE_RIGHT_SET_MEMBER, 3).		%% 授权普通成员
-define(LEAGUE_RIGHT_KICK, 4).				%% 逐出联盟
-define(LEAGUE_RIGHT_APPLY, 5).				%% 入盟申请处理权限
-define(LEAGUE_RIGHT_CHANGE_LEADER, 6).		%% 转让会长
-define(LEAGUE_RIGHT_CHANGE_NOTICE, 7).		%% 公告修改
-define(LEAGUE_RIGHT_ACTIVITY_APPLY, 8).	%% 联盟活动报名
-define(LEAGUE_RIGHT_DISMISS, 9).			%% 解散联盟

-define(LEAGUE_POS_LEADER, 1).		%% 会长
-define(LEAGUE_POS_ASSISTANT, 2).	%% 副会长
-define(LEAGUE_POS_ELITE, 3).		%% 精英
-define(LEAGUE_POS_MEMBER, 4).		%% 普通成员

-define(LEAGUE_SYNC_CREATE, 1).		%% 创建联盟时的同步
-define(LEAGUE_SYNC_LOGIN, 2).		%% 登录时的同步
-define(LEAGUE_SYNC_LOGOUT, 3).		%% 登出时的同步
-define(LEAGUE_SYNC_JOIN, 4).		%% 加入联盟时的同步
-define(LEAGUE_SYNC_QUIT, 5).		%% 退出联盟时的同步
-define(LEAGUE_SYNC_KICK, 6).		%% 被逐出联盟时的同步
-define(LEAGUE_SYNC_DISMISS, 7).	%% 解散联盟时的同步
-define(LEAGUE_SYNC_POSITION, 8).	%% 职位变化时的同步
-define(LEAGUE_SYNC_NORMAL, 9).		%% 玩家信息变化时的同步

-define(LEAGUE_CACHE_UPDATE_FLAG, league_cache_update_flag).	%% 联盟数据库需要更新标识

-define(APPLY_LEAGUE_SINGLE, 1).	%% 申请加入指定联盟
-define(APPLY_LEAGUE_ALL, 2).		%% 全部申请加入联盟

-define(REPLY_APPLY_LEAGUE_AGREE_ONE, 1).		%% 同意一个
-define(REPLY_APPLY_LEAGUE_DISAGREE_ONE, 2).	%% 拒绝一个
-define(REPLY_APPLY_LEAGUE_AGREE_ALL, 3).		%% 同意所有
-define(REPLY_APPLY_LEAGUE_DISAGREE_ALL, 4).	%% 拒绝所有
-define(REPLY_APPLY_LEAGUE_AGREE_AUTO, 5).		%% 自动答复

-record(league, {
	id = 0,		%% 联盟id
	name = "",	%% 联盟名字
	level = 0,	%% 联盟等级
	exp = 0,		%% 联盟经验
	notice = "",	%% 联盟公告
	force = 0,	%% 联盟战力
	server_flag = "",	%% 所属服务器标识
	agent_code = 0,		%% 渠道编号　
	market = 0,			%% 包号
	member_map = #{},	%% key: member_id, value: online_flag
	leader_id = 0,		%% 会长id
	is_remove = 0,		%% 1 已删除
	apply_map = #{},	%% 申请加入联盟的列表, key: player_id, value: #league_member
	daily_tick = 0		%% 每日刷新时间戳
}).

-record(league_member, {	%% 联盟成员信息
	ets_key = {0, 0},	%% ets表的key: {league_id, member_id}
	id = 0,				%% 玩家id
	player_show = undefined,	%% 玩家模型信息
	online = 0,					%% 在线标识,0 离线, 1 在线
	offline_tick = 0,			%% 最近一次离线时间戳
	position = ?LEAGUE_POS_MEMBER,	%% 职位
	join_tick = 0,		%% 加入联盟时间戳
	position_times = 0	%% 职位被修改次数
}).

-record(player_league, {	%% 玩家身上关于联盟的信息
	id = 0,		%% 玩家id
	league_id = 0,	%% 联盟id
	league_name = "",	%% 联盟名字
	league_level = 0,	%% 联盟等级
	league_position = 0,	%% 联盟职位
	daily_tick = 0,		%% 每日刷新时间戳
	join_league_times = 0,	%% 每日加入联盟的次数
	quit_league_tick = 0,	%% 最近主动退出联盟的时间戳
	kick_league_map = #{}	%% 被踢出联盟的时间, key: league_id, value: kick_tick
}).

-record(league_manage_state, {
	league_id_name_map = #{},	%% key: league_id, value: league_name
	league_name_id_map = #{},	%% key: league_name, value: league_id
	player_league_map = #{},	%% key: player_id, value: league_id
	wait_create_league_map = #{},	%% key: player_id, value: #wait_league
	wait_join_map = #{}		%% key: player_id, value: #wait_join_league
}).

-record(wait_league, {
	creater_id = 0,		%% 创建者id
	league_id = 0,		%% 使用的联盟id
	league_name = "",	%% 使用的联盟名字
	timeout_tick = 0	%% 异常超时时间
}).

-record(wait_join_league, {	%% 处理会长答复时加入的
	apply_id = 0,		%% 申请者id
	league_id = 0,		%% 申请加入的联盟id
	timeout_tick = 0	%% 异常超时时间
}).

-record(league_state, {
	id = 0		%% 联盟id
}).

-define(LEAGUE_LOG_CREATE,	1).		%% 创建联盟日志
-define(LEAGUE_LOG_JOIN, 2).		%% 加入联盟日志
-define(LEAGUE_LOG_EXIT, 3).		%% 退出联盟日志
-define(LEAGUE_LOG_POS_UP, 4).		%% 联盟升职日志
-define(LEAGUE_LOG_POS_DOWN, 5).	%% 联盟降职日志
-define(LEAGUE_LOG_LEADER, 6).		%% 联盟转让会长日志
-record(league_log, {
	type = 0,			%% 日志类型?LEAGUE_LOG_CREATE等
	player_id = 0,		%% 发起玩家id
	player_name = "",	%% 发起玩家名
	content = "",		%% 日志内容
	log_tick = 0		%% 日志时间戳
}).

-endif.
