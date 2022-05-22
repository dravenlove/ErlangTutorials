%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 12月 2020 16:22
%%%-------------------------------------------------------------------
-module(lib_country_request).
-author("13661").

-include("common.hrl").
-include("country.hrl").
-include("country_rank.hrl").
-include("map.hrl").
-include("ProtoClient_10128.hrl").

-define(JUDGE_PLAYER_RESPOND(Cond, BODY), case Cond of true -> skip; false -> throw({respond, BODY, ?LINE}) end).
-define(JUDGE_PLAYER_ERROR(Cond, CODE), case Cond of true -> skip; false -> throw({respond, CODE, ?LINE}) end).

-define(IMPEACH_RANK, 3).
-define(VOTES_MAX_NUMBER, 10).
-define(PAGE_MAX_NUMBER, 10).

%% API
-compile(export_all).

player_to_proto(Player) when is_record(Player, country_player) ->
	#'ProtoCountryPlayer'{
		id = Player#country_player.id,
		show = lib_common:player_show_to_proto(Player#country_player.show),
		country_id = Player#country_player.country_id,
		pos_name_id = Player#country_player.pos_name_id,
		city_id = Player#country_player.city_id,
		can_appoint_master = Player#country_player.can_appoint_master,
		hero = lib_hero_api:hero_base_to_proto(Player#country_player.hero)
	}
.

request_pos_info(PlayerId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Country = lib_country_api:country_info(CountryId),
	PosMap = Country#country.pos_map,

	ProtoPlayerList =
	maps:fold(fun(_Pos, ID, List) ->
		case ID of
			0 -> List;
			_ ->
				Player = lib_country_api:player_info(ID),
				[player_to_proto(Player) | List]
		end
	end, [], PosMap),

	ImpeachInfo = lib_country_api:impeach_info(CountryId),

	CityIdList = lib_map_api:country_city(CountryId),
	ForceRank = mod_server:sync_apply(mod_country_rank:get_pid(CountryId, ?RANK_TYPE_FORCE), fun lib_country_rank:ranker_rank/1, [PlayerId]),

	Respond = #'Proto50128001'{
		player_list = ProtoPlayerList,
		is_in_impeach = lib_country_api:is_in_impeach(CountryId),
		king_change_tick = lib_country_api:get_king_change_tick(CountryId),
		city_number = length(CityIdList),
		can_impeach = ForceRank >= ?IMPEACH_RANK,
		can_impeach_votes = lists:member(PlayerId, ImpeachInfo#impeach.rank_list),
		cur_stage = lib_country_api:country_cur_stage(CountryId),
		max_stage = lib_country_api:country_max_stage(CountryId)
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_notice(PlayerId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Country = lib_country_api:country_info(CountryId),

	Respond = #'Proto50128002'{
		notice = Country#country.notice
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_modify_notice(PlayerId, Notice) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Pos = lib_country_api:player_pos(PlayerId),
	Country = lib_country_api:country_info(CountryId),
	Ret = lib_country_api:validate_authority(Pos, ?AUTHORITY_MODIFY_NOTICE),
	?JUDGE_PLAYER_ERROR(Ret, ?ERROR_CLIENT_OPERATOR),
	lib_country_api:update_country(Country#country{
		notice = Notice,
		notice_uuid = lib_country_api:generate_uuid()
	}),

	Respond = #'Proto50128003'{
		notice = Notice
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_appoint_pos(PlayerId, TagPlayerId, TagPos) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Pos = lib_country_api:player_pos(PlayerId),

	?JUDGE_PLAYER_ERROR(lib_country_api:is_have_player(TagPlayerId), ?ERROR_CLIENT_OPERATOR),

	OldPos = lib_country_api:player_pos(TagPlayerId),
	?JUDGE_PLAYER_ERROR(OldPos =/= TagPos, ?ERROR_CLIENT_OPERATOR),

	Conf = tb_country_pos:get(TagPos),
	?JUDGE_PLAYER_ERROR(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	CondStage = maps:get(open_cond, Conf, 0),
	CurStage = lib_country_api:country_max_stage(CountryId),
	?JUDGE_PLAYER_ERROR(CurStage >= CondStage, ?ERROR_CLIENT_OPERATOR),

	?JUDGE_PLAYER_ERROR(lib_country_api:validate_appoint_pos(Pos, TagPos), ?ERROR_CLIENT_OPERATOR),

	lib_country_api:appoint_pos(CountryId, TagPos, TagPlayerId),

	Respond = #'Proto50128004'{
		player_id = TagPlayerId,
		pos = TagPos
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_impeach_info(PlayerId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	ImpeachInfo = lib_country_api:impeach_info(CountryId),
	#impeach{
		is_in_impeach = IsInImpeach,
		tag_impeach_id = TagImpeachId,
		req_impeach_id = ReqImpeachId,
		req_impeach_tick = ReqImpeachTick,
		a_votes_number = ANumber,
		b_votes_number = BNumber,
		votes_list = VotesList
	} = ImpeachInfo,

	ProtoPlayerA =
	case ReqImpeachId of
		0 -> undefined;
		_ ->
			PlayerA = lib_country_api:player_info(ReqImpeachId),
			lib_common:player_show_to_proto(PlayerA#country_player.show)
	end,

	ProtoPlayerB =
	case TagImpeachId of
		0 -> undefined;
		_ ->
			PlayerB = lib_country_api:player_info(TagImpeachId),
			lib_common:player_show_to_proto(PlayerB#country_player.show)
	end,

	Respond = #'Proto50128005'{
		player_a = ProtoPlayerA,
		player_b = ProtoPlayerB,
		a_number = ANumber,
		b_number = BNumber,
		is_in_impeach =  IsInImpeach,
		start_tick = ReqImpeachTick,
		is_votes = lists:member(PlayerId, VotesList)
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_impeach(PlayerId, ReqImpeachId) ->
	try
		CountryId = lib_country_api:player_country_id(PlayerId),
		KingId = lib_country_api:country_king_id(CountryId),

		?JUDGE_RETURN(KingId =/= 0, ?ERROR_CLIENT_OPERATOR),
		?JUDGE_RETURN(KingId =:= ReqImpeachId, ?ERROR_CLIENT_OPERATOR),
		?JUDGE_RETURN(PlayerId =/= KingId, ?ERROR_CLIENT_OPERATOR),
		KingChangeTick = lib_country_api:get_king_change_tick(CountryId),
		?JUDGE_RETURN(KingChangeTick + lib_country_setting:king_protect_time() < lib_timer:unixtime(), ?ERROR_CLIENT_OPERATOR),

		Impeach = lib_country_api:impeach_info(CountryId),

		?JUDGE_RETURN(not Impeach#impeach.is_in_impeach, ?ERROR_CLIENT_OPERATOR),
		ForceRank = mod_server:sync_apply(mod_country_rank:get_pid(CountryId, ?RANK_TYPE_FORCE), fun lib_country_rank:ranker_rank/1, [PlayerId]),
		?JUDGE_RETURN(ForceRank >= ?IMPEACH_RANK, ?ERROR_CLIENT_OPERATOR),

		RankList = mod_server:sync_apply(mod_country_rank:get_pid(CountryId, ?RANK_TYPE_FORCE), fun lib_country_rank:rank_list/0, []),
		RankIdList = [Ranker#ranker.id || Ranker <- lists:sublist(RankList, ?VOTES_MAX_NUMBER)],

		UUID = lib_country_api:generate_uuid(),
		lib_country_api:update_impeach(CountryId, #impeach{
			uuid = UUID,
			is_in_impeach = true,
			tag_impeach_id = KingId,
			req_impeach_id = PlayerId,
			req_impeach_tick = lib_timer:unixtime(),
			rank_list = RankIdList
		}),

		lib_country:start_timer(lib_country_setting:impeach_duration() * 1000, fun lib_country:process_impeach_timeout/2, [CountryId, UUID]),
		true
	catch
	    throw: {error, ErrCode} -> ErrCode
	end
.

request_impeach_votes(PlayerId, TagPlayerId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Impeach = lib_country_api:impeach_info(CountryId),

	#impeach{
		is_in_impeach = IsInImpeach,
		req_impeach_tick = ImpeachStartTick,
		req_impeach_id = ReqImpeachId,
		tag_impeach_id = TagImpeachId,
		a_votes_number = ANumber,
		b_votes_number = BNumber,
		rank_list = RankList,
		votes_list = VotesList
	} = Impeach,

	?JUDGE_PLAYER_ERROR(IsInImpeach, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_PLAYER_ERROR(TagPlayerId =:= ReqImpeachId orelse TagPlayerId =:= TagImpeachId, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_PLAYER_ERROR(ImpeachStartTick + lib_country_setting:impeach_duration() > lib_timer:unixtime(), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_PLAYER_ERROR(lists:member(PlayerId, RankList), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_PLAYER_ERROR(not lists:member(PlayerId, VotesList), ?ERROR_CLIENT_OPERATOR),

	case TagPlayerId of
		ReqImpeachId -> lib_country_api:update_impeach(CountryId, Impeach#impeach{a_votes_number = ANumber + 1, votes_list = [PlayerId | VotesList]});
		TagImpeachId -> lib_country_api:update_impeach(CountryId, Impeach#impeach{b_votes_number = BNumber + 1, votes_list = [PlayerId | VotesList]})
	end,

	Respond = #'Proto50128007'{
		player_id = TagImpeachId
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_open_siege_order(PlayerId, CityId) ->
	try
		?JUDGE_RETURN(lib_map_api:is_cityId(CityId), ?ERROR_CLIENT_OPERATOR),

		CountryId = lib_country_api:player_country_id(PlayerId),
		?JUDGE_RETURN(lib_map_api:country(CityId) =/= CountryId, ?ERROR_CLIENT_OPERATOR),
		Pos = lib_country_api:player_pos(PlayerId),
		?JUDGE_RETURN(lib_country_api:validate_authority(Pos, ?AUTHORITY_SIEGE_ORDER), ?ERROR_CLIENT_OPERATOR),
		CurTimes = lib_country_api:order_open_times(CountryId, ?ORDER_TYPE_SIEGE),
		MaxTimes = lib_country_setting:order_max_times(?ORDER_TYPE_SIEGE),
		?JUDGE_RETURN(CurTimes < MaxTimes, ?ERROR_CLIENT_OPERATOR),

		lib_country:open_order(CountryId, ?ORDER_TYPE_SIEGE, CityId),
		true
	catch
	    throw: {error, ErrCode} -> ErrCode
	end
.

request_open_defensive_order(PlayerId, CityId) ->
	try
		?JUDGE_RETURN(lib_map_api:is_cityId(CityId), ?ERROR_CLIENT_OPERATOR),

		CountryId = lib_country_api:player_country_id(PlayerId),
		?JUDGE_RETURN(lib_map_api:country(CityId) =:= CountryId, ?ERROR_CLIENT_OPERATOR),

		Pos = lib_country_api:player_pos(PlayerId),
		?JUDGE_RETURN(lib_country_api:validate_authority(Pos, ?AUTHORITY_DEFENSIVE_ORDER), ?ERROR_CLIENT_OPERATOR),
		CurTimes = lib_country_api:order_open_times(CountryId, ?ORDER_TYPE_DEFENSIVE),
		MaxTimes = lib_country_setting:order_max_times(?ORDER_TYPE_DEFENSIVE),
		?JUDGE_RETURN(CurTimes < MaxTimes, ?ERROR_CLIENT_OPERATOR),

		lib_country:open_order(CountryId, ?ORDER_TYPE_DEFENSIVE, CityId),
		true
	catch
		throw: {error, ErrCode} -> ErrCode
	end
.

request_open_train_order(PlayerId) ->
	try
		CountryId = lib_country_api:player_country_id(PlayerId),
		Pos = lib_country_api:player_pos(PlayerId),
		?JUDGE_RETURN(lib_country_api:validate_authority(Pos, ?AUTHORITY_TRAIN_ORDER), ?ERROR_CLIENT_OPERATOR),
		CurTimes = lib_country_api:order_open_times(CountryId, ?ORDER_TYPE_TRAIN),
		MaxTimes = lib_country_setting:order_max_times(?ORDER_TYPE_TRAIN),
		?JUDGE_RETURN(CurTimes < MaxTimes, ?ERROR_CLIENT_OPERATOR),

		lib_country:open_order(CountryId, ?ORDER_TYPE_TRAIN, 0),
		true
	catch
		throw: {error, ErrCode} -> ErrCode
	end
.

request_open_build_order(PlayerId) ->
	try
		CountryId = lib_country_api:player_country_id(PlayerId),
		Pos = lib_country_api:player_pos(PlayerId),
		?JUDGE_RETURN(lib_country_api:validate_authority(Pos, ?AUTHORITY_BUILD_ORDER), ?ERROR_CLIENT_OPERATOR),
		CurTimes = lib_country_api:order_open_times(CountryId, ?ORDER_TYPE_BUILD),
		MaxTimes = lib_country_setting:order_max_times(?ORDER_TYPE_BUILD),
		?JUDGE_RETURN(CurTimes < MaxTimes, ?ERROR_CLIENT_OPERATOR),

		lib_country:open_order(CountryId, ?ORDER_TYPE_BUILD, 0),
		true
	catch
		throw: {error, ErrCode} -> ErrCode
	end
.

request_open_prohibit_order(PlayerId, CityId) ->
	try
		?JUDGE_RETURN(lib_map_api:is_cityId(CityId), ?ERROR_CLIENT_OPERATOR),

		CountryId = lib_country_api:player_country_id(PlayerId),
		?JUDGE_RETURN(lib_map_api:country(CityId) =/= CountryId, ?ERROR_CLIENT_OPERATOR),

		Pos = lib_country_api:player_pos(PlayerId),
		?JUDGE_RETURN(lib_country_api:validate_authority(Pos, ?AUTHORITY_PROHIBIT_ORDER), ?ERROR_CLIENT_OPERATOR),
		CurTimes = lib_country_api:order_open_times(CountryId, ?ORDER_TYPE_PROHIBIT),
		MaxTimes = lib_country_setting:order_max_times(?ORDER_TYPE_PROHIBIT),
		?JUDGE_RETURN(CurTimes < MaxTimes, ?ERROR_CLIENT_OPERATOR),

		lib_country:open_order(CountryId, ?ORDER_TYPE_PROHIBIT, CityId),
		true
	catch
		throw: {error, ErrCode} -> ErrCode
	end
.

request_city_master_info(PlayerId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	CityIdList = lib_map_api:country_city(CountryId),
	ProtoCityList = [
		begin
			City = lib_map_api:city(CityId),
			ProtoShow =
				case City#city.master_id of
					0 -> undefined;
					MasterId ->
						Master = lib_country_api:player_info(MasterId),
						lib_common:player_show_to_proto(Master#country_player.show)
				end,
			TotalBuildVal = lib_city_building_api:city_build_val(CityId),
			BuildValList = maps:values(City#city.building_map),
			NowBuildVal = lists:sum(BuildValList),
			#'ProtoCity'{
				id = CityId,
				build = trunc(NowBuildVal / TotalBuildVal * 100),
				master = ProtoShow
			}
		end || CityId <- CityIdList, lib_map_api:type(CityId) =/= ?CITY_FORTRESS],
	Respond = #'Proto50128013'{
		city_list = ProtoCityList
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_appoint_city_master(PlayerId, TagPlayerId, TagCityId) ->
	CountryId = lib_country_api:player_country_id(PlayerId),
	Pos = lib_country_api:player_pos(PlayerId),
	?JUDGE_PLAYER_ERROR(lib_country_api:validate_authority(Pos, ?AUTHORITY_APPOINT_DM), ?ERROR_CLIENT_OPERATOR),

	?JUDGE_PLAYER_ERROR(lib_map_api:is_cityId(TagCityId), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_PLAYER_ERROR(lib_country_api:is_have_player(TagPlayerId), ?ERROR_CLIENT_OPERATOR),
%%	?JUDGE_PLAYER_ERROR(lib_country_api:player_function_is_open(TagPlayerId), ?ERROR_CLIENT_OPERATOR), %%todo
	?JUDGE_PLAYER_ERROR(lib_country_api:player_can_appoint_master(TagPlayerId), ?ERROR_CLIENT_OPERATOR),
	OldCityId = lib_country_api:player_city(TagPlayerId),
	?JUDGE_PLAYER_ERROR(OldCityId =/= TagCityId, ?ERROR_CLIENT_OPERATOR),

	CityCountryId = lib_map_api:country(TagCityId),
	PlayerCountryId = lib_country_api:player_country_id(TagPlayerId),
	?JUDGE_PLAYER_ERROR(CityCountryId =:= CountryId, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_PLAYER_ERROR(PlayerCountryId =:= CountryId, ?ERROR_CLIENT_OPERATOR),

	lib_country_api:appoint_city_master(TagCityId, TagPlayerId),

	Respond = #'Proto50128014'{
		city_id = TagCityId,
		player_id = TagPlayerId
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_open_master_order(PlayerId, TagCityId) ->
	try
		CityId = lib_country_api:player_city(PlayerId),
		?JUDGE_RETURN(TagCityId =:= CityId, ?ERROR_CLIENT_OPERATOR),

		?JUDGE_RETURN(lib_map_api:is_cityId(CityId), ?ERROR_INVALID_PARAM),
		MasterId = lib_map_api:master_id(CityId),
		?JUDGE_RETURN(MasterId =:= PlayerId, ?ERROR_CLIENT_OPERATOR),

		lib_country:open_master_order(CityId),
		true
	catch
	    throw: {error, ErrCode} -> ErrCode
	end

.

order_to_proto(CountryId, Order) when is_record(Order, military_orders) ->
	#'ProtoCountryOrder'{
		country_id = CountryId,
		type = Order#military_orders.type,
		is_open = Order#military_orders.is_in_open,
		start_tick = Order#military_orders.start_tick,
		city_id = Order#military_orders.city_id
	}
.

request_order_list_info(PlayerId, CountryId) ->
	Country = lib_country_api:country_info(CountryId),
	List = maps:to_list(Country#country.order_map),
	ProtoOrderList = [order_to_proto(CountryId, Order) || {_Type, Order} <- List],

	Respond = #'Proto50128016'{
		order_list = ProtoOrderList
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_rank_info(PlayerId, RankType, Page, MaxPage, RankList, SelfRank) ->
	ProtoRankList =
	[ProtoRanker#'ProtoCountryRanker'{
		pos_name_id = lib_country_api:player_pos_name_id(Id),
		city_id = lib_country_api:player_city(Id)
	} || #'ProtoCountryRanker'{id = Id} = ProtoRanker <- RankList],

	ProtoSelfRank =
	case SelfRank of
		undefined -> undefined;
		_ ->
			SelfRank#'ProtoCountryRanker'{
				pos_name_id = lib_country_api:player_pos_name_id(PlayerId),
				city_id = lib_country_api:player_city(PlayerId),
				can_appoint_master = lib_country_api:player_can_appoint_master(PlayerId)
			}
	end,

	Respond = #'Proto50128021'{
		type = RankType,
		page = Page,
		max_page = MaxPage,
		rank_list = ProtoRankList,
		self_rank = ProtoSelfRank
	},
	lib_send:respond_to_player(PlayerId, Respond)
.