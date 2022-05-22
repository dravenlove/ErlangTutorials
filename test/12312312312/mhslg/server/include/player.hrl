%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: player
%%% Created on : 2020/8/3 0003 20:24
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('player_HRL').
-define('player_HRL', true).

%% 性别
-define(SEX_MAN, 1).	%% 男
-define(SEX_WOMAN, 2).	%% 女

-record(player_state, {
	sid = undefined,
	client_ip = "",
	player_id = 0,
	is_logining = 0,	%% 1 登录加载数据中，0 数据加载完成
	is_logout = 0		%% 1 玩家已登出
}).

-record(player_base, {	%% role表
	id = 0,			%% 玩家id
	sid = undefined,	%% socket的进程id
	account = "",	%% 帐号
	name = "",		%% 玩家名
	rename_tick = 0,%% 上次改名时间
	level = 0,		%% 等级
	sex = 0,        %%
	country = 0,	%% 国家
	head_icon = 0,  %% 头像
	session = "",	%% 最近的会话key
	server_flag = "",		%% 服务器标识
	server_name = "",		%% 服务器名字
	server_prev = "",		%% 服务器前缀
	agent = "",				%% 渠道标识
	agent_code = 0,			%% 渠道号
	market = 0,				%% 包号
	area = "",				%% 地区名
	create_tick = 0,		%% 创号时间
	is_logining = 0,		%% 1 表示登录加载或登录出错导致一直为1
	login_tick = 0,			%% 最近登录时间
	logout_tick = 0,		%% 最近登出时间
	online = 0,				%% 0 离线, 1 在线
	force = 0,				%% 总战力
	max_force_hero = 0,		%% 最高战力英雄id
	is_new = false,         %%
	is_weak_country = false,%% 创号时是否是选择弱势国
	reset_everyday_tick = 0,%% 每日重置tick
	system_refresh_tick = 0,%% 系统通用刷新tick
	hour_reset_tick = maps:new(),  %% key: hour, value: tick
	country_pos = 0,		%% 国家官职名称
	city_id = 0,			%% 担任城主的城池ID
	nobility = 0,			%% 爵位
	annual_reset_tick = 0, 	 %% 年度重置时间
	season_reset_tick = 0, 	 %% 季度重置时间
	fight_record = maps:new()	%% 测试使用，最近战斗信息
}).

-record(fight_record,{
	tick = 0,			%% 保存时间
	record_id = 0,		%% 回放id
	fight_type = 0		%% 战斗类型
}).

-record(player_show,{
	id = 0,					%% ID
	is_robot = false,		%% 是否是机器人
	name = "",				%% 名字
	level = 0,				%% 等级
	sex = 0,				%% 性别
	country = 0,			%% 国家
	country_pos = 0,		%% 国家官职名称
	head_icon = 0,			%% 头像
	server_flag = "",		%% 服务器标识
	force = 0,				%% 总战力
	city_id = 0,			%% 担任城主的城池ID
	nobility = 0			%% 爵位
}).

-record(player_base_other, {	%% role表其他信息，辅助统计和设备信息
	id = 0,						%% 玩家id
	ip = "",					%% 客户端ip
	create_tick = 0,			%% 创号时间
	create_server_flag = "",	%% 创号时服务器标识
	create_server_name = "",	%% 创号时服务器名字
	create_agent = "",			%% 创号时渠道标识
	create_agent_code = 0,		%% 创号时渠道号
	create_market = 0,			%% 创号时包号
	create_net_type = "",		%% 创号时网络类型
	create_sys_version = "",	%% 创号时系统版本
	create_sys_model = "",		%% 创号时机型
	create_mac = "",			%% 创号时mac地址
	create_client_type = 0,		%% 创号时客户端类型:1 安卓, 2 苹果
	net_type = "",			%% 网络类型
	sys_version = "",		%% 系统版本
	sys_model = "",			%% 机型
	mac = "",				%% mac地址
	client_type = 0,		%% 客户端类型:1 安卓, 2 苹果
	sdk_sid = "",			%% SDK的sid
	msg_tocken = "",		%% 消息推送的token
	device = ""				%% 设备
}).


-endif.
