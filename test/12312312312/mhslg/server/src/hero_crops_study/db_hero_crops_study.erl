%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 4月 2021 19:01
%%%-------------------------------------------------------------------
-module(db_hero_crops_study).
-author("df").
-include("common.hrl").
-include("hero_crops_study.hrl").

%% API
-export([
	load_hero_crops_study/1,
	save_hero_crops_study/1
]).


load_hero_crops_study(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_HERO_CROPS_STUDY, #{?BSONSET_INT(id, PlayerId)}) of
		Bson = #{} ->
			MapList = ?BSON_LIST(Bson, study_maps),
			Map =
				lists:foldl(fun(Crops_study, Dict) ->
					Type = ?BSON_INT(Crops_study, type),
					maps:put(Type, #crops_study{
						type  = Type,
						level = ?BSON_INT(Crops_study, level),
						is_break = ?BSON_INT(Crops_study, is_break),
						empirical = ?BSON_INT(Crops_study, empirical),
						fail_time = ?BSON_INT(Crops_study, fail_time),
						study_time = ?BSON_INT(Crops_study, study_time),
						last_add_tick = ?BSON_INT(Crops_study, last_add_tick),
						study_fail = ?BSON_INT(Crops_study, study_fail),
						break_fail = ?BSON_INT(Crops_study, break_fail)
					}, Dict)
				end, maps:new(),MapList),
			#hero_crops_study{
				id = PlayerId,
				study_maps = Map
			}
		;
		_ ->
			List = lib_hero_crops_study_api:get_tb_const(corps_type,jsonvalue),
			Map = lists:foldl(fun(Type,M)->
				maps:put(Type,#crops_study{type = Type,study_time = ?STUDY_MAX_TIME},M)
			end,maps:new(),List),
			#hero_crops_study{
				id = PlayerId,
				study_maps = Map
			}

	end.

save_hero_crops_study(Hero_crops_study) when is_record(Hero_crops_study, hero_crops_study) ->
	PlayerId = Hero_crops_study#hero_crops_study.id,
	MapList = maps:fold(fun(_Type,Study_maps,List)->
		[#{
			?BSONSET_INT(type, Study_maps#crops_study.type),
			?BSONSET_INT(level, Study_maps#crops_study.level),
			?BSONSET_INT(is_break, Study_maps#crops_study.is_break),
			?BSONSET_INT(empirical, Study_maps#crops_study.empirical),
			?BSONSET_INT(fail_time, Study_maps#crops_study.fail_time),
			?BSONSET_INT(study_time, Study_maps#crops_study.study_time),
			?BSONSET_INT(last_add_tick, Study_maps#crops_study.last_add_tick),
			?BSONSET_INT(study_fail, Study_maps#crops_study.study_fail),
			?BSONSET_INT(break_fail, Study_maps#crops_study.break_fail)
		}|List]
	end,[],Hero_crops_study#hero_crops_study.study_maps),
	Bson = #{
		?BSONSET_INT(id,PlayerId),
		?BSONSET_LIST(study_maps, MapList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_HERO_CROPS_STUDY,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson}).

