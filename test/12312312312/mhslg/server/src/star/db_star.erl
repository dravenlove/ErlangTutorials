%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 6月 2021 11:00
%%%-------------------------------------------------------------------
-module(db_star).
-author("df").

-include("common.hrl").

%% API
-export([
	load_player_star/1,
	save_player_star/1

]).
-export([
	bson_to_star_hero/1,
	star_hero_to_bson/1,
	bson_to_star_info/1,
	star_info_to_bson/1
]).


load_player_star(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_PLAYER_STAR, #{?BSONSET_INT(id, PlayerId)}) of
		Bson = #{} ->
			#player_star{
				player_id = PlayerId,
				buy_time = ?BSON_INT(Bson,  buy_time)
			}
		;
		_ ->
			#player_star{
				player_id = PlayerId
			}
	end.

save_player_star(Player_star) when is_record(Player_star, player_star) ->
	PlayerId = Player_star#player_star.player_id,
	Bson = #{
		?BSONSET_INT(player_id,PlayerId),
		?BSONSET_INT(buy_time, Player_star#player_star.buy_time)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_PLAYER_STAR,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson}).

%%====================%%
bson_to_star_hero(Bson) ->
	List = ?BSON_LIST(Bson, star_type_map, []),
	StarTypeMap =
		lists:foldl(fun(BsonStarType,Map) ->
			Type = ?BSON_INT(BsonStarType, type),
			maps:put(Type,
				bson_to_star_type(BsonStarType), Map)
		end, maps:new(), List),
	#star_hero{
		star_type_map = StarTypeMap
	}.
star_hero_to_bson(Star_hero) ->
	Star_type_list =
		maps:fold(fun(_Type,Star_type,List) ->
			[star_type_to_bson(Star_type)|List]
		end, [], Star_hero#star_hero.star_type_map),
	#{
		?BSONSET_LIST(star_type_map, Star_type_list)
	}.


bson_to_star_type(Bson) ->
	List = ?BSON_LIST(Bson, star_map, []),
	StarMap =
		lists:foldl(fun(BsonStar,Map) ->
			Inlay_type = ?BSON_INT(BsonStar, inlay_type),
			maps:put(Inlay_type,
				bson_to_star(BsonStar), Map)
		end, maps:new(), List),
	#star_type{
		type = ?BSON_INT(Bson, type),
		star_map = StarMap
	}.

star_type_to_bson(Star_type) ->
	Star_list =
		maps:fold(fun(_Inlay_type,Star,List) ->
			[star_to_bson(Star)|List]
		end, [], Star_type#star_type.star_map),
	#{
		?BSONSET_INT(type, Star_type#star_type.type),
		?BSONSET_LIST(star_map, Star_list)
	}.

bson_to_star(Bson) ->
	#star{
		inlay_type = ?BSON_INT(Bson, inlay_type),
		inlay = ?BSON_INT(Bson, inlay)
	}.

star_to_bson(Star) ->
	#{
		?BSONSET_INT(inlay_type, Star#star.inlay_type),
		?BSONSET_INT(inlay, Star#star.inlay)
	}.

bson_to_star_info(Bson) ->
	#star_info{
		level = ?BSON_INT(Bson, level),
		experience = ?BSON_INT(Bson, experience),
		inlay_info = ?BSON_LIST(Bson, inlay_info)
	}.

star_info_to_bson(Star_info) ->
	#{
		?BSONSET_INT(level, Star_info#star_info.level),
		?BSONSET_INT(experience, Star_info#star_info.experience),
		?BSONSET_LIST(inlay_info, Star_info#star_info.inlay_info)
	}.