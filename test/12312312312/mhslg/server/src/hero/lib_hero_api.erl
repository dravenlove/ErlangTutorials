%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十一月 2020 17:49
%%%-------------------------------------------------------------------
-module(lib_hero_api).
-author("13661").
-include("hero.hrl").
-include("hero_skill.hrl").
-include("ProtoClient_10116.hrl").

%% API
-export([               	%%英雄信息 进程无关接口
	hero_type/1,			%%英雄类型
	hero_name/1,			%%英雄名
	hero_sex/1,				%%英雄性别
	hero_quality/1,			%%英雄品质
	hero_color/1,			%%英雄颜色
	hero_corps_type/1,		%%英雄前后军类型 ret {前军类型,后军类型}
	hero_front_corps/1,		%%英雄前军类型
	hero_back_corps/1,		%%英雄后军类型
	calc_total_force/1,		%%计算英雄列表总战力
	hero_to_hero_base/1,	%%
	hero_base_to_proto/1,	%%
	hero_base_to_bson/1,
	bson_to_hero_base/1
]).
-export([               %%英雄信息 只能在玩家进程调用
	hero_level/1,		%%英雄等级
	hero_star/1,		%%英雄星级
	hero_awaken/1,		%% 英雄觉醒
	hero_front_level/1,	%%英雄前军等级
	hero_back_level/1,	%%英雄后军等级
	hero_corps_stage/1,	%%英雄前后军等阶 ret {前军等阶,后军等阶}
	hero_front_stage/1,	%%英雄前军等阶
	hero_back_stage/1,	%%英雄后军等阶
	hero_prop/1,		%%英雄属性(未转换)
	hero_force/1,		%%英雄战力
	hero_skill_list/1	%%英雄技能
]).
-export([               %%只能在玩家进程调用
	hero_to_proto/1,
	is_have_hero/1,		%%是否有这个英雄
	active_hero/2,		%%激活英雄
	active_hero/3,		%% 带觉醒状态激活英雄
	hero_id_list/0,		%%已拥有的英雄ID列表
	hero_num/0,			%% 已拥有英雄数量
	hero_list/0,		%%已拥有的英雄列表
	hero_color_num/1,	%% 达到颜色的英雄数量
	hero_skill_num/2,	%% 拥有技能数量和等级的英雄数量
	hero_info/1,		%%英雄信息
	hero_base_info/1,	%%英雄基础信息
	best_hero/0,		%% 最强战力英雄
	update_hero/1,		%%更新英雄信息
	update_hero/2,		%%更新英雄信息
	notify_hero_update/2	%%通知英雄信息更新
]).

hero_to_proto(Hero) when is_record(Hero, hero) ->
	hero_to_proto(Hero, ?HERO_UPDATE_TYPE_ALL)
.
hero_to_proto(Hero, UpdateType) when is_record(Hero, hero) ->
	InfoList = [
		{?HERO_UPDATE_TYPE_LEVEL, fun lib_hero_level:hero_level_to_proto/2},
		{?HERO_UPDATE_TYPE_STAR, fun lib_hero_star:hero_star_to_proto/2},
		{?HERO_UPDATE_TYPE_SKILL, fun lib_hero_skill:hero_skill_to_proto/2},
		{?HERO_UPDATE_TYPE_CORPS_STAGE, fun lib_hero_corps:hero_corps_stage_to_proto/2},
		{?HERO_UPDATE_TYPE_CORPS_LEVEL, fun lib_hero_corps:hero_corps_level_to_proto/2},
		{?HERO_UPDATE_TYPE_SKILL_LEARNING, fun lib_hero_skill_learning:skill_learning_to_proto/2},
		{?HERO_UPDATE_TYPE_HONOR_TITLE, fun lib_honor_title:honor_title_to_proto/2},
		{?HERO_UPDATE_TYPE_EQUIP, fun lib_equip_api:equip_to_proto/2},
		{?HERO_UPDATE_TYPE_HALL_INFO, fun lib_holy_spirit_hall_api:hall_to_proto/2},
		{?HERO_UPDATE_SCIENCE, fun lib_player_science:science_to_hero_proto/2},
		{?HERO_UPDATE_INNER_CITY, fun lib_inner_city_api:building_to_proto/2},
		{?HERO_UPDATE_DESTINY, fun lib_hero_destiny:hero_destiny_to_proto/2},
		{?HERO_UPDATE_AWAKEN, fun lib_hero_genius:to_proto/2},
		{?HERO_UPDATE_CROPS_STUDY, fun lib_hero_crops_study_api:hero_crops_study_to_proto/2},
		{?HERO_UPDATE_STAR_INFO, fun lib_star_api:hero_star_info_to_proto/2},
		{?HERO_UPDATE_ASSIST, fun lib_hero_assist:to_proto/2},
		{?HERO_UPDATE_TYPE_FORMATION, fun lib_hero_formation:to_proto/2}

	],

	AllList = [
		?HERO_UPDATE_TYPE_ADD,
		?HERO_UPDATE_TYPE_DEL,
		?HERO_UPDATE_TYPE_ALL
	],

	IsUpdateAll = lists:member(UpdateType, AllList),
	lists:foldl(fun({Type, Function}, Proto) ->
		try
			case IsUpdateAll orelse UpdateType =:= Type of
				false -> Proto;
				true -> Function(Proto, Hero)
			end
		catch
			Reason: Info ->
				?ERROR("hero_to_proto error ~p, ~p ~p:~p, ~p", [Hero#hero.id, Function, Reason, Info, erlang:get_stacktrace()]),
				Proto
		end
	end, #'ProtoHero'{id = Hero#hero.id}, InfoList)
.

hero_type(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> 0;
		_ -> maps:get(hero_type, Conf, 0)
	end
.

hero_name(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> "";
		_ -> language:auto(maps:get(name, Conf, ""))
	end
.

hero_sex(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> 0;
		_ -> maps:get(sex, Conf, 0)
	end
.

hero_quality(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> 0;
		_ -> maps:get(quality, Conf, 0)
	end
.

hero_color(Star) ->
	Star div 6 + ?HERO_COLOR_BLUE
.

hero_corps_type(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> {0, 0};
		_ -> {maps:get(front_corps, Conf, 0), maps:get(back_corps, Conf, 0)}
	end
.

hero_front_corps(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> 0;
		_ -> maps:get(front_corps, Conf, 0)
	end
.

hero_back_corps(HeroId) ->
	Conf = tb_hero:get(HeroId),
	case Conf of
		false -> 0;
		_ -> maps:get(back_corps, Conf, 0)
	end
.

hero_level(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.level
.

hero_star(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.star
.

hero_awaken(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.awaken
.

hero_front_level(HeroId) ->
	Type = hero_front_corps(HeroId),
	lib_barrack_train_api:get_open_soldier_level(Type)
.

hero_back_level(HeroId) ->
	Type = hero_back_corps(HeroId),
	lib_barrack_train_api:get_open_soldier_level(Type)
.

hero_corps_stage(HeroId) ->
	Hero = hero_info(HeroId),
	{Hero#hero.front_stage, Hero#hero.back_stage}
.

hero_front_stage(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.front_stage
.

hero_back_stage(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.back_stage
.

hero_prop(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.prop_dict
.

hero_force(HeroId) ->
	Hero = hero_info(HeroId),
	lib_common:floor(Hero#hero.force)
.

hero_skill_list(HeroId) ->
	Hero = hero_info(HeroId),
	Hero#hero.skill_list
.

hero_base_info(HeroId) ->
	hero_to_hero_base(hero_info(HeroId))
.

is_have_hero(HeroId) ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:is_key(HeroId, PlayerHero#player_hero.hero_dict)
.

active_hero(HeroId, ActiveType) ->
	active_hero(HeroId, ActiveType, ?HERO_AWAKEN_NO)
.
active_hero(HeroId, ActiveType, Awaken) ->
	PlayerHero = lib_hero:get_player_hero(),

	HeroConf = tb_hero:get(HeroId),
	case HeroConf =/= false andalso not dict:is_key(HeroId, PlayerHero#player_hero.hero_dict) of
		false -> skip;
		true ->
			Hero = #hero{id = HeroId, active_type = ActiveType, awaken = Awaken},
			NewDict = dict:store(HeroId, Hero, PlayerHero#player_hero.hero_dict),
			lib_hero:put_player_hero(PlayerHero#player_hero{hero_dict = NewDict}),

			%%激活后有的功能可能需要初始化
			lib_hero:init_hero(HeroId),
			notify_hero_update(HeroId, ?HERO_UPDATE_TYPE_ADD),

			lib_player_process:process_hero_active(HeroId)
	end
.

hero_id_list() ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fold(fun(HeroId, _Hero, List) -> [HeroId | List] end, [], PlayerHero#player_hero.hero_dict)
.
hero_num() ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:size(PlayerHero#player_hero.hero_dict)
.

hero_list() ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fold(fun(_HeroId, Hero, List) -> [Hero | List] end, [], PlayerHero#player_hero.hero_dict)
.

hero_color_num(Color) ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fold(
		fun(_HeroId, Hero, Acc) ->
			case hero_color(Hero#hero.star) >= Color of
				true -> Acc + 1;
				false -> Acc
			end
		end, 0, PlayerHero#player_hero.hero_dict)
.
hero_skill_num(SkillNum, SkillLevel) ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fold(
		fun(_HeroId, Hero, Acc) ->
			Num = maps:fold(
				fun(_, Skill, Acc1) ->
					case Skill#skill.level >= SkillLevel of
						true -> Acc1 + 1;
						false -> Acc1
					end
				end, 0, Hero#hero.skill_learning_map),
			case Num >= SkillNum of
				true -> Acc + 1;
				false -> Acc
			end
		end, 0, PlayerHero#player_hero.hero_dict)
.

hero_info(HeroId) ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fetch(HeroId, PlayerHero#player_hero.hero_dict)
.

best_hero() ->
	PlayerHero = lib_hero:get_player_hero(),
	dict:fold(fun(_HeroId, Hero, Last) -> case Hero#hero.force > Last#hero.force of true -> Hero; false -> Last end end, #hero{}, PlayerHero#player_hero.hero_dict)
.

update_hero(Hero) when is_record(Hero, hero)->
	update_hero(Hero, ?HERO_UPDATE_TYPE_NO_NOTIFY)
.
%%update_hero(HeroId, UpdateType) when is_integer(HeroId) ->
%%	update_hero(hero_info(HeroId), UpdateType)
%%;
update_hero(Hero, UpdateType) when is_record(Hero, hero) ->
	PlayerHero = lib_hero:get_player_hero(),
	case dict:is_key(Hero#hero.id, PlayerHero#player_hero.hero_dict) of
		false -> skip;
		true ->
			NewDict = dict:store(Hero#hero.id, Hero, PlayerHero#player_hero.hero_dict),
			lib_hero:put_player_hero(PlayerHero#player_hero{hero_dict = NewDict}),

			notify_hero_update(Hero, UpdateType)
	end

.

notify_hero_update(_, ?HERO_UPDATE_TYPE_NO_NOTIFY) ->
	skip
;
notify_hero_update([], _) ->
	skip
;
notify_hero_update(Hero, UpdateType) when is_integer(Hero) orelse is_record(Hero, hero) ->
	notify_hero_update([Hero], UpdateType)
;
notify_hero_update([_HeroId | _] = HeroIdList, UpdateType) when is_integer(_HeroId) ->
	HeroList = [lib_hero_api:hero_info(HeroId) || HeroId <- HeroIdList],
	notify_hero_update(HeroList, UpdateType)
;
notify_hero_update([_Hero | _] = HeroList, UpdateType) when is_record(_Hero, hero) ->
	Notify = #'Proto80116001'{
		update_type = UpdateType,
		hero = [hero_to_proto(Hero, UpdateType) || Hero <- HeroList]
	},
	lib_send:respond_to_client(Notify)
.

calc_total_force(HeroList) when is_list(HeroList) ->
	lists:foldl(fun(Hero, Total) ->
		if
			is_record(Hero, hero) -> Hero#hero.force;
			is_record(Hero, hero_base) -> Hero#hero_base.force
		end + Total	
	end, 0, HeroList)
.

hero_to_hero_base(Hero) when is_record(Hero, hero) ->
	#hero_base{
		id = Hero#hero.id,
		level = Hero#hero.level,
		star = Hero#hero.star,
		awaken = Hero#hero.awaken,
		front_level = Hero#hero.front_level,
		back_level = Hero#hero.back_level,
		front_stage = Hero#hero.front_stage,
		back_stage = Hero#hero.back_stage,
		force = Hero#hero.force,
		equip_item_dict = Hero#hero.equip_item_dict,
		skill_list = Hero#hero.skill_list,
		prop_dict = Hero#hero.prop_dict,
		honor_title = Hero#hero.honor_title
	}
.

hero_base_to_proto(HeroBase) when is_record(HeroBase, hero_base) ->
	#'ProtoHeroBase'{
		id = HeroBase#hero_base.id,
		level = HeroBase#hero_base.level,
		star = HeroBase#hero_base.star,
		awaken = HeroBase#hero_base.awaken,
		front_level = HeroBase#hero_base.front_level,
		back_level = HeroBase#hero_base.back_level,
		front_stage = HeroBase#hero_base.front_stage,
		back_stage = HeroBase#hero_base.back_stage,
		force = HeroBase#hero_base.force,
		honor_title = #'ProtoPairLong'{
			key = HeroBase#hero_base.honor_title#hero_title.unique_id,
			value = HeroBase#hero_base.honor_title#hero_title.item_id
		},
		hero_equip = lib_item_api:item_dict_to_proto_item_list(HeroBase#hero_base.equip_item_dict),
		skill_list = HeroBase#hero_base.skill_list,
		hero_base_id =  HeroBase#hero_base.robot_base_id
	}
.

hero_base_to_bson(HeroBase) when is_record(HeroBase, hero_base) ->
	#{
		?BSONSET_INT(id, HeroBase#hero_base.id),
		?BSONSET_INT(robot_base_id, HeroBase#hero_base.robot_base_id),
		?BSONSET_INT(former_type, HeroBase#hero_base.former_type),
		?BSONSET_INT(latter_type, HeroBase#hero_base.latter_type),
		?BSONSET_INT(level, HeroBase#hero_base.level),
		?BSONSET_INT(star, HeroBase#hero_base.star),
		?BSONSET_INT(<<"awaken">>, HeroBase#hero_base.awaken),
		?BSONSET_INT(front_level, HeroBase#hero_base.front_level),
		?BSONSET_INT(back_level, HeroBase#hero_base.back_level),
		?BSONSET_INT(front_stage, HeroBase#hero_base.front_stage),
		?BSONSET_INT(back_stage, HeroBase#hero_base.back_stage),
		?BSONSET_INT(force, HeroBase#hero_base.force),
		?BSONSET_LIST(equip_item, db_equip:equip_to_bson_list(HeroBase#hero_base.equip_item_dict)),
		?BSONSET_LIST(skill_list, HeroBase#hero_base.skill_list),
		?BSONSET_BSON(prop_dict, lib_fight_prop:prop_dict_to_bson(HeroBase#hero_base.prop_dict)),
		?BSONSET_BSON(honor_title, db_player_hero:honor_title_to_bson(HeroBase#hero_base.honor_title))
	}
.

bson_to_hero_base(Bson) ->
	#hero_base{
		id = ?BSON_INT(Bson, id),
		robot_base_id = ?BSON_INT(Bson, robot_base_id),
		former_type = ?BSON_INT(Bson, former_type),
		latter_type = ?BSON_INT(Bson, latter_type),
		level = ?BSON_INT(Bson, level),
		star = ?BSON_INT(Bson, star),
		awaken = ?BSON_INT(Bson, <<"awaken">>),
		front_level = ?BSON_INT(Bson, front_level),
		back_level = ?BSON_INT(Bson, back_level),
		front_stage = ?BSON_INT(Bson, front_stage),
		back_stage = ?BSON_INT(Bson, back_stage),
		force = ?BSON_INT(Bson, force),
		equip_item_dict = db_equip:bson_list_to_equip(?BSON_LIST(Bson, equip_item)),
		skill_list = ?BSON_LIST(Bson, skill_list),
		prop_dict = lib_fight_prop:bson_to_prop_dict(?BSON_BSON(Bson, prop_dict)),
		honor_title = db_player_hero:bson_to_honor_title(?BSON_BSON(Bson, honor_title))
	}
.