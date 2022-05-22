%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_backactivity_listen
%%% Created on : 2020/8/26 0026 18:08
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_backactivity_listen).
-author("glendy").
-include("common.hrl").
-include("back_activity.hrl").

%% API
-export([
	listen_fast_load_config/2,
	listen_backactivity_force_close/2,
	listen_backactivity_new/2,
	listen_backactivity_start/4,
	listen_backactivity_stop/4,
	listen_backactivity_disappear/4,
	listen_backactivity_by_main_type/3
]).

%% 新活动或活动配置更新时, 玩家的额外处理
%% 返回#backact_info
listen_fast_load_config(OpType, BackActInfo) ->
	?DEBUG("player fast load config: ~p ~p ~p", [BackActInfo#backact_info.main_type, BackActInfo#backact_info.id, OpType]),
	BackActInfo.

%% 运营活动强制关闭或玩家上线时活动不存在都视为强制关闭，此时都会调用此接口
listen_backactivity_force_close(BackActivity, PlayerBackActInfo) ->
	?DEBUG("player backactivity force close: ~p ~p ~p", [
		PlayerBackActInfo#backact_info.main_type,
		PlayerBackActInfo#backact_info.id,
		BackActivity#backactivity.state]),
	ok.

%% 有新插入的运营活动数据时调用
listen_backactivity_new(OpType, BackActInfo) ->
	#backact_info{
		id = ActIndex,
		main_type = MainType,
		backactivity = BackActivity
	} = BackActInfo,
	?DEBUG("player new backactivity: ~p ~p ~p ~p", [MainType, ActIndex, OpType, BackActivity#backactivity.state]),
	ok.

%% 运营活动开始时调用
listen_backactivity_start(MainType, OpType, BackActInfo, OldState) ->
	?DEBUG("player backactivity start: ~p ~p ~p ~p", [MainType, OpType, BackActInfo#backact_info.id, OldState]),
	ok.

%% 运营活动结束时调用
listen_backactivity_stop(MainType, OpType, BackActInfo, OldState) ->
	?DEBUG("player backactivity stop: ~p ~p ~p ~p", [MainType, OpType, BackActInfo#backact_info.id, OldState]),
	ok.

%% 运营活动消失时调用
listen_backactivity_disappear(MainType, OpType, BackActInfo, OldState) ->
	?DEBUG("player backactivity disappear: ~p ~p ~p ~p", [MainType, OpType, BackActInfo#backact_info.id, OldState]),
	ok.

%% 根据活动主类型MainType遍历所有的运营活动，调用回调函数Func
%% 回调函数Func的第一个参数一定是#backact_info{},后续参数是Args
listen_backactivity_by_main_type(MainType, Func, Args) ->
	BackActInfoList = lib_player_backactivity:get_open_backact_list_by_main_type(MainType),
	listen_backactivity_by_main_type(MainType, Func, Args, BackActInfoList).
listen_backactivity_by_main_type(_MainType, _Func, _Args, []) ->
	ok;
listen_backactivity_by_main_type(MainType, Func, Args, [BackActInfo | T]) ->
	erlang:apply(Func, [BackActInfo | Args]),
	listen_backactivity_by_main_type(MainType, Func, Args, T).

