%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_api.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_api).
-include("common.hrl").
-include("fight.hrl").
-include("hero.hrl").
-include("fight_prop.hrl").
-include("fight_buff.hrl").
-include("fight_effect.hrl").
-include("combat_queue.hrl").

%% API
-export([
	fight_init/1,
	add_fight_prop1/3,
	add_fight_prop1/4,
	clean_fight_prop1/0,
	add_fight_prop2/3,
	add_fight_prop2/4,
	clean_fight_prop2/0,
	add_fight_prop3/3,
	clean_fight_prop3/0,
	get_skill_flag/1,
	update_skill_flag/2,
	calc_launch_skill_list/0,
	compete_4d_prop/3,
	compete_4d_total_prop/3,
	compete_force/2,
	compete_speed/2,
	compete_army_amount/2,
	get_4d_list/1,
	calc_avoid_rate/4,						%% 实际闪避率
	calc_parry_rate/4,						%% 实际格挡率
	calc_cit_rate/4,						%% 实际暴击率
	calc_attack_type/1,
	skill_prefix/2,							%% 判定技能的释放对象（前军/后军/英雄）
	troops_damping/3,
	skill_hurt_rate/1,
	active_skill_main_effect/1,
	check_finish/1,
	is_die/1,
	win_type/1,
	can_active_skill/3,
	active_skill_extra_effect/2,
	deduct_health/2,						%% 扣除血量
	recover_health/2,
	recover_health_former/1,
	recover_health_latter/1,
	skill_hurt/3,
	add_round/1,
	former_die/1,
	latter_die/1,
	former_troops/1,
	latter_troops/1,
	round_can_active/1,
	round_can_active/2,
	hero_sex/1,
	hero_sex/2,
	hero_type/1,
	hero_type/2,
	hero_quality/1,
	hero_quality/2,
	insert_buff_list/0,
	trigger_hero/2,
	round_can_active_extra/1,
	active_skill_round_active/2,
	get_skill_sort_group/1,
	is_have_hero_type/2,
	get_group_skill_level/2,
	fixed_hurt/1,
	get_skill_rate/3,				%% 技能发动概率
	get_add_skill_rate/2,			%% 技能增加的发动概率
	skill_can_launch/2,				%% 技能是否被效果禁止发动
	get_skill_hero_list/2,			%% 合击技联合的英雄列表
	buff_can_activity/2,			%% buff能否释放
	round_to_round_num/2,
	round_num_to_round/1
]).

fight_init(CombatQueue) ->
	lib_fight_data:put_rank_init(lib_fight_rand:init_rand_state(rand:uniform(?FIGHT_RANK_INIT))),
	lib_fight_data:put_combat_queue(CombatQueue).

add_fight_prop1(Object, Name, Value) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Prop2 = lib_fight_prop:add_prop(Name, Value, Fighter#combat_hero.fight_prop1),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{fight_prop1 = Prop2}).
add_fight_prop1(Object, Prefix, Name, Value) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Prop2 = lib_fight_prop:add_prop(Prefix, Name, Value, Fighter#combat_hero.fight_prop1),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{fight_prop1 = Prop2}).
clean_fight_prop1() ->
	FighterL = lib_fight_data:get_fighter(?FIGHTER_TYPE_L),
	lib_fight_data:put_fighter(?FIGHTER_TYPE_L, FighterL#combat_hero{fight_prop1 = dict:new()}),
	FighterR = lib_fight_data:get_fighter(?FIGHTER_TYPE_R),
	lib_fight_data:put_fighter(?FIGHTER_TYPE_R, FighterR#combat_hero{fight_prop1 = dict:new()}).

add_fight_prop2(Object, Name, Value) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Prop2 = lib_fight_prop:add_prop(Name, Value, Fighter#combat_hero.fight_prop2),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{fight_prop2 = Prop2}).
add_fight_prop2(Object, Prefix, Name, Value) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Prop2 = lib_fight_prop:add_prop(Prefix, Name, Value, Fighter#combat_hero.fight_prop2),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{fight_prop2 = Prop2}).
clean_fight_prop2() ->
	FighterL = lib_fight_data:get_fighter(?FIGHTER_TYPE_L),
	lib_fight_data:put_fighter(?FIGHTER_TYPE_L, FighterL#combat_hero{fight_prop2 = dict:new()}),
	FighterR = lib_fight_data:get_fighter(?FIGHTER_TYPE_R),
	lib_fight_data:put_fighter(?FIGHTER_TYPE_R, FighterR#combat_hero{fight_prop2 = dict:new()}).

add_fight_prop3(Object, Name, Value) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Prop3 = lib_fight_prop:add_prop(Name, Value, Fighter#combat_hero.fight_prop3),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{fight_prop3 = Prop3}).
clean_fight_prop3() ->
	clean_fight_prop3(?FIGHTER_TYPE_L),
	clean_fight_prop3(?FIGHTER_TYPE_R).
clean_fight_prop3(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{fight_prop3 = dict:new()}).

get_skill_flag(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Fighter#combat_hero.skill_flag.
update_skill_flag(Object,Type) ->
	Fighter = lib_fight_data:get_fighter(Object),
	lib_fight_data:put_fighter(Object, Fighter#combat_hero{skill_flag = Type}).


calc_launch_skill_list() ->
	{A,_} = lib_fight_data:get_cur_round(),
	{LDict, LF1, LF2, LL1, LL2} = lib_fight_config:get_skill_dict(?FIGHTER_TYPE_L),
	{RDict, RF1, RF2, RL1, RL2} = lib_fight_config:get_skill_dict(?FIGHTER_TYPE_R),
	SkillList =
	lists:foldl(fun(Group, Acc0) ->
		LDict0 = ?DICT_FETCH(Group, LDict, dict:new()),
		RDict0 = ?DICT_FETCH(Group, RDict, dict:new()),
		lists:foldl(fun(Sort, Acc1) ->
			LDict1 = ?DICT_FETCH(Sort, LDict0, dict:new()),
			RDict1 = ?DICT_FETCH(Sort, RDict0, dict:new()),
			lists:foldl(fun(Type, Acc2) ->
				LList2 = ?DICT_FETCH(Type, LDict1, []),
				RList2 = ?DICT_FETCH(Type, RDict1, []),
				List = lists:sort(fun sort_skill/2, lists:append(LList2, RList2)),
				lists:append(Acc2, List)
			end, Acc1, ?SKILL_SORT_TYPES)
		end, Acc0, ?SKILL_PRIORITY_LIST)
	end, [], ?SKILL_GROUPS),
	SkillList1 =
	case LF1 > 0 andalso LF2 =:= true andalso A >= ?FIGHT_ROUND2 of
		true ->
			case LL1 > 0 andalso LL2 =:= true of
				true ->
					lists:append(SkillList, [{?FIGHTER_TYPE_L, LF1, ?SKILL_TYPE0}, {?FIGHTER_TYPE_L, LL1, ?SKILL_TYPE0}]);
				_ ->
					lists:append(SkillList, [{?FIGHTER_TYPE_L, LF1, ?SKILL_TYPE0}])
			end;
		_ ->
			case LL1 > 0 andalso LL2 =:= true andalso A >= ?FIGHT_ROUND2 of
				true ->
					lists:append(SkillList, [{?FIGHTER_TYPE_L, LL1, ?SKILL_TYPE0}]);
				_ ->
					SkillList
			end
	end,
	case RF1 > 0 andalso RF2 =:= true andalso A >= ?FIGHT_ROUND2 of
		true ->
			case RL1 > 0 andalso RL2 =:= true of
				true ->
					lists:append(SkillList1, [{?FIGHTER_TYPE_R, RF1, ?SKILL_TYPE0}, {?FIGHTER_TYPE_R, RL1, ?SKILL_TYPE0}]);
				_ ->
					lists:append(SkillList1, [{?FIGHTER_TYPE_R, RF1, ?SKILL_TYPE0}])
			end;
		_ ->
			case RL1 > 0 andalso RL2 =:= true andalso A >= ?FIGHT_ROUND2 of
				true ->
					lists:append(SkillList1, [{?FIGHTER_TYPE_R, RL1, ?SKILL_TYPE0}]);
				_ ->
					SkillList1
			end
	end.
sort_skill({LObject, LID, Type}, {RObject, RID, _Type}) ->
	sort_skill(Type, {LObject, LID}, {RObject, RID}).
sort_skill(?SKILL_SORT_TYPE0, {LObject, LID}, {RObject, RID}) ->
	LFighter = lib_fight_data:get_fighter(LObject),
	RFighter = lib_fight_data:get_fighter(RObject),
	case (LFighter#combat_hero.awaken =:= RFighter#combat_hero.awaken) of
		true ->
			case (LFighter#combat_hero.hero_force =:= RFighter#combat_hero.hero_force) of
				true ->
					lib_fight_config:skill_sort_value(LID) < lib_fight_config:skill_sort_value(RID);
				_ ->
					LFighter#combat_hero.hero_force >= RFighter#combat_hero.hero_force
			end;
		_ ->
			LFighter#combat_hero.awaken =:= ?HERO_AWAKEN_YES
	end;
sort_skill(?SKILL_SORT_TYPE1, {LObject, LID}, {RObject, RID}) ->
	LFighter = lib_fight_data:get_fighter(LObject),
	RFighter = lib_fight_data:get_fighter(RObject),
	case (LFighter#combat_hero.hero_force =:= RFighter#combat_hero.hero_force) of
		true ->
			lib_fight_config:skill_sort_value(LID) < lib_fight_config:skill_sort_value(RID);
		_ ->
			LFighter#combat_hero.hero_force >= RFighter#combat_hero.hero_force
	end;
sort_skill(?SKILL_SORT_TYPE2, {LObject, LID}, {RObject, RID}) ->
	case lib_fight_data:get_army_speed(LObject, lib_fight_config:skill_type_add(LID)) =:=
		lib_fight_data:get_army_speed(RObject, lib_fight_config:skill_type_add(RID)) of
		true ->
			lib_fight_config:skill_sort_value(LID) < lib_fight_config:skill_sort_value(RID);
		_ ->
			lib_fight_data:get_army_speed(LObject, lib_fight_config:skill_type_add(LID)) >
				lib_fight_data:get_army_speed(RObject, lib_fight_config:skill_type_add(RID))
	end;
sort_skill(_, {_LObject, LID}, {_RObject, RID}) ->
	lib_fight_config:skill_sort_value(LID) < lib_fight_config:skill_sort_value(RID).


compete_4d_prop(Object, TargetObject, PropName) ->
	try
		L = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_fight_data:get_fighter_prop(Object)),
		R = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, PropName, lib_fight_data:get_fighter_prop(TargetObject)),
		L > R
	catch
	    throw:{_,Type}  -> Type
	end.

compete_army_amount(Object, TargetObject) ->
	try
		AFighter = lib_fight_data:get_fighter(Object),
		DFighter = lib_fight_data:get_fighter(TargetObject),
		AAmount = AFighter#combat_hero.former#combat_army.cur_troops + AFighter#combat_hero.latter#combat_army.cur_troops,
		DAmount = DFighter#combat_hero.former#combat_army.cur_troops + DFighter#combat_hero.latter#combat_army.cur_troops,
		AAmount > DAmount
	catch
		_:_ -> false
	end.

compete_4d_total_prop(Object, TargetObject, ConfType) ->
	try
		L1 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?STRENGTH, lib_fight_data:get_fighter_prop(Object)),
		L2 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?INTELECT, lib_fight_data:get_fighter_prop(Object)),
		L3 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?SPIRIT, lib_fight_data:get_fighter_prop(Object)),
		L4 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?LEADERSHIP, lib_fight_data:get_fighter_prop(Object)),
		L = L1 + L2 + L3 + L4,
		R1 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?STRENGTH, lib_fight_data:get_fighter_prop(TargetObject)),
		R2 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?INTELECT, lib_fight_data:get_fighter_prop(TargetObject)),
		R3 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?SPIRIT, lib_fight_data:get_fighter_prop(TargetObject)),
		R4 = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?LEADERSHIP, lib_fight_data:get_fighter_prop(TargetObject)),
		R = R1 + R2 + R3 + R4,
		case ConfType of
			0 -> L > R;
			1 -> L =< R
		end
	catch
		throw:{_,Type}  -> Type
	end.

compete_force(Object, TargetObject) ->
	LFighter = lib_fight_data:get_fighter(Object),
	RFighter = lib_fight_data:get_fighter(TargetObject),
	LFighter#combat_hero.hero_force >= RFighter#combat_hero.hero_force.

compete_speed(Object, Prefix) ->
	L = lib_fight_prop:get_prop(Prefix, ?SPEED, lib_fight_data:get_fighter_prop(Object)),
	R = lib_fight_prop:get_prop(Prefix, ?SPEED, lib_fight_data:get_fighter_prop(?OTHER(Object))),
	L >= R.

get_4d_list(Prop) ->
	A = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?STRENGTH, Prop),
	B = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?INTELECT, Prop),
	C = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?SPIRIT, Prop),
	D = lib_fight_prop:get_prop(?PROP_PREFIX_HERO, ?LEADERSHIP, Prop),
	[A, B, C, D].

calc_avoid_rate(AProp, DProp, APrefix, DPrefix) ->
	AHit = lib_fight_prop:get_prop(APrefix, ?HIT, AProp),
	AHitRate = lib_fight_prop:get_prop(APrefix, ?HIT_RATE, AProp),
	DAvoid = lib_fight_prop:get_prop(DPrefix, ?AVOID, DProp),
	DAvoidRate = lib_fight_prop:get_prop(DPrefix, ?AVOID_RATE, DProp),
%%	Num = 0.05 + DAvoid * (1 + DAvoidRate) - AHit * (1 + AHitRate),
	Num = DAvoid * (1 + DAvoidRate) - AHit * (1 + AHitRate),
	max(0, Num).
%%	min(0.5, max(0, Num)).

calc_parry_rate(AProp, DProp, APrefix, DPrefix) ->
	APiercing = lib_fight_prop:get_prop(APrefix, ?PIERCING, AProp),
	APiercingRate = lib_fight_prop:get_prop(APrefix, ?PIERCING_RATE, AProp),
	DParry = lib_fight_prop:get_prop(DPrefix, ?PARRY, DProp),
	DParryRate = lib_fight_prop:get_prop(DPrefix, ?PARRY_RATE, DProp),
	Num = 0.05 + DParry * (1 + DParryRate) - APiercing * (1 + APiercingRate),
	min(0.8, max(0, Num)).

calc_cit_rate(AProp, DProp, APrefix, DPrefix) ->
	ACit = lib_fight_prop:get_prop(APrefix, ?CRIT, AProp),
	ACitRate = lib_fight_prop:get_prop(APrefix, ?CRIT_RATE, AProp),
	DCitRed = lib_fight_prop:get_prop(DPrefix, ?CRIT_RED, DProp),
	DCitRedRate = lib_fight_prop:get_prop(DPrefix, ?CRIT_RED_RATE, DProp),
	Num = 0.05 + ACit * (1 + ACitRate) - DCitRed * (1 + DCitRedRate),
	min(0.8, max(0, Num)).

calc_attack_type(FightData) ->
	try
		case lib_fight_effect:get_effect_certainly_crit(FightData) of
			true -> throw(?FIGHT_ATTACK_TYPE3);
			_ -> skip
		end,
		Object = FightData#fight_data.object,
		Target = FightData#fight_data.target_object,
		ATmpProp = lib_fight_effect:effect_tmp_prop(FightData, Object),
		DTmpProp = lib_fight_effect:effect_tmp_prop(FightData, Target),
		AProp = lib_fight_prop:increase_prop([ATmpProp, lib_fight_data:get_fighter_prop(Object)]),
		DProp = lib_fight_prop:increase_prop([DTmpProp, lib_fight_data:get_fighter_prop(Target)]),

		Avoid = calc_avoid_rate(AProp, DProp, FightData#fight_data.prefix, FightData#fight_data.target_prefix),
		Parry = calc_parry_rate(AProp, DProp, FightData#fight_data.prefix, FightData#fight_data.target_prefix),
		Cit = calc_cit_rate(AProp, DProp, FightData#fight_data.prefix, FightData#fight_data.target_prefix),
		Rand = lib_fight_rand:rand_float(),
		case FightData#fight_data.effect_type =:= ?EFFECT_FIXED_DAMAGE of
			 true -> ?FIGHT_ATTACK_TYPE4;
			 false-> if
						 FightData#fight_data.is_be_invalid =:= true ->?FIGHT_ATTACK_TYPE5;
						 Rand =< Avoid -> ?FIGHT_ATTACK_TYPE1;
						 Rand =< Avoid + Parry -> ?FIGHT_ATTACK_TYPE2;
						 Rand =< Avoid + Parry + Cit -> ?FIGHT_ATTACK_TYPE3;
						 true -> ?FIGHT_ATTACK_TYPE4
					 end
		end
	catch
	    throw:AttackType  -> AttackType;
		_:_ -> ?DEBUG("~p~n", [erlang:get_stacktrace()])
	end.

skill_prefix(Object, SkillID) ->
	SkillType = lib_fight_config:skill_type(SkillID),
	case SkillType of
		?SKILL_TYPE0 ->
			Type = lib_fight_config:skill_type_add(SkillID),
			Former = lib_fight_data:get_former(Object),
			Latter = lib_fight_data:get_latter(Object),
			if
				Former#combat_army.type =:= Type -> ?PROP_PREFIX_FORMER;
				Latter#combat_army.type =:= Type -> ?PROP_PREFIX_LATTER;
				true -> 0
			end;
		?SKILL_TYPE4 ->
			Type = lib_fight_config:skill_type_add(SkillID),
			Former = lib_fight_data:get_former(Object),
			Latter = lib_fight_data:get_latter(Object),
			if
				Former#combat_army.type =:= Type -> ?PROP_PREFIX_FORMER;
				Latter#combat_army.type =:= Type -> ?PROP_PREFIX_LATTER;
				true -> 0
			end;
		_ -> ?PROP_PREFIX_HERO
	end.

troops_damping(Object, Prefix, FightData) ->
	case lib_fight_passive_skill:is_have_passive_effect(?EFFECT_IGNORE_TROOPS_DAMPING, FightData#fight_data{
		object = Object,
		prefix = Prefix
	}) of
		true -> 0;
		_ ->
			Fighter = lib_fight_data:get_fighter(Object),

%%			?INFO("skill_id ~p",[FightData#fight_data.skill_id]),
%%			?INFO("Prefix ~p",[Prefix]),
			case Prefix of
				?PROP_PREFIX_HERO -> 0;
				?PROP_PREFIX_FORMER ->
					Army = Fighter#combat_hero.former,
					Former = Army#combat_army.cur_troops / Army#combat_army.troops * 100,
					lib_fight_config:troops_damping(Object,Prefix,Former);
				?PROP_PREFIX_LATTER ->
					Army = Fighter#combat_hero.latter,
					Latter = Army#combat_army.cur_troops / Army#combat_army.troops * 100,
					lib_fight_config:troops_damping(Object,Prefix,Latter);
				_ -> ?INFO("Prefix ~p",[Prefix]),0
			end
	end.

round_hurt() ->
	{A,B} = lib_fight_data:get_cur_round(),
	case A of
		?FIGHT_ROUND4 -> lib_fight_config:round_hurt(B);
		_ -> 0
	end.

skill_hurt_rate(Conf) ->
	{L,R} = lib_fight_config:fetch_skill_hurt(Conf),
	if
		L =:= 0 andalso R =:= 0 -> maps:get(value_a, Conf, 0);
		R =:= 0 -> L;
		true ->
			lib_fight_rand:rand_float(L,R)
	end.

active_skill_main_effect(FightData) ->
	?JUDGE_RETURN(FightData#fight_data.is_be_invalid =/= true, 0),
	lib_fight_effect:effect(tb_skill:get(FightData#fight_data.skill_id), FightData).

skill_hurt(0, _, _) ->
	rend;
skill_hurt(Times, FightData, Conf) ->
	?INFO("33"),
	deduct_health(FightData, Conf),
	lib_fight_effect:related_effect(FightData, Conf),
	skill_hurt(Times - 1, FightData#fight_data{flag = ?EFFECT_NO_TIPS}, Conf).

get_skill_hurt_rate(Object, Conf, FightData) ->
	Rate = skill_hurt_rate(Conf),
	AddValue = lib_fight_passive_skill:passive_effect_value(?EFFECT_INCREASE_SKILL_HURT, FightData#fight_data{object = Object}),
	case maps:get(only_one_flag, Conf, false) of
		true -> maps:get(only_one_hurt, Conf, Rate) + AddValue;
		_ -> Rate + AddValue
	end.

calc_hurt(FightData, DPrefix, Conf) ->
	Object = FightData#fight_data.object,
	Prefix = FightData#fight_data.prefix,
	Target = FightData#fight_data.target_object,
	SkillId = FightData#fight_data.skill_id,
	AFighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	DFighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),

	ATmpProp = lib_fight_effect:effect_tmp_prop(FightData, Object),
	DTmpProp = lib_fight_effect:effect_tmp_prop(FightData, Target),
	AProp = lib_fight_prop:increase_prop([ATmpProp, lib_fight_data:get_fighter_prop(Object)]),
	DProp = lib_fight_prop:increase_prop([DTmpProp, lib_fight_data:get_fighter_prop(Target)]),

	Damping = troops_damping(Object, Prefix, FightData),
	RoundHurt = round_hurt(),

	AttackTotal = case FightData#fight_data.effect_type =:= ?EFFECT_DEFENSE_HURT of
					  true -> prefix_defence(?PROP_PREFIX_FORMER, FightData, AProp) + prefix_defence(?PROP_PREFIX_LATTER, FightData, AProp);
					  false-> prefix_attack(Prefix, FightData, AProp)
				  end,

	DefenceTotal = prefix_defence(DPrefix, FightData, DProp),

	A = (AttackTotal * (1 + break_defence_rate(Prefix, AProp) - break_attack_rate(DPrefix, DProp)) + final_attack(Prefix, AProp)) * (1 - Damping),
	B = DefenceTotal * (1 + break_attack_rate(DPrefix, DProp) - break_defence_rate(Prefix, AProp)) + final_defence(DPrefix, DProp),

	Hurt0 = 0.08 * (A * A) / (A + B) * (1 + RoundHurt),
	Hurt1 = max(0, Hurt0),
%%	?INFO("hurt1 ~p  ~p  ~p  ~p  ~p  ~p~n", [Hurt1, Damping, RoundHurt, AttackTotal, DefenceTotal, SkillId]),

	AHurtIncRate = lib_fight_prop:get_prop(Prefix, ?HURT_INC_RATE, AProp),
	AHurtInc = lib_fight_prop:get_prop(Prefix, ?HURT_INC, AProp),
	DHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?HURT_RED_RATE, DProp),
	DHurtRed = lib_fight_prop:get_prop(DPrefix, ?HURT_RED, DProp),

	Hurt2 = Hurt1 * (1 + AHurtIncRate - DHurtRedRate) + AHurtInc - DHurtRed,
	%%?DEBUG("hurt2 ~p~n", [Hurt2]),

	AManHurtInc = lib_fight_prop:get_prop(Prefix, ?MAN_HURT_INC, AProp),
	AManHurtIncRate = lib_fight_prop:get_prop(Prefix, ?MAN_HURT_INC_RATE, AProp),
	AWomanHurtInc = lib_fight_prop:get_prop(Prefix, ?WOMAN_HURT_INC, AProp),
	AWomanHurtIncRate = lib_fight_prop:get_prop(Prefix, ?WOMAN_HURT_INC_RATE, AProp),
	DManHurtRed = lib_fight_prop:get_prop(DPrefix, ?MAN_HURT_RED, DProp),
	DManHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?MAN_HURT_RED_RATE, DProp),
	DWomanHurtRed = lib_fight_prop:get_prop(Prefix, ?WOMAN_HURT_RED, AProp),
	DWomanHurtRedRate = lib_fight_prop:get_prop(Prefix, ?WOMAN_HURT_RED_RATE, AProp),
	Hurt2a =
	case lib_fight_api:hero_sex(AFighter, AFighter#combat_hero.is_robot) of
		?HERO_SEX_MAN ->
			case lib_fight_api:hero_sex(DFighter, DFighter#combat_hero.is_robot) of
				?HERO_SEX_MAN -> Hurt2 * (1 + AManHurtIncRate - DManHurtRedRate) + AManHurtInc - DManHurtRed;
				?HERO_SEX_WOMAN -> Hurt2 * (1 + AWomanHurtIncRate - DManHurtRedRate) + AWomanHurtInc - DManHurtRed;
				_ ->Hurt2
			end;
		?HERO_SEX_WOMAN ->
			case lib_fight_api:hero_sex(DFighter, DFighter#combat_hero.is_robot) of
				?HERO_SEX_MAN -> Hurt2 * (1 + AManHurtIncRate - DWomanHurtRedRate) + AManHurtInc - DWomanHurtRed;
				?HERO_SEX_WOMAN -> Hurt2 * (1 + AWomanHurtIncRate - DWomanHurtRedRate) + AWomanHurtInc - DWomanHurtRed;
				_ ->Hurt2
			end;
		_ -> Hurt2
	end,

	AHeroSkillHurtInc = lib_fight_prop:get_prop(Prefix, ?HERO_SKILL_HURT_INC, AProp),
	AHeroSkillHurtIncRate = lib_fight_prop:get_prop(Prefix, ?HERO_SKILL_HURT_INC_RATE, AProp),
	ATroopsSkillHurtInc = lib_fight_prop:get_prop(Prefix, ?TROOPS_SKILL_HURT_INC, AProp),
	ATroopsSkillHurtIncRate = lib_fight_prop:get_prop(Prefix, ?TROOPS_SKILL_HURT_INC_RATE, AProp),
	DHeroSkillHurtRed = lib_fight_prop:get_prop(DPrefix, ?HERO_SKILL_HURT_RED, DProp),
	DHeroSkillHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?HERO_SKILL_HURT_RED_RATE, DProp),
	DTroopsSkillHurtRed = lib_fight_prop:get_prop(DPrefix, ?TROOPS_SKILL_HURT_RED, DProp),
	DTroopsSkillHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?TROOPS_SKILL_HURT_RED_RATE, DProp),

	Hurt3 =
	case lib_fight_config:skill_type(SkillId) of
		?SKILL_TYPE3 -> Hurt2a * (1 + AHeroSkillHurtIncRate - DHeroSkillHurtRedRate) + AHeroSkillHurtInc - DHeroSkillHurtRed;
		?SKILL_TYPE4 -> Hurt2a * (1 + ATroopsSkillHurtIncRate - DTroopsSkillHurtRedRate) + ATroopsSkillHurtInc - DTroopsSkillHurtRed;
		_ -> Hurt2a
	end,
	%%?DEBUG("hurt3 ~p~n", [Hurt3]),

	AFormerHurtInc = lib_fight_prop:get_prop(Prefix, ?FORMER_HURT_INC, AProp),
	AFormerHurtIncRate = lib_fight_prop:get_prop(Prefix, ?FORMER_HURT_INC_RATE, AProp),
	ALatterHurtInc = lib_fight_prop:get_prop(Prefix, ?LATER_HURT_INC, AProp),
	ALatterHurtIncRate = lib_fight_prop:get_prop(Prefix, ?LATER_HURT_INC_RATE, AProp),
	DFormerHurtRed = lib_fight_prop:get_prop(DPrefix, ?FORMER_HURT_RED, DProp),
	DFormerHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?FORMER_HURT_RED_RATE, DProp),
	DLatterHurtRed = lib_fight_prop:get_prop(DPrefix, ?LATER_HURT_RED, DProp),
	DLatterHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?LATER_HURT_RED_RATE, DProp),

	Hurt4 =
	case Prefix of
		?PROP_PREFIX_FORMER ->
			if
				DPrefix =:= ?PROP_PREFIX_FORMER -> Hurt3 * (1 + AFormerHurtIncRate - DFormerHurtRedRate) + AFormerHurtInc - DFormerHurtRed;
				DPrefix =:= ?PROP_PREFIX_LATTER -> Hurt3 * (1 + ALatterHurtIncRate - DFormerHurtRedRate) + ALatterHurtInc - DFormerHurtRed;
				true -> Hurt3
			end;
		?PROP_PREFIX_LATTER ->
			if
				DPrefix =:= ?PROP_PREFIX_FORMER -> Hurt3 * (1 + AFormerHurtIncRate - DLatterHurtRedRate) + AFormerHurtInc - DLatterHurtRed;
				DPrefix =:= ?PROP_PREFIX_LATTER -> Hurt3 * (1 + ALatterHurtIncRate - DLatterHurtRedRate) + ALatterHurtInc - DLatterHurtRed;
				true -> Hurt3
			end;
		_ ->
			if
				DPrefix =:= ?PROP_PREFIX_FORMER -> Hurt3 * (1 + AFormerHurtIncRate) + AFormerHurtInc;
				DPrefix =:= ?PROP_PREFIX_LATTER -> Hurt3 * (1 + ALatterHurtIncRate) + ALatterHurtInc;
				true -> Hurt3
			end
	end,
	%%?DEBUG("hurt4 ~p~n", [Hurt4]),

	AType = get_army_type(Object, Prefix),
	DType = get_army_type(?OTHER(Object), DPrefix),
	AInfantryHurtInc = lib_fight_prop:get_prop(Prefix, ?INFANTRY_HURT_INC, AProp),
	AInfantryHurtIncRate = lib_fight_prop:get_prop(Prefix, ?INFANTRY_HURT_INC_RATE, AProp),
	ACavalryHurtInc = lib_fight_prop:get_prop(Prefix, ?CAVALRY_HURT_INC, AProp),
	ACavalryHurtIncRate = lib_fight_prop:get_prop(Prefix, ?CAVALRY_HURT_INC_RATE, AProp),
	AThoughHurtInc = lib_fight_prop:get_prop(Prefix, ?THOUGH_HURT_INC, AProp),
	AThoughHurtIncRate = lib_fight_prop:get_prop(Prefix, ?THOUGH_HURT_INC_RATE, AProp),
	AAlchemistHurtInc = lib_fight_prop:get_prop(Prefix, ?ALCHEMIST_HURT_INC, AProp),
	AAlchemistHurtIncRate = lib_fight_prop:get_prop(Prefix, ?ALCHEMIST_HURT_INC_RATE, AProp),

	DInfantryHurtRed = lib_fight_prop:get_prop(DPrefix, ?INFANTRY_HURT_RED, DProp),
	DInfantryHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?INFANTRY_HURT_RED_RATE, DProp),
	DCavalryHurtRed = lib_fight_prop:get_prop(DPrefix, ?CAVALRY_HURT_RED, DProp),
	DCavalryHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?CAVALRY_HURT_RED_RATE, DProp),
	DThoughHurtRed = lib_fight_prop:get_prop(DPrefix, ?THOUGH_HURT_RED, DProp),
	DThoughHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?THOUGH_HURT_RED_RATE, DProp),
	DAlchemistHurtRed = lib_fight_prop:get_prop(DPrefix, ?ALCHEMIST_HURT_RED, DProp),
	DAlchemistHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?ALCHEMIST_HURT_RED_RATE, DProp),

	Hurt5 =
	case AType of
		?CORPS_TYPE_INFANTRY ->
			if
				DType =:= ?CORPS_TYPE_INFANTRY -> Hurt4 * (1 + AInfantryHurtIncRate - DInfantryHurtRedRate) + AInfantryHurtInc - DInfantryHurtRed;
				DType =:= ?CORPS_TYPE_CAVALRY -> Hurt4 * (1 + ACavalryHurtIncRate - DInfantryHurtRedRate) + ACavalryHurtInc - DInfantryHurtRed;
				DType =:= ?CORPS_TYPE_ARCHER -> Hurt4 * (1 + AThoughHurtIncRate - DInfantryHurtRedRate) + AThoughHurtInc - DInfantryHurtRed;
				DType =:= ?CORPS_TYPE_MAGICIAN -> Hurt4 * (1 + AAlchemistHurtIncRate - DInfantryHurtRedRate) + AAlchemistHurtInc - DInfantryHurtRed;
				true -> Hurt4
			end;
		?CORPS_TYPE_CAVALRY ->
			if
				DType =:= ?CORPS_TYPE_INFANTRY -> Hurt4 * (1 + AInfantryHurtIncRate - DCavalryHurtRedRate) + AInfantryHurtInc - DCavalryHurtRed;
				DType =:= ?CORPS_TYPE_CAVALRY -> Hurt4 * (1 + ACavalryHurtIncRate - DCavalryHurtRedRate) + ACavalryHurtInc - DCavalryHurtRed;
				DType =:= ?CORPS_TYPE_ARCHER -> Hurt4 * (1 + AThoughHurtIncRate - DCavalryHurtRedRate) + AThoughHurtInc - DCavalryHurtRed;
				DType =:= ?CORPS_TYPE_MAGICIAN -> Hurt4 * (1 + AAlchemistHurtIncRate - DCavalryHurtRedRate) + AAlchemistHurtInc - DCavalryHurtRed;
				true -> Hurt4
			end;
		?CORPS_TYPE_ARCHER ->
			if
				DType =:= ?CORPS_TYPE_INFANTRY -> Hurt4 * (1 + AInfantryHurtIncRate - DThoughHurtRedRate) + AInfantryHurtInc - DThoughHurtRed;
				DType =:= ?CORPS_TYPE_CAVALRY -> Hurt4 * (1 + ACavalryHurtIncRate - DThoughHurtRedRate) + ACavalryHurtInc - DThoughHurtRed;
				DType =:= ?CORPS_TYPE_ARCHER -> Hurt4 * (1 + AThoughHurtIncRate - DThoughHurtRedRate) + AThoughHurtInc - DThoughHurtRed;
				DType =:= ?CORPS_TYPE_MAGICIAN -> Hurt4 * (1 + AAlchemistHurtIncRate - DThoughHurtRedRate) + AAlchemistHurtInc - DThoughHurtRed;
				true -> Hurt4
			end;
		?CORPS_TYPE_MAGICIAN ->
			if
				DType =:= ?CORPS_TYPE_INFANTRY -> Hurt4 * (1 + AInfantryHurtIncRate - DAlchemistHurtRedRate) + AInfantryHurtInc - DAlchemistHurtRed;
				DType =:= ?CORPS_TYPE_CAVALRY -> Hurt4 * (1 + ACavalryHurtIncRate - DAlchemistHurtRedRate) + ACavalryHurtInc - DAlchemistHurtRed;
				DType =:= ?CORPS_TYPE_ARCHER -> Hurt4 * (1 + AThoughHurtIncRate - DAlchemistHurtRedRate) + AThoughHurtInc - DAlchemistHurtRed;
				DType =:= ?CORPS_TYPE_MAGICIAN -> Hurt4 * (1 + AAlchemistHurtIncRate - DAlchemistHurtRedRate) + AAlchemistHurtInc - DAlchemistHurtRed;
				true -> Hurt4
			end;
		_ -> Hurt4
	end,
%%	?DEBUG("hurt5 ~p~n", [Hurt5]),

	AHeroType = get_hero_type(Object),
	DHeroType = get_hero_type(?OTHER(Object)),
	ACivilianHurtInc = lib_fight_prop:get_prop(Prefix, ?CIVILIAN_HURT_INC, AProp),
	ACivilianHurtIncRate = lib_fight_prop:get_prop(Prefix, ?CIVILIAN_HURT_INC_RATE, AProp),
	AGeneralHurtInc = lib_fight_prop:get_prop(Prefix, ?GENERAL_HURT_INC, AProp),
	AGeneralHurtIncRate = lib_fight_prop:get_prop(Prefix, ?GENERAL_HURT_INC_RATE, AProp),
	AGeneralistHurtInc = lib_fight_prop:get_prop(Prefix, ?GENERALIST_HURT_INC, AProp),
	AGeneralistHurtIncRate = lib_fight_prop:get_prop(Prefix, ?GENERALIST_HURT_INC_RATE, AProp),

	DCivilianHurtRed = lib_fight_prop:get_prop(DPrefix, ?CIVILIAN_HURT_RED, DProp),
	DCivilianHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?CIVILIAN_HURT_RED_RATE, DProp),
	DGeneralHurtRed = lib_fight_prop:get_prop(DPrefix, ?GENERAL_HURT_RED, DProp),
	DGeneralHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?GENERAL_HURT_RED_RATE, DProp),
	DGeneralistHurtRed = lib_fight_prop:get_prop(DPrefix, ?GENERALIST_HURT_RED, DProp),
	DGeneralistHurtRedRate = lib_fight_prop:get_prop(DPrefix, ?GENERALIST_HURT_RED_RATE, DProp),
	Hurt6 =
	case AHeroType of
		?HERO_TYPE_WISDOM ->
			if
				DHeroType =:= ?HERO_TYPE_WISDOM -> Hurt5 * (1 + ACivilianHurtIncRate - DCivilianHurtRedRate) + ACivilianHurtInc - DCivilianHurtRed;
				DHeroType =:= ?HERO_TYPE_VALIANT -> Hurt5 * (1 + AGeneralHurtIncRate - DCivilianHurtRedRate) + AGeneralHurtInc - DCivilianHurtRed;
				DHeroType =:= ?HERO_TYPE_BALANCE -> Hurt5 * (1 + AGeneralistHurtIncRate - DCivilianHurtRedRate) + AGeneralistHurtInc - DCivilianHurtRed;
				true -> Hurt5
			end;
		?HERO_TYPE_VALIANT ->
			if
				DHeroType =:= ?HERO_TYPE_WISDOM -> Hurt5 * (1 + ACivilianHurtIncRate - DGeneralHurtRedRate) + ACivilianHurtInc - DGeneralHurtRed;
				DHeroType =:= ?HERO_TYPE_VALIANT -> Hurt5 * (1 + AGeneralHurtIncRate - DGeneralHurtRedRate) + AGeneralHurtInc - DGeneralHurtRed;
				DHeroType =:= ?HERO_TYPE_BALANCE -> Hurt5 * (1 + AGeneralistHurtIncRate - DGeneralHurtRedRate) + AGeneralistHurtInc - DGeneralHurtRed;
				true -> Hurt5
			end;
		?HERO_TYPE_BALANCE ->
			if
				DHeroType =:= ?HERO_TYPE_WISDOM -> Hurt5 * (1 + ACivilianHurtIncRate - DGeneralistHurtRedRate) + ACivilianHurtInc - DGeneralistHurtRed;
				DHeroType =:= ?HERO_TYPE_VALIANT -> Hurt5 * (1 + AGeneralHurtIncRate - DGeneralistHurtRedRate) + AGeneralHurtInc - DGeneralistHurtRed;
				DHeroType =:= ?HERO_TYPE_BALANCE -> Hurt5 * (1 + AGeneralistHurtIncRate - DGeneralistHurtRedRate) + AGeneralistHurtInc - DGeneralistHurtRed;
				true -> Hurt5
			end;
		_ -> Hurt5
	end,
%%	?DEBUG("hurt6 ~p~n", [Hurt6]),

	AttackType = FightData#fight_data.attack_type,
	ACritMulti = lib_fight_prop:get_prop(Prefix, ?CRIT_MULTI, AProp),
	ACritMultiRate = lib_fight_prop:get_prop(Prefix, ?CRIT_MULTI_RATE, AProp),
	DParryMulti = lib_fight_prop:get_prop(DPrefix, ?PARRY_MULTI, DProp),
	DParryMultiRate = lib_fight_prop:get_prop(DPrefix, ?PARRY_MULTI_RATE, DProp),
	Hurt7 =
	case AttackType of
		?FIGHT_ATTACK_TYPE1 -> 0;
		?FIGHT_ATTACK_TYPE2 ->	Hurt6 * (0.5 - DParryMultiRate) - DParryMulti;
		?FIGHT_ATTACK_TYPE3 ->	Hurt6 * (1.5 + ACritMultiRate) + ACritMulti;
		_ -> Hurt6
	end,
%%	?DEBUG("hurt7 ~p~n", [Hurt7]),

	{EffectHurtMulti, EffectHurtValue} =
	lists:foldl(fun(EffectConf, {EffectAcc1, EffectAcc2}) ->
		EffectA = maps:get(percent, EffectConf, 0),
		EffectB = maps:get(value, EffectConf, 0),
		{EffectAcc1 + EffectA, EffectAcc2 + EffectB}
	end, {0, 0}, lib_fight_effect:get_self_effect_config(FightData, ?EFFECT_ENHANCE_HURT)),
	ImmuneHurt = lib_fight_effect:get_target_effect_value(FightData, ?EFFECT_IMMUNE_SKILL_HURT),
	HurtRate = get_skill_hurt_rate(Object, Conf, FightData),
	Hurt8 = Hurt7 * HurtRate * (1 - ImmuneHurt) * (1 + EffectHurtMulti) + EffectHurtValue,
%%	?DEBUG("hurt8 ~p ~p ~p~n", [Hurt8, EffectHurtMulti, EffectHurtValue]),
	Hurt8.
%%
%%deduct_health(FightData, Conf) ->
%%	lists:foreach(fun(V) ->
%%		case V of
%%			?PROP_PREFIX_HERO ->
%%				skip;
%%			?PROP_PREFIX_FORMER ->
%%				case former_die(FightData#fight_data.target_object) of
%%					true ->
%%						case latter_die(FightData#fight_data.target_object) of
%%							true ->
%%								lib_fight_handle:handle_deduct_health(FightData#fight_data{target_prefix = [?PROP_PREFIX_FORMER]}, 0);
%%							_ ->
%%								deduct_health_latter(FightData, Conf)
%%						end;
%%					_ ->
%%						deduct_health_former(FightData, Conf)
%%				end;
%%			?PROP_PREFIX_LATTER ->
%%				case latter_die(FightData#fight_data.target_object) of
%%					true ->
%%						case former_die(FightData#fight_data.target_object) of
%%							true ->
%%								lib_fight_handle:handle_deduct_health(FightData#fight_data{target_prefix = [?PROP_PREFIX_LATTER]}, 0);
%%							_ ->
%%								deduct_health_former(FightData, Conf)
%%						end;
%%					_ ->
%%						deduct_health_latter(FightData, Conf)
%%				end
%%		end
%%	end, FightData#fight_data.target_prefix).

deduct_health(FightData, Conf) ->
	?INFO("FightData 44 ~p",[FightData]),
	case FightData#fight_data.target_prefix of
		[?PROP_PREFIX_HERO] ->
%%			?DEBUG("deduct_health error prefix"),
			skip;
		?PROP_PREFIX_FORMER ->
%%			?DEBUG("deduct_health prefix PROP_PREFIX_FORMER"),
			NewFightData = begin_deduct_health_one(FightData, Conf),
			prefix_attack_process(NewFightData),
			lib_fight_parsing:parsing_proto_effect(NewFightData#fight_data{
				attack_type_list = [NewFightData#fight_data.attack_type]
			}),
			lib_fight_handle:handle_deduct_health(NewFightData);
		[?PROP_PREFIX_FORMER] ->
%%			?DEBUG("deduct_health prefix PROP_PREFIX_FORMER"),
			NewFightData = begin_deduct_health_one(FightData#fight_data{target_prefix = ?PROP_PREFIX_FORMER}, Conf),
			prefix_attack_process(NewFightData),
			lib_fight_parsing:parsing_proto_effect(NewFightData#fight_data{
				attack_type_list = [NewFightData#fight_data.attack_type]
			}),
			lib_fight_handle:handle_deduct_health(NewFightData);
		?PROP_PREFIX_LATTER ->
%%			?DEBUG("deduct_health prefix PROP_PREFIX_LATTER"),
			NewFightData = begin_deduct_health_one(FightData, Conf),
			prefix_attack_process(NewFightData),
			lib_fight_parsing:parsing_proto_effect(NewFightData#fight_data{
				attack_type_list = [NewFightData#fight_data.attack_type]
			}),
			lib_fight_handle:handle_deduct_health(NewFightData);
		[?PROP_PREFIX_LATTER] ->
%%			?DEBUG("deduct_health prefix PROP_PREFIX_LATTER"),
			NewFightData = begin_deduct_health_one(FightData#fight_data{target_prefix = ?PROP_PREFIX_LATTER}, Conf),
			prefix_attack_process(NewFightData),
			lib_fight_parsing:parsing_proto_effect(NewFightData#fight_data{
				attack_type_list = [NewFightData#fight_data.attack_type]
			}),
			lib_fight_handle:handle_deduct_health(NewFightData);
		[?PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER] ->
%%			?DEBUG("deduct_health prefix [PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER]"),
			OnlyOneFlag = former_die(FightData#fight_data.target_object) orelse latter_die(FightData#fight_data.target_object),
			Conf1 = maps:put(only_one_flag, OnlyOneFlag, Conf),
			NewFightData1 =
			case prefix_die(FightData#fight_data.target_object, ?PROP_PREFIX_FORMER) of
				true ->
					FightData#fight_data{target_prefix = [?PROP_PREFIX_FORMER], value = 0};
				_ ->
					AttackType1 = calc_attack_type(FightData#fight_data{target_prefix = ?PROP_PREFIX_FORMER}),
					case AttackType1 of
						?FIGHT_ATTACK_TYPE1 ->
							FightData#fight_data{
								target_prefix = [?PROP_PREFIX_FORMER],
								attack_type = AttackType1,
								value = 0,
								value_list = [0],
								attack_type_list = [AttackType1]
							};
						?FIGHT_ATTACK_TYPE5 ->
							FightData#fight_data{
								target_prefix = [?PROP_PREFIX_FORMER],
								attack_type = AttackType1,
								value = 0,
								value_list = [0],
								attack_type_list = [AttackType1]
							};
						_ ->
							deduct_health_one(FightData#fight_data{target_prefix = ?PROP_PREFIX_FORMER}, Conf1, AttackType1)
					end
			end,
			NewFightData2 =
			case prefix_die(FightData#fight_data.target_object, ?PROP_PREFIX_LATTER) of
				true ->
					FightData#fight_data{target_prefix = [?PROP_PREFIX_LATTER], value = 0};
				_ ->
					AttackType2 = calc_attack_type(FightData#fight_data{target_prefix = ?PROP_PREFIX_LATTER}),
					case AttackType2 of
						?FIGHT_ATTACK_TYPE1 ->
							FightData#fight_data{
								target_prefix = [?PROP_PREFIX_LATTER],
								attack_type = AttackType2,
								value = 0
							};
						?FIGHT_ATTACK_TYPE5 ->
							FightData#fight_data{
								target_prefix = [?PROP_PREFIX_LATTER],
								attack_type = AttackType2,
								value = 0
							};
						_ ->
							deduct_health_one(FightData#fight_data{target_prefix = ?PROP_PREFIX_LATTER}, Conf1, AttackType2)
					end
			end,
			lib_fight_parsing:parsing_proto_effect(FightData#fight_data{
				value_list = [NewFightData1#fight_data.value, NewFightData2#fight_data.value],
				attack_type_list = [NewFightData1#fight_data.attack_type, NewFightData2#fight_data.attack_type]}),
			prefix_attack_process(NewFightData1),
			lib_fight_handle:handle_deduct_health(NewFightData1),
			prefix_attack_process(NewFightData2),
			lib_fight_handle:handle_deduct_health(NewFightData2);
		_ -> ?DEBUG("deduct_health error ~p~n", [FightData#fight_data.target_prefix]), skip
	end.

deduct_health_one(FightData, Conf, AttackType) ->
%%	?DEBUG("deduct_health_one AttackType ~p~n", [AttackType]),
%%	case prefix_die(FightData#fight_data.target_object, FightData#fight_data.target_prefix) of
%%		true ->
%%			case prefix_die(FightData#fight_data.target_object, ?OTHER_ARMY(FightData#fight_data.target_prefix)) of
%%				true ->
%%					?DEBUG("deduct_health_one die"),FightData#fight_data{target_prefix = [FightData#fight_data.target_prefix],value = 0};
%%				_ ->
%%					AttackType = attack_type(FightData#fight_data{target_prefix = ?OTHER_ARMY(FightData#fight_data.target_prefix)}),
%%					FightData1 = FightData#fight_data{target_prefix = ?OTHER_ARMY(FightData#fight_data.target_prefix), attack_type = AttackType},
%%					Hurt = hurt(FightData1, Conf),
%%					?DEBUG("deduct_health_one other ~p~n", [Hurt]),
%%					deduct_health_done(FightData1, Hurt),
%%					FightData1#fight_data{target_prefix = [?OTHER_ARMY(FightData#fight_data.target_prefix)], value = -Hurt}
%%			end;
%%		_ ->
%%			AttackType = attack_type(FightData),
%%			FightData1 = FightData#fight_data{target_prefix = FightData#fight_data.target_prefix, attack_type = AttackType},
%%			Hurt = hurt(FightData1, Conf),
%%			?DEBUG("deduct_health_one self ~p~n", [Hurt]),
%%			deduct_health_done(FightData1, Hurt),
%%			FightData1#fight_data{target_prefix = [FightData#fight_data.target_prefix],value = -Hurt}
%%	end.
	FightData1 = FightData#fight_data{target_prefix = FightData#fight_data.target_prefix, attack_type = AttackType},
	%% 伤害类型计算公式判断
	OldTime = lib_fight_data:get_avoid_hurt_time(FightData#fight_data.target_object,FightData#fight_data.target_prefix),
	Hurt =
	case OldTime > 0 of
		true -> lib_fight_data:put_avoid_hurt_time(FightData#fight_data.target_object,FightData#fight_data.target_prefix,OldTime - 1), 0;
		false-> case FightData1#fight_data.effect_type of
					?EFFECT_FIXED_DAMAGE  -> fixed_hurt(FightData1);
					?EFFECT_SKILL_NULLIFY -> 0;
					_ -> hurt(FightData1, Conf)
				end
	end,
	deduct_health_done(FightData1, Hurt),
	FightData1#fight_data{target_prefix = [FightData#fight_data.target_prefix], value = -Hurt}.
%%	FightData1#fight_data{target_prefix = [FightData#fight_data.target_prefix], value = -Hurt, value_list = [-Hurt]}.

attack_type(FightData) ->
	AttackType = calc_attack_type(FightData),
	case AttackType of
		?FIGHT_ATTACK_TYPE1 ->
%%			?DEBUG("attack_type 闪避"),
			lib_fight_parsing:parsing_proto_effect(FightData#fight_data{
				attack_type = ?FIGHT_ATTACK_TYPE1,
				target_prefix = [FightData#fight_data.target_prefix]
			}),
			?NEXT_SKILL(true);
		?FIGHT_ATTACK_TYPE5 ->
			lib_fight_parsing:parsing_proto_effect(FightData#fight_data{
				attack_type = ?FIGHT_ATTACK_TYPE5,
				target_prefix = [FightData#fight_data.target_prefix]
			}),
			?NEXT_SKILL(true);
		_ -> ?DEBUG("attack_type ~p~n", [AttackType]), AttackType
	end.

%%deduct_health_former(FightData0, Conf) ->
%%	AttackType = calc_attack_type(FightData0#fight_data{target_prefix = ?PROP_PREFIX_FORMER}),
%%	?NEXT_SKILL(AttackType =:= ?FIGHT_ATTACK_TYPE1),
%%	FightData = FightData0#fight_data{attack_type = AttackType},
%%	HurtTmp = case FightData#fight_data.value =:= 0 of true -> calc_hurt(FightData, ?PROP_PREFIX_FORMER, Conf); _ -> FightData#fight_data.value end,
%%	Hurt0 = HurtTmp + FightData#fight_data.add_value,
%%	Defender0 = lib_fight_data:get_fighter(FightData#fight_data.target_object),
%%	Former = Defender0#combat_hero.former,
%%	Hurt1 = rel_hurt(FightData#fight_data.target_object, Former#combat_army.cur_troops, Hurt0),
%%	Hurt = shield_buff(FightData, ?PROP_PREFIX_FORMER, Hurt1),
%%	?DEBUG("deduct_health_latter ~p  ~p  ~p~n", [Hurt, Hurt0, Former#combat_army.cur_troops]),
%%	lib_fight_data:update_wastage_former(FightData, min(Hurt, Former#combat_army.cur_troops)),
%%	lib_fight_data:put_fighter(FightData#fight_data.target_object, Defender0#combat_hero{
%%		former = Former#combat_army{cur_troops = max(0, Former#combat_army.cur_troops - Hurt)}
%%	}),
%%	prefix_attack_process(FightData#fight_data{target_prefix = ?PROP_PREFIX_FORMER}),
%%	lib_fight_parsing:parsing_proto_effect(FightData#fight_data{target_prefix = [?PROP_PREFIX_FORMER], value = -Hurt, extra_value = -(Hurt1 - Hurt)}),
%%	lib_fight_handle:handle_deduct_health(FightData#fight_data{target_prefix = [?PROP_PREFIX_FORMER]}, -Hurt).

deduct_health_done(FightData, Hurt) ->
	lib_fight_data:add_hurt_times(FightData#fight_data.target_object),
	deduct_health_done(FightData#fight_data.target_prefix, FightData, Hurt).
%%	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_1,
%%		FightData#fight_data.target_object, FightData, FightData#fight_data.target_passive_flag),
%%	lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_1,
%%		FightData#fight_data.target_object, FightData, FightData#fight_data.target_passive_flag).
deduct_health_done(?PROP_PREFIX_FORMER, FightData, Hurt) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	Former = Fighter#combat_hero.former,
	RelHurt =
	lists:foldl(fun(Conf, Acc) ->
		MinHurt = maps:get(value1, Conf) * Former#combat_army.troops,
		Value = maps:get(value2, Conf),
		case Acc > MinHurt of
			true ->
				trunc(MinHurt + (Acc - MinHurt) * max(0 ,(1 - Value)));
			_ -> Acc
		end
	end, Hurt, lib_fight_effect:get_target_effect_config(FightData, ?EFFECT_SPECIAL_IMMUNE_HURT)),
	lib_fight_data:put_last_hurt(FightData#fight_data.object, FightData#fight_data.skill_id, RelHurt),
	lib_fight_data:update_wastage_former(FightData, min(RelHurt, Former#combat_army.cur_troops)),
	lib_fight_data:put_fighter(FightData#fight_data.target_object, Fighter#combat_hero{
		former = Former#combat_army{cur_troops = max(0, Former#combat_army.cur_troops - RelHurt)}
	});
deduct_health_done(?PROP_PREFIX_LATTER, FightData, Hurt) ->
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	Latter = Fighter#combat_hero.latter,
	RelHurt =
	lists:foldl(fun(Conf, Acc) ->
		MinHurt = maps:get(value1, Conf) * Latter#combat_army.troops,
		Value = maps:get(value2, Conf),
		case Acc > MinHurt of
			true ->
				trunc(MinHurt + (Acc - MinHurt) * max(0 ,(1 - Value)));
			_ -> Acc
		end
	end, Hurt, lib_fight_effect:get_target_effect_config(FightData, ?EFFECT_SPECIAL_IMMUNE_HURT)),
	lib_fight_data:put_last_hurt(FightData#fight_data.object, FightData#fight_data.skill_id, RelHurt),
	lib_fight_data:update_wastage_latter(FightData, min(RelHurt, Latter#combat_army.cur_troops)),
	lib_fight_data:put_fighter(FightData#fight_data.target_object, Fighter#combat_hero{
		latter = Latter#combat_army{cur_troops = max(0, Latter#combat_army.cur_troops - RelHurt)}
	}).

%% 固定伤害
fixed_hurt(FightData) ->
	SkillId = FightData#fight_data.skill_id,
	[Config] = maps:get(effect,tb_skill:get(SkillId)),
	Hurt = maps:get(value,Config,0),
	case Hurt of
		0 -> 0;
		_ -> trunc(Hurt - initial_defense(FightData))
	end
.
%% 基础防御
initial_defense(FightData)->
	Target = FightData#fight_data.target_object,
	TmpProp = lib_fight_effect:effect_tmp_prop(FightData, Target),
	Prop = lib_fight_prop:increase_prop([TmpProp, lib_fight_data:get_fighter_prop(Target)]),
	BaseDefence = lib_fight_prop:get_prop(FightData#fight_data.target_prefix, ?BASE_DEFENCE, Prop),
	BaseDefenceRate = lib_fight_prop:get_prop(FightData#fight_data.target_prefix, ?BASE_DEFENCE_RATE, Prop),
	BaseDefence * (1 + BaseDefenceRate)
.

hurt(FightData, Conf) ->
	?NEXT_SKILL(FightData#fight_data.attack_type =:= ?FIGHT_ATTACK_TYPE1),
	Army = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
	Hurt1 = hurt(FightData#fight_data.effect_type, FightData, Conf),
	ImmuneHurt = lib_fight_effect:get_target_effect_value(FightData, ?EFFECT_IMMUNE_HURT),
	ImmuneHurtBySkill = lib_fight_passive_skill:check_passive_effect(?EFFECT_IMMUNE_HURT_BY_SKILL, #fight_data{
		object = FightData#fight_data.target_object,
		prefix = FightData#fight_data.target_prefix,
		skill_id = FightData#fight_data.skill_id
	}),
	IncreaseHurt = lib_fight_passive_skill:check_passive_effect(?EFFECT_INCREASE_HURT, FightData),
	IncreaseHurtBySkill = lib_fight_passive_skill:check_passive_effect(?EFFECT_INCREASE_HURT_BY_SKILL, FightData),
	IncreaseHurtByBuff = lib_fight_passive_skill:check_passive_effect(?EFFECT_INCREASE_HURT_BY_BUFF, FightData),
	?INFO("IncreaseHurtByBuff ~p",[IncreaseHurtByBuff]),
	ADueHurtBuffList = lib_fight_buff:get_buff_by_type(FightData#fight_data.object, FightData#fight_data.prefix, ?FIGHT_BUFF_TYPE_1011),
	ADueHurt =
		lists:foldl(fun(DueHurtBuff, Acc) ->
			DueHurtBuffConf = tb_buff:get(DueHurtBuff#fight_buff.id),
			maps:get(value_a, DueHurtBuffConf, 0) * DueHurtBuff#fight_buff.overlay + Acc
		end, 0, ADueHurtBuffList),
	AAddHurtBuffList = lib_fight_buff:get_buff_by_type(FightData#fight_data.object, FightData#fight_data.prefix, ?FIGHT_BUFF_TYPE_1012),
	AAddHurt =
		lists:foldl(fun(DueHurtBuff, Acc) ->
			DueHurtBuffConf = tb_buff:get(DueHurtBuff#fight_buff.id),
			maps:get(value_a, DueHurtBuffConf, 0) * DueHurtBuff#fight_buff.overlay + Acc
		end, 0, AAddHurtBuffList),
%%	todo 刪除
%%  AShieldBuffList1 = lib_fight_buff:get_buff_by_type(FightData#fight_data.object, FightData#fight_data.prefix, ?FIGHT_BUFF_TYPE_1009),
%%	AShieldBuffList2 = lib_fight_buff:get_buff_by_type(FightData#fight_data.object, FightData#fight_data.prefix, ?FIGHT_BUFF_TYPE_1010),
%%	AAddHurt1 =
%%		lists:foldl(fun(DueHurtBuff, Acc) ->
%%			DueHurtBuffConf = tb_buff:get(DueHurtBuff#fight_buff.id),
%%			maps:get(value_b, DueHurtBuffConf, 0) + Acc
%%		end, 0, lists:append(AShieldBuffList1, AShieldBuffList2)),

	_AProp = lib_fight_data:get_fighter_prop(FightData#fight_data.object),
	DProp = lib_fight_data:get_fighter_prop(FightData#fight_data.target_object),
	EffectImmuneDefence = lib_fight_prop:get_prop(?EFFECT_PROP_IMMUNE_HURT, DProp),

%%	Hurt2 = trunc(Hurt1 * (1 + AAddHurt + AAddHurt1 - ImmuneHurt -ImmuneHurtBySkill - ADueHurt + IncreaseHurt + IncreaseHurtBySkill + IncreaseHurtByBuff - EffectImmuneDefence)),
	Hurt2 = trunc(Hurt1 * (1 + AAddHurt - ImmuneHurt -ImmuneHurtBySkill - ADueHurt + IncreaseHurt + IncreaseHurtBySkill + IncreaseHurtByBuff - EffectImmuneDefence)),
	Hurt3 = shield_buff(FightData, FightData#fight_data.target_prefix, Hurt2),
	Hurt4 = skill_group_hurt(FightData, Hurt3),
	Hurt5 =
		case Hurt4 >= Army#combat_army.cur_troops of
			true ->
				Flag = lib_fight_passive_skill:check_passive_effect(?EFFECT_REMIT_FATAL_INJURY, #fight_data{
					object = FightData#fight_data.target_object,
					prefix = FightData#fight_data.target_prefix,
					skill_id = FightData#fight_data.skill_id
				}),
				case Flag of
					true -> 0;
					_ -> Hurt4
				end;
			_ -> Hurt4
		end,
%%	?DEBUG("fight hurt Hurt1(~p)  Hurt2(~p)  Hurt3(~p)  Hurt4(~p)  Hurt5(~p)~n", [Hurt1, Hurt2, Hurt3, Hurt4, Hurt5]),
	rel_hurt(FightData#fight_data.target_object, Army#combat_army.cur_troops, Hurt5).

hurt(?EFFECT_COMMON_HURT, FightData, Conf) ->
	calc_hurt(FightData, FightData#fight_data.target_prefix, Conf);
hurt(?EFFECT_COPY_HURT, FightData, _) ->
%%	lib_fight_data:get_last_hurt(FightData#fight_data.object),
%%	FightData#fight_data.value;
	lib_fight_data:get_last_hurt(FightData#fight_data.object, FightData#fight_data.skill_id);
hurt(?EFFECT_PERCENT_HURT, FightData, Conf) ->
	Percent = lib_fight_passive_skill:passive_effect_value(?EFFECT_IMMUNE_PERCENT_HURT, FightData#fight_data{
		object = FightData#fight_data.target_object,
		prefix = FightData#fight_data.target_prefix
	}),
	Percent1 = case (1 - Percent) =< 0 of true -> 0;false -> 1 - Percent end,
	TargetArmy = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
	MyArmy = lib_fight_data:get_army(FightData#fight_data.target_object, FightData#fight_data.target_prefix),
	ConfPercent = case maps:is_key(percent,Conf) of
					  true ->  maps:get(percent, Conf, 0);
					  false->  lib_fight_rand:rand_float(maps:get(percent_l, Conf, 0),maps:get(percent_r, Conf, 0))
				  end,
	ConfValue = case maps:is_key(value,Conf) of
					true ->  maps:get(value, Conf, 0);
					false->  lib_fight_rand:rand_float(maps:get(value_l, Conf, 0),maps:get(value_r, Conf, 0))
				end,
	case maps:get(percent_type, Conf, 0) of
		0 -> trunc((TargetArmy#combat_army.troops * ConfPercent + ConfValue )* Percent1);
		1 -> trunc((TargetArmy#combat_army.cur_troops * ConfPercent + ConfValue) * Percent1);
		2 -> trunc((MyArmy#combat_army.troops * ConfPercent + ConfValue) * Percent1);
		3 -> trunc((MyArmy#combat_army.cur_troops * ConfPercent + ConfValue) * Percent1);
		4 -> trunc(((TargetArmy#combat_army.troops - TargetArmy#combat_army.cur_troops) * ConfPercent + ConfValue) * Percent1);
		_ -> error(effect_percent_error_type)
	end;
hurt(?EFFECT_DEFENSE_HURT, FightData, Conf) ->
	calc_hurt(FightData, FightData#fight_data.target_prefix, Conf);
hurt(?EFFECT_IGNORE_DEFENCE_HURT, FightData, Conf) ->
	calc_hurt(FightData, FightData#fight_data.target_prefix, Conf);
hurt(?EFFECT_ITSELF_HURT, FightData, _) ->
	FightData#fight_data.value;
hurt(?EFFECT_ITSELF_RETURN_HURT, FightData, _) ->
	FightData#fight_data.value;
hurt(?EFFECT_ATTACK_BACK, FightData, Conf) ->
	calc_hurt(FightData, FightData#fight_data.target_prefix, Conf);
hurt(_, FightData, _) ->
	lib_fight_data:get_last_hurt(FightData#fight_data.object, FightData#fight_data.skill_id).

prefix_attack_process(FightData) ->
	try
		?JUDGE_RETURN(FightData#fight_data.effect_type =:= ?EFFECT_COMMON_HURT orelse
			FightData#fight_data.effect_type =:= ?EFFECT_COPY_HURT
			orelse FightData#fight_data.effect_type =:= ?EFFECT_PERCENT_HURT, 0),
		lib_fight_data:add_attack_times(FightData#fight_data.object, FightData#fight_data.prefix),
		lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_9,
			FightData#fight_data.object, FightData, FightData#fight_data.passive_flag),
		case lib_fight_config:is_active_skill(FightData#fight_data.skill_id) of
			true ->
				lib_fight_data:add_active_attack_times(FightData#fight_data.object, FightData#fight_data.prefix),
				lib_fight_passive_skill:check_passive_skill(?PASSIVE_SKILL_TRIGGER_TIME_9,
					FightData#fight_data.object, FightData, FightData#fight_data.passive_flag);
			_ -> skip
		end
	catch
	    _:_  -> ok
	end.

shield_buff(FightData, Prefix, Hurt) ->
	try
	    ?JUDGE_RETURN(FightData#fight_data.type =:= ?CLIENT_EFFECT_TYPE1, 0),
		?JUDGE_RETURN(Hurt > 0, 0),
		lib_fight_buff:shield_buff(FightData, Prefix, Hurt)
	catch
	    _:_  -> Hurt
	end.

rel_hurt(Object, CurTroops, Hurt) ->
	{_,Round} = lib_fight_data:get_cur_round(),
	Attacker = lib_fight_data:get_fighter(?OTHER(Object)),
	case is_die(Attacker) of
		true ->
			case former_die(Object) orelse latter_die(Object) of
				true -> ?DEBUG("attack die"), min(CurTroops - 1, Hurt);
				_ -> min(CurTroops, Hurt)
			end;
		_ ->
			case Round >= ?FIGHT_MAX_ROUND of true -> CurTroops; _ -> min(CurTroops, Hurt) end
	end.


recover_health(Type, FightData) ->
%%	?DEBUG("recover_health ~p~n", [Type]),
	if
		Type =:= ?PROP_PREFIX_FORMER -> recover_health_former(FightData);
		Type =:= ?PROP_PREFIX_LATTER -> recover_health_latter(FightData);
		true -> skip
	end.

recover_health_former(FightData) ->
	Defender = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	Former = Defender#combat_hero.former,
	Health = min(Former#combat_army.troops - Former#combat_army.cur_troops, FightData#fight_data.value + FightData#fight_data.add_value),
%%	?DEBUG("recover_health_former ~p  ~p  ~n", [Health, Former#combat_army.cur_troops]),
	lib_fight_data:put_fighter(FightData#fight_data.target_object, Defender#combat_hero{
		former = Former#combat_army{cur_troops = min(Former#combat_army.troops, Former#combat_army.cur_troops + Health)}
	}),
%%	lib_fight_parsing:parsing_proto_effect(FightData#fight_data{target_prefix = [?PROP_PREFIX_LATTER], value = Health, value_list = [Health]}),
	lib_fight_parsing:parsing_proto_effect(FightData#fight_data{target_prefix = [?PROP_PREFIX_LATTER], value = Health}),
	lib_fight_handle:handle_recover_health(?PROP_PREFIX_FORMER, Health).

recover_health_latter(FightData) ->
	Defender = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	Latter = Defender#combat_hero.former,
	Health = min(Latter#combat_army.troops - Latter#combat_army.cur_troops, FightData#fight_data.value + FightData#fight_data.add_value),
%%	?DEBUG("recover_health_latter ~p  ~p  ~n", [Health, Latter#combat_army.cur_troops]),
	lib_fight_data:put_fighter(FightData#fight_data.target_object, Defender#combat_hero{
		former = Latter#combat_army{cur_troops = min(Latter#combat_army.troops, Latter#combat_army.cur_troops + Health)}
	}),
%%	lib_fight_parsing:parsing_proto_effect(FightData#fight_data{target_prefix = [?PROP_PREFIX_LATTER], value = Health, value_list = [Health]}),
	lib_fight_parsing:parsing_proto_effect(FightData#fight_data{target_prefix = [?PROP_PREFIX_LATTER], value = Health}),
	lib_fight_handle:handle_recover_health(?PROP_PREFIX_LATTER, Health).

get_army_type(Object, Prefix) ->
	Fighter = lib_fight_data:get_fighter(Object),
	case Prefix of
		?PROP_PREFIX_FORMER ->
			Former = Fighter#combat_hero.former,
			Former#combat_army.type;
		?PROP_PREFIX_LATTER ->
			Latter = Fighter#combat_hero.latter,
			Latter#combat_army.type;
		_ -> 0
	end.

get_hero_type(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	lib_fight_api:hero_type(Fighter, Fighter#combat_hero.is_robot).


check_finish(FightData) ->
	LFighter = lib_fight_data:get_fighter(?FIGHTER_TYPE_L),
	RFighter = lib_fight_data:get_fighter(?FIGHTER_TYPE_R),
	case is_die(LFighter) andalso not lib_fight_data:get_is_finish() of
		true ->
			lib_fight_data:put_is_finish(true),
			lib_fight_data:put_no_throw_finish(true),
			try
				lib_fight_handle:handle_win(?FIGHTER_TYPE_R, FightData),
				lib_fight_handle:handle_die(?FIGHTER_TYPE_L, FightData),
				lib_fight_handle:handle_round_finish()
			catch
				_:Reason0  -> ?ERROR("check_finish_r log ~p~n~p~n", [Reason0, erlang:get_stacktrace()])
			end,
			lib_fight_data:put_no_throw_finish(false),
			lib_fight_data:put_fighter(?FIGHTER_TYPE_R, RFighter#combat_hero{win_times = RFighter#combat_hero.win_times + 1}),
%%			?DEBUG("check_finish win:FIGHTER_TYPE_R"),
			?FIGHT_FINISH(true, ?FIGHTER_TYPE_R);
		_ ->
			skip
	end,
	case is_die(RFighter) andalso not lib_fight_data:get_is_finish() of
		true ->
			lib_fight_data:put_is_finish(true),
			lib_fight_data:put_no_throw_finish(true),
			try
				lib_fight_handle:handle_win(?FIGHTER_TYPE_R, FightData),
				lib_fight_handle:handle_die(?FIGHTER_TYPE_L, FightData),
				lib_fight_handle:handle_round_finish()
			catch
				_:Reason1  -> ?ERROR("check_finish_l log ~p~n~p~n", [Reason1, erlang:get_stacktrace()])
			end,
			lib_fight_data:put_no_throw_finish(false),
			lib_fight_data:put_fighter(?FIGHTER_TYPE_L, LFighter#combat_hero{win_times = LFighter#combat_hero.win_times + 1}),
%%			?DEBUG("check_finish win:FIGHTER_TYPE_L"),
			?FIGHT_FINISH(true, ?FIGHTER_TYPE_L);
		_ ->
			skip
	end.
is_die(Fighter) ->
	Former = Fighter#combat_hero.former,
	Latter = Fighter#combat_hero.latter,
	Former#combat_army.cur_troops =< 0 andalso Latter#combat_army.cur_troops =< 0.
former_die(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Former = Fighter#combat_hero.former,
	Former#combat_army.cur_troops =< 0.
latter_die(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Latter = Fighter#combat_hero.latter,
	Latter#combat_army.cur_troops =< 0.
former_troops(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Former = Fighter#combat_hero.former,
	Former#combat_army.cur_troops.
latter_troops(Object) ->
	Fighter = lib_fight_data:get_fighter(Object),
	Latter = Fighter#combat_hero.latter,
	Latter#combat_army.cur_troops.

prefix_die(Object, ?PROP_PREFIX_HERO) ->
	former_die(Object) andalso latter_die(Object);
prefix_die(Object, ?PROP_PREFIX_FORMER) ->
	former_die(Object);
prefix_die(Object, ?PROP_PREFIX_LATTER) ->
	latter_die(Object);
prefix_die(_, _) ->
	false.

hero_can_active(Object) ->
	try
		?JUDGE_RETURN(not prefix_die(Object, ?PROP_PREFIX_HERO), 0),
		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_HERO, ?FIGHT_BUFF_TYPE_1013), 0),
		true
	catch
		_:_  -> false
	end.

former_can_active(Object) ->
	try
	    ?JUDGE_RETURN(not former_die(Object), 0),
		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_FORMER, ?FIGHT_BUFF_TYPE_1001), 0),
		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_FORMER, ?FIGHT_BUFF_TYPE_1004), 0),
		true
	catch
	    _:_  -> false
	end.
latter_can_active(Object) ->
	try
		?JUDGE_RETURN(not latter_die(Object), 0),
		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_LATTER, ?FIGHT_BUFF_TYPE_1001), 0),
		?JUDGE_RETURN(not lib_fight_buff:have_type(Object, ?PROP_PREFIX_LATTER, ?FIGHT_BUFF_TYPE_1004), 0),
		true
	catch
		_:_  -> false
	end.

win_type(Result) ->
	case lib_fight_data:get_fight_type() of
		?FIGHT_TYPE_2 ->
			{LT, RT} =
			dict:fold(fun(_, R, {Acc0, Acc1}) ->
				case R#fight_wastage.is_win =:= true of
					true -> {Acc0, Acc1 + 1};
					_ -> {Acc0 + 1, Acc1}
				end
			end, {0,0}, Result#fight_result.r_wastage),
			Result = lib_fight_data:get_fight_result(),
			case LT >= RT of
				true ->
					lib_fight_data:put_fight_result(Result#fight_result{
						win_type = ?FIGHTER_TYPE_L
					});
				_ ->
					lib_fight_data:put_fight_result(Result#fight_result{
						win_type = ?FIGHTER_TYPE_R
					})
			end;
		_ ->
			skip
	end.

%% 技能能否触发
can_active_skill(Object, ID, RandFlag) ->
	try
		%% 判断是否被禁止发动
		?JUDGE_RETURN(skill_can_launch(ID,Object), 0),
		%% 判定是否是生效的技能
		?JUDGE_RETURN(lib_fight_passive_skill:is_have_passive_effect(?EFFECT_GROUP_SKILL_NO_ACTIVE,
			#fight_data{
				object = ?OTHER(Object),
				skill_id = ID
			}) =/= true, 0),
		%% 判定发动概率
		?JUDGE_RETURN(RandFlag orelse lib_fight_config:skill_active_rand(ID) > lib_fight_rand:rand_float(), 0),
		%% 判定发动技能对象是否能攻击
		SkillPrefix = skill_prefix(Object, ID),
		if
			SkillPrefix =:= ?PROP_PREFIX_HERO -> ?JUDGE_RETURN(hero_can_active(Object), 0);
			SkillPrefix =:= ?PROP_PREFIX_FORMER -> ?JUDGE_RETURN(former_can_active(Object), 0);
			SkillPrefix =:= ?PROP_PREFIX_LATTER -> ?JUDGE_RETURN(latter_can_active(Object), 0);
			true -> skip
		end,
		%% 判定需要联合的对象是否能攻击
		ArmyType = lib_fight_config:skill_trigger_army_type(ID),
		if
			ArmyType =:= ?SKILL_ARMY_LIMIT0 -> skip;
			ArmyType =:= ?SKILL_ARMY_LIMIT1 -> ?JUDGE_RETURN(former_can_active(Object), 0);
			ArmyType =:= ?SKILL_ARMY_LIMIT2 -> ?JUDGE_RETURN(latter_can_active(Object), 0);
			true -> skip
		end,
		%% 判定需要触发的英雄条件是否满足
		?JUDGE_RETURN(trigger_hero(Object, ID), 0),
		%% 判定动需要额外条件是否满足
		ExtraType = lib_fight_config:skill_trigger_extra_type(ID),
		if
			ExtraType =:= ?SKILL_EXTRA_LIMIT1 ->
				ExtraTypeValue1 = lib_fight_config:skill_trigger_extra_value1(ID),
				ExtraTypeValue2 = lib_fight_config:skill_trigger_extra_value2(ID),
				Times = lib_fight_data:get_skill_active_times(Object, ID),
				Fighter = lib_fight_data:get_fighter(Object),
				Max = Fighter#combat_hero.former#combat_army.troops + Fighter#combat_hero.latter#combat_army.troops,
				Cur = Fighter#combat_hero.former#combat_army.cur_troops + Fighter#combat_hero.latter#combat_army.cur_troops,
				?JUDGE_RETURN(Cur / Max < ExtraTypeValue1 andalso Times < ExtraTypeValue2, 0);
			true -> skip
		end,
		true
	catch
		throw:_ -> false;
	    _:_  -> ?ERROR("can_active_skill error ~p~n", [erlang:get_stacktrace()]),false
	end.

trigger_hero(Object, SkillId) ->
	try
		HeroType = lib_fight_config:skill_trigger_hero_type(SkillId),
		Value = lib_fight_config:skill_trigger_hero_value(SkillId),
		HeroIdList = lib_fight_data:get_player_heros(Object, lib_fight_data:get_player_id(Object)),
		Fighter = lib_fight_data:get_fighter(Object),
		List = case Fighter#combat_hero.is_robot of
				   true ->	[maps:get(hero_id, tb_monster_base:get(Base_id))|| Base_id <- HeroIdList];
				   false-> HeroIdList
			   end,
		if
			HeroType =:= ?SKILL_HERO_LIMIT0 -> skip;
			HeroType =:= ?SKILL_HERO_LIMIT1 -> ?JUDGE_RETURN(erlang:length(List) > 1, 0);
			HeroType =:= ?SKILL_HERO_LIMIT2 -> ?JUDGE_RETURN(lists:member(Value, List), 0);
			HeroType =:= ?SKILL_HERO_LIMIT3 -> ?JUDGE_RETURN(is_have_hero_type(List, Value), 0);
			HeroType =:= ?SKILL_HERO_LIMIT4 -> ?JUDGE_RETURN(is_have_hero_sex(List, Value), 0);
			HeroType =:= ?SKILL_HERO_LIMIT5 -> ?JUDGE_RETURN(is_have_hero_quality(List, Value), 0);
			HeroType =:= ?SKILL_HERO_LIMIT6 -> ?JUDGE_RETURN(is_have_hero_color(Object, Value), 0);
			true -> skip
		end,
		true
	catch
		_:_  -> false
	end.

get_skill_hero_list(Object, SkillId) ->
	HeroType = lib_fight_config:skill_trigger_hero_type(SkillId),
	Value = lib_fight_config:skill_trigger_hero_value(SkillId),
	Fighter = lib_fight_data:get_fighter(Object),
	HeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id;false -> Fighter#combat_hero.hero_id end,
	HeroIdList = lib_fight_data:get_player_heros(Object, lib_fight_data:get_player_id(Object)),
	if
		HeroType =:= ?SKILL_HERO_LIMIT0 -> [HeroId];
		HeroType =:= ?SKILL_HERO_LIMIT1 -> [HeroId,lib_fight_rand:rand_one(HeroIdList)];
		HeroType =:= ?SKILL_HERO_LIMIT2 -> List = case Fighter#combat_hero.is_robot of
													  true -> lists:filter(fun(BaseId)-> maps:get(hero_id, tb_monster_base:get(BaseId)) =:= Value end,HeroIdList);
													  false-> [Value]
												  end ,
											case List of
												[] -> [HeroId];
												_  -> [HeroId,lib_fight_rand:rand_one(List)]
											end;
		HeroType =:= ?SKILL_HERO_LIMIT3 ->
			List = lists:filter(fun(Id)-> hero_type(Id) =:= Value end,HeroIdList),
			case List of
				[] -> [HeroId];
				_  -> [HeroId,lib_fight_rand:rand_one(List)]
			end;
		HeroType =:= ?SKILL_HERO_LIMIT4 -> 	List = lists:filter(fun(Id)-> hero_sex(Id)  =:= Value end,HeroIdList),
			case List of
				[] -> [HeroId];
				_  -> [HeroId,lib_fight_rand:rand_one(List)]
			end;
		HeroType =:= ?SKILL_HERO_LIMIT5 -> 	List = lists:filter(fun(Id)-> hero_quality(Id)=:= Value end,HeroIdList),
			case List of
				[] -> [HeroId];
				_  -> [HeroId,lib_fight_rand:rand_one(List)]
			end;
		HeroType =:= ?SKILL_HERO_LIMIT6 ->
			try
				Fighter = lib_fight_data:get_fighter(Object),
				lists:foreach(fun(Tmp) ->
					case Fighter#combat_hero.id =:= Tmp#combat_hero.id andalso Fighter#combat_hero.hero_id =/= Tmp#combat_hero.hero_id of
						true -> ?JUDGE_RETURN(lib_fight_api:hero_quality(Tmp, Tmp#combat_hero.is_robot) =/= Value, Tmp#combat_hero.hero_id);
						_ -> skip
					end
				end, lib_fight_data:get_fighters(Object)),
				[HeroId]
			catch
				_:{error, ErrCode}  -> [HeroId,ErrCode]
			end;
		HeroType =:= ?SKILL_HERO_LIMIT7 ->
			List1 = lists:filter(fun(Id)-> hero_type(Id) =:= 1 end,HeroIdList),
			List2 = lists:filter(fun(Id)-> hero_type(Id) =:= 2 end,HeroIdList),
			List3 = lists:filter(fun(Id)-> hero_type(Id) =:= 3 end,HeroIdList),
			Hero1 = case List1 of [] -> [];_  -> [lib_fight_rand:rand_one(List1)] end,
			Hero2 = case List2 of [] -> [];_  -> [lib_fight_rand:rand_one(List2)] end,
			Hero3 = case List3 of [] -> [];_  -> [lib_fight_rand:rand_one(List3)] end,
			[HeroId|lists:append(Hero1,lists:append(Hero2,Hero3))];
		true -> [HeroId]
	end
.

round_to_round_num(Round, RoundAdd) ->
	case Round of
		?FIGHT_ROUND0 -> 1;
		?FIGHT_ROUND1 -> 2;
		?FIGHT_ROUND2 -> 3;
		?FIGHT_ROUND3 -> 4 + RoundAdd - 1;
		?FIGHT_ROUND4 -> 6 + RoundAdd
	end.

round_num_to_round(Round_num) ->
	if
		Round_num =:= 1 -> {?FIGHT_ROUND0,1};
		Round_num =:= 2 -> {?FIGHT_ROUND1,1};
		Round_num =:= 3 -> {?FIGHT_ROUND2,1};
		Round_num =:= 4 orelse Round_num =:= 5 -> {?FIGHT_ROUND3,Round_num - 3};
		Round_num >= 6 	-> {?FIGHT_ROUND4,Round_num - 5}
	end.

change_round_active(Round, RoundAdd, Value) ->
	case Round =< ?FIGHT_ROUND4 orelse Value =:= 0 orelse Value =:= RoundAdd  of
		false -> {Round, RoundAdd};
		true  -> Round_num = round_to_round_num(Round, RoundAdd),
				 round_num_to_round(Round_num + Value)
	end.

active_skill_round_active(Object, ID) ->
	case round_can_active(ID) of
		true ->
			Data = lib_fight_data:get_change_active_round_skill(Object, lib_fight_config:fetch_skill_group(ID)),
			case Data of
				false -> true;
				_ ->
					Value = lib_fight_passive_skill:passive_effect_value(?EFFECT_SKILL_ADD_OR_CUR_ROUND, #fight_data{skill_id = ID,object = Object}),
					{Round, RoundAdd} = Data,
					{Round1, RoundAdd1} =change_round_active(Round, RoundAdd, Value),
					round_can_active(maps:put(round_add, RoundAdd1, maps:put(round, Round1, maps:new())))
			end;
		false ->
			Value = lib_fight_passive_skill:passive_effect_value(?EFFECT_SKILL_ADD_OR_CUR_ROUND, #fight_data{skill_id = ID,object = Object}),
			Data = lib_fight_data:get_change_active_round_skill(Object, lib_fight_config:fetch_skill_group(ID)),
			case Data of
				false -> false;
				_ ->
					{Round, RoundAdd} = Data,
					{Round1, RoundAdd1} =change_round_active(Round, RoundAdd, Value),
					round_can_active(maps:put(round_add, RoundAdd1, maps:put(round, Round1, maps:new())))
			end
	end.

round_can_active(ID, Conf) ->
	case maps:is_key(round, Conf) andalso maps:is_key(round_add, Conf) of
		true -> round_can_active(Conf);
		 _ -> round_can_active(ID)
	end.
round_can_active(IdOrConf) ->
	{A,B} = lib_fight_data:get_cur_round(),
	case lib_fight_config:skill_round(IdOrConf) of
		0 ->
			B =:= lib_fight_config:skill_round_add(IdOrConf) orelse lib_fight_config:skill_round_add(IdOrConf) =:= 0;
		1 ->
			A =:= 1 andalso (B =:= lib_fight_config:skill_round_add(IdOrConf) orelse lib_fight_config:skill_round_add(IdOrConf) =:= 0);
		2 ->
			A =:= 2 andalso (B =:= lib_fight_config:skill_round_add(IdOrConf) orelse lib_fight_config:skill_round_add(IdOrConf) =:= 0);
		3 ->
			A =:= 3 andalso (B =:= lib_fight_config:skill_round_add(IdOrConf) orelse lib_fight_config:skill_round_add(IdOrConf) =:= 0);
		4 ->
			A =:= 4 andalso (B =:= lib_fight_config:skill_round_add(IdOrConf) orelse lib_fight_config:skill_round_add(IdOrConf) =:= 0);
		5 ->
			A < ?FIGHT_ROUND4;
		6 -> A =:= 3 orelse A =:= 4; %% 战斗阶段（近战和远战回合）
		_ ->
			false
	end.


round_can_active_extra(SkillId) ->
	lists:foldl(fun(Conf, Acc) ->
		case ?EFFECT_SKILL_REACTIVE =:= maps:get(effect, Conf) andalso lib_fight_api:round_can_active(Conf)
			andalso lib_fight_rand:rand_float() < maps:get(rand, Conf, 0) of
			true -> true;
			_ -> Acc
		end
	end, false, lib_fight_config:active_skill_passive_effect(SkillId)).

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
is_have_hero_color(Object, V) ->
	try
		Fighter = lib_fight_data:get_fighter(Object),
		lists:foreach(fun(Tmp) ->
			case Fighter#combat_hero.id =:= Tmp#combat_hero.id andalso Fighter#combat_hero.hero_id =/= Tmp#combat_hero.hero_id of
				true -> ?JUDGE_RETURN(lib_fight_api:hero_quality(Tmp, Tmp#combat_hero.is_robot) =/= V, 0);
				_ -> skip
			end
		end, lib_fight_data:get_fighters(Object)),
		false
	catch
		_:_  -> true
	end.

active_skill_extra_effect(FightData, ActiveTime) ->
	?JUDGE_RETURN(FightData#fight_data.is_be_invalid =/= true, 0),
	lists:foldl(fun(Conf, Acc) ->
		Time = maps:get(active_time, Conf, ?ACTIVE_EFFECT_TIME2),
		if
			ActiveTime =:= Time -> lib_fight_effect:effect(Conf, FightData#fight_data{flag = Acc}), ?EFFECT_NO_TIPS;
			true -> Acc
		end
	end, FightData#fight_data.flag, lib_fight_config:skill_add_effect(FightData#fight_data.skill_id,FightData#fight_data.object)).

add_round(Round) when Round < 0 ->
	{999,999};
add_round(Round) ->
	{A, B} = lib_fight_data:get_cur_round(),
	NewB = B + Round - 1,
	add_round(A, NewB).
add_round(?FIGHT_ROUND1, B) ->
	case B =:= 1 of
		true ->
			{?FIGHT_ROUND1, B};
		_ ->
			add_round(?FIGHT_ROUND2, B - 1)
	end;
add_round(?FIGHT_ROUND2, B) ->
	case B =:= 1 of
		true ->
			{?FIGHT_ROUND2, B};
		_ ->
			add_round(?FIGHT_ROUND3, B - 1)
	end;
add_round(?FIGHT_ROUND3, B) ->
	case B =< 2 of
		true ->
			{?FIGHT_ROUND3, B};
		_ ->
			add_round(?FIGHT_ROUND4, B - 2)
	end;
add_round(?FIGHT_ROUND4, B) ->
	{?FIGHT_ROUND4, B}.

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
hero_quality(Fighter, IsRobot) ->
	case IsRobot of
		true -> lib_robot_api:monster_quality(Fighter#combat_hero.robot_base_id);
		false -> lib_hero_api:hero_quality(Fighter#combat_hero.hero_id)
	end.

insert_buff_list() ->
	CombatQueue = lib_fight_data:get_combat_queue(),
	LBuffList = CombatQueue#combat_queue_detail.l_buff_list,
	RBuffList = CombatQueue#combat_queue_detail.r_buff_list,
	lib_fight_buff:insert_buff(#fight_data{target_object = ?FIGHTER_TYPE_L, target_prefix = ?PREFIX_LIST}, LBuffList),
	lib_fight_buff:insert_buff(#fight_data{target_object = ?FIGHTER_TYPE_R, target_prefix = ?PREFIX_LIST}, RBuffList).

skill_group_hurt(FightData, Hurt) ->
	Group = lib_fight_config:fetch_skill_group(FightData#fight_data.skill_id),
	Percent = lib_fight_data:get_group_skill_hurt(FightData#fight_data.object, Group),
	max(0, trunc(Hurt * (1 + Percent))).

get_skill_sort_group(SkillId) ->
	{A,B} = lib_fight_data:get_cur_round(),
	A0 = lib_fight_config:skill_round(SkillId),
	B0 = lib_fight_config:skill_round_add(SkillId),
	if
		A =:= A0 andalso B =:= B0 -> ?SKILL_GROUP1;
		A < A0 orelse (A =:= A0 andalso B < B0) -> ?SKILL_GROUP2;
		true -> ?SKILL_GROUP0
	end.

get_group_skill_level(Group, SkillList) ->
	try
		lists:foreach(fun(SkillId) ->
			case lib_fight_config:fetch_skill_group(SkillId) =:= Group of
				true ->
					throw({ok, lib_fight_config:fetch_skill_level(SkillId)});
				_ -> skip
			end
		end, SkillList),
		0
	catch
	    throw:{ok, Level}  -> Level
	end .


begin_deduct_health_one(FightData, Conf) ->
	case prefix_die(FightData#fight_data.target_object, FightData#fight_data.target_prefix) of
		true ->
			case prefix_die(FightData#fight_data.target_object, ?OTHER_ARMY(FightData#fight_data.target_prefix)) of
				true ->
%%					?DEBUG("target prefix die"),
					FightData#fight_data{target_prefix = [FightData#fight_data.target_prefix],value = 0};
				_ ->
					AttackType = attack_type(FightData#fight_data{
						target_prefix = ?OTHER_ARMY(FightData#fight_data.target_prefix)
					}),
					deduct_health_one(FightData#fight_data{
						target_prefix = ?OTHER_ARMY(FightData#fight_data.target_prefix)
					}, Conf, AttackType)
			end;
		_ ->
			AttackType = attack_type(FightData#fight_data{target_prefix = ?OTHER_ARMY(FightData#fight_data.target_prefix)}),
			deduct_health_one(FightData, Conf, AttackType)
	end.

prefix_attack(?PROP_PREFIX_HERO, FightData, Prop) ->
	(prefix_attack(?PROP_PREFIX_FORMER, FightData, Prop) + prefix_attack(?PROP_PREFIX_LATTER, FightData, Prop)) * 0.5;
prefix_attack(Prefix, FightData, Prop) ->
	Attack = lib_fight_prop:get_prop(Prefix, ?ATTACK, Prop),
	AttackRate = lib_fight_prop:get_prop(Prefix, ?ATTACK_RATE, Prop),
	BaseAttack = lib_fight_prop:get_prop(Prefix, ?BASE_ATTACK, Prop),
	BaseAttackRate = lib_fight_prop:get_prop(Prefix, ?BASE_ATTACK_RATE, Prop),
	Buff1Va = lib_fight_buff:buff_value_a(FightData#fight_data.object, Prefix, ?FIGHT_BUFF_TYPE_1002),
	Buff2Va = lib_fight_buff:buff_value_a(FightData#fight_data.object, Prefix, ?FIGHT_BUFF_TYPE_1008),
	EffectAttackMulti = lib_fight_passive_skill:passive_effect_value(?EFFECT_ATTACK_MULTI, FightData),
	max(0,(Attack * (1 + AttackRate) + BaseAttack * (1 + BaseAttackRate)) * (1 - Buff1Va - Buff2Va)) * (1 + EffectAttackMulti).

prefix_defence(Prefix, FightData, Prop) ->
	Defence = lib_fight_prop:get_prop(Prefix, ?DEFENCE, Prop),
	DefenceRate = lib_fight_prop:get_prop(Prefix, ?DEFENCE_RATE, Prop),
	BaseDefence = lib_fight_prop:get_prop(Prefix, ?BASE_DEFENCE, Prop),
	BaseDefenceRate = lib_fight_prop:get_prop(Prefix, ?BASE_DEFENCE_RATE, Prop),
	Buff1 = lib_fight_buff:buff_value_a(FightData#fight_data.target_object, Prefix, ?FIGHT_BUFF_TYPE_1002),
	Buff2 = lib_fight_buff:buff_value_a(FightData#fight_data.target_object, Prefix, ?FIGHT_BUFF_TYPE_1008),
	EffectDefenceMulti = lib_fight_passive_skill:passive_effect_value(?EFFECT_DEFENCE_MULTI, FightData#fight_data{
		object = FightData#fight_data.target_object,
		prefix = FightData#fight_data.target_prefix
	}),
	IgnoreDefence = lib_fight_effect:get_self_effect_value(FightData, ?EFFECT_IGNORE_DEFENCE),
%%	?DEBUG("prefix_defence  ~p ~p~n", [IgnoreDefence, FightData#fight_data.ignore_defence]),
	(max(0, (Defence * (1 + DefenceRate) + BaseDefence * (1 + BaseDefenceRate)) *
		(1 - IgnoreDefence - FightData#fight_data.ignore_defence) * (1 - Buff1 - Buff2))) * (1 + EffectDefenceMulti).

break_attack_rate(Prefix, Prop) ->
	lib_fight_prop:get_prop(Prefix, ?BREAK_ATTACK_RATE, Prop).

break_defence_rate(?PROP_PREFIX_HERO, Prop) ->
	(break_defence_rate(?PROP_PREFIX_FORMER, Prop) + break_defence_rate(?PROP_PREFIX_LATTER, Prop)) * 0.5;
break_defence_rate(Prefix, Prop) ->
	lib_fight_prop:get_prop(Prefix, ?BREAK_DEFENCE_RATE, Prop).

final_attack(?PROP_PREFIX_HERO, Prop) ->
	(break_attack_rate(?PROP_PREFIX_FORMER, Prop) + break_attack_rate(?PROP_PREFIX_LATTER, Prop)) * 0.5;
final_attack(Prefix, Prop) ->
	FinalAttack = lib_fight_prop:get_prop(Prefix, ?FINAL_ATTACK, Prop),
	FinalAttackRate = lib_fight_prop:get_prop(Prefix, ?FINAL_ATTACK_RATE, Prop),
	FinalAttack * (1 + FinalAttackRate).

final_defence(Prefix, Prop) ->
	FinalDefence = lib_fight_prop:get_prop(Prefix, ?FINAL_DEFENCE, Prop),
	FinalDefenceRate = lib_fight_prop:get_prop(Prefix, ?FINAL_DEFENCE_RATE, Prop),
	FinalDefence * (1 + FinalDefenceRate).

get_skill_rate(SkillId,Conf,FightData) ->
	SKillRate = maps:get(rate, Conf, 1),
	AddRate = get_add_skill_rate(SkillId,FightData),
	case AddRate < 0 of
		true -> SKillRate + AddRate;
		false-> case  maps:get(is_add_rate, Conf, 0) of
					1 -> SKillRate + AddRate;
					_ -> SKillRate
				end
	end
.

%% 技能增加概率
get_add_skill_rate(ObjectSkillId,FightData) ->
	L_Fighter = lib_fight_data:get_fighter(FightData#fight_data.object),
	R_Fighter = lib_fight_data:get_fighter(?OTHER(FightData#fight_data.object)),
	SkillGroup = maps:get(group,tb_skill:get(ObjectSkillId)),
	A =
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, Rate) ->
			try
			    ?JUDGE_RETURN(maps:get(effect,Conf) =:= ?EFFECT_SKILL_RAND_ADD,0),
				?JUDGE_RETURN(maps:get(effect_object,Conf,1) =:= 1,0),
				case maps:get(is_all,Conf,0) =:= 1 of
					true -> skip;
					false-> ?JUDGE_RETURN(maps:get(skill_group,Conf) =:= SkillGroup,0)
				end,
				?JUDGE_RETURN(lib_fight_effect:can_effect(FightData, Conf),0),
				maps:get(rate,Conf,0) + Rate
			catch
			    _:_  -> Rate
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId))
	end, 0, L_Fighter#combat_hero.skill_list),
	B =
	?LISTS_FOLD(fun(SkillId, Acc) ->
		lists:foldl(fun(Conf, Rate) ->
			try
				?JUDGE_RETURN(maps:get(effect,Conf) =:= ?EFFECT_SKILL_RAND_ADD,0),
				?JUDGE_RETURN(maps:get(effect_object,Conf,1) =:= 2,0),
				case maps:get(is_all,Conf,0) =:= 1 of
					true -> skip;
					false-> ?JUDGE_RETURN(maps:get(skill_group,Conf) =:= SkillGroup,0)
				end,
				?JUDGE_RETURN(lib_fight_effect:can_effect(FightData, Conf),0),
				maps:get(rate,Conf,0) + Rate
			catch
				_:_  -> Rate
			end
		end, Acc, lib_fight_config:passive_skill_effect(SkillId))
	end, 0, R_Fighter#combat_hero.skill_list),
	A + B
.

skill_can_launch(Skill_ID,Object) ->
	Fighter = lib_fight_data:get_fighter(?OTHER(Object)),
	SKillConf = tb_skill:get(Skill_ID),
	{A,B} = lib_fight_data:get_cur_round(),
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
				Round = maps:get(round,Conf,0),
				?JUDGE_RETURN(A =:= Round orelse Round =:= 0,0),
				Round_add = maps:get(round_add,Conf,0),
				?JUDGE_RETURN(B =:= Round_add orelse Round_add =:= 0,0),
				Is_hero_possess = maps:get(is_hero_possess,Conf,0),
				case Is_hero_possess of
					1 -> ?JUDGE_RETURN(lists:member(Skill_ID,Fighter#combat_hero.skill_list),0);
					0 -> skip
				end,
				throw({ok})
			end, Acc, lib_fight_config:passive_skill_effect(SkillId))
		catch
			throw:{ok} -> false;
			_:_  -> Acc
		end
	end, true, Fighter#combat_hero.skill_list).

buff_can_activity(FightData, BuffId) ->
	BuffConf = tb_buff:get(BuffId),
	Fighter = lib_fight_data:get_fighter(FightData#fight_data.target_object),
	lists:foldl(fun(SkillId, Acc) ->
		try
			?JUDGE_RETURN(lib_fight_config:is_passive_skill(SkillId), 0),
			lists:foldl(fun(Conf, _Acc1) ->
				?JUDGE_RETURN(maps:get(effect,Conf) =:= ?EFFECT_IGNORE_BUFF,0),
				Buff_group = maps:get(buff_group,Conf,0),
				?JUDGE_RETURN(maps:get(group,BuffConf) =:= Buff_group orelse Buff_group =:= 0,0),
				Buff_type = maps:get(type,Conf,0),
				?JUDGE_RETURN(maps:get(skill_type,BuffConf) =:= Buff_type orelse Buff_type =:= 0,0),
				throw({ok})
			end, Acc, lib_fight_config:passive_skill_effect(SkillId))
		catch
			throw:{ok} -> false;
			_:_  -> Acc
		end
	end, true, Fighter#combat_hero.skill_list).