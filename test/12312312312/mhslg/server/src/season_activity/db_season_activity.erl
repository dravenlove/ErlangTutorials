%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_winter
%%% Created on : 2021/8/30 16:42
%%% @author leever liangxingwu@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_season_activity).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	load_season_activity/0,
	save_season_activity/1,
	question_to_bson/1,
	bson_to_question/1,
	player_summer_to_bson/1,
	bson_to_player_summer/1,
	summer_to_bson/1,
	bson_to_summer/1
]).


load_season_activity() ->
	case mongo_poolboy:find_one(?MMO_POOL,?DB_SEASON_ACTIVITY,#{?BSONSET_INT(id, 1)}) of
		Res = #{} ->
			#season_activity{
				question = bson_to_question(?BSON_LIST(Res, question)),
				is_open = ?BSON_BOOL(Res, is_open),
				rank_list = bson_to_rank(?BSON_LIST(Res, rank_list)),
				player_answer = bson_to_player_summer(?BSON_LIST(Res, player_answer))
			};
		_ -> #season_activity{}
	end
.
save_season_activity(SeasonActivityMap) ->
	#season_activity{question = QuestionMap,is_open = IsOpen,rank_list = RankList,player_summer = PlayerSummerMap} = SeasonActivityMap,
	Bson = #{
		?BSONSET_LIST(question, question_to_bson(QuestionMap)),
		?BSONSET_BOOL(is_open, IsOpen),
		?BSONSET_LIST(rank_list, rank_to_bson(RankList)),
		?BSONSET_LIST(player_summer, player_summer_to_bson(PlayerSummerMap))
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_SEASON_ACTIVITY,
		#{?BSONSET_INT(<<"id">>, 1)},
		#{<<"$set">> => Bson})
.
player_summer_to_bson(PlayerSummerMap) ->
	maps:fold(fun(_,PlayerSummer,List) ->
		[#{
			?BSONSET_INT(id, PlayerSummer#player_summer.id),
			?BSONSET_LIST(summer, summer_to_bson(PlayerSummer#player_summer.summer)),
			?BSONSET_INT(summer_firecracker_remain_times, PlayerSummer#player_summer.summer_firecracker_remain_times),
			?BSONSET_INT(summer_firework_remain_times, PlayerSummer#player_summer.summer_firework_remain_times)
		}|List]
			  end,[],PlayerSummerMap)
.
bson_to_player_summer(BsonPlayerSummerList) ->
	lists:foldl(fun(BsonPlayerSummer,Map) ->
		PlayerSummer = #player_summer{
			id = ?BSON_INT(BsonPlayerSummer, id),
			summer = bson_to_summer(?BSON_LIST(BsonPlayerSummer, summer)),
			summer_firecracker_remain_times = ?BSON_INT(BsonPlayerSummer, summer_firecracker_remain_times),
			summer_firework_remain_times = ?BSON_INT(BsonPlayerSummer, summer_firework_remain_times)
		},
		maps:put(PlayerSummer#player_summer.id,PlayerSummer,Map)
				end,maps:new(),BsonPlayerSummerList)
.
bson_to_summer(BsonSummerList) ->
	lists:foldl(fun(BsonSummer,Map) ->
		Summer = #summer{
			id = ?BSON_INT(BsonSummer, id),
			is_recharging = ?BSON_BOOL(BsonSummer, is_recharging),
			is_received = ?BSON_BOOL(BsonSummer, is_received),
			received_times = ?BSON_INT(BsonSummer, received_times),
			total_times = ?BSON_INT(BsonSummer, total_times),
			award = ?BSON_LIST(BsonSummer, award),
			tick = ?BSON_INT(BsonSummer, tick)
		},
		maps:put(Summer#summer.id,Summer,Map)
				end,maps:new(),BsonSummerList)
.
summer_to_bson(SummerMap) ->
	maps:fold(fun(_,Summer,List) ->
		[#{
			?BSONSET_INT(id, Summer#summer.id),
			?BSONSET_BOOL(is_recharging, Summer#summer.is_recharging),
			?BSONSET_BOOL(is_received, Summer#summer.is_received),
			?BSONSET_INT(received_times, Summer#summer.received_times),
			?BSONSET_INT(total_times, Summer#summer.total_times),
			?BSONSET_LIST(award, Summer#summer.award),
			?BSONSET_INT(tick, Summer#summer.tick)
		}|List]
			  end,[],SummerMap)
.
rank_to_bson(RankList) ->
	lists:foldr(fun(Rank,List) ->
		[#{
			?BSONSET_INT(no, Rank),
			?BSONSET_BSON(proto_show_role , lib_player:show_role_to_bson(Rank#rank.proto_show_role)),		%% 玩家信息 => #ProtoShowRole
			?BSONSET_INT(right, Rank),
			?BSONSET_INT(time, Rank)
		}|List]
				end,[],RankList)
.
bson_to_rank(BsonRankList) ->
	lists:foldr(fun(BsonRank,List) ->
		[#rank{
			no = ?BSON_INT(BsonRank, no),
			proto_show_role = lib_player:bson_to_show_role(?BSON_BSON(BsonRank , protoMutual_show_role)),		%% 玩家信息 => #ProtoShowRole
			right = ?BSON_INT(BsonRank, right),
			time = ?BSON_INT(BsonRank, time)
		}|List]
				end,[],BsonRankList)
.
question_to_bson(QuestionMap) ->
	maps:fold(fun(_,Question,List) ->
		[#{
			?BSONSET_INT(id, Question#question.id),
			?BSONSET_INT(question, Question#question.question),
			?BSONSET_LIST(answer_list, Question#question.answer_list)
		}|List]
			  end,[],QuestionMap)
.
bson_to_question(BsonQuestionList) ->
	lists:foldl(fun(BsonQuestion,Map) ->
		Question = #question{
			id = ?BSON_INT(BsonQuestion, id),
			question = ?BSON_INT(BsonQuestion, question),
			answer_list = ?BSON_LIST(BsonQuestion, answer_list)
		},
		maps:put(Question#question.id,Question,Map)
				end,maps:new(),BsonQuestionList)
.
