%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mail
%%% Created on : 2020/8/14 0014 11:43
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('mail_HRL').
-define('mail_HRL', true).

%% mail_type邮件类型
-define(MAIL_TYPE_SYSTEM, 1).	    %% 系统邮件
-define(MAIL_TYPE_ACTIVITY, 2).	    %% 活动邮件
-define(MAIL_TYPE_FIGHT_REPORT, 3).	%% 战报邮件

-define(BACK_MAIL_FONT, 1000).	    %% 后台邮件配置id

-define(MAIL_NO_READ, 0).		%% 未读
-define(MAIL_READED, 1).		%% 已读

-define(MAIL_NO_ATTACH, 0).		%% 没有附件
-define(MAIL_HAS_ATTACH, 1).	%% 有附件

-record(mail_info, {		%% 未处理邮件数据
	id = 0,		%% 唯一ID
	serial_type = 0,	%% 流水类型
	mail_type = ?MAIL_TYPE_SYSTEM, %% 邮件类型
	mail_font = 0,	%% 邮件配置id
	mail_title = "",	%% 邮件标题
	mail_content = "",	%% 邮件内容

	send_tick = 0,	%% 发送时间戳
	sender_id = 0,	%% 发送者id
	sender_name = "",	%% 发送者名字

	receive_tick = 0,	%% 接收时间戳
	receiver_id = 0,	%% 接收者id
	receiver_name = "",	%% 接收者名字

	has_read = ?MAIL_NO_READ,		%% 是否已阅读, 0 未读，1 已读
	read_tick = 0,		%% 阅读时间
	has_attach_draw = ?MAIL_NO_ATTACH,	%%	是否有附件, 0 没有, 1 有附件
	draw_tick = 0,		%% 提取附件时间
	args = [],			%% 参数列表#mail_arg{}
	title_args = [],	%% 标题参数列表#mail_arg{}
	item_list = [],		%% 附件道具列表#pack_item{}
	overtime_tick = 0  		%%邮件失效时间戳
}).

-record(player_mail, {
	id = 0,
	mail_map = #{}		%% key: mail_id, value: #mail_info
}).

-define(MAIL_ARG_TYPE_INT_NUMBER, 1).		%% 整型数字
-define(MAIL_ARG_TYPE_DOUBLE_NUMBER, 2).	%% 浮点型数字
-define(MAIL_ARG_TYPE_STRING, 3).			%% 字符串
-define(MAIL_ARG_TYPE_ROLE_BASE, 4).		%% 玩家信息
-define(MAIL_ARG_TYPE_ITEM_OBJ, 5).			%% 道具信息
-define(MAIL_ARG_TYPE_HERO_SKILL_NAME, 6).	%% 英雄技能名
-define(MAIL_ARG_TYPE_HERO_NAME, 7).		%% 英雄名
-record(mail_arg, {
	type = 0,
	data = undefined,
	int_val = 0,
	double_val = 0,
	string_val = "",
	player_show = undefined,
	item_obj = undefined
}).

-endif.
