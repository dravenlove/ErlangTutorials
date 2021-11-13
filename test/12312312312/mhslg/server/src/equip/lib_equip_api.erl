%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. Dec 2020 4:38 PM
%%%-------------------------------------------------------------------
-module(lib_equip_api).
-author("lichaoyu").
-include("common.hrl").
-include("pack.hrl").
-include("hero.hrl").
-include("equip.hrl").

%% API
-export([			%% 通用
	same_quality_attribute/1,			%% 获取相同品质的洗练属性
	different_type_attribute/2,			%% 从idList中剔除与id同类型的洗练属性
	random_wash_attribute/1,			%% 随机获取一个洗练属性
	choose_one/3,
	random_num_weight/3,		%% 权重列表随机获取N个值
	random_one_weight/2,		%% 导入id和weight列表，根据权重随机一个值
	make_id/2,					%% 获取装备制造id
	bin_id_list/1				%% 获取库中所有制造id
]).

-export([			%% 玩家进程调用
	equip_to_proto/2,					%% 用于返回前端英雄
	calc_equip_prop/1,					%% 计算英雄装备属性加成
	calc_equip_skill/1,					%% 计算英雄装备技能加成
	update_skill_group/2,
	update_equip_prop/1,				%% 更新装备加成属性

	equip_item/1,			%% 获取装备道具信息
	equip_info/1,			%% 装备信息
	type/1,					%% 装备类型
	suit/1,					%% 所属套装
	break_through/1,		%% 突破次数
	up/1,					%% 强化次数
	up_fail/1,				%% 强化失败次数
	attribute/1,			%% 洗练属性

	u_hero_equip/2,			%% 更新指定英雄装备
	d_hero_equip/2,			%% 卸下指定英雄部位装备
	u_equip_item/2,			%% 更新装备信息，对英雄有影响时true
	u_item/1,				%% 更新装备道具信息

	make_bin/0,				%% 装备制作记录
	make_num/0,				%% 累计装备制作数量
	make_id_list/1,			%% 装备库记录列表

	u_make_bin/2,			%% 更新装备库记录列表

	reset/1,				%% 重置英雄装备
	check_hero_by_equip/0,		%% 同步玩家英雄装备信息
	all_equip/0,				%% 获取全部装备
	is_use/2,					%% 英雄是否装备该装备
	suit_num/2,					%% 英雄装备了套装id件数
	hero_equip/1,				%% 根据英雄id获取已穿戴装备
	get_break_by_hero/1,		%% 根据英雄id获取突破次数列表
	is_suit/1,					%% 判断装备是否一套，不是返回0
	item/3,						%% 添加删除物品
	time_to_gold/1,
	append_activate/3			%% 核心装备随机附加属性
]).

same_quality_attribute(Quality) ->
	IdList = tb_equip_wash:get_list(),
	[X || X <- IdList, maps:get(quality, tb_equip_wash:get(X)) =:= Quality]
.
different_type_attribute(IdList, 0) -> IdList;
different_type_attribute(IdList, AttributeId) ->
	TypeStruct = maps:keys(tb_equip_wash:get(AttributeId)),
	[X || X <- IdList, maps:keys(tb_equip_wash:get(X)) =/= TypeStruct]
.
random_wash_attribute(IdList) ->
	WeightList = [maps:get(weight, tb_equip_wash:get(Id)) || Id <- IdList],
	Random = lib_random:rand(lists:sum(WeightList)),
	lists:nth(choose_one(WeightList, Random, 1), IdList)
.

choose_one([W | _], S, N) when S =< W -> N;
choose_one([W | L], S, N) ->
	choose_one(L, S - W, N + 1)
.

random_num_weight(IdList, WeightList, N) ->
	random_num_weight(IdList, WeightList, N, [])
.
random_num_weight(_, _, 0, List) -> List;
random_num_weight(IdList, WeightList, N, List) ->
	Id = random_one_weight(IdList, WeightList),
	{IdList1, WeightList1} = lists:unzip(lists:keydelete(Id, 1, lists:zip(IdList, WeightList))),
	random_num_weight(IdList1, WeightList1, N - 1, [Id | List])
.

random_one_weight(IdList, WeightList) ->
	Random = lib_random:rand(lists:sum(WeightList)),
	lists:nth(choose_one(WeightList, Random, 1), IdList)
.

make_id(BinId, Index) ->
	BinId * 100 + Index
.

bin_id_list(BinId) ->
	i(BinId * 100 + 1, [])
.
i(M, L) ->
	case tb_equip_make:get(M) of
		false -> L;
		_ -> i(M + 1, [M | L])
	end
.

equip_to_proto(ProtoHero, Hero) ->
	EquipItemDict = Hero#hero.equip_item_dict,
	ProtoHero#'ProtoHero'{
		hero_equip = lib_item_api:item_dict_to_proto_item_list(EquipItemDict)
	}
.

calc_equip_prop(Hero) ->
	EquipItemDict = Hero#hero.equip_item_dict,
	[SpecialEquipSuitId, SpecialEquipItemId] = maps:get(jsonvalue, tb_const:get(special_suit_equip_id)),
	SpecialEquipType = lib_item_api:item_sub_type(SpecialEquipItemId),
	SpecialEquipBreak =
		case dict:find(SpecialEquipType, EquipItemDict) of
			error -> 0;
			{ok, EquipItem} -> ?IIF(EquipItem#item.item_id =:= SpecialEquipItemId, EquipItem#item.equip_info#equip_info.break_through, 0)
		end,
	EquipPropList = dict:fold(
		fun(_, EquipItem, PropList) ->
			[calc_one_equip_prop(Hero, EquipItem, {SpecialEquipSuitId, SpecialEquipBreak}) | PropList]
		end, [], EquipItemDict),
	lib_fight_prop:increase_prop(EquipPropList)
.
calc_one_equip_prop(Hero, Item, {SpecialEquipSuitId, SpecialEquipBreak}) ->
	ItemId = Item#item.item_id,
	IsSpecialSuit = item_lvl(ItemId) =:= SpecialEquipSuitId,
	MultiTuple =
		case IsSpecialSuit of
			false -> {};
			true ->
				AddDataList = maps:get(jsonvalue, tb_const:get(special_suit_add_data)),
				AddList = [AddData / 100 + 1 || [BreakId, AddData] <- AddDataList, BreakId =< SpecialEquipBreak],
				list_to_tuple(AddList)
		end,
	EquipInfo = Item#item.equip_info,
	Break = EquipInfo#equip_info.break_through,
	BreakIdList = lists:seq(?DEFINE_BREAK, Break),
	BreakPropList = [
		begin
			BreakConf = tb_equip_break:get(?EQUIP_BREAK_ID(ItemId, BreakId)),
			BasePropConf = maps:get(props, BreakConf, #{}),
			BaseProp0 = lib_fight_prop:cfg_prop_dict_from_conf(BasePropConf),
			BaseProp =
				case BreakId > size(MultiTuple) of
					true -> BaseProp0;
					false ->
						Multi = element(BreakId, MultiTuple),
						lib_fight_prop:multi_prop(Multi, BaseProp0)
				end,
			case maps:find(special_effect, BreakConf) of
				error -> BaseProp;
				{ok, SpecialEffect} ->
					SpecialEffectPropConf = lib_hero_genius:special_effect_prop(Hero, SpecialEffect),
					SpecialEffectProp = lib_fight_prop:cfg_prop_dict_from_conf(SpecialEffectPropConf),
					lib_fight_prop:increase_prop([BaseProp, SpecialEffectProp])
			end
		end || BreakId <- BreakIdList],
	BreakProp = lib_fight_prop:increase_prop(BreakPropList),
	Type = lib_item_api:item_sub_type(ItemId),
	Up = EquipInfo#equip_info.up,
	AttributeList = element(?WASH_BEFORE, EquipInfo#equip_info.attribute),
	case Type of
		?HE_XIN ->
			Level = ?EQUIP_LEVEL(Break, Up),
			LevelConf = tb_equip_level:get(?EQUIP_LEVEL_ID(ItemId, Level)),
			LevelPropConf = maps:get(prop, LevelConf),
			LevelProp = lib_fight_prop:cfg_prop_dict_from_conf(LevelPropConf),
			AppendConfList = [maps:get(prop, tb_equip_append:get(X), #{}) || X <- AttributeList],
			AppendPropList = [lib_fight_prop:cfg_prop_dict_from_conf(AppendConf) || AppendConf <- AppendConfList],
			AppendProp = lib_fight_prop:increase_prop(AppendPropList),
			lib_fight_prop:increase_prop([BreakProp, LevelProp, AppendProp])
		;
		_ ->
			UpConf = tb_equip_up:get(?EQUIP_UP_ID(Type, Up)),
			UpProp = lib_fight_prop:cfg_prop_dict_from_conf(UpConf),
			WashConfList = [tb_equip_wash:get(X) || X <- AttributeList],
			WashPropList = [lib_fight_prop:cfg_prop_dict_from_conf(WashConf) || WashConf <- WashConfList],
			WashProp = lib_fight_prop:increase_prop(WashPropList),
			lib_fight_prop:increase_prop([BreakProp, UpProp, WashProp])
	end
.

calc_equip_skill(Hero) ->
	EquipItemDict = Hero#hero.equip_item_dict,
	SkillList = dict:fold(
		fun(_, EquipItem, SkillList) ->
			[calc_one_equip_skill(Hero, EquipItem) | SkillList]
		end, [], EquipItemDict),
	lib_fight_prop:increase_skill(SkillList)
.
calc_one_equip_skill(_Hero, Item) ->
	ItemId = Item#item.item_id,
	EquipInfo = Item#item.equip_info,
	BreakIdList = lists:seq(?DEFINE_BREAK, EquipInfo#equip_info.break_through),
	lists:foldl(
		fun(BreakId, SkillList) ->
			BreakConf = tb_equip_break:get(?EQUIP_BREAK_ID(ItemId, BreakId)),
			case maps:find(add_skill, BreakConf) of
				error -> SkillList;
				{ok, SkillId} -> [SkillId | SkillList]
			end
		end, [], BreakIdList)
.

update_skill_group(HeroId, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillList = calc_equip_skill(Hero),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_EQUIP, HeroId, SkillList, IsNotify)
.

update_equip_prop(HeroId) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_EQUIP),
	update_skill_group(HeroId, true)
.

is_equip_item(UniqueId) ->
	{Flag, _} = lib_player_pack:find_by_unique_id(?PACK_TYPE_EQUIP, UniqueId),
	Flag
.
equip_item(UniqueId) ->
	{Flag, EquipItem} = lib_player_pack:find_by_unique_id(?PACK_TYPE_EQUIP, UniqueId),
	?JUDGE_RETURN(Flag, ?ERROR_ITEM_NO_EXIST),
	EquipItem
.
equip_info(UniqueId) ->
	EquipItem = equip_item(UniqueId),
	EquipItem#item.equip_info
.
type(UniqueId) ->
	EquipItem = equip_item(UniqueId),
	lib_item_api:item_sub_type(EquipItem#item.item_id)
.
suit(UniqueId) ->
	EquipItem = equip_item(UniqueId),
	item_lvl(EquipItem#item.item_id)
.
break_through(UniqueId) ->
	EquipInfo = equip_info(UniqueId),
	EquipInfo#equip_info.break_through
.
up(UniqueId) ->
	EquipInfo = equip_info(UniqueId),
	EquipInfo#equip_info.up
.
up_fail(UniqueId) ->
	EquipInfo = equip_info(UniqueId),
	EquipInfo#equip_info.up_fail
.
attribute(UniqueId) ->
	EquipInfo = equip_info(UniqueId),
	EquipInfo#equip_info.attribute
.

u_hero_equip(HeroId, EquipItem) ->
	?JUDGE_RETURN(lib_troops_api:is_free(HeroId), ?ERROR_EQUIP_USE),
	#hero{
		equip_item_dict = EquipDict
	} = HeroInfo = lib_hero_api:hero_info(HeroId),
	#item{
		item_id = ItemId,
		equip_info = EquipInfo
	} = EquipItem,
	EquipType = lib_item_api:item_sub_type(ItemId),
	case EquipInfo#equip_info.hero_id of
		0 -> skip;
		OldHeroId -> d_hero_equip(OldHeroId, EquipType)
	end,
	NewEquipInfo = EquipInfo#equip_info{hero_id = HeroId},
	NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
	UpdateEquipItem =
		case dict:find(EquipType, EquipDict) of
			error -> NewEquipItem;
			{ok, OldEquipItem} ->
				OldEquipInfo = OldEquipItem#item.equip_info#equip_info{hero_id = 0},
				[OldEquipItem#item{equip_info = OldEquipInfo}, NewEquipItem]
		end,
	NewEquipDict = dict:store(EquipType, NewEquipItem, EquipDict),
	NewHeroInfo = HeroInfo#hero{equip_item_dict = NewEquipDict},
	lib_hero_api:update_hero(NewHeroInfo, ?HERO_UPDATE_TYPE_EQUIP),
	u_item(UpdateEquipItem),
	lib_player_process:process_hero_equip_change(HeroId)
.
d_hero_equip(HeroId, EquipType) ->
	?JUDGE_RETURN(lib_troops_api:is_free(HeroId), ?ERROR_EQUIP_UNFIX),
	#hero{
		equip_item_dict = EquipDict
	} = HeroInfo = lib_hero_api:hero_info(HeroId),
	case dict:find(EquipType, EquipDict) of
		error -> skip;
		{ok, EquipItem} ->
			NewEquipDict = dict:erase(EquipType, EquipDict),
			NewHeroInfo = HeroInfo#hero{equip_item_dict = NewEquipDict},
			lib_hero_api:update_hero(NewHeroInfo, ?HERO_UPDATE_TYPE_EQUIP),
			NewEquipInfo = EquipItem#item.equip_info#equip_info{hero_id = 0},
			NewEquipItem = EquipItem#item{equip_info = NewEquipInfo},
			u_item(NewEquipItem),
			lib_player_process:process_hero_equip_change(HeroId)
	end
.
u_equip_item(EquipItem, Flag) ->
	case Flag of
		false -> skip;
		true ->
			case EquipItem#item.equip_info#equip_info.hero_id of
				0 -> skip;
				HeroId ->
					#hero{
						equip_item_dict = EquipDict
					} = HeroInfo = lib_hero_api:hero_info(HeroId),
					EquipType = lib_item_api:item_sub_type(EquipItem#item.item_id),
					NewEquipDict = dict:store(EquipType, EquipItem, EquipDict),
					NewHeroInfo = HeroInfo#hero{equip_item_dict = NewEquipDict},
					lib_hero_api:update_hero(NewHeroInfo, ?HERO_UPDATE_TYPE_EQUIP),
					lib_player_process:process_hero_equip_change(HeroId)
			end
	end,
	u_item([EquipItem], Flag)
.
u_item(EquipItem) when is_record(EquipItem, item) ->
	u_item([EquipItem]);
u_item(EquipItemList) ->
	u_item(EquipItemList, true)
.
u_item(EquipItemList, Flag) ->
	lib_player_pack:update_item(?PACK_TYPE_EQUIP, EquipItemList, Flag)
.

player_equip() ->
	lib_player_equip:get_equip()
.

make_bin() ->
	#player_equip{make_bin = MakeBin} = player_equip(),
	MakeBin
.
make_num() ->
	maps:fold(
		fun(_, L, Acc) ->
			length(L) + Acc
		end, 0, make_bin())
.

make_id_list(BinId) ->
	maps:get(BinId, make_bin(), [])
.

u_make_bin(BinId, MakeIdList) ->
	#player_equip{make_bin = MakeBin} = PlayerEquip = player_equip(),
	u_player_equip(PlayerEquip#player_equip{make_bin = maps:put(BinId, MakeIdList, MakeBin)})
.

u_player_equip(PlayerEquip) ->
	lib_player_equip:put_equip(PlayerEquip)
.

reset(HeroId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	EquipDict = Hero#hero.equip_item_dict,
	EquipItemList = dict:fold(
		fun(_, Item, List) ->
			EquipInfo = (Item#item.equip_info)#equip_info{hero_id = 0},
			[Item#item{equip_info = EquipInfo} | List]
		end, [], EquipDict),
	u_item(EquipItemList),
	NewHero = Hero#hero{equip_item_dict = dict:new()},
	lib_hero_api:update_hero(NewHero, ?HERO_UPDATE_TYPE_EQUIP),
	lib_player_process:process_hero_equip_change(HeroId)
.

check_hero_by_equip() ->
	HeroList = lib_hero_api:hero_list(),
	[lib_hero_api:update_hero(X#hero{
		equip_item_dict = dict:filter(
			fun(_, Item) ->
				is_equip_item(Item#item.unique_id)
			end, Y)
	}) || X <- HeroList, (Y = X#hero.equip_item_dict) =/= dict:new()]
.

all_equip() ->
	#package{dict = A} = lib_player_pack:get_item_package(?PACK_TYPE_EQUIP),
	A.

hero_equip(HeroId) ->
	#hero{equip_item_dict = EquipDict} = lib_hero_api:hero_info(HeroId),
	EquipDict
.
suit_num(EquipDict, SuitId) ->
	dict:fold(
		fun(_, EquipItem, Num) ->
			Suit = item_lvl(EquipItem#item.item_id),
			case SuitId =:= Suit of true -> Num + 1; false -> Num end
		end, 0, EquipDict)
.

is_use(HeroId, ItemId) ->
	try
		dict:map(
			fun(_, Item) ->
				case Item#item.item_id =:= ItemId of
					true -> throw(skip);
					false -> skip
				end
			end, lib_equip_api:hero_equip(HeroId)),
		false
	catch
		_:_  -> true
	end
.

get_break_by_hero(HeroId) ->
	EquipDict = hero_equip(HeroId),
	dict:fold(
		fun(_, EquipItem, List) ->
			[EquipItem#item.equip_info#equip_info.break_through | List]
		end, [], EquipDict)
.

is_suit(EquipDict) ->
	try
		?JUDGE_BREAK(dict:size(EquipDict) =:= ?EQUIP_TYPE_NUM),
		EquipSuit = maps:get(jsonvalue, tb_const:get(equip_suit)),
		dict:fold(
			fun(_, EquipItem, SuitId) ->
				Suit = item_lvl(EquipItem#item.item_id),
				?JUDGE_BREAK(lists:member(Suit, EquipSuit)),
				?JUDGE_BREAK(SuitId =:= Suit orelse SuitId =:= 0),
				Suit
			end, 0, EquipDict)
	catch
		_:_ -> 0
	end
.

item([I | _] = ItemList, SerialName, SerialId) ->
	Item =
		if
			is_integer(I) -> lib_item_api:conf_item_to_pack_item(ItemList);
			true -> lib_item_api:conf_item_list_to_pack_item_list(ItemList)
		end,
	case SerialName div 10000 of
		1 ->
			Ret = lib_player_pack:validate_insert(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(SerialName, SerialId));
		2 ->
			Ret = lib_player_pack:validate_remove(Item),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(Item, ?REMOVE_SERIAL(SerialName, SerialId))
	end
.

time_to_gold(Time) ->
	[T, G] = maps:get(jsonvalue, tb_const:get(quicken_gold_time)),
	G * util:ceil(Time / T)
.

item_lvl(ItemId) ->
	Conf = tb_item:get(ItemId),
	maps:get(item_lvl, Conf, 0)
.

append_activate(Attribute, Color, Index) ->
	{StartList, [Single, Double | EndList]} = lists:split(2 * (Index - 1), Attribute),
	BinConfig = tb_equip_append_bin:get(?EQUIP_APPEND_BIN_ID(Color, Index)),
	SingleType = ?EQUIP_APPEND_TYPE(Single),
	SingleTypeList = maps:get(single_type, BinConfig),
	SingleTypeIndex = lib_api:list_index(SingleType, SingleTypeList),
	SingleRange = maps:get(single_range, BinConfig),
	[SingleMin, SingleMax] = lists:nth(SingleTypeIndex, SingleRange),
	SingleValue = lib_random:rand(SingleMin, SingleMax),
	NewSingle = ?EQUIP_APPEND_ID(SingleType, SingleValue),
	DoubleType = ?EQUIP_APPEND_TYPE(Double),
	DoubleTypeList = maps:get(double_type, BinConfig),
	NewDouble =
		case lib_api:list_index(DoubleType, DoubleTypeList) of
			0 -> Double;
			DoubleTypeIndex ->
				DoubleRange = maps:get(double_range, BinConfig),
				[DoubleMin, DoubleMax] = lists:nth(DoubleTypeIndex, DoubleRange),
				DoubleValue = lib_random:rand(DoubleMin, DoubleMax),
				?EQUIP_APPEND_ID(DoubleType, DoubleValue)
		end,
	StartList ++ [NewSingle, NewDouble | EndList]
.