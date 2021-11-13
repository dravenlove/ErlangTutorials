%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: base
%%% Created on : 2020/8/3 0003 20:49
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('base_HRL').
-define('base_HRL', true).

-define(CONFIG, game_server_config:lookup).

-define(MAX_ACCOUNT_LENGTH, 	64).
-define(MAX_NAME_LENGTH, 		64).

%% 服务器类型
-define(SERVER_TYPE_ALL, all).      %% 所有服
-define(SERVER_TYPE_TEST, test).	%% 测试游戏服
-define(SERVER_TYPE_GAME, game).    %% 游戏服
-define(SERVER_TYPE_CLUSTER, cluster).    %% 跨服
-define(SERVER_TYPE_WORLD, world).	%% 世界服
-define(SERVER_TYPE_MERGE, merge). 	%% 合服

-define(CONTINUE, throw(continue)).
-define(CONTINUE(INFO), throw({continue, INFO})).
-define(BREAK, throw(break)).
-define(BREAK(INFO), throw({break, INFO})).
-define(RETURN(Val), throw({error, Val})).

%% 快速判断
-define(JUDGE_RETURN(A, ErrCode), case (A) of false -> throw({error, ErrCode}); _ -> skip end).
-define(JUDGE_CONTINUE(Condition), case (Condition) of false -> ?CONTINUE; true -> skip end).
-define(JUDGE_CONTINUE(Condition, Info), case (Condition) of false -> ?CONTINUE(Info); true -> skip end).
-define(JUDGE_BREAK(Condition), case (Condition) of false -> ?BREAK; true -> skip end).
-define(JUDGE_BREAK(Condition, Info), case (Condition) of false -> ?BREAK(Info); true -> skip end).

%%字典获取, 有默认值
-define(DICT_FETCH(Key, Dict, Default), case dict:is_key(Key, Dict) of true -> dict:fetch(Key, Dict); false -> Default end).

%%三元运算
-define(IIF(EXP, A, B), case EXP of true -> A; false -> B end).

-record(player_handler, {
	ets = undefined,				%% ets表名, 在ets.hrl中定义
	table_name = undefined,           %% 对应保存的数据库表名字
	table_player_field = undefined,   %% 数据库表的玩家id字段名
	ets_init_func = undefined,		%% ets表初始化接口, 没有参数
	mongo_index_func = undefined,	%% mongo数据库表索引建立接口, 没有参数
	load_func = undefined,			%% 数据库加载接口,只有一个参数: PlayerId
	save_func = undefined,			%% 数据库写入接口,只有一个参数: 对应数据的记录
	get_func = undefined,			%% 从进程字典中取数据, 没有参数
	put_func = undefined			%% 从进程字典中存数据, 必须两参数:第一个参数是数据记录，第二个参数是否要更新数据库
}).

-endif.
