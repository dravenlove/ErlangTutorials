%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 12月 2020 16:22
%%%-------------------------------------------------------------------
-module(lib_player_country).
-author("13661").

-include("common.hrl").
-include("player.hrl").
-include("country.hrl").
-include("country_rank.hrl").
-include("ProtoClient_10128.hrl").

%% API
-export([
	get_player_country/0,
	put_player_country/1,
	put_player_country/2,
	ets_init/0,
	build_index/0,
	player_country_handler/0,

	sign_in/0,
	sign_out/0,
	reset_everyday/0,
	client_load_complete/0,
	process_recharge_money/1,
	process_player_show_update/1,
	process_player_hero_update/1,
	process_fief_reward_update/0,
	process_nobility_active/0
]).
-export([
	update_county_pos/1,
	update_city_id/1,
	notify_notice/2
]).
-export([
	request_pos_info/0,
	request_notice/0,
	request_modify_notice/1,
	request_appoint_pos/1,
	request_impeach_info/0,
	request_impeach/1,
	request_impeach_votes/1,
	request_open_siege_order/1,
	request_open_defensive_order/1,
	request_open_train_order/0,
	request_open_build_order/0,
	request_open_prohibit_order/1,
	request_city_master_info/0,
	request_appoint_city_master/1,
	request_rank_list/1,
	request_open_master_order/1,
	request_order_list_info/0
]).

put_player_country(PlayerCountry) when is_record(PlayerCountry, player_country) ->
	put_player_country(PlayerCountry, false)
.
put_player_country(PlayerCountry, IsSaveDb) when is_record(PlayerCountry, player_country) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_COUNTRY),
	erlang:put(?ETS_PLAYER_COUNTRY, PlayerCountry)
.

get_player_country() ->
	erlang:get(?ETS_PLAYER_COUNTRY)
.

ets_init() ->
	ets:new(?ETS_PLAYER_COUNTRY, [?ETS_KEY_POS(#player_country.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_COUNTRY, {?TUPLE_INT(id, 1)}, true)
.

player_country_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_COUNTRY,
		table_name = ?DBPLAYER_COUNTRY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_country:load_player_country/1,
		save_func = fun db_player_country:save_player_country/1,
		get_func = fun get_player_country/0,
		put_func = fun put_player_country/2
	}.

async_apply(Fun, Args) ->
	lib_map_api:async(Fun, Args)
.
async_request(Fun) ->
	async_request(Fun, [])
.
async_request(Fun, Args) ->
	async_apply(fun mod_map:player_request/4, [erlang:get(recogn), lib_player:player_id(), Fun, Args])
.

sync_apply(Fun, Args) ->
	lib_map_api:sync(Fun, Args)
.

sign_in() ->
	RewardMap = calc_fief_reward(),
	CanAppointMaster = case lib_nobility_api:privilege_add(?APPOINT_CITY_MASTER) of 0 -> false; _ -> true end,
	async_apply(fun lib_country:process_sign_in/6, [lib_player:player_id(), lib_player:player_country(), CanAppointMaster, lib_player:player_show(), RewardMap, lib_hero_api:hero_to_hero_base(lib_hero_api:best_hero())])
.
sign_out() ->
	async_apply(fun lib_country:process_sign_out/1, [lib_player:player_id()])
.

reset_everyday() ->
	set_notice_uuid(0)
.

client_load_complete() ->
	async_apply(fun lib_country:process_client_load_complete/1, [lib_player:player_id()]),
	notify_pos()
.

process_recharge_money(Money) ->
	async_apply(fun lib_country:process_recharge/2, [lib_player:player_id(), Money])
.

process_player_show_update(Show) ->
	async_apply(fun lib_country:process_player_show_update/2, [lib_player:player_id(), Show])
.

process_player_hero_update(Hero) ->
	async_apply(fun lib_country:process_player_hero_update/2, [lib_player:player_id(), Hero])
.

process_fief_reward_update() ->
	sync_fief_reward()
.

process_nobility_active() ->
	CanAppointMaster = case lib_nobility_api:privilege_add(?APPOINT_CITY_MASTER) of 0 -> false; _ -> true end,
	async_apply(fun lib_country:process_can_appoint_master_update/2, [lib_player:player_id(), CanAppointMaster])
.

get_notice_uuid() ->
	PlayerCountry = get_player_country(),
	PlayerCountry#player_country.notice_uuid
.

calc_fief_reward() ->
	IdList = lib_inner_city_api:get_resource_building_list(),

	lists:foldl(fun(Id, Map) ->
		RewardList = lib_inner_city_api:get_resource_building_output(Id),
		lists:foldl(fun([ItemId, Amount], Map2) ->
			OldAmount = maps:get(ItemId, Map2, 0),
			maps:put(ItemId, Amount + OldAmount, Map2)
		end, Map, RewardList)
	end, maps:new(), IdList)
.

sync_fief_reward() ->
	RewardMap = calc_fief_reward(),
	async_apply(fun lib_country:process_fief_reward_update/2, [lib_player:player_id(), RewardMap])
.

set_notice_uuid(UUID) ->
	PlayerCountry = get_player_country(),
	put_player_country(PlayerCountry#player_country{notice_uuid = UUID}, true)
.

update_county_pos(Pos) ->
	PlayerBase = lib_player:get_player_base(),
	lib_player:put_player_base(PlayerBase#player_base{country_pos = Pos}, true),
	notify_pos(),

	lib_player_process:process_player_show_update()
.

update_city_id(CityId) ->
	PlayerBase = lib_player:get_player_base(),
	lib_player:put_player_base(PlayerBase#player_base{city_id = CityId}, true),
	notify_city_id(),

	lib_player_process:process_player_show_update()
.

notify_notice(UUID, Notice) ->
	try
		CurUUID = get_notice_uuid(),
		?JUDGE_RETURN(CurUUID =/= UUID, 0),
		set_notice_uuid(UUID),

		Notify = #'Proto80128001'{
			notice = Notice
		},
		lib_send:respond_to_client(Notify)
	catch
	    throw: {error, _} -> skip
	end
.

notify_pos() ->
	Notify = #'Proto80128002'{pos = lib_player:country_position()},
	lib_send:respond_to_client(Notify)
.

notify_city_id() ->
	Notify = #'Proto80128003'{city_id = lib_player:city_id()},
	lib_send:respond_to_client(Notify)
.

request_pos_info() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_123), ?INFO("功能未开启")),
	async_request(fun lib_country_request:request_pos_info/1)
.

request_notice() ->
	async_request(fun lib_country_request:request_notice/1)
.

request_modify_notice(Msg) ->
	Notice = Msg#'Proto10128003'.notice,
	async_request(fun lib_country_request:request_modify_notice/2, [Notice])
.

request_appoint_pos(Msg) ->
	#'Proto10128004'{
		player_id = TagPlayerId,
		pos = TagPos
	} = Msg,
	async_request(fun lib_country_request:request_appoint_pos/3, [TagPlayerId, TagPos])
.

request_impeach_info() ->
	async_request(fun lib_country_request:request_impeach_info/1)
.

request_impeach(Msg) ->
	ReqImpeachId = Msg#'Proto10128006'.player_id,
	Cost = lib_country_setting:impeach_cost(),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = sync_apply(fun lib_country_request:request_impeach/2, [lib_player:player_id(), ReqImpeachId]),
	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_IMPEACH_KING, 0)),

	Respond = #'Proto50128006'{
		player_id = ReqImpeachId
	},
	lib_send:respond_to_client(Respond)
.

request_impeach_votes(Msg) ->
	TagPlayerId = Msg#'Proto10128007'.player_id,
	async_request(fun lib_country_request:request_impeach_votes/2, [TagPlayerId])
.

request_open_siege_order(Msg) ->
	CityId = Msg#'Proto10128008'.city_id,

	Cost = lib_country_setting:order_cost(?ORDER_TYPE_SIEGE),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = async_request(fun lib_country_request:request_open_siege_order/2, [CityId]),

	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_SIEGE)),

	Rewards = lib_country_setting:order_reward(?ORDER_TYPE_SIEGE),
	lib_player_pack:auto_insert(Rewards, ?INSERT_SERIAL(?ADD_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_SIEGE)),

	Respond = #'Proto50128008'{
		city_id = CityId
	},
	lib_send:respond_to_client(Respond)
.

request_open_defensive_order(Msg) ->
	CityId = Msg#'Proto10128009'.city_id,

	Cost = lib_country_setting:order_cost(?ORDER_TYPE_DEFENSIVE),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = async_request(fun lib_country_request:request_open_defensive_order/2, [CityId]),

	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_DEFENSIVE)),

	Rewards = lib_country_setting:order_reward(?ORDER_TYPE_DEFENSIVE),
	lib_player_pack:auto_insert(Rewards, ?INSERT_SERIAL(?ADD_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_DEFENSIVE)),

	Respond = #'Proto50128009'{
		city_id = CityId
	},
	lib_send:respond_to_client(Respond)
.

request_open_train_order() ->
	Cost = lib_country_setting:order_cost(?ORDER_TYPE_TRAIN),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = async_request(fun lib_country_request:request_open_train_order/1),

	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_TRAIN)),

	Rewards = lib_country_setting:order_reward(?ORDER_TYPE_TRAIN),
	lib_player_pack:auto_insert(Rewards, ?INSERT_SERIAL(?ADD_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_TRAIN)),

	Respond = #'Proto50128010'{},
	lib_send:respond_to_client(Respond)
.

request_open_build_order() ->
	Cost = lib_country_setting:order_cost(?ORDER_TYPE_BUILD),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = async_request(fun lib_country_request:request_open_build_order/1),

	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_BUILD)),

	Rewards = lib_country_setting:order_reward(?ORDER_TYPE_BUILD),
	lib_player_pack:auto_insert(Rewards, ?INSERT_SERIAL(?ADD_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_BUILD)),

	Respond = #'Proto50128011'{},
	lib_send:respond_to_client(Respond)
.

request_open_prohibit_order(Msg) ->
	CityId = Msg#'Proto10128012'.city_id,

	Cost = lib_country_setting:order_cost(?ORDER_TYPE_PROHIBIT),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = async_request(fun lib_country_request:request_open_prohibit_order/2, [CityId]),

	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_PROHIBIT)),

	Rewards = lib_country_setting:order_reward(?ORDER_TYPE_PROHIBIT),
	lib_player_pack:auto_insert(Rewards, ?INSERT_SERIAL(?ADD_COUNTRY_OPEN_ORDER, ?ORDER_TYPE_PROHIBIT)),

	Respond = #'Proto50128009'{
		city_id = CityId
	},
	lib_send:respond_to_client(Respond)
.

request_city_master_info() ->
	async_request(fun lib_country_request:request_city_master_info/1)
.

request_appoint_city_master(Msg) ->
	#'Proto10128014'{
		player_id = TagPlayerId,
		city_id = TagCityId
	} = Msg,

	async_request(fun lib_country_request:request_appoint_city_master/3, [TagPlayerId, TagCityId])
.

request_open_master_order(_Msg) ->
	CityId = #'Proto10128015'.city_id,

	?JUDGE_RETURN(CityId > 0, ?ERROR_CLIENT_OPERATOR),

	Cost = lib_country_setting:city_master_order_cost(),
	Ret = lib_player_pack:validate_remove(Cost),
	?PACK_IS_SUCCESS(Ret),

	Ret2 = async_request(fun lib_country_request:request_open_master_order/2, [CityId]),

	?JUDGE_RETURN(Ret2, Ret2),

	lib_player_pack:auto_remove(Cost, ?REMOVE_SERIAL(?USE_COUNTRY_OPEN_MASTER, CityId)),

	Rewards = lib_country_setting:city_master_order_reward(),
	lib_player_pack:auto_insert(Rewards, ?INSERT_SERIAL(?ADD_COUNTRY_OPEN_MASTER_ORDER, CityId)),

	Respond = #'Proto50128015'{
		city_id = CityId
	},
	lib_send:respond_to_client(Respond)
.

request_order_list_info() ->
	async_request(fun lib_country_request:request_order_list_info/2, [lib_player:player_country()])
.

request_rank_list(Msg) ->
	#'Proto10128021'{
		type = RankType,
		page = Page
	} = Msg,
	?JUDGE_RETURN(Page > 0, ?ERROR_INVALID_INDEX),
	?JUDGE_RETURN(lists:member(RankType, ?RANK_TYPE_LIST), ?ERROR_INVALID_PARAM),

	mod_server:async_apply(mod_country_rank:get_pid(lib_player:player_country(), RankType), fun lib_player_country_rank:request_rank_list/3, [lib_player:player_id(), RankType, Page])
.