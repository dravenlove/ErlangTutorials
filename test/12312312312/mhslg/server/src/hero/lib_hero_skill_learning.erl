%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 12月 2020 18:05
%%%-------------------------------------------------------------------
-module(lib_hero_skill_learning).
-author("13661").

-include("common.hrl").
-include("hero.hrl").
-include("hero_skill.hrl").
-include("chat.hrl").
-include("science.hrl").
-include("ProtoClient_10116.hrl").

-define(BROAD_ID_SKILL_UPGRADE, 1014). %%技能升级广播

-define(LEVEL_CONF_ID(SkillId, Level), SkillId * 1000 + Level).
-define(MAIL_1,	1008).
-define(MAIL_2, 1009).
-define(MAIL_3, 1010).
-define(MAIL_4, 1011).

%% API
-export([
	sign_in/0,
	init_skill_learning/1,
	skill_learning_to_proto/2,
	calc_skill_learning_prop/1,
	update_learning_skill_group/2,
	refresh_skill_number/1,
	refresh_skill_number/2
]).
-export([ %% test
	valid_skill_id_list/1,
	calc_valid_skill_list/1
]).
-export([
	active_skill/5,
	skill_to_proto/1,
	reset_all_skill/2
]).
-export([
	request_active_skill/1,
	request_skill_upgrade/1,
	request_skill_reset/1
]).

skill_to_proto(Skill) when is_record(Skill, skill) ->
	#'ProtoHeroSkill'{
		id = Skill#skill.id,
		level = Skill#skill.level,
		is_active = Skill#skill.is_active,
		active_level = Skill#skill.active_level,
		is_fixed = Skill#skill.is_fixed
	}
.

skill_learning_to_proto(ProtoHero, Hero) ->
	SkillMap = Hero#hero.skill_learning_map,
	ProtoSkillList =
	maps:fold(fun(_SkillId, Skill, List) ->
		[skill_to_proto(Skill) | List]
  	end, [], SkillMap),

	NumberMap = Hero#hero.skill_learning_num_map,
	ProtoNumberList =
	maps:fold(fun(Type, Number, List) ->
		[#'ProtoPairLong'{key = Type, value = Number} | List]
	end, [], NumberMap),

	ProtoHero#'ProtoHero'{
		skill_learning_list = ProtoSkillList,
		skill_learning_number_list = ProtoNumberList
	}
.

skill_info(HeroId, SkillId) ->
	Hero = lib_hero_api:hero_info(HeroId),
	maps:get(SkillId, Hero#hero.skill_learning_map, #skill{id = SkillId})
.

update_skill(HeroId, Skill, IsNotify) when is_record(Skill, skill) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillMap = Hero#hero.skill_learning_map,
	NewMap = maps:put(Skill#skill.id, Skill, SkillMap),
	lib_hero_api:update_hero(Hero#hero{skill_learning_map = NewMap}),

	case IsNotify of
		false -> skip;
		true ->
			Notify = #'Proto80116041'{
				hero_id = HeroId,
				skill = skill_to_proto(Skill)
			},
			?INFO("Notify ~p",[Notify]),
			lib_send:respond_to_client(Notify)
	end
.

delete_skill(HeroId, Skill) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillMap = Hero#hero.skill_learning_map,
	NewMap = maps:remove(Skill#skill.id, SkillMap),
	lib_hero_api:update_hero(Hero#hero{skill_learning_map = NewMap}),
	Notify = #'Proto80116041'{
		hero_id = HeroId,
		skill = skill_to_proto(Skill)
	},

	lib_send:respond_to_client(Notify)

.


update_skill_number(HeroId, NumberMap, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(Hero#hero{skill_learning_num_map = NumberMap}),

	ProtoNumberList =
	maps:fold(fun(Type, Number, List) ->
		[#'ProtoPairLong'{key = Type, value = Number} | List]
  	end, [], NumberMap),

	case IsNotify of
		false -> skip;
		true ->
			Notify = #'Proto80116042'{
				number_list = ProtoNumberList,
				hero_id = HeroId
			},
			lib_send:respond_to_client(Notify)
	end
.

active_skill(Type, HeroId, SkillId, SkillLevel, IsNotify) ->
	try
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), -1),
		Skill = skill_info(HeroId, SkillId),
		?JUDGE_RETURN(not Skill#skill.is_active, -1),
		update_skill(HeroId, #skill{
			id = SkillId,
			level = SkillLevel,
			is_active = true,
			active_type = Type,
			active_level = SkillLevel,
			is_fixed = Type =/= ?ACTIVE_TYPE_PLAYER
		}, IsNotify)
	catch
	   throw: {error, _} -> skip
	end
.

init_max_level(_HeroId, SkillId) ->
	Conf = tb_hero_skill:get(SkillId),
	maps:get(max_level, Conf)
.
skill_max_level(HeroId, SkillId) ->
	InitLevel = init_max_level(HeroId, SkillId),
	InitLevel + science_add_level(SkillId)
.

science_add_level(SkillId) ->
	Conf = tb_hero_skill:get(SkillId),
	Type = maps:get(type, Conf),
	lib_player_science_api:get_effect_value(?EFFECT_TYPE_SKILL_LEARNING_MAX_LEVEL_ADD,Type)
.

skill_max_number(HeroId, SkillType) ->
	Hero = lib_hero_api:hero_info(HeroId),
	NumberMap = Hero#hero.skill_learning_num_map,
	maps:get(SkillType, NumberMap, 0)
.

skill_cur_number(HeroId, SkillType) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillMap = Hero#hero.skill_learning_map,
	maps:fold(fun(SkillId, Skill, Acc) ->
		Conf = tb_hero_skill:get(SkillId),
		Type = maps:get(type, Conf),
		case Skill#skill.is_active andalso Type =:= SkillType of
			false -> Acc;
			true -> Acc + 1
		end
  	end, 0, SkillMap)
.

sign_in() ->
	refresh_skill_number(false),
	refresh_fixed_skill()
.

init_skill_learning(HeroId) ->
	refresh_skill_number(HeroId, false),
	refresh_fixed_skill(HeroId)
.

valid_skill_id_list(HeroId) ->
	case lib_hero_api:is_have_hero(HeroId) of
		false -> [];
		true ->
			SkillList = calc_valid_skill_list(lib_hero_api:hero_info(HeroId)),
			lists:foldr(fun(Skill, List) -> 
				[Skill#skill.id | List]
			end, [], SkillList)
	end
.

calc_valid_skill_list(Hero) ->
	SkillMap = Hero#hero.skill_learning_map,
	NumberMap = Hero#hero.skill_learning_num_map,
	TypeMap =
	maps:fold(fun(SkillId, Skill, Map) ->
		case Skill#skill.is_active of
			false -> Map;
			true ->
				Conf = tb_hero_skill:get(SkillId),
				Type = maps:get(type, Conf),
				List = maps:get(Type, Map, []),
				maps:put(Type, [Skill | List], Map)
		end
	end, maps:new(), SkillMap),

	SkillList =
	maps:fold(fun(Type, List, Acc) ->
		MaxNumber = maps:get(Type, NumberMap, 0),
		{FixedSkillList, CommonSkillList} = lists:partition(fun(Skill) -> Skill#skill.is_fixed end, List),

		LeftNumber = max(MaxNumber - length(FixedSkillList), 0),
		lists:sublist(lists:sort(fun(L, R) ->
			try
				?JUDGE_RETURN(L#skill.level =:= R#skill.level, L#skill.level > R#skill.level),
				L#skill.id > R#skill.id
			catch
			    throw: {error, Flag} -> Flag
			end
		end, CommonSkillList), LeftNumber) ++ FixedSkillList ++ Acc
	end, [], TypeMap),

	lists:filter(fun(Skill) ->
		SKillId = Skill#skill.id,
		Conf = tb_hero_skill:get(SKillId),
		%%四维判断
		NeedPropDict = lib_fight_prop:cfg_prop_dict_from_conf(Conf),
		HeroPropDict = Hero#hero.prop_dict,

		lib_common:dict_fold(fun(NeedPropName, NeedPropVal, Flag) ->
			?JUDGE_CONTINUE(NeedPropVal > 0, Flag),
			HeroPropVal = lib_fight_prop:get_prop(NeedPropName, HeroPropDict),
			?JUDGE_BREAK(HeroPropVal >= NeedPropVal, false),
			Flag
		end, true, NeedPropDict)
 	end, SkillList)
.

calc_skill_learning_prop(Hero) ->
	SkillList = calc_valid_skill_list(Hero),
	lists:foldl(fun(Skill, Dict) ->
		SkillId = ?LEVEL_CONF_ID(Skill#skill.id, Skill#skill.level),
		LevelConf = tb_hero_skill_level:get(SkillId),
		SkillProp = lib_fight_prop:cfg_prop_dict_from_conf(LevelConf),
%%		SkillConf = tb_skill:get(SkillId),
%%		SkillProp2 = lib_fight_prop:cfg_prop_dict_from_conf(SkillConf),
		lib_fight_prop:increase_prop([Dict, SkillProp])
	end, dict:new(), SkillList)
.

update_learning_skill_group(HeroId, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillList = calc_valid_skill_list(Hero),

	FightSkillList =
	lists:foldl(fun(Skill, List) ->
		Conf = tb_hero_skill_level:get(?LEVEL_CONF_ID(Skill#skill.id, Skill#skill.level)),
		FightSkillId = maps:get(skill_id, Conf, 0),
		case FightSkillId of
			0 -> List;
			_ -> [FightSkillId | List]
		end
	end, [], SkillList),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_GROUP_LEARNING, HeroId, FightSkillList, IsNotify)
.

init_fixed_skill(HeroId) ->
	Conf = tb_hero:get(HeroId),
	FixedSkillList = maps:get(fixed_skill_list, Conf, []),
	lists:map(fun([SkillId, Level]) ->
		active_skill(?ACTIVE_TYPE_INIT, HeroId, SkillId, Level, false)
  	end, FixedSkillList)
.
refresh_fixed_skill() ->
	HeroIdList = lib_hero_api:hero_id_list(),
	lists:map(fun(HeroId) ->
		refresh_fixed_skill(HeroId)
  	end, HeroIdList)
.
refresh_fixed_skill(HeroId) ->
	init_fixed_skill(HeroId)
.

refresh_skill_number(IsNotify)->
	HeroIdList = lib_hero_api:hero_id_list(),

	lists:map(fun(HeroId) ->
		refresh_skill_number(HeroId, IsNotify)
  	end, HeroIdList)
.
refresh_skill_number(HeroId, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	OldNumberMap = Hero#hero.skill_learning_num_map,

	NewNumberMap =
	lists:foldl(fun(Type, Map)->
		Number = calc_skill_num(HeroId, Type),
		maps:put(Type, Number, Map)
	end, maps:new(), tb_hero_skill_type:get_list()),

	HaveUpdate =
	lib_common:map_fold(fun(Type, Number, Flag) ->
		OldNumber = maps:get(Type, OldNumberMap, 0),
		?JUDGE_BREAK(OldNumber =:= Number, true),
		Flag
	end, false, NewNumberMap),

	case HaveUpdate of
		false -> skip;
		true ->
			update_skill_number(HeroId, NewNumberMap, IsNotify),
			lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
			update_learning_skill_group(HeroId, IsNotify)
	end
.

calc_skill_num(HeroId, Type) ->
	TypeConf = tb_hero_skill_type:get(Type),
	MaxNumber = maps:get(number, TypeConf),
	DefNumber = maps:get(def_number, TypeConf),

	ConfGet =
	case Type of
		?SKILL_TYPE_HERO -> fun tb_hero_skill_num_hero:get/1;
		_ -> fun tb_hero_skill_num:get/1
	end,

	HeroQuality = lib_hero_api:hero_quality(HeroId),
	ConfType =
	case HeroQuality of
		?HERO_QUALITY_WAR_GOD -> 2;
		_ -> 1
	end,

	HeroLevel = lib_hero_api:hero_level(HeroId),
	HeroStar = lib_hero_api:hero_star(HeroId),
	HeroSex = lib_hero_api:hero_sex(HeroId),
	lib_common:fold(fun(Index, Acc) ->
		ConfId =
		case Type of
			?SKILL_TYPE_HERO -> ConfType * 100 + Index;
			_ -> Type * 100 + Index
		end,
		Conf = ConfGet(ConfId),
		CondType = maps:get(cond_type, Conf),

		Ret =
		case CondType of
			?SKILL_NUM_COND_TYPE_LEVEL ->
				NeedLevel = maps:get(level, Conf, 0),
				HeroLevel >= NeedLevel;
			?SKILL_NUM_COND_TYPE_STAR ->
				NeedStar = maps:get(star, Conf, 0),
				HeroStar >= NeedStar;
			?SKILL_NUM_COND_TYPE_SCIENCE ->
				[ScienceId, NeedLevel] = maps:get(?IIF(HeroSex =:= ?HERO_SEX_MAN, man_tech, woman_tech), Conf, [0,0]),
				ScienceLevel = lib_player_science_api:science_level(ScienceId),
				ScienceId =:= 0 orelse ScienceLevel >= NeedLevel;
			_ -> false
		end,

		?IIF(Ret, Acc + 1, Acc)
	end, DefNumber, 1, MaxNumber)
.

request_active_skill(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_106), ?INFO("功能未开启")),
	#'Proto10116041'{
		hero_id = HeroId,
		skill_id = SkillId
	} = Msg,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

	Conf = tb_hero_skill:get(SkillId),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	Skill = skill_info(HeroId, SkillId),
	?JUDGE_RETURN(not Skill#skill.is_active, ?ERROR_CLIENT_OPERATOR),

	%%英雄类型判断
	SkillHeroType = maps:get(hero_type, Conf),
	HeroType = lib_hero_api:hero_type(HeroId),

	HeroTypeRet =
	case SkillHeroType of
		?SKILL_HERO_TYPE_NO_LIMIT -> true;
		?SKILL_HERO_TYPE_WISDOM -> HeroType =:= ?HERO_TYPE_WISDOM;
		?SKILL_HERO_TYPE_VALIANT -> HeroType =:= ?HERO_TYPE_VALIANT;
		?SKILL_HERO_TYPE_BALANCE -> HeroType =:= ?HERO_TYPE_BALANCE;
		?SKILL_HERO_TYPE_WISDOM_OR_BALANCE -> HeroType =:= ?HERO_TYPE_WISDOM orelse HeroType =:= ?HERO_TYPE_BALANCE;
		?SKILL_HERO_TYPE_VALIANT_OR_BALANCE -> HeroType =:= ?HERO_TYPE_VALIANT orelse HeroType =:= ?HERO_TYPE_BALANCE
	end,
	?JUDGE_RETURN(HeroTypeRet, ?ERROR_CLIENT_OPERATOR),

	%%英雄性别判断
	NeedSex = maps:get(sex, Conf),
	HeroSex = lib_hero_api:hero_sex(HeroId),
	?JUDGE_RETURN(NeedSex =:= 0 orelse HeroSex =:= NeedSex, ?ERROR_CLIENT_OPERATOR),

	%%技能位判断
	SkillType = maps:get(type, Conf),
	MaxSkillNum = skill_max_number(HeroId, SkillType),
	CurSkillNum = skill_cur_number(HeroId, SkillType),
	?JUDGE_RETURN(CurSkillNum < MaxSkillNum, ?ERROR_CLIENT_OPERATOR),

	%%四维判断
	case lib_hero_genius:is_type(HeroId, 6) of
		true -> skip;
		false ->
			NeedPropDict = lib_fight_prop:cfg_prop_dict_from_conf(Conf),
			HeroPropDict = lib_hero_api:hero_prop(HeroId),
			lib_common:dict_map(
				fun(NeedPropName, NeedPropVal) ->
					?JUDGE_CONTINUE(NeedPropVal > 0),
					HeroPropVal = lib_fight_prop:get_prop(NeedPropName, HeroPropDict),
					?JUDGE_RETURN(HeroPropVal >= NeedPropVal, ?ERROR_CLIENT_OPERATOR)
				end, NeedPropDict)
	end,

	%%消耗判断
	FragmentId = maps:get(fragment_id, Conf),
	FragmentNum = maps:get(fragment_num, Conf),
	ResourceId = maps:get(resource_id, Conf),
	ResourceNum = maps:get(resource_num, Conf),
	CostItemList = [?ITEM_OBJ(FragmentId, FragmentNum), ?ITEM_OBJ(ResourceId, ResourceNum)],
	Ret = lib_player_pack:validate_remove(CostItemList),
	?PACK_IS_SUCCESS(Ret),

	lib_player_pack:auto_remove(CostItemList, ?REMOVE_SERIAL(?USE_SKILL_LEARNING_ACTIVE, 0)),

	active_skill(?ACTIVE_TYPE_PLAYER, HeroId, SkillId, 1, true),
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
	update_learning_skill_group(HeroId, true),
	lib_player_process:process_skill_active(HeroId),

	Respond = #'Proto50116041'{
		hero_id = HeroId,
		skill_id = SkillId
	},
	lib_send:respond_to_client(Respond)
.

request_skill_upgrade(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_106), ?INFO("功能未开启")),

	#'Proto10116042'{
		hero_id = HeroId,
		skill_id = SkillId
	} = Msg,

	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

	Conf = tb_hero_skill:get(SkillId),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	Skill = skill_info(HeroId, SkillId),
	?JUDGE_RETURN(Skill#skill.is_active, ?ERROR_CLIENT_OPERATOR),

	CurLevel = Skill#skill.level,
	LevelConf = tb_hero_skill_level:get(?LEVEL_CONF_ID(SkillId, CurLevel)),
	?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	MaxLevel = skill_max_level(HeroId, SkillId),
	?JUDGE_RETURN(CurLevel < MaxLevel, ?ERROR_CLIENT_OPERATOR),

	NeedChapter = maps:get(need_chapter, LevelConf, 0),
	?JUDGE_RETURN(NeedChapter =:= 0 orelse lib_player_chapter:is_full_star_pass_chapter(NeedChapter), ?ERROR_CLIENT_OPERATOR),

	FragmentId = maps:get(fragment_id, Conf),
	FragmentNum = maps:get(fragment_num, LevelConf),
	ResourceId = maps:get(resource_id, Conf),
	ResourceNum = maps:get(resource_num, LevelConf),
	CostItemList = [?ITEM_OBJ(FragmentId, FragmentNum), ?ITEM_OBJ(ResourceId, ResourceNum)],
	Ret = lib_player_pack:validate_remove(CostItemList),
	?PACK_IS_SUCCESS(Ret),

	lib_player_pack:auto_remove(CostItemList, ?REMOVE_SERIAL(?USE_SKILL_LEARNING_UPGRADE, 0)),

	NewLevel = CurLevel + 1,

	update_skill(HeroId, Skill#skill{level = NewLevel}, true),
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
	update_learning_skill_group(HeroId, true),

	Respond = #'Proto50116042'{
		hero_id = HeroId,
		skill_id = SkillId,
		level = NewLevel
	},
	lib_send:respond_to_client(Respond),
	
	NextLevelConf = tb_hero_skill_level:get(?LEVEL_CONF_ID(SkillId, NewLevel)),
	case NextLevelConf =/= false andalso maps:get(is_radio, NextLevelConf, 0) =:= 1 of
		false -> skip;
		true ->
			Shout1 = lib_broadcast_api:create_broadcast(?BROAD_ID_SKILL_UPGRADE),
			Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_COUNTRY_ID, lib_player:player_country()),
			PlayerId = lib_player:player_id(),
			PlayerName = lib_player:player_name(),
			BroadRole = #'ProtoBroadRole'{role_id = PlayerId, role_name = PlayerName},
			Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_ROLE_INFO, BroadRole),
			Shout4 = lib_broadcast_api:push_broad_arg(Shout3, ?BROAD_TYPE_HERO_BASE, #'ProtoBroadHero'{player_id = PlayerId, hero_id = HeroId}),
			Shout5 = lib_broadcast_api:push_broad_arg(Shout4, ?BROAD_TYPE_HERO_SKILL, skill_info(HeroId, SkillId)),
			Shout6 = lib_broadcast_api:push_broad_arg(Shout5, ?BROAD_TYPE_NUM, NewLevel),
			lib_broadcast_api:send_all_system(Shout6)
	end,

	lib_player_process:process_skill_upgrade(HeroId)
.

reset_all_skill(HeroId, Type) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillMap = Hero#hero.skill_learning_map,
	
	InsertItems = 
	lib_common:map_fold(fun(SkillId, _, List) -> 
		{Ret, _, InsertItems} = validate_reset(HeroId, SkillId, Type),
		?JUDGE_CONTINUE(Ret =:= true),
		reset(HeroId, SkillId, Type, true),
		InsertItems ++ List
	end, [], SkillMap),

	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
	update_learning_skill_group(HeroId, true),

	InsertItems
.

-define(RESET_TYPE_COMMON, 	1).
-define(RESET_TYPE_HIGH,	2).
validate_reset(HeroId, SkillId, Type) ->
	try 
		?JUDGE_RETURN(Type =:= ?RESET_TYPE_COMMON orelse Type =:= ?RESET_TYPE_HIGH, ?ERROR_INVALID_PARAM),
		?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

		Conf = tb_hero_skill:get(SkillId),
		?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

		Skill = skill_info(HeroId, SkillId),
		CurLevel = Skill#skill.level,
		?JUDGE_RETURN(Skill#skill.is_active, ?ERROR_CLIENT_OPERATOR),
		?JUDGE_RETURN(not Skill#skill.is_fixed orelse CurLevel > Skill#skill.active_level, ?ERROR_CLIENT_OPERATOR),

		LevelConf = tb_hero_skill_level:get(?LEVEL_CONF_ID(SkillId, CurLevel)),
		?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

		CostItem = 
		case Type of
			?RESET_TYPE_COMMON -> [];
			?RESET_TYPE_HIGH ->
				CostId = maps:get(reset_id, Conf),
				CostNum = maps:get(reset_num, LevelConf),
				[?ITEM_OBJ(CostId, CostNum)]
		end,

		FragmentId = maps:get(fragment_id, Conf),
		ResourceId = maps:get(resource_id, Conf),
		ActiveFragmentNum = maps:get(fragment_num, Conf),
		ActiveResourceNum = maps:get(resource_num, Conf),
		LevelFragmentNum = maps:get(reset_reward_fragment, LevelConf),
		LevelResourceNum = maps:get(reset_reward_resource, LevelConf),

		{FragmentNum, ResourceNum} =
		case Skill#skill.is_fixed of
			false -> {ActiveFragmentNum + LevelFragmentNum, ActiveResourceNum + LevelResourceNum};
			true ->
				SubLevelConf = tb_hero_skill_level:get(?LEVEL_CONF_ID(SkillId, Skill#skill.active_level)),
				SubFragmentNum = maps:get(reset_reward_fragment, SubLevelConf),
				SubResourceNum = maps:get(reset_reward_resource, SubLevelConf),
				{LevelFragmentNum - SubFragmentNum, LevelResourceNum - SubResourceNum}
		end,
		{AddFragmentNum, AddResourceNum} =
		case Type of
			?RESET_TYPE_COMMON ->
				{lib_common:ceil(FragmentNum / 2), lib_common:ceil(ResourceNum / 2)};
			?RESET_TYPE_HIGH ->
				{FragmentNum, ResourceNum}
		end,
		RewardItemObjList = [?ITEM_OBJ(FragmentId, AddFragmentNum), ?ITEM_OBJ(ResourceId, AddResourceNum)],
		?DEBUG("RewardItemObjList ~p",[RewardItemObjList]),
		{true, CostItem, RewardItemObjList}
	catch
		throw: {error, ErrCode} -> {ErrCode, [], []}
	end
.

reset(HeroId, SkillId, _Type, IsNotify) ->
	Skill = skill_info(HeroId, SkillId),
	case Skill#skill.is_fixed of
		false ->
			delete_skill(HeroId,Skill#skill{
				level = 0
			});
		true ->
			update_skill(HeroId, Skill#skill{
				is_active = true,
				level = Skill#skill.active_level
			}, IsNotify)
	end
.

request_skill_reset(Msg) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_106), ?INFO("功能未开启")),
	#'Proto10116043'{
		hero_id = HeroId,
		skill_id = SkillId,
		type = Type
	} = Msg,

	% ?JUDGE_RETURN(Type =:= ?RESET_TYPE_COMMON orelse Type =:= ?RESET_TYPE_HIGH, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),

	% Conf = tb_hero_skill:get(SkillId),
	% ?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	Skill = skill_info(HeroId, SkillId),
	CurLevel = Skill#skill.level,
	% ?JUDGE_RETURN(Skill#skill.is_active, ?ERROR_CLIENT_OPERATOR),
	% ?JUDGE_RETURN(not Skill#skill.is_fixed orelse CurLevel > Skill#skill.active_level, ?ERROR_CLIENT_OPERATOR),

	% LevelConf = tb_hero_skill_level:get(?LEVEL_CONF_ID(SkillId, CurLevel)),
	% ?JUDGE_RETURN(LevelConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

	% case Type of
	% 	?RESET_TYPE_COMMON -> skip;
	% 	?RESET_TYPE_HIGH ->
	% 		CostId = maps:get(reset_id, Conf),
	% 		CostNum = maps:get(reset_num, LevelConf),
	% 		CostItem = ?ITEM_OBJ(CostId, CostNum),
	% 		Ret = lib_player_pack:validate_remove(CostItem),
	% 		?PACK_IS_SUCCESS(Ret),

	% 		lib_player_pack:auto_remove(CostItem, ?REMOVE_SERIAL(?USE_SKILL_LEARNING_RESET, 0))
	% end,

	% FragmentId = maps:get(fragment_id, Conf),
	% ResourceId = maps:get(resource_id, Conf),
	% ActiveFragmentNum = maps:get(fragment_num, Conf),
	% ActiveResourceNum = maps:get(resource_num, Conf),
	% LevelFragmentNum = maps:get(reset_reward_fragment, LevelConf),
	% LevelResourceNum = maps:get(reset_reward_resource, LevelConf),

	% {FragmentNum, ResourceNum} =
	% case Skill#skill.is_fixed of
	% 	false -> {ActiveFragmentNum + LevelFragmentNum, ActiveResourceNum + LevelResourceNum};
	% 	true ->
	% 		SubLevelConf = tb_hero_skill_level:get(?LEVEL_CONF_ID(SkillId, Skill#skill.active_level)),
	% 		SubFragmentNum = maps:get(reset_reward_fragment, SubLevelConf),
	% 		SubResourceNum = maps:get(reset_reward_resource, SubLevelConf),
	% 		{LevelFragmentNum - SubFragmentNum, LevelResourceNum - SubResourceNum}
	% end,
	% {AddFragmentNum, AddResourceNum} =
	% case Type of
	% 	?RESET_TYPE_COMMON ->
	% 		{lib_common:ceil(FragmentNum / 2), lib_common:ceil(ResourceNum / 2)};
	% 	?RESET_TYPE_HIGH ->
	% 		{FragmentNum, ResourceNum}
	% end,
	% RewardItemObjList = [?ITEM_OBJ(FragmentId, AddFragmentNum), ?ITEM_OBJ(ResourceId, AddResourceNum)],
	% RewardItemList = lib_item_api:item_obj_list_to_pack_item_list(RewardItemObjList),

	{Ret, RemoveItems, RewardItemObjList} = validate_reset(HeroId, SkillId, Type),
	?JUDGE_RETURN(Ret, Ret),
	case RemoveItems of
		[] -> skip;
		_  ->	PackRet = lib_player_pack:validate_remove(RemoveItems),
			?PACK_IS_SUCCESS(PackRet),

			lib_player_pack:auto_remove(RemoveItems, ?REMOVE_SERIAL(?USE_SKILL_LEARNING_RESET, 0))
	end,
	% {NewLevel, IsActive} =
	% case Skill#skill.is_fixed of
	% 	false -> {0, false};
	% 	true -> {Skill#skill.active_level, true}
	% end,
	% update_skill(HeroId, Skill#skill{
	% 	is_active = IsActive,
	% 	level = NewLevel
	% }, true),
	% lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
	% update_learning_skill_group(HeroId, true),

	reset(HeroId, SkillId, Type, true),

	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_TYPE_SKILL_LEARNING),
	update_learning_skill_group(HeroId, true),

	NewSkill = skill_info(HeroId, SkillId),
	NewLevel = NewSkill#skill.level,
	IsActive = NewSkill#skill.is_active,

	Respond = #'Proto50116043'{
		hero_id = HeroId,
		skill_id = SkillId,
		type = Type,
		is_active = IsActive,
		level = NewLevel
	},
	lib_send:respond_to_client(Respond),

	RewardItemList = lib_item_api:item_obj_list_to_pack_item_list(RewardItemObjList),
	Mail1 = lib_mail_api:create_sys_mail(?ADD_SKILL_LEARNING_RESET),
	Mail2 = lib_mail_api:add_item_list(Mail1, RewardItemList),
	Mail3 = lib_mail_api:push_mail_arg(Mail2, ?MAIL_ARG_TYPE_INT_NUMBER, CurLevel),
	Mail4 = lib_mail_api:push_mail_arg(Mail3, ?MAIL_ARG_TYPE_HERO_SKILL_NAME, SkillId),

	Mail7 =
	if
		Type =:= ?RESET_TYPE_COMMON, not Skill#skill.is_fixed ->
			lib_mail_api:set_font_id(Mail4, ?MAIL_1);
		Type =:= ?RESET_TYPE_COMMON, Skill#skill.is_fixed ->
			Mail5 = lib_mail_api:push_mail_arg(Mail4, ?MAIL_ARG_TYPE_INT_NUMBER, Skill#skill.active_level),
			Mail6 = lib_mail_api:push_mail_arg(Mail5, ?MAIL_ARG_TYPE_HERO_SKILL_NAME, SkillId),
			lib_mail_api:set_font_id(Mail6, ?MAIL_2);
		Type =:= ?RESET_TYPE_HIGH, not Skill#skill.is_fixed ->
			lib_mail_api:set_font_id(Mail4, ?MAIL_3);
		Type =:= ?RESET_TYPE_HIGH, Skill#skill.is_fixed ->
			Mail5 = lib_mail_api:push_mail_arg(Mail4, ?MAIL_ARG_TYPE_INT_NUMBER, Skill#skill.active_level),
			Mail6 = lib_mail_api:push_mail_arg(Mail5, ?MAIL_ARG_TYPE_HERO_SKILL_NAME, SkillId),
			lib_mail_api:set_font_id(Mail6, ?MAIL_4)
	end,
	lib_mail_api:send(Mail7, lib_player:player_id())
.