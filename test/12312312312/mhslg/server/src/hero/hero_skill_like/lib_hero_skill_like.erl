%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 30. Jun 2021 4:53 PM
%%%-------------------------------------------------------------------
-module(lib_hero_skill_like).
-author("lichaoyu").
-include("common.hrl").
-include("ProtoClient_10116.hrl").

%% API
-export([
	request_hero_skill_like_info/1,	%% 请求英雄技能推荐信息
	request_hero_skill_like/1		%% 请求英雄技能推荐
]).
-export([
	load_hero_skill_like/0,
	save_hero_skill_like/0,
	lookup/1

]).

request_hero_skill_like_info(Msg) ->
	#'Proto10116044'{
		hero_id = HeroId
	} = Msg,
	SkillLikeMap = lookup(HeroId),
	SkillLikeList = maps:to_list(SkillLikeMap),
	PlayerId = lib_player:player_id(),
	Res = #'Proto50116044'{
		hero_skill_like = [#'ProtoHeroSkillLike'{
			skill_id = SkillId,
			like_num = sets:size(LikeSets),
			is_like = sets:is_element(PlayerId, LikeSets)
		} || {SkillId, LikeSets} <- SkillLikeList]
	},
	lib_send:respond_to_client(Res)
.

request_hero_skill_like(Msg) ->
	#'Proto10116045'{
		hero_id = HeroId,
		skill_id = SkillId
	} = Msg,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	Conf = tb_hero:get(HeroId),
	Flag = lists:any(
		fun(K) ->
			lists:any(
				fun({_, SkillConf}) ->
					lists:member(SkillId, maps:get(skills, SkillConf))
				end, maps:to_list(maps:get(K, Conf)))
		end, [recommended_skill_1, recommended_skill_2, recommended_skill_3, recommended_skill_4, recommended_skill_5, recommended_skill_6]),
	?JUDGE_RETURN(Flag, ?ERROR_CONFIG_NOT_EXISTENT),
	SkillLikeMap = lookup(HeroId),
	LikeSets = maps:get(SkillId, SkillLikeMap, sets:new()),
	PlayerId = lib_player:player_id(),
	IsLike = sets:is_element(PlayerId, LikeSets),
	NewLikeSets =
		case IsLike of
			true -> sets:del_element(PlayerId, LikeSets);
			false -> sets:add_element(PlayerId, LikeSets)
		end,
	NewSkillLikeMap = maps:put(SkillId, NewLikeSets, SkillLikeMap),
	insert({HeroId, NewSkillLikeMap}),
	Res = #'Proto50116045'{
		hero_skill_like = #'ProtoHeroSkillLike'{
			skill_id = SkillId,
			like_num = sets:size(NewLikeSets),
			is_like = not IsLike
		}
	},
	lib_send:respond_to_client(Res)
.

load_hero_skill_like() ->
	HeroList = tb_hero:get_list(),
	[insert({HeroId, load_hero_skill_like(HeroId)}) || HeroId <- HeroList]
.
load_hero_skill_like(HeroId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_HERO_SKILL_LIKE, #{?BSONSET_INT(<<"id">>, HeroId)}) of
		Bson = #{} ->
			lists:foldl(
				fun(B, M) ->
					SkillId = ?BSON_INT(B, <<"skill_id">>),
					LikeList = ?BSON_LIST(B, <<"like_list">>),
					maps:put(SkillId, sets:from_list(LikeList), M)
				end, maps:new(), ?BSON_LIST(Bson, <<"skill_list">>));
		_ -> maps:new()
	end
.
save_hero_skill_like() ->
	HeroLikeList = lookup(),
	[save_hero_skill_like(HeroLike) || HeroLike <- HeroLikeList]
.
save_hero_skill_like({HeroId, SkillLikeMap}) ->
	mongo_poolboy:async_update(?MMO_POOL, ?DB_HERO_SKILL_LIKE, #{?BSONSET_INT(<<"id">>, HeroId)},
		#{<<"$set">> => #{
			?BSONSET_INT(<<"id">>, HeroId),
			?BSONSET_LIST(<<"skill_list">>, [to_bson(SkillLike) || SkillLike <- maps:to_list(SkillLikeMap)])
		}})
.
to_bson({SkillId, LikeSets}) ->
	#{
		?BSONSET_INT(<<"skill_id">>, SkillId),
		?BSONSET_LIST(<<"like_list">>, sets:to_list(LikeSets))
	}
.

insert(HeroSkillLike) ->
	ets:insert(?ETS_HERO_SKILL_LIKE, HeroSkillLike)
.
lookup() ->
	ets:tab2list(?ETS_HERO_SKILL_LIKE)
.
lookup(HeroId) ->
	{_, SkillLikeMap} = hd(ets:lookup(?ETS_HERO_SKILL_LIKE, HeroId)),
	SkillLikeMap
.

