%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 11:17
%%%-------------------------------------------------------------------
-module(lib_arena_request).
-author("13661").

-include("common.hrl").
-include("arena.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10137.hrl").

%% API
-compile(export_all).

-define(PAGE_MAX_NUMBER, 10).
-define(JUDGE_PLAYER_RESPOND(Cond, BODY), case Cond of true -> skip; false -> throw({respond, BODY, ?LINE}) end).
-define(JUDGE_PLAYER_ERROR(Cond, CODE), case Cond of true -> skip; false -> throw({respond, CODE, ?LINE}) end).

no_zero_random(L, R) ->
	case (L < 0 andalso R > 0) orelse (L > 0 andalso R < 0) of
		false -> lib_common:random(L, R);
		true ->
			AbsL = abs(L),
			AbsR = abs(R),
			I = lib_common:random(1, AbsL + AbsR),
			Max = ?IIF(I > AbsL, R, L),
			Min = ?IIF(Max < 0, -1, 1),
			lib_common:random(Min, Max)
	end
.

random_match(Rank) ->
	IndexList = tb_arena_match:get_list(),

	ArenaMaxNumber = lib_arena_setting:get_const_int(rank_number),

	TrueRank =
	case Rank of
		0 -> ArenaMaxNumber + 1;
		_ -> Rank
	end,

	ConfIndex =
	lib_common:list_foldl(fun(Index, List) ->
		Conf = tb_arena_match:get(Index),
		Min = maps:get(min, Conf),
		Max = maps:get(max, Conf),
		?JUDGE_CONTINUE(Min =< TrueRank andalso TrueRank =< Max, List),
		?BREAK(Index)
    end, 0, IndexList),

	Conf = tb_arena_match:get(ConfIndex),
	case Conf of
		false -> [];
		_ ->
			ConfList = maps:get(list, Conf, []),

			lists:foldr(fun([L, R], List1) ->
				Rand = no_zero_random(L, R),
				ResRank = TrueRank + Rand,
				ResId = lib_arena_api:rank_player_id(ResRank),
				case ResId of
					0 ->
						?INFO("arena refresh error: ~p, [~p, ~p] ~p:~p", [Rank, L, R, ResRank, ResId]), 
						List1;
					_ -> [{ResId, ResRank} | List1]
				end
            end, [], ConfList)
	end
.

refresh_challenge_opponent(PlayerId) ->
	Player = lib_arena_api:player_info(PlayerId),
	MatchList = random_match(Player#arena_player.rank),
	lib_arena_api:update_player(Player#arena_player{challenge_list = MatchList}),
	MatchList
.

player_to_proto(Player) when is_record(Player, arena_player) ->
	#'ProtoArenaPlayer'{
		id = Player#arena_player.id,
		is_robot = Player#arena_player.is_robot,
		show = lib_common:player_show_to_proto(Player#arena_player.show),
		hero_list = [lib_hero_api:hero_base_to_proto(HeroBase) || HeroBase <- Player#arena_player.hero_list],
		force = Player#arena_player.force,
		rank = Player#arena_player.rank
	}
.

record_to_proto(Record) when is_record(Record, arena_record) ->
	#'ProtoArenaRecord'{
		first_show = lib_common:player_show_to_proto(Record#arena_record.first_show),
		second_show = lib_common:player_show_to_proto(Record#arena_record.second_show),
		first_hero_list = [lib_hero_api:hero_base_to_proto(HeroBase) || HeroBase <- Record#arena_record.first_hero_list],
		second_hero_list = [lib_hero_api:hero_base_to_proto(HeroBase) || HeroBase <- Record#arena_record.second_hero_list],
		result_list = Record#arena_record.result_list,
		first_rank = Record#arena_record.first_rank,
		second_rank = Record#arena_record.second_rank,
		win_type = Record#arena_record.win_type,
		tick = Record#arena_record.tick
	}
.

request_info(PlayerId, PlayerShow, BuyTime, UsedTimes) ->
	case lib_arena_api:is_have_player(PlayerId) of
		false ->
			Player = #arena_player{
				id = PlayerId,
				show = PlayerShow
			},
			lib_arena_api:register_player(Player);
		true ->
			Player = lib_arena_api:player_info(PlayerId),
			lib_arena_api:update_player(Player#arena_player{show = PlayerShow})
	end,

	ChallengeList = refresh_challenge_opponent(PlayerId),

	ProtoChallengeList =
	lists:foldr(fun({Id, _Rank}, List) ->
		Player2 = lib_arena_api:player_info(Id),
		[player_to_proto(Player2) | List]
    end, [], ChallengeList),

	CountryTopList = lib_arena_api:country_top_list(),
	ProtoCountryTopList = [player_to_proto(lib_arena_api:player_info(Id)) || Id <- CountryTopList],

	Respond = #'Proto50137001'{
		country_top = ProtoCountryTopList,
		challenge_list = ProtoChallengeList,
		self_rank = lib_arena_api:player_rank(PlayerId),
		buy_times = BuyTime,
		used_times = UsedTimes,
		self = player_to_proto(lib_arena_api:player_info(PlayerId))
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

-define(CHALLENGE_TYPE_PLAY, 1).
-define(CHALLENGE_TYPE_SKIP, 2).
request_challenge(PlayerId, PlayerShow, Type, HeroList, Index, TagId, TagRank) ->
	try
		?JUDGE_RETURN(lib_arena_api:is_have_player(PlayerId), ?ERROR_INVALID_INDEX),
		Player = lib_arena_api:player_info(PlayerId),
		Rank = Player#arena_player.rank,
		ChallengeList = Player#arena_player.challenge_list,

		?JUDGE_RETURN(Type =:= ?CHALLENGE_TYPE_PLAY orelse Rank > 0 andalso Rank < TagRank, ?ERROR_CLIENT_OPERATOR),
		?JUDGE_RETURN(Index >= 1 andalso Index =< length(ChallengeList), ?ERROR_INVALID_INDEX),

		{ChallengeId, ChallengeRank} = lists:nth(Index, ChallengeList),
		?JUDGE_RETURN(TagRank =:= ChallengeRank andalso TagId =:= ChallengeId, ?ERROR_CLIENT_OPERATOR),

		TagPlayer = lib_arena_api:player_info(TagId),
		?JUDGE_RETURN(TagPlayer#arena_player.rank =:= ChallengeRank, ?ERROR_ARENA_RANK_CHANGE),

		Force = lib_hero_api:calc_total_force(HeroList),
		lib_arena_api:update_player(Player#arena_player{show = PlayerShow, force = Force, hero_list = HeroList}),

		Result = lib_combat_queue_api:sync_call_fight(#req_combat_queue{
			type = ?CALL_FIGHT_TYPE_ARENA,
			interval_type = ?INTERVAL_TYPE0,
			l_fighters = lib_combat_queue_api:hero_list_fighters(Player#arena_player.show, HeroList),
			r_fighters = lib_combat_queue_api:hero_list_fighters(TagPlayer#arena_player.show, TagPlayer#arena_player.hero_list),
			fight_type = ?FIGHT_TYPE2,
			params = {Type, {PlayerId, HeroList}, {TagId, TagPlayer#arena_player.hero_list}}
		}),
		L_Length = length(HeroList),
		R_Length = length(TagPlayer#arena_player.hero_list),
		Ret = lib_arena:process_fight_result(Result,L_Length,R_Length),
		{true, Ret}
	catch
		throw: {error, ErrCode} -> {false, ErrCode}
	end
.

request_refresh(PlayerId) ->
	?JUDGE_PLAYER_ERROR(lib_arena_api:is_have_player(PlayerId), ?ERROR_CLIENT_OPERATOR),

	ChallengeList = refresh_challenge_opponent(PlayerId),
	ProtoChallengeList =
	lists:foldr(fun({Id, _Rank}, List) ->
		Player2 = lib_arena_api:player_info(Id),
		[player_to_proto(Player2) | List]
    end, [], ChallengeList),

	Respond = #'Proto50137004'{
		player_list = ProtoChallengeList
	},
	lib_send:respond_to_player(PlayerId, Respond)
.

request_history(PlayerId) ->
	?JUDGE_PLAYER_ERROR(lib_arena_api:is_have_player(PlayerId), ?ERROR_CLIENT_OPERATOR),

	Player = lib_arena_api:player_info(PlayerId),
	HistoryList = Player#arena_player.history_list,

	ProtoRecordList = [record_to_proto(Record) || Record <- HistoryList],

	Respond = #'Proto50137005'{
		record_list = ProtoRecordList
	},
	?INFO("Respond ~p",[Respond]),
	lib_send:respond_to_player(PlayerId, Respond)
.

request_rank_list(PlayerId, Page) ->
	?JUDGE_PLAYER_ERROR(lib_arena_api:is_have_player(PlayerId), ?ERROR_CLIENT_OPERATOR),

	Ary = lib_arena_api:rank_list(),
	RankList = array:to_list(Ary),
	RankNumber = array:size(Ary),

	PageMaxNumber = lib_arena_setting:get_const_int(rank_page_number, ?PAGE_MAX_NUMBER),

	MaxPage = lib_common:ceil(RankNumber / PageMaxNumber),

	RankList2 =
	case 0 < Page andalso Page =< MaxPage of
		false -> [];
		true ->
			StartIndex = (Page - 1) * PageMaxNumber + 1,
			lists:sublist(RankList, StartIndex, PageMaxNumber)
	end,

	ProtoRankList = [player_to_proto(lib_arena_api:player_info(RankerId)) || RankerId <- RankList2],
	Respond = #'Proto50137006'{
		page = Page,
		max_page = MaxPage,
		rank_list = ProtoRankList,
		self_rank = lib_arena_api:player_rank(PlayerId)
	},
	lib_send:respond_to_player(PlayerId, Respond)
.