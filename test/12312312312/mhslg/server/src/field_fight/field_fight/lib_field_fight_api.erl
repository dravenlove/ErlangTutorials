%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 9月 2021 20:25
%%%-------------------------------------------------------------------
-module(lib_field_fight_api).
-author("df").

-include("common.hrl").
-include("hero.hrl").
-include("fight.hrl").
-include("fight_prop.hrl").
-include("field_combat_queue.hrl").
-include("player.hrl").
-include("combat_queue.hrl").
-include("fight_effect.hrl").
%% API
-export([
	to_field_combat_hero/2,

	unit_id/2,
	unit_id_to_hero/1,
	unit_id_to_player/1,

	can_activity_skill/3,
	target_allow_skill_activity/2,

	former_troops/1,
	latter_troops/1,
	get_trigger/1,
	hero_sex/1,
	hero_sex/2,
	hero_type/1,
	hero_type/2,
	hero_quality/1,
	hero_quality/2
]).

to_field_combat_hero(PlayerShow, HeroBase) ->
	PropBase = lib_fight_prop:hero_base_to_prop_base(HeroBase),
	to_field_combat_hero(PlayerShow, HeroBase, PropBase).
to_field_combat_hero(PlayerShow, HeroBase, PropBase) ->
	to_field_combat_hero(PlayerShow, HeroBase, PropBase, {max,max}).
to_field_combat_hero(PlayerShow, HeroBase, PropBase, {FormerTroops, LatterTroops}) ->
	FormerType = case PlayerShow#player_show.is_robot of
					 true -> HeroBase#hero_base.former_type;
					 _ -> lib_hero_api:hero_front_corps(HeroBase#hero_base.id)
				 end,
	LatterType = case PlayerShow#player_show.is_robot of
					 true -> HeroBase#hero_base.latter_type;
					 _ -> lib_hero_api:hero_back_corps(HeroBase#hero_base.id)
				 end,
	Hero_title = HeroBase#hero_base.honor_title,
	Conf = tb_item:get(Hero_title#hero_title.item_id),
	TitleId =
		case Conf of
			false 	-> 0;
			_ 		-> maps:get(honor_title, Conf)
		end,
	Prop = lib_fight_prop:statistics_prop_dict(PropBase, HeroBase#hero_base.prop_dict),
	Unit_id = unit_id(PlayerShow#player_show.id,HeroBase#hero_base.id),
	#field_combat_hero{
		unit_id = Unit_id,
		id = PlayerShow#player_show.id,
		is_robot = PlayerShow#player_show.is_robot,
		robot_base_id = HeroBase#hero_base.robot_base_id,
		name = PlayerShow#player_show.name,
		head_id = PlayerShow#player_show.head_icon,
		hero_id = HeroBase#hero_base.id,
		prop_base = PropBase,
		awaken = HeroBase#hero_base.awaken,
		hero_level = HeroBase#hero_base.level,
		country = PlayerShow#player_show.country,
		office = PlayerShow#player_show.country_pos,	%% 官职
		hero_star = HeroBase#hero_base.star,
		hero_force = HeroBase#hero_base.force,
		hero_title = TitleId,							%% 英雄称号
		formation = HeroBase#hero_base.formation_id,	%% 阵型
		former = #combat_army{
			type = FormerType,
			level = HeroBase#hero_base.front_level,
			stage = HeroBase#hero_base.front_stage,
			attack = trunc(lib_fight_prop:panel_attack(?PROP_PREFIX_FORMER, Prop)),
			defence = trunc(lib_fight_prop:panel_defence(?PROP_PREFIX_FORMER, Prop)),
			speed = trunc(lib_fight_prop:panel_speed(?PROP_PREFIX_FORMER, Prop)),
			troops = trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_FORMER, Prop)),
			cur_troops = ?IIF(FormerTroops =:= max, trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_FORMER, Prop)), FormerTroops)
		},
		latter = #combat_army{
			type = LatterType,
			level = HeroBase#hero_base.back_level,
			stage = HeroBase#hero_base.back_stage,
			attack = trunc(lib_fight_prop:panel_attack(?PROP_PREFIX_LATTER, Prop)),
			defence = trunc(lib_fight_prop:panel_defence(?PROP_PREFIX_LATTER, Prop)),
			speed = trunc(lib_fight_prop:panel_speed(?PROP_PREFIX_LATTER, Prop)),
			troops = trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_LATTER, Prop)),
			cur_troops = ?IIF(LatterTroops =:= max, trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_LATTER, Prop)), LatterTroops)
		},
		prop_dict = HeroBase#hero_base.prop_dict,
		equip_dict = HeroBase#hero_base.equip_item_dict,
		skill_list = lib_combat_queue_api:get_skill_list(HeroBase#hero_base.skill_list)
	}.

unit_id(PlayerId,Hero_Id) ->
	PlayerId * 1000 + Hero_Id.
unit_id_to_hero(Unit_id) ->
	Unit_id rem 1000.
unit_id_to_player(Unit_id) ->
	Unit_id div 1000.


can_activity_skill(Unit_id, ID, RandFlag) ->
	try
		%% 判定发动概率
		?JUDGE_RETURN(RandFlag orelse lib_field_fight_config:skill_active_rand(ID) > lib_fight_rand:rand_float(), 0),
		%% 判定发动技能对象是否能攻击
		SkillPrefix = skill_prefix(Unit_id, ID),
		if
			SkillPrefix =:= ?PROP_PREFIX_HERO -> ?JUDGE_RETURN(hero_can_active(Unit_id), 0);
			SkillPrefix =:= ?PROP_PREFIX_FORMER -> ?JUDGE_RETURN(former_can_active(Unit_id), 0);
			SkillPrefix =:= ?PROP_PREFIX_LATTER -> ?JUDGE_RETURN(latter_can_active(Unit_id), 0);
			true -> skip
		end,
		%% 判定需要联合的对象是否能攻击
		ArmyType = lib_field_fight_config:skill_trigger_army_type(ID),
		if
			ArmyType =:= ?SKILL_ARMY_LIMIT0 -> skip;
			ArmyType =:= ?SKILL_ARMY_LIMIT1 -> ?JUDGE_RETURN(former_can_active(Unit_id), 0);
			ArmyType =:= ?SKILL_ARMY_LIMIT2 -> ?JUDGE_RETURN(latter_can_active(Unit_id), 0);
			true -> skip
		end,
		%% 判定需要触发的英雄条件是否满足
		?JUDGE_RETURN(trigger_hero(Unit_id, ID), 0),
		%% 判定动需要额外条件是否满足
		ExtraType = lib_field_fight_config:skill_trigger_extra_type(ID),
		if
			ExtraType =:= ?SKILL_EXTRA_LIMIT1 ->
				ExtraTypeValue1 = lib_field_fight_config:skill_trigger_extra_value1(ID),
				ExtraTypeValue2 = lib_field_fight_config:skill_trigger_extra_value2(ID),
				Times = lib_field_fight_data:get_skill_active_times(Unit_id, ID),
				Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
				Max = Data#field_combat_hero.former#combat_army.troops + Data#field_combat_hero.latter#combat_army.troops,
				Cur = Data#field_combat_hero.former#combat_army.cur_troops + Data#field_combat_hero.latter#combat_army.cur_troops,
				?JUDGE_RETURN(Cur / Max < ExtraTypeValue1 andalso Times < ExtraTypeValue2, 0);
			true -> skip
		end,
		true
	catch
		throw:_ -> false;
		_:_  -> ?ERROR("can_active_skill error ~p~n", [erlang:get_stacktrace()]),false
	end.

target_allow_skill_activity(ID,Unit_id) ->
	try
		%% 判断是否被禁止发动
		?JUDGE_RETURN(skill_can_launch(ID,Unit_id), 0),
		%% 判定是否是生效的技能
		?JUDGE_RETURN(lib_fight_passive_skill:is_have_passive_effect(?EFFECT_GROUP_SKILL_NO_ACTIVE,
			#field_fight_data{
				unit_id = Unit_id,
				skill_id = ID
			}) =/= true, 0),
		true
	catch
		throw:_ -> false;
		_:_  -> ?ERROR("can_active_skill error ~p~n", [erlang:get_stacktrace()]),false
	end.

trigger_hero(Unit_id, SkillId) ->
	try
		HeroType = lib_field_fight_config:skill_trigger_hero_type(SkillId),
		Value = lib_field_fight_config:skill_trigger_hero_value(SkillId),
		HeroIdList = lib_field_fight_data:get_player_heros(Unit_id),
		Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
		List = case Data#field_combat_hero.is_robot of
				   true ->	[maps:get(hero_id, tb_monster_base:get(Base_id))|| Base_id <- HeroIdList];
				   false->  HeroIdList
			   end,
		if
			HeroType =:= ?SKILL_HERO_LIMIT0 -> skip;
			HeroType =:= ?SKILL_HERO_LIMIT1 -> ?JUDGE_RETURN(erlang:length(List) > 1, 0);
			HeroType =:= ?SKILL_HERO_LIMIT2 -> ?JUDGE_RETURN(lists:member(Value, List), 0);
			HeroType =:= ?SKILL_HERO_LIMIT3 -> ?JUDGE_RETURN(is_have_hero_type(List, Value), 0);
			HeroType =:= ?SKILL_HERO_LIMIT4 -> ?JUDGE_RETURN(is_have_hero_sex(List, Value), 0);
			HeroType =:= ?SKILL_HERO_LIMIT5 -> ?JUDGE_RETURN(is_have_hero_quality(List, Value), 0);
			HeroType =:= ?SKILL_HERO_LIMIT6 -> ?JUDGE_RETURN(is_have_hero_color(Unit_id, Value), 0);
			true -> skip
		end,
		true
	catch
		_:_  -> false
	end.

skill_can_launch(Skill_ID,Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	SKillConf = tb_field_skill:get(Skill_ID),
	lists:foldl(fun(SkillId, Acc) ->
		try
			?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
			lists:foldl(fun(Conf, _Acc1) ->
				?JUDGE_RETURN(maps:get(effect,Conf) =:= ?EFFECT_SKILL_NO_LAUNCH,0),
				Active_passive = maps:get(active_passive,Conf,0),
				?JUDGE_RETURN(maps:get(active_passive,SKillConf) =:= Active_passive orelse Active_passive =:= 0,0),
				Skill_type = maps:get(skill_type,Conf,0),
				?JUDGE_RETURN(maps:get(skill_type,SKillConf) =:= Skill_type orelse Skill_type =:= 0,0),
				Skill_type_add = maps:get(skill_type_add,Conf,0),
				?JUDGE_RETURN(maps:get(skill_type_add,SKillConf) =:= Skill_type_add orelse Skill_type_add =:= 0,0),
				Is_hero_possess = maps:get(is_hero_possess,Conf,0),
				case Is_hero_possess of
					1 -> ?JUDGE_RETURN(lists:member(Skill_ID,Data#field_combat_hero.skill_list),0);
					0 -> skip
				end,
				throw({ok})
			end, Acc, lib_field_fight_config:passive_skill_effect(SkillId))
		catch
			throw:{ok} -> false;
			_:_  -> Acc
		end
	end, true, Data#field_combat_hero.skill_list).

former_die(Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	Former = Data#field_combat_hero.former,
	Former#combat_army.cur_troops =< 0.
latter_die(Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	Latter = Data#field_combat_hero.latter,
	Latter#combat_army.cur_troops =< 0.
former_troops(Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	Former = Data#field_combat_hero.former,
	Former#combat_army.cur_troops.
latter_troops(Unit_id) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	Latter = Data#field_combat_hero.latter,
	Latter#combat_army.cur_troops.

prefix_die(Unit_id, ?PROP_PREFIX_HERO) ->
	former_die(Unit_id) andalso latter_die(Unit_id);
prefix_die(Unit_id, ?PROP_PREFIX_FORMER) ->
	former_die(Unit_id);
prefix_die(Unit_id, ?PROP_PREFIX_LATTER) ->
	latter_die(Unit_id);
prefix_die(_, _) ->
	false.

hero_can_active(Unit_id) ->
	try
		?JUDGE_RETURN(not prefix_die(Unit_id, ?PROP_PREFIX_HERO), 0),
			%% todo
%%		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_HERO, ?FIGHT_BUFF_TYPE_1013), 0),
		true
	catch
		_:_  -> false
	end.

former_can_active(Unit_id) ->
	try
		?JUDGE_RETURN(not former_die(Unit_id), 0),
		%% todo
%%		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_FORMER, ?FIGHT_BUFF_TYPE_1001), 0),
%%		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_FORMER, ?FIGHT_BUFF_TYPE_1004), 0),
		true
	catch
		_:_  -> false
	end.
latter_can_active(Unit_id) ->
	try
		?JUDGE_RETURN(not latter_die(Unit_id), 0),
		%% todo
%%		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_LATTER, ?FIGHT_BUFF_TYPE_1001), 0),
%%		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_LATTER, ?FIGHT_BUFF_TYPE_1004), 0),
		true
	catch
		_:_  -> false
	end.




skill_prefix(Unit_id, SkillID) ->
	Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
	SkillType = lib_field_fight_config:skill_type(SkillID),
	Former = Data#field_combat_hero.former,
	Latter = Data#field_combat_hero.latter,
	Type = lib_field_fight_config:skill_type_add(SkillID),
	case SkillType of
		?SKILL_TYPE0 ->
			if
				Former#combat_army.type =:= Type -> ?PROP_PREFIX_FORMER;
				Latter#combat_army.type =:= Type -> ?PROP_PREFIX_LATTER;
				true -> 0
			end;
		?SKILL_TYPE4 ->
			if
				Former#combat_army.type =:= Type -> ?PROP_PREFIX_FORMER;
				Latter#combat_army.type =:= Type -> ?PROP_PREFIX_LATTER;
				true -> 0
			end;
		_ -> ?PROP_PREFIX_HERO
	end.

get_trigger(Type) ->
	case Type of
		?TRIGGER_TYPE_1001->#skill_trigger{type = ?TRIGGER_TYPE_1001};
		?TRIGGER_TYPE_1002->skip;
		?TRIGGER_TYPE_1003->skip;
		?TRIGGER_TYPE_1004->skip
	end.

hero_sex(HeroId) ->
	IsRobot = (tb_hero:get(HeroId) =:= false),
	case IsRobot of
		true -> lib_robot_api:monster_sex(HeroId);
		false -> lib_hero_api:hero_sex(HeroId)
	end
.
hero_sex(Fighter, IsRobot) ->
	case IsRobot of
		true -> lib_robot_api:monster_sex(Fighter#combat_hero.robot_base_id);
		false -> lib_hero_api:hero_sex(Fighter#combat_hero.hero_id)
	end.

hero_type(HeroId) ->
	IsRobot = (tb_hero:get(HeroId) =:= false),
	case IsRobot of
		true -> lib_robot_api:monster_type(HeroId);
		false -> lib_hero_api:hero_type(HeroId)
	end
.
hero_type(Fighter, IsRobot) ->
	case IsRobot of
		true -> lib_robot_api:monster_type(Fighter#combat_hero.robot_base_id);
		false -> lib_hero_api:hero_type(Fighter#combat_hero.hero_id)
	end.

hero_quality(HeroId) ->
	IsRobot = (tb_hero:get(HeroId) =:= false),
	case IsRobot of
		true -> lib_robot_api:monster_quality(HeroId);
		false -> lib_hero_api:hero_quality(HeroId)
	end
.

hero_quality(Data, IsRobot) ->
	case IsRobot of
		true -> lib_robot_api:monster_quality(Data#field_combat_hero.robot_base_id);
		false -> lib_hero_api:hero_quality(Data#field_combat_hero.hero_id)
	end.
is_have_hero_type(List, V) ->
	try
		lists:foreach(fun(Id) ->
			case lib_fight_api:hero_type(Id) =:= V of
				true -> throw(ok);
				false -> skip
			end
		end, List),
		false
	catch
		_:_  -> true
	end.
is_have_hero_sex(List, V) ->
	try
		lists:foreach(fun(Id) ->
			?JUDGE_RETURN(lib_fight_api:hero_sex(Id) =/= V, 0)
		end, List),
		false
	catch
		_:_  -> true
	end.
is_have_hero_quality(List, V) ->
	try
		lists:foreach(fun(Id) ->
			?JUDGE_RETURN(lib_fight_api:hero_quality(Id) =/= V, 0)
		 end, List),
		false
	catch
		_:_  -> true
	end.
is_have_hero_color(Unit_id, V) ->
	try
		Data = lib_field_fight_data:get_field_combat_hero(Unit_id),
		lists:foreach(fun(Tmp) ->
			case Data#field_combat_hero.id =:= Tmp#field_combat_hero.id andalso Data#field_combat_hero.hero_id =/= Tmp#field_combat_hero.hero_id of
				true -> ?JUDGE_RETURN(hero_quality(Tmp, Tmp#field_combat_hero.is_robot) =/= V, 0);
				_ -> skip
			end
		end, lib_field_fight_data:get_field_combat_heros(Unit_id)),
		false
	catch
		_:_  -> true
	end.

%%active_skill_extra_effect(FightData, ActiveTime) ->
%%	?JUDGE_RETURN(FightData#fight_data.is_be_invalid =/= true, 0),
%%	lists:foldl(fun(Conf, Acc) ->
%%		Time = maps:get(active_time, Conf, ?ACTIVE_EFFECT_TIME2),
%%		if
%%			ActiveTime =:= Time -> lib_fight_effect:effect(Conf, FightData#fight_data{flag = Acc}), ?EFFECT_NO_TIPS;
%%			true -> Acc
%%		end
%%	end, FightData#fight_data.flag, lib_fight_config:skill_add_effect(FightData#fight_data.skill_id,FightData#fight_data.object)).
%%
%%compete_4d_prop(L_UnitId, R_UnitId, PropName) ->
%%	try
%%		L = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_field_fight_data:get_prop(L_UnitId)),
%%		R = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_field_fight_data:get_prop(R_UnitId)),
%%		L > R
%%	catch
%%		throw:{_,Type}  -> Type
%%	end.
%%
%%compete_army_amount(L_UnitId, R_UnitId) ->
%%	try
%%		AData = lib_field_fight_data:get_field_combat_hero(L_UnitId),
%%		DData = lib_field_fight_data:get_field_combat_hero(R_UnitId),
%%		AAmount = AData#field_combat_hero.former#combat_army.cur_troops + AData#field_combat_hero.latter#combat_army.cur_troops,
%%		DAmount = DData#field_combat_hero.former#combat_army.cur_troops + DData#field_combat_hero.latter#combat_army.cur_troops,
%%		AAmount > DAmount
%%	catch
%%		_:_ -> false
%%	end.
%%
%%compete_4d_total_prop(L_UnitId, R_UnitId, ConfType) ->
%%	try
%%		L1 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?STRENGTH,  lib_field_fight_data:get_prop(L_UnitId)),
%%		L2 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?INTELECT,  lib_field_fight_data:get_prop(L_UnitId)),
%%		L3 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?SPIRIT,  lib_field_fight_data:get_prop(L_UnitId)),
%%		L4 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?LEADERSHIP,  lib_field_fight_data:get_prop(L_UnitId)),
%%		L = L1 + L2 + L3 + L4,
%%		R1 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?STRENGTH, lib_field_fight_data:get_prop(R_UnitId)),
%%		R2 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?INTELECT, lib_field_fight_data:get_prop(R_UnitId)),
%%		R3 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?SPIRIT, lib_field_fight_data:get_prop(R_UnitId)),
%%		R4 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?LEADERSHIP, lib_field_fight_data:get_prop(R_UnitId)),
%%		R = R1 + R2 + R3 + R4,
%%		case ConfType of
%%			0 -> L > R;
%%			1 -> L =< R
%%		end
%%	catch
%%		throw:{_,Type}  -> Type
%%	end.
%%
%%compete_force(L_UnitId, R_UnitId) ->
%%	AData = lib_field_fight_data:get_field_combat_hero(L_UnitId),
%%	DData = lib_field_fight_data:get_field_combat_hero(R_UnitId),
%%	AData#field_combat_hero.hero_force >= DData#field_combat_hero.hero_force.
%%
%%compete_speed(L_UnitId, R_UnitId, Prefix) ->
%%	L = lib_fight_prop:get_prop(Prefix, ?SPEED, lib_field_fight_data:get_prop(L_UnitId)),
%%	R = lib_fight_prop:get_prop(Prefix, ?SPEED, lib_field_fight_data:get_prop(R_UnitId)),
%%	L >= R.