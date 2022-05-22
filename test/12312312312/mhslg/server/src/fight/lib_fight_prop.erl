%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_fight_prop
%%% Created on : 2020/8/13 0013 22:22
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_fight_prop).
-author("glendy").
-include("common.hrl").
-include("fight_prop.hrl").
-include("ProtoPublic.hrl").
-include("hero.hrl").
-include("hero_skill.hrl").

%% API
-export([
	set_prop/4,                 %% 设置指定属性值
	get_prop/2,					%% 按照属性名取属性值 参数 PropName, PropDict
	get_prop/3,                 %% 按照前缀和基本属性名获取指定属性值
	add_prop/3,
	add_prop/4,                 %% 增加指定属性值
	sub_prop/4,                 %% 减少指定属性值
	prop_name/2,
	%calc_force/1,               %% 计算战力 (参数：1-已转换四维属性dict)
	calc_force/2,				%% 计算战力 (参数：1-英雄基础信息， 2-配置属性dict)
	%cfg_prop_force/2,			%% 计算配置里属性的战力 (参数：1-英雄基础信息， 2-已提取属性字段且未解析字段且未转换四维属性dict)
	new/0,
	multi_prop/2,				%% 属性值乘数
	merge_prop/2,				%% 合并两个prop，少的放左边
	increase_prop/1,       		%% 合并Dict List
	increase_skill/1,			%% 合并SkillList List
	prop_dict_to_map/1,         %% 把属性dict转成map
	prop_map_to_dict/1,         %% 把属性map转成dict
	bson_to_prop_dict/1,        %%
	prop_dict_to_bson/1,        %%
	prop_dict_from_conf/2,      %% 配置生成属性dict 已解析所有字段

	cfg_prop_dict_from_conf/1,  %% 提取配置属性转成dict 包含未解析字段
	parsing_cfg_prop_dict/2,
	statistics_prop_dict/2,     %% 处理四维后的属性Dict(参数：1-英雄基础信息， 2-属性dict)
	statistics_cfg_prop_dict/2, %% 处理四维后的属性Dict(参数：1-英雄基础信息， 2-配置的属性dict)

	panel_force/2,              %% 面板战力
	panel_attack/2,             %% 面板攻击
	panel_defence/2,            %% 面板防御
	panel_speed/2,              %% 面板速度
	panel_troops/2,             %% 面板兵力
	panel_crit/2,             	%% 面板暴击
	panel_parry/2,             	%% 面板格挡

	hero_to_prop_base/1,		%% 从英雄信息中提取prop_base
	hero_base_to_prop_base/1,	%% 从hero_base 中提取prop_base

	debug_output_prop/2,
	debug_output_function_prop/1,
	debug_output_panel_prop/2,

	output_prop/1,
	prop_name_str/1,
	prop_name_str/2
]).





%% API
-export([
	bson_to_fight_prop/1,
	fight_prop_to_bson/1,
	serialize_prop/1,
	skill_prop/2,
	calc_prop_force1/2,
	calc_skill_force1/2
]).

bson_to_fight_prop(Bson) ->
	maps:fold(
		fun(PropName, Value, AccPropMap0) ->
			maps:put(lib_types:to_atom(PropName), Value, AccPropMap0)
		end, #{}, Bson).

fight_prop_to_bson(PropMap) ->
	maps:fold(
		fun(PropName, Value, AccBson0) ->
			maps:put(lib_types:to_binary(PropName), Value, AccBson0)
		end, #{}, PropMap).

serialize_prop(PropMap) ->
	maps:fold(
		fun(PropName, Value, AccPropList0) ->
			Proto = #'ProtoProp'{
				name = lib_types:to_list(PropName),
				value = Value
			},
			[Proto | AccPropList0]
		end, [], PropMap).







%% 计算属性的战力
calc_force(PropBase, PropDict0) ->
	PropDict = skill_prop(PropBase, PropDict0),
	Force1 = calc_prop_force(PropBase, PropDict),
	Force2 = calc_skill_force(PropBase, PropDict),
	Force3 = get_prop(?POWER, PropDict),
	trunc(Force1 + Force2 + Force3).

calc_prop_force(PropBase, PropDict) ->
	#{value := A} = tb_force_const:get(coefficient_a),
	PropForce = prop_force(PropBase, PropDict, force_value),
	PanelForce = panel_force(statistics_prop_dict(PropBase, parsing_cfg_prop_dict(PropBase, PropDict)), force_value),
	B = get_prop(?SKILL_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?EQUIPMENT_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?STAR_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?AIDE_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?FORMATION_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?BEAST_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?SOUL_POWERBASE_COEFFICIENT, PropDict),
	(PropForce + PanelForce) * (A + B) / A
.
calc_prop_force1(PropBase, PropDict) ->
	#{value := A} = tb_force_const:get(coefficient_a),
	PropForce = prop_force(PropBase, PropDict, force_value),
	PanelForce = panel_force(statistics_prop_dict(PropBase, parsing_cfg_prop_dict(PropBase, PropDict)), force_value),
	B = get_prop(?SKILL_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?EQUIPMENT_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?STAR_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?AIDE_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?FORMATION_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?BEAST_POWERBASE_COEFFICIENT, PropDict)
		+
		get_prop(?SOUL_POWERBASE_COEFFICIENT, PropDict),
	{PanelForce, PropForce, (PanelForce + PropForce) * (A + B) / A}
.

skill_prop(PropBase, PropDict) ->
	SkillList = lib_combat_queue_api:get_skill_list(PropBase#prop_base.skill_list),
	{SkillPower, SkillPowerCoefficient} =
		lists:foldl(fun(SkillId, {Acc0, Acc1}) ->
			Conf = tb_skill:get(SkillId),
			{maps:get(skill_powerbase, Conf, 0) + Acc0, maps:get(skill_powerbase_coefficient, Conf, 0) + Acc1}
	end, {0,0}, SkillList),
	FinalSkillPower = ?DICT_FETCH(?SKILL_POWERBASE, PropDict, 0) + SkillPower,
	FinalPowerCoefficient = ?DICT_FETCH(?SKILL_POWERBASE_COEFFICIENT, PropDict, 0) + SkillPowerCoefficient,
	PropDict0 = dict:store(?SKILL_POWERBASE, FinalSkillPower, PropDict),
	dict:store(?SKILL_POWERBASE_COEFFICIENT, FinalPowerCoefficient, PropDict0).

calc_skill_force(PropBase, PropDict) ->
	#{value := A} = tb_force_const:get(coefficient_a),
	B = prop_force(PropBase, PropDict, attribute_powerbase) +
		panel_force(statistics_prop_dict(PropBase, parsing_cfg_prop_dict(PropBase, PropDict)), attribute_powerbase),
	get_prop(?SKILL_POWERBASE, PropDict) * (A + B + get_prop(?EQUIPMENT_POWERBASE_COEFFICIENT, PropDict) +
		get_prop(?STAR_POWERBASE_COEFFICIENT, PropDict) + get_prop(?AIDE_POWERBASE_COEFFICIENT, PropDict) +
		get_prop(?FORMATION_POWERBASE_COEFFICIENT, PropDict) + get_prop(?BEAST_POWERBASE_COEFFICIENT, PropDict) +
		get_prop(?SOUL_POWERBASE_COEFFICIENT, PropDict)) / A.
calc_skill_force1(PropBase, PropDict) ->
	#{value := A} = tb_force_const:get(coefficient_a),
	B = prop_force(PropBase, PropDict, attribute_powerbase) +
		panel_force(statistics_prop_dict(PropBase, parsing_cfg_prop_dict(PropBase, PropDict)), attribute_powerbase),
	XS = get_prop(?EQUIPMENT_POWERBASE_COEFFICIENT, PropDict) +
		get_prop(?STAR_POWERBASE_COEFFICIENT, PropDict) + get_prop(?AIDE_POWERBASE_COEFFICIENT, PropDict) +
		get_prop(?FORMATION_POWERBASE_COEFFICIENT, PropDict) + get_prop(?BEAST_POWERBASE_COEFFICIENT, PropDict) +
		get_prop(?SOUL_POWERBASE_COEFFICIENT, PropDict),
	JNZL = get_prop(?SKILL_POWERBASE, PropDict),
	{B, XS, B + XS, JNZL * (A + B + XS) / A}.
%%calc_force(PropBase, PropDict) ->
%%	trunc(panel_force(statistics_prop_dict(PropBase, PropDict))).
%%calc_force(PropDict) ->
%%	trunc(panel_force(PropDict)).
%%cfg_prop_force(PropBase, PropDict) ->
%%	PropDict0 = parsing_cfg_prop_dict(PropBase, PropDict),
%%	trunc(panel_force(statistics_prop_dict(PropBase, PropDict0))).


%%%% 获取指定属性值
%%get_prop(PropName, PropDict) ->
%%	PropName0 = lib_types:to_atom(PropName),
%%	case dict:is_key(PropName0, PropDict) of
%%		true ->
%%			dict:fetch(PropName0, PropDict);
%%		false ->
%%			0
%%	end.
%%get_prop(Prefix, Name, PropDict) ->
%%	PropName = prop_name(Prefix, Name),
%%	get_prop(PropName, PropDict).
%% 设置指定属性值
get_prop(PropName, PropDict) ->
	get_prop_done(PropName, PropDict).
%%	Prefix = lib_types:to_atom(string:sub_word(lib_types:to_list(PropName), 1, $_)),
%%	BaseName = string:substr(lib_types:to_list(PropName), string:chr(lib_types:to_list(PropName), $_) + 1),
%%	get_prop(Prefix, BaseName, PropDict).
get_prop(Prefix, Name, PropDict) ->
	get_prop_done(lib_types:to_atom(Prefix), lib_types:to_atom(Name), PropDict).
get_prop_done(?PROP_PREFIX_HERO, Name, PropDict) ->
	get_hero_prop_done(Name, PropDict);
get_prop_done(Prefix, Name, PropDict) ->
	PropName = prop_name(Prefix, Name),
	get_prop_done(PropName, PropDict).
get_prop_done(PropName, PropDict) ->
	PropName0 = lib_types:to_atom(PropName),
	util:dict_get(PropName0, PropDict,0)
.
%%	case dict:is_key(PropName0, PropDict) of
%%		true ->
%%			dict:fetch(PropName0, PropDict);
%%		false ->
%%			0
%%	end.

get_hero_prop_done(?ATTACK, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?ATTACK), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?ATTACK), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?ATTACK), PropDict);
get_hero_prop_done(?BASE_ATTACK, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?BASE_ATTACK), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?BASE_ATTACK), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?BASE_ATTACK), PropDict);
get_hero_prop_done(?FINAL_ATTACK, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?FINAL_ATTACK), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?FINAL_ATTACK), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?FINAL_ATTACK), PropDict);
get_hero_prop_done(?CRIT, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?CRIT), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?CRIT), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?CRIT), PropDict);
get_hero_prop_done(?ATTACK_RATE, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?ATTACK_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?ATTACK_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?ATTACK_RATE), PropDict);
get_hero_prop_done(?BASE_ATTACK_RATE, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?BASE_ATTACK_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?BASE_ATTACK_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?BASE_ATTACK_RATE), PropDict);
get_hero_prop_done(?FINAL_ATTACK_RATE, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?FINAL_ATTACK_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?FINAL_ATTACK_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?FINAL_ATTACK_RATE), PropDict);
get_hero_prop_done(?CRIT_RATE, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_FORMER, ?CRIT_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_LATTER, ?CRIT_RATE), PropDict) * ?HERO_PROP_COEFFICIENT +
		get_prop_done(prop_name(?PROP_PREFIX_HERO, ?CRIT_RATE), PropDict);
get_hero_prop_done(Name, PropDict) ->
	get_prop_done(prop_name(?PROP_PREFIX_HERO, Name), PropDict).

set_prop(Prefix, Name, Value, PropDict) ->
	PropName = prop_name(Prefix, Name),
	dict:store(PropName, Value, PropDict).
%% 增加指定属性值
add_prop(Prefix, Name, Value, PropDict) ->
	PropName = prop_name(Prefix, Name),
	dict:store(PropName, Value + get_prop(Prefix, Name, PropDict), PropDict).
add_prop(PropName, Value, PropDict) ->
	PropName0 = lib_types:to_atom(PropName),
	dict:store(PropName, Value + get_prop(PropName0, PropDict), PropDict).
%%　减少指定属性值
sub_prop(Prefix, Name, Value, PropDict) ->
	PropName = prop_name(Prefix, Name),
	dict:store(PropName, get_prop(Prefix, Name, PropDict) - Value, PropDict).

%% 提取配置属性转成dict
cfg_prop_dict_from_conf(false) ->
	dict:new()
;
cfg_prop_dict_from_conf(Conf) ->
	maps:fold(fun(K, V, Dict) ->
		try
			?JUDGE_RETURN(is_integer(V) orelse is_float(V), 0),
			FunctionPropList = tb_function_prop:get_list(),
			KeyStr = lib_types:to_list(K),
			Prefix = lib_types:to_atom(string:sub_word(KeyStr, 1, $_)),
			?JUDGE_RETURN(lists:member(lib_types:to_atom(Prefix), ?PROP_PREFIX_LIST) orelse lists:member(K, FunctionPropList), 0),
			BaseName = string:substr(KeyStr, string:chr(KeyStr, $_) + 1),
			?JUDGE_RETURN(lists:member(lib_types:to_atom(BaseName), tb_prop:get_list()) orelse lists:member(K, FunctionPropList), 0),
			case dict:is_key(lib_types:to_atom(K), Dict) of
				true -> dict:store(lib_types:to_atom(K), V + dict:fetch(lib_types:to_atom(K), Dict), Dict);
				false -> dict:store(lib_types:to_atom(K), V, Dict)
			end
		catch
			_:_  -> Dict
		end
	end, dict:new(), Conf).

parsing_cfg_prop_dict(PropBase, PropDict) ->
	FunctionPropList = tb_function_prop:get_list(),
	dict:fold(fun(K, V, Dict) ->
		case lists:member(K, FunctionPropList) of
			true ->
				dict:store(K, V, Dict);
			_ ->
				KeyStr = lib_types:to_list(K),
				Prefix = lib_types:to_atom(string:sub_word(KeyStr, 1, $_)),
				BaseName = string:substr(KeyStr, string:chr(KeyStr, $_) + 1),
				KeyList = parsing_prop_key(PropBase, Prefix, BaseName),
				lists:foldl(fun(K0, Dict0) ->
					case dict:is_key(K0, Dict0) of
						true -> dict:store(K0, V + dict:fetch(K0, Dict0), Dict0);
						false -> dict:store(K0, V, Dict0)
					end
				end, Dict, KeyList)
		end
	end, dict:new(), PropDict).

%% 配置生成属性dict
prop_dict_from_conf(PropBase, Conf) ->
	PropDict = cfg_prop_dict_from_conf(Conf),
	parsing_cfg_prop_dict(PropBase, PropDict).

parsing_prop_key(PropBase, Prefix, BaseName) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			[prop_name(?PROP_PREFIX_HERO, BaseName)];
		?PROP_PREFIX_FORMER ->
			[prop_name(?PROP_PREFIX_FORMER, BaseName)];
		?PROP_PREFIX_LATTER ->
			[prop_name(?PROP_PREFIX_LATTER, BaseName)];
		?PROP_PREFIX_ALL ->
			[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
		?PROP_PREFIX_NAN ->
			if
				PropBase#prop_base.sex =:= ?HERO_SEX_MAN ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_NV ->
			if
				PropBase#prop_base.sex =:= ?HERO_SEX_WOMAN ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_WEN ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_WISDOM ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_WU ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_VALIANT ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_QUAN ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_BALANCE ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_LANSE ->
			if
				PropBase#prop_base.color >= ?HERO_COLOR_BLUE ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_ZISE ->
			if
				PropBase#prop_base.color >= ?HERO_COLOR_PURPLE ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_CHENGSE ->
			if
				PropBase#prop_base.color >= ?HERO_COLOR_ORANGE ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_HONGSE ->
			if
				PropBase#prop_base.color >= ?HERO_COLOR_RED ->
					[prop_name(?PROP_PREFIX_HERO, BaseName), prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_BUBING ->
			if
				PropBase#prop_base.front_corps =:= ?CORPS_TYPE_INFANTRY ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_INFANTRY ->
							[prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> [prop_name(?PROP_PREFIX_FORMER, BaseName)]
					end;
				true ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_INFANTRY ->
							[prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> []
					end
			end;
		?PROP_PREFIX_QIBING ->
			if
				PropBase#prop_base.front_corps =:= ?CORPS_TYPE_CAVALRY ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_CAVALRY ->
							[prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> [prop_name(?PROP_PREFIX_FORMER, BaseName)]
					end;
				true ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_CAVALRY ->
							[prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> []
					end
			end;
		?PROP_PREFIX_GONGBING ->
			if
				PropBase#prop_base.front_corps =:= ?CORPS_TYPE_ARCHER ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_ARCHER ->
							[prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> [prop_name(?PROP_PREFIX_FORMER, BaseName)]
					end;
				true ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_ARCHER ->
							[prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> []
					end
			end;
		?PROP_PREFIX_FANGSHI ->
			if
				PropBase#prop_base.front_corps =:= ?CORPS_TYPE_MAGICIAN ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_MAGICIAN ->
							[prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> [prop_name(?PROP_PREFIX_FORMER, BaseName)]
					end;
				true ->
					if
						PropBase#prop_base.back_corps =:= ?CORPS_TYPE_MAGICIAN ->
							[prop_name(?PROP_PREFIX_LATTER, BaseName)];
						true -> []
					end
			end;
		?PROP_PREFIX_BINGZHONG ->
			[prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
		?PROP_PREFIX_WEN_FORMER ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_WISDOM ->
					[prop_name(?PROP_PREFIX_FORMER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_WU_FORMER ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_VALIANT ->
					[prop_name(?PROP_PREFIX_FORMER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_QUAN_FORMER ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_BALANCE ->
					[prop_name(?PROP_PREFIX_FORMER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_WEN_LATTER ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_WISDOM ->
					[prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_WU_LATTER ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_VALIANT ->
					[prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_QUAN_LATTER ->
			if
				PropBase#prop_base.type =:= ?HERO_TYPE_BALANCE ->
					[prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
		?PROP_PREFIX_CHUANQI_BINGZHONG ->
			if
				PropBase#prop_base.quality =:= ?HERO_QUALITY_WAR_GOD ->
					[prop_name(?PROP_PREFIX_FORMER, BaseName), prop_name(?PROP_PREFIX_LATTER, BaseName)];
				true -> []
			end;
			_ -> []
	end.

prop_name(Prefix, Name) ->
	lib_types:to_atom(lib_types:to_list(Prefix) ++ "_" ++ lib_types:to_list(Name)).

%% 把属性dict转成map
prop_dict_to_map(PropDict) ->
	dict:fold(fun(PropName, Value, Map) ->
		maps:put(PropName, Value, Map)
	end, #{}, PropDict).

%% 把属性map转成dict
prop_map_to_dict(PropMap) ->
	maps:fold(fun(PropName, Value, Dict) ->
		case dict:is_key(lib_types:to_atom(PropName), Dict) of
			true ->
				dict:store(lib_types:to_atom(PropName), Value + dict:fetch(lib_types:to_atom(PropName), Dict), Dict);
			false ->
				dict:store(lib_types:to_atom(PropName), Value, Dict)
		end
	end, dict:new(), PropMap).

bson_to_prop_dict(Bson) ->
	maps:fold(fun(PropName, Value, Dict) ->
		case dict:is_key(lib_types:to_atom(PropName), Dict) of
			true ->
				dict:store(lib_types:to_atom(PropName), Value + dict:fetch(lib_types:to_atom(PropName), Dict), Dict);
			false ->
				dict:store(lib_types:to_atom(PropName), Value, Dict)
		end
	end, dict:new(), Bson).

prop_dict_to_bson(PropDict) ->
	dict:fold(fun(PropName, Value, Map) ->
		if
			Value > 0 -> maps:put(lib_types:to_binary(PropName), Value, Map);
			true -> Map
		end
	end, #{}, PropDict).


new() ->
	dict:new()
.
multi_prop(Multi, Prop) ->
	dict:map(fun(_Name, Value) -> Multi * Value end, Prop)
.
%% 合并两个prop dict, 相同属性的值相加
merge_prop(LeftPropDict, RightPropDict) ->
	dict:fold(fun(PropName, Value, PropDictAcc) ->
		NewValue = util:dict_get_add(PropName, PropDictAcc, Value),
		dict:store(PropName, NewValue, PropDictAcc)
	end, RightPropDict, LeftPropDict).

increase_prop([PropDict | PropDictList]) ->
	increase_prop(PropDictList, PropDict)
;
increase_prop([]) ->
	dict:new()
.
increase_prop([PropDict0 | PropList], PropDict) ->
	NewPropDict = merge_prop(PropDict0, PropDict),
	increase_prop(PropList, NewPropDict)
;
increase_prop([], PropDict) ->
	PropDict
.

increase_skill([SkillList | SkillListList]) ->
	increase_skill(SkillListList, SkillList)
;
increase_skill([]) ->
	[]
.
increase_skill([SkillList0 | SkillListList], SkillList) ->
	NewSkillList = SkillList0 ++ SkillList,
	increase_skill(SkillListList, NewSkillList)
;
increase_skill([], SkillList) ->
	SkillList
.

statistics_cfg_prop_dict(PropBase, PropDict) ->
	statistics_prop_dict(PropBase, parsing_cfg_prop_dict(PropBase, PropDict)).

statistics_prop_dict(PropBase, PropDict) ->
	lists:foldl(fun(PropName, Acc) ->
		Value = trunc(get_prop(?PROP_PREFIX_HERO, PropName, PropDict)),
		Cfg = tb_prop_coefficient:get(PropName),
		PropCfg = maps:get(Value, Cfg, #{}),
		PropDict0 = prop_dict_from_conf(PropBase, PropCfg),
		merge_prop(PropDict0, Acc)
	end, PropDict, tb_prop_coefficient:get_list()).

%%	HeroType = PropBase#prop_base.type,
%%	HeroQuality = PropBase#prop_base.quality,
%%
%%	Strength = get_prop(?PROP_PREFIX_HERO, ?STRENGTH, PropDict),
%%	Intelect = get_prop(?PROP_PREFIX_HERO, ?INTELECT, PropDict),
%%	Spirit = get_prop(?PROP_PREFIX_HERO, ?SPIRIT, PropDict),
%%	Leadership = get_prop(?PROP_PREFIX_HERO, ?LEADERSHIP, PropDict),

%%	PropDict1 =
%%	lists:foldl(fun(PropName, Acc) ->
%%		PropConf = tb_pro_type_coefficient:get(PropName),
%%		maps:fold(fun(K, V, Acc0) ->
%%			case HeroType =:= K of
%%				true ->
%%					Value1 = maps:get(strength_cof, V, 0),
%%					Value2 = maps:get(intelect_cof, V, 0),
%%					Value3 = maps:get(spirit_cof, V, 0),
%%					Value4 = maps:get(leadership_cof, V, 0),
%%					Value = Strength * Value1 + Intelect * Value2 + Spirit * Value3 + Leadership * Value4,
%%					add_prop(PropName, Value, Acc0);
%%				_ -> Acc0 end
%%		end, Acc, PropConf)
%%	end, PropDict, tb_pro_type_coefficient:get_list()),
%%
%%	PropDict2 =
%%	lists:foldl(fun(PropName, Acc) ->
%%		PropConf = tb_pro_quality_coefficient:get(PropName),
%%		maps:fold(fun(K, V, Acc0) ->
%%			case HeroQuality =:= K of
%%				true ->
%%					Value1 = maps:get(strength_cof, V, 0),
%%					Value2 = maps:get(intelect_cof, V, 0),
%%					Value3 = maps:get(spirit_cof, V, 0),
%%					Value4 = maps:get(leadership_cof, V, 0),
%%					Value = Strength * Value1 + Intelect * Value2 + Spirit * Value3 + Leadership * Value4,
%%					add_prop(PropName, Value, Acc0);
%%				_ -> Acc0 end
%%		end, Acc, PropConf)
%%	end, PropDict1, tb_pro_quality_coefficient:get_list()),
%%
%%	PropDict2.

%% 属性战力
prop_force(PropBase, PropDict, ValueK) ->
	FunctionPropList = tb_function_prop:get_list(),
	dict:fold(fun(K, V, Force) ->
		case tb_prop_force:get(K) of
			false -> Force;
			Conf ->
				FV = maps:get(ValueK, Conf, 0),
				case lists:member(K, FunctionPropList) of
					true ->
						V * FV + Force;
					_ ->
						KeyStr = lib_types:to_list(K),
						Prefix = lib_types:to_atom(string:sub_word(KeyStr, 1, $_)),
						BaseName = string:substr(KeyStr, string:chr(KeyStr, $_) + 1),
						KeyList = parsing_prop_key(PropBase, Prefix, BaseName),
						case KeyList of
							[] -> Force;
							_ -> V * FV + Force
						end
				end
		end
	end, 0, PropDict).

%% 面板战力
panel_force(PropDict, ValueK) ->
	%Power = get_prop(?POWER, PropDict),
	%PowerRate = 0,%get_prop(?PROP_PREFIX_HERO, ?POWER_RATE, PropDict),

	lists:foldl(fun(PropName, Acc) ->
		Conf = tb_prop_force_main:get(PropName),
		Value = maps:get(ValueK, Conf, 0),
		KeyStr = lib_types:to_list(PropName),
		Prefix = lib_types:to_atom(string:sub_word(KeyStr, 1, $_)),
		BaseName = lib_types:to_atom(string:substr(KeyStr, string:chr(KeyStr, $_) + 1)),
		PropValue = get_panel_prop(PropDict, Prefix, BaseName),
		%?DEBUG("panel_force: ~ts ~p ~p ~p ~p", [PropName, Prefix, BaseName, PropValue, Value]),
		PropValue * Value + Acc
	end, 0, tb_prop_force_main:get_list()).

get_panel_prop(PropDict, Prefix, ?ATTACK) ->
	panel_attack(Prefix, PropDict);
get_panel_prop(PropDict, Prefix, ?DEFENCE) ->
	panel_defence(Prefix, PropDict);
get_panel_prop(PropDict, Prefix, ?SPEED) ->
	panel_speed(Prefix, PropDict);
get_panel_prop(PropDict, Prefix, ?TROOPS) ->
	panel_troops(Prefix, PropDict);
get_panel_prop(PropDict, Prefix, ?CRIT) ->
	panel_crit(Prefix, PropDict);
get_panel_prop(PropDict, Prefix, ?PARRY) ->
	panel_parry(Prefix, PropDict);
get_panel_prop(_, _, _) ->
	0.

%%	HeroAttack = panel_attack(?PROP_PREFIX_HERO, PropDict),
%%	HeroAttackValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_HERO, ?ATTACK)), 0),
%%	FormerAttack = panel_attack(?PROP_PREFIX_FORMER, PropDict),
%%	FormerAttackValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_FORMER, ?ATTACK)), 0),
%%	LatterAttack = panel_attack(?PROP_PREFIX_LATTER, PropDict),
%%	LatterAttackValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_LATTER, ?ATTACK)), 0),
%%
%%	FormerDefence = panel_defence(?PROP_PREFIX_FORMER, PropDict),
%%	FormerDefenceValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_FORMER, ?DEFENCE)), 0),
%%	LatterDefence = panel_defence(?PROP_PREFIX_LATTER, PropDict),
%%	LatterDefenceValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_LATTER, ?DEFENCE)), 0),
%%
%%	FormerSpeed = panel_speed(?PROP_PREFIX_FORMER, PropDict),
%%	FormerSpeedValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_FORMER, ?SPEED)), 0),
%%	LatterSpeed = panel_speed(?PROP_PREFIX_LATTER, PropDict),
%%	LatterSpeedValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_LATTER, ?SPEED)), 0),
%%
%%	FormerTroops = panel_troops(?PROP_PREFIX_FORMER, PropDict),
%%	FormerTroopsValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_FORMER, ?TROOPS)), 0),
%%	LatterTroops = panel_troops(?PROP_PREFIX_LATTER, PropDict),
%%	LatterTroopsValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_LATTER, ?TROOPS)), 0),
%%
%%	HeroCrit = get_prop(?PROP_PREFIX_HERO, ?CRIT, PropDict),
%%	HeroCritRate = get_prop(?PROP_PREFIX_HERO, ?CRIT_RATE, PropDict),
%%	HeroCritValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_HERO, ?CRIT)), 0),
%%	FormerCrit = get_prop(?PROP_PREFIX_FORMER, ?CRIT, PropDict),
%%	FormerCritRate = get_prop(?PROP_PREFIX_FORMER, ?CRIT_RATE, PropDict),
%%	FormerCritValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_FORMER, ?CRIT)), 0),
%%	LatterCrit = get_prop(?PROP_PREFIX_LATTER, ?CRIT, PropDict),
%%	LatterCritRate = get_prop(?PROP_PREFIX_LATTER, ?CRIT_RATE, PropDict),
%%	LatterCritValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_LATTER, ?CRIT)), 0),
%%
%%	FormerParry = get_prop(?PROP_PREFIX_FORMER, ?PARRY, PropDict),
%%	FormerParryRate = get_prop(?PROP_PREFIX_FORMER, ?PARRY_RATE, PropDict),
%%	FormerParryValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_FORMER, ?PARRY)), 0),
%%	LatterParry = get_prop(?PROP_PREFIX_LATTER, ?PARRY, PropDict),
%%	LatterParryRate = get_prop(?PROP_PREFIX_LATTER, ?PARRY_RATE, PropDict),
%%	LatterParryValue = maps:get(force_value, tb_prop_force:get(prop_name(?PROP_PREFIX_LATTER, ?PARRY)), 0),
%%
%%	(Power + HeroAttack * HeroAttackValue + FormerAttack * FormerAttackValue + LatterAttack * LatterAttackValue +
%%		FormerDefence * FormerDefenceValue + LatterDefence * LatterDefenceValue + FormerSpeed * FormerSpeedValue +
%%		LatterSpeed * LatterSpeedValue + FormerTroops * FormerTroopsValue + LatterTroops * LatterTroopsValue +
%%		HeroCrit * (1 + HeroCritRate) * HeroCritValue + FormerCrit * (1 + FormerCritRate) * FormerCritValue +
%%		LatterCrit * (1 + LatterCritRate) * LatterCritValue + FormerParry * (1 + FormerParryRate) * FormerParryValue +
%%		LatterParry * (1 + LatterParryRate) * LatterParryValue) * (1 + PowerRate).

%% 面板攻击
panel_attack(Object, PropDict) ->
	get_prop(Object, ?ATTACK, PropDict) * (1 + get_prop(Object, ?ATTACK_RATE, PropDict)) + get_prop(Object, ?BASE_ATTACK, PropDict)
		* (1 + get_prop(Object, ?BASE_ATTACK_RATE, PropDict)) + get_prop(Object, ?FINAL_ATTACK, PropDict).
%% 面板防御
panel_defence(Object, PropDict) ->
	get_prop(Object, ?DEFENCE, PropDict) * (1 + get_prop(Object, ?DEFENCE_RATE, PropDict)) + get_prop(Object, ?BASE_DEFENCE, PropDict)
		* (1 + get_prop(Object, ?BASE_DEFENCE_RATE, PropDict)) + get_prop(Object, ?FINAL_DEFENCE, PropDict).
%% 面板速度
panel_speed(Object, PropDict) ->
	get_prop(Object, ?SPEED, PropDict) * (1 + get_prop(Object, ?SPEED_RATE, PropDict)) + get_prop(Object, ?BASE_SPEED, PropDict)
		* (1 + get_prop(Object, ?BASE_SPEED_RATE, PropDict)) + get_prop(Object, ?FINAL_SPEED, PropDict).
%% 面板兵力
panel_troops(Object, PropDict) ->
	get_prop(Object, ?TROOPS, PropDict) * (1 + get_prop(Object, ?TROOPS_RATE, PropDict)) + get_prop(Object, ?BASE_TROOPS, PropDict)
		* (1 + get_prop(Object, ?BASE_TROOPS_RATE, PropDict)) + get_prop(Object, ?FINAL_TROOPS, PropDict).
%% 面板暴击
panel_crit(Object, PropDict) ->
	get_prop(Object, ?CRIT, PropDict) * (1 + get_prop(Object, ?CRIT_RATE, PropDict)).
%% 面板格挡
panel_parry(Object, PropDict) ->
	get_prop(Object, ?PARRY, PropDict) * (1 + get_prop(Object, ?PARRY, PropDict)).


hero_to_prop_base(#hero{id = HeroId, star = Star, skill_list = SkillList} = Hero) when is_record(Hero, hero) ->
	ValidSkillList = lib_hero_skill_learning:calc_valid_skill_list(Hero),
	NewSkillList = lists:foldl(
		fun(Skill, List) ->
			[Skill#skill.id * 1000 + Skill#skill.level | List]
		end, SkillList, ValidSkillList),
	#prop_base{
		id = HeroId,
		sex = lib_hero_api:hero_sex(HeroId),
		type = lib_hero_api:hero_type(HeroId),
		quality = lib_hero_api:hero_quality(HeroId),
		color = lib_hero_api:hero_color(Star),
		front_corps = lib_hero_api:hero_front_corps(HeroId),
		back_corps = lib_hero_api:hero_back_corps(HeroId),
		skill_list = NewSkillList
	}
.

hero_base_to_prop_base(#hero_base{id = HeroId, star = Star, skill_list = SkillList} = HeroBase) when is_record(HeroBase, hero_base) ->
	#prop_base{
		id = HeroId,
		sex = lib_hero_api:hero_sex(HeroId),
		type = lib_hero_api:hero_type(HeroId),
		quality = lib_hero_api:hero_quality(HeroId),
		color = lib_hero_api:hero_color(Star),
		front_corps = lib_hero_api:hero_front_corps(HeroId),
		back_corps = lib_hero_api:hero_back_corps(HeroId),
		skill_list = SkillList
	}
.

debug_output_prop(PropDict, Force) ->
	ForceStr = io_lib:format("战力 ：~p~n", [Force]),
	FunctionPropList = tb_function_prop:get_list(),
	dict:fold(fun(PropName0, PropVal, Str) ->
		PropName = lib_types:to_list(PropName0),
		Format = "~ts ~n~ts[ ~ts ] : ~p",
		case PropVal > 0 andalso lists:member(PropName0, FunctionPropList) =:= false of
			false -> Str;
			true ->
				Prefix = string:sub_word(PropName, 1, $_),
				BaseName = string:substr(PropName, string:chr(PropName, $_) + 1),
				#{name_text := Name} = tb_prop:get(lib_types:to_atom(BaseName)),
				PropStr = Prefix ++ Name,
				io_lib:format(Format, [Str, PropName, PropStr, PropVal])
		end
	end, io_lib:format("~ts战斗属性：~n", [ForceStr]), PropDict).

debug_output_function_prop(PropDict) ->
	FunctionPropList = tb_function_prop:get_list(),
	dict:fold(fun(PropName0, PropVal, Str) ->
		PropName = lib_types:to_list(PropName0),
		Format = "~ts ~n~ts[ ~ts ] : ~p",
		case lists:member(PropName0, FunctionPropList) of
			false -> Str;
			true ->
				#{name_text := Name} = tb_function_prop:get(PropName0),
				io_lib:format(Format, [Str, PropName, Name, PropVal])
		end
	end, io_lib:format("功能属性：~n", []), PropDict).

debug_output_panel_prop(PropDict, Force) ->
	ForceStr = io_lib:format("战力 ：~p~n", [Force]),

	Hero1 = panel_attack(?PROP_PREFIX_HERO, PropDict),
	Hero2 = panel_crit(?PROP_PREFIX_HERO, PropDict),
	Str1 = io_lib:format("~ts英雄面板攻击 : ~p~n英雄面板暴击 : ~p~n", [ForceStr, Hero1, Hero2]),

	Former1 = panel_attack(?PROP_PREFIX_FORMER, PropDict),
	Former2 = panel_defence(?PROP_PREFIX_FORMER, PropDict),
	Former3 = panel_speed(?PROP_PREFIX_FORMER, PropDict),
	Former4 = panel_troops(?PROP_PREFIX_FORMER, PropDict),
	Former5 = panel_crit(?PROP_PREFIX_FORMER, PropDict),
	Former6 = panel_parry(?PROP_PREFIX_FORMER, PropDict),

	Str2 = io_lib:format("~ts~n前军面板攻击 : ~p~n前军面板防御 : ~p~n前军面板速度 : ~p~n前军面板兵力 : ~p~n前军面板暴击 : ~p~n前军面板格挡 : ~p~n",
		[Str1, Former1, Former2, Former3, Former4, Former5, Former6]),

	Latter1 = panel_attack(?PROP_PREFIX_LATTER, PropDict),
	Latter2 = panel_defence(?PROP_PREFIX_LATTER, PropDict),
	Latter3 = panel_speed(?PROP_PREFIX_LATTER, PropDict),
	Latter4 = panel_troops(?PROP_PREFIX_LATTER, PropDict),
	Latter5 = panel_crit(?PROP_PREFIX_LATTER, PropDict),
	Latter6 = panel_parry(?PROP_PREFIX_LATTER, PropDict),

	Str3 = io_lib:format("~ts~n后军面板攻击 : ~p~n后军面板防御 : ~p~n后军面板速度 : ~p~n后军面板兵力 : ~p~n后军面板暴击 : ~p~n后军面板格挡 : ~p~n",
		[Str2, Latter1, Latter2, Latter3, Latter4, Latter5, Latter6]),

	Str3.

output_prop(PropDict) ->
	FunctionPropList = tb_function_prop:get_list(),
	dict:fold(fun(PropName0, PropVal, Str) ->
		PropName = lib_types:to_list(PropName0),
		Format = "~ts ~n~ts : ~p",
		case PropVal > 0 of
			false -> Str;
			true ->
				PropStr =
				case lists:member(PropName0, FunctionPropList) of
					true ->
						#{name_text := Name0} = tb_function_prop:get(PropName0),
						Name0;
					_ ->
						Prefix = string:sub_word(PropName, 1, $_),
						BaseName = string:substr(PropName, string:chr(PropName, $_) + 1),
						#{name_text := Name1} = tb_prop:get(lib_types:to_atom(BaseName)),
						get_prefix_name(Prefix) ++ Name1
				end,
				io_lib:format(Format, [Str, PropStr, PropVal])
		end
	end, io_lib:format("战斗属性：~n", []), PropDict).

get_prefix_name(Prefix0) ->
	Prefix = lib_types:to_atom(Prefix0),
	if
		Prefix =:= ?PROP_PREFIX_HERO -> "英雄-";
		Prefix =:= ?PROP_PREFIX_FORMER -> "前军-";
		Prefix =:= ?PROP_PREFIX_LATTER -> "后军-";
		true -> "为解析前缀"
	end.

prop_name_str(PropName0) ->
	PropName = lib_types:to_atom(PropName0),
	FunctionPropList = tb_function_prop:get_list(),
	case lists:member(PropName, FunctionPropList) of
		true ->
			#{name_text := Name0} = tb_function_prop:get(PropName),
			Name0;
		_ ->
			Prefix = string:sub_word(lib_types:to_list(PropName), 1, $_),
			BaseName = string:substr(lib_types:to_list(PropName), string:chr(lib_types:to_list(PropName), $_) + 1),
			?INFO("~p, ~p~n", [Prefix, BaseName]),
			#{name_text := Name1} = tb_prop:get(lib_types:to_atom(BaseName)),
			get_prefix_name(Prefix) ++ Name1
	end.
prop_name_str(PropDict, PropName) ->
	Value = ?DICT_FETCH(lib_types:to_atom(PropName), PropDict, 0),
	io_lib:format("~ts : ~p", [prop_name_str(PropName), Value]).
