%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_rank
%%% Created on : 2020/8/27 0027 17:37
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_rank).
-author("glendy").
-include("common.hrl").
-include("rank.hrl").

%% API
-export([
	load_player_rank/1,
	save_player_rank/1,
	save_rank_list/2,
	load_rank_list/1,
	bson_to_ranker/1,
	ranker_to_bson/1,
	ranker_key_to_bson/2,
	bson_to_ranker_key/2
]).

load_player_rank(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_RANK, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_rank(Bson);
		_ ->
			#player_rank{id = PlayerId}
	end.

save_player_rank(PlayerRank) ->
	PlayerId = PlayerRank#player_rank.id,
	Bson = player_rank_to_bson(PlayerRank),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_RANK,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

save_rank_list(RankType, RankList) ->
	BsonList = ranker_list_to_bson_list(RankList),
	Bson = #{
		?BSONSET_INT(<<"id">>, RankType),
		?BSONSET_LIST(<<"rank">>, BsonList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBRANK,
		#{?BSONSET_INT(<<"id">>, RankType)},
		#{<<"$set">> => Bson}).

%% 返回: RankMap
load_rank_list(RankType) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBRANK, #{?BSONSET_INT(<<"id">>, RankType)}) of
		Bson = #{} ->
			lists:foldl(
				fun(RankBson, AccRankMap0) ->
					Ranker = bson_to_ranker(RankBson),
					maps:put(Ranker#ranker.rank_key, Ranker, AccRankMap0)
				end, #{}, ?BSON_LIST(Bson, <<"rank">>));
		_ ->
			#{}
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_to_player_rank(Bson) ->
	BsonShow = ?BSON_BSON(Bson, show),
	#player_rank{
		id = ?BSON_INT(Bson, <<"id">>),
		show = lib_common:bson_to_player_show(BsonShow),
		country_id = ?BSON_INT(Bson, country_id),
		max_force_hero = ?BSON_INT(Bson, max_force_hero),
		sign_in_tick = ?BSON_INT(Bson, sign_in_tick),
		sign_out_tick = ?BSON_INT(Bson, sign_out_tick),
		level = ?BSON_INT(Bson, level),
		level_update_tick = ?BSON_INT(Bson, level_update_tick),
		force = ?BSON_INT(Bson, force),
		force_update_tick = ?BSON_INT(Bson, force_update_tick),
		build_val = ?BSON_INT(Bson, build_val),
		build_val_update_tick = ?BSON_INT(Bson, build_val_update_tick),
		kills = ?BSON_INT(Bson, kills),
		kills_update_tick = ?BSON_INT(Bson, kills_update_tick),
		be_kills = ?BSON_INT(Bson, be_kills),
		be_kills_update_tick = ?BSON_INT(Bson, be_kills_update_tick),
		rank0_kills = ?BSON_INT(Bson, rank0_kills),
		rank0_kills_update_tick = ?BSON_INT(Bson, rank0_kills_update_tick),
		rank0_build_val = ?BSON_INT(Bson, rank0_build_val),
		rank0_build_val_update_tick = ?BSON_INT(Bson, rank0_build_val_update_tick)
	}.

player_rank_to_bson(PlayerRank) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerRank#player_rank.id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(PlayerRank#player_rank.show)),
		?BSONSET_INT(country_id, PlayerRank#player_rank.country_id),
		?BSONSET_INT(max_force_hero, PlayerRank#player_rank.max_force_hero),
		?BSONSET_INT(is_online, PlayerRank#player_rank.is_online),
		?BSONSET_INT(sign_in_tick, PlayerRank#player_rank.sign_in_tick),
		?BSONSET_INT(sign_out_tick, PlayerRank#player_rank.sign_out_tick),
		?BSONSET_INT(level, PlayerRank#player_rank.level),
		?BSONSET_INT(level_update_tick, PlayerRank#player_rank.level_update_tick),
		?BSONSET_INT(force, PlayerRank#player_rank.force),
		?BSONSET_INT(force_update_tick, PlayerRank#player_rank.force_update_tick),
		?BSONSET_INT(build_val, PlayerRank#player_rank.build_val),
		?BSONSET_INT(build_val_update_tick, PlayerRank#player_rank.build_val_update_tick),
		?BSONSET_INT(kills, PlayerRank#player_rank.kills),
		?BSONSET_INT(kills_update_tick, PlayerRank#player_rank.kills_update_tick),
		?BSONSET_INT(be_kills, PlayerRank#player_rank.be_kills),
		?BSONSET_INT(be_kills_update_tick, PlayerRank#player_rank.be_kills_update_tick),
		?BSONSET_INT(rank0_kills, PlayerRank#player_rank.rank0_kills),
		?BSONSET_INT(rank0_kills_update_tick, PlayerRank#player_rank.rank0_kills_update_tick),
		?BSONSET_INT(rank0_build_val, PlayerRank#player_rank.rank0_build_val),
		?BSONSET_INT(rank0_build_val_update_tick, PlayerRank#player_rank.rank0_build_val_update_tick)
	}.

ranker_list_to_bson_list(RankList) ->
	ranker_list_to_bson_list([], RankList).
ranker_list_to_bson_list(BsonList, []) ->
	BsonList;
ranker_list_to_bson_list(BsonList, [Ranker | T]) ->
	Bson = ranker_to_bson(Ranker),
	ranker_list_to_bson_list([Bson | BsonList], T).

ranker_to_bson(Ranker) ->
	RankKeyBson = ranker_key_to_bson(Ranker#ranker.rank_type, Ranker#ranker.rank_key),
	#{
		?BSONSET_BSON(<<"rank_key">>, RankKeyBson),
		?BSONSET_INT(<<"rank_type">>, Ranker#ranker.rank_type),
		?BSONSET_INT(<<"rank">>, Ranker#ranker.rank),
		?BSONSET_INT(<<"rank_value">>, Ranker#ranker.rank_value),
		?BSONSET_INT(<<"rank_tick">>, Ranker#ranker.rank_tick),
		?BSONSET_BSON(<<"player_show">>, show_role_to_bson(Ranker#ranker.player_show)),
		?BSONSET_INT(<<"last_rank">>, Ranker#ranker.last_rank),
		?BSONSET_STRING(<<"server_flag">>, Ranker#ranker.server_flag)
	}.

ranker_key_to_bson(_RankType, RankKey) ->
	lib_types:to_binary(RankKey).

show_role_to_bson(ShowRole) ->
	if
		ShowRole =/= undefined -> lib_player:show_role_to_bson(ShowRole);
		true -> undefined
	end.

bson_to_ranker(Bson) ->
	RankType = ?BSON_INT(Bson, <<"rank_type">>),
	RankKey = bson_to_ranker_key(RankType, ?BSON_BSON(Bson, <<"rank_key">>)),
	#ranker{
		rank_key = RankKey,
		rank_type = RankType,
		rank = ?BSON_INT(Bson, <<"rank">>),
		rank_value = ?BSON_INT(Bson, <<"rank_value">>),
		rank_tick = ?BSON_INT(Bson, <<"rank_tick">>),
		player_show = bson_to_show_role(?BSON_BSON_DEFAULT(Bson, <<"player_show">>, undefined)),
		last_rank = ?BSON_INT(Bson, <<"last_rank">>),
		server_flag = ?BSON_STRING(Bson, <<"server_flag">>)
	}.

bson_to_ranker_key(_RankType, Bson) ->
	lib_types:to_integer(Bson).

bson_to_show_role(Bson) ->
	if
		Bson =/= undefined andalso Bson =/= <<"undefined">> ->
			lib_player:bson_to_show_role(Bson);
		true -> undefined
	end.



