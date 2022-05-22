%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_ba_cumulate_recharge
%%% Created on : 2020/8/28 0028 18:35
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_ba_cumulate_recharge).
-author("glendy").
-include("common.hrl").
-include("back_activity.hrl").
-include("ProtoClient_10108.hrl").

%% API
-export([
	init_backact_info/1,
	check_recharge_money/1,
	check_recharge_money/2
]).

-export([
	request_backact_info/1,
	request_cumulate_recharge_draw/1
]).

get_cumulate_recharge(BackActInfo) ->
	BackActInfo#backact_info.cumulate_recharge.

put_cumulate_recharge(CumulateRecharge, BackActInfo) ->
	NewBackActInfo = BackActInfo#backact_info{
		cumulate_recharge = CumulateRecharge
	},
	lib_player_backactivity:put_backact_info(NewBackActInfo, true).

%% 初始化#backact_info记录
init_backact_info(BackActInfo) ->
	BackActInfo#backact_info{
		cumulate_recharge = #ba_cumulate_recharge{}
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 返回累积充值的界面信息
request_backact_info(ActIndex) ->
	BackActInfo = lib_player_backactivity:get_backact_info(ActIndex),
	?JUDGE_RETURN(BackActInfo =/= undefined, ?ERROR_NO_BACKACT),
	#ba_cumulate_recharge{
		recharge_money = RechargeMoney,
		reward_map = RewardMap
	} = get_cumulate_recharge(BackActInfo),
	Respond = #'Proto50108003'{
		recharge_money = RechargeMoney,
		gear_list = serialize_gear_list(BackActInfo, RewardMap, lib_player_backactivity:get_conf_list(BackActInfo))
	},
	?DEBUG("cumulate recharge: ~p ~w", [lib_player:player_id(), Respond]),
	lib_send:respond_to_client(Respond).

request_cumulate_recharge_draw(Msg) ->
	#'Proto10108004'{act_index = ActIndex, id = RewardId} = Msg,
	BackActInfo = lib_player_backactivity:get_backact_info(ActIndex),
	?JUDGE_RETURN(BackActInfo =/= undefined, ?ERROR_NO_BACKACT),
	#ba_cumulate_recharge{
		reward_map = RewardMap
	} = CumulateRecharge = get_cumulate_recharge(BackActInfo),
	Conf = lib_player_backactivity:get_conf(RewardId, BackActInfo),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	Flag = maps:get(RewardId, RewardMap, 0),
	if
		Flag =:= 0 -> throw({error, ?ERROR_BACKACT_NO_REWARD});
		Flag =:= 2 -> throw({error, ?ERROR_BACKACT_DRAWED});
		true -> skip
	end,
	PackItemList = lib_item_api:conf_item_list_to_pack_item_list(maps:get(reward_items, Conf, [])),
	lib_player_pack:auto_insert(PackItemList, #serial_obj{insert_serial_type = ?ADD_BA_CUMULATE_RECHARGE, insert_sub_type = ActIndex}, true, ?PACK_TIPS1),
	NewRewardMap = maps:put(RewardId, 2, RewardMap),
	put_cumulate_recharge(CumulateRecharge#ba_cumulate_recharge{
		reward_map = NewRewardMap
	}, BackActInfo),
	lib_send:respond_to_client(?MSG_RETURN_BA_CUMULATE_RECHAREGE_DRAW).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 充值时处理逻辑
check_recharge_money(Money) ->
	lib_player_backactivity_listen:listen_backactivity_by_main_type(
		?BACKACT_TYPE_CUMULATE_RECHARGE,
		fun lib_player_ba_cumulate_recharge:check_recharge_money/2, [Money]).

check_recharge_money(BackActInfo, Money) ->
	#ba_cumulate_recharge{
		recharge_money = RechargeMoney,
		reward_map = RewardMap
	} = CumulateRecharge = get_cumulate_recharge(BackActInfo),
	NewRechargeMoney = RechargeMoney + Money,
	NewRewardMap = check_reward_map(RewardMap, BackActInfo, NewRechargeMoney, lib_player_backactivity:get_conf_list(BackActInfo)),
	NewCumulateRecharge = CumulateRecharge#ba_cumulate_recharge{
		recharge_money = NewRechargeMoney,
		reward_map = NewRewardMap
	},
	put_cumulate_recharge(NewCumulateRecharge, BackActInfo),
	ok.

check_reward_map(RewardMap, _BackActInfo, _RechargeMoney, []) ->
	RewardMap;
check_reward_map(RewardMap, BackActInfo, RechargeMoney, [Id | T]) ->
	NewRewardMap =
		try
			RewardFlag = maps:get(Id, RewardMap, 0),
			?JUDGE_RETURN(RewardFlag =:= 0, -1),
			#{cond_value:=CondMoney} = lib_player_backactivity:get_conf(Id, BackActInfo),
			?JUDGE_RETURN(RechargeMoney >= CondMoney, -1),
			maps:put(Id, 1, RewardMap)
		catch
			throw:{error, _ErrCode} -> RewardMap
		end,
	check_reward_map(NewRewardMap, BackActInfo, RechargeMoney, T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

serialize_gear_list(BackActInfo, RewardMap, IdList) ->
	serialize_gear_list([], BackActInfo, RewardMap, IdList).
serialize_gear_list(ProtoPairList, _BackActInfo, _RewardMap, []) ->
	lists:reverse(ProtoPairList);
serialize_gear_list(ProtoPairList, BackActInfo, RewardMap, [Id | T]) ->
	#{cond_value:=CondValue, reward_items:=RewardItems} = lib_player_backactivity:get_conf(Id, BackActInfo),
	Flag = maps:get(Id, RewardMap, 0),
	Proto = #'ProtoBackActReward'{
		id = Id,
		cond_float = CondValue,
		state = Flag,
		item_list = lib_item_api:serialize_proto_item_list(lib_item_api:conf_item_list_to_pack_item_list(RewardItems))
	},
	serialize_gear_list([Proto | ProtoPairList], BackActInfo, RewardMap, T).

