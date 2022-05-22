%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: player_copy
%%% Created on : 2020/8/15 0015 10:48
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('player_copy_HRL').
-define('player_copy_HRL', true).

-record(player_copy, {	%% 离线玩家信息
	id = 0,		%% 玩家id
	player_show = undefined,	%% 玩家的模型信息ProtoShowRole
	online = 0,					%% 在线标识, 0 离线, 1 在线
	offline_tick = 0,			%% 离线时间戳
	fight_props = #{},		%% 战斗属性
	active_skill_map = #{},		%% 主动技能集合, key:skill_id, value: #fight_skill
	passive_skill_map = #{}		%% 被动技能集合, key:skill_id, value: #fight_skill
}).

-endif.
