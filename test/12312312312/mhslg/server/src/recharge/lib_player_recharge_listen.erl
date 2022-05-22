%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_recharge_listen
%%% Created on : 2020/8/28 0028 17:01
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_recharge_listen).
-author("glendy").
-include("common.hrl").

%% API
-export([
	listen_recharge_money/3
]).

%% 其他功能在此处加充值时的回调函数
listen_recharge_money(ConfId, Money, Gold) ->
	?DEBUG("listen recharge money: ~p ~p ~p", [ConfId, Money, Gold]),
	%%lib_player_vip:check_vip_level(),
	lib_player_ba_cumulate_recharge:check_recharge_money(Money),
	welfare_exchange:recharge_money(Gold),
	%%lib_player_cluster_rank:refresh_rank_cluster_recharge(Money, Gold),
	ok.
