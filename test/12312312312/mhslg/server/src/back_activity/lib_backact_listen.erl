%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_backact_listen
%%% Created on : 2020/8/25 0025 17:36
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		运营活动每个子活动在这些接口处添加功能，没有就在需要的地方加一个新
%%%	的监听接口，再在此模块里加具体运营活动的代码
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_backact_listen).
-author("glendy").
-include("common.hrl").
-include("back_activity.hrl").

%% API
-export([
	listen_backactivity_fast_load_config/1,
	listen_backactivity_force_close/2,
	listen_backactivity_state/4,
	listen_backactivity_start/3,
	listen_backactivity_stop/3,
	listen_backactivity_disappear/3,
	async_listen_player_login/1,
	async_listen_player_logout/1
]).

%% 运营活动配置预处理
%% 写入到fast_conf字段
%% 返回新的#backactivity{}
listen_backactivity_fast_load_config(BackActivity) ->
	case BackActivity#backactivity.main_type of
		?BACKACT_TYPE_CUMULATE_RECHARGE ->
			lib_ba_cumulate_recharge:fast_load_config(BackActivity);
		_ ->
			BackActivity
	end.

%% 后台运营活动强制关闭
listen_backactivity_force_close(BackActivity, OldState) ->
	?INFO("backactivity force close: ~p ~p", [BackActivity#backactivity.act_index, OldState]),
	ok.

%% 后台运营活动状态变化时
listen_backactivity_state(Reason, BackActivity, OldState, NewState) ->
	?INFO("backactivity state change: ~p ~p ~p, reason[~p]", [BackActivity#backactivity.act_index, OldState, NewState, Reason]),
	case NewState of
		?BACKACT_STATE_START ->
			listen_backactivity_start(Reason, BackActivity, OldState);
		?BACKACT_STATE_STOP ->
			listen_backactivity_stop(Reason, BackActivity, OldState);
		?BACKACT_STATE_DISAPPEAR ->
			listen_backactivity_disappear(Reason, BackActivity, OldState);
		_ -> skip
	end,
	ok.

%% 运营活动开始时处理逻辑
listen_backactivity_start(Reason, BackActivity, OldState) ->
	?DEBUG("back activity start: ~p ~p ~p", [BackActivity#backactivity.act_index, OldState, Reason]),
	ok.

%% 运营活动结束时处理逻辑
listen_backactivity_stop(Reason, BackActivity, OldState) ->
	?DEBUG("back activity stop: ~p ~p ~p", [BackActivity#backactivity.act_index, OldState, Reason]),
	ok.

%% 运营活动消失时处理逻辑
listen_backactivity_disappear(Reason, BackActivity, OldState) ->
	?DEBUG("back activity disappear: ~p ~p ~p", [BackActivity#backactivity.act_index, OldState, Reason]),
	ok.

%% 玩家登录
async_listen_player_login(PlayerId) ->
	lib_backact_base:insert_online_player(PlayerId),
	BackActivityList = lib_backact_base:get_backactivity_list(),
	PlayerPid = lib_player:get_pid(PlayerId),
	mod_server:async_apply(PlayerPid, fun lib_player_backactivity:async_backactivity_when_login/1, [BackActivityList]),
	ok.

%% 玩家登出
async_listen_player_logout(PlayerId) ->
	lib_backact_base:remove_online_player(PlayerId),
	ok.