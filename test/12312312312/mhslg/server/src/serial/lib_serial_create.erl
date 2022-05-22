%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_serial_create
%%% Created on : 2020/8/13 0013 20:47
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_serial_create).
-author("glendy").
-include("common.hrl").

%% API
-export([
	create_database/0,
	create_table/0
]).

create_database() ->
	?INFO("CREATE DATABASE IF NOT EXISTS `~ts` /*!40100 DEFAULT CHARACTER SET utf8 */;", [config:mysql_serial_db()]).

create_table() ->
	create_loginout_serial_table(),
	create_online_serial_table(),
	create_chat_serial_table(),
	create_money_serial_table(),
	create_item_serial_table(),
	create_level_serial_table(),
	create_exp_serial_table(),
	create_mail_serial_table(),
	create_league_serial_table(),
	create_op_serial_table(),
	create_task_serial_table(),
	ok.

%% 登录登出流水
create_loginout_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `loginout_serial` (
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				`role_name` VARCHAR(32) NULL DEFAULT NULL COMMENT '名称',
				`login_level` INT(11) NULL DEFAULT NULL COMMENT '登录等级',
				`account` VARCHAR(64) NULL DEFAULT NULL COMMENT '账号',
				`client_ip` VARCHAR(64) NULL DEFAULT NULL COMMENT 'ip地址',
				`login_time` INT(20) NULL DEFAULT NULL COMMENT '登录时间' ,
				`logout_time` INT(20) NULL DEFAULT NULL COMMENT '登出时间',
				`online_time` INT(11) NULL DEFAULT NULL COMMENT '在线时间' ,
				`sys_model` VARCHAR(128) NULL DEFAULT NULL COMMENT 'sys_model',
				`sys_version` VARCHAR(128) NULL DEFAULT NULL  COMMENT '系统版本',
				`mac` VARCHAR(64) NULL DEFAULT NULL COMMENT 'mac地址',
				`logout_level` INT(11) NULL DEFAULT NULL COMMENT '登出等级',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `role_id_login_time` (`role_id`, `login_time`),
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `role_id` (`role_id`),
				KEY `login_time` (`login_time`),
				KEY `logout_time` (`logout_time`),
				KEY `time` (`time`)
			)
			COMMENT='登录登出流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create loginout serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create loginout serial error: ~p ~n", [Reason])
	end,
	ok.

%% 在线流水
create_online_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `online_serial` (
				`total_users` INT(11) NULL DEFAULT NULL COMMENT '总玩家数量',
				`users` INT(11) NULL DEFAULT NULL COMMENT '渠道/包号玩家数量',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `time` (`time`)
			)
			COMMENT='在线流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create online serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{{_}, Reason} ->
			?INFO("mysql create online serial error: ~p ~n", [Reason])
	end,
	ok.

%% 聊天流水
create_chat_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `chat_serial` (
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				`role_name` VARCHAR(32) NULL DEFAULT NULL COMMENT '名称',
				`level` INT(11) NULL DEFAULT NULL COMMENT '等级',
				`account` VARCHAR(64) NULL DEFAULT NULL COMMENT '账号',
				`ip` VARCHAR(64) NULL DEFAULT NULL COMMENT 'ip地址',
				`serial_type` INT(11) NULL DEFAULT NULL COMMENT '流水主类型',
				`sub_type` BIGINT(20) NULL DEFAULT NULL COMMENT '流水子类型',
				`content` text NULL DEFAULT NULL COMMENT '聊天内容',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `role_id` (`role_id`),
				KEY `time` (`time`)
			)
			COMMENT='聊天流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create chat serial success ~n");
		{_, {1050, _, _}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create chat serial error: ~p ~n", [Reason])
	end,
	ok.

%% 金钱资源流水
create_money_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `money_serial` (
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				`serial_type` INT(11) NULL DEFAULT NULL COMMENT '流水主类型',
				`sub_type` INT(11) NULL DEFAULT NULL COMMENT '流水子类型',
				`currency_type` INT(11) NULL DEFAULT NULL COMMENT '充值币种类型',
				`currency` DOUBLE NULL DEFAULT NULL COMMENT '充值金额',
				`money_type` INT(11) NULL DEFAULT NULL COMMENT '金钱类型',
				`money` VARCHAR(32) NULL DEFAULT NULL COMMENT '变化的金钱数',
				`remain_money` VARCHAR(32) NULL DEFAULT NULL COMMENT '剩余金钱',
				`buy_item_id` BIGINT(20) NULL DEFAULT NULL COMMENT '购买道具id',
				`buy_item_amount` INT(11) NULL DEFAULT NULL COMMENT '购买道具数量',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				`ip` VARCHAR(64) NULL DEFAULT NULL COMMENT 'ip地址',
				`account` VARCHAR(64) NULL DEFAULT NULL COMMENT '账号',
				`role_name` VARCHAR(32) NULL DEFAULT NULL COMMENT '角色名',
				`device` text NULL DEFAULT NULL COMMENT '设备',
				`role_level` INT(11) NULL DEFAULT NULL COMMENT '角色等级',
				KEY `role_id` (`role_id`),
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `time` (`time`),
				KEY `money_type` (`money_type`),
				KEY `serial_type` (`serial_type`)
			)
			COMMENT='金钱资源流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create money serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create money serial error: ~p ~n", [Reason])
	end,
	ok.

%% 道具流水
create_item_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `item_serial` (
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				`serial_type` INT(11) NULL DEFAULT NULL COMMENT '流水主类型',
				`sub_type` INT(11) NULL DEFAULT NULL COMMENT '流水子类型',
				`item_id` BIGINT(20) NULL DEFAULT NULL COMMENT '道具id',
				`amount` INT(11) NULL DEFAULT NULL COMMENT '道具数量',
				`unique_id` BIGINT(20) NULL DEFAULT NULL COMMENT '道具唯一id',
				`use_money_id` BIGINT(20) NULL DEFAULT NULL COMMENT '获得道具所花费的道具id',
				`use_money_amount` INT(11) NULL DEFAULT NULL COMMENT '获得道具所花费的道具数量',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `role_id` (`role_id`),
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `time` (`time`),
				KEY `serial_type` (`serial_type`)
			)
			COMMENT='道具流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create item serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create item serial error: ~p ~n", [Reason])
	end,
	ok.

%% 等级流水
create_level_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `level_serial` (
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				`level` INT(11) NULL DEFAULT NULL COMMENT '等级',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `role_id` (`role_id`),
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `time` (`time`)
			)
			COMMENT='等级流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create level serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create level serial error: ~p ~n", [Reason])
	end,
	ok.

%% 经验流水
create_exp_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `exp_serial` (
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				`serial_type` INT(11) NULL DEFAULT NULL COMMENT '流水主类型',
				`sub_type` INT(11) NULL DEFAULT NULL COMMENT '流水子类型',
				`exp` INT(11) NULL DEFAULT NULL COMMENT '获得经验值',
				`total_exp` INT(11) NULL DEFAULT NULL COMMENT '总经验值',
				`level` INT(11) NULL DEFAULT NULL COMMENT '当前等级',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `role_id` (`role_id`),
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `time` (`time`),
				KEY `serial_type` (`serial_type`)
			)
			COMMENT='经验流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create exp serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create exp serial error: ~p ~n", [Reason])
	end,
	ok.

%% 邮件流水
create_mail_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `mail_serial` (
				1`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '角色id',
				1`serial_type` INT(11) NULL DEFAULT NULL COMMENT '流水主类型:40000未读，40001手动删除，40002自动删除，40003过期删除，40004读取，40005提取',
				1`id` BIGINT(20) NULL DEFAULT NULL COMMENT '邮件id',
				1`mail_type` INT(11) NULL DEFAULT NULL COMMENT '邮件类型:0系统邮件,1私人邮件,2后台GM邮件',
				1`mail_font` INT(11) NULL DEFAULT NULL COMMENT '邮件配置id:0为后台邮件，1为配置邮件',
				1`mail_title` VARCHAR(32) NULL DEFAULT NULL COMMENT '邮件标题',
				1`mail_content` VARCHAR(64) NULL DEFAULT NULL  COMMENT '邮件内容',
				1`send_tick` INT(11) NULL DEFAULT NULL COMMENT '发送时间',
				1`sender_id` BIGINT(20) NULL DEFAULT NULL COMMENT '发送者id',
				1`sender_name` VARCHAR(32) NULL DEFAULT NULL COMMENT '发送者名称',
				1`receive_tick` INT(11) NULL DEFAULT NULL COMMENT '接收时间',
				1`receiver_id` BIGINT(20) NULL DEFAULT NULL COMMENT '接收者id',
				1`receiver_name` VARCHAR(32) NULL DEFAULT NULL COMMENT '接收者名称',
				1`has_read` INT(11) NULL DEFAULT NULL COMMENT '阅读状态：0未读，1已读',
				1`read_tick` INT(11) NULL DEFAULT NULL COMMENT '阅读时间',
				1`has_attach_draw` INT(11) NULL DEFAULT NULL COMMENT '是否有附件：0没，1有',
				1`draw_tick` INT(11) NULL DEFAULT NULL COMMENT '提取附件时间',
				1`item_list` VARCHAR(512) NULL DEFAULT NULL COMMENT '道具列表',
				1`overtime` INT(11) NULL DEFAULT NULL COMMENT '邮件有效期',
				`time` INT(11) NULL DEFAULT NULL COMMENT '流水写入时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(32) NULL DEFAULT NULL COMMENT '服务器标识',
				KEY `role_id` (`role_id`),
				KEY `agent` (`agent`),
				KEY `market` (`market`),
				KEY `time` (`time`)
			)
			COMMENT='邮件流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create mail serial success ~n");
		{_, {1050, _, _}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create mail serial error: ~p ~n", [Reason])
	end,
	ok.

create_league_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `league_serial` (
				`serial_type` INT(11) NULL DEFAULT NULL COMMENT '流水类型',
				`sub_serial_type` INT(11) NULL DEFAULT NULL COMMENT '子类型',
				`role_id` BIGINT(20) NULL DEFAULT NULL COMMENT '操作玩家id',
				`league_id` BIGINT(20) NULL DEFAULT NULL COMMENT '联盟id',
				`league_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '最新联盟名字',
				`leader_id` BIGINT(20) NULL DEFAULT NULL COMMENT '会长id',
				`leader_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '会长名字',
				`time` INT(11) NULL DEFAULT NULL COMMENT '记录时间',
				`server_flag` VARCHAR(50) NULL DEFAULT NULL COMMENT '服务器标识',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道编号',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`value1` BIGINT(20) NULL DEFAULT NULL,
				`value2` BIGINT(20) NULL DEFAULT NULL,
				`value3` BIGINT(20) NULL DEFAULT NULL,
				`value4` BIGINT(20) NULL DEFAULT NULL,
				INDEX `time` (`time`),
				INDEX `league_id` (`league_id`),
				INDEX `agent` (`agent`),
				INDEX `market` (`market`),
				INDEX `server_flag` (`server_flag`)
			)
			COMMENT='联盟流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;")) of
		ok ->
			?INFO("mysql create league serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create league serial error: ~p ~n", [Reason])
	end,
	ok.

create_op_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `op_serial` (
				`role_id` BIGINT(20) NOT NULL COMMENT '玩家id',
				`serial_type` INT(11) NOT NULL COMMENT '流水类型，按玩法和子操作分',
				`level` INT(11) NOT NULL COMMENT '等级',
				`task` INT(11) NOT NULL COMMENT '主线任务id',
				`vip` INT(11) NOT NULL COMMENT 'vip等级',
				`money` DOUBLE NOT NULL COMMENT '总充值金额',
				`time` INT(11) NULL DEFAULT NULL COMMENT '记录时间',
				`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
				`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
				`server_flag` VARCHAR(50) NULL DEFAULT NULL COMMENT '服务器标识',
				`value1` BIGINT(20) NULL DEFAULT NULL,
				`value2` BIGINT(20) NULL DEFAULT NULL,
				`value3` BIGINT(20) NULL DEFAULT NULL,
				`value4` BIGINT(20) NULL DEFAULT NULL,
				`value5` BIGINT(20) NULL DEFAULT NULL
			)
			COMMENT='玩家各种玩法操作流水'
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM
			;
			")) of
		ok ->
			?INFO("mysql create league serial success ~n");
		{_, {1050,_,_}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create league serial error: ~p ~n", [Reason])
	end,
	ok.
create_task_serial_table() ->
	case mysql_poolboy:query(?SERIALDB_POOL,
		lib_types:to_binary("CREATE TABLE `task_serial` (
			`role_id` BIGINT(20) NOT NULL COMMENT '玩家id',
			`serial_type` INT(11) NOT NULL COMMENT '流水类型',
			`status` INT(11) NULL DEFAULT NULL COMMENT '任务状态',
			`task_id` INT(11) NOT NULL COMMENT '任务id',
			`task_type` INT(11) NULL DEFAULT NULL COMMENT '任务类型',
			`market` INT(11) NULL DEFAULT NULL COMMENT '包号',
			`agent` INT(11) NULL DEFAULT NULL COMMENT '渠道号',
			`time` INT(11) NULL DEFAULT NULL COMMENT '记录时间',
			`server_flag` VARCHAR(32) NULL DEFAULT NULL  COMMENT'服务器标识',
			`value1` BIGINT(20) NULL DEFAULT NULL,
			`value2` BIGINT(20) NULL DEFAULT NULL,
			`value3` BIGINT(20) NULL DEFAULT NULL,
			`value4` BIGINT(20) NULL DEFAULT NULL,
			`value5` BIGINT(20) NULL DEFAULT NULL,
			KEY `role_id` (`role_id`),
			KEY `task_id` (`task_id`),
			KEY `task_type` (`task_type`),
			KEY `time` (`time`)
		)
		COMMENT='任务流水'
		COLLATE='utf8_general_ci'
		ENGINE=MyISAM
		;")) of
		ok ->
			?INFO("mysql create task serial success ~n");
		{_, {1050, _, _}} ->
			skip;
		{_, Reason} ->
			?ERROR("mysql create task serial error: ~p ~n", [Reason])
	end,
	ok.