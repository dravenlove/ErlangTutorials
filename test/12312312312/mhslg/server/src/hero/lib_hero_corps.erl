%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 11月 2020 15:33
%%%-------------------------------------------------------------------
-module(lib_hero_corps).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("ProtoClient_10116.hrl").

-define(CORPS_FRONT, 1). %%前军
-define(CORPS_BACK, 2).  %%后军
-define(STAGE_CONF_ID(Type, Stage), Type * 1000 + Stage).
-define(LEVEL_CONF_ID(Type, Level), Type * 100 + Level).

%% API
-export([
	hero_corps_stage_to_proto/2,
	hero_corps_level_to_proto/2,
	update_corps_level/3,
	init_hero_corps_level/1,
	calc_corps_level_prop/1,
	calc_corps_stage_prop/1,

	sign_in/0,

	validate_reset/2,
	reset/2
]).
-export([
	request_upgrade_stage/1,
	request_stage_reset/1
]).

hero_corps_stage_to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		front_stage = Hero#hero.front_stage,
		back_stage = Hero#hero.back_stage
	}
.

hero_corps_level_to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		front_level = Hero#hero.front_level,
		back_level = Hero#hero.back_level
	}
.

update_corps_level(Type, Level, IsNotify) ->
	HeroIdList = lib_hero_api:hero_id_list(),
	List = lists:filter(fun(HeroId) ->
		{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
		FrontType =:= Type orelse BackType =:= Type
	end, HeroIdList),

	lists:map(fun(HeroId) ->
		{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
		case Type of
			FrontType -> update_front_level(HeroId, Level);
			BackType -> update_back_level(HeroId, Level)
		end
  	end, List),

	UpdateType = ?IIF(IsNotify, ?HERO_UPDATE_TYPE_CORPS_LEVEL, ?HERO_UPDATE_TYPE_NO_NOTIFY),
	lib_hero_api:notify_hero_update(List, UpdateType)
.

init_hero_corps_level(HeroId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
	FrontLevel = lib_barrack_train_api:get_open_soldier_level(FrontType),
	BackLevel = lib_barrack_train_api:get_open_soldier_level(BackType),

	lib_hero_api:update_hero(Hero#hero{
		front_level = FrontLevel,
		back_level = BackLevel
	})
.

calc_corps_level_prop(#hero{id = HeroId, front_level = FrontLevel, back_level = BackLevel}) ->
	{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
	FrontConf = tb_hero_corps_level:get(?LEVEL_CONF_ID(FrontType, FrontLevel)),
	BackConf = tb_hero_corps_level:get(?LEVEL_CONF_ID(BackType, BackLevel)),

	FrontProp = lib_fight_prop:cfg_prop_dict_from_conf(FrontConf),
	BackProp = lib_fight_prop:cfg_prop_dict_from_conf(BackConf),
	lib_fight_prop:increase_prop([FrontProp, BackProp])
.

calc_corps_stage_prop(#hero{id = HeroId, front_stage = FrontStage, back_stage = BackStage}) ->
	{FrontType, BackType} = lib_hero_api:hero_corps_type(HeroId),
	FrontConf = tb_hero_corps_stage:get(?STAGE_CONF_ID(FrontType, FrontStage)),
	BackConf = tb_hero_corps_stage:get(?STAGE_CONF_ID(BackType, BackStage)),

	FrontProp = lib_fight_prop:cfg_prop_dict_from_conf(FrontConf),
	BackProp = lib_fight_prop:cfg_prop_dict_from_conf(BackConf),
	lib_fight_prop:increase_prop([FrontProp, BackProp])
.

sign_in() ->
	lists:map(fun(CorpsType) ->
		CorpsLevel = lib_barrack_train_api:get_open_soldier_level(CorpsType),
		update_corps_level(CorpsType, CorpsLevel, false)
  	end, ?HERO_CORPS_LIST)
.

update_front_level(HeroId, Level) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{front_level = Level}, ?HERO_UPDATE_TYPE_NO_NOTIFY),
	process_hero_corps_level_update(HeroId, ?CORPS_FRONT, Level)
.

update_back_level(HeroId, Level) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{back_level = Level}, ?HERO_UPDATE_TYPE_NO_NOTIFY),
	process_hero_corps_level_update(HeroId, ?CORPS_BACK, Level)
.

update_front_stage(HeroId, Stage) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{front_stage = Stage}, ?HERO_UPDATE_TYPE_CORPS_STAGE),
	process_hero_corps_stage_update(HeroId, ?CORPS_FRONT, Stage)
.

update_back_stage(HeroId, Stage) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{back_stage = Stage}, ?HERO_UPDATE_TYPE_CORPS_STAGE),
	process_hero_corps_stage_update(HeroId, ?CORPS_BACK, Stage)
.

max_stage() ->
	lib_const_api:get_const_int(hero_corps_max_stage, 0)
.

common_item_id() ->
	lib_const_api:get_const_int(hero_corps_stage_common_id, 0)
.

process_hero_corps_stage_update(HeroId, _Type, _Stage) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_CORPS_STAGE)
.

process_hero_corps_level_update(HeroId, _Type, _Level) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_CORPS_LEVEL)
.

request_upgrade_stage(Msg) ->
	#'Proto10116031'{
		hero_id = HeroId,
		type = Type,
		use_common = UseCommon
	} = Msg,
	case Type of
		?CORPS_FRONT ->?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_103), ?INFO("功能未开启"));
		?CORPS_BACK -> ?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_104), ?INFO("功能未开启"))
	end,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Hero = lib_hero_api:hero_info(HeroId),
	HeroLevel = lib_hero_api:hero_level(HeroId),

	{Stage, CorpsType} =
	case Type of
		?CORPS_FRONT -> {Hero#hero.front_stage, lib_hero_api:hero_front_corps(HeroId)};
		?CORPS_BACK -> {Hero#hero.back_stage, lib_hero_api:hero_back_corps(HeroId)};
		_ -> throw({error, ?ERROR_INVALID_PARAM})
	end,

	?JUDGE_RETURN(Stage < HeroLevel, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(Stage < max_stage(), ?ERROR_CLIENT_OPERATOR),

	Config = tb_hero_corps_stage:get(?STAGE_CONF_ID(CorpsType, Stage)),
	?JUDGE_RETURN(Config =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	ConfList = maps:get(need_item, Config, []),
	ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(ConfList),

	case UseCommon of
		false ->
			Ret = lib_player_pack:validate_remove(ItemObjList),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(ItemObjList, ?REMOVE_SERIAL(?USE_ITEM_CORPS_STAGE_UPGRADE, HeroId));
		true ->
			ExchangeList = lib_const_api:get_const_list(hero_corps_stage_common_exchange, []),
			ExchangeMap =
			lists:foldl(fun([Color, Amount], Maps) ->
				maps:put(Color, Amount, Maps)
			end, maps:new(), ExchangeList),

			{ItemObjList1, UseCommonAmount} =
			lib_common:list_foldl(fun(#item_obj{item_id = ItemId, amount = NeedAmount} = ItemObj, {List, Amount}) ->
				HaveAmount = lib_player_pack:count_by_id(ItemId),
				case HaveAmount >= NeedAmount of
					true -> {[ItemObj | List], Amount};
					false ->
						Color = lib_item_api:item_color(ItemId),
						ExchangeAmount = maps:get(Color, ExchangeMap, 0),
						?JUDGE_RETURN(ExchangeAmount > 0, ?ERROR_CONFIG_NOT_EXISTENT),

						NewAmount = (NeedAmount - HaveAmount) * ExchangeAmount + Amount,
						case HaveAmount > 0 of
							true -> {[?ITEM_OBJ(ItemId, HaveAmount) | List], NewAmount};
							false -> {List, NewAmount}
						end
				end
		  	end, {[], 0}, ItemObjList),

			ItemObjList2 =
			case UseCommon > 0 of
				false -> ItemObjList1;
				true ->
					CommonItem = ?ITEM_OBJ(common_item_id(), UseCommonAmount),
					Ret = lib_player_pack:validate_remove(CommonItem),
					?PACK_IS_SUCCESS(Ret),
					[CommonItem | ItemObjList1]
			end,
			lib_player_pack:auto_remove(ItemObjList2, ?REMOVE_SERIAL(?USE_ITEM_CORPS_STAGE_UPGRADE, HeroId))
	end,

	NewStage = Stage + 1,
	case Type of
		?CORPS_FRONT -> update_front_stage(HeroId, NewStage);
		?CORPS_BACK -> update_back_stage(HeroId, NewStage)
	end,
	lib_player_task_new:process_update_task(?COND_HERO_ARMY_STAGE),
	process_hero_crops_update(HeroId),
	lib_player_process:process_hero_army_upgrade(),

	Respond = #'Proto50116031'{
		hero_id = HeroId,
		type = Type,
		use_common = UseCommon,
		stage = NewStage
	},
	lib_send:respond_to_client(Respond)
.

process_hero_crops_update(HeroId) ->
	RunList = [
		{fun lib_holy_spirit_hall_api:recalculate_skill_id_by_hero_update/1, [HeroId]}
	],
	lib_common:try_run(RunList)
.

validate_reset(HeroId, Type) ->
	try
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
		Hero = lib_hero_api:hero_info(HeroId),

		{Stage, CorpsType} =
		case Type of
			?CORPS_FRONT -> {Hero#hero.front_stage, lib_hero_api:hero_front_corps(HeroId)};
			?CORPS_BACK -> {Hero#hero.back_stage, lib_hero_api:hero_back_corps(HeroId)};
			_ -> throw({error, ?ERROR_INVALID_PARAM})
		end,

		?JUDGE_RETURN(Stage > 0, ?ERROR_CLIENT_OPERATOR),
		Config = tb_hero_corps_stage:get(?STAGE_CONF_ID(CorpsType, Stage)),
		?JUDGE_RETURN(Config =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

		ConfList = maps:get(reset_reward_items, Config, []),
		ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(ConfList),
		CostItem = lib_item_api:conf_item_to_item_obj(maps:get(reset_cost_item, Config)),

		{true, [CostItem], ItemObjList}
	catch
		throw: {error, ErrCode} -> {ErrCode, [], []}
	end
.

reset(HeroId, Type) ->
	case Type of
		?CORPS_FRONT -> update_front_stage(HeroId, 0);
		?CORPS_BACK -> update_back_stage(HeroId, 0)
	end
.

request_stage_reset(Msg) ->
	#'Proto10116032'{
		hero_id = HeroId,
		type = Type
	} = Msg,
	% ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	% Hero = lib_hero_api:hero_info(HeroId),

	% {Stage, CorpsType} =
	% case Type of
	% 	?CORPS_FRONT -> {Hero#hero.front_stage, lib_hero_api:hero_front_corps(HeroId)};
	% 	?CORPS_BACK -> {Hero#hero.back_stage, lib_hero_api:hero_back_corps(HeroId)};
	% 	_ -> throw({error, ?ERROR_INVALID_PARAM})
	% end,

	% ?JUDGE_RETURN(Stage > 0, ?ERROR_CLIENT_OPERATOR),
	% Config = tb_hero_corps_stage:get(?STAGE_CONF_ID(CorpsType, Stage)),
	% ?JUDGE_RETURN(Config =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	% ConfList = maps:get(reset_reward_items, Config, []),
	% ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(ConfList),
	% CostItem = lib_item_api:conf_item_to_item_obj(maps:get(reset_cost_item, Config)),

	% Ret = lib_player_pack:validate_remove(CostItem),
	% ?PACK_IS_SUCCESS(Ret),

	% lib_player_pack:auto_remove(CostItem, ?REMOVE_SERIAL(?USE_ITEM_CORPS_STAGE_RESET, HeroId)),
	% lib_player_pack:auto_insert(ItemObjList, ?INSERT_SERIAL(?ADD_RESET_CORPS_STAGE, HeroId)),
	{Ret, RemoveItems, InsertItems} = validate_reset(HeroId, Type),
	?JUDGE_RETURN(Ret, Ret),

	PackRet = lib_player_pack:validate_remove(RemoveItems),
	?PACK_IS_SUCCESS(PackRet),

	lib_player_pack:auto_remove(RemoveItems, ?REMOVE_SERIAL(?USE_ITEM_CORPS_STAGE_RESET, HeroId)),
	lib_player_pack:auto_insert(InsertItems, ?INSERT_SERIAL(?ADD_RESET_CORPS_STAGE, HeroId)),

	% case Type of
	% 	?CORPS_FRONT -> update_front_stage(HeroId, 0);
	% 	?CORPS_BACK -> update_back_stage(HeroId, 0)
	% end,
	reset(HeroId, Type),

	Respond = #'Proto50116032'{
		hero_id = HeroId,
		type = Type
	},
	lib_send:respond_to_client(Respond)
.