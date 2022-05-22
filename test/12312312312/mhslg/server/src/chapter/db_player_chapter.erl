%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十一月 2020 18:28
%%%-------------------------------------------------------------------
-module(db_player_chapter).
-author("13661").

-include("common.hrl").
-include("chapter.hrl").

%% API
-export([
	load_player_chapter/1,
	save_player_chapter/1
]).

stage_to_bson(Stage) when is_record(Stage, stage) ->
	#{
		?BSONSET_INT(stage_id, Stage#stage.stage_id),
		?BSONSET_INT(challenge_times, Stage#stage.challenge_times),
		?BSONSET_BOOL(is_pass, Stage#stage.is_pass),
		?BSONSET_INT(pass_star, Stage#stage.pass_star),
		?BSONSET_INT(pass_times, Stage#stage.pass_times),
		?BSONSET_LIST(pass_targets, Stage#stage.pass_targets)
	}
.

bson_to_stage(Bson) ->
	#stage{
		stage_id = ?BSON_INT(Bson, stage_id),
		challenge_times = ?BSON_INT(Bson, challenge_times),
		is_pass = ?BSON_BOOL(Bson, is_pass),
		pass_star = ?BSON_INT(Bson, pass_star),
		pass_times = ?BSON_INT(Bson, pass_times),
		pass_targets = ?BSON_LIST(Bson, pass_targets)
	}
.

chapter_to_bson(Chapter) when is_record(Chapter, chapter) ->
	BsonStarRewardList = lib_mongodb:dict_to_bson_list(Chapter#chapter.star_rewards),
	BsonStageList =
	dict:fold(fun(_StageId, Stage, List) ->
		[stage_to_bson(Stage) | List]
  	end, [], Chapter#chapter.stages),

	#{
		?BSONSET_INT(chapter_id, Chapter#chapter.chapter_id),
		?BSONSET_LIST(stages, BsonStageList),
		?BSONSET_INT(total_star, Chapter#chapter.total_star),
		?BSONSET_LIST(star_rewards, BsonStarRewardList),
		?BSONSET_INT(top_stage_id, Chapter#chapter.top_stage_id)
	}
.

bson_to_chapter(Bson) ->
	BsonStarRewardList = ?BSON_LIST(Bson, star_rewards),
	StarRewards = lib_mongodb:bson_list_to_dict(BsonStarRewardList),

	BsonStageList = ?BSON_LIST(Bson, stages),
	Stages =
	lists:foldl(fun(BsonStage, Dict) ->
		Stage = bson_to_stage(BsonStage),
		dict:store(Stage#stage.stage_id, Stage, Dict)
	end, dict:new(), BsonStageList),

	#chapter{
		chapter_id = ?BSON_INT(Bson, chapter_id),
		stages = Stages,
		total_star = ?BSON_INT(Bson, total_star),
		star_rewards = StarRewards,
		top_stage_id = ?BSON_INT(Bson, top_stage_id)
	}
.

load_player_chapter(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_CHAPTER, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BsonChapterList = ?BSON_LIST(Bson, chapters),
			Chapters =
			lists:foldl(fun(BsonChapter, Dict) ->
				Chapter = bson_to_chapter(BsonChapter),
				dict:store(Chapter#chapter.chapter_id, Chapter, Dict)
			end, dict:new(), BsonChapterList),

			#player_chapter{
				id = PlayerId,
				chapters = Chapters,
				buy_times = ?BSON_INT(Bson, buy_times),
				challenge_times = ?BSON_INT(Bson, challenge_times)
			};
		_ ->
			#player_chapter{
				id = PlayerId
			}
	end.

save_player_chapter(PlayerChapter) ->
	PlayerId = PlayerChapter#player_chapter.id,

	BsonChapterList =
	dict:fold(fun(_ChapterId, Chapter, List) ->
		[chapter_to_bson(Chapter) | List]
  	end, [], PlayerChapter#player_chapter.chapters),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(chapters, BsonChapterList),
		?BSONSET_INT(buy_times, PlayerChapter#player_chapter.buy_times),
		?BSONSET_INT(challenge_times, PlayerChapter#player_chapter.challenge_times)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_CHAPTER,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).