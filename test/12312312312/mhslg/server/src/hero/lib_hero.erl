%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 11:47
%%%-------------------------------------------------------------------
-module(lib_hero).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("chat.hrl").
-include("ProtoClient_10116.hrl").

-define(BROAD_ID_ACTIVE, 1010).		%% 英雄激活
-define(BROAD_ID_AWAKEN, 1015).		%% 英雄觉醒
-define(MAIL_ID_RESET,	1019).

%% API
-export([
	ets_init/0,
	build_index/0,
	put_player_hero/1,
	put_player_hero/2,
	get_player_hero/0,
	player_hero_handler/0,

	sign_in/0,
	sign_out/0
]).
-export([
	update_init_skill_group/2,
	calc_init_prop/1,
	init_hero/1
]).
-export([
	request_hero_list/0,
	request_active_hero/1,
	request_fetch_hero_info/1,
	request_awaken_hero/1,
	request_hero_reset/1
]).

put_player_hero(PlayerHero) when is_record(PlayerHero, player_hero) ->
	put_player_hero(PlayerHero, false)
.
put_player_hero(PlayerHero, IsSaveDb) when is_record(PlayerHero, player_hero) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_HERO),
	erlang:put(?ETS_PLAYER_HERO, PlayerHero)
.

get_player_hero() ->
	erlang:get(?ETS_PLAYER_HERO)
.

ets_init() ->
	ets:new(?ETS_PLAYER_HERO, [?ETS_KEY_POS(#player_hero.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HEROS, {?TUPLE_INT(id, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HEROS, {?TUPLE_INT(id, 1), ?TUPLE_INT(is_delete, 1)}, false),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_HEROS, {?TUPLE_INT(id, 1), ?TUPLE_INT(hero_id, 1)}, false)
.

player_hero_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_HERO,
		table_name = ?DBPLAYER_HEROS,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_hero:ets_init/0,
		mongo_index_func = fun lib_hero:build_index/0,
		load_func = fun db_player_hero:load_player_hero/1,
		save_func = fun db_player_hero:save_player_hero/1,
		get_func = fun lib_hero:get_player_hero/0,
		put_func = fun lib_hero:put_player_hero/2
	}.

sign_in() ->
	RunList = [
		fun lib_player:handle_new_role/0,
		fun lib_hero_level:sign_in/0,
		fun lib_hero_skill_learning:sign_in/0,
		fun lib_hero_corps:sign_in/0
	],
	lib_common:try_run(RunList),

	lib_hero_skill:sign_in(),
	lib_hero_prop:sign_in()
.

sign_out() ->
	lib_hero_prop:sign_out()
.

update_init_skill_group(HeroId, IsNotify) ->
	HeroConf = tb_hero:get(HeroId),
	SkillList = maps:get(skill_list, HeroConf, []),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_GROUP_INIT, HeroId, SkillList, IsNotify)
.

calc_init_prop(#hero{id = HeroId} = _Hero) ->
	HeroConf = tb_hero:get(HeroId),
	lib_fight_prop:cfg_prop_dict_from_conf(HeroConf)
.

init_hero(HeroId) ->
	RunList = [
		{fun lib_hero_corps:init_hero_corps_level/1, [HeroId]},
		{fun lib_hero_skill_learning:init_skill_learning/1, [HeroId]}
	],
	lib_common:try_run(RunList),

	lib_hero_skill:init_hero_skill(HeroId),
	lib_hero_prop:init_hero_prop(HeroId)
.

request_hero_list() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_101), ?INFO("功能未开启")),
	PlayerHero = lib_hero:get_player_hero(),
	{ProtoHeroListList, _} = dict:fold(
		fun(_HeroId, Hero, {List, Acc}) ->
			{case Acc rem 20 of
				0 -> [[lib_hero_api:hero_to_proto(Hero)] | List];
				_ ->
					[List1 | List2] = List,
					[[lib_hero_api:hero_to_proto(Hero) | List1] | List2]
			end, Acc + 1}
		end, {[], 0}, PlayerHero#player_hero.hero_dict),
	[?INFO("request_hero_list ~p", [length(ProtoHeroList)]) || ProtoHeroList <- ProtoHeroListList],
	[lib_send:respond_to_client(#'Proto50116001'{hero_list = ProtoHeroList}) || ProtoHeroList <- ProtoHeroListList]
.

request_active_hero(Msg) ->
	HeroId = Msg#'Proto10116002'.hero_id,
	HeroConf = tb_hero:get(HeroId),
	?JUDGE_RETURN(HeroConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	?JUDGE_RETURN(not lib_hero_api:is_have_hero(HeroId), ?ERROR_CLIENT_OPERATOR),

	CostId = maps:get(act_id, HeroConf, 0),
	CostNum = maps:get(act_num, HeroConf, 0),

	case ?NO_PACK_TEST of
		true -> skip;
		false ->
			RemoveItem = #item{item_id = CostId, amount = CostNum},
			Ret = lib_player_pack:validate_remove(RemoveItem),
			?PACK_IS_SUCCESS(Ret),

			lib_player_pack:auto_remove(RemoveItem, ?REMOVE_SERIAL(?USE_ACTIVE_HERO, HeroId))
	end,

	lib_hero_api:active_hero(HeroId, ?HERO_ACTIVE_TYPE_COMPOSE),

	Respond = #'Proto50116002'{
		hero_id = HeroId
	},
	lib_send:respond_to_client(Respond),

	HeroQuality = lib_hero_api:hero_quality(HeroId),
	QualityList = [?HERO_QUALITY_KINGDOM, ?HERO_QUALITY_VIRGIN, ?HERO_QUALITY_WAR_GOD],
	case lists:member(HeroQuality, QualityList) of
		false -> skip;
		true ->
			Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_ACTIVE),
			Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_COUNTRY_ID, lib_player:player_country()),
			PlayerId = lib_player:player_id(),
			PlayerName = lib_player:player_name(),
			BroadRole = #'ProtoBroadRole'{role_id = PlayerId, role_name = PlayerName},
			Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_ROLE_INFO, BroadRole),
			Shout4 = lib_broadcast_api:push_broad_arg(Shout3, ?BROAD_TYPE_HERO_QUALITY, HeroQuality),
			Shout5 = lib_broadcast_api:push_broad_arg(Shout4, ?BROAD_TYPE_HERO_BASE, #'ProtoBroadHero'{player_id = PlayerId, hero_id = HeroId}),
			lib_broadcast_api:send_all_system(Shout5)
	end
.

request_fetch_hero_info(Msg) ->
	#'Proto10116003'{
		hero_id = HeroId,
		type = Type
	} = Msg,

	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	?JUDGE_RETURN(?HERO_UPDATE_TYPE_START < Type andalso Type =< ?HERO_UPDATE_TYPE_END, ?ERROR_CLIENT_OPERATOR),

	lib_hero_api:notify_hero_update(HeroId, Type)
.

request_awaken_hero(Msg) ->
	HeroId = Msg#'Proto10116004'.hero_id,
	HeroConf = tb_hero:get(HeroId),
	?JUDGE_RETURN(HeroConf, ?ERROR_CONFIG_NOT_EXISTENT),
	#{
		awaken_id := AwakenId,
		awaken_num := AwakenNum
	} = HeroConf,
	AwakenItem = [AwakenId, AwakenNum],
	case lib_hero_api:is_have_hero(HeroId) of
		false ->
			lib_equip_api:item([[maps:get(act_id, HeroConf), maps:get(act_num, HeroConf)] | [AwakenItem]], ?USE_AWAKEN_HERO, HeroId),
			lib_hero_api:active_hero(HeroId, ?HERO_ACTIVE_TYPE_COMPOSE, ?HERO_AWAKEN_YES);
		true ->
			HeroInfo = lib_hero_api:hero_info(HeroId),
			case HeroInfo#hero.awaken of
				?HERO_AWAKEN_NO ->
					lib_equip_api:item(AwakenItem, ?USE_AWAKEN_HERO, HeroId),
					lib_hero_api:update_hero(HeroInfo#hero{awaken = ?HERO_AWAKEN_YES}, ?HERO_UPDATE_AWAKEN),
					lib_player_process:process_hero_awaken(HeroId);
				_ -> throw({error, ?ERROR_CLIENT_OPERATOR})
			end
	end,
	Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_AWAKEN),
	Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_COUNTRY_ID, lib_player:player_country()),
	PlayerId = lib_player:player_id(),
	PlayerName = lib_player:player_name(),
	BroadRole = #'ProtoBroadRole'{role_id = PlayerId, role_name = PlayerName},
	Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_ROLE_INFO, BroadRole),
	Shout4 = lib_broadcast_api:push_broad_arg(Shout3, ?BROAD_TYPE_HERO_BASE, #'ProtoBroadHero'{player_id = PlayerId, hero_id = HeroId}),
	lib_broadcast_api:send_all_system(Shout4),
	Res = #'Proto50116004'{
		hero_id = HeroId
	},
	lib_send:respond_to_client(Res)
.

request_hero_reset(Msg) ->
	HeroId = Msg#'Proto10116005'.hero_id,

	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	ConfList = lib_const_api:get_const_list(hero_reset_cost, []),
	ItemObjList = lib_item_api:conf_item_list_to_item_obj_list(ConfList),

	FreeDay = lib_const_api:get_const_int(hero_free_reset_day, 0),

	CurTick = lib_timer:unixtime(),
	CreateTick = lib_player:create_tick(),
	
	case CurTick > CreateTick + FreeDay * lib_timer:day_second() of
		false -> skip;
		true ->
			Ret = lib_player_pack:validate_remove(ItemObjList),
			?PACK_IS_SUCCESS(Ret),
			lib_player_pack:auto_remove(ItemObjList, ?REMOVE_SERIAL(?USE_HERO_RESET, HeroId))
	end,

	%% 英雄技能高级重置
	InsertItems1 = lib_hero_skill_learning:reset_all_skill(HeroId, 2),

	{Flag2, _, InsertItems2} = lib_hero_star:validate_reset(HeroId),
	?IIF(Flag2 =:= true, lib_hero_star:reset(HeroId), skip),

	%%前军
	{Flag3, _, InsertItems3} = lib_hero_corps:validate_reset(HeroId, 1),
	?IIF(Flag3 =:= true, lib_hero_corps:reset(HeroId, 1), skip),

	%%后军
	{Flag4, _, InsertItems4} = lib_hero_corps:validate_reset(HeroId, 2),
	?IIF(Flag4 =:= true, lib_hero_corps:reset(HeroId, 2), skip),

	{Flag5, _, InsertItems5} = lib_hero_level:validate_reset(HeroId),
	?IIF(Flag5 =:= true, lib_hero_level:reset(HeroId), skip),
	%% 装备
	lib_equip_api:reset(HeroId),
	%% 助战
	lib_hero_assist:reset(HeroId),
	%% 星座
	lib_star_hero:reset(HeroId),

	%% 阵法
	InsertItems6 = lib_hero_formation:reset(HeroId),

	Respond = #'Proto50116005'{
		hero_id = HeroId
	},
	lib_send:respond_to_client(Respond),
	InsertItemObjList = lib_item_api:merge_item_obj_list(InsertItems1 ++ InsertItems2 ++ InsertItems3 ++ InsertItems4 ++ InsertItems5 ++ InsertItems6),
	ItemList = lib_item_api:item_obj_list_to_pack_item_list(InsertItemObjList),

	Mail1 = lib_mail_api:create_sys_mail(?MAIL_ID_RESET, ?ADD_HERO_RESET),
	Mail2 = lib_mail_api:add_item_list(Mail1, ItemList),
	Mail3 = lib_mail_api:push_mail_arg(Mail2, ?MAIL_ARG_TYPE_HERO_NAME, HeroId),
	lib_mail_api:send(Mail3, lib_player:player_id())
.