%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 1月 2021 12:03
%%%-------------------------------------------------------------------
-module(lib_player_rank0).
-author("13661").

-include("common.hrl").
-include("rank0.hrl").
-include("ProtoClient_10109.hrl").


%% API
-export([
	request_rank_list/1
]).

request_rank_list(Msg) ->
	CountryId = Msg#'Proto10109002'.country,
	RankType = Msg#'Proto10109002'.rank_type,
	Key = case CountryId of 0 -> ?CONDITION_ID_119;_ -> ?CONDITION_ID_120 end,
	?JUDGE_RETURN(lib_function_open:function_is_open(Key), ?INFO("功能未开启")),
	mod_server:async_apply(mod_rank0:get_pid(CountryId, RankType), fun lib_rank0:request_rank_list/1, [lib_player:player_id()]).

