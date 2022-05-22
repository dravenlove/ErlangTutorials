%%--- coding:utf-8 ---

%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 十月 2019 15:57
%%%-------------------------------------------------------------------
-module(lib_use_item).
-author("Administrator").
-include("common.hrl").
-include("ProtoClient_10103.hrl").

%% API
-export([
	request_use_pack_item/1,
	request_use_one_key/0,

	process_use_fixed_gift/2,
	process_use_random_gift/2,
	process_use_hybrid_gift/2
]).

request_use_pack_item(Msg) ->
	#'Proto10103003'{pack_type = PackType, unique_id = UniqueId, amount = UseAmount, use_argv = UseArgv} = Msg,
	?DEBUG("request_use_pack_item ~p~n", [Msg]),
	{Check, PackItem} = lib_player_pack:find_by_unique_id(PackType, UniqueId),
	?JUDGE_RETURN(Check =:= true, ?ERR_PACK_AMOUNT),
	?JUDGE_RETURN(PackItem#item.amount >= UseAmount, ?ERR_PACK_AMOUNT),

	ItemConf = tb_item:get(PackItem#item.item_id),
	?JUDGE_RETURN(ItemConf =/= false, ?ERROR_ITEM_CONFIG_NO_EXIST),

	MainType = maps:get(main_type, ItemConf, 0),
	PackItems =
	case MainType of
		?ITEM_MAIN_TYPE_OPTION ->
			process_use_option_gift(PackItem#item.item_id, UseAmount, UseArgv);
		?ITEM_MAIN_TYPE_FIXED ->
			process_use_fixed_gift(PackItem#item.item_id, UseAmount);
		?ITEM_MAIN_TYPE_RANDOM ->
			process_use_random_gift(PackItem#item.item_id, UseAmount);
		?ITEM_MAIN_TYPE_HYBRID ->
			process_use_hybrid_gift(PackItem#item.item_id, UseAmount);
		_ ->
			?JUDGE_RETURN(false, ?ERROR_CONFIG_NOT_EXISTENT)
	end,

	Ret = lib_player_pack:auto_insert(PackItems, #serial_obj{insert_serial_type = ?ADD_OPTION_GIFT}),
	?JUDGE_RETURN(Ret =:= true, Ret),

	lib_player_pack:remove_item_unique_id(PackType, PackItem#item{amount = UseAmount}, #serial_obj{remove_serial_type = ?USE_ITEM_PLAYER_USE}),
	lib_send:respond_to_client(?MSG_RETURN_USE_ITEM).

%%使用自选宝箱
process_use_option_gift(GiftId, UseAmount, OptionId) ->
	Conf = tb_item:get(GiftId),
	RewardId = maps:get(param1, Conf, 0),
	?JUDGE_RETURN(RewardId > 0, ?ERROR_CONFIG_NOT_EXISTENT),
	RewardList = lib_config_api:get_gift_option_reward_list(RewardId),
	?JUDGE_RETURN(erlang:length(RewardList) >= OptionId, ?ERROR_INVALID_INDEX),
	ID = lists:nth(OptionId, RewardList),
	#{'item_id' := ItemId, 'item_amount' := ItemAmount} = tb_gift_option_reward:get(ID),
	PackItem0 = #item{item_id = ItemId, amount = ItemAmount * UseAmount},
	?INFO("option gift item ~p ~n", [OptionId]),
	[PackItem0].

%%使用固定宝箱
process_use_fixed_gift(GiftId, UseAmount) ->
	Conf = tb_item:get(GiftId),
	RewardId = maps:get(param1, Conf, 0),
	?JUDGE_RETURN(RewardId > 0, ?ERROR_CONFIG_NOT_EXISTENT),
	RewardList = lib_config_api:get_gift_fixed_reward_list(RewardId),
	?JUDGE_RETURN(erlang:length(RewardList) > 0, ?ERROR_INVALID_INDEX),
	lists:foldl(fun(ID, Acc) ->
		#{'item_id' := ItemId, 'item_amount' := ItemAmount} = tb_gift_fixed_reward:get(ID),
		[#item{item_id = ItemId, amount = ItemAmount * UseAmount} | Acc]
	end, [], RewardList).

process_use_random_gift(GiftId, UseAmount) ->
	Conf = tb_item:get(GiftId),
	RewardId = maps:get(param1, Conf, 0),
	?JUDGE_RETURN(RewardId > 0, ?ERROR_CONFIG_NOT_EXISTENT),
	get_random_gift_item(UseAmount, RewardId, []).

get_random_gift_item(0, _, PackItemList) ->
	PackItemList;
get_random_gift_item(LeftAmount, RewardId, PackItemList) ->
	PackItems = get_rand_good(RewardId),
	get_random_gift_item(LeftAmount - 1, RewardId, lists:append(PackItemList, PackItems)).


process_use_hybrid_gift(GiftId, UseAmount) ->
	Conf = tb_item:get(GiftId),
	RewardId = maps:get(param1, Conf, 0),
	?JUDGE_RETURN(RewardId > 0, ?ERROR_CONFIG_NOT_EXISTENT),
	RewardList = lib_config_api:get_gift_hybrid_fixed_reward_list(RewardId),
	?JUDGE_RETURN(erlang:length(RewardList) > 0, ?ERROR_INVALID_INDEX),
	PackItems =
	lists:foldl(fun(ID, Acc) ->
		#{'item_id' := ItemId, 'item_amount' := ItemAmount} = tb_gift_hybrid_fixed_reward:get(ID),
		[#item{item_id = ItemId, amount = ItemAmount * UseAmount} | Acc]
	end, [], RewardList),

	RewardId0 = maps:get(param2, Conf, 0),
	?JUDGE_RETURN(RewardId0 > 0, ?ERROR_CONFIG_NOT_EXISTENT),
	Times = max(1, min(maps:get(param3, Conf, 0), 999)),
	PackItems0 = get_hybrid_gift_item(UseAmount * Times, RewardId0, []),

	lists:append(PackItems, PackItems0).

get_hybrid_gift_item(0, _, PackItemList) ->
	PackItemList;
get_hybrid_gift_item(LeftAmount, RewardId, PackItemList) ->
	PackItems = get_hybrid_rand_good(RewardId),
	get_hybrid_gift_item(LeftAmount - 1, RewardId, lists:append(PackItemList, PackItems)).


get_rand_good(DropId) ->
	DropGroupList = lib_config_api:get_gift_rand_group_list(DropId),
	lists:foldl(fun(ID, Acc) ->
		try
			Conf = tb_gift_rand_group:get(ID),
			DropRand = maps:get(drop_rate, Conf, 0),
			case rand:uniform() =< DropRand of
				true ->
					PackItem = get_rand_good_by_drop_id(ID),
					[PackItem | Acc];
				_ ->
					Acc
			end
		catch
			_:SelPackItem -> [SelPackItem | Acc]
		end
	end, [], DropGroupList).
get_rand_good_by_drop_id(RewardId) ->
	DropRewardList = lib_config_api:get_gift_rand_reward_list(RewardId),
	TotalWeight = lib_config_api:get_gift_rand_weight(RewardId),
	get_rand_good_by_drop_weight(TotalWeight, DropRewardList).
get_rand_good_by_drop_weight(TotalWeight, DropRewardList) ->
	RandWeight = util:rand(TotalWeight) - 1,
	lists:foldl(fun(ID, WeightAcc) ->
		#{'item_id' := ItemId, 'item_amount' := ItemAmount, 'weight' := Weight} = tb_gift_rand_reward:get(ID),
		case RandWeight < (WeightAcc + Weight) of
			true ->
				throw(#item{item_id = ItemId, amount = ItemAmount});
			false ->
				WeightAcc + Weight
		end
	end, 0, DropRewardList).


get_hybrid_rand_good(DropId) ->
	DropGroupList = lib_config_api:get_gift_hybrid_group_list(DropId),
	lists:foldl(fun(ID, Acc) ->
		try
			Conf = tb_gift_hybrid_group:get(ID),
			DropRand = maps:get(drop_rate, Conf, 0),
			case rand:uniform() =< DropRand of
				true ->
					PackItem = get_hybrid_rand_good_by_drop_id(ID),
					[PackItem | Acc];
				_ ->
					Acc
			end
		catch
			_:SelPackItem -> [SelPackItem | Acc]
		end
	end, [], DropGroupList).
get_hybrid_rand_good_by_drop_id(RewardId) ->
	DropRewardList = lib_config_api:get_gift_hybrid_reward_list(RewardId),
	TotalWeight = lib_config_api:get_gift_hybrid_weight(RewardId),
	get_hybrid_rand_good_by_drop_weight(TotalWeight, DropRewardList).
get_hybrid_rand_good_by_drop_weight(TotalWeight, DropRewardList) ->
	RandWeight = util:rand(TotalWeight) - 1,
	lists:foldl(fun(ID, WeightAcc) ->
		#{'item_id' := ItemId, 'item_amount' := ItemAmount, 'weight' := Weight} = tb_gift_hybrid_reward:get(ID),
		case RandWeight < (WeightAcc + Weight) of
			true ->
				throw(#item{item_id = ItemId, amount = ItemAmount});
			false ->
				WeightAcc + Weight
		end
	end, 0, DropRewardList).

request_use_one_key() ->
	ItemList = get_use_item_list(),
	AddPackItems =
	lists:foldl(fun(PackItem, Acc) ->
		ItemConf = tb_item:get(PackItem#item.item_id),
		MainType = maps:get(main_type, ItemConf, 0),
		PackItems =
			case MainType of
				?ITEM_MAIN_TYPE_FIXED ->
					process_use_fixed_gift(PackItem#item.item_id, PackItem#item.amount);
				?ITEM_MAIN_TYPE_RANDOM ->
					process_use_random_gift(PackItem#item.item_id, PackItem#item.amount);
				?ITEM_MAIN_TYPE_HYBRID ->
					process_use_hybrid_gift(PackItem#item.item_id, PackItem#item.amount);
				_ ->
					[]
			end,
		lists:append(PackItems, Acc)
	end, [], ItemList),

	Ret = lib_player_pack:validate_remove(ItemList),
	?PACK_IS_SUCCESS(Ret),

	lib_player_pack:auto_remove(ItemList, ?REMOVE_SERIAL(?USE_ITEM_PLAYER_USE,0)),
	lib_player_pack:auto_insert(AddPackItems, ?INSERT_SERIAL(?ADD_OPTION_GIFT,0)).

get_use_item_list() ->
	PlayerPack = lib_player_pack:get_player_pack(),
	NowTick = lib_timer:unixtime(),
	dict:fold(fun(_PackType, Package, Acc0) ->
		dict:fold(fun(_ID, PackItem, Acc1) ->
			MainType = lib_item_api:item_main_type(PackItem#item.item_id),
			if
				NowTick >= PackItem#item.overdue andalso PackItem#item.overdue > 0 ->
					Acc1;
				MainType =:= ?ITEM_MAIN_TYPE_FIXED orelse MainType =:= ?ITEM_MAIN_TYPE_RANDOM orelse MainType =:= ?ITEM_MAIN_TYPE_HYBRID ->
					[PackItem | Acc1];
				true ->
					Acc1
			end
		end, Acc0, Package#package.dict)
	end, [], PlayerPack#player_package.dict).
