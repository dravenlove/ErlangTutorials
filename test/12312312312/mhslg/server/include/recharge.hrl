%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: recharge
%%% Created on : 2020/8/28 0028 15:38
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-ifndef('recharge_HRL').
-define('recharge_HRL', true).

-define(FOREVER_CARD,		200101).  %% 永久卡

%% 限购类型
-define(BUY_LIMIT_TYPE_0,		0). 	%% 不限购
-define(BUY_LIMIT_TYPE_1,		1). 	%% 每日限购
-define(BUY_LIMIT_TYPE_2,		2). 	%% 每周限购（周一重置）
-define(BUY_LIMIT_TYPE_3,		3). 	%% 每周限购（周日重置）
-define(BUY_LIMIT_TYPE_4,		4). 	%% 每月限购
-define(BUY_LIMIT_TYPE_5,		5). 	%% 永久限购
-define(BUY_LIMIT_TYPE_6,		6). 	%% 账号永久限购
%%配置表添加类型需要同步添加

%% 充值类型
-define(RECHARGE_TYPE_NORMAL, 1).	%% 普通充值

-record(recharge_info,{
	recharge_id = 0,		%% 档次id
	buy_time = 0,			%% 已购买次数
	refresh_tick = 0,		%% 可购买次数刷新tick
	total_by_time = 0		%% 总购买次数
}).

-endif.
