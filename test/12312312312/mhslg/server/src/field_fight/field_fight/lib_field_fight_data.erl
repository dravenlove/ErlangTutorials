%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 9月 2021 20:25
%%%-------------------------------------------------------------------
-module(lib_field_fight_data).
-author("df").
-include("common.hrl").
-include("field_combat_queue.hrl").
-include("combat_queue.hrl").
-include("fight_prop.hrl").
-include("fight_buff.hrl").
-include("fight.hrl").

-define(SKILL_LUNCH,			skill_lunch).
-define(LAST_SKILL_HURT, 		last_skill_hurt).
-define(BUFF_MAP,		 		buff_map).
-define(SKILL_ACTIVE_TIMES,		skill_active_times).
-define(BE_HURT_TIME,			be_hurt_time).
-define(SKILL_EXTRA_DATA,		skill_extra_data).
-define(AVOID_HURT_TIME,		avoid_hurt_time).
-define(CHANGE_CONFIG_SKILL,	change_config_skill).
-define(CHANGE_BUFF,			change_buff).

-export([
	get_field_combat_hero/1,
	put_field_combat_hero/2,
	get_field_combat_heros/1,

	get_skill_lunch_map/1,
	update_skill_lunch_map/3,
	delete_skill_lunch/2,
	erase_skill_lunch_map/1,

	get_army/2,
	put_army/3,
	get_fighter_prop/1,
	get_fighter_force/1,
	get_fighter_skill_list/1,
	get_former/1,
	get_latter/1,

	init_last_hurt/1,
	get_last_hurt/2,
	put_last_hurt/3,
	erase_last_hurt/1,

	init_buff_map/1,
	get_buff_map/2,
	put_buff_map/3,
	erase_buff_map/1,

	add_attack_times/2,
	add_active_attack_times/2,
	attack_times/2,
	active_attack_times/2,

	get_skill_prefix/1,
	get_prefix/0,
	put_prefix/2,

	get_skill_active_times/2,
	add_skill_active_times/2,
	init_skill_active_times/1,
	erase_skill_active_times/1,

	add_be_hurt_times/1,
	init_be_hurt_times/1,
	erase_be_hurt_times/1,

	get_skill_extra_data/2,
	put_skill_extra_data/3,
	init_skill_extra_data/1,
	erase_skill_extra_data/1,

	get_avoid_hurt_time/2,
	put_avoid_hurt_time/3,
	init_avoid_hurt_time/1,
	erase_avoid_hurt_time/1,

	get_change_config_skill/2,
	put_change_config_skill/3,
	init_change_config_skill/1,
	erase_change_config_skill/1,

	get_change_buff/2,
	put_change_buff/3,
	init_change_buff/1,
	erase_change_buff/1,

	get_distance_map/1,
	put_distance_map/2,
	put_distance_map/3,
	init_distance_map/1,

	add_prop3/4,			%% 增加时效属性
	clean_prop3/1,			%% 清除时效属性
	add_prop2/3,			%% 增加技能属性
	init_prop2/1,			%% 清空技能属性
	add_prop1/3,			%% 增加属性（作用于整场战斗） 可配负值
	init_prop1/1,
	get_prop/1,
	get_player_heros/1
]).

to_atom(Unit_id,Key) ->
	lib_types:to_atom(lib_types:to_list(Key) ++ lib_types:to_list(Unit_id)).

get_map_hero() ->
	erlang:get(map_hero).
put_map_hero(MapHero) ->
	erlang:put(map_hero, MapHero).

get_field_combat_hero(Unit_id) ->
	MapHero = get_map_hero(),
	maps:get(Unit_id,MapHero).
put_field_combat_hero(Unit_id, Data) when is_record(Data, field_combat_hero)->
	MapHero = get_map_hero(),
	New = maps:put(Unit_id,Data,MapHero),
	put_map_hero(New).

get_field_combat_heros(Unit_id) ->
	MapHero = get_map_hero(),
	PlayerId = lib_field_fight_api:unit_id_to_player(Unit_id),
	maps:fold(fun(_Key,Value,List) ->
		case Value#field_combat_hero.id =:= PlayerId of
			true -> [Value|List];
			false-> List
		end
	end,[],MapHero)
.

get_skill_lunch_map(Unit_id) ->
	erlang:get(to_atom(Unit_id,?SKILL_LUNCH)).
put_skill_lunch_map(Unit_id,Map) ->
	erlang:put(to_atom(Unit_id,?SKILL_LUNCH),Map).
update_skill_lunch_map(Unit_id,SkillId,Release_tick) ->
	Map = get_skill_lunch_map(Unit_id),
	put_skill_lunch_map(Unit_id,maps:put(SkillId,Release_tick,Map)).
delete_skill_lunch(Unit_id,SkillId) ->
	Map = get_skill_lunch_map(Unit_id),
	put_skill_lunch_map(Unit_id,maps:remove(SkillId,Map)).
erase_skill_lunch_map(Unit_id) ->
	erase(to_atom(Unit_id,?SKILL_LUNCH)).


get_army(Unit_id, Prefix) ->
	Data = get_field_combat_hero(Unit_id),
	case Prefix of
		?PROP_PREFIX_FORMER -> Data#field_combat_hero.former;
		?PROP_PREFIX_LATTER -> Data#field_combat_hero.latter;
		_ -> #field_combat_hero{}
	end.
put_army(Unit_id, Prefix, Army) ->
	Data = get_field_combat_hero(Unit_id),
	NewData =
		case Prefix of
			?PROP_PREFIX_FORMER -> Data#field_combat_hero{former = Army};
			?PROP_PREFIX_LATTER -> Data#field_combat_hero{latter = Army}
		end,
	put_field_combat_hero(Unit_id, NewData).

get_fighter_prop(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	%% 把预估小的prop_dict放前面
	PropDict = lib_fight_prop:increase_prop([Data#field_combat_hero.fight_prop3, Data#field_combat_hero.fight_prop2,
		Data#field_combat_hero.fight_prop1, Data#field_combat_hero.prop_dict]),
	lib_fight_prop:statistics_prop_dict(Data#field_combat_hero.prop_base, PropDict).
get_fighter_force(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero.hero_force.
get_fighter_skill_list(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero.skill_list.
get_former(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero.former.
get_latter(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero.latter.

init_last_hurt(Unit_id) ->
	put_last_hurt(Unit_id, maps:new()).
get_last_hurt(Unit_id) ->
	erlang:get(to_atom(Unit_id,?LAST_SKILL_HURT)).
get_last_hurt(Unit_id, SkillGroup) ->
	Maps = get_last_hurt(Unit_id),
	maps:get(SkillGroup, Maps, 0).
put_last_hurt(Unit_id, Maps) ->
	erlang:put(to_atom(Unit_id,?LAST_SKILL_HURT), Maps).
put_last_hurt(Unit_id, SkillGroup, Hurt) ->
	Maps = get_last_hurt(Unit_id),
	put_last_hurt(Unit_id, maps:put(SkillGroup, Hurt, Maps)).
erase_last_hurt(Unit_id) ->
	erase(to_atom(Unit_id,?LAST_SKILL_HURT)).

buff_map_atom(Unit_id, Prefix) ->
	lib_types:to_atom(lib_types:to_list(?BUFF_MAP) ++ lib_types:to_list(Unit_id) ++ lib_types:to_list(Prefix)).
init_buff_map(Unit_id) ->
	lists:foreach(fun(Prefix) -> lib_fight_data:put_buff_map(Unit_id, Prefix, maps:new()) end, ?PREFIX_LIST).
get_buff_map(Unit_id, Prefix) ->
	erlang:get(buff_map_atom(Unit_id, Prefix)).
put_buff_map(Unit_id, Prefix, BuffMap) ->
	erlang:put(buff_map_atom(Unit_id, Prefix), BuffMap).
erase_buff_map(Unit_id) ->
	lists:foreach(fun(Prefix) -> erase(buff_map_atom(Unit_id, Prefix)) end, ?PREFIX_LIST).

add_attack_times(Unit_id, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Data = get_field_combat_hero(Unit_id),
			put_field_combat_hero(Unit_id, Data#combat_hero{attack_times = Data#combat_hero.attack_times});
		_ ->
			Army = get_army(Unit_id, Prefix),
			put_army(Unit_id, Prefix, Army#combat_army{attack_times = Army#combat_army.attack_times + 1})
	end.

add_active_attack_times(Unit_id, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Data = get_field_combat_hero(Unit_id),
			put_field_combat_hero(Unit_id, Data#combat_hero{active_attack_times = Data#combat_hero.active_attack_times});
		_ ->
			Army = get_army(Unit_id, Prefix),
			put_army(Unit_id, Prefix, Army#combat_army{active_attack_times = Army#combat_army.active_attack_times + 1})
	end.

attack_times(Unit_id, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Data = get_field_combat_hero(Unit_id),
			Data#combat_hero.attack_times;
		_ ->
			Army = get_army(Unit_id, Prefix),
			Army#combat_army.attack_times
	end.
active_attack_times(Unit_id, Prefix) ->
	case Prefix of
		?PROP_PREFIX_HERO ->
			Data = get_field_combat_hero(Unit_id),
			Data#combat_hero.active_attack_times;
		_ ->
			Army = get_army(Unit_id, Prefix),
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

get_skill_active_times(Unit_id) ->
	Dict = erlang:get(to_atom(Unit_id,?SKILL_ACTIVE_TIMES)),
	case Dict of undefined -> dict:new(); _ -> Dict end.
get_skill_active_times(Unit_id, SkillId) ->
	Dict = get_skill_active_times(Unit_id),
	?DICT_FETCH(SkillId, Dict, 0).
put_skill_active_times(Unit_id, Dict) ->
	erlang:put(to_atom(Unit_id,?SKILL_ACTIVE_TIMES), Dict).
add_skill_active_times(Unit_id, SkillId) ->
	Dict = get_skill_active_times(Unit_id),
	OldTimes = ?DICT_FETCH(SkillId, Dict, 0),
	NewDict = dict:store(SkillId, OldTimes + 1, Dict),
	put_skill_active_times(Unit_id, NewDict).
init_skill_active_times(Unit_id) ->
	put_skill_active_times(Unit_id, dict:new()).
erase_skill_active_times(Unit_id) ->
	erase(to_atom(Unit_id,?SKILL_ACTIVE_TIMES)).

get_be_hurt_times(Unit_id) ->
	erlang:get(to_atom(Unit_id,?BE_HURT_TIME)).
put_be_hurt_times(Unit_id, Times) ->
	erlang:put(to_atom(Unit_id,?BE_HURT_TIME), Times).
add_be_hurt_times(Unit_id) ->
	put_be_hurt_times(Unit_id, get_be_hurt_times(Unit_id) + 1).
init_be_hurt_times(Unit_id) ->
	put_be_hurt_times(Unit_id, 0).
erase_be_hurt_times(Unit_id) ->
	erase(to_atom(Unit_id,?BE_HURT_TIME)).

get_skill_extra_data(Unit_id) ->
	erlang:get(to_atom(Unit_id,?SKILL_EXTRA_DATA)).
get_skill_extra_data(Unit_id, SkillId) ->
	maps:get(SkillId, get_skill_extra_data(Unit_id), false).
put_skill_extra_data(Unit_id, DataMap) ->
	erlang:put(to_atom(Unit_id,?SKILL_EXTRA_DATA), DataMap).
put_skill_extra_data(Unit_id, SkillId, Data) ->
	DataMap = get_skill_extra_data(Unit_id),
	put_skill_extra_data(Unit_id, maps:put(SkillId, Data, DataMap)).
init_skill_extra_data(Unit_id) ->
	put_skill_extra_data(Unit_id,maps:new()).
erase_skill_extra_data(Unit_id) ->
	erase(to_atom(Unit_id,?SKILL_EXTRA_DATA)).

get_avoid_hurt_time(Unit_id) ->
	erlang:get(to_atom(Unit_id,?AVOID_HURT_TIME)).
get_avoid_hurt_time(Unit_id, Target_prefix) ->
	maps:get(Target_prefix, get_avoid_hurt_time(Unit_id), 0).
put_avoid_hurt_time(Unit_id, DataMap) ->
	erlang:put(to_atom(Unit_id,?AVOID_HURT_TIME), DataMap).
put_avoid_hurt_time(Unit_id, Target_prefix, Time) ->
	DataMap = get_avoid_hurt_time(Unit_id),
	put_avoid_hurt_time(Unit_id, maps:put(Target_prefix, Time, DataMap)).
init_avoid_hurt_time(Unit_id) ->
	put_avoid_hurt_time(Unit_id,maps:new()).
erase_avoid_hurt_time(Unit_id) ->
	erase(to_atom(Unit_id,?AVOID_HURT_TIME)).

get_change_config_skill(Unit_id) ->
	erlang:get(to_atom(Unit_id,?CHANGE_CONFIG_SKILL)).
get_change_config_skill(Unit_id,Skill_ID) ->
	maps:get(Skill_ID, get_change_config_skill(Unit_id), false).
put_change_config_skill(Unit_id,DataMap) ->
	erlang:put(to_atom(Unit_id,?CHANGE_CONFIG_SKILL), DataMap).
put_change_config_skill(Unit_id,Skill_ID,ConfigList) ->
	DataMap = get_change_config_skill(Unit_id),
	put_change_config_skill(Unit_id, maps:put(Skill_ID, ConfigList, DataMap)).
init_change_config_skill(Unit_id) ->
	put_change_config_skill(Unit_id,maps:new()).
erase_change_config_skill(Unit_id) ->
	erase(to_atom(Unit_id,?CHANGE_CONFIG_SKILL)).

get_change_buff(Unit_id) ->
	erlang:get(to_atom(Unit_id,?CHANGE_BUFF)).
get_change_buff(Unit_id,Buff_ID) ->
	maps:get(Buff_ID, get_change_buff(Unit_id), false).
put_change_buff(Unit_id,DataMap) ->
	erlang:put(to_atom(Unit_id,?CHANGE_BUFF), DataMap).
put_change_buff(Unit_id,Buff_ID,New_Buff_ID) ->
	DataMap = get_change_buff(Unit_id),
	put_change_buff(Unit_id, maps:put(Buff_ID, New_Buff_ID, DataMap)).
init_change_buff(Unit_id) ->
	put_change_buff(Unit_id,maps:new()).
erase_change_buff(Unit_id) ->
	erase(to_atom(Unit_id,?CHANGE_BUFF)).

get_distance_map(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero.distance_map.
put_distance_map(Unit_id,Map) ->
	Data = get_field_combat_hero(Unit_id),
	put_field_combat_hero(Unit_id, Data#field_combat_hero{distance_map = Map}).
put_distance_map(Unit_id,Key,Value) ->
	Map = get_distance_map(Unit_id),
	NewMap = maps:put(Key,Value,Map),
	put_distance_map(Unit_id,NewMap).
init_distance_map(Unit_id) ->
	put_distance_map(Unit_id,maps:new()).


add_prop3(Unit_id, Name, Value, End_tick) ->
	Data = get_field_combat_hero(Unit_id),
	Fight_prop = Data#field_combat_hero.fight_prop3,
	NewMap = case maps:is_key(End_tick,Fight_prop) of
				 true -> NewDict = lib_fight_prop:add_prop(Name, Value, maps:get(End_tick,Fight_prop)),
					 maps:put(End_tick,NewDict,Fight_prop);
				 false-> maps:put(End_tick,lib_fight_prop:add_prop(Name, Value,dict:new()),Fight_prop)
			 end,
	Data#field_combat_hero{fight_prop3 = NewMap}.
clean_prop3(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Tick = lib_timer:unixtime_ms(),
	Fight_prop = Data#field_combat_hero.fight_prop3,
	NewMap = maps:fold(fun(K,V,M) ->
		case K > Tick of
			true -> maps:put(K,V,M);
			false-> M
		end
	end,maps:new(),Fight_prop),
	Data#field_combat_hero{fight_prop3 = NewMap}.
add_prop2(Unit_id, Name, Value) ->
	Data = get_field_combat_hero(Unit_id),
	Fight_prop = lib_fight_prop:add_prop(Name, Value,Data#field_combat_hero.fight_prop2),
	Data#field_combat_hero{fight_prop2 = Fight_prop}.
init_prop2(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero{fight_prop2 = dict:new()}.
add_prop1(Unit_id, Name, Value) ->
	Data = get_field_combat_hero(Unit_id),
	Fight_prop =  lib_fight_prop:add_prop(Name, Value,Data#field_combat_hero.fight_prop1),
	Data#field_combat_hero{fight_prop1 = Fight_prop}.
init_prop1(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	Data#field_combat_hero{fight_prop1 = dict:new()}.
get_prop(Unit_id) ->
	Data = get_field_combat_hero(Unit_id),
	clean_prop3(Unit_id),
	%% 把预估小的prop_dict放前面
	Fight_prop3 = maps:fold(fun(_Key,PropDict,Dict) ->
		lib_fight_prop:merge_prop(PropDict, Dict)
	end,dict:new(),Data#field_combat_hero.fight_prop3),
	PropDict = lib_fight_prop:increase_prop([Fight_prop3, Data#field_combat_hero.fight_prop2,
		Data#field_combat_hero.fight_prop1, Data#field_combat_hero.prop_dict]),
	lib_fight_prop:statistics_prop_dict(Data#field_combat_hero.prop_base, PropDict).



get_player_heros(Unit_id) ->
	Conf_Distance = maps:get(value,tb_const:get(trigger_hero_distance)),
	MyData = lib_field_fight_data:get_field_combat_hero(Unit_id),
	maps:fold(fun(Target_Unit_id,Distance,L) ->
		TargetData = lib_field_fight_data:get_field_combat_hero(Target_Unit_id),
		case Conf_Distance =< Distance andalso MyData#field_combat_hero.id =:= TargetData#field_combat_hero.id of
			true -> case TargetData#field_combat_hero.is_robot of true -> [TargetData#field_combat_hero.robot_base_id|L]; false -> [TargetData#field_combat_hero.hero_id|L]  end;
			false-> L
		end
	end,[],lib_field_fight_data:get_distance_map(Unit_id))
.
