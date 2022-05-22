%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 15. Jun 2021 4:59 PM
%%%-------------------------------------------------------------------
-module(lib_hero_assist).
-author("lichaoyu").
-include("common.hrl").
-include("hero.hrl").
-include("science.hrl").
-include("hero_skill.hrl").
-include("ProtoClient_10116.hrl").

%% API
-export([
	new/0,
	assist_to_bson/1,
	bson_to_assist/1,
	is_assist/1,			%% 是否副将
	is_main/1,				%% 是否主将
	to_proto/2,
	update_assist_prop/1,
	update_skill_group/2,
	calc_assist_prop/1,
	hero_is_assist/1,				%% 是否副将
	update_assist/1,			%% 副将更新时，更新主将属性

	request_hero_assist/1,
	request_cancel_hero_assist/1
]).
-export([
	reset/1			%% 重置英雄助战
]).

-define(ASSIST_FORMER,		1).	%% 助战前军
-define(ASSIST_LATTER,		2).	%% 助战后军

-define(HERO_ASSIST_HERO_SKILL_ID(Type, HeroType, Level),	(Type * 10 + HeroType) * 1000 + Level).
-define(HERO_ASSIST_ARMS_SKILL_ID(Type, Level),		Type * 1000 + Level).

-define(DEFINE_ASSIST,		0).	%% 默认
-record(assist, {	%% 助战英雄
	hero_id = 0,			%% 英雄
	awaken = 0,				%% 觉醒
	star = 0,				%% 星级
	hero_skill_level = 0,	%% 英雄技能总等级
	arms_skill_level = 0,	%% 兵种技能总等级
	equip_power = 0			%% 装备评分
}).

new() ->
	{?DEFINE_ASSIST, ?DEFINE_ASSIST}
.

assist_to_bson(AssistTuple) ->
	AssistList = tuple_to_list(AssistTuple),
	[to_bson(Assist) || Assist <- AssistList]
.
to_bson(Int) when is_integer(Int) ->
	Int
;
to_bson(Assist) ->
	#{
		?BSONSET_INT(<<"hero_id">>, Assist#assist.hero_id),
		?BSONSET_INT(<<"awaken">>, Assist#assist.awaken),
		?BSONSET_INT(<<"star">>, Assist#assist.star),
		?BSONSET_INT(<<"hero_skill_level">>, Assist#assist.hero_skill_level),
		?BSONSET_INT(<<"arms_skill_level">>, Assist#assist.arms_skill_level),
		?BSONSET_INT(<<"equip_power">>, Assist#assist.equip_power)
	}
.
bson_to_assist([]) -> new();
bson_to_assist(BsonList) ->
	AssistList = [to_assist(Bson) || Bson <- BsonList],
	list_to_tuple(AssistList)
.
to_assist(Int) when is_integer(Int) ->
	Int
;
to_assist(Bson) ->
	#assist{
		hero_id = ?BSON_INT(Bson, <<"hero_id">>),
		awaken = ?BSON_INT(Bson, <<"awaken">>),
		star = ?BSON_INT(Bson, <<"star">>),
		hero_skill_level = ?BSON_INT(Bson, <<"hero_skill_level">>),
		arms_skill_level = ?BSON_INT(Bson, <<"arms_skill_level">>),
		equip_power = ?BSON_INT(Bson, <<"equip_power">>)
	}
.

to_proto(ProtoHero, Hero) ->
	Assist = tuple_to_list(Hero#hero.assist),
	ProtoHero#'ProtoHero'{
		assist = [to_proto(X) || X <- Assist]
	}
.
to_proto(H) when is_integer(H) ->
	#'ProtoHeroAssist'{hero_id = H}
;
to_proto(Assist) ->
	#'ProtoHeroAssist'{
		hero_id = Assist#assist.hero_id,
		awaken = Assist#assist.awaken,
		star = Assist#assist.star,
		hero_skill_level = Assist#assist.hero_skill_level,
		arms_skill_level = Assist#assist.arms_skill_level
	}
.

update_assist_prop(HeroId) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_ASSIST),
	lib_hero_skill:update_fight_skill_list(HeroId, true)
.

update_skill_group(HeroId, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillList = calc_assist_skill(Hero),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_ASSIST, HeroId, SkillList, IsNotify)
.

calc_assist_prop(Hero) ->
	Assist = Hero#hero.assist,
	FormerProp = calc_one_assist_prop(Hero, {?ASSIST_FORMER, element(?ASSIST_FORMER, Assist)}),
	LaterProp = calc_one_assist_prop(Hero, {?ASSIST_LATTER, element(?ASSIST_LATTER, Assist)}),
	lib_fight_prop:increase_prop([FormerProp, LaterProp])
.
calc_one_assist_prop(_Hero, {_Type, Int}) when is_integer(Int) ->
	lib_fight_prop:cfg_prop_dict_from_conf(#{})
;
calc_one_assist_prop(Hero, {Type, Assist}) ->
	AssistHeroId = Assist#assist.hero_id,
	PropConf0 =
		case Assist#assist.hero_skill_level of
			0 -> #{};
			HeroSkillLevel ->
				AssistHeroType = lib_hero_api:hero_type(AssistHeroId),
				tb_hero_assist_hero_skill:get(?HERO_ASSIST_HERO_SKILL_ID(Type, AssistHeroType, HeroSkillLevel))
		end,
	Prop0 = lib_fight_prop:cfg_prop_dict_from_conf(PropConf0),
	PropConf1 =
		case Assist#assist.arms_skill_level of
			0 -> #{};
			ArmsSkillLevel ->
				HeroId = Hero#hero.id,
				ArmsType = case Type of ?ASSIST_FORMER -> lib_hero_api:hero_front_corps(HeroId); ?ASSIST_LATTER -> lib_hero_api:hero_back_corps(HeroId) end,
				tb_hero_assist_arms_skill:get(?HERO_ASSIST_ARMS_SKILL_ID(ArmsType, ArmsSkillLevel))
		end,
	Prop1 = lib_fight_prop:cfg_prop_dict_from_conf(PropConf1),
	Prop2 = lib_hero_genius:calc_assist_genius_prop({AssistHeroId, Assist#assist.awaken, Assist#assist.star}),
	lib_fight_prop:increase_prop([Prop0, Prop1, Prop2])
.

calc_assist_skill(Hero) ->
	Assist = Hero#hero.assist,
	FormerSKill = calc_one_assist_skill(Hero, {?ASSIST_FORMER, element(?ASSIST_FORMER, Assist)}),
	LaterSKill = calc_one_assist_skill(Hero, {?ASSIST_LATTER, element(?ASSIST_LATTER, Assist)}),
	lib_fight_prop:increase_skill([FormerSKill, LaterSKill])
.
calc_one_assist_skill(_Hero, {_Type, Int}) when is_integer(Int) ->
	[]
;
calc_one_assist_skill(Hero, {Type, Assist}) ->
	AssistHeroId = Assist#assist.hero_id,
	Skill0 =
		case Assist#assist.hero_skill_level of
			0 -> [];
			HeroSkillLevel ->
				AssistHeroType = lib_hero_api:hero_type(AssistHeroId),
				HeroConf = tb_hero_assist_hero_skill:get(?HERO_ASSIST_HERO_SKILL_ID(Type, AssistHeroType, HeroSkillLevel)),
				[maps:get(skill, HeroConf)]
		end,
	Skill1 =
		case Assist#assist.arms_skill_level of
			0 -> Skill0;
			ArmsSkillLevel ->
				HeroId = Hero#hero.id,
				ArmsType = case Type of ?ASSIST_FORMER -> lib_hero_api:hero_front_corps(HeroId); ?ASSIST_LATTER -> lib_hero_api:hero_back_corps(HeroId) end,
				ArmsConf = tb_hero_assist_arms_skill:get(?HERO_ASSIST_ARMS_SKILL_ID(ArmsType, ArmsSkillLevel)),
				[maps:get(skill, ArmsConf) | Skill0]
		end,
	Skill2 =
		case Assist#assist.equip_power of
			0 -> Skill1;
			Power ->
				PowerConf =
					case tb_power_add_skill:get(Power div 100) of
						false -> lists:last(tb_power_add_skill:get_list());
						PowerConf0 -> PowerConf0
					end,
				[maps:get(skill, PowerConf) | Skill1]
		end,
	lib_hero_genius:calc_assist_genius_skill({AssistHeroId, Assist#assist.awaken}) ++ Skill2
.


calc_assist_hero(HeroId) ->
	#hero{
		skill_learning_map = SkillLearningMap,
		equip_item_dict = EquipItemDict
	} = Hero = lib_hero_api:hero_info(HeroId),
	{HeroLevel, ArmsLevel} = maps:fold(
		fun(_, Skill, {Hl, Al} = El) ->
			Conf = tb_hero_skill:get(Skill#skill.id),
			Type = maps:get(type, Conf),
			if
				Type =:= ?SKILL_TYPE_HERO -> {Hl + Skill#skill.level, Al};
				Type =< ?SKILL_TYPE_MAGICIAN -> {Hl, Al + Skill#skill.level};
				true -> El
			end
		end, {0, 0}, SkillLearningMap),
	HeroLimit = hero_skill_limit(),
	ArmsLimit = arms_skill_limit(),
	Score = dict:fold(
		fun(_, Item, S) ->
			EquipInfo = Item#item.equip_info,
			S1 = maps:get(score, tb_equip_break:get(Item#item.item_id * 10 + EquipInfo#equip_info.break_through)),
			S2 = case tb_equip_up_score:get(EquipInfo#equip_info.up) of false -> 0; UpConf -> maps:get(score, UpConf) end,
			S3 = lists:foldl(
				fun(Wash, Acc) ->
					case tb_equip_wash:get(Wash) of
						false -> Acc;
						WashConf -> maps:get(score, tb_equip_wash_score:get(maps:get(quality, WashConf))) + Acc
					end
				end, 0, element(?WASH_BEFORE, EquipInfo#equip_info.attribute)),
			S + S1 + S2 + S3
		end, 0, EquipItemDict),
	Score1 = Score - 100,
	Power =
		case Score1 > 0 of
			false -> 0;
			true -> Score1 * 0.01 + math:sqrt(Score1) * 0.8
		end,
	#assist{
		hero_id = HeroId,
		awaken = Hero#hero.awaken,
		star = Hero#hero.star,
		hero_skill_level = ?IIF(HeroLevel > HeroLimit, HeroLimit, HeroLevel),
		arms_skill_level = ?IIF(ArmsLevel > ArmsLimit, ArmsLimit, ArmsLevel),
		equip_power = trunc(Power)
	}
.

assist(HeroId) ->
	(lib_hero_api:hero_info(HeroId))#hero.assist
.


is({?DEFINE_ASSIST, ?DEFINE_ASSIST}) -> null;
is({?ASSIST_FORMER, _}) -> assist;
is({?ASSIST_LATTER, _}) -> assist;
is(_) -> main.

is_main(Assist) ->
	is(Assist) =:= main
.
is_assist(Assist) ->
	is(Assist) =:= assist
.
hero_is_assist(HeroId) ->
	is_assist(assist(HeroId))
.
is_can(HeroId, AssistantHero, Type) ->
	case lib_hero_genius:is_type(AssistantHero, 7) of
		true -> true;
		false ->
			case Type of
				1 -> lib_hero_api:hero_front_corps(HeroId) =:= lib_hero_api:hero_front_corps(AssistantHero);
				2 -> lib_hero_api:hero_back_corps(HeroId) =:= lib_hero_api:hero_back_corps(AssistantHero)
			end
	end
.

reset(HeroId) ->
	AssistTuple = assist(HeroId),
	update_hero_assist(HeroId, new()),
	case is_assist(AssistTuple) of
		true ->
			{Type, MainHeroId} = AssistTuple,
			MainAssistTuple = assist(MainHeroId),
			NewMainAssist = setelement(Type, MainAssistTuple, ?DEFINE_ASSIST),
			update_hero_assist(MainHeroId, NewMainAssist),
			update_assist_prop(MainHeroId);
		false ->
			case element(?ASSIST_FORMER, AssistTuple) of
				?DEFINE_ASSIST -> skip;
				Former -> update_hero_assist(Former#assist.hero_id, new())
			end,
			case element(?ASSIST_LATTER, AssistTuple) of
				?DEFINE_ASSIST -> skip;
				Latter -> update_hero_assist(Latter#assist.hero_id, new())
			end,
			update_hero_assist(HeroId, new()),
			update_assist_prop(HeroId)
	end
.

update_hero_assist(HeroId, Assist) ->
	HeroInfo = lib_hero_api:hero_info(HeroId),
	lib_hero_api:update_hero(HeroInfo#hero{assist = Assist}, ?HERO_UPDATE_ASSIST)
.

hero_skill_limit() ->
	maps:get(value, tb_const:get(assist_hero_skill_limit)) + lib_player_science_api:get_effect_value(?EFFECT_HELP_FIGHT_SKILL_MAX_LEVEL_ADD)
.
arms_skill_limit() ->
	maps:get(value, tb_const:get(assist_arms_skill_limit)) + lib_player_science_api:get_effect_value(?EFFECT_HELP_FIGHT_SKILL_MAX_LEVEL_ADD)
.

request_hero_assist(Msg) ->
	#'Proto10116081'{
		hero_id = HeroId,
		type = Type,
		assistant_hero = AssistantHero
	} = Msg,
	?JUDGE_RETURN(HeroId =/= AssistantHero, ?ERROR_HERO_NOT_EXISTENT),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	?JUDGE_RETURN(lib_hero_api:hero_color(lib_hero_api:hero_star(HeroId)) >= ?HERO_COLOR_RED, ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(lib_hero_api:is_have_hero(AssistantHero), ?ERROR_HERO_NOT_EXISTENT),
	?JUDGE_RETURN(not lib_troops_api:is_troops(AssistantHero), ?ERROR_TROOPS_ERROR),
	HeroInfo = lib_hero_api:hero_info(HeroId),
	Assist = HeroInfo#hero.assist,
	?JUDGE_RETURN(not is_assist(Assist), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(assist(AssistantHero) =:= new(), ?ERROR_CLIENT_OPERATOR),
	?JUDGE_RETURN(is_can(HeroId, AssistantHero, Type), ?ERROR_CLIENT_OPERATOR),
	NewAssistHero = calc_assist_hero(AssistantHero),
	case element(Type, Assist) of
		?DEFINE_ASSIST -> skip;
		OldAssistant ->
			OldAssistantHero = OldAssistant#assist.hero_id,
			?JUDGE_RETURN(OldAssistantHero =/= AssistantHero, ?ERROR_CLIENT_OPERATOR),
			update_hero_assist(OldAssistantHero, new())
	end,
	update_hero_assist(AssistantHero, {Type, HeroId}),
	NewAssist = setelement(Type, Assist, NewAssistHero),
	update_hero_assist(HeroId, NewAssist),
	update_assist_prop(HeroId)
.

request_cancel_hero_assist(Msg) ->
	#'Proto10116082'{
		hero_id = HeroId,
		type = Type
	} = Msg,
	?JUDGE_RETURN(lib_hero_api:is_have_hero(HeroId), ?ERROR_HERO_NOT_EXISTENT),
	HeroInfo = lib_hero_api:hero_info(HeroId),
	Assist = HeroInfo#hero.assist,
	?JUDGE_RETURN(not is_assist(Assist), ?ERROR_CLIENT_OPERATOR),
	case element(Type, Assist) of
		?DEFINE_ASSIST -> skip;
		AssistantHero ->
			AssistantHeroId = AssistantHero#assist.hero_id,
			update_hero_assist(AssistantHeroId, new()),
			NewAssist = setelement(Type, Assist, ?DEFINE_ASSIST),
			update_hero_assist(HeroId, NewAssist),
			update_assist_prop(HeroId)
	end
.

update_assist(HeroId) ->
	Assist = assist(HeroId),
	case is_assist(assist(HeroId)) of
		false -> skip;
		true ->
			{Type, GoalHeroId} = Assist,
			HeroInfo = lib_hero_api:hero_info(GoalHeroId),
			AssistHero = calc_assist_hero(HeroId),
			lib_hero_api:update_hero(HeroInfo#hero{assist = setelement(Type, HeroInfo#hero.assist, AssistHero)}, ?HERO_UPDATE_ASSIST),
			update_assist_prop(GoalHeroId)
	end
.


