%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: ban
%%% Created on : 2020/9/14 0014 11:52
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('ban_HRL').
-define('ban_HRL', true).

-define(ACTION_BAN, 1).		%% 封禁
-define(ACTION_UNBAN, 2).	%% 解封

-define(OPT_TYPE_NO, 1).	%% 无封禁
-define(OPT_TYPE_ACCOUNT, 2).	%% 封禁帐号
-define(OPT_TYPE_IP, 3).	%% 封禁IP
-define(OPT_TYPE_CHAT, 4).	%% 禁言

-record(ban_rec, {
	id = 0,			%% 唯一id
	role_id = 0,	%% 角色id
	role_name = "",	%% 角色名
	account = "",	%% 帐号
	ip = "",		%% ip
	opt_type = 0,	%% 封禁类型
	action = 0,		%% 封禁动作
	tick = 0,		%% 记录时间
	flag = 0		%% 更新标识
}).

-record(player_ban, {
	id = 0,		%% 玩家id
	account = "",		%% 帐号
	account_ban = 0,	%% 帐号被封禁
	ip_ban = 0,			%% ip被封禁
	ip = "",			%% 封禁时的ip
	chat_ban = 0		%% 被禁言
}).

-endif.
