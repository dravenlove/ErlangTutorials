%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_rank_base
%%% Created on : 2020/8/27 0027 16:04
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_rank_base).
-author("glendy").
-include("common.hrl").
-include("rank.hrl").
-include("ProtoClient_10109.hrl").

%% API
-export([
	fresh_rank_list/1,
	save_rank_list/1,
	async_fetch_rank_list/3,
	async_refresh_rank_player_level/2,
	async_refresh_rank_player_force/2
]).

-export([
	serialize_rank_list/2,
	serialize_ranker/1
]).

%% 刷新排行榜
fresh_rank_list(State) ->
	#rank_state{
		fresh_flag = FreshFlag,
		rank_type = RankType,
		rank_map = RankMap
	} = State,
	try
		?JUDGE_RETURN(FreshFlag =:= 1, -1),
		RankList = maps:fold(
			fun(_Id, Ranker, AccRankList0) ->
				[Ranker | AccRankList0]
			end, [], RankMap),
		SortRankList = lists:sort(fun ranker_sort/2, RankList),
		#{
			max_amount:=MaxAmount
		} = tb_rank:get(RankType),
		{NewRankList, NewRankMap} = filter_rank_list_by_max_amount(SortRankList, 1, MaxAmount),
		State#rank_state{
			rank_list = NewRankList,
			rank_map = NewRankMap,
			fresh_flag = 0,
			save_flag = 1
		}
	catch
	    throw:{error, _ErrCode} -> State
	end.

save_rank_list(State) ->
	#rank_state{
		save_flag = SaveFlag,
		rank_type = RankType,
		rank_list = RankList
	} = State,
	try
		?JUDGE_RETURN(SaveFlag =:= 1, -1),
		db_rank:save_rank_list(RankType, RankList),
		State#rank_state{
			save_flag = 0
		}
	catch
	    throw:{error, _ErrCode} -> State
	end.

async_fetch_rank_list(State, PlayerId, SelfRanker0) ->
	#rank_state{
		rank_type = RankType,
		rank_list = RankList,
		rank_map = RankMap
	} = State,
	#{show_amount:=ShowAmount} = tb_rank:get(RankType),
	SelfRanker = maps:get(SelfRanker0#ranker.rank_key, RankMap, SelfRanker0),
	ProtoRankList = serialize_rank_list(RankList, ShowAmount),
	Respond = #'Proto50109001'{
		rank_type = RankType,
		rank_list = ProtoRankList,
		self_rank = serialize_ranker(SelfRanker)
	},
	?DEBUG("rank list: ~p ~w", [PlayerId, Respond]),
	PlayerPid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(PlayerPid, Respond).

async_refresh_rank_player_level(State, Ranker) ->
	NewState = refresh_rank_map(State, Ranker),
	{ok, NewState}.

async_refresh_rank_player_force(State, Ranker) ->
	NewState = refresh_rank_map(State, Ranker),
	{ok, NewState}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
serialize_rank_list(RankList, ShowAmount) ->
	serialize_rank_list([], RankList, 1, ShowAmount).

serialize_rank_list(ProtoRankList, [], _CurIndex, _ShowAmount) ->
	lists:reverse(ProtoRankList);
serialize_rank_list(ProtoRankList, _RankList, CurIndex, ShowAmount) when CurIndex >= ShowAmount ->
	lists:reverse(ProtoRankList);
serialize_rank_list(ProtoRankList, [Ranker | T], CurIndex, ShowAmount) ->
	ProtoRank = serialize_ranker(Ranker),
	serialize_rank_list([ProtoRank | ProtoRankList], T, CurIndex + 1, ShowAmount).

serialize_ranker(Ranker) ->
	#'ProtoRank'{
		rank = Ranker#ranker.rank,
		value = Ranker#ranker.rank_value,
		player_show = Ranker#ranker.player_show,
		rank_tick = Ranker#ranker.rank_tick
	}.

%% 排序函数
ranker_sort(LeftRanker, RightRanker) ->
	ranker_sort(LeftRanker#ranker.rank_type, LeftRanker, RightRanker).

%% 只有rank_value和rank_tick参与排序的接口
ranker_sort(RankType, LeftRanker, RightRanker)
  when RankType =:= ?RANK_PLAYER_LEVEL
  orelse RankType =:= ?RANK_PLAYER_FORCE ->
	ranker_sort_by_greater_rank_value(LeftRanker, RightRanker);
ranker_sort(RankType, _LeftRanker, _RightRanker) ->
	?WARNING("no rank_typr for ranker_sort: ~p", [RankType]),
	throw({error, no_rank_type}).

filter_rank_list_by_max_amount(SortRankList, Rank, MaxRank) ->
	filter_rank_list_by_max_amount([], #{}, SortRankList, Rank, MaxRank).

filter_rank_list_by_max_amount(RankList, RankMap, [], _Rank, _MaxRank) ->
	{lists:reverse(RankList), RankMap};
filter_rank_list_by_max_amount(RankList, RankMap, _SortRankList, Rank, MaxRank) when Rank > MaxRank ->
	{lists:reverse(RankList), RankMap};
filter_rank_list_by_max_amount(RankList, RankMap, [Ranker | T], Rank, MaxRank) ->
	#ranker{
		rank_key = RankKey,
		rank = OrgRank,
		last_rank = LastRank0
	} = Ranker,
	LastRank =
		if
			OrgRank =/= Rank -> OrgRank;
			true -> LastRank0
		end,
	NewRanker = Ranker#ranker{
		rank = Rank,
		last_rank = LastRank
	},
	NewRankList = [NewRanker | RankList],
	NewRankMap = maps:put(RankKey, NewRanker, RankMap),
 	filter_rank_list_by_max_amount(NewRankList, NewRankMap, T, Rank + 1, MaxRank).

%% 按rank_value由大到小排序
ranker_sort_by_greater_rank_value(LeftRanker, RightRanker) ->
	#ranker{rank_value = LeftValue, rank_tick = LeftTick} = LeftRanker,
	#ranker{rank_value = RightValue, rank_tick = RightTick} = RightRanker,
	try
		?JUDGE_RETURN(LeftValue =:= RightValue, LeftValue > RightValue),
		LeftTick < RightTick
	catch
		throw:{error, Flag} -> Flag
	end.

refresh_rank_map(State, Ranker) ->
	#rank_state{
		rank_map = RankMap
	} = State,
	RankKey = Ranker#ranker.rank_key,
	NewRanker =
		case maps:get(RankKey, RankMap, undefined) of
			undefined ->
				Ranker#ranker{
					rank = 0,
					rank_tick = lib_timer:unixtime()
				};
			OrgRanker ->
				case ranker_sort(OrgRanker, Ranker) =:= ranker_sort(Ranker, OrgRanker) of
					true ->
						Ranker#ranker{
							rank = OrgRanker#ranker.rank,
							rank_tick = OrgRanker#ranker.rank_tick
						};
					_ ->
						Ranker#ranker{
							rank = OrgRanker#ranker.rank,
							rank_tick = lib_timer:unixtime()
						}
				end
		end,
	NewRankMap = maps:put(RankKey, NewRanker, RankMap),
	State#rank_state{
		rank_map = NewRankMap,
		fresh_flag = 1
	}.


