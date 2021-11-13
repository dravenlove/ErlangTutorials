%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2020 5:45 PM
%%%-------------------------------------------------------------------
-module(lib_player_equip).
-author("lichaoyu").
-include("common.hrl").
-include("inner_city.hrl").
-include("science.hrl").
-include("ProtoClient_10126.hrl").

%% API
-export([
	request_hero_equip/1,				%% 请求玩家英雄装备信息
	request_hero_use_equip/1,			%% 请求英雄穿戴装备
	request_hero_unfix_equip/1,			%% 请求英雄卸下装备
	request_equip_break/1,				%% 请求装备突破
	request_equip_break_quicken/1,		%% 请求装备突破加速
	request_equip_break_get/1,			%% 请求装备突破领取
	request_equip_up/1,					%% 请求装备强化
	request_equip_wash_info/1,			%% 请求装备洗练信息
	request_equip_wash_lock/1,			%% 请求装备洗练上锁
	request_equip_wash/1,				%% 请求装备洗练
	request_equip_wash_replace/1,		%% 请求装备洗练替换
	request_equip_wash_gold_finger/1,	%% 请求装备洗练金手指
	request_equip_gold_finger_save/1,	%% 请求装备金手指保存
	request_equip_make_info/0,			%% 请求装备制作信息
	request_equip_make/1,				%% 请求装备制作
	request_equip_core_level/1,			%% 请求核心装备升级
	request_equip_resolve/1				%% 请求装备分解
]).

-export([
	put_equip/1,
	get_equip/0,
	player_equip_handler/0,
	get_tips/0					%% 主城提示
]).

-define(SKY_FREE, 0).			%% 空闲中
-define(NULL, 0).
-define(NULL_LIST, [?NULL, ?NULL, ?NULL, ?NULL, ?NULL]).	%%补全属性列表
-define(SUCCESS_RATE, 100).		%%成功率
-define(ON_LOCK, 1).		%%上锁
-define(UN_LOCK, 0).		%%解锁

put_equip(PlayerEquip) ->
	put_equip(PlayerEquip, true).
put_equip(PlayerEquip, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_EQUIP),
	erlang:put(?ETS_PLAYER_EQUIP, PlayerEquip).

get_equip() ->
	erlang:get(?ETS_PLAYER_EQUIP).

ets_init() ->
	ets:new(?ETS_PLAYER_EQUIP, [?ETS_KEY_POS(#player_equip.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_EQUIP, {?TUPLE_INT(id, 1)}, true).

player_equip_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_EQUIP,
		table_name = ?DBPLAYER_EQUIP,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_equip:load_player_equip/1,
		save_func = fun db_equip:save_player_equip/1,
		get_func = fun get_equip/0,
		put_func = fun put_equip/2
	}.

get_tips() ->
	#player_equip{
		type = Type,
		param = Param
	} = get_equip(),
	{Type,
		case Type of
			?IN_EQUIP_BREAK -> (lib_equip_api:equip_item(Param))#item.item_id;
			?IN_EQUIP_MAKE ->
				Conf = tb_equip_make:get(Param),
				case maps:get(type, tb_equip_bin:get(maps:get(bin, Conf))) of
					?RANDOM_MAKE ->
						case lib_inner_city_api:building_state(?BUILDING_SKY_MELTING_POT) of
							?BUILDING_GET_ITEM -> maps:get(equip_id, Conf);
							_ -> 0
						end;
					?FIXED_MAKE -> maps:get(equip_id, Conf)
				end;
			_ -> 0
		end}
.

request_hero_equip(Msg) ->
	#'Proto10126002'{
		hero_id = HeroId
	} = Msg,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	EquipDict = lib_equip_api:hero_equip(HeroId),
	UniqueIdList = [(util:dict_get(X, EquipDict, #item{}))#item.unique_id || X <- ?EQUIP_PART_LIST],
	Suit =  lib_equip_api:is_suit(EquipDict),
	Res = #'Proto50126002'{
		unique_id_list = UniqueIdList,
		suit = Suit
	},
	?DEBUG("~p",[Res]),
	lib_send:respond_to_client(Res)
.

request_hero_use_equip(Msg) ->
	#'Proto10126003'{
		hero_id = HeroId,
		unique_id = UniqueId
	} = Msg,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	EquipItem = lib_equip_api:equip_item(UniqueId),
	lib_equip_api:u_hero_equip(HeroId, EquipItem)
.

request_hero_unfix_equip(Msg) ->
	#'Proto10126004'{
		hero_id = HeroId,
		unique_id = UniqueId
	} = Msg,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	EquipType = lib_equip_api:type(UniqueId),
	lib_equip_api:d_hero_equip(HeroId, EquipType)
.

-define(B_WAIT,	0).		%% 等待
-define(B_GOLD,	1).		%% 元宝
request_equip_break(Msg) ->
	#'Proto10126006'{
		unique_id = UniqueId,
		type = Type
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_128), ?ERROR_MANSION_LEVEL),
	?JUDGE_RETURN(lib_inner_city_api:building_is_open(?BUILDING_SKY_MELTING_POT), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(lib_inner_city_api:building_state(?BUILDING_SKY_MELTING_POT) =:= ?SKY_FREE, ?ERROR_SKY_BUSY),
	#item{item_id = ItemId, equip_info = EquipInfo} = lib_equip_api:equip_item(UniqueId),
	BreakThrough = EquipInfo#equip_info.break_through,
	?JUDGE_RETURN(BreakThrough < maps:get(value, tb_const:get(equip_break_limit)), ?ERROR_BREAK_FAIL),
	#{
		break_wait_time := BreakWaitTime,
		consume := ConsumeList
	} = tb_equip_break:get(?EQUIP_BREAK_ID(ItemId, BreakThrough)),
	{Time, Item0} =
		case Type of
			?B_WAIT -> Add = lib_player_science_api:get_effect_value(?EFFECT_EQUIP_BREAK_TIME_REDUCE), {trunc(BreakWaitTime * (100 - Add) / 100), ConsumeList};
			?B_GOLD -> {0, [[?GOLD_ID, lib_equip_api:time_to_gold(BreakWaitTime)] | ConsumeList]}
		end,
	Item = [[Id, trunc(Num * (100 - lib_player_science_api:get_effect_value(?EFFECT_EQUIP_BREAK_COST_REDUCE, Id)) / 100)] || [Id, Num] <- Item0],
	lib_equip_api:item(Item, ?USE_EQUIP_BREAK_PROP, UniqueId),
	PlayerEquip = get_equip(),
	put_equip(PlayerEquip#player_equip{
		type = ?IN_EQUIP_BREAK,
		param = UniqueId
	}),

	InnerCity = lib_inner_city_api:building_info(?BUILDING_SKY_MELTING_POT),
	lib_inner_city:request_building_working(InnerCity#building{
		building_state = ?BUILDING_EQUIPPED_BREAKTHROUGH,
		upgrade_tick = lib_timer:unixtime(),
		upgrade_total_time = Time,
		remaining_time = Time
	})
.

request_equip_break_quicken(Msg) ->
	#'Proto10126008'{
		type = Type,
		unique_id = UniqueId,
		num = Num
	} = Msg,
	lib_inner_city:request_accelerate_building_working(?BUILDING_SKY_MELTING_POT, Type, [UniqueId, Num])
.

request_equip_break_get(Msg) ->
	#'Proto10126009'{
		other = _Other
	} = Msg,
	?JUDGE_RETURN(lib_inner_city_api:building_state(?BUILDING_SKY_MELTING_POT) =:= ?BUILDING_GET_ITEM, ?ERROR_CLIENT_OPERATOR),
	PlayerEquip = get_equip(),
	Param = PlayerEquip#player_equip.param,
	{Id, Flag, UniqueId, ItemList} =
		case PlayerEquip#player_equip.type of
			?IN_EQUIP_BREAK ->
				EquipItem = lib_equip_api:equip_item(Param),
				#item{equip_info = EquipInfo} = EquipItem,
				BreakThrough = EquipInfo#equip_info.break_through,
				ItemId = EquipItem#item.item_id,
				Conf = tb_equip_break:get(ItemId * 10 + BreakThrough),
				put_equip(PlayerEquip#player_equip{type = 0, param = 0}),
				SuccessRate = maps:get(success_rate, Conf),
				Add = lib_player_science_api:get_effect_value(?EFFECT_EQUIP_BREAK_RATE_ADD, lib_item_api:item_sub_type(ItemId)),
				case SuccessRate + Add > lib_random:rand(?SUCCESS_RATE) of
					true ->
						NewEquipInfo = EquipInfo#equip_info{break_through = BreakThrough + 1},
						lib_equip_api:u_equip_item(EquipItem#item{equip_info = NewEquipInfo}, true),
						{ItemId, ?BACK_SUCCESS, Param, []};
					false ->
						Consume = maps:get(consume, Conf),
						FailBackRate = maps:get(fail_back_rate, Conf) / 100,
						ConsumeList = [[ConsumeId, round(ConsumeNum * FailBackRate)] || [ConsumeId, ConsumeNum] <- Consume],
						Items = lib_item_api:conf_item_list_to_item_obj_list(ConsumeList),
						Ret = lib_player_pack:validate_insert(Items),
						?PACK_IS_SUCCESS(Ret),
						lib_player_pack:auto_insert(Items, ?INSERT_SERIAL(?ADD_EQUIP_BREAK_BACK_PROP, Param), true, ?PACK_TIPS0),
						{ItemId, ?BACK_FAIL, Param, lib_item_api:conf_item_list_to_proto_obj_list(ConsumeList)}
				end;
			?IN_EQUIP_MAKE ->
				EquipId = maps:get(equip_id, tb_equip_make:get(Param)),
				{F, UId} = lib_player_pack:insert_equip(?PACK_TYPE_EQUIP, #item{item_id = EquipId, amount = 1}, ?INSERT_SERIAL(?ADD_EQUIP_MAKE, Param), true),
				?JUDGE_RETURN(F, UId),
				BinId = Param div 100,
				MakeBinMaps = PlayerEquip#player_equip.make_bin,
				MakeBinList = maps:get(BinId, MakeBinMaps, []),
				put_equip(PlayerEquip#player_equip{make_bin = maps:put(BinId, [Param | MakeBinList], MakeBinMaps), type = 0, param = 0}),
				{EquipId, ?BACK_SUCCESS, UId, []}
		end,
	InnerCity = lib_inner_city_api:building_info(?BUILDING_SKY_MELTING_POT),
	lib_inner_city_api:update_building_info(InnerCity#building{building_state = ?BUILDING_LEISURE}),
	Res = #'Proto50126009'{
		type = lib_item_api:item_sub_type(Id),
		flag = Flag,
		unique_id = UniqueId,
		item_list = ItemList
	},
	lib_send:respond_to_client(Res)
.

request_equip_up(Msg) ->
	#'Proto10126005'{
		unique_id = UniqueId
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_130), ?ERROR_MANSION_LEVEL),
	#item{equip_info = EquipInfo} = EquipItem = lib_equip_api:equip_item(UniqueId),
	Up = EquipInfo#equip_info.up,
	Add = lib_player_science_api:get_effect_value(?EFFECT_EQUIP_TRAIN_MAX_LEVEL_ADD),
	?JUDGE_RETURN(Up < maps:get(value, tb_const:get(equip_up_limit)) + Add, ?ERROR_UP_FAIL),
	UpId = lib_item_api:item_sub_type(EquipItem#item.item_id) * 100000 + Up + 1,
	Conf = tb_equip_up:get(UpId),
	[FirstCostId, FirstCostNum] = FirstCost = maps:get(equip_intensify_cost_first, Conf),
	[SecondCostId, _] = SecondCost = maps:get(equip_intensify_cost_second, Conf),
	FirstNum = lib_player_pack:count_by_id(FirstCostId),
	Item =
		if
			FirstNum =:= 0 -> SecondCost;
			FirstNum < FirstCostNum -> [[FirstCostId, FirstNum], [SecondCostId, FirstCostNum - FirstNum]];
			true -> FirstCost
		end,
	lib_equip_api:item(Item, ?USE_EQUIP_UP_PROP, UniqueId),
	UpFail = EquipInfo#equip_info.up_fail,
	FirstRate = maps:get(first_rate, Conf),
	FailAddRate = maps:get(fail_add_rate, Conf),
	Rate = FailAddRate * UpFail + FirstRate,
	{Flag, NewEquipItem} =
		case Rate > lib_random:rand(?SUCCESS_RATE) of
			true ->
				NewEquipInfo = EquipInfo#equip_info{up = Up + 1, up_fail = 0},
				{?BACK_SUCCESS, EquipItem#item{equip_info = NewEquipInfo}};
			false ->
				NewEquipInfo = EquipInfo#equip_info{up_fail = UpFail + 1},
				{?BACK_FAIL, EquipItem#item{equip_info = NewEquipInfo}}
		end,
	lib_equip_api:u_equip_item(NewEquipItem, true),
	Res = #'Proto50126005'{
		flag = Flag
	},
	lib_send:respond_to_client(Res)
.

request_equip_wash_info(Msg) ->
	#'Proto10126007'{
		unique_id = UniqueId
	} = Msg,
	{Self, Lock, Wash, GoldFinger} = lib_equip_api:attribute(UniqueId),
	Res = #'Proto50126007'{
		attribute_id = Self,
		lock = Lock,
		wash_attribute_id = Wash,
		gold_finger = GoldFinger
	},
	lib_send:respond_to_client(Res)
.

request_equip_wash_lock(Msg) ->
	#'Proto10126010'{
		unique_id = UniqueId,
		index = Index
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_129), ?ERROR_MANSION_LEVEL),
	#item{equip_info = EquipInfo} = EquipItem = lib_equip_api:equip_item(UniqueId),
	Attribute = EquipInfo#equip_info.attribute,
	Break = EquipInfo#equip_info.break_through,
	?JUDGE_RETURN(Break >= Index andalso Index > 0 , ?ERROR_INVALID_PARAM),
	Lock = element(?WASH_LOCK, Attribute),
	L = case lists:nth(Index, Lock) of ?UN_LOCK -> ?ON_LOCK; ?ON_LOCK -> ?UN_LOCK end,
	NewLock = lists_replace(Lock, Index, L),
	NewAttribute = setelement(?WASH_LOCK, Attribute, NewLock),
	NewEquipInfo = EquipInfo#equip_info{attribute = NewAttribute},
	NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
	lib_equip_api:u_equip_item(NewEquipItem, false),
	Res = #'Proto50126010'{
		lock = NewLock
	},
	lib_send:respond_to_client(Res)
.

%%列表，位置，替换值
lists_replace(List, Index, Flag) ->
	{Qian, Hou} = lists:split(Index, List),
	lists:droplast(Qian) ++ [Flag] ++ Hou
.

request_equip_wash(Msg) ->
	#'Proto10126011'{
		unique_id = UniqueId
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_129), ?ERROR_MANSION_LEVEL),
	#item{equip_info = EquipInfo} = EquipItem = lib_equip_api:equip_item(UniqueId),
	#equip_info{attribute = Attribute, break_through = Break} = EquipInfo,
	EquipType = lib_item_api:item_sub_type(EquipItem#item.item_id),
	{Self, Lock, _, _} = Attribute,
	LockNum = lists:sum(Lock),
	Conf = tb_equip_wash_cost:get(EquipType * 100 + Break * 10 + LockNum),
	?JUDGE_RETURN(Conf, ?ERROR_OPERATE_TOO_FAST),
	[Id, Num] = maps:get(cost, Conf),
	Item = [Id, trunc(Num * (100 - lib_player_science_api:get_effect_value(?EFFECT_EQUIP_CLEAR_COST_REDUCE)) / 100)],
	lib_equip_api:item(Item, ?USE_EQUIP_WASH_PROP, UniqueId),
	WashZip = lists:zip(Self, Lock),
	WashZipList = lists:sublist(WashZip, Break),
	NewIdList = lists:foldl(
		fun({Prop, LockFlag}, List) ->
			case LockFlag of
				?ON_LOCK -> lib_equip_api:different_type_attribute(List, Prop);
				?UN_LOCK -> List
			end
		end, tb_equip_wash:get_list(), WashZipList),
	{NewWashId, _} = lists:foldl(
		fun({Prop, LockFlag}, {List, IdList}) ->
			case LockFlag of
				?ON_LOCK -> {[Prop | List], IdList};
				?UN_LOCK ->
					NewProp = lib_equip_api:random_wash_attribute(IdList),
					{[NewProp | List], lib_equip_api:different_type_attribute(IdList, NewProp)}
			end
		end, {[], NewIdList}, WashZipList),
	NewWash = lists:sublist(lists:reverse(NewWashId) ++ ?NULL_LIST, 5),
	NewAttribute = setelement(?WASH_AFTER, Attribute, NewWash),
	NewEquipInfo = EquipInfo#equip_info{attribute = NewAttribute},
	NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
	lib_equip_api:u_equip_item(NewEquipItem, false),
	Res = #'Proto50126011'{
		wash_attribute_id = NewWash
	},
	lib_send:respond_to_client(Res)
.

-define(F_WAIVE,	0).	%% 放弃
-define(F_SAVE,		1).	%% 保存
request_equip_wash_replace(Msg) ->
	#'Proto10126012'{
		unique_id = UniqueId,
		flag = Flag
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_129), ?ERROR_MANSION_LEVEL),
	EquipItem = lib_equip_api:equip_item(UniqueId),
	#item{equip_info = EquipInfo} = EquipItem,
	#equip_info{attribute = {Self, Lock, Wash, _}} = EquipInfo,
	?JUDGE_RETURN(Wash =/= ?NULL_LIST, ?ERROR_CLIENT_OPERATOR),
	NewSelf =
		case Flag of
			?F_WAIVE -> Self;
			?F_SAVE -> Wash
		end,
	NewAttribute = {NewSelf, Lock, ?NULL_LIST, ?NULL_LIST},
	NewEquipInfo = EquipInfo#equip_info{attribute = NewAttribute},
	NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
	lib_equip_api:u_equip_item(NewEquipItem, true),
	Res = #'Proto50126012'{
		attribute_id = NewSelf,
		wash_attribute_id = ?NULL_LIST
	},
	lib_send:respond_to_client(Res)
.

request_equip_wash_gold_finger(Msg) ->
	#'Proto10126013'{
		unique_id = UniqueId,
		index = Index
	} = Msg,
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_129), ?ERROR_MANSION_LEVEL),
	EquipItem = lib_equip_api:equip_item(UniqueId),
	#item{equip_info = EquipInfo} = EquipItem,
	Attribute = EquipInfo#equip_info.attribute,
	{Self, _, _, GoldFingerList} = Attribute,
	Break = EquipInfo#equip_info.break_through,
	?JUDGE_RETURN(Break >= Index andalso Index > 0 , ?ERROR_INVALID_PARAM),
	SelfId = lists:nth(Index, Self),
	Quality = maps:get(quality, tb_equip_wash:get(SelfId)),
	?JUDGE_RETURN(Quality =:= ?QUALITY_ORANGE, ?ERROR_CLIENT_OPERATOR),
	CostItem = maps:get(jsonvalue, tb_const:get(wash_gold_finger)),
	lib_equip_api:item(CostItem, ?USE_EQUIP_WASH_PROP, UniqueId),
	WashList = lists:foldl(
		fun(Id, List) ->
			lib_equip_api:different_type_attribute(List, Id)
		end, lib_equip_api:same_quality_attribute(Quality), Self),
	NewGoldFinger = lib_equip_api:random_wash_attribute(WashList),
	NewGoldFingerList = lists_replace(GoldFingerList, Index, NewGoldFinger),
	NewAttribute = setelement(?WASH_FINGER, Attribute, NewGoldFingerList),
	NewEquipInfo = EquipInfo#equip_info{attribute = NewAttribute},
	NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
	lib_equip_api:u_equip_item(NewEquipItem, false),
	Res = #'Proto50126013'{
		gold_finger = NewGoldFinger
	},
	lib_send:respond_to_client(Res)
.

request_equip_gold_finger_save(Msg) ->
	#'Proto10126014'{
		unique_id = UniqueId,
		index = Index,
		flag = Flag
	} = Msg,
	EquipItem = lib_equip_api:equip_item(UniqueId),
	#item{equip_info = EquipInfo} = EquipItem,
	Break = EquipInfo#equip_info.break_through,
	?JUDGE_RETURN(Break >= Index andalso Index > 0, ?ERROR_INVALID_PARAM),
	Attribute = EquipInfo#equip_info.attribute,
	{Self, _, _, GoldFinger} = Attribute,
	GoldFingerId = lists:nth(Index, GoldFinger),
	?JUDGE_RETURN(GoldFingerId =/= ?NULL, ?ERROR_CLIENT_OPERATOR),
	NewSelf =
		case Flag of
			?F_WAIVE -> Self;
			?F_SAVE -> lists_replace(Self, Index, GoldFingerId)
		end,
	NewGoldFinger = lists_replace(GoldFinger, Index, ?NULL),
	NewAttribute1 = setelement(?WASH_BEFORE, Attribute, NewSelf),
	NewAttribute = setelement(?WASH_FINGER, NewAttribute1, NewGoldFinger),
	NewEquipInfo = EquipInfo#equip_info{attribute = NewAttribute},
	NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
	lib_equip_api:u_equip_item(NewEquipItem, true),
	Res = #'Proto50126014'{
		attribute_id = NewSelf
	},
	lib_send:respond_to_client(Res)
.

request_equip_make_info() ->
	MakeBinMap = lib_equip_api:make_bin(),
	MakeIdList = tb_equip_make:get_list(),
	Fun =
		fun(X) ->
			case lists:member(X, maps:get(X div 100, MakeBinMap, [])) of
				true -> 1;
				false -> 0
			end
		end,
	MakeList = [#'ProtoKeyValue'{
		key = X,
		value = Fun(X)
	} || X <- MakeIdList],
	Res = #'Proto50126015'{
		make_list = MakeList
	},
	lib_send:respond_to_client(Res)
.

request_equip_make(Msg) ->
	#'Proto10126016'{
		bin_id = BinId,
		index = Index
	} = Msg,
	Conf = tb_equip_bin:get(BinId),
	?JUDGE_RETURN(Conf, ?ERROR_CONFIG_NOT_EXISTENT),
	?JUDGE_RETURN(lib_inner_city_api:building_state(?BUILDING_SKY_MELTING_POT) =:= ?SKY_FREE, ?ERROR_SKY_BUSY),
	?JUDGE_RETURN(lib_inner_city_api:building_level(?BUILDING_SKY_MELTING_POT) >= maps:get(level, Conf), ?ERROR_SKY_NO_LEVEL),
	PlayerEquip = get_equip(),
	MakeList = maps:get(BinId, PlayerEquip#player_equip.make_bin, []),
	AllMakeList = lib_equip_api:bin_id_list(BinId),
	RemainMakeList = lists:subtract(AllMakeList, MakeList),
	?JUDGE_RETURN(RemainMakeList =/= [], ?ERROR_EQUIP_MAKE_FINISH),
	{NewConsume, NewMakeId} =
		case maps:get(type, Conf) of
			?RANDOM_MAKE ->
				WeightList = [maps:get(weight, tb_equip_make:get(X)) || X <- RemainMakeList],
				MakeId = lib_equip_api:random_one_weight(RemainMakeList, WeightList),
				{maps:get(consume, Conf), MakeId};
			?FIXED_MAKE ->
				MakeId = lib_equip_api:make_id(BinId, Index),
				?JUDGE_RETURN(lists:member(MakeId, RemainMakeList), ?ERROR_EQUIP_MAKE_FINISH),
				MakeConf = tb_equip_make:get(MakeId),
				?JUDGE_RETURN(MakeConf, ?ERROR_CONFIG_NOT_EXISTENT),
				Condition = maps:get(condition, MakeConf),
				?JUDGE_RETURN(lib_player_pack:count_by_id(Condition) > 0, ?ERROR_EQUIP_MAKE_CONDITION),
				{maps:get(consume, MakeConf), MakeId}
		end,
	lib_equip_api:item(NewConsume, ?USE_EQUIP_MAKE, NewMakeId),
	put_equip(PlayerEquip#player_equip{
		type = ?IN_EQUIP_MAKE,
		param = NewMakeId
	}),
	NewTime0 = maps:get(time, tb_equip_make:get(NewMakeId)),
	NewTime = trunc(NewTime0 * (100 - lib_player_science_api:get_effect_value(?EFFECT_EQUIP_MAKE_TIME_REDUCE)) / 100),
	InnerCity = lib_inner_city_api:building_info(?BUILDING_SKY_MELTING_POT),
	lib_inner_city:request_building_working(InnerCity#building{
		building_state = ?BUILDING_EQUIPPED_BREAKTHROUGH,
		upgrade_tick = lib_timer:unixtime(),
		upgrade_total_time = NewTime,
		remaining_time = NewTime
	}),
	Res = #'Proto50126016'{flag = ?BACK_SUCCESS},
	lib_send:respond_to_client(Res)
.

request_equip_core_level(Msg) ->
	UniqueId = Msg#'Proto10126017'.unique_id,
	EquipItem = lib_equip_api:equip_item(UniqueId),
	?DEBUG("~p", [EquipItem]),
	ItemId = EquipItem#item.item_id,
	Type = lib_item_api:item_sub_type(ItemId),
	?JUDGE_BREAK(Type =:= ?HE_XIN, ?ERROR_CLIENT_OPERATOR),
	ConstConfig = tb_const:get(core_equip_building_level),
	BuildingLevelLimit = maps:get(value, ConstConfig),
	BuildingLevel = lib_inner_city_api:building_level(?BUILDING_SKY_MELTING_POT),
	?JUDGE_RETURN(BuildingLevel >= BuildingLevelLimit, ?ERROR_SKY_NO_LEVEL),
	EquipInfo = EquipItem#item.equip_info,
	Break = EquipInfo#equip_info.break_through,
	Up = EquipInfo#equip_info.up,
	Level = ?EQUIP_LEVEL(Break, Up),
	LevelConfig = tb_equip_level:get(?EQUIP_LEVEL_ID(ItemId, Level)),
	Consume = maps:get(consume, LevelConfig),
	lib_equip_api:item(Consume, ?USE_EQUIP_CORE_LEVEL, UniqueId),
	SuccessRate = maps:get(success_rate, LevelConfig),
	Flag = SuccessRate > lib_random:rand(?SUCCESS_RATE),
	case Flag of
		true ->
			NewLevel = Level + 1,
			NewBreak = ?EQUIP_LEVEL_BREAK(NewLevel),
			NewUp = ?EQUIP_LEVEL_UP(NewLevel),
			NewEquipInfo0 = EquipInfo#equip_info{
				break_through = NewBreak,
				up = NewUp
			},
			NewEquipInfo =
				case NewBreak =/= Break of
					false -> NewEquipInfo0;
					true ->
						case lib_api:list_index(NewBreak, ?EQUIP_APPEND_CONDITION) of
							0 -> NewEquipInfo0;
							Index ->
								Color = lib_item_api:item_color(ItemId),
								{Append} = EquipInfo#equip_info.attribute,
								NewAppend = lib_equip_api:append_activate(Append, Color, Index),
								NewEquipInfo0#equip_info{attribute = {NewAppend}}
						end
				end,
			NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
			lib_equip_api:u_equip_item(NewEquipItem, true);
		false ->
			FailBackRate = maps:get(fail_back_rate, LevelConfig),
			BackConsume = [[Id, round(Amount * FailBackRate)] || [Id, Amount] <- Consume],
			lib_equip_api:item(BackConsume, ?ADD_EQUIP_CORE_LEVEL, UniqueId)
	end,
	Res = #'Proto50126017'{
		flag = Flag
	},
	lib_send:respond_to_client(Res)
.

request_equip_resolve(Msg) ->
	UniqueIdList = Msg#'Proto10126018'.unique_id,
	ResolveGet0 = lists:foldl(
		fun(UniqueId, List) ->
			try
				EquipItem = lib_equip_api:equip_item(UniqueId),
				ItemId = EquipItem#item.item_id,
				EquipInfo = EquipItem#item.equip_info,
				?JUDGE_BREAK(EquipInfo#equip_info.hero_id =:= 0),
				ResolveConfig = tb_equip_resolve:get(ItemId),
				Get = maps:get(get, ResolveConfig),
				lib_player_pack:remove_item_unique_id(?PACK_TYPE_EQUIP, EquipItem, ?REMOVE_SERIAL(?USE_EQUIP_RESOLVE, ItemId)),
				Get ++ List
			catch
			    _:_ -> List
			end
		end, [], UniqueIdList),
	ResolveGet = lib_item_api:merge_conf_item_list(ResolveGet0),
	lib_equip_api:item(ResolveGet, ?ADD_EQUIP_RESOLVE, 1),
	lib_send:respond_to_client(?MSG_RETURN_EQUIP_RESOLVE)
.
