%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_vip
%%% Created on : 2020/8/28 0028 17:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_vip).
-author("glendy").
-include("common.hrl").
-include("vip.hrl").
-include("ProtoClient_10112.hrl").

%% API
-export([
	put_player_vip/2,
	get_player_vip/0,
	ets_init/0,
	build_index/0,
	player_vip_handler/0,
	vip_level/0
]).

-export([
	request_vip_pannel/0,
	check_vip_level/0,
	test_vip_command/4
]).

put_player_vip(PlayerVip, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_VIP),
	erlang:put(?ETS_PLAYER_VIP, PlayerVip).

get_player_vip() ->
	erlang:get(?ETS_PLAYER_VIP).

ets_init() ->
	ets:new(?ETS_PLAYER_VIP, [?ETS_KEY_POS(#player_vip.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_VIP, {?TUPLE_INT(<<"id">>, 1)}, true),
	ok.

player_vip_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_VIP,
		table_name = ?DBPLAYER_VIP,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_vip:ets_init/0,
		mongo_index_func = fun lib_player_vip:build_index/0,
		load_func = fun db_player_vip:load_player_vip/1,
		save_func = fun db_player_vip:save_player_vip/1,
		get_func = fun lib_player_vip:get_player_vip/0,
		put_func = fun lib_player_vip:put_player_vip/2
	}.

vip_level() ->
	PlayerVip = get_player_vip(),
	PlayerVip#player_vip.vip_level.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
request_vip_pannel() ->
	Respond = #'Proto50112001'{
		vip_level = vip_level(),
		recharge_money = lib_money_api:get_total_recharge_money()
	},
	?DEBUG("vip pannel: ~w", [Respond]),
	lib_send:respond_to_client(Respond).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 充值时检查vip等级是否可以升级
check_vip_level() ->
	VipLevel = vip_level(),
	TotalMoney = lib_money_api:get_total_recharge_money(),
	check_vip_level(TotalMoney, VipLevel).
check_vip_level(TotalMoney, VipLevel) ->
	NextVipLevel = VipLevel + 1,
	?INFO("NextVipLevel ~p",[NextVipLevel]),
	Conf = tb_vip:get(NextVipLevel),
	if
		Conf =/= false ->
			NeedMoney = maps:get(money, Conf),
			if
				NeedMoney =< TotalMoney ->
					update_vip_level(),
					check_vip_level(TotalMoney, NextVipLevel);
				true -> ok
			end;
		true -> ok
	end.

%% vip等级
update_vip_level() ->
	#player_vip{
		id = PlayerId,
		vip_level = VipLevel
	} = PlayerVip = get_player_vip(),
	put_player_vip(PlayerVip#player_vip{
		vip_level = VipLevel + 1
	}, true),
	lib_player_vip_listen:listen_vip_level_up(PlayerId, VipLevel, VipLevel + 1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
test_vip_command(Par1, Par2, Par3, Par4) ->
	if
		Par1 =:= 1 -> request_vip_pannel();
		true ->
			?WARNING("test vip: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
	end.
