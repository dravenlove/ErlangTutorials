%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 16:16
%%%-------------------------------------------------------------------
-module(lib_hero_star).
-author("13661").

-define(BROAD_ID_STAR_NOCHANGE, 1012). 
-define(BROAD_ID_STAR_CHANGE, 1013).

-include("common.hrl").
-include("hero.hrl").
-include("chat.hrl").
-include("ProtoClient_10116.hrl").

%% API
-export([
	hero_star_to_proto/2,
	calc_star_prop/1,
	validate_reset/1,
	reset/1
]).

-export([
	request_star_upgrade/1,
	request_star_reset/1
]).


hero_star_to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		star = Hero#hero.star
	}
.

calc_star_prop(#hero{id = HeroId, star = Star}) ->
	ConfId = HeroId * 100 + Star,
	Config = tb_hero_star_prop:get(ConfId),
	lib_fight_prop:cfg_prop_dict_from_conf(Config)
.

update_hero_star(HeroId, Star) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{
		star = Star
	}, ?HERO_UPDATE_TYPE_STAR)

.

process_hero_star_update(HeroId, _NewStar) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_STAR),
	lib_hero_skill_learning:refresh_skill_number(HeroId, true),
	lib_holy_spirit_hall_api:recalculate_skill_id_by_hero_update(HeroId),
	lib_player_process:process_hero_star_update(HeroId, _NewStar)
.

max_star(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> 0;
		_ -> maps:get(max_star, Conf, 0)
	end
.

star_conf_id(HeroQuality, Star) ->
	Type =
	case HeroQuality of
		?HERO_QUALITY_WAR_GOD -> 2;
		_ -> 1
	end,
	Type * 1000 + Star
.

-define(TYPE_COMMON, 	1).
-define(TYPE_SPEED,		2).
request_star_upgrade(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_105), ?INFO("功能未开启")),
	#'Proto10116021'{
		hero_id = HeroId,
		type = Type
	} = Msg,
	?JUDGE_RETURN(Type =:= ?TYPE_COMMON orelse Type =:= ?TYPE_SPEED, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_CLIENT_OPERATOR),
	Hero = lib_hero_api:hero_info(HeroId),
	MaxStar = max_star(HeroId),
	CurStar = Hero#hero.star,
	?JUDGE_RETURN(CurStar < MaxStar, ?ERROR_CLIENT_OPERATOR),

	HeroQuality = lib_hero_api:hero_quality(HeroId),
	StarConf = tb_hero_star:get(star_conf_id(HeroQuality, CurStar)),
	?JUDGE_RETURN(StarConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	NeedNobility = maps:get(need_nobility, StarConf, 0),
	?JUDGE_RETURN(NeedNobility =:= 0 orelse lib_nobility_api:is_open(NeedNobility), ?ERROR_CLIENT_OPERATOR),

	RemoveItems =
	case Type of
		?TYPE_COMMON ->
			HeroConf = tb_hero:get(HeroId),
			CostId = maps:get(star_item_id, HeroConf, 0),
			CostNum = maps:get(cost_num, StarConf),

			CostMoneyId = lib_const_api:get_const_int(money),
			CostMoneyNum = maps:get(money_cost_num, StarConf),
			[?ITEM_OBJ(CostId, CostNum), ?ITEM_OBJ(CostMoneyId, CostMoneyNum)];
		?TYPE_SPEED ->
			CostConf = tb_hero_star_cost:get(HeroId * 100 + CurStar),
			?JUDGE_RETURN(CostConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
			CostId = maps:get(cost_id, CostConf),
			CostNum = maps:get(cost_num, CostConf),
			?ITEM_OBJ(CostId, CostNum)
	end,

	case ?NO_PACK_TEST of
		true -> skip;
		false ->
			Ret = lib_player_pack:validate_remove(RemoveItems),
			?PACK_IS_SUCCESS(Ret),

			lib_player_pack:auto_remove(RemoveItems, ?REMOVE_SERIAL(?USE_HERO_STAR_UPGRADE, HeroId))
	end,

	update_hero_star(HeroId, CurStar + 1),

	Respond = #'Proto50116021'{
		hero_id = HeroId,
		star = CurStar + 1,
		type = Type
	},
	lib_send:respond_to_client(Respond),

	NewStar = CurStar + 1,
	OldColor = lib_hero_api:hero_color(CurStar),
	NewColor = lib_hero_api:hero_color(NewStar),

	Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_STAR_NOCHANGE),
	Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_COUNTRY_ID, lib_player:player_country()),
	PlayerId = lib_player:player_id(),
	PlayerName = lib_player:player_name(),
	BroadRole = #'ProtoBroadRole'{role_id = PlayerId, role_name = PlayerName},
	Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_ROLE_INFO, BroadRole),
	Shout4 = lib_broadcast_api:push_broad_arg(Shout3, ?BROAD_TYPE_HERO_BASE, #'ProtoBroadHero'{player_id = PlayerId, hero_id = HeroId}),
	Shout5 =
		case OldColor =/= NewColor of
			false -> lib_broadcast_api:push_broad_arg(Shout4, ?BROAD_TYPE_STAR_LEVEL, NewStar);
			true ->lib_broadcast_api:push_broad_arg(Shout4, ?BROAD_TYPE_HERO_COLOR, NewColor)
		end,
	lib_broadcast_api:send_all_system(Shout5),

	process_hero_star_update(HeroId, NewStar)
.

validate_reset(HeroId) ->
	try 
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

		Star = lib_hero_api:hero_star(HeroId),
		?JUDGE_RETURN(Star > 0, ?ERROR_CLIENT_OPERATOR),

		HeroConf = tb_hero:get(HeroId),
		CostId = maps:get(star_reset_id, HeroConf, 0),
		RewardId = maps:get(star_item_id, HeroConf, 0),

		HeroType = lib_hero_api:hero_type(HeroId),
		StarConf = tb_hero_star:get(star_conf_id(HeroType, Star)),
		?JUDGE_RETURN(StarConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
		CostNum = maps:get(reset_cost_num, StarConf, 0),

		RemoveItem = ?ITEM_OBJ(CostId, CostNum),

		RewardNum = maps:get(reset_reward_num, StarConf, 0),
		RewardItem = ?ITEM_OBJ(RewardId, RewardNum),

		{true, [RemoveItem], [RewardItem]}
	catch
		throw:{error, ErrCode} -> {ErrCode, [], []}
	end

.

reset(HeroId) ->
	update_hero_star(HeroId, 0)
.

request_star_reset(Msg) ->
	HeroId = Msg#'Proto10116022'.hero_id,
	% ?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

	% Star = lib_hero_api:hero_star(HeroId),
	% ?JUDGE_RETURN(Star > 0, ?ERROR_CLIENT_OPERATOR),

	% HeroConf = tb_hero:get(HeroId),
	% CostId = maps:get(star_reset_id, HeroConf, 0),
	% RewardId = maps:get(star_item_id, HeroConf, 0),

	% HeroType = lib_hero_api:hero_type(HeroId),
	% StarConf = tb_hero_star:get(star_conf_id(HeroType, Star)),
	% ?JUDGE_RETURN(StarConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	% CostNum = maps:get(reset_cost_num, StarConf, 0),

	% RemoveItem = ?ITEM_OBJ(CostId, CostNum),
	% Ret = lib_player_pack:validate_remove(RemoveItem),
	% ?PACK_IS_SUCCESS(Ret),

	% lib_player_pack:auto_remove(RemoveItem, ?REMOVE_SERIAL(?USE_RESET_HERO_STAR, HeroId)),

	% RewardNum = maps:get(reset_reward_num, StarConf, 0),
	% RewardItem = ?ITEM_OBJ(RewardId, RewardNum),
	% lib_player_pack:auto_insert(RewardItem, ?INSERT_SERIAL(?ADD_RESET_HERO_STAR, HeroId)),

	{Ret, RemoveItems, InsertItems} = validate_reset(HeroId),
	?JUDGE_RETURN(Ret, Ret),

	PackRet = lib_player_pack:validate_remove(RemoveItems),
	?PACK_IS_SUCCESS(PackRet),

	lib_player_pack:auto_insert(InsertItems, ?INSERT_SERIAL(?ADD_RESET_HERO_STAR, HeroId)),

	% update_hero_star(HeroId, 0),
	reset(HeroId),

	Respond = #'Proto50116022'{
		hero_id = HeroId
	},
	lib_send:respond_to_client(Respond),

	process_hero_star_update(HeroId, 0)
.