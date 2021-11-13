%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 17:47
%%%-------------------------------------------------------------------
-module( db_player_hero).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("hero_skill.hrl").

%% API
-export([
	load_player_hero/1,
	save_player_hero/1,

	bson_to_hero/1,
	bson_to_honor_title/1,
	honor_title_to_bson/1,
	hero_to_bson/1
]).

hero_skill_to_bson(Skill) when is_record(Skill, skill) ->
	#{
		?BSONSET_INT(id, Skill#skill.id),
		?BSONSET_INT(level, Skill#skill.level),
		?BSONSET_BOOL(is_active, Skill#skill.is_active),
		?BSONSET_INT(active_type, Skill#skill.active_type),
		?BSONSET_INT(active_level, Skill#skill.active_level),
		?BSONSET_BOOL(is_fixed, Skill#skill.is_fixed)
	}
.

bson_to_hero_skill(Bson) ->
	#skill{
		id = ?BSON_INT(Bson, id),
		level = ?BSON_INT(Bson, level),
		is_active = ?BSON_BOOL(Bson, is_active),
		active_type = ?BSON_INT(Bson, active_type),
		active_level = ?BSON_INT(Bson, active_level),
		is_fixed = ?BSON_BOOL(Bson, is_fixed)
	}
.

hero_to_bson(Hero) when is_record(Hero, hero) ->
	BsonHeroSkillList =
	maps:fold(fun(_SkillId, Skill, List) ->
		[hero_skill_to_bson(Skill) | List]
  	end, [], Hero#hero.skill_learning_map),

	#{
		?BSONSET_INT(hero_id, Hero#hero.id),
		?BSONSET_INT(active_type, Hero#hero.active_type),
		?BSONSET_INT(level, Hero#hero.level),
		?BSONSET_INT(exp, Hero#hero.exp),
		?BSONSET_INT(star, Hero#hero.star),
		?BSONSET_INT(<<"awaken">>, Hero#hero.awaken),
		?BSONSET_INT(front_level, Hero#hero.front_level),
		?BSONSET_INT(back_level, Hero#hero.back_level),
		?BSONSET_INT(front_stage, Hero#hero.front_stage),
		?BSONSET_INT(back_stage, Hero#hero.back_stage),
		?BSONSET_INT(force, Hero#hero.force),
		?BSONSET_LIST(activate_destiny_list, Hero#hero.activate_destiny_list),
		?BSONSET_LIST(skill_list, Hero#hero.skill_list),
		?BSONSET_BSON(prop_dict, lib_fight_prop:prop_dict_to_bson(Hero#hero.prop_dict)),
		?BSONSET_LIST(skill_learning_map, BsonHeroSkillList),
		?BSONSET_LIST(equip_item, db_equip:equip_to_bson_list(Hero#hero.equip_item_dict)),
		?BSONSET_BSON(honor_title, honor_title_to_bson(Hero#hero.honor_title)),
		?BSONSET_BSON(hero_star, db_star:star_hero_to_bson(Hero#hero.hero_star)),
		?BSONSET_LIST(<<"assist_list">>, lib_hero_assist:assist_to_bson(Hero#hero.assist)),
		?BSONSET_LIST(<<"formation">>, lib_hero_formation:formation_to_bson(Hero#hero.formation))
	}
.

honor_title_to_bson(Title) ->
	#{
		?BSONSET_INT(unique_id, Title#hero_title.unique_id),
		?BSONSET_INT(item_id, Title#hero_title.item_id)
	}.

bson_to_hero(Bson) ->
	BsonHeroSkillList = ?BSON_LIST(Bson, skill_learning_map),
	HeroSkillMap =
	lists:foldl(fun(BsonHeroSkill, Map) ->
		Skill = bson_to_hero_skill(BsonHeroSkill),
		maps:put(Skill#skill.id, Skill, Map)
	end, maps:new(), BsonHeroSkillList),
	#hero{
		id = ?BSON_INT(Bson, hero_id),
		active_type = ?BSON_INT(Bson, active_type),
		level = ?BSON_INT(Bson, level),
		exp = ?BSON_INT(Bson, exp),
		star = ?BSON_INT(Bson, star),
		awaken = ?BSON_INT(Bson, <<"awaken">>),
		front_level = ?BSON_INT(Bson, front_level),
		back_level = ?BSON_INT(Bson, back_level),
		front_stage = ?BSON_INT(Bson, front_stage),
		back_stage = ?BSON_INT(Bson, back_stage),
		force = ?BSON_INT(Bson, force),
		activate_destiny_list = ?BSON_LIST(Bson, activate_destiny_list),
		skill_learning_map = HeroSkillMap,
		equip_item_dict = db_equip:bson_list_to_equip(?BSON_LIST(Bson, equip_item)),
		honor_title = bson_to_honor_title(?BSON_BSON(Bson, honor_title)),
		hero_star = db_star:bson_to_star_hero(?BSON_BSON(Bson, hero_star)),
		assist = lib_hero_assist:bson_to_assist(?BSON_LIST(Bson, <<"assist_list">>)),
		formation = lib_hero_formation:bson_to_formation(?BSON_LIST(Bson, <<"formation">>))
	}
.
bson_to_honor_title(Bson) ->
	#hero_title{
		unique_id = ?BSON_INT(Bson, unique_id),
		item_id = ?BSON_INT(Bson, item_id)
	}.

load_player_hero(PlayerId) ->
%%	case mongo_poolboy:find(?MMO_POOL, ?DBPLAYER_HERO, #{?BSONSET_INT(<<"id">>, PlayerId), ?BSONSET_BOOL(is_delete, false)}) of
%%		BsonList = [_ | _] ->
%%			HeroList = [bson_to_hero(Bson) || Bson <- BsonList],
%%			HeroDict =
%%			lists:foldl(fun(Hero, Dict) ->
%%				dict:store(Hero#hero.id, Hero, Dict)
%%			end, dict:new(), HeroList),
%%			#player_hero{
%%				id = PlayerId,
%%				hero_dict = HeroDict
%%			};
%%		_ -> #player_hero{id = PlayerId}
%%	end,

	QueryBson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_BOOL(is_delete, false)
	},
	case mongo_poolboy:find(?MMO_POOL, ?DBPLAYER_HEROS, QueryBson) of
		[_ | _] = BsonList ->
			HeroList = [bson_to_hero(Bson) || Bson <- BsonList],
			HeroDict =
			lists:foldl(fun(Hero, Dict) ->
				dict:store(Hero#hero.id, Hero, Dict)
			end, dict:new(), HeroList),
			#player_hero{
				id = PlayerId,
				hero_dict = HeroDict
			};
		_ ->
			#player_hero{
				id = PlayerId
			}
	end
.

save_player_hero(PlayerHero) ->
	PlayerId = PlayerHero#player_hero.id,
	PlayerName = PlayerHero#player_hero.name,
	Country = PlayerHero#player_hero.country,
%%	HeroBsonList =
%%	dict:fold(fun(_HeroId, Hero, List) ->
%%		HeroBson = hero_to_bson(Hero),
%%		[HeroBson#{
%%			?BSONSET_BOOL(is_delete, false)
%%		} | List]
%%  	end, [], PlayerHero#player_hero.hero_dict),
%%
%%	Bson = #{
%%		?BSONSET_INT(id, PlayerId),
%%		?BSONSET_LIST(hero_dict, HeroBsonList)
%%	},
%%
%%	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_HERO,
%%		#{?BSONSET_INT(<<"id">>, PlayerId)},
%%		#{<<"$set">> => Bson})

	dict:map(fun(HeroId, Hero) ->
		QueryBson = #{
			?BSONSET_INT(id, PlayerId),
			?BSONSET_INT(hero_id, HeroId)
		},
		HeroBson = hero_to_bson(Hero),
		mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_HEROS, QueryBson, HeroBson#{
			?BSONSET_INT(id, PlayerId),
			?BSONSET_STRING(name, PlayerName),
			?BSONSET_INT(country_id, Country),
			?BSONSET_INT(update_tick, lib_timer:unixtime()),
			?BSONSET_BOOL(is_delete, false)
		})
 	end, PlayerHero#player_hero.hero_dict)
.