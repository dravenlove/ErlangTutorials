%%%-------------------------------------------------------------------
%%%_@author_lichaoyu
%%%_@copyright_(C)_2021,_shengheyouxi
%%%_@doc
%%%
%%%_@end
%%%_Created_:_06._Feb_2021_8:21_PM
%%%-------------------------------------------------------------------
-module(lib_hero_genius).
-author("lichaoyu").
-include("common.hrl").
-include("hero.hrl").
-include("hero_skill.hrl").

-define(SPECIAL_EFFECT_0,	0).		%%0-无需条件，
-define(SPECIAL_EFFECT_1,	1).		%%1-每提升p2点p_text属性，
-define(SPECIAL_EFFECT_2,	2).		%%2-每提升p2级p_text技能，
-define(SPECIAL_EFFECT_3,	3).		%%3-技能p1达到p2级，
-define(SPECIAL_EFFECT_4,	4).		%%4-穿戴装备p1，
-define(SPECIAL_EFFECT_5,	5).		%%5-英雄等级每提升p1级，有最大值上限
-define(SPECIAL_EFFECT_6,	6).		%%6-学习任意技能时不受属性限制，
-define(SPECIAL_EFFECT_7,	7).		%%7-可担当任意英雄的任意兵种副将，
-define(SPECIAL_EFFECT_8,	8).		%%8-每装备p1件p2套，
-define(SPECIAL_EFFECT_9,	9).		%%9-携带兵种p2的英雄，
-define(SPECIAL_EFFECT_10,	10).	%%10-英雄等级达到p1级以上，
-define(SPECIAL_EFFECT_11,	11).	%%11-英雄类型p_text装备p1装备时，
-define(SPECIAL_EFFECT_12,	12).	%%12-作为副将时，可依照品质，为主将提供额外加成：紫色以上品质：骑兵基础攻击+25，骑兵基础防御+15。金色以上品质：武力+2。红色品质：骑兵暴击率+10%,骑兵速度+5，
-define(SPECIAL_EFFECT_13,	13).	%%13-作为主将时，可依照品质，解锁以上全部4倍的加成效果，
-define(SPECIAL_EFFECT_14,	14).	%%14-每学习一种相关p_text[技能id]的技能，
-define(SPECIAL_EFFECT_15,	15).	%%15-属性p_text值达到p2，
-define(SPECIAL_EFFECT_16,	16).	%%16-每有P1种p_text类型的技能达到P2级，
-define(SPECIAL_EFFECT_17,	17).	%%17-英雄星级达到p2以上
-define(SPECIAL_EFFECT_18,	18).	%%18-p1技能达到p2级之前
-define(SPECIAL_EFFECT_19,	19).	%%19-p1套的p2颜色属性增加p3%(特殊处理)
-define(SPECIAL_EFFECT_20,	20).	%%20-p1英雄穿戴


%%_API
-export([
	update_hero_genius_prop/1,	%% 更新英雄天赋属性加成
	update_skill_group/2,
	to_proto/2,		%% 前端显示
	calc_genius_prop/1,
	calc_genius_skill/1,
	calc_assist_genius_prop/1,		%% 作为副将为主将提供属性
	calc_assist_genius_skill/1,		%% 作为副将为主将提供技能
	activation_multiples/2,			%% 是否能激活
	special_effect_prop/2,		%% 效果带来的属性
	limit_prop/2,				%% 属性有上限
	genius_id_list/2,
	is_type/2					%% 是否有这个类型天赋
]).

-define(NO_GENIUS,		0).	%% 无天赋
-define(GENIUS_ID(HeroId, Awaken),	HeroId * 100 + Awaken * 10 + 1).

update_hero_genius_prop(HeroId) ->
	lib_hero_prop:update_hero_prop(HeroId, ?HERO_PROP_GENIUS),
	update_skill_group(HeroId, true)
.

update_skill_group(HeroId, IsNotify) ->
	Hero = lib_hero_api:hero_info(HeroId),
	SkillList = calc_genius_skill(Hero),
	lib_hero_skill:update_fight_skill_group(?HERO_SKILL_GENIUS, HeroId, SkillList, IsNotify)
.

to_proto(ProtoHero, Hero) ->
	ProtoHero#'ProtoHero'{
		awaken = Hero#hero.awaken
	}
.

calc_genius_prop(Hero) ->
	HeroId = Hero#hero.id,
	HeroConfig = tb_hero:get(HeroId),
	case maps:get(is_genius, HeroConfig) of
		?NO_GENIUS -> lib_fight_prop:cfg_prop_dict_from_conf(false);
		_ ->
			Awaken = Hero#hero.awaken,
			GeniusIdList = genius_id_list(HeroId, Awaken),
			GeniusPropList = [calc_one_genius_prop(Hero, GeniusId) || GeniusId <- GeniusIdList],
			lib_fight_prop:increase_prop(GeniusPropList)
	end
.
calc_one_genius_prop(Hero, GeniusId) ->
	GeniusConfig = tb_hero_genius:get(GeniusId),
	BasePropConfig = maps:get(props, GeniusConfig, #{}),
	BaseProp = lib_fight_prop:cfg_prop_dict_from_conf(BasePropConfig),
	case maps:find(special_effect, GeniusConfig) of
		error -> BaseProp;
		{ok, SpecialEffect} ->
			SpecialEffectConfig = special_effect_prop(Hero, SpecialEffect),
			SpecialEffectProp = lib_fight_prop:cfg_prop_dict_from_conf(SpecialEffectConfig),
			lib_fight_prop:increase_prop([SpecialEffectProp, BaseProp])
	end
.

calc_genius_skill(Hero) ->
	HeroId = Hero#hero.id,
	HeroConfig = tb_hero:get(HeroId),
	case maps:get(is_genius, HeroConfig) of
		?NO_GENIUS -> [];
		_ ->
			Awaken = Hero#hero.awaken,
			GeniusIdList = genius_id_list(HeroId, Awaken),
			GeniusPropList = [calc_one_genius_skill(Hero, GeniusId) || GeniusId <- GeniusIdList],
			lib_fight_prop:increase_skill(GeniusPropList)
	end
.
calc_one_genius_skill(Hero, GeniusId) ->
	GeniusConfig = tb_hero_genius:get(GeniusId),
	BaseSkill0 =
		case maps:find(skill, GeniusConfig) of
			error -> [];
			{ok, Skill} -> [Skill]
		end,
	case maps:find(main_skill, GeniusConfig) of
		error -> BaseSkill0;
		{ok, MainSkill} -> ?IIF(lib_hero_assist:is_main(Hero#hero.assist), [MainSkill | BaseSkill0], BaseSkill0)
	end
%%	case maps:find(special_effect, GeniusConfig) of
%%		error -> BaseSkill1;
%%		{ok, SpecialEffect} ->
%%			Conf = tb_special_effect:get(SpecialEffect),
%%			case activation_multiples(Hero, Conf) of
%%				0 -> BaseSkill1;
%%				_ ->
%%					case maps:find(skill, Conf) of
%%						error -> BaseSkill1;
%%						{ok, Skill} -> Skill
%%					end
%%			end
%%	end
.

calc_assist_genius_prop({HeroId, Awaken, Star}) ->
	HeroConfig = tb_hero:get(HeroId),
	case maps:get(is_genius, HeroConfig) of
		?NO_GENIUS -> #{};
		_ ->
			GeniusIdList = genius_id_list(HeroId, Awaken),
			PropConfList = [
				begin
					BaseConfList = maps:get(props, SpecialEffectConfig),
					BaseConfList0 = lists:reverse(BaseConfList),
					PropConf = star_prop_conf(Star, BaseConfList0),
					lib_fight_prop:cfg_prop_dict_from_conf(PropConf)
				end || GeniusId <- GeniusIdList,
				begin
					GeniusConfig = tb_hero_genius:get(GeniusId),
					SpecialEffect = maps:get(special_effect, GeniusConfig, 0),
					SpecialEffectConfig = tb_special_effect:get(SpecialEffect),
					case is_map(SpecialEffectConfig) andalso maps:get(type, SpecialEffectConfig) of
						?SPECIAL_EFFECT_12 -> maps:is_key(props, SpecialEffectConfig);
						_ -> false
					end
				end],
			lib_fight_prop:increase_prop(PropConfList)
	end
.

calc_assist_genius_skill({HeroId, Awaken}) ->
	HeroConfig = tb_hero:get(HeroId),
	case maps:get(is_genius, HeroConfig) of
		?NO_GENIUS -> [];
		_ ->
			GeniusIdList = genius_id_list(HeroId, Awaken),
			[maps:get(skill, SpecialEffectConfig) || GeniusId <- GeniusIdList,
				begin
					GeniusConfig = tb_hero_genius:get(GeniusId),
					SpecialEffect = maps:get(special_effect, GeniusConfig, 0),
					SpecialEffectConfig = tb_special_effect:get(SpecialEffect),
					case is_map(SpecialEffectConfig) andalso maps:get(type, SpecialEffectConfig) of
						?SPECIAL_EFFECT_12 -> maps:is_key(skill, SpecialEffectConfig);
						_ -> false
					end
				end]
	end
.

%% 0-未激活，X-已激活，且翻X倍
activation_multiples(Hero, Conf) ->
	case maps:get(type, Conf) of
		?SPECIAL_EFFECT_1 ->
			P2 = maps:get(p2, Conf),
			PText = maps:get(p_text, Conf),
			activation1(Hero, P2, PText);
		?SPECIAL_EFFECT_2 ->
			P2 = maps:get(p2, Conf),
			PText = maps:get(p_text, Conf),
			activation2(Hero, P2, PText);
		?SPECIAL_EFFECT_3 ->
			P1 = maps:get(p1, Conf),
			P2 = maps:get(p2, Conf),
			activation3(Hero, P1, P2);
		?SPECIAL_EFFECT_4 ->
			P1 = maps:get(p1, Conf),
			activation4(Hero, P1);
		?SPECIAL_EFFECT_5 ->
			P2 = maps:get(p2, Conf),
			activation5(Hero, P2);
		?SPECIAL_EFFECT_8 ->
			P1 = maps:get(p1, Conf),
			P2 = maps:get(p2, Conf),
			activation8(Hero, P1, P2);
		?SPECIAL_EFFECT_9 ->
			P2 = maps:get(p2, Conf),
			activation9(Hero, P2);
		?SPECIAL_EFFECT_10 ->
			P2 = maps:get(p2, Conf),
			activation10(Hero, P2);
		?SPECIAL_EFFECT_11 ->
			PText = maps:get(p_text, Conf),
			activation11(Hero, PText);
		?SPECIAL_EFFECT_13 ->
			activation13(Hero);
		?SPECIAL_EFFECT_14 ->
			PText = maps:get(p_text, Conf),
			activation14(Hero, PText);
		?SPECIAL_EFFECT_15 ->
			P2 = maps:get(p2, Conf),
			PText = maps:get(p_text, Conf),
			activation15(Hero, P2, PText);
		?SPECIAL_EFFECT_16 ->
			P1 = maps:get(p1, Conf),
			P2 = maps:get(p2, Conf),
			PText = maps:get(p_text, Conf),
			activation16(Hero, P1, P2, PText);
		?SPECIAL_EFFECT_17 ->
			P2 = maps:get(p2, Conf),
			activation17(Hero, P2);
		?SPECIAL_EFFECT_18 ->
			P1 = maps:get(p1, Conf),
			P2 = maps:get(p2, Conf),
			activation18(Hero, P1, P2);
		?SPECIAL_EFFECT_20 ->
			P1 = maps:get(p1, Conf),
			activation20(Hero, P1);
		_ -> 0
	end
.

activation1(Hero, P2, PText) ->
	HeroProp = Hero#hero.prop_dict,
	BaseProp = tb_hero:get(Hero#hero.id),
	ValueList = [
		begin
			PropName = util:to_atom(Name),
			NowValue = util:dict_get(PropName, HeroProp, 0),
			BaseValue = maps:get(PropName, BaseProp, 0),
			NowValue - BaseValue
		end || Name <- PText],
	lists:sum(ValueList) div P2
.
activation2(Hero, P2, PText) ->
	SkillLearningMap = Hero#hero.skill_learning_map,
	LevelList = [
		begin
			case maps:find(SkillId, SkillLearningMap) of
				error -> 0;
				{ok, Skill} -> Skill#skill.level - 1
			end
		end || SkillId <- PText],
	lists:sum(LevelList) div P2
.
activation3(Hero, P1, P2) ->
	SkillLearningMap = Hero#hero.skill_learning_map,
	case maps:find(P1, SkillLearningMap) of
		error -> 0;
		{ok, Skill} -> ?IIF(Skill#skill.level >= P2, 1, 0)
	end
.
activation4(Hero, P1) ->
	Type = lib_item_api:item_sub_type(P1),
	EquipDict = Hero#hero.equip_item_dict,
	case dict:find(Type, EquipDict) of
		error -> 0;
		{ok, EquipItem} -> ?IIF(EquipItem#item.item_id =:= P1, 1, 0)
	end
.
activation5(Hero, P2) ->
	(Hero#hero.level - 1) div P2
.
activation8(Hero, P1, P2) ->
	EquipDict = Hero#hero.equip_item_dict,
	SuitNum = dict:fold(
		fun(_, Item, Num) ->
			?IIF(lib_equip_api:suit(Item#item.item_id) =:= P1, Num + 1, Num)
		end, 0, EquipDict),
	SuitNum div P2
.
activation9(Hero, P2) ->
	HeroId = Hero#hero.id,
	?IIF(lib_hero_api:hero_front_corps(HeroId) =:= P2 orelse lib_hero_api:hero_back_corps(HeroId) =:= P2, 1, 0)
.
activation10(Hero, P2) ->
	?IIF(Hero#hero.level >= P2, 1, 0)
.
activation11(Hero, PText) ->
	HeroType = lib_hero_api:hero_type(Hero#hero.id),
	?IIF(lists:member(HeroType, PText), 1, 0)
.
activation13(Hero) ->
	Assist = Hero#hero.assist,
	?IIF(lib_hero_assist:is_main(Assist), 1, 0)
.
activation14(Hero, PText) ->
	SkillLearningMap = Hero#hero.skill_learning_map,
	SkillList = [SkillId || SkillId <- PText, maps:is_key(SkillId, SkillLearningMap)],
	length(SkillList)
.
activation15(Hero, P2, PText) ->
	HeroProp = Hero#hero.prop_dict,
	ValueList = [
		begin
			PropName = util:to_atom(Name),
			dict:fetch(PropName, HeroProp)
		end || Name <- PText],
	Max = lists:max(ValueList),
	?IIF(Max >= P2, 1, 0)
.
activation16(Hero, P1, P2, PText) ->
	SkillLearningMap = Hero#hero.skill_learning_map,
	SkillList = [SkillId || SkillId <- PText,
		begin
			case maps:find(SkillId, SkillLearningMap) of
				error -> false;
				{ok, Skill} -> Skill#skill.level >= P2
			end
		end],
	length(SkillList) div P1
.
activation17(Hero, P2) ->
	?IIF(Hero#hero.star >= P2, 1, 0)
.
activation18(Hero, P1, P2) ->
	SkillLearningMap = Hero#hero.skill_learning_map,
	case maps:find(P1, SkillLearningMap) of
		error -> 1;
		{ok, Skill} -> ?IIF(Skill#skill.level < P2, 1, 0)
	end
.
activation20(Hero, P1) ->
	?IIF(Hero#hero.id =:= P1, 1, 0)
.

special_effect_prop(Hero, SpecialEffectId) ->
	Conf = tb_special_effect:get(SpecialEffectId),
	case activation_multiples(Hero, Conf) of
		0 -> #{};
		Num ->
			case maps:find(props, Conf) of
				error -> #{};
				{ok, BaseConf} when is_map(BaseConf) ->
					BasePropConf = multiples_prop(Num, BaseConf),
					case maps:find(max_props, Conf) of
						error -> BasePropConf;
						{ok, MaxPropConf} -> limit_prop(BasePropConf, MaxPropConf)
					end;
				{ok, BaseConfList} ->
					BaseConfList0 = lists:reverse(BaseConfList),
					Star = Hero#hero.star,
					star_prop_conf(Star, BaseConfList0)
			end
	end
.
star_prop_conf(Star, [Conf | ConfList]) ->
	case Star >= maps:get(star, Conf) of
		true -> Conf;
		false -> star_prop_conf(Star, ConfList)
	end
;
star_prop_conf(_Star, []) ->
	#{}
.
%% 基础属性，倍率
multiples_prop(1, BaseConf) -> BaseConf;
multiples_prop(Num, BaseConf) ->
	MapList = maps:to_list(BaseConf),
	MapList0 = [{K, V * Num} || {K, V} <- MapList],
	maps:from_list(MapList0)
.
%% 倍率属性，上限属性
limit_prop(BaseConf, LimitConf) ->
	maps:fold(
		fun(K, V, Conf) ->
			case maps:find(K, Conf) of %% todo 防止报错
				error -> Conf;
				{ok, V1} -> ?IIF(V1 > V, maps:update(K, V, Conf), Conf)
			end
		end, BaseConf, LimitConf)
.

is_type(HeroId, Type) ->
	HeroInfo = lib_hero_api:hero_info(HeroId),
	is_type(HeroId, HeroInfo#hero.awaken, Type)
.
is_type(HeroId, Awaken, Type) ->
	t((HeroId * 10 + Awaken) * 10 + 1, Type)
.
t(M, T) ->
	case tb_hero_genius:get(M) of
		false -> false;
		Conf ->
			case maps:find(special_effect, Conf) of
				error -> t(M + 1, T);
				{ok, S} ->
					case maps:get(type, tb_special_effect:get(S)) of
						T -> true;
						_ -> t(M + 1, T)
					end
			end
	end
.
genius_id_list(HeroId, Awaken) ->
	AwakenList = lists:seq(0, Awaken),
	lists:foldl(
		fun(A, L) ->
			i(?GENIUS_ID(HeroId, A), L)
		end, [], AwakenList)
.
i(M, L) ->
	case tb_hero_genius:get(M) of
		false -> L;
		_ -> i(M + 1, [M | L])
	end
.


