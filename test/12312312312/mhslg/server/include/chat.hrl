%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: chat
%%% Created on : 2020/8/6 0006 10:35
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('chat_HRL').
-define('chat_HRL', true).

-define(CHANNEL_WORLD, 1).		%% 全服频道
-define(CHANNEL_COUNTRY, 2).		%% 国家频道
-define(CHANNEL_SYSTEM, 3).		%% 系统频道
-define(CHANNEL_PRIVATE, 4).	%% 私聊频道
-define(CHANNEL_CLUSTER, 5).		%% 跨服频道
-define(CHANNEL_GOVERNOR,6).  %%栋梁频道
-define(MAX_CHANNEL_TYPE, 6).	%% 最大的频道值
-define(CHANNEL_LIST,[1,2,3,5,6]). %%除了私聊频道的所有频道列表

-define(CHAT_CONTENT_WORD, 0).	%% 聊天内容类型:文字
-define(CHAT_CONTENT_VOICE, 1).	%% 聊天内容类型:语音

-define(BROAD_TYPE_PLAYER_ID, 1). 	%%玩家id
-define(BROAD_TYPE_COUNTRY_ID, 2). 	%%国家id
-define(BROAD_TYPE_ROLE_INFO, 3).  	%%角色信息
-define(BROAD_TYPE_HERO_BASE, 4).  	%%英雄信息
-define(BROAD_TYPE_ITEM_INFO, 5).  	%%物品信息
-define(BROAD_TYPE_HERO_QUALITY, 6).  %%英雄品质
-define(BROAD_TYPE_SKILL_ID, 7).  	%%技能id
-define(BROAD_TYPE_NUM, 8).  		%%纯数字
-define(BROAD_TYPE_STAR_LEVEL, 9).  %%英雄星级
-define(BROAD_TYPE_ROBOT_ID, 10).   %%怪机器人id
-define(BROAD_TYPE_HERO_COLOR, 11). %%英雄星级颜色
-define(BROAD_TYPE_CHALLENGE, 12). 	%%王座类型
-define(BROAD_TYPE_HERO_SKILL, 13). %%英雄技能学习技能
-define(BROAD_TYPE_CITY_ID, 14).  	%% 城池id
-define(BROAD_TYPE_STAR, 15).  		%% 占星道具id
-define(BROAD_TYPE_INNER_CITY, 16). %% 内城建筑类型id

-record(chat_player, {
	id = 0,		%% 玩家id
	ip = "",	%% 玩家ip
	sid = undefined,	%% socket_id
	account = "",		%% 帐号
	show = undefined, 	%% #'ProtoShowRole'
	agent_code = 0,		%% 渠道编号
	market = 0,			%% 包号
	server_flag = "",	%% 服务器标识
	league_id = 0,		%% 联盟id  (国家id）
	league_name = "",	%% 联盟名字
	league_level = 0,	%% 联盟等级
	league_position = 0,	%% 联盟职位
	private_channel = #{},	%% key: private player_id, value: private channel_id
	black_friend_list = [],	%% 黑名单列表
	chat_ban = 0		%% 1 禁言, (使用静默禁言，即玩家自己可以看到自己的聊天，但游戏中其他玩家不会收到他的聊天消息)
}).

-record(channel_state, {
	id = 0,		%% 频道id
	type = 0,	%% 频道类型
	player_map = #{},	%% 注册进该频道的玩家, key: player_id, value:sid
	bin_msg_list = [],	%% 待发送的频道信息
	history = []
}).

-record(chat_state, {
	player_map = #{},	%% key: player_id, value: #chat_player
	voice_map = #{},	%% key: voice_id, value: send_tick
	private_history_map = #{}	%% key: player_id, value: {oldest_tick, [#chat_record]}
}).

-record(chat_voice, {	%% 语言
	id = 0,	%% 语音id
	send_tick = 0,	%% 语音发送时间
	chat_type = 0,	%% 频道类型
	voice_sec = 0,	%% 语音时长
	content = <<>>,	%% 语音内容
	byte_size = 0
}).

-record(chat_record, {	%% 聊天内容历史记录
	send_tick = 0,	%% 发送时间
	msg_binary = <<>>	%% 消息#'Proto80105002'二进制内容
}).

-record(backstage_chat_limit, {
	agent_code = 0,
	channel_limit_dict = dict:new(),		%% key:channel_id value:[开放等级，发言间隔]
	vip_limit_unit_tick = 0,
	vip_limit_dict = dict:new(),				%% key:vip_level value:[世界发言次数，世界发言次数, 军团发言次数, 任务发言次数, 私聊发言次数, 跨服发言次数]
	level_limit_unit_tick = 0,
	level_limit_ban_tick = 0,
	level_limit_dict = dict:new(),			%% key:channel_id value:[ [等级低区间, 等级高区间, 发言次数, VIP等级] ]
	shield_world_list = [],
	update_tick = 0
}).


-record(player_chat_limit, {
	id = 0,
	chat_list = [],					%% 一分钟内的聊天记录，每分钟定时处理一次，处理完清空
	chat_tick_list = [],
	chat_record_list = [],	%% 聊天记录，从chat_list取过来的记录，用于(不文明发言封禁)
	ban_tick_list = [],			%% 被系统禁言的时间戳列表，禁言次数过多，直接封号

	last_chat_tick = 0,			%% 上一次发言时间戳
	last_vip_chat_limit_reset_tick = 0,
	vip_chat_limit_list = [],
	last_level_chat_limit_reset_tick = 0,
	level_chat_limit_list = [],

	ban_chat_tick = 0
}).

-record(chat_limit_record, {
	tick = 0,
	content = "",
	chat_type = 0
}).

-record(limit_rec, {
	chat_type = 0,
	chat_time = 0
}).

-endif.
