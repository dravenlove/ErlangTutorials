%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_pack_api.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_player_pack).
-include("common.hrl").
-include("pack.hrl").
-include("ProtoClient_10103.hrl").

%% API
-export([
	get_all_diamond/0,			%%判断普通钻石和纯净钻石的总量
	auto_remove_diamond/3,	%%自动扣除钻石(数量)

	auto_insert/2,          %%道具自动插入
	auto_insert/4,
	validate_insert/1,      %%验证是否可以插入道具

	auto_remove/2,          %%道具自动删除
	auto_remove/3,
	validate_remove/1,      %%验证是否可以删除道具
	remove_item_unique_id/3,

	find_by_unique_id/2,    %%根据唯一ID查找(返回单个物品)
	count_by_id/1,          %%查找指定道具数量
	clean_package/2,

	left_pack_size/1,       %%背包剩余格子数

	update_item/2,          %%更新道具
	update_item/3,

	is_overdue/1,			%% 是否过期

	check_item_overdue/0,   %%
	insert_equip/4,

	init_package_dict/0,



	rend/0
]).

%% API
-export([
	request_pack_info/1
]).

%% API
-export([
	put_player_pack/1,
	put_player_pack/2,
	get_player_pack/0,
	ets_init/0,
	build_index/0,
	player_pack_handler/0,

	get_item_package/1,
	put_item_package/2
]).
put_player_pack(PlayerPack) ->
	put_player_pack(PlayerPack, false).
put_player_pack(PlayerPack, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_PACK),
	erlang:put(?ETS_PLAYER_PACK, PlayerPack).

get_player_pack() ->
	erlang:get(?ETS_PLAYER_PACK).

ets_init() ->
	ets:new(?ETS_PLAYER_PACK, [?ETS_KEY_POS(#player_package.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_PACK, {?TUPLE_INT(<<"id">>, 1), ?TUPLE_INT(<<"type">>, 1)}, true).

player_pack_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_PACK,
		table_name = ?DBPLAYER_PACK,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_pack:ets_init/0,
		mongo_index_func = fun lib_player_pack:build_index/0,
		load_func = fun db_player_pack:load_player_pack/1,
		save_func = fun db_player_pack:save_player_pack/1,
		get_func = fun lib_player_pack:get_player_pack/0,
		put_func = fun lib_player_pack:put_player_pack/2
	}.

get_item_package(PackType) ->
	PlayerPack = get_player_pack(),
	case dict:is_key(PackType, PlayerPack#player_package.dict) of
		true -> dict:fetch(PackType, PlayerPack#player_package.dict);
		_ -> false
	end.

put_item_package(PackType, Package) when erlang:is_record(Package, package) ->
	PlayerPack = get_player_pack(),
	put_player_pack(PlayerPack#player_package{dict = dict:store(PackType, Package, PlayerPack#player_package.dict)}).


validate_insert(PackItem) when is_record(PackItem, item) orelse is_record(PackItem, item_obj)->
	validate_insert([PackItem]);
validate_insert([Item | _] = ItemObjList) when is_record(Item, item_obj) ->
	PackItems = [lib_item_api:item_obj_to_pack_item(ItemObj) || ItemObj <- ItemObjList],
	validate_insert(PackItems);
validate_insert(PackItems) ->
	try
		TypeItemList = collect_pack_type(PackItems, dict:new()),
		%%检查插入
		dict:fold(fun(PackType, ItemList, _) ->
			?JUDGE_RETURN(check_pack_insert(PackType, ItemList), ?ERR_ITEM_PACK_CAPACITY)
		          end, 0, TypeItemList),
		?PACK_SUCCESS
	catch
		throw: {error, _} ->
			false
	end.

get_all_diamond()-> count_by_id(101001001)+count_by_id(101001002).


auto_remove_diamond(Num,USE,Reason)->
		Diamond1=count_by_id(101001001),
		Diamond2=count_by_id(101001002),
		case Num>Diamond2+Diamond1 of
			true->
				false;
				false->
					case Num>Diamond2 of
						true->
							Num1=Num-Diamond2,
							Num2=Diamond2,
							Diamond1_1=lib_item_api:conf_item_list_to_pack_item_list([[101001001,Num1]]),
							Diamond2_2=lib_item_api:conf_item_list_to_pack_item_list([[101001002,Num2]]),
							lib_player_pack:auto_remove(Diamond1_1, ?REMOVE_SERIAL(USE, Reason)),
							lib_player_pack:auto_remove(Diamond2_2, ?REMOVE_SERIAL(USE, Reason));
						false->
							Diamond2_2=lib_item_api:conf_item_list_to_pack_item_list([[101001002,Num]]),
							lib_player_pack:auto_remove(Diamond2_2, ?REMOVE_SERIAL(USE, Reason))
					end
		end.


auto_insert(PackItem, SerialObj) ->
	auto_insert(PackItem, SerialObj, true, ?PACK_TIPS1).
auto_insert(PackItem, SerialObj, IsNotify, Tips) when is_record(PackItem, item) orelse is_record(PackItem, item_obj) ->
	auto_insert([PackItem], SerialObj, IsNotify, Tips);
auto_insert([ItemObj | _] = ItemObjList, SerialObj, IsNotify, Tips) when is_record(ItemObj, item_obj) ->
	auto_insert(lib_item_api:item_obj_list_to_pack_item_list(ItemObjList), SerialObj, IsNotify, Tips);
auto_insert(PackItems, SerialObj, IsNotify, Tips) ->
	try
		TypeItemList = collect_pack_type(PackItems),
		dict:map(fun(PackType, ItemList) ->
			?JUDGE_RETURN(check_pack_insert(PackType, ItemList), ?ERR_ITEM_PACK_CAPACITY)
		end, TypeItemList),
		dict:map(fun(PackType, ItemList) ->
			Ret = insert_item(PackType, ItemList, SerialObj, IsNotify),
			?PACK_IS_SUCCESS(Ret)
		end, TypeItemList),
		notify_insert_tips(PackItems, Tips),
		?PACK_SUCCESS
	catch
		throw: {error, Ret} -> Ret
	end.

insert_item(PackType, PackItems, SerialObj, IsNotify) ->
	if
		PackType =:= ?PACK_TYPE_NUMBER ->
			lists:foreach(fun(MoneyItem) ->
				add_pack_money(MoneyItem#item.item_id, MoneyItem#item.amount, SerialObj)
			end, PackItems),
			?PACK_SUCCESS;
		true ->
			Package = get_item_package(PackType),
			case Package of false -> ?ERR_PACK_TYPE; _ ->
				case lib_pack_base:package_insert(Package, PackItems) of
					{true, RetPackage} ->
						put_item_package(PackType, RetPackage),
						package_insert_result(PackType, SerialObj, IsNotify),
						lib_player_process:process_update_item(PackType, PackItems),
						?PACK_SUCCESS;
					{false, Ret} -> Ret end end
	end.

insert_equip(PackType, PackItem, SerialObj, IsNotify) ->
	Package = get_item_package(PackType),
	case Package of
		false -> {false, ?ERR_PACK_TYPE};
		_ ->
			case lib_pack_base:insert_equip_to_emptygrid(Package, PackItem) of
				{true, RetPackage, UniqueId} ->
					put_item_package(PackType, RetPackage),
					package_insert_result(PackType, SerialObj, IsNotify),

					lib_player_process:process_insert_equip(),
					{true, UniqueId};
				Ret -> Ret
			end
	end.

%%处理插入结果
package_insert_result(PackType, SerialObj, IsNotify) ->
	Package = get_item_package(PackType),
	case Package of
		false -> skip;
		_ ->
			%%插入流水
			process_inset_serial(SerialObj, Package#package.insert_result),
			%%通知背包变化
			case IsNotify of true -> notify_item_insert_result(PackType); false -> skip end
	end.

%%处理删除结果
package_remove_result(PackType, SerialObj, Notify) ->
	Package = get_item_package(PackType),
	case Package of
		false -> skip;
		_ ->
			#package{remove_result = RemoveResult} = Package,
			%%插入流水
			process_remove_serial(SerialObj, RemoveResult),
			%%通知背包变化
			case Notify of
				true ->
					notify_item_remove_result(PackType);
				false ->
					skip
			end
	end.

process_inset_serial(SerialObj, PackItems) ->
	PlayerBase = lib_player:get_player_base(),
	lists:foldl(fun(PackItem, _) ->
		lib_serial_api:serial_item(PlayerBase, SerialObj, PackItem),
		todo%%lib_player_handle:process_item_insert(SerialObj, PackItem)
	end, 0, PackItems).

process_remove_serial(SerialObj, PackItems) ->
	PlayerBase = lib_player:get_player_base(),
	lists:foldl(fun(PackItem, _) ->
			lib_serial_api:serial_item(PlayerBase, SerialObj, PackItem),
			todo%%lib_player_handle:process_item_remove(SerialObj, PackItem)
	end, 0, PackItems).


%%通知插入结果
notify_item_insert_result(PackType) ->
	Package = get_item_package(PackType),
	case Package of
		false -> skip;
		_ ->
			#package{insert_result = RemoveResult} = Package,
			ProtoMsg = #'Proto80103006'{type = PackType},

			NewProtoMsg = lists:foldl(fun(PackItem, ProtoMsg0) ->
				ItemList = ProtoMsg0#'Proto80103006'.item_list,
				ProtoMsg0#'Proto80103006'{item_list = [lib_item_api:serialize_proto_item(PackItem) | ItemList]}
			end, ProtoMsg, RemoveResult),
			lib_send:respond_to_client(NewProtoMsg)
	end.

%%通知删除结果
notify_item_remove_result(PackType) ->
	Package = get_item_package(PackType),
	case Package of
		false -> skip;
		_ ->
			#package{remove_result = RemoveResult} = Package,
			ProtoMsg = #'Proto80103007'{type = PackType},
			NewProtoMsg = lists:foldl(fun(PackItem, ProtoMsg0) ->
				ItemList = ProtoMsg0#'Proto80103007'.item_list,
				ProtoMsg0#'Proto80103007'{item_list = [lib_item_api:serialize_proto_item(PackItem) | ItemList]}
			end, ProtoMsg, RemoveResult),
			case erlang:length(NewProtoMsg#'Proto80103007'.item_list) > 0 of
				true ->
					lib_send:respond_to_client(NewProtoMsg);
				_ ->
					skip
			end
	end.

notify_insert_tips(PackItems, Tips) ->
	ItemList = lists:foldl(fun(Item, ItemList0) ->
		[#'ProtoItem'{id = Item#item.item_id, amount = Item#item.amount} | ItemList0]
	end, [], PackItems),
	ProtoMsg = #'Proto80103005'{item_list = ItemList, tips_type = Tips},
	?DEBUG("~p~n", [ProtoMsg]),
	lib_send:respond_to_client(ProtoMsg).

check_pack_insert(PackType, PackItem) when is_record(PackItem, item) ->
	check_pack_insert(PackType, [PackItem]);
check_pack_insert(PackType, PackItems) ->
	if PackType =:= ?PACK_TYPE_NUMBER -> is_money_item_list(PackItems);
	true -> Package = get_item_package(PackType), case Package of false -> false;
	_ -> lib_pack_base:check_package_insert(Package, PackItems) end end.

auto_remove(PackItem, SerialObj) ->
	auto_remove(PackItem, SerialObj, true).
auto_remove(PackItem, SerialObj, IsNotify) when is_record(PackItem, item) orelse is_record(PackItem, item_obj) ->
	auto_remove([PackItem], SerialObj, IsNotify);
auto_remove([ItemObj | _] = ItemObjList, SerialObj, IsNotify) when is_record(ItemObj, item_obj) ->
	auto_remove(lib_item_api:item_obj_list_to_pack_item_list(ItemObjList), SerialObj, IsNotify);
auto_remove(PackItems, SerialObj, IsNotify) ->
	try
		TypeItemList = collect_pack_type(PackItems, dict:new()),
		%%检查删除
		dict:fold(fun(PackType, ItemList, _) ->
			case check_remove_item(PackType, ItemList) of
				true ->
					skip;
				false ->
					case PackType =:= ?PACK_TYPE_NUMBER of
						true ->
							?JUDGE_RETURN(false, ?ERR_MONEY_AMOUNT);
						false ->
							?JUDGE_RETURN(false, ?ERR_PACK_AMOUNT)
					end
			end
		end, 0, TypeItemList),
		%%开始删除
		dict:fold(fun(PackType, ItemList, _) ->
			Ret = remove_item(PackType, ItemList, SerialObj, IsNotify),
			?JUDGE_RETURN(Ret =:= true, Ret)
		end, 0, TypeItemList),
		?PACK_SUCCESS
	catch
		throw: {error, Ret} -> Ret
	end.

remove_item(PackType, PackItem, SerialObj, Notify) when is_record(PackItem, item) ->
	remove_item(PackType, [PackItem], SerialObj, Notify);
remove_item(PackType, PackItems, SerialObj, Notify) ->
	case PackType =:= ?PACK_TYPE_NUMBER of
		true ->
			sub_pack_money(PackItems, SerialObj);
		false ->
			Package = get_item_package(PackType),
			case Package of
				false -> ?ERR_PACK_TYPE;
				_ ->
					case lib_pack_base:package_remove_by_id(Package, PackItems) of
						{true, RetPackage} ->
							put_item_package(PackType, RetPackage),
							%%处理删除结果
							package_remove_result(PackType, SerialObj, Notify),
							true;
						{false, Ret} -> Ret
					end
			end
	end.

validate_remove(PackItem) when is_record(PackItem, item) orelse is_record(PackItem, item_obj)->
	validate_remove([PackItem]);
validate_remove([Item | _] = ItemObjList) when is_record(Item, item_obj) ->
	PackItems = [lib_item_api:item_obj_to_pack_item(ItemObj) || ItemObj <- ItemObjList],
	validate_remove(PackItems);
validate_remove(PackItems) ->
	try
		TypeItemList = collect_pack_type(PackItems, dict:new()),
		dict:fold(fun(PackType, ItemList, _) ->
			case check_remove_item(PackType, ItemList) of
				true ->
					skip;
				false ->
					throw({error, ?ERR_PACK_AMOUNT})
			end
		end, 0, TypeItemList),
		?PACK_SUCCESS
	catch
		throw: {error, ErrCode} -> ErrCode
	end.

%%根据ID删除物品(区分绑定状态)
%%参数 PackType背包类型， PackItems物品列表， SerialObj删除流水， Notify是否通知
%%返回 成功 true， 失败 Ret
remove_item_unique_id(PackType, PackItem, SerialObj) ->
	remove_item_unique_id(PackType, PackItem, SerialObj, true).
remove_item_unique_id(PackType, PackItem, SerialObj, Notify) when is_record(PackItem, item) ->
	remove_item_unique_id(PackType, [PackItem], SerialObj, Notify);
remove_item_unique_id(PackType, PackItems, SerialObj, Notify) ->
	?JUDGE_RETURN(tb_package:get(PackType) =/= false, ?ERR_PACK_TYPE),

	Package = get_item_package(PackType),
	case Package of
		false -> ?ERR_PACK_TYPE;
		_ ->
			case lib_pack_base:package_remove_by_unique_id(Package, PackItems) of
				{true, RetPackage} ->
					put_item_package(PackType, RetPackage),
					%%处理删除结果
					package_remove_result(PackType, SerialObj, Notify),
					true;
				{false, Ret} ->
					Ret
			end
	end.

check_remove_item(PackType, PackItem) when is_record(PackItem, item) ->
	check_remove_item(PackType, [PackItem]);
check_remove_item(PackType, PackItems) ->
	case PackType =:= ?PACK_TYPE_NUMBER of
		true ->
			check_pack_money(PackItems);
		false ->
			Package = get_item_package(PackType),
			case Package of
				false -> false;
				_ ->
					lib_pack_base:check_package_remove_by_id(Package, PackItems)
			end
	end.

find_by_unique_id(PackType, PackItem) ->
	Package = get_item_package(PackType),
	case Package of
		false -> {false, ?ERR_PACK_TYPE};
		_ ->
			lib_pack_base:find_by_unique_id(Package, PackItem)
	end.

%%查找指定道具的数量
%%返回int
count_by_id(PackItem)  when is_record(PackItem, item) ->
	count_by_id(PackItem#item.item_id);
count_by_id(ItemId) ->
	PackType = get_item_type(ItemId),
	case PackType =/= false of
		true ->
			count_by_id(PackType, ItemId);
		false ->
			0
	end.
count_by_id(PackType, ItemId) ->
	if
		PackType =:= ?PACK_TYPE_NUMBER ->
			lib_money_api:get_resources_count(ItemId);
		true ->
			Package = get_item_package(PackType),
			case Package of
				false -> 0;
				_ ->
					lib_pack_base:count_by_id(Package, ItemId)
			end
	end.

clean_package(0, SerialObj) ->
	lists:foldl(fun(PackType, Acc0) ->
			if
				PackType > 0 -> clean_package(PackType, SerialObj), Acc0;
				true -> Acc0
			end
	end, 0, tb_package:get_list());
clean_package(PackType, SerialObj) ->
	clean_package(PackType, SerialObj, true).
clean_package(PackType, SerialObj, Notify) ->
	Package = get_item_package(PackType),
	case Package of
		false -> ?ERR_PACK_TYPE;
		_ ->
			RetPackage = lib_pack_base:clean_package(Package),
			package_remove_result(PackType, SerialObj, Notify),
			put_item_package(PackType, RetPackage),
			lib_equip_api:check_hero_by_equip()
	end.

init_package_dict() ->
	init_package_dict(dict:new(), tb_package:get_list()).
init_package_dict(Dict, []) ->
	Dict;
init_package_dict(Dict, [PackType | T]) ->
	#{max_size:=MaxSize} = tb_package:get(PackType),
	Package = #package{
		package_type = PackType,
		max_size = MaxSize
	},
	NewDict = dict:store(PackType, Package, Dict),
	init_package_dict(NewDict, T).

is_money_item(PackItem) when is_record(PackItem, item) ->
	is_money_item(PackItem#item.item_id);
is_money_item(ItemId) ->
	ItemConf = tb_item:get(ItemId),
	ItemType = maps:get(main_type, ItemConf, 0),
	if ItemType =:= ?ITEM_MAIN_TYPE_MONEY -> true; true -> false end.
is_money_item_list([]) ->
	true;
is_money_item_list([PackItem | T]) ->
	case is_money_item(PackItem#item.item_id) of
		true -> is_money_item_list(T); false -> false end.

collect_pack_type(PackItems) ->
	collect_pack_type(PackItems, dict:new()).
collect_pack_type([], TypeItemListDict) ->
	TypeItemListDict;
collect_pack_type([PackItem | T], TypeItemListDict) when is_record(PackItem, item)->
	PackType = get_item_type(PackItem),
	?JUDGE_RETURN(PackType =/= false, ?ERROR_ITEM_CONF_PACK_TYPE),
	PackConf = tb_package:get(PackType),
	?JUDGE_RETURN(PackType =:= ?PACK_TYPE_NUMBER orelse PackConf =/= false, ?ERROR_ITEM_CONF_PACK_TYPE),
	NewItemList = case dict:find(PackType, TypeItemListDict) of {ok, ItemList} ->
		[PackItem | ItemList];  _ -> [PackItem] end,
	NewTypeItemListsMap = dict:store(PackType, NewItemList, TypeItemListDict),
	collect_pack_type(T, NewTypeItemListsMap).

get_item_type(PackItem) when is_record(PackItem, item)->
	get_item_type(PackItem#item.item_id);
get_item_type(ItemId) when is_integer(ItemId) ->
	ItemConf = tb_item:get(ItemId),
	case ItemConf =:= false of
		true ->
			false;
		false ->
			maps:get(type, ItemConf)
	end.

left_pack_size(PackType) ->
	Package = get_item_package(PackType),
	case Package of
		false -> 0;
		_ ->
			lists:max([0, Package#package.max_size - dict:size(Package#package.dict)])
	end.

%%更新道具信息（根据唯一ID覆盖物品)
%%参数 PackType背包类型， PackItem物品，Flag是否通知前端
%%返回 成功 true， 失败{false，Ret}
update_item(PackType, PackItem) ->
	?DEBUG("更新道具"),
	update_item(PackType, PackItem, true)
.
update_item(PackType, PackItem, Flag) ->
	case tb_package:get(PackType) of
		false ->
			false;
		_ ->
			Package = get_item_package(PackType),
			case lib_pack_base:package_update_item(Package, PackItem) of
				{true, RetPackage} ->
					put_item_package(PackType, RetPackage),
					lib_player_process:process_update_item(PackType, PackItem),
					case Flag of
						true -> notify_item_update(PackType, PackItem);
						false -> skip
					end,
					?PACK_SUCCESS;
				{false, Ret} ->
					{false, Ret}
			end
	end.
%%通知物品更新
notify_item_update(PackType, PackItem) when is_record(PackItem, item) ->
	notify_item_update(PackType, [PackItem]);
notify_item_update(PackType, PackItems) ->
	Res = #'Proto80103008'{
		type = PackType,
		item_list = [lib_item_api:serialize_proto_item(X) || X <- PackItems]
	},
	lib_send:respond_to_client(Res).


is_overdue(Item) ->
	lib_timer:unixtime() > Item#item.overdue andalso Item#item.overdue > 0.


get_player_money() ->
	lib_money_api:get_player_money().

add_pack_money(ItemId, Amount, SerialObj) ->
	?JUDGE_RETURN(Amount > 0, ?ERR_AMOUNT_NEGATIVE),
	#player_money{
		money_map = MoneyMap
	} = get_player_money(),
	OrgAmount = maps:get(ItemId, MoneyMap, 0),
	NewMoneyMap = maps:put(ItemId, trunc(OrgAmount + Amount), MoneyMap),
	lib_money_api:update_money_map(NewMoneyMap, SerialObj),
	lib_player_process:process_update_money(ItemId, Amount)
.

sub_pack_money(PackItems, SerialObj) ->
	case check_pack_money(PackItems) of
		true ->
			#player_money{money_map = MoneyMap} = get_player_money(),
			NewMoneyMap =
			lists:foldl(fun(MoneyItem, Acc) ->
				case MoneyItem#item.item_id of
					?ITEM_ID_SYSTEM_GOLD ->
						Org0 = maps:get(?ITEM_ID_SYSTEM_GOLD, Acc, 0),
						case Org0 >= MoneyItem#item.amount of
							true ->
								lib_player_process:process_use_money(MoneyItem, SerialObj),
								maps:put(MoneyItem#item.item_id, trunc(Org0 - MoneyItem#item.amount), Acc);
							_ ->
								Acc1 = maps:put(MoneyItem#item.item_id, 0, Acc),
								Org1 = maps:get(?ITEM_ID_GOLD, Acc1, 0),
								lib_player_process:process_use_money(MoneyItem, SerialObj),
								maps:put(?ITEM_ID_GOLD, trunc(Org1 + Org0 - MoneyItem#item.amount), Acc1)
						end;
					_ ->
						OrgAmount = maps:get(MoneyItem#item.item_id, Acc, 0),
						lib_player_process:process_use_money(MoneyItem, SerialObj),
						maps:put(MoneyItem#item.item_id, trunc(OrgAmount - MoneyItem#item.amount), Acc)
				end
			end, MoneyMap, PackItems),
			lib_money_api:update_money_map(NewMoneyMap, SerialObj), true;
		_ ->
			false
	end.

check_pack_money(PackItem) when is_record(PackItem, item) ->
	check_pack_money([PackItem]);
check_pack_money(PackItems) ->
	lists:foldl(fun(PackItem, Ret) ->
		case Ret of
			true -> check_pack_money(PackItem#item.item_id, PackItem#item.amount);
			false -> false
		end
	end, true, PackItems).
check_pack_money(ItemId, Amount) ->
	IsMoneyItem = is_money_item(ItemId),
	if
		IsMoneyItem =:= false -> false;
		Amount < 0 -> false;
		true ->
			#player_money{
				money_map = MoneyMap
			} = get_player_money(),
			case ItemId of
				?ITEM_ID_SYSTEM_GOLD ->
					maps:get(?ITEM_ID_GOLD, MoneyMap, 0) + maps:get(?ITEM_ID_SYSTEM_GOLD, MoneyMap, 0) >= Amount;
				_ ->
					maps:get(ItemId, MoneyMap, 0) >= Amount
			end
	end.


check_item_overdue() ->
	?DEBUG("check_item_overdue"),
	#player_package{dict = PackageDict} = get_player_pack(),
	NowTick = lib_timer:unixtime(),
	dict:map(fun(Type, Package) ->
		NewDict = check_overdue(Package#package.dict, NowTick),
		NewDict1 = check_remove(NewDict, NowTick),
		put_item_package(Type, Package#package{dict = NewDict1})
	end, PackageDict).

check_overdue(Dict, NowTick) ->
	NewDict =
	dict:fold(fun(UniqueId, PackItem, Acc) ->
		Conf = tb_item:get(PackItem#item.item_id),
		LimitType = maps:get(time_limit_type, Conf, 0),
		case LimitType of
			?ITEM_TIME_LIMIT_TYPE0 ->
				dict:store(UniqueId, PackItem, Acc);
			_ ->
				case NowTick > PackItem#item.remove_tick andalso not PackItem#item.notify_overdue of
					true ->
						%% notify overdue
						case maps:get(main_type, Conf) of
							?ITEM_MAIN_TYPE_TITLE ->
								lib_honor_title:add_overdue(PackItem);
							_ -> skip
						end,
						dict:store(UniqueId, PackItem#item{notify_overdue = true}, Acc);
					_ ->
						dict:store(UniqueId, PackItem, Acc)
				end
		end
	end, dict:new(), Dict),
	lib_honor_title:notify_overdue(),
	NewDict.

check_remove(Dict, NowTick) ->
	dict:fold(fun(UniqueId, PackItem, Acc) ->
		Conf = tb_item:get(PackItem#item.item_id),
		LimitType = maps:get(time_limit_type, Conf, 0),
		case LimitType of
			?ITEM_TIME_LIMIT_TYPE0 ->
				dict:store(UniqueId, PackItem, Acc);
			_ ->
				case NowTick > PackItem#item.remove_tick of
					true ->
						Reward = lists:foldl(fun([ItemId, Amount], Acc0) -> [[ItemId, Amount * PackItem#item.amount] | Acc0] end, [], maps:get(remove_reward, Conf, [])),
						Arg = #mail_arg{
							type = ?MAIL_ARG_TYPE_ITEM_OBJ,
							data = lib_item_api:pack_item_to_item_obj(PackItem)
						},
						case erlang:length(Reward) > 0 of
							true ->
								lib_mail_api:fast_send_mail(lib_player:player_id(), ?ITEM_OVERDUE_MAIL_ID, [Arg],
									lib_item_api:conf_item_list_to_pack_item_list(Reward), ?ADD_ITEM_OVERDUE_REWARD);
							_ ->
								skip
						end,
						remove_item_unique_id(get_item_type(PackItem), PackItem, #serial_obj{remove_serial_type = ?USE_ITEM_OVERDUE}),
						Acc;
					_ ->
						dict:store(UniqueId, PackItem, Acc)
				end
		end
	end, dict:new(), Dict).


%% 获取背包和资源信息
request_pack_info(Msg) ->
	#'Proto10103001'{type = PackType} = Msg,
	if
		PackType =:= 0 ->
			#player_money{
				money_map = MoneyMap
			} = get_player_money(),
			lib_money_api:notify_money_info(MoneyMap),
			#player_package{dict = PackageDict} = get_player_pack(),
			ItemList =
			dict:fold(fun(_, Package, Acc0) ->
				lists:append(lib_item_api:item_dict_to_proto_item_list(Package#package.dict), Acc0)
			end, [], PackageDict),
			lib_send:respond_to_client(#'Proto80103002'{item_list = ItemList});
		PackType =:= ?PACK_TYPE_NUMBER ->
			#player_money{
				money_map = MoneyMap
			} = get_player_money(),
			lib_money_api:notify_money_info(MoneyMap);
		true ->
			#player_package{dict = PackageDict} = get_player_pack(),
			?JUDGE_RETURN(dict:is_key(PackType, PackageDict) =:= true, ?ERROR_NO_PACK_TYPE),
			Package = dict:fetch(PackType, PackageDict),
			notify_package_info(Package)
	end,
	lib_send:respond_to_client(?MSG_RETURN_PACK_INFO).


notify_package_info(Package) ->
	Respond = #'Proto80103002'{
		type = Package#package.package_type,
		max_size = Package#package.max_size,
		item_list = lib_item_api:item_dict_to_proto_item_list(Package#package.dict)
	},
	?DEBUG("~p~n", [Respond]),
	lib_send:respond_to_client(Respond).

rend() ->
	rend.