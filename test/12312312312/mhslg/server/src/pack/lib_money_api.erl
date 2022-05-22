%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_money_api
%%% Created on : 2020/8/12 0012 17:02
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_money_api).
-author("glendy").
-include("common.hrl").
-include("ProtoClient_10103.hrl").

%% API
-export([
	put_player_money/2,
	get_player_money/0,
	ets_init/0,
	build_index/0,
	player_money_handler/0,
	throw_money/1,
	update_money_map/2,
	notify_money_info/1,
	get_money_amount/1,
	get_total_recharge_money/0,

	get_resources_count/1,
	money_map_to_proto_list/1
]).

put_player_money(PlayerMoney, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_MONEY),
	erlang:put(?ETS_PLAYER_MONEY, PlayerMoney).

get_player_money() ->
	erlang:get(?ETS_PLAYER_MONEY).

ets_init() ->
	ets:new(?ETS_PLAYER_MONEY, [?ETS_KEY_POS(#player_money.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_MONEY, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_ORDER, {?TUPLE_INT(<<"order_id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_ORDER, {?TUPLE_INT(<<"role_id">>, 1)}, false),
	mongo_poolboy:async_ensure_index(?BACK_POOL, ?DBBACK_ORDER, {?TUPLE_INT(<<"flag">>, 1)}, false),
	ok.

player_money_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_MONEY,
		table_name = ?DBPLAYER_MONEY,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_money_api:ets_init/0,
		mongo_index_func = fun lib_money_api:build_index/0,
		load_func = fun db_player_money:load_player_money/1,
		save_func = fun db_player_money:save_player_money/1,
		get_func = fun lib_money_api:get_player_money/0,
		put_func = fun lib_money_api:put_player_money/2
	}.

throw_money(MoneyId) ->
	if
		MoneyId =:= ?ITEM_ID_GOLD -> throw({error, ?ERROR_GOLD_AMOUNT});
		MoneyId =:= ?ITEM_ID_SYSTEM_GOLD -> throw({error, ?ERROR_GOLD_AMOUNT});
		true -> throw({error, ?ERROR_RES_AMOUNT})
	end.

update_money_map(UpdateMoneyMap, SerialObj) ->
	update_money_map(maps:size(UpdateMoneyMap), UpdateMoneyMap, SerialObj).
update_money_map(0, _UpdateMoneyMap, _SerialObj) ->
	[];
update_money_map(_Size, UpdateMoneyMap, SerialObj) ->
	#player_money{
		money_map = MoneyMap
	} = PlayerMoney = get_player_money(),
	{ProtoItemList, InsertResult, RemoveResult, NewMoneyMap} = maps:fold(
		fun(MoneyId, NewAmount, {AccProtoItemList0, AccInsertResult0, AccRemoveResult0, AccMoneyMap0}) ->
			OrgAmount = maps:get(MoneyId, AccMoneyMap0, 0),
			VaryAmount = NewAmount - OrgAmount,
			AccMoneyMap1 = maps:put(MoneyId, NewAmount, AccMoneyMap0),
			if
				VaryAmount > 0 ->
					PackItem = #item{item_id = MoneyId, amount = VaryAmount},
					AccProtoItemList1 = [lib_item_api:serialize_proto_item(PackItem) | AccProtoItemList0],
					ResultAmount = maps:get(MoneyId, AccInsertResult0, 0),
					AccInsertResult1 = maps:put(MoneyId, ResultAmount + VaryAmount, AccInsertResult0),
					{AccProtoItemList1, AccInsertResult1, AccRemoveResult0, AccMoneyMap1};
				VaryAmount < 0 ->
					PackItem = #item{item_id = MoneyId, amount = VaryAmount},
					AccProtoItemList1 = [lib_item_api:serialize_proto_item(PackItem) | AccProtoItemList0],
					ResultAmount = maps:get(MoneyId, AccRemoveResult0, 0),
					AccRemoveResult1 = maps:put(MoneyId, ResultAmount + VaryAmount, AccRemoveResult0),
					{AccProtoItemList1, AccInsertResult0, AccRemoveResult1, AccMoneyMap1};
				true ->
					{AccProtoItemList0, AccInsertResult0, AccRemoveResult0, AccMoneyMap1}
			end
		end, {[], #{}, #{}, MoneyMap}, UpdateMoneyMap),
	put_player_money(PlayerMoney#player_money{
		money_map = NewMoneyMap
	}, true),
	notify_money_info(NewMoneyMap),
	listen_remove_money(RemoveResult, SerialObj),
	listen_insert_money(InsertResult, SerialObj),
	ProtoItemList.

get_resources_count(ItemId) ->
	#player_money{
		money_map = MoneyMap
	} = get_player_money(),
	maps:get(ItemId, MoneyMap, 0).

notify_money_info(MoneyMap) ->
	try
		MoneyList =
%%	lists:foldl(fun(ID, Acc) ->
%%		Num = maps:get(ID, MoneyMap, 0),
%%		[#'ProtoMoney'{
%%			id = ID,
%%			amount = Num
%%		} | Acc]
%%	end, [], tb_money_item:get_list()),
		maps:fold(fun(K, V, Acc) ->
			[#'ProtoMoney'{
				id = K,
				amount = V
			} | Acc]
		end, [], MoneyMap),
		?JUDGE_RETURN(erlang:length(MoneyList) > 0, 0),
		Respond = #'Proto80103004'{
			money_list = MoneyList
		},
		?DEBUG("notify_item_insert_result ~p~n", [Respond]),
		lib_send:respond_to_client(Respond)
	catch
	    _:_  -> ok
	end.

get_money_amount(ItemId) ->
	#player_money{
		money_map = MoneyMap
	} = get_player_money(),
	maps:get(ItemId, MoneyMap, 0).

%% 获取总充值金额
get_total_recharge_money() ->
	PlayerMoney = get_player_money(),
	PlayerMoney#player_money.total_recharge_money.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
money_map_to_proto_list(MoneyMap) ->
	maps:fold(
		fun(MoneyId, Amount, AccProtoMoneyList0) ->
			ProtoMoney = #'ProtoMoney'{
				id = MoneyId,
				amount = Amount
			},
			[ProtoMoney | AccProtoMoneyList0]
		end, [], MoneyMap).

listen_remove_money(RemoveResult, SerialObj) ->
	PlayerBase = lib_player:get_player_base(),
	PlayerBaseOther = lib_player:get_player_base_other(),
	#player_money{
		money_map = MoneyMap
	} = get_player_money(),
	maps:fold(
		fun(MoneyId, MoneyAmount, Acc0) ->
			%% 写入流水
			LeftAmount = maps:get(MoneyId, MoneyMap, 0),
			lib_serial_api:serial_money(PlayerBase, PlayerBaseOther,SerialObj, MoneyId, MoneyAmount, LeftAmount),
			Acc0
		end, ok, RemoveResult),
	ok.

listen_insert_money(InsertResult, SerialObj) ->
	PlayerBase = lib_player:get_player_base(),
	PlayerBaseOther = lib_player:get_player_base_other(),
	#player_money{
		money_map = MoneyMap
	} = get_player_money(),
	maps:fold(
		fun(MoneyId, MoneyAmount, Acc0) ->
			%% 写入流水
			LeftAmount = maps:get(MoneyId, MoneyMap, 0),
			lib_serial_api:serial_money(PlayerBase, PlayerBaseOther,SerialObj, MoneyId, MoneyAmount, LeftAmount),
			Acc0
		end, ok, InsertResult),
	ok.
