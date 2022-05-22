%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_season_activity
%%% Created on : 2021/7/8 16:19
%%% @author leever
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_season_activity).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	save_player_season_activity/1,
	load_player_season_activity/1
]).
-export([
	bson_to_autumn/1,bson_to_spring/1,
	autumn_to_bson/1,spring_to_bson/1
]).
bson_to_spring(BsonSpringList) ->
	lists:foldl(fun(BsonSpring,Map) ->
		Spring = #spring{
			id = ?BSON_INT(BsonSpring, id),
			hero_condition = ?BSON_INT(BsonSpring, hero_condition),
			target_city = ?BSON_INT(BsonSpring, target_city),
			award = ?BSON_LIST(BsonSpring, award),
			is_completed = ?BSON_BOOL(BsonSpring, is_completed),
			is_received = ?BSON_BOOL(BsonSpring, is_received),
			is_display = ?BSON_BOOL(BsonSpring, is_display),
			is_forward = ?BSON_BOOL(BsonSpring, is_forward),
			is_arrived = ?BSON_BOOL(BsonSpring, is_arrived),
			hero_id = ?BSON_INT(BsonSpring, hero_id)
		},
		maps:put(Spring#spring.id,Spring,Map)
				end,maps:new(),BsonSpringList)
.
spring_to_bson(SpringMap) ->
	maps:fold(fun(_,Spring,List) ->
		[#{	?BSONSET_INT(id, Spring#spring.id),
			?BSONSET_INT(hero_condition, Spring#spring.hero_condition),
			?BSONSET_INT(target_city, Spring#spring.target_city),
			?BSONSET_LIST(award, Spring#spring.award),
			?BSONSET_BOOL(is_completed, Spring#spring.is_completed),
			?BSONSET_BOOL(is_received, Spring#spring.is_received),
			?BSONSET_BOOL(is_display, Spring#spring.is_display),
			?BSONSET_BOOL(is_forward, Spring#spring.is_forward),
			?BSONSET_BOOL(is_arrived, Spring#spring.is_arrived),
			?BSONSET_INT(hero_id, Spring#spring.hero_id)
		}|List]
			  end,[],SpringMap)


.
bson_to_autumn(BsonAutumnList) ->
	lists:foldl(fun(BsonAutumn,Map) ->
		Autumn = #autumn{
			id = ?BSON_INT(BsonAutumn, id),
			industry = ?BSON_INT(BsonAutumn, industry),
			industry_level = ?BSON_INT(BsonAutumn, industry_level),
			robber = ?BSON_INT(BsonAutumn, robber),
			is_forward = ?BSON_BOOL(BsonAutumn, is_forward),
			is_arrived = ?BSON_BOOL(BsonAutumn, is_arrived),
			is_display = ?BSON_BOOL(BsonAutumn, is_display),
			is_received = ?BSON_BOOL(BsonAutumn, is_received),
			last_time = ?BSON_INT(BsonAutumn, last_time),
			award = ?BSON_LIST(BsonAutumn, award),
			is_completed = ?BSON_BOOL(BsonAutumn, is_completed),
			hero_id = ?BSON_INT(BsonAutumn, hero_id)
		},
		maps:put(Autumn#autumn.id,Autumn,Map)
				end,maps:new(),BsonAutumnList)
.
autumn_to_bson(AutumnMap) ->
	maps:fold(fun(_,Autumn,List) ->
		[#{
			?BSONSET_INT(id, Autumn#autumn.id),
			?BSONSET_INT(industry, Autumn#autumn.industry),
			?BSONSET_INT(industry_level, Autumn#autumn.industry_level),
			?BSONSET_INT(robber, Autumn#autumn.robber),
			?BSONSET_BOOL(is_forward, Autumn#autumn.is_forward),
			?BSONSET_BOOL(is_arrived, Autumn#autumn.is_arrived),
			?BSONSET_BOOL(is_display, Autumn#autumn.is_display),
			?BSONSET_BOOL(is_received, Autumn#autumn.is_received),
			?BSONSET_INT(last_time, Autumn#autumn.last_time),
			?BSONSET_LIST(award, Autumn#autumn.award),
			?BSONSET_BOOL(is_completed, Autumn#autumn.is_completed),
			?BSONSET_INT(hero_id, Autumn#autumn.hero_id)
	}|List]
			  end,[],AutumnMap)
.
load_player_season_activity(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL,?DB_PLAYER_SEASON_ACTIVITY,#{?BSONSET_INT(id, PlayerId)}) of
		Res = #{} ->
			BsonSpringList = ?BSON_LIST(Res,spring),
			BsonAutumnList = ?BSON_LIST(Res,autumn),
			WinterList = ?BSON_BOOL(Res,is_spring_final_award),
			AwardList = ?BSON_BOOL(Res,is_autumn_final_award),
			#player_season_activity{
				id = PlayerId,
				spring = bson_to_spring(BsonSpringList),
				autumn = bson_to_autumn(BsonAutumnList),
				is_spring_final_award = WinterList,
				is_autumn_final_award = AwardList
			};
		_ -> #player_season_activity{
			id = PlayerId
		}
	end
.
save_player_season_activity(Player_Season_Activity) ->
	#player_season_activity{id = PlayerId,spring = SpringMap,autumn = AutumnMap} = Player_Season_Activity,
	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(spring, spring_to_bson(SpringMap)),
		?BSONSET_LIST(autumn, autumn_to_bson(AutumnMap)),
		?BSONSET_BOOL(is_spring_final_award, Player_Season_Activity#player_season_activity.is_spring_final_award),
		?BSONSET_BOOL(is_autumn_final_award, Player_Season_Activity#player_season_activity.is_autumn_final_award)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_SEASON_ACTIVITY,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.