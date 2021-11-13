%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_data.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_data).
-include("common.hrl").
-include("fight.hrl").
-include("fight_prop.hrl").
-include("combat_queue.hrl").

%% API
-export([
	get_cur_round/0,
	put_cur_round/1,
	reset_cur_round/0,
	add_cur_round/0,

	get_rank_init/0,
	put_rank_init/1,

	get_combat_queue/0,
	put_combat_queue/1,
	get_fight_type/0,
	get_combat_times/0,
	add_combat_times/0,
	get_player_heros/2,

	get_player_id/1,
	get_fighters/1,
	put_fighters/2,
	get_fighter/1,
	put_fighter/2,
	get_army/2,
	get_fighter_prop/1,
	get_fighter_force/1,
	get_fighter_skill_list/1,
	get_former/1,
	get_latter/1,
	get_former_speed/1,
	get_latter_speed/1,
	get_army_speed/2,
	handle_fighter/0,
	get_total_loss/1,


	get_fight_result/0,
	put_fight_result/1,
	reset_fight_result/1,
	add_interval/1,
	set_win_type/1,
	init_wastage/0,
	finish_wastage/0,
	update_wastage_former/2,
	update_wastage_latter/2,

	init_last_hurt/0,
	put_last_hurt/2,
	put_last_hurt/3,
	get_last_hurt/1,
	get_last_hurt/2,

	put_is_finish/1,
	get_is_finish/0,

	put_no_throw_finish/1,
	get_no_throw_finish/0,

	get_buff_map/2,
	put_buff_map/3,

	add_active_attack_times/2,
	active_attack_times/2,
	add_attack_times/2,
	attack_times/2,

	get_skill_prefix/1,
	get_prefix/0,
	put_prefix/2,

	get_skill_active_times/2,
	add_skill_active_times/2,
	get_skill_round_active_times/2,
	add_skill_round_active_times/2,
	reset_skill_round_active_times/0,

	get_hurt_times/1,
	add_hurt_times/1,
	reset_hurt_times/0,

	add_group_skill_hurt/3,
	reset_group_skill_hurt/0,
	get_group_skill_hurt/2,

	get_change_active_round_skill/2,
	add_change_active_round_skill/4,
	reset_change_active_round_skill/0,

	get_skill_extra_data/2,
	put_skill_extra_data/3,
	reset_skill_extra_data/0,

	get_avoid_hurt_time/2,			%% 免疫伤害次数
	put_avoid_hurt_time/3,
	reset_avoid_hurt_time/0,

	get_change_config_skill/2,
	put_change_config_skill/3,
	reset_change_config_skill/0,

	get_change_buff/2,
	put_change_buff/3,
	reset_change_buff/0
]).

reset_cur_round() ->
	put_cur_round({0,0}).
add_cur_round() ->
	{A,B} = get_cur_round(),
	put_cur_round(case A of
		?FIGHT_ROUND0 -> {?FIGHT_ROUND1,1};
		?FIGHT_ROUND1 -> {?FIGHT_ROUND2,1};
		?FIGHT_ROUND2 -> {?FIGHT_ROUND3,1};
		?FIGHT_ROUND3 -> case B+1=<2 of true -> {?FIGHT_ROUND3,B+1}; _ -> {?FIGHT_ROUND4,1} end;
		?FIGHT_ROUND4 -> {?FIGHT_ROUND4,B+1}
	end).
get_cur_round() ->
	erlang:get(cur_round).
put_cur_round(CurRound) ->
	erlang:put(cur_round, CurRound).

get_rank_init() ->
	erlang:get(rank_init).
put_rank_init(RankInit) ->
	erlang:put(rank_init, RankInit).

get_combat_queue() ->
	erlang:get(combat_queue).
put_combat_queue(CombatQueue) ->
	erlang:put(combat_queue, CombatQueue).
get_fight_type() ->
	CombatQueue = get_combat_queue(),
	CombatQueue#combat_queue_detail.fight_type.
get_combat_times() ->
	CombatQueue = get_combat_queue(),
	CombatQueue#combat_queue_detail.combat_times.
add_combat_times() ->
	CombatQueue = get_combat_queue(),
	put_combat_queue(CombatQueue#combat_queue_detail{combat_times = CombatQueue#combat_queue_detail.combat_times + 1}).
get_player_id(Object) ->
	Fighter = get_fighter(Object),
	Fighter#combat_hero.id.
get_fighters(Object) ->
	CombatQueue = get_combat_queue(),
	if
		Object =:= ?FIGHTER_TYPE_L -> CombatQueue#combat_queue_detail.l_fighters;
		Object =:= ?FIGHTER_TYPE_R -> CombatQueue#combat_queue_detail.r_fighters;
		true -> ?ERROR("get_fighters error ~p~n", [Object]), error_object
	end.
put_fighters(Object, Fighters) ->
	CombatQueue = get_combat_queue(),
	if
		Object =:= ?FIGHTER_TYPE_L ->
			put_combat_queue(CombatQueue#combat_queue_detail{l_fighters = Fighters});
		Object =:= ?FIGHTER_TYPE_R ->
			put_combat_queue(CombatQueue#combat_queue_detail{r_fighters = Fighters});
		true -> ?ERROR("put_fighters error ~p~n", [Object]), error_object
	end.
get_player(Object, ID) ->
	CombatQueue = get_combat_queue(),
	if
		Object =:= ?FIGHTER_TYPE_L -> ?DICT_FETCH(ID, CombatQueue#combat_queue_detail.l_player_dict, #combat_player{});
		Object =:= ?FIGHTER_TYPE_R -> ?DICT_FETCH(ID, CombatQueue#combat_queue_detail.r_player_dict, #combat_player{});
		true -> ?ERROR("get_player_dict error ~p~n", [Object]), #combat_player{}
	end.
get_player_heros(Object, ID) ->
	Player = get_player(Object, ID),
	Player#combat_player.heros.
get_fighter(Object) ->
	Result = get_fight_result(),
	case Object of
		?FIGHTER_TYPE_L ->
			L = Result#fight_result.l_wastage,
			L#fight_wastage.fighter;
		?FIGHTER_TYPE_R ->
			R = Result#fight_result.r_wastage,
			R#fight_wastage.fighter
	end.
put_fighter(Object, Fighter) ->
	Result = get_fight_result(),
	case Object of
		?FIGHTER_TYPE_L ->
			L = Result#fight_result.l_wastage,
			put_fight_result(Result#fight_result{l_wastage = L#fight_wastage{fighter = Fighter}});
		?FIGHTER_TYPE_R ->
			R = Result#fight_result.r_wastage,
			put_fight_result(Result#fight_result{r_wastage = R#fight_wastage{fighter = Fighter}})
	end.

get_army(Object, Prefix) ->
	Fighter = get_fighter(Object),
	case Prefix of
		?PROP_PREFIX_FORMER -> Fighter#combat_hero.former;
		?PROP_PREFIX_LATTER -> Fighter#combat_hero.latter;
		_ -> #combat_army{}
	end.
put_army(Object, Prefix, Army) ->
	Fighter = get_fighter(Object),
	NewFighter =
		case Prefix of
			?PROP_PREFIX_FORMER -> Fighter#combat_hero{former = Army};
			?PROP_PREFIX_LATTER -> Fighter#combat_hero{latter = Army}
		end,
	put_fighter(Object, NewFighter).

get_fighter_prop(Object) ->
	Fighter = get_fighter(Object),
	%% 把预估小的prop_dict放前面
	PropDict = lib_fight_prop:increase_prop([Fighter#combat_hero.fight_prop3, Fighter#combat_hero.fight_prop2,
		Fighter#combat_hero.fight_prop1, Fighter#combat_hero.prop_dict]),
	lib_fight_prop:statistics_prop_dict(Fighter#combat_hero.prop_base, PropDict).
get_fighter_force(Object) ->
	Fighter = get_fighter(Object),
	Fighter#combat_hero.hero_force.
get_fighter_skill_list(Object) ->
	Fighter = get_fighter(Object),
	Fighter#combat_hero.skill_list.
get_former(Object) ->
	Fighter = get_fighter(Object),
	Fighter#combat_hero.former.
get_latter(Object) ->
	Fighter = get_fighter(Object),
	Fighter#combat_hero.latter.
get_former_speed(Object) ->
	lib_fight_prop:panel_speed(?PROP_PREFIX_FORMER, get_fighter_prop(Object)).
get_latter_speed(Object) ->
	lib_fight_prop:panel_speed(?PROP_PREFIX_LATTER, get_fighter_prop(Object)).

get_army_speed(Object, Type) ->
	Former = get_former(Object),
	Latter = get_latter(Object),
	if
		Former#combat_army.type =:= Type -> get_former_speed(Object);
		Latter#combat_army.type =:= Type -> get_latter_speed(Object);
		true -> 0
	end.
handle_fighter() ->
	handle_fighter(?FIGHTER_TYPE_L),
	handle_fighter(?FIGHTER_TYPE_R).
handle_fighter(Object) ->
	[Fighter | Fighters] = get_fighters(Object),
	case lib_fight_api:is_die(Fighter) of
		true ->
			put_fighters(Object, Fighters);
		_ ->
			put_fighters(Object, lists:append(Fighters, [Fighter]))
	end.

get_fight_result() ->
	erlang:get(fight_result).
put_fight_result(Result) ->
	erlang:put(fight_result, Result).
reset_fight_result(CombatQueue) ->
	put_fight_result(#fight_result{
		combat_id = CombatQueue#combat_queue_detail.combat_id
	}).
add_interval(Time) ->
	Result = get_fight_result(),
	put_fight_result(Result#fight_result{
		interval = Result#fight_result.interval + Time
	}).
set_win_type(Win) ->
	Result = get_fight_result(),
	case Win of
		?FIGHTER_TYPE_L ->
			Wastage = get_wastage(?FIGHTER_TYPE_L),
			put_fight_result(Result#fight_result{
				win_type = Win
			}),
			put_wastage(?FIGHTER_TYPE_L, Wastage#fight_wastage{is_win = true});
		?FIGHTER_TYPE_R ->
			Wastage1 = get_wastage(?FIGHTER_TYPE_R),
			put_fight_result(Result#fight_result{
				win_type = Win
			}),
			put_wastage(?FIGHTER_TYPE_R, Wastage1#fight_wastage{is_win = true});
		_ ->
			put_fight_result(Result#fight_result{
				win_type = Win
			})
	end.
init_wastage() ->
	Result = get_fight_result(),
	[LFighter | _] = get_fighters(?FIGHTER_TYPE_L),
	[RFighter | _] = get_fighters(?FIGHTER_TYPE_R),
	LFormer = LFighter#combat_hero.former,
	LLatter = LFighter#combat_hero.latter,
	RFormer = RFighter#combat_hero.former,
	RLatter = RFighter#combat_hero.latter,
	put_fight_result(Result#fight_result{
		l_wastage = #fight_wastage{fighter = LFighter, start_front = LFormer#combat_army.cur_troops, start_back = LLatter#combat_army.cur_troops},
		r_wastage = #fight_wastage{fighter = RFighter, start_front = RFormer#combat_army.cur_troops, start_back = RLatter#combat_army.cur_troops}
	}).
finish_wastage() ->
	Result = get_fight_result(),
	LFighter = get_fighter(?FIGHTER_TYPE_L),
	RFighter = get_fighter(?FIGHTER_TYPE_R),
	LFormer = LFighter#combat_hero.former,
	LLatter = LFighter#combat_hero.latter,
	RFormer = RFighter#combat_hero.former,
	RLatter = RFighter#combat_hero.latter,
	LWastage = get_wastage(?FIGHTER_TYPE_L),
	RWastage = get_wastage(?FIGHTER_TYPE_R),
	put_fight_result(Result#fight_result{
		l_wastage = LWastage#fight_wastage{over_front = LFormer#combat_army.cur_troops, over_back = LLatter#combat_army.cur_troops},
		r_wastage = RWastage#fight_wastage{over_front = RFormer#combat_army.cur_troops, over_back = RLatter#combat_army.cur_troops}
	}).
get_wastage(Object) ->
	Result = get_fight_result(),
	if
		Object =:= ?FIGHTER_TYPE_L ->
			Result#fight_result.l_wastage;
		Object =:= ?FIGHTER_TYPE_R ->
			Result#fight_result.r_wastage;
		true -> #fight_wastage{}
	end.
put_wastage(Object, Wastage) ->
	Result = get_fight_result(),
	if
		Object =:= ?FIGHTER_TYPE_L ->
			put_fight_result(Result#fight_result{
				l_wastage = Wastage
			});
		Object =:= ?FIGHTER_TYPE_R ->
			put_fight_result(Result#fight_result{
				r_wastage = Wastage
			});
		true -> skip
	end.
update_wastage_former(FightData, Hurt) ->
	Result = get_fight_result(),
	if
		FightData#fight_data.object =:= FightData#fight_data.target_object -> skip;
		FightData#fight_data.object =:= ?FIGHTER_TYPE_L ->
			LWastage = get_wastage(FightData#fight_data.object),
			RWastage = get_wastage(FightData#fight_data.target_object),
			put_fight_result(Result#fight_result{
				l_wastage = LWastage#fight_wastage{kills = LWastage#fight_wastage.kills + Hurt},
				r_wastage = RWastage#fight_wastage{front_loss = RWastage#fight_wastage.front_loss + Hurt}
			});
		FightData#fight_data.object =:= ?FIGHTER_TYPE_R ->
			RWastage = get_wastage(FightData#fight_data.object),
			LWastage = get_wastage(FightData#fight_data.target_object),
			put_fight_result(Result#fight_result{
				r_wastage = RWastage#fight_wastage{kills = RWastage#fight_wastage.kills + Hurt},
				l_wastage = LWastage#fight_wastage{front_loss = LWastage#fight_wastage.front_loss + Hurt}
			});
		true -> skip
	end.
update_wastage_latter(FightData, Hurt) ->
	Result = get_fight_result(),
	if
		FightData#fight_data.object =:= FightData#fight_data.target_object -> skip;
		FightData#fight_data.object =:= ?FIGHTER_TYPE_L ->
			LWastage = get_wastage(FightData#fight_data.object),
			RWastage = get_wastage(FightData#fight_data.target_object),
			put_fight_result(Result#fight_result{
				l_wastage = LWastage#fight_wastage{kills = LWastage#fight_wastage.kills + Hurt},
				r_wastage = RWastage#fight_wastage{back_loss = RWastage#fight_wastage.back_loss + Hurt}
			});
		FightData#fight_data.object =:= ?FIGHTER_TYPE_R ->
			RWastage = get_wastage(FightData#fight_data.object),
			LWastage = get_wastage(FightData#fight_data.target_object),
			put_fight_result(Result#fight_result{
				r_wastage = RWastage#fight_wastage{kills = RWastage#fight_wastage.kills + Hurt},
				l_wastage = LWastage#fight_wastage{back_loss = LWastage#fight_wastage.back_loss + Hurt}
			});
		true -> skip
	end.

get_total_loss(Object) ->
	Result = get_fight_result(),
	case Object of
		?FIGHTER_TYPE_L ->
			L = Result#fight_result.l_wastage,
			L#fight_wastage.front_loss + L#fight_wastage.back_loss;
		?FIGHTER_TYPE_R ->
			R = Result#fight_result.r_wastage,
			R#fight_wastage.front_loss + R#fight_wastage.back_loss;
		_ -> 0
	end.

init_last_hurt() ->
	put_last_hurt(?FIGHTER_TYPE_L, maps:new()),
	put_last_hurt(?FIGHTER_TYPE_R, maps:new()).
get_last_hurt(Object) ->
	case Object of
		?FIGHTER_TYPE_L ->
			erlang:get(l_last_hurt);
		?FIGHTER_TYPE_R ->
			erlang:get(r_last_hurt)
	end.
get_last_hurt(Object, SkillGroup) ->
	Maps = get_last_hurt(Object),
	maps:get(SkillGroup, Maps, 0).
put_last_hurt(Object, SkillGroup, Hurt) ->
	Maps = get_last_hurt(Object),
	put_last_hurt(Object, maps:put(SkillGroup, Hurt, Maps)).
put_last_hurt(Object, Maps) ->
	case Object of
		?FIGHTER_TYPE_L ->
			erlang:put(l_last_hurt, Maps);
		?FIGHTER_TYPE_R ->
			erlang:put(r_last_hurt, Maps)
	end.

put_is_finish(Flag) ->
	erlang:put(is_finish, Flag).
get_is_finish() ->
	erlang:get(is_finish).

put_no_throw_finish(Flag) ->
	erlang:put(no_throw_finish, Flag).
get_no_throw_finish() ->
	erlang:get(no_throw_finish).

buff_map_atom(Object, Prefix) ->
	lib_types:to_atom(lib_types:to_list(buff_map) ++ lib_types:to_list(Object) ++ lib_types:to_list(Prefix)).

get_buff_map(Object, Prefix) ->
	erlang:get(buff_map_atom(Object, Prefix)).

put_buff_map(Object, Prefix, BuffMap) ->
	erlang:put(buff_map_atom(Object, Prefix), BuffMap).

add_attack_times(Object, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Fighter = get_fighter(Object),
			put_fighter(Object, Fighter#combat_hero{attack_times = Fighter#combat_hero.attack_times});
		_ ->
			Army = get_army(Object, Prefix),
			put_army(Object, Prefix, Army#combat_army{attack_times = Army#combat_army.attack_times + 1})
	end.

add_active_attack_times(Object, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Fighter = get_fighter(Object),
			put_fighter(Object, Fighter#combat_hero{active_attack_times = Fighter#combat_hero.active_attack_times});
		_ ->
			Army = get_army(Object, Prefix),
			put_army(Object, Prefix, Army#combat_army{active_attack_times = Army#combat_army.active_attack_times + 1})
	end.

attack_times(Object, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Fighter = get_fighter(Object),
			Fighter#combat_hero.attack_times;
		_ ->
			Army = get_army(Object, Prefix),
			Army#combat_army.attack_times
	end.
active_attack_times(Object, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Fighter = get_fighter(Object),
			Fighter#combat_hero.active_attack_times;
		_ ->
			Army = get_army(Object, Prefix),
			Army#combat_army.active_attack_times
	end.

get_skill_prefix(SkillId) ->
	?DICT_FETCH(SkillId, get_prefix(), []).
get_prefix() ->
	Dict = erlang:get(skill_prefix),
	case Dict of
		undefined -> dict:new();
		_ -> Dict
	end.
put_prefix(SkillId, Prefix) ->
	Dict = dict:store(SkillId, Prefix, get_prefix()),
	erlang:put(skill_prefix, Dict).

get_skill_active_times(Object) ->
	Dict =
	case Object of ?FIGHTER_TYPE_L -> erlang:get(l_skill_active_times);
	?FIGHTER_TYPE_R -> erlang:get(r_skill_active_times) end,
	case Dict of undefined -> dict:new(); _ -> Dict end.
get_skill_active_times(Object, SkillId) ->
	Dict = get_skill_active_times(Object),
	?DICT_FETCH(SkillId, Dict, 0).
put_skill_active_times(Object, Dict) ->
	case Object of
		?FIGHTER_TYPE_L ->
			erlang:put(l_skill_active_times, Dict);
		?FIGHTER_TYPE_R ->
			erlang:put(r_skill_active_times, Dict)
	end.
add_skill_active_times(Object, SkillId) ->
	Dict = get_skill_active_times(Object),
	OldTimes = ?DICT_FETCH(SkillId, Dict, 0),
	NewDict = dict:store(SkillId, OldTimes + 1, Dict),
	put_skill_active_times(Object, NewDict).


get_skill_round_active_times(Object) ->
	Dict =
		case Object of ?FIGHTER_TYPE_L -> erlang:get(l_skill_round_active_times);
			?FIGHTER_TYPE_R -> erlang:get(r_skill_round_active_times) end,
	case Dict of undefined -> dict:new(); _ -> Dict end.
get_skill_round_active_times(Object, SkillId) ->
	Dict = get_skill_round_active_times(Object),
	?DICT_FETCH(SkillId, Dict, 0).
put_skill_round_active_times(Object, Dict) ->
	case Object of
		?FIGHTER_TYPE_L ->
			erlang:put(l_skill_round_active_times, Dict);
		?FIGHTER_TYPE_R ->
			erlang:put(r_skill_round_active_times, Dict)
	end.
add_skill_round_active_times(Object, SkillId) ->
	Dict = get_skill_round_active_times(Object),
	OldTimes = ?DICT_FETCH(SkillId, Dict, 0),
	NewDict = dict:store(SkillId, OldTimes + 1, Dict),
	put_skill_round_active_times(Object, NewDict).

reset_skill_round_active_times() ->
	put_skill_round_active_times(?FIGHTER_TYPE_L, dict:new()),
	put_skill_round_active_times(?FIGHTER_TYPE_R, dict:new()).

reset_hurt_times() ->
	put_hurt_times(?FIGHTER_TYPE_L, 0),
	put_hurt_times(?FIGHTER_TYPE_R, 0).

get_hurt_times(Object) ->
	case Object of
		?FIGHTER_TYPE_L ->
			erlang:get(l_hurt_times);
		?FIGHTER_TYPE_R ->
			erlang:get(r_hurt_times)
	end.
put_hurt_times(Object, Times) ->
	case Object of
		?FIGHTER_TYPE_L ->
			erlang:put(l_hurt_times, Times);
		?FIGHTER_TYPE_R ->
			erlang:put(r_hurt_times, Times)
	end.
add_hurt_times(Object) ->
	put_hurt_times(Object, get_hurt_times(Object) + 1).

get_group_skill_hurt() ->
	erlang:get(group_skill_hurt).
get_group_skill_hurt(Object) ->
	maps:get(Object, get_group_skill_hurt(), maps:new()).
get_group_skill_hurt(Object, Group) ->
	maps:get(Group, get_group_skill_hurt(Object), 0).
put_group_skill_hurt(Map) ->
	erlang:put(group_skill_hurt, Map).
put_group_skill_hurt(Object, Map) ->
	put_group_skill_hurt(maps:put(Object, Map, get_group_skill_hurt())).
add_group_skill_hurt(Object, Group, Percent) ->
	Map = maps:put(Group, Percent + get_group_skill_hurt(Object, Group), get_group_skill_hurt(Object)),
	put_group_skill_hurt(Object, Map).
reset_group_skill_hurt() ->
	put_group_skill_hurt(maps:new()).

get_change_active_round_skill() ->
	erlang:get(active_round_skill).
get_change_active_round_skill(Object) ->
	maps:get(Object, get_change_active_round_skill(), maps:new()).
get_change_active_round_skill(Object, Group) ->
	maps:get(Group, get_change_active_round_skill(Object), false).
put_change_active_round_skill(Map) ->
	erlang:put(active_round_skill, Map).
put_change_active_round_skill(Object, Map0) ->
	Map = get_change_active_round_skill(),
	put_change_active_round_skill(maps:put(Object, Map0, Map)).
add_change_active_round_skill(Object, Group, Round, RoundAdd) ->
	Map = get_change_active_round_skill(Object),
	put_change_active_round_skill(Object, maps:put(Group, {Round, RoundAdd}, Map)).
reset_change_active_round_skill() ->
	put_change_active_round_skill(maps:new()).

get_skill_extra_data() ->
	erlang:get(skill_extra_data).
get_skill_extra_data(Object) ->
	maps:get(Object, get_skill_extra_data(), maps:new()).
get_skill_extra_data(Object, SkillId) ->
	maps:get(SkillId, get_skill_extra_data(Object), false).

put_skill_extra_data(DataMap) ->
	erlang:put(skill_extra_data, DataMap).
put_skill_extra_data(Object, DataMap) ->
	DataMap0 = get_skill_extra_data(),
	put_skill_extra_data(maps:put(Object, DataMap, DataMap0)).
put_skill_extra_data(Object, SkillId, Data) ->
	DataMap = get_skill_extra_data(Object),
	put_skill_extra_data(Object, maps:put(SkillId, Data, DataMap)).

reset_skill_extra_data() ->
	put_skill_extra_data(maps:new()).


get_avoid_hurt_time() ->
	erlang:get(avoid_hurt_time).
get_avoid_hurt_time(Object) ->
	maps:get(Object, get_avoid_hurt_time(), maps:new()).
get_avoid_hurt_time(Object, Target_prefix) ->
	maps:get(Target_prefix, get_avoid_hurt_time(Object), 0).

put_avoid_hurt_time(DataMap) ->
	erlang:put(avoid_hurt_time, DataMap).
put_avoid_hurt_time(Object, DataMap) ->
	DataMap0 = get_avoid_hurt_time(),
	put_skill_extra_data(maps:put(Object, DataMap, DataMap0)).
put_avoid_hurt_time(Object, Target_prefix, Time) ->
	DataMap = get_avoid_hurt_time(Object),
	put_avoid_hurt_time(Object, maps:put(Target_prefix, Time, DataMap)).

reset_avoid_hurt_time() ->
	put_avoid_hurt_time(maps:new()).


get_change_config_skill() ->
	erlang:get(change_config_skill).
get_change_config_skill(Object) ->
	maps:get(Object, get_change_config_skill(), maps:new()).
get_change_config_skill(Object,Skill_ID) ->
	maps:get(Skill_ID, get_change_config_skill(Object), false).

put_change_config_skill(DataMap) ->
	erlang:put(change_config_skill, DataMap).
put_change_config_skill(Object, DataMap) ->
	DataMap0 = get_change_config_skill(),
	put_change_config_skill(maps:put(Object, DataMap, DataMap0)).
put_change_config_skill(Object,Skill_ID,ConfigList) ->
	DataMap = get_change_config_skill(Object),
	put_change_config_skill(Object, maps:put(Skill_ID, ConfigList, DataMap)).

reset_change_config_skill() ->
	put_change_config_skill(maps:new()).


get_change_buff() ->
	erlang:get(change_buff).
get_change_buff(Target) ->
	maps:get(Target, get_change_buff(), maps:new()).
get_change_buff(Target,Buff_ID) ->
	maps:get(Buff_ID, get_change_buff(Target), false).

put_change_buff(DataMap) ->
	erlang:put(change_buff, DataMap).
put_change_buff(Target, DataMap) ->
	DataMap0 = get_change_buff(),
	put_change_buff(maps:put(Target, DataMap, DataMap0)).
put_change_buff(Target,Buff_ID,New_Buff_ID) ->
	DataMap = get_change_buff(Target),
	put_change_buff(Target, maps:put(Buff_ID, New_Buff_ID, DataMap)).

reset_change_buff() ->
	put_change_buff(maps:new()).

