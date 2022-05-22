%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: friend
%%% Created on : 2020/8/21 0021 11:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('friend_HRL').
-define('friend_HRL', true).

-define(FRI_FRIEND_LIST_TYPE, 1).	%% 好友列表
-define(FRI_BLACK_LIST_TYPE, 2).	%% 黑名单列表
-define(FRI_APPLY_LIST_TYPE, 3).	%% 申请列表
-define(FRI_REMOVE_LIST_TYPE, 4).	%% 删除好友列表

-define(FRIEND_SYNC_LOGIN, 1).		%% 登录时同步
-define(FRIEND_SYNC_LOGOUT, 2).		%% 登出时同步
-define(FRIEND_SYNC_NORMAL, 3).		%% 其他情况时同步

-record(friend_state, {}).

-record(friend_other, {		%% 好感度等相关信息
	id = 0		%% 玩家id
}).

-record(player_friend, {
	id = 0,		%% 玩家id
	player_show = undefined, 	%% #'ProtoShowRole'
	online = 0,			%% 0 离线, 1 在线
	offline_tick = 0,	%% 离线时间戳
	friend_map = #{},	%% 好友, key: player_id, value: #friend_other
	black_map = #{},	%% 黑名单, key: player_id, value: #friend_other
	apply_list = [],	%% 申请id列表
	remove_friend_map = #{}	%% 已删除好友, key: player_id, value: #friend_other
}).

-endif.
