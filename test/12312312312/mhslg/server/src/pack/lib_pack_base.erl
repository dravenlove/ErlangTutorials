%%--- coding:utf-8 ---
%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 十月 2019 15:57
%%%-------------------------------------------------------------------
-module(lib_pack_base).
-author("Administrator").
-include("common.hrl").

%% API
-export([
	debug_package/1,
	left_pack_size/1,                     %%剩余格子

	check_package_insert/2,               %%检查叠加插入
	package_insert/2,                     %%叠加插入

	check_package_insert_no_merge/2,      %%检查不叠加插入
	package_insert_no_merge/2,            %%不叠加插入

	check_package_update_item/2,          %%检查更新道具信息
	package_update_item/2,                %%更新道具信息

	check_package_remove_by_id/2,         %%根据物品ID检查删除
	package_remove_by_id/2,               %%根据物品ID删除

	check_package_remove_by_id_bind/2,    %%根据物品ID和绑定状态检查删除
	package_remove_by_id_bind/2,          %%根据物品ID和绑定状态删除

	check_package_remove_by_unique_id/2,  %%根据唯一ID检查删除
	package_remove_by_unique_id/2,        %%根据唯一ID删除

	find_by_unique_id/2,                  %%根据唯一ID查找
	find_by_item_id/2,                    %%根据道具ID查找
	find_by_item_id_bind/2,               %%根据道具ID和绑定状态查找
	find_by_item_id_bind/3,               %%根据道具ID和绑定状态查找

	find_item_list_by_id/2,               %%根据道具ID查找，返回ID相同的列表List
	find_item_dict_by_id/2,               %%根据道具ID查找，返回ID相同的字典Dict

	count_by_id/2,                        %%查找指定道具数量
	count_by_id_bind/2,                   %%查找指定道具数量
	count_by_id_bind/3,                   %%查找指定道具数量

	clean_package/1,
	insert_equip_to_emptygrid/2
]).


set_item_unique_id(Package, PackItem) ->
	#package{pack_unique_id = UniqueId, package_type = PackType} = Package,

	PackItem0 = PackItem#item{unique_id = (UniqueId + 1)*100 + PackType},
	Package0 = Package#package{pack_unique_id = UniqueId + 1},

	{Package0, PackItem0}
.

set_item_opt_tick(PackItem) ->
	Conf = tb_item:get(PackItem#item.item_id),
	LimitType = maps:get(time_limit_type, Conf, 0),
	case LimitType of
		?ITEM_TIME_LIMIT_TYPE0 ->
			PackItem#item{opt_tick = lib_timer:unixtime()};
		?ITEM_TIME_LIMIT_TYPE1 ->
			NT0 = lib_timer:unixtime(),
			case PackItem#item.overdue > 0 andalso PackItem#item.remove_tick > 0 of
				true ->
					PackItem#item{opt_tick = lib_timer:unixtime()};
				_ ->
					A0 = maps:get(time_limit_value, Conf, [1]),
					B0 = lists:nth(1,A0),
					C0 = maps:get(overdue_remove, Conf, 0),
					PackItem#item{opt_tick = NT0, overdue = NT0 + B0 * lib_timer:minute_second(), remove_tick = NT0 + ((B0 + C0) * lib_timer:minute_second())}
			end;
		?ITEM_TIME_LIMIT_TYPE2 ->
			NT1 = lib_timer:unixtime(),
			A1 = maps:get(time_limit_value, Conf, []),
			OT1 = lib_timer:unixtime({{lists:nth(1,A1),lists:nth(2,A1),lists:nth(3,A1)},{lists:nth(4,A1),lists:nth(5,A1),lists:nth(6,A1)}}),
			C0 = maps:get(overdue_remove, Conf, 0),
			PackItem#item{opt_tick = NT1, overdue = OT1, remove_tick = OT1 + C0 * lib_timer:minute_second()}
	end.

%%背包剩余空格子
left_pack_size(Package) ->
	lists:max([0, Package#package.max_size - dict:size(Package#package.dict)]).

%%插入物品到新格子
%%成功返回{true, Package, InsertResult}, 失败返回{false,Ret}
insert_item_to_emptygrid(Package, PackItem, InsertResult) ->
	try
		#item{item_id = AddItemID, amount = ItemAmount} = PackItem,
		case ItemAmount > 0 of false -> throw({ok, Package, InsertResult}); _ -> skip end,

		RelPackItem = init_item(PackItem),

		LeftSize = left_pack_size(Package),
		?JUDGE_RETURN(LeftSize > 0, ?ERR_ITEM_PACK_CAPACITY),
		#package{dict = Dict} = Package,

		ItemConf = tb_item:get(AddItemID),
		AddItemOverAmount = conf_overlap(ItemConf),
		AddItemAmount = min(ItemAmount, AddItemOverAmount),
		LeftItemAmount = ItemAmount - AddItemAmount,
		LeftItemAmount0 = (if LeftItemAmount > 0 -> LeftItemAmount; true -> 0 end),
		{NewPackage, NewPackItem} = set_item_unique_id(Package, RelPackItem#item{amount = trunc(AddItemAmount), item_index = 0}),
		NewPackItem0 = set_item_opt_tick(NewPackItem),
		NewInsertResult = [NewPackItem0 | InsertResult],
		NewDict = dict:store(NewPackItem0#item.unique_id, NewPackItem0, Dict),
		insert_item_to_emptygrid(NewPackage#package{dict = NewDict}, RelPackItem#item{amount = LeftItemAmount0}, NewInsertResult)
	catch
		throw : {ok, ResPackage, ResInsertResult} -> {true, ResPackage, ResInsertResult};
		throw : {error, Ret} -> {false, Ret}
	end
.

%%插入单个道具到背包，自动叠加
%%成功返回{true, Package}, 失败返回{false,Ret}
insert_item(Package, PackItem) ->
	try
		#package{dict = Dict} = Package,
		#item{item_id = PackItemId, bind = PackItemBind, amount = AddAmount} = PackItem,
		?JUDGE_RETURN(AddAmount > 0, ?ERR_AMOUNT_NEGATIVE),

		ItemConf = tb_item:get(PackItemId),
		OverAmount = conf_overlap(ItemConf),

		{NewLeftAmount, NewDict, NewInsertResult} =
			case OverAmount > 1 of
				true ->	%%  优先叠加到ID和绑定状态相同的格子里。
					dict:fold(fun(UniqueId, ExistPackItem, {LeftAmount0, Dict0, InsertResult0}) ->
						case LeftAmount0 > 0 of false ->
							throw({ok, Package#package{dict = Dict0, insert_result = InsertResult0}}); _ -> skip end,
						#item{item_id = ExistItemId, bind = ExistItemBind, amount = ExistAmount} = ExistPackItem,

						CanOverAmount = OverAmount - ExistAmount,
						case PackItemId =:= ExistItemId andalso PackItemBind =:= ExistItemBind andalso CanOverAmount > 0 of
							true ->
								ExistPackItem0 = set_item_opt_tick(ExistPackItem),
								case CanOverAmount >= LeftAmount0 of
									true ->
										Dict1 = dict:store(UniqueId, ExistPackItem0#item{amount = trunc(ExistAmount + LeftAmount0)}, Dict0),
										{0, Dict1, [ExistPackItem0#item{amount = trunc(LeftAmount0)} | InsertResult0]};
									false ->
										Dict1 = dict:store(UniqueId, ExistPackItem0#item{amount = OverAmount}, Dict0),
										{LeftAmount0 - CanOverAmount, Dict1, [ExistPackItem0#item{amount = trunc(OverAmount - ExistAmount)} | InsertResult0]}
								end;
							false ->
								{LeftAmount0, Dict0, InsertResult0}
						end
					          end, {AddAmount, Dict, []}, Dict);
				false ->
					{AddAmount, Dict, []}
			end,

%%  插入到新格子
		case insert_item_to_emptygrid(Package#package{dict = NewDict}, PackItem#item{amount = NewLeftAmount}, NewInsertResult) of
			{true, RetPackage, RetInsertResult} -> throw({ok, RetPackage#package{insert_result = RetInsertResult}});
			{false, Return} -> throw({error, Return})
		end

	catch
		throw: {ok, ResPackage} -> {true, ResPackage};
		throw : {error, Ret} -> {false, Ret}
	end
.

%%插入物品不叠加
%%成功返回{true, Package}, 失败返回{false,Ret}
insert_item_no_merge(Package, PackItem) ->
	try
		case insert_item_to_emptygrid(Package, PackItem, []) of
			{true, ResPackage, ResInsertResult} -> throw({ok, ResPackage#package{insert_result = ResInsertResult}});
			{false, Ret} -> throw({error, Ret})
		end

	catch
		throw: {ok, ResPackage0} -> {true, ResPackage0};
		throw : {error, Ret0} -> {false, Ret0}
	end
.

%%插入多个物品
%%成功返回{true, Package}, 失败返回{false,Ret}
check_item_insert(Package, PackItem) when is_record(PackItem, item) ->
	check_item_insert(Package, [PackItem]);
check_item_insert(Package, []) ->
	{true, Package#package{insert_result = []}};
check_item_insert(Package, [PackItem | PackItems]) ->
	case insert_item(Package, PackItem) of
		{true, RetPackage} ->
			case check_item_insert(RetPackage, PackItems) of
				{true, NewResPkg} ->
					NewPackage = NewResPkg#package{insert_result = lists:append(RetPackage#package.insert_result, NewResPkg#package.insert_result)},
					{true, NewPackage};
				{error, Ret} -> {false, Ret}
			end;
		{false, Ret} ->
			{false, Ret}
	end
.

%%插入多个物品不叠加
%%成功返回{true, Package}, 失败返回{false,Ret}
check_item_insert_no_merge(Package, PackItem) when is_record(PackItem, item) ->
	check_item_insert_no_merge(Package, [PackItem]);
check_item_insert_no_merge(Package, []) ->
	{true, Package#package{insert_result = []}};
check_item_insert_no_merge(Package, [PackItem | PackItems]) ->
	?JUDGE_RETURN(PackItem#item.amount > 0, ?ERR_AMOUNT_NEGATIVE),
	case insert_item_no_merge(Package, PackItem) of
		{true, RetPackage} ->
			case check_item_insert_no_merge(RetPackage, PackItems) of
				{true, NewResPkg} ->
					NewPackage = NewResPkg#package{insert_result = lists:append(NewResPkg#package.insert_result, RetPackage#package.insert_result)},
					{true, NewPackage};
				{error, Ret} -> {false, Ret}
			end;
		{false, Ret} ->
			{false, Ret}
	end
.

%%检查能否插入
%%成功返回true, 失败返回false
check_package_insert(Package, PackItem) ->
	case check_item_insert(Package, PackItem) of
		{Res, _} -> Res
	end
.

%%插入物品
%%成功返回{true, Package}, 失败返回{false, Ret}
package_insert(Package, PackItem) ->
	case check_item_insert(Package, PackItem) of
		{true, ResPackage} -> {true, ResPackage};
		{false, Ret} -> {false, Ret}
	end
.

%%检查能否插入(不叠加)
%%成功返回true, 失败返回false
check_package_insert_no_merge(Package, PackItem) ->
	case check_item_insert_no_merge(Package, PackItem) of
		{Res, _} -> Res
	end
.

%%插入物品(不叠加)
%%成功返回{true, Package}, 失败返回{false, Ret}
package_insert_no_merge(Package, PackItem) ->
	case check_item_insert_no_merge(Package, PackItem) of
		{true, ResPackage} -> {true, ResPackage};
		{false, Ret} -> {false, Ret}
	end
.

%%更新道具信息
update_item(Package, PackItem0) ->
	try
		#package{dict = Dict} = Package,

		PackItem = PackItem0#item{amount = trunc(PackItem0#item.amount)},
		#item{unique_id = UniqueId, item_id = ItemId, amount = ItemAmount} = PackItem,

		Ret = dict:find(UniqueId, Dict),
		?JUDGE_RETURN(Ret =/= error, ?ERROR_ITEM_NO_EXIST),

		ItemConf = tb_item:get(ItemId),
		?JUDGE_RETURN(ItemConf =/= false, ?ERROR_ITEM_CONFIG_NO_EXIST),
		OverAmount = conf_overlap(ItemConf),
		?JUDGE_RETURN(OverAmount >= ItemAmount, ?ERROR_OVERLAP_LIMIT),

		NewDict = dict:store(UniqueId, PackItem, Dict),
		{true, Package#package{dict = NewDict}}
	catch
		throw : {error, Ret0} -> {false, Ret0}
	end
.

check_package_update_item(Package, PackItem) when is_record(PackItem, item) ->
	check_package_update_item(Package, [PackItem])
;
check_package_update_item(Package, []) ->
	{true, Package}
;
check_package_update_item(Package, [PackItem | PackItems]) ->
	case find_by_unique_id(Package, PackItem#item.unique_id) of
		{true, RetPackage} ->
			case check_package_update_item(RetPackage, PackItems) of
				{true, _} ->
					true;
				{error, _} ->
					false
			end;
		{false, _} ->
			false
	end
.

%%更新道具信息
package_update_item(Package, PackItem) when is_record(PackItem, item) ->
	package_update_item(Package, [PackItem])
;
package_update_item(Package, []) ->
	{true, Package}
;
package_update_item(Package, [PackItem | PackItems]) ->
	case update_item(Package, PackItem) of
		{true, RetPackage} ->
			case package_update_item(RetPackage, PackItems) of
				{true, RetPackage0} ->
					{true, RetPackage0};
				{error, Ret0} ->
					{false, Ret0}
			end;
		{false, Ret1} ->
			{false, Ret1}
	end
.

%%根据道具ID删除(不区分绑定状态)
%%成功返回{true, Package},失败返回{false, Ret}
remove_item_by_id(Package, PackItem, RemoveType) ->
	try
		#package{dict = Dict} = Package,
		#item{item_id = RemoveItemID, bind = RemoveItemBind, amount = LeftRemoveAmount1} = PackItem,
		LeftRemoveAmount = trunc(LeftRemoveAmount1),
		?JUDGE_RETURN(LeftRemoveAmount > 0, ?ERR_AMOUNT_NEGATIVE),

		%%道具ID相同的唯一ID列表
		UniqueList = dict:fold(fun(UniqueId, ExistPackItem, UniqueList0) ->
			#item{item_id = ExistItemId, bind = ExistBind} = ExistPackItem,
			Ret = ExistItemId =:= RemoveItemID andalso
				(RemoveType =:= ?REMOVE_PRIORITY_BIND orelse ExistBind =:= RemoveItemBind),
			case Ret of
				true ->
					case ExistBind =:= ?ITEM_BIND of
						true ->
							[UniqueId | UniqueList0];
						false ->
							UniqueList1 = [UniqueId],
							lists:append(UniqueList0, UniqueList1)
					end;
				false ->
					UniqueList0
			end
		                       end, [], Dict),
		NowTick = lib_timer:unixtime(),
		{NewLeftRemoveAmount, NewDict, NewRemoveResult} = lists:foldl(
			fun(UniqueId, {LeftRemoveAmount0, Dict0, RemoveResult0}) ->
				%%判断是否已经删除完成
				case LeftRemoveAmount0 > 0 of false ->
					throw({ok, Package#package{dict = Dict0, remove_result = RemoveResult0}}); _ -> skip end,

				%%从字典里获取已有物品数量
				Ret = dict:find(UniqueId, Dict),
				?JUDGE_RETURN(Ret =/= error, ?ERROR_ITEM_NO_EXIST),
				{ok, ExistPackItem} = Ret,
				#item{amount = ExistAmount, overdue = Overdue} = ExistPackItem,
				LimitType = maps:get(time_limit_type, tb_item:get(ExistPackItem#item.item_id), 0),

				case NowTick >= Overdue andalso LimitType =/= ?ITEM_TIME_LIMIT_TYPE0 of
					true ->
						{LeftRemoveAmount0, Dict0, RemoveResult0};
					_ ->
						%%执行删除
						case ExistAmount >= LeftRemoveAmount0 of
							true ->
								ExistLeftAmount = ExistAmount - LeftRemoveAmount0,
								case ExistLeftAmount > 0 of
									true ->   %%删除，并且背包剩余数量大于0
										Dict1 = dict:store(UniqueId, ExistPackItem#item{amount = ExistLeftAmount}, Dict0),
										RemoveResult1 = [ExistPackItem#item{amount = LeftRemoveAmount0} | RemoveResult0],
										{0, Dict1, RemoveResult1};
									false ->  %%删除，并且背包剩余数量等于0
										Dict1 = dict:erase(UniqueId, Dict0),
										RemoveResult1 = [ExistPackItem | RemoveResult0],
										{0, Dict1, RemoveResult1}
								end;
							false ->      %%删除
								LeftRemoveAmount2 = LeftRemoveAmount0 - ExistAmount,
								Dict1 = dict:erase(UniqueId, Dict0),
								RemoveResult1 = [ExistPackItem | RemoveResult0],
								{LeftRemoveAmount2, Dict1, RemoveResult1}
						end
				end
			end, {LeftRemoveAmount, Dict, []}, UniqueList),

		?JUDGE_RETURN(NewLeftRemoveAmount =:= 0, ?ERR_PACK_AMOUNT),
		{true, Package#package{dict = NewDict, remove_result = NewRemoveResult}}
	catch
		throw: {ok, RetPackage} -> {true, RetPackage};
		throw: {error, Ret} -> {false, Ret}
	end.

%%删除多个物品(不区分绑定状态)
%%成功返回{true, Package}, 失败返回{false,Ret}
check_item_remove(Package, PackItem, RemoveType) when is_record(PackItem, item) ->
	check_item_remove(Package, [PackItem], RemoveType);
check_item_remove(Package, [], _) ->
	{true, Package#package{remove_result = []}};
check_item_remove(Package, [PackItem | PackItems], RemoveType) ->
	case remove_item_by_id(Package, PackItem, RemoveType) of
		{true, RetPackage} ->
			case check_item_remove(RetPackage, PackItems, RemoveType) of
				{true, NewResPkg} ->
					NewPackage = NewResPkg#package{remove_result = lists:append(NewResPkg#package.remove_result, RetPackage#package.remove_result)},
					{true, NewPackage};
				{false, Ret} -> {false, Ret}
			end;
		{false, Ret} ->
			{false, Ret}
	end.

%%根据ID检查能否删除(不区分绑定状态)
%%成功返回true, 失败返回false
check_package_remove_by_id(Package, PackItem) when is_record(PackItem, item) ->
	check_package_remove_by_id(Package, [PackItem]);
check_package_remove_by_id(Package, PackItems) ->
	case check_item_remove(Package, PackItems, ?REMOVE_PRIORITY_BIND) of
		{Res, _} -> Res
	end.

%%根据ID删除物品(不区分绑定状态)
%%成功返回{true, Package}, 失败返回{false, Ret}
package_remove_by_id(Package, PackItem) when is_record(PackItem, item) ->
	package_remove_by_id(Package, [PackItem]);
package_remove_by_id(Package, PackItems) ->
	case check_item_remove(Package, PackItems, ?REMOVE_PRIORITY_BIND) of
		{true, ResPackage} -> {true, ResPackage};
		{false, Ret} -> {false, Ret}
	end.

%%根据ID检查能否删除(区分绑定状态,根据PackItem.bind)
%%成功返回true, 失败返回false
check_package_remove_by_id_bind(Package, PackItem) when is_record(PackItem, item) ->
	check_package_remove_by_id_bind(Package, [PackItem]);
check_package_remove_by_id_bind(Package, PackItems) ->
	case check_item_remove(Package, PackItems, ?REMOVE_BY_BIND) of
		{Res, _} -> Res
	end.

%%根据ID删除物品(区分绑定状态,根据PackItem.bind)
%%成功返回{true, Package}, 失败返回{false, Ret}
package_remove_by_id_bind(Package, PackItem) when is_record(PackItem, item) ->
	package_remove_by_id_bind(Package, [PackItem]);
package_remove_by_id_bind(Package, PackItems) ->
	case check_item_remove(Package, PackItems, ?REMOVE_BY_BIND) of
		{true, ResPackage} -> {true, ResPackage};
		{false, Ret} -> {false, Ret}
	end.

%%根据唯一ID删除
remove_item_by_unique_id(Package, PackItem) ->
	try
		#package{dict = Dict} = Package,
		#item{unique_id = UniqueId, item_id = RemoveItemId, amount = RemoveAmount0} = PackItem,
		RemoveAmount = trunc(RemoveAmount0),
		?JUDGE_RETURN(RemoveAmount > 0, ?ERR_AMOUNT_NEGATIVE),
		Ret = dict:find(UniqueId, Dict),
		?JUDGE_RETURN(Ret =/= error, ?ERROR_ITEM_NO_EXIST),
		{ok, ExistPackItem} = Ret,

		#item{item_id = ExistItemId, amount = ExistAmount} = ExistPackItem,
		?JUDGE_RETURN(RemoveItemId =:= ExistItemId, ?ERROR_ITEM_NO_EXIST),
		?JUDGE_RETURN(ExistAmount >= RemoveAmount, ?ERR_PACK_AMOUNT),

		NewDict = case (ExistAmount - RemoveAmount) =:= 0 of
			          true ->
				          dict:erase(UniqueId, Dict);
			          false ->
				          dict:store(UniqueId, ExistPackItem#item{amount = ExistAmount - RemoveAmount}, Dict)
		          end,

		{true, Package#package{dict = NewDict, remove_result = [PackItem#item{amount = RemoveAmount}]}}

	catch
		throw: {error, Ret0} -> {false, Ret0}
	end.

check_item_remove_by_unique_id(Package, PackItem) when is_record(PackItem, item) ->
	check_item_remove_by_unique_id(Package, [PackItem]);
check_item_remove_by_unique_id(Package, []) ->
	{true, Package#package{remove_result = []}};
check_item_remove_by_unique_id(Package, [PackItem | PackItems]) ->
	case remove_item_by_unique_id(Package, PackItem) of
		{true, RetPackage} ->
			case check_item_remove_by_unique_id(RetPackage, PackItems) of
				{true, NewResPkg} ->
					NewPackage = NewResPkg#package{remove_result = lists:append(NewResPkg#package.remove_result, RetPackage#package.remove_result)},
					{true, NewPackage};
				{error, Ret} -> {false, Ret}
			end;
		{false, Ret} ->
			{false, Ret}
	end.

%%根据唯一ID检查能否删除
%%成功返回true, 失败返回false
check_package_remove_by_unique_id(Package, PackItem) when is_record(PackItem, item) ->
	check_package_remove_by_unique_id(Package, [PackItem]);
check_package_remove_by_unique_id(Package, PackItems) ->
	case check_item_remove_by_unique_id(Package, PackItems) of
		{Res, _} -> Res
	end
.

%%根据唯一ID删除物品
%%成功返回{true, Package}, 失败返回{false, Ret}
package_remove_by_unique_id(Package, PackItem) when is_record(PackItem, item) ->
	package_remove_by_unique_id(Package, [PackItem]);
package_remove_by_unique_id(Package, PackItems) ->
	case check_item_remove_by_unique_id(Package, PackItems) of
		{true, ResPackage} -> {true, ResPackage};
		{false, Ret} -> {false, Ret}
	end
.

%%根据唯一ID查找
%%成功返回{true, PackItem}, 失败返回{false, Ret}
find_by_unique_id(Package, PackItem) when is_record(PackItem, item) ->
	find_by_unique_id(Package, PackItem#item.unique_id)
;
find_by_unique_id(Package, UniqueId) ->
	#package{dict = Dict} = Package,
	case dict:find(UniqueId, Dict) of
		{ok, ExistPackItem} -> {true, ExistPackItem};
		error -> {false, ?ERROR_ITEM_NO_EXIST}
	end
.

%%根据道具ID查找
%%成功返回{true, PackItem}, 失败返回{false, Ret}
find_by_item_id(Package, PackItem) when is_record(PackItem, item) ->
	find_by_item_id(Package, PackItem#item.item_id)
;
find_by_item_id(Package, ItemId) ->
	try
		#package{dict = Dict} = Package,
		dict:fold(fun(_Key, ExistPackItem, _F) ->
			#item{item_id = ExistItemId} = ExistPackItem,
			case ExistItemId =:= ItemId of
				true ->
					throw({ok, ExistPackItem});
				false ->
					_F
			end
		          end, 0, Dict),
		{false, ?ERROR_ITEM_NO_EXIST}
	catch
		throw : {ok, RetPackItem} -> {true, RetPackItem};
		throw : {error, Ret} -> {false, Ret}
	end
.

%%根据道具ID和绑定状态查找
%%成功返回{true, PackItem}, 失败返回{false, Ret}
find_by_item_id_bind(Package, PackItem) when is_record(PackItem, item) ->
	find_by_item_id_bind(Package, PackItem#item.item_id, PackItem#item.bind)
.
find_by_item_id_bind(Package, ItemId, Bind) ->
	try
		#package{dict = Dict} = Package,
		dict:fold(fun(_Key, ExistPackItem, _F) ->
			#item{item_id = ExistItemId, bind = ExistBind} = ExistPackItem,
			case ExistItemId =:= ItemId andalso ExistBind =:= Bind of
				true ->
					throw({ok, ExistPackItem});
				false ->
					_F
			end
		          end, 0, Dict),
		{false, ?ERROR_ITEM_NO_EXIST}
	catch
		throw : {ok, RetPackItem} -> {true, RetPackItem};
		throw : {error, Ret} -> {false, Ret}
	end
.

%%根据道具ID查找
%%成功返回{true, PackItemList}, 失败返回{false, Ret}
find_item_list_by_id(Package, PackItem) when is_record(PackItem, item) ->
	find_item_list_by_id(Package, PackItem#item.item_id)
;
find_item_list_by_id(Package, ItemId) ->
	#package{dict = Dict} = Package,

	ResList = dict:fold(fun(_Key, ExistPackItem, ResList0) ->
		#item{item_id = ExistItemId} = ExistPackItem,
		case ExistItemId =:= ItemId of
			true ->
				[ExistPackItem | ResList0];
			false ->
				ResList0
		end
	                    end, [], Dict),

	case erlang:length(ResList) > 0 of
		true -> {true, ResList};
		false -> {false, ?ERROR_ITEM_NO_EXIST}
	end
.

%%根据道具ID查找
%%成功返回{true, PackItemDict}, 失败返回{false, Ret}
find_item_dict_by_id(Package, PackItem) when is_record(PackItem, item) ->
	find_item_dict_by_id(Package, PackItem#item.item_id)
;
find_item_dict_by_id(Package, ItemId) ->
	#package{dict = Dict} = Package,

	ResDict = dict:fold(fun(_Key, ExistPackItem, ResDict0) ->
		#item{unique_id = UniqueId, item_id = ExistItemId} = ExistPackItem,
		case ExistItemId =:= ItemId of
			true ->
				dict:store(UniqueId, ExistPackItem, ResDict0);
			false ->
				ResDict0
		end
	                    end, dict:new(), Dict),

	case dict:size(ResDict) > 0 of
		true -> {true, ResDict};
		false -> {false, ?ERROR_ITEM_NO_EXIST}
	end
.

%%查找指定道具的数量
count_by_id(Package, PackItem) when is_record(PackItem, item) ->
	count_by_id(Package, PackItem#item.item_id)
;
count_by_id(Package, ItemId) ->
	#package{dict = Dict} = Package,

	dict:fold(fun(_Key, ExistPackItem, Count0) ->
		#item{item_id = ExistItemId, amount = ExistAmount} = ExistPackItem,
		case ExistItemId =:= ItemId of
			true ->
				Count0 + ExistAmount;
			false ->
				Count0
		end
	          end, 0, Dict)
.

%%查找指定道具的数量
count_by_id_bind(Package, PackItem) when is_record(PackItem, item) ->
	count_by_id_bind(Package, PackItem#item.item_id, PackItem#item.bind)
.
count_by_id_bind(Package, ItemId, ItemBind) ->
	#package{dict = Dict} = Package,

	dict:fold(fun(_Key, ExistPackItem, Count0) ->
		#item{item_id = ExistItemId, bind = ExistBind, amount = ExistAmount} = ExistPackItem,
		case ExistItemId =:= ItemId andalso ItemBind =:= ExistBind of
			true ->
				Count0 + ExistAmount;
			false ->
				Count0
		end
	          end, 0, Dict)
.

debug_package(Package) ->
	#package{dict = Dict, insert_result = Insert, remove_result = Remove} = Package,
	List = dict:to_list(Dict),
	?INFO("debug_package left pack size : ~p, item dict : ~p, insert_result : ~p, remove_result : ~p ~n", [left_pack_size(Package), List, Insert, Remove])
.

clean_package(Package) ->
	#package{dict = Dict} = Package,
	RemoveResult = dict:fold(fun(_Key, ExistPackItem, RemoveResult0) ->
		[ExistPackItem | RemoveResult0]
	                         end, [], Dict),
	Package#package{dict = dict:new(), remove_result = RemoveResult}
.

insert_equip_to_emptygrid(Package, PackItem) ->
	try
		LeftSize = left_pack_size(Package),
		?JUDGE_RETURN(LeftSize > 0, ?ERR_ITEM_PACK_CAPACITY),
		#package{dict = Dict} = Package,

		ItemConf = tb_item:get(PackItem#item.item_id),
		AddItemOverAmount = conf_overlap(ItemConf),
		?JUDGE_RETURN(AddItemOverAmount >= PackItem#item.amount, ?ERROR_OVERLAP_LIMIT),

		{NewPackage, NewPackItem} = set_item_unique_id(Package, PackItem#item{item_index = 0}),
		NewPackItem0 = set_item_opt_tick(NewPackItem),
		NewDict = dict:store(NewPackItem0#item.unique_id, NewPackItem0, Dict),
		{true, NewPackage#package{dict = NewDict, insert_result = [NewPackItem0]}, NewPackItem0#item.unique_id}
	catch
		throw : {error, Ret} -> {false, Ret}
	end.

conf_overlap(Conf) ->
	case maps:get(time_limit_type, Conf, 0) of
		?ITEM_TIME_LIMIT_TYPE1 -> %% 策划要求这样判断
			1;
		_ ->
			case maps:get(overlap, Conf, ?ITEM_OVERLAP_DEFAULT) of
				V1 when V1 =:= 0 -> ?ITEM_OVERLAP_DEFAULT;
				V2 -> V2
			end
	end.

init_item(PackItem) ->
	#{main_type := MainType} = tb_item:get(PackItem#item.item_id),
	case MainType of
		?ITEM_MAIN_TYPE_TITLE ->
			lib_honor_title:init_title(PackItem);
		_ ->
			PackItem
	end.