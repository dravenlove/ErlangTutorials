%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 1月 2021 14:27
%%%-------------------------------------------------------------------
-module(lib_player_science_api).
-author("13661").

-include("common.hrl").
-include("science.hrl").
-include("hero.hrl").

%% API
-export([
	science_level/1,		%% 科技等级
	
	get_effect_value/1, 	%% 获取某种效果加成值
	get_effect_value/2, 	%% 获取某种效果加成值
	get_effect_id_list/1, 	%% 获取效果ID列表
	get_effect_id_list/2, 	%% 获取效果ID列表

	update_hero_prop/0		%% 通知前端更新英雄信息
]).
update_hero_prop() ->
	HeroId_list = lib_hero_api:hero_id_list(),
	update_hero_prop(HeroId_list)
.
update_hero_prop(Hero_list) ->
	case Hero_list =:= [] of
		true -> skip;
		false-> update_hero_prop(Hero_list,[])
	end
.
update_hero_prop([Hero_id|Hero_list],HeroList) ->
	Hero = lib_hero_api:hero_info(Hero_id),
	%% 重新计算英雄信息
	lib_hero_prop:update_hero_prop(Hero_id, ?HERO_PROP_SCIENCE),
	update_hero_prop(Hero_list,[Hero|HeroList])
;
update_hero_prop([],HeroList) ->
	%% 通知前端更新英雄信息
	lib_hero_api:notify_hero_update(HeroList,?HERO_UPDATE_SCIENCE)
.

science_level(ScienceId) ->
	Science = lib_player_science:science_info(ScienceId),
	Science#science.level
.

get_effect_value(Type) ->
	get_effect_value(Type, [])
.
get_effect_value(Type, Cond) when not is_list(Cond) ->
	get_effect_value(Type, [Cond])
;
get_effect_value(Type, CondList) ->
	EffectIdList = lib_player_science:get_effect_list(Type),

	%% 1.在效果列表中通过 judge_function 选出符合条件的效果
	%% 2.从符合条件的效果中用 fetch_function 取出效果值
	ValueList =
	lib_common:list_foldl(fun(EffectId, List) ->
		ScienceId = EffectId div 1000,
		ScienceConf = tb_science:get(ScienceId),
		?JUDGE_CONTINUE(ScienceConf =/= false, List),

		LevelConf = tb_science_level:get(EffectId),
		?JUDGE_CONTINUE(LevelConf =/= false, List),

		Type = maps:get(type, ScienceConf, 0),
		?JUDGE_CONTINUE(Type =/= 0,  List),

		ConfCondList = maps:get(cond_list, ScienceConf, []),
		Ret = judge_function(EffectId, Type, ScienceConf, CondList, ConfCondList),
		?JUDGE_CONTINUE(Ret, List),

		[fetch_function(EffectId, Type, LevelConf) | List]
    end, [], EffectIdList),

	%% 3. 使用 accumulation_function 累加所有符合条件的效果值
	TotalValue = accumulation_function(Type, ValueList),

	%% 4. 使用 handle_function 处理累加完的效果值得到最终值
	handle_function(Type, TotalValue)
.

get_effect_id_list(Type) ->
	get_effect_id_list(Type, [])
.
get_effect_id_list(Type, Cond) when not is_list(Cond) ->
	get_effect_id_list(Type, [Cond])
;
get_effect_id_list(Type, CondList) ->
	EffectIdList = lib_player_science:get_effect_list(Type),

	%% 1.在效果列表中通过 judge_function 选出符合条件的效果
	lib_common:list_foldl(fun(EffectId, List) ->
		ScienceId = EffectId div 1000,
		ScienceConf = tb_science:get(ScienceId),
		?JUDGE_CONTINUE(ScienceConf =/= false, List),

		LevelConf = tb_science_level:get(EffectId),
		?JUDGE_CONTINUE(LevelConf =/= false, List),

		Type = maps:get(type, ScienceConf, 0),
		?JUDGE_CONTINUE(Type =/= 0,  List),

		ConfCondList = maps:get(cond_list, ScienceConf, []),
		Ret = judge_function(EffectId, Type, ScienceConf, CondList, ConfCondList),
		?JUDGE_CONTINUE(Ret, List),

		[EffectId | List]
    end, [], EffectIdList)
.

judge_function(_EffectId, ?EFFECT_TYPE_HERO_PROP, _Conf, [HeroType | _], [NeedType | _]) ->
	HeroType =:= NeedType
;
judge_function(_EffectId, ?EFFECT_ARMS_HERO_PROP, _Conf, HeroArmsList, [NeedArms | _]) ->
	lists:member(NeedArms, HeroArmsList)
;
judge_function(_EffectId, ?EFFECT_COLOR_HERO_PROP, _Conf, [HeroColor | _], [NeedColor | _]) ->
	HeroColor >= NeedColor
;
judge_function(_EffectId, ?EFFECT_QUALITY_HERO_PROP, _Conf, [HeroQuality, HeroSex | _], [NeedQuality, NeedHeroSex | _]) ->
	HeroQuality =:= NeedQuality andalso (HeroSex =:= NeedHeroSex orelse HeroSex =:= 0)
;
judge_function(_EffectId, ?EFFECT_SCIENCE_UPGRADE_COST_REDUCE, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_ARMS_TRAIN_TIME_REDUCE, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_EQUIP_BREAK_COST_REDUCE, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_ARMS_MAX_NUMBER_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_INNER_CITY_YIELD_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_MAP_YIELD_TASK_REWARD_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_ARMS_TRAIN_NUMBER_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_MAP_YIELD_HOUR_REWARD_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_PUB_REWARD_NUMBER_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_SCIENCE_ITEM_REWARD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_TYPE_SKILL_LEARNING_MAX_LEVEL_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_QUALITY_SKILL_LEARNING_NUMBER_ADD, _Conf, [HeroQuality, Type | _], [NeedQuality, NeedType | _]) ->
	HeroQuality =:= NeedQuality andalso Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_SEX_SKILL_LEARNING_NUMBER_ADD, _Conf, [HeroSex, Type | _], [NeedSex, NeedType | _]) ->
	HeroSex =:= NeedSex andalso Type =:= NeedType
;
judge_function(_EffectId, ?EFFECT_COLOR_STARS_MAX_LEVEL_ADD, _Conf, [Color | _], [NeedColor | _]) ->
	Color =:= NeedColor
;
judge_function(_EffectId, ?EFFECT_HELP_FIGHT_SKILL_MAX_LEVEL_ADD, _Conf, [Type | _], [NeedType | _]) ->
	Type =:= NeedType
;
judge_function(_EffectId, _Type, _Conf, _, _) ->
	true
.

fetch_function(_, ?EFFECT_TYPE_HERO_PROP, Conf) ->
	lib_fight_prop:cfg_prop_dict_from_conf(maps:get(json_val, Conf, #{}))
;
fetch_function(_, ?EFFECT_ARMS_HERO_PROP, Conf) ->
	lib_fight_prop:cfg_prop_dict_from_conf(maps:get(json_val, Conf, #{}))
;
fetch_function(_, ?EFFECT_COLOR_HERO_PROP, Conf) ->
	lib_fight_prop:cfg_prop_dict_from_conf(maps:get(json_val, Conf, #{}))
;
fetch_function(_, ?EFFECT_QUALITY_HERO_PROP, Conf) ->
	lib_fight_prop:cfg_prop_dict_from_conf(maps:get(json_val, Conf, #{}))
;
fetch_function(EffectId, ?EFFECT_SCIENCE_ITEM_REWARD, Conf) ->
%%	maps:get(json_val, Conf, [0, 0])
	ScienceId = EffectId div 1000,
	ScienceConf = tb_science:get(ScienceId),
	[ConfCondList] = maps:get(cond_list, ScienceConf, []),
	[ConfCondList,maps:get(int_val, Conf, 0)]
;
fetch_function(_, ?EFFECT_SHENWEN_MAX_LEVEL_ADD, Conf) ->
	maps:get(int_val, Conf, 0)
;
fetch_function(_, ?EFFECT_COLOR_STARS_MAX_LEVEL_ADD, Conf) ->
	maps:get(int_val, Conf, 0)
;
fetch_function(_, ?EFFECT_INNER_CITY_YIELD_ADD, Conf) ->
	maps:get(int_val, Conf, 0)
;



fetch_function(_EffectId, _Type, Conf) ->
	maps:get(int_val, Conf)
.

accumulation_function(?EFFECT_TYPE_HERO_PROP, ValueList) ->
	lib_fight_prop:increase_prop(ValueList)
;
accumulation_function(?EFFECT_ARMS_HERO_PROP, ValueList) ->
	lib_fight_prop:increase_prop(ValueList)
;
accumulation_function(?EFFECT_COLOR_HERO_PROP, ValueList) ->
	lib_fight_prop:increase_prop(ValueList)
;
accumulation_function(?EFFECT_QUALITY_HERO_PROP, ValueList) ->
	lib_fight_prop:increase_prop(ValueList)
;
accumulation_function(?EFFECT_SCIENCE_ITEM_REWARD, ValueList) ->
	lib_item_api:merge_conf_item_list(ValueList)
;
accumulation_function(_Type, ValueList) ->
	lists:sum(ValueList)
.


handle_function(?EFFECT_TRIBUTE_OPEN_CD_REDUCE, Value) ->
	Value / 100
;
handle_function(?EFFECT_SCIENCE_UPGRADE_TIME_REDUCE, Value) ->
	Value / 100
;
handle_function(?EFFECT_SCIENCE_UPGRADE_COST_REDUCE, Value) ->
	Value / 100
;
handle_function(?EFFECT_BARRACKS_TRAIN_COST_REDUCE, Value) ->
	Value / 100
;
handle_function(?EFFECT_MARCH_COST_REDUCE, Value) ->
	Value / 100
;
handle_function(?EFFECT_ARMS_TRAIN_TIME_REDUCE, Value) ->
	Value / 100
;
handle_function(?EFFECT_ARMS_MAX_NUMBER_ADD, Value) ->
	Value / 100
;
handle_function(?EFFECT_TRIBUTE_NUMBER_ADD, Value) ->
	Value / 100
;
handle_function(?EFFECT_INNER_CITY_YIELD_ADD, Value) ->
	Value / 100
;
handle_function(?EFFECT_CHAPTER_REWARD_ADD, Value) ->
	Value / 100
;
handle_function(?EFFECT_ARMS_TRAIN_NUMBER_ADD, Value) ->
	Value / 100
;
handle_function(_Type, Value) ->
	Value
.