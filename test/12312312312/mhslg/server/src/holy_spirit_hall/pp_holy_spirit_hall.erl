%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 11:33 AM
%%%-------------------------------------------------------------------
-module(pp_holy_spirit_hall).
-author("df").
-include("common.hrl").
%% API
-export([
	handle/3
]).

%% 请求圣灵大厅信息
handle(?MSG_CLIENT_HOLY_SPIRIT_HALL_INFO, _, _) ->
	lib_holy_spirit_hall:request_holy_spirit_hall_info();

%% 请求英雄信息
handle(?MSG_CLIENT_HERO_INFO, _, Msg) ->
	lib_holy_spirit_hall:request_hero_info(Msg);

%% 请求更换上阵英雄
handle(?MSG_CLIENT_UPDATE_BATTLE_HERO, _, Msg) ->
	lib_holy_spirit_hall:request_update_batter_hero(Msg);

%% 请求解锁位置
handle(?MSG_CLIENT_UNLOCK_PLACE, _, Msg) ->
	lib_holy_spirit_hall:request_unlock_place(Msg);

%% 圣灵大厅升级
handle(?MSG_CLIENT_HOLY_SPIRIT_HALL_UPGRADE, _, Msg) ->
	lib_holy_spirit_hall:request_upgrade(Msg);

%% 请求圣灵大厅一键上阵
handle(?MSG_CLIENT_ONE_KEY_BATTLE, _, Msg) ->
	lib_holy_spirit_hall:request_one_key_battle(Msg);

handle(Recogn, _PlayerState, _Msg)->
	?WARNING("recharge no handle recogn: ~p ~n", [Recogn]),
	ok.