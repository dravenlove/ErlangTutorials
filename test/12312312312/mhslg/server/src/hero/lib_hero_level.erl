%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 15:15
%%%-------------------------------------------------------------------
-module(lib_hero_level).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("chat.hrl").
-include("ProtoClient_10116.hrl").

-define(BROAD_ID_LEVEL, 1011).

%% API
-export([
	hero_level_to_proto/2,
	hero_level/1,
	calc_level_prop/1,

	sign_in/0,
	process_player_level_upgrade/0,

	validate_reset/1,
	reset/1
]).
-export([
	request_use_item/1,
	request_level_reset/1
]).

hero_level_to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		level = Hero#hero.level,
		exp = Hero#hero.exp
	}
.

hero_level(HeroId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	Hero#hero.level
.

sign_in() ->
	fix_hero_level(false)
.

process_player_level_upgrade() ->
	fix_hero_level(true)
.

calc_level_prop(#hero{level = Level}) ->
	Config = tb_hero_level:get(Level),
	lib_fight_prop:cfg_prop_dict_from_conf(Config)
.

fix_hero_level(IsNotify) ->
	lists:map(fun(#hero{id = HeroId, level = Level, exp = Exp} = _Hero) ->
		{NewLevel, NewExp} = calc_hero_new_level(Level, Exp, max_level(HeroId)),
		case Level =/= NewLevel orelse Exp =/= NewExp of
			true -> update_hero_level_info(HeroId, NewLevel, NewExp, IsNotify);
			false -> skip
		end
  	end, lib_hero_api:hero_list())
.

max_level(HeroId) ->
	Conf = tb_hero:get(HeroId),
	ConfMaxLevel =
	case Conf of
		false -> 0;
		_ -> maps:get(max_level, Conf, 0)
	end,

	min(ConfMaxLevel, lib_player:player_level() * lib_const_api:get_const_int(hero_level_pre_city, 0))
.

update_hero_level_info(HeroId, Level, Exp, IsNotify) ->
	UpdateType = ?IIF(IsNotify, ?HERO_UPDATE_TYPE_LEVEL, ?HERO_UPDATE_TYPE_NO_NOTIFY),

	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{
		level = Level,
		exp = Exp
	}, UpdateType)
.

process_hero_level_update(HeroId, _NewLevel) ->
	RunList = [
		{fun lib_hero_prop:update_hero_prop/2, [HeroId, ?HERO_PROP_TYPE_LEVEL]},
		{fun lib_hero_skill_learning:refresh_skill_number/2 ,[HeroId, true]},
		{fun lib_holy_spirit_hall_api:recalculate_skill_id_by_hero_update/1, [HeroId]},
		{fun lib_player_task_new:refresh_task_status/1, [?COND_TOTAL_HERO_LEVEL]}
	],
	lib_common:try_run(RunList)
.

calc_hero_new_level(CurLevel, Exp, MaxLevel) when CurLevel >= MaxLevel ->
	{CurLevel, Exp}
;
calc_hero_new_level(CurLevel, Exp, MaxLevel) ->
	try
		ExpConf = tb_hero_level:get(CurLevel),
		?JUDGE_RETURN(ExpConf =/= false, -1),
		NeedExp = maps:get(exp, ExpConf, 0),

		case Exp >= NeedExp of
			false -> {CurLevel, Exp};
			true -> calc_hero_new_level(CurLevel + 1, Exp - NeedExp, MaxLevel)
		end
	catch
	    throw: {error, _} -> {CurLevel, Exp}
	end
.

request_use_item(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_102), ?INFO("功能未开启")),
	#'Proto10116011'{
		hero_id = HeroId,
		item_id = ItemId
	} = Msg,

	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_CLIENT_OPERATOR),
	ItemConf = tb_item:get(ItemId),
	?JUDGE_RETURN(ItemConf =/= false , ?ERROR_CONFIG_NOT_EXISTENT),
	?JUDGE_RETURN(lib_item_api:is_common_item(ItemId) andalso lib_item_api:item_sub_type(ItemId) =:= 8, ?ERROR_CLIENT_OPERATOR),

	Hero = lib_hero_api:hero_info(HeroId),
	MaxLevel = max_level(HeroId),
	OldLevel = Hero#hero.level,
	?JUDGE_RETURN(OldLevel < MaxLevel, ?ERROR_CLIENT_OPERATOR),

	case ?NO_PACK_TEST of
		true -> skip;
		false ->
			RemoveItem = #item{item_id = ItemId, amount = 1},
			Ret = lib_player_pack:validate_remove(RemoveItem),
			?PACK_IS_SUCCESS(Ret),

			lib_player_pack:auto_remove(RemoveItem, ?REMOVE_SERIAL(?USE_HERO_LEVEL_UPGRADE, HeroId))
	end,

	AddExp = maps:get(param1, ItemConf, 0),
	{NewLevel, LeftExp} = calc_hero_new_level(OldLevel, Hero#hero.exp + AddExp, MaxLevel),

	update_hero_level_info(HeroId, NewLevel, LeftExp, true),

	Respond = #'Proto50116011'{
		hero_id = HeroId,
		item_id = ItemId,
		level = NewLevel,
		exp = LeftExp
	},
	lib_send:respond_to_client(Respond),

	case OldLevel =/= NewLevel andalso NewLevel rem 3 =:= 0 of
		false -> skip;
		true ->
			Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_LEVEL),
			Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_COUNTRY_ID, lib_player:player_country()),
			PlayerId = lib_player:player_id(),
			PlayerName = lib_player:player_name(),
			BroadRole = #'ProtoBroadRole'{role_id = PlayerId, role_name = PlayerName},
			Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_ROLE_INFO, BroadRole),
			Shout4 = lib_broadcast_api:push_broad_arg(Shout3, ?BROAD_TYPE_HERO_BASE, #'ProtoBroadHero'{player_id = PlayerId, hero_id = HeroId}),
			Shout5 = lib_broadcast_api:push_broad_arg(Shout4, ?BROAD_TYPE_NUM, NewLevel),
			lib_broadcast_api:send_all_system(Shout5)
	end,

	case OldLevel =/= NewLevel of
		false -> skip;
		true -> process_hero_level_update(HeroId, NewLevel)
	end
.

validate_reset(HeroId) ->
	try 
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

		Level = lib_hero_api:hero_level(HeroId),
		FrontStage = lib_hero_api:hero_front_stage(HeroId),
		BackStage = lib_hero_api:hero_back_stage(HeroId),
		?JUDGE_RETURN(Level > 1 andalso FrontStage =:= 0 andalso BackStage =:= 0, ?ERROR_CLIENT_OPERATOR),

		LevelConf = tb_hero_level:get(Level),
		?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

		CostItem = lib_item_api:conf_item_to_item_obj(maps:get(reset_cost_item, LevelConf, [0,0])),

		RewardItems = lib_item_api:conf_item_list_to_item_obj_list(maps:get(reset_reward_items, LevelConf, [])),

		{true, [CostItem], RewardItems}
	catch
		throw: {error, ErrCode} -> {ErrCode, [], []}
	end

.

reset(HeroId) ->
	update_hero_level_info(HeroId, 1, 0, true)
.

request_level_reset(Msg) ->
	HeroId = Msg#'Proto10116012'.hero_id,
	% ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

	% Level = lib_hero_api:hero_level(HeroId),
	% FrontStage = lib_hero_api:hero_front_stage(HeroId),
	% BackStage = lib_hero_api:hero_back_stage(HeroId),
	% ?JUDGE_RETURN(Level > 1 andalso FrontStage =:= 0 andalso BackStage =:= 0, ?ERROR_CLIENT_OPERATOR),

	% LevelConf = tb_hero_level:get(Level),
	% ?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	% CostItem = lib_item_api:conf_item_to_pack_item(maps:get(reset_cost_item, LevelConf, [0,0])),
	% Ret = lib_player_pack:validate_remove(CostItem),
	% ?PACK_IS_SUCCESS(Ret),

	% lib_player_pack:auto_remove(CostItem, ?REMOVE_SERIAL(?USE_RESET_HERO_LEVEL, HeroId)),
	% RewardItems = lib_item_api:conf_item_list_to_pack_item_list(maps:get(reset_reward_items, LevelConf, [])),
	% lib_player_pack:auto_insert(RewardItems, ?INSERT_SERIAL(?ADD_RESET_HERO_LEVEL, HeroId)),

	{Ret, RemoveItems, InsertItems} = validate_reset(HeroId),
	?JUDGE_RETURN(Ret, Ret),

	PackRet = lib_player_pack:validate_remove(RemoveItems),
	?PACK_IS_SUCCESS(PackRet),

	lib_player_pack:auto_remove(RemoveItems, ?REMOVE_SERIAL(?USE_RESET_HERO_LEVEL, HeroId)),
	lib_player_pack:auto_insert(InsertItems, ?INSERT_SERIAL(?ADD_RESET_HERO_LEVEL, HeroId)),

	% update_hero_level_info(HeroId, 1, 0, true),
	reset(HeroId),

	Respond = #'Proto50116012'{
		hero_id = HeroId
	},
	lib_send:respond_to_client(Respond),

	process_hero_level_update(HeroId, 1)
.