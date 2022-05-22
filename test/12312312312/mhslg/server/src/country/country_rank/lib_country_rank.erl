%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 12月 2020 15:31
%%%-------------------------------------------------------------------
-module(lib_country_rank).
-author("13661").

-include("common.hrl").
-include("country.hrl").
-include("country_rank.hrl").

%% API
-export([
	rank_type/0,
	country_id/0,
	rank_list/0,
	update_ranker_map/1,
	update_ranker/1,
	ranker_info/1,
	is_have_ranker/1,
	ranker_rank/1,

	refresh_rank/0
]).
-export([
	process_player_show_update/2
]).

get_rank() ->
	mod_country_rank:get_rank()
.

update_rank(Rank) when is_record(Rank, rank) ->
	mod_country_rank:put_rank(Rank)
.

rank_type() ->
	Rank = get_rank(),
	Rank#rank.type
.

country_id() ->
	Rank = get_rank(),
	Rank#rank.country_id
.

rank_list() ->
	Rank = get_rank(),
	Rank#rank.rank_list
.

set_rank_list(RankList) when is_list(RankList) ->
	Rank = get_rank(),
	update_rank(Rank#rank{rank_list = RankList})
.

ranker_map() ->
	Rank = get_rank(),
	Rank#rank.ranker_map
.

update_ranker_map(RankerMap) when is_map(RankerMap) ->
	Rank = get_rank(),
	update_rank(Rank#rank{ranker_map = RankerMap})
.

is_have_ranker(PlayerId) ->
	RankerMap = ranker_map(),
	maps:is_key(PlayerId, RankerMap)
.

ranker_info(PlayerId) ->
	RankerMap = ranker_map(),
	maps:get(PlayerId, RankerMap)
.

update_ranker(Ranker) when is_record(Ranker, ranker) ->
	RankerMap = ranker_map(),
	NewMap = maps:put(Ranker#ranker.id, Ranker, RankerMap),
	update_ranker_map(NewMap)
.

ranker_rank(PlayerId) ->
	case is_have_ranker(PlayerId) of
		false -> 0;
		true ->
			Ranker = ranker_info(PlayerId),
			Ranker#ranker.rank
	end
.

refresh_rank() ->
	RankType = rank_type(),
	RankerMap = ranker_map(),
	RankList0 = lists:filter(fun(Ranker) -> filter(RankType, Ranker) end, maps:values(RankerMap)),
	RankerList1 = lists:sort(fun(L, R) -> compare(RankType, L, R) end, RankList0),

	RankerList2 = lists:sublist(RankerList1, ?RANK_MAX_NUMBER),
	{_, RankerList3} =
	lists:foldl(fun(Ranker, {Rank, List}) ->
		{Rank + 1, [Ranker#ranker{rank = Rank} | List]}
	end, {1, []}, RankerList2),

	RankerList4 = lists:reverse(RankerList3),

	NewRankerMap =
	lists:foldl(fun(Ranker, Map) ->
		maps:put(Ranker#ranker.id, Ranker, Map)
	end, maps:new(), RankerList4),

	update_ranker_map(NewRankerMap),
	set_rank_list(RankerList4),

	process_rank_refresh()
.

%%compare(?RANK_TYPE_LEVEL, L, R) ->
%%	try
%%		?JUDGE_RETURN(L#ranker.value1 =:= R#ranker.value1, L#ranker.value1 > R#ranker.value1),
%%		?JUDGE_RETURN(L#ranker.is_online =:= R#ranker.is_online, L#ranker.is_online),
%%
%%		case L#ranker.is_online of
%%			true -> L#ranker.sign_in_tick < R#ranker.sign_in_tick;
%%			false -> L#ranker.sign_out_tick > R#ranker.sign_out_tick
%%		end
%%	catch
%%	    throw: {error, Flag} -> Flag
%%	end
%%;
filter(_, Ranker) ->
	Ranker#ranker.value1 > 0
.

compare(_, L, R) ->
	try
		?JUDGE_RETURN(L#ranker.value1 =:= R#ranker.value1, L#ranker.value1 > R#ranker.value1),
		?JUDGE_RETURN(L#ranker.value2 =:= R#ranker.value2, L#ranker.value2 > R#ranker.value2),
		L#ranker.update_tick < R#ranker.update_tick
	catch
	    throw: {error, Flag} -> Flag
	end
.

process_rank_refresh() ->
	skip
.

process_player_show_update(_PlayerId, _Show) ->
%%	case is_have_ranker(PlayerId) of
%%		false -> skip;
%%		true ->
%%			Ranker = ranker_info(PlayerId),
%%			update_ranker(Ranker#ranker{show = Show})
%%	end
	skip
.