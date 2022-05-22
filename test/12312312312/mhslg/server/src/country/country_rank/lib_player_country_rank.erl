%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 1月 2021 12:03
%%%-------------------------------------------------------------------
-module(lib_player_country_rank).
-author("13661").

-include("common.hrl").
-include("country_rank.hrl").
-include("ProtoClient_10128.hrl").

-define(PAGE_MAX_NUMBER, 10).


%% API
-export([
	request_rank_list/3
]).

ranker_to_proto(Ranker) ->
	#'ProtoCountryRanker'{
		id = Ranker#ranker.id,
		show = lib_common:player_show_to_proto(Ranker#ranker.show),
		rank_type = Ranker#ranker.rank_type,
		rank = Ranker#ranker.rank,
		value1 = Ranker#ranker.value1,
		value2 = Ranker#ranker.value2,
		is_online = Ranker#ranker.is_online,
		sign_in_tick = Ranker#ranker.sign_in_tick,
		sign_out_tick = Ranker#ranker.sign_out_tick
	}
.

request_rank_list(PlayerId, RankType, Page) ->
	RankList = lib_country_rank:rank_list(),
	RankNumber = length(RankList),

	MaxPage = lib_common:ceil(RankNumber / ?PAGE_MAX_NUMBER),

	RankList2 =
	case 0 < Page andalso Page =< MaxPage of
		false -> [];
		true ->
			StartIndex = (Page - 1) * ?PAGE_MAX_NUMBER + 1,
			lists:sublist(RankList, StartIndex, ?PAGE_MAX_NUMBER)
	end,

	ProtoRankList = [ranker_to_proto(Ranker) || Ranker <- RankList2],

	SelfRanker =
	case lib_country_rank:is_have_ranker(PlayerId) of
		false -> undefined;
		true -> ranker_to_proto(lib_country_rank:ranker_info(PlayerId))
	end,

	lib_map_api:async(fun mod_map:player_request/4, [?MSG_CLIENT_COUNTRY_RANK_LIST, PlayerId, fun lib_country_request:request_rank_info/6, [RankType, Page, MaxPage, ProtoRankList, SelfRanker]])
.

