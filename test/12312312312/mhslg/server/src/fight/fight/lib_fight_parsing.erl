%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_fight_parsing.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_fight_parsing).
-include("common.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10102.hrl").

-compile(export_all).

%%get_proto_msg() ->
%%	erlang:get(fight_msg).
%%put_proto_msg(Msg) ->
%%	erlang:put(fight_msg, Msg).
%%reset_proto_msg() ->
%%	put_proto_msg(#'Proto80102002'{}).
%%parsing_proto_msg() ->
%%	CombatQueue = lib_fight_data:get_combat_queue(),
%%	put_proto_msg(#'Proto80102002'{
%%		combat_id = CombatQueue#combat_queue_detail.combat_id,
%%		type = CombatQueue#combat_queue_detail.type,
%%		country = CombatQueue#combat_queue_detail.country,
%%		l_country = CombatQueue#combat_queue_detail.l_country,
%%		r_country = CombatQueue#combat_queue_detail.r_country,
%%		fight_process = []
%%	}).

get_proto_fight_detail() ->
	erlang:get(proto_fight_detail).
put_proto_fight_detail(ProtoFightList) ->
	erlang:put(proto_fight_detail, ProtoFightList).
reset_proto_fight_detail() ->
	put_proto_fight_detail(#'ProtoFightDetail'{}).
parsing_proto_fight_detail() ->
	put_proto_fight_detail(#'ProtoFightDetail'{
		combat_times = lib_fight_data:get_combat_times(),
		l_size = erlang:length(lib_fight_data:get_fighters(?FIGHTER_TYPE_L)),
		r_size = erlang:length(lib_fight_data:get_fighters(?FIGHTER_TYPE_R)),
		l_fighters = fighters_to_proto(lib_fight_data:get_fighters(?FIGHTER_TYPE_L)),
		r_fighters = fighters_to_proto(lib_fight_data:get_fighters(?FIGHTER_TYPE_R)),
		fight = []
	}).

get_proto_fight() ->
	erlang:get(proto_fight).
put_proto_fight(ProtoFight) ->
	erlang:put(proto_fight, ProtoFight).
reset_proto_fight() ->
	put_proto_fight(#'ProtoFight'{}).
push_proto_fight() ->
	Proto = get_proto_fight_detail(),
	ProtoFight = get_proto_fight(),
	put_proto_fight_detail(Proto#'ProtoFightDetail'{
		fight = lists:append(Proto#'ProtoFightDetail'.fight, [ProtoFight])
	}).
parsing_proto_fight() ->
	{A,B} = lib_fight_data:get_cur_round(),
	put_proto_fight(#'ProtoFight'{
		phase = A,
		round = B,
		l_fighter = fighter_to_proto(lib_fight_data:get_fighter(?FIGHTER_TYPE_L)),
		r_fighter = fighter_to_proto(lib_fight_data:get_fighter(?FIGHTER_TYPE_R)),
		process = []
	}).

push_proto_effect(FightEffect) ->
	Proto = get_proto_fight(),
	put_proto_fight(Proto#'ProtoFight'{
		process = lists:append(Proto#'ProtoFight'.process, [FightEffect])
	}).
parsing_proto_effect(FightData) ->
%%	Effect = #'ProtoFightEffect'{
%%		target_object = FightData#fight_data.target_object,
%%		target_prefix = [lib_types:to_binary(V) || V <- FightData#fight_data.target_prefix],
%%		value = FightData#fight_data.hurt
%%	},
%%	push_proto_effect(#'ProtoFightProcess'{
%%		skill_id = FightData#fight_data.skill_id,
%%		object = FightData#fight_data.object,
%%		prefix = lib_types:to_binary(FightData#fight_data.prefix),
%%		attack_type = FightData#fight_data.attack_type,
%%		effect = Effect
%%	}).
	SkillFlag = lib_fight_api:get_skill_flag(FightData#fight_data.object),
	Flag = case SkillFlag =:= 1 andalso lib_fight_config:is_active_skill(FightData#fight_data.skill_id) of
			   true -> lib_fight_api:update_skill_flag(FightData#fight_data.object,0),SkillFlag;
			   false-> 0
		   end,
	Hero_list = case  FightData#fight_data.skill_id =:= 0 orelse FightData#fight_data.type =/= ?CLIENT_EFFECT_TYPE1 of
					true -> ?INFO("skill = 0, FightData ~p",[FightData]),[];
					false-> lib_fight_api:get_skill_hero_list(FightData#fight_data.object,FightData#fight_data.skill_id)
				end,
	push_proto_effect(#'ProtoFightEffect'{
		type = FightData#fight_data.type,
		effect_type = FightData#fight_data.effect_type,
		skill_id = FightData#fight_data.skill_id,
		object = FightData#fight_data.object,
		prefix = lib_types:to_binary(FightData#fight_data.prefix),
		target_object = FightData#fight_data.target_object,
		target_prefix = [lib_types:to_binary(V) || V <- FightData#fight_data.target_prefix],
		value = FightData#fight_data.value,
		extra_value = FightData#fight_data.extra_value,
		value_list = FightData#fight_data.value_list,
		attack_type_list = FightData#fight_data.attack_type_list,
		attack_type = FightData#fight_data.attack_type,
		condition = FightData#fight_data.condition,
		condition_str = lib_types:to_binary(FightData#fight_data.condition_str),
		condition_value = FightData#fight_data.condition_value,
		flag = Flag,
		former_troops = lib_fight_api:former_troops(FightData#fight_data.target_object),
		latter_troops = lib_fight_api:latter_troops(FightData#fight_data.target_object),
		hero_list = Hero_list
	}).


fighters_to_proto(Fighters) ->
	lists:foldr(fun(Fighter, Acc) ->
		[fighter_to_proto(Fighter) | Acc]
	end, [], lists:sublist(Fighters, 6)).

fighter_to_proto(Fighter) ->
	#'ProtoFightHero'{
		id = Fighter#combat_hero.id,
		name = Fighter#combat_hero.name,
		is_robot = Fighter#combat_hero.is_robot,
		robot_base_id = Fighter#combat_hero.robot_base_id,
		win_times = Fighter#combat_hero.win_times,
		country = Fighter#combat_hero.country,
		office = Fighter#combat_hero.office,
		honor_title = Fighter#combat_hero.hero_title,
		formation = Fighter#combat_hero.formation,
		former = army_to_proto(Fighter#combat_hero.former),
		latter = army_to_proto(Fighter#combat_hero.latter),
		four_d = lib_fight_api:get_4d_list(lib_fight_prop:increase_prop([Fighter#combat_hero.fight_prop3,
			Fighter#combat_hero.fight_prop2, Fighter#combat_hero.fight_prop1, Fighter#combat_hero.prop_dict])),
		hero_base = lib_hero_api:hero_base_to_proto(lib_combat_queue_api:combat_hero_to_hero_base(Fighter))
	}.

army_to_proto(Army) ->
	#'ProtoArmyBase'{
		type = Army#combat_army.type,
		level = Army#combat_army.level,
		attack = Army#combat_army.attack,
		defence = Army#combat_army.defence,
		speed = Army#combat_army.speed,
		troops = Army#combat_army.troops,
		cur_troops = Army#combat_army.cur_troops
	}.