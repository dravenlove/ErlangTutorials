%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 17. Mar 2021 4:40 PM
%%%-------------------------------------------------------------------
-module(lib_city_defense_api).
-author("lichaoyu").
-include("common.hrl").
-include("fight.hrl").
-include("hero.hrl").
-include("troops.hrl").
-include("chat.hrl").
-include("player.hrl").
-include("map.hrl").
-include("combat_queue.hrl").

%% API
-export([
	guard_level/1,			%% 城池城防军等级
	pass_city/2,
	callback/1,
	refresh_guard/0
]).

guard_num(CityId) ->
	case tb_city_defense:get(CityId) of
		false -> 0;
		Conf -> maps:get(num, Conf) + lib_map_api:building_prop(?CITY_EFFECT_1, CityId)
	end
.

guard_recover(CityId) ->
	guard_recover() + lib_map_api:building_prop(?CITY_EFFECT_12, CityId)
.
guard_recover() ->
	lists:last(maps:get(jsonvalue, tb_const:get(every_time_recover_guard)))
.

guard_level(CityId) ->
	case tb_city_defense:get(CityId) of
		false -> 0;
		Conf ->
			Season = lib_season_and_days_api:get_season(),
			LevelList = [maps:get(level, Conf) | maps:get(limit, Conf)],
			Base = lists:nth(Season + 1, LevelList),
			Limit = lists:nth(Season + 2, LevelList),
			#{day := Day, every := Every, up := Up} = tb_guard_level:get(Season),
			Calc = ((lib_season_and_days_api:get_season_day() - Day) div Every) * Up + Base,
			case Limit < Calc of true -> Limit;false -> Calc end
	end
.
guard_senior(Country, CityId) ->
	case lib_map_api:capital_building_prop(?CITY_EFFECT_8, Country) of
		0 -> 0;
		Level ->
			CityIdList = lists:nth(Level, maps:get(jsonvalue, tb_building_const:get(Country))),
			case lists:member(CityId, CityIdList) of
				true -> maps:get(value, tb_building_const:get(guard_upgrade_probability));
				false -> 0
			end
	end + maps:get(value, tb_building_const:get(general))
.
guard_elite(CityId) ->
	lib_map_api:building_prop(?CITY_EFFECT_10, CityId) + maps:get(value, tb_building_const:get(elite))
.
type_random(Num) ->
	type_random(Num, [])
.
type_random(0, L) -> L;
type_random(N, L) ->
	type_random(N - 1, [rand:uniform(100) | L])
.

refresh_guard() ->
	AllCity = lib_map_api:all_city(),
	lib_map:put_map(dict:map(
		fun(CityId, City) ->
			#city{
				country = Country,
				guard_num = GuardNum
			} = City,
			LackNum = guard_num(CityId) - ?GUARD_NUM(GuardNum),
			case lists:member(Country, lib_map_api:player_country()) andalso LackNum > 0 of
				false -> City;
				true ->
					RecoverNum = guard_recover(CityId),
					Num = case RecoverNum > LackNum of true -> LackNum; false -> RecoverNum end,
					Senior = guard_senior(Country, CityId),
					Elite = guard_elite(CityId),
					General = 100 - Senior - Elite,
					NewGuardNum = lists:foldl(
						fun(Random, M) ->
							Type = lib_equip_api:choose_one([General, Elite, Senior], Random, 1),
							maps:put(Type, maps:get(Type, M, 0) + 1, M)
						end, GuardNum, type_random(Num)),
					City#city{guard_num = NewGuardNum}
			end
		end, AllCity))
.

pass_city(Troops, CityId) ->
	#troops{
		troops_id = TroopsId,
		combat_hero = #combat_hero{country = Country} = CombatHero
	} = Troops,
	#city{
		country = CityCountry,
		fighting = Fighting,
		guard_num = GuardNum,
		defend_troops = DefendTroops
	} = lib_map_api:city(CityId),
	{Label, NewTroops} =
		if
			Fighting =/= ?FIGHTING_NO ->
				?DEBUG("join combat: ~p", [TroopsId]),
				case Country =:= CityCountry of
					true -> lib_map_api:a_defend_troops(TroopsId, CityId);
					false -> lib_map_api:a_attack_troops(TroopsId, CityId)
				end,
				lib_combat_queue_api:join_combat_queue(Fighting, CombatHero),
				lib_map:add_notice_country_war(Fighting, CombatHero#combat_hero.id),
				{join, Troops#troops{state = ?TROOPS_FIGHTING, city_id = CityId}};
			Country =/= CityCountry ->
				DefendTroopsList = lib_troops_api:troops(DefendTroops),
				CombatHeroList = [X#troops.combat_hero || X <- DefendTroopsList],
				TroopsList = [X#troops{state = ?TROOPS_FIGHTING} || X <- DefendTroopsList],
				Level = guard_level(CityId),
				{GuardCombatHeroList, GuardList} = maps:fold(
					fun(Type, N, {L1, L2})->
						G = lists:duplicate(N, Type),
						{guard_robot_list(Country, Type, Level, N) ++ L1, G ++ L2}
					end, {[], []}, GuardNum),
				CombatId = start_country_war(CityId, Country, [CombatHero], CityCountry, CombatHeroList ++ GuardCombatHeroList),
				lib_map:add_notice_country_war(CombatId, CombatHero#combat_hero.id),
				[lib_map:add_notice_country_war(CombatId, Id div 1000) || Id <- DefendTroops],
				lib_map_api:u_city_attack(CityId, CombatId, DefendTroops ++ GuardList, Country, [TroopsId]),
				{start, [Troops#troops{state = ?TROOPS_FIGHTING, city_id = CityId} | TroopsList]};
			true ->
				case lists:last(maps:get(city_lists, Troops#troops.march)) =:= CityId of
					true ->
						lib_map_api:a_defend_troops(TroopsId, CityId),
						lib_map:arrive(Troops#troops.city_id, TroopsId),
						{arrive, Troops#troops{state = ?TROOPS_FREE, city_id = CityId}};
					false -> {pass, Troops#troops{city_id = CityId}}
				end
		end,
	lib_troops_api:u_troops(NewTroops),
	Label
.

start_country_war(CityId, LCountry, LFighters, RCountry, RFighters) ->
	lib_combat_queue_api:async_cast_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_COUNTRY,
		params = {?CALL_FIGHT_TYPE_COUNTRY, CityId, LCountry, RCountry},
		l_fighters = LFighters,
		l_country = LCountry,
		l_buff_list = lib_country_war_task:country_buff(LCountry),
		r_fighters = RFighters,
		r_country = RCountry,
		r_buff_list = lib_country_war_task:country_buff(RCountry)
	})
.

%%
%% 混沌傀儡
%% 异族入侵
callback(CombatCallBack) ->
	Params = CombatCallBack#combat_callback.params,
	CallBackData = CombatCallBack#combat_callback.callback_data,
	case CombatCallBack#combat_callback.callback_type of
		?COMBAT_QUEUE_CALLBACK_TYPE0 -> callback0(Params, CallBackData);
		?COMBAT_QUEUE_CALLBACK_TYPE1 -> callback1(Params, CallBackData);
		?COMBAT_QUEUE_CALLBACK_TYPE2 -> callback2(Params, CallBackData);
		?COMBAT_QUEUE_CALLBACK_TYPE3 -> callback3(Params, CombatCallBack);
		?COMBAT_QUEUE_CALLBACK_TYPE4 -> callback4(Params, CallBackData);
		?COMBAT_QUEUE_CALLBACK_TYPE5 -> callback5(Params, CallBackData)
	end
.

callback0({?CALL_FIGHT_TYPE_BOUNTY, PlayerId, ClearingId}, CallBackData) ->
	case lib_player:get_pid(PlayerId) of
		undefined -> ok;
		Pid -> mod_server:async_apply(Pid, fun lib_player_bounty_mission:respond_bounty_mission_fight/2, [ClearingId, CallBackData])
	end,
	fight_result_list(CallBackData#callback_data0.fight_result)
;
callback0({?CALL_FIGHT_TYPE_INDUSTRY, PlayerId, CityId}, CallBackData) ->
	case lib_player:get_pid(PlayerId) of
		undefined -> ok;
		Pid -> mod_server:async_apply(Pid, fun lib_player_city_industry:respond_city_industry_hold/2, [CityId, CallBackData])
	end,
	fight_result_list(CallBackData#callback_data0.fight_result)
;
callback0({?CALL_FIGHT_TYPE_GOVERNMENT_TASK, PlayerId, TaskId}, CallBackData) ->
	case lib_player:get_pid(PlayerId) of
		undefined -> ok;
		Pid -> mod_server:async_apply(Pid, fun lib_player_government_task:respond_challenge_government_task/2, [TaskId, CallBackData])
	end,
	fight_result_list(CallBackData#callback_data0.fight_result)
;
callback0({?CALL_FIGHT_TYPE_PUPPET, PlayerId, CityId}, CallBackData) ->
	case lib_player:get_pid(PlayerId) of
		undefined -> ok;
		Pid -> mod_server:async_apply(Pid, fun lib_player_puppet:respond_puppet_challenge/2, [CityId, CallBackData])
	end,
	fight_result_list(CallBackData#callback_data0.fight_result)
;
callback0(_Params, _CallBackData) ->
	ok
.

callback1(_Params, _CallBackData) ->
	ok
.

callback2({?CALL_FIGHT_TYPE_COUNTRY, CityId, _LCountry, _RCountry}, CallBackData) ->
	FightResult = CallBackData#callback_data2.fight_result,
	Args1 = u_fight_troops(attack, FightResult#fight_result.l_wastage, CityId),
	Args2 = u_fight_troops(defend, FightResult#fight_result.r_wastage, CityId),
	send_award(Args1, Args2)
;
callback2({?CALL_FIGHT_TYPE_ALIEN_INVASION, PlayerId, ClearingId}, CallBackData) ->
	case lib_player:get_pid(PlayerId) of
		undefined -> lib_map:add_notice_alien_invasion(PlayerId, {ClearingId, CallBackData});
		Pid -> mod_server:async_apply(Pid, fun lib_player_alien_invasion:respond_alien_invasion_fight/2, [ClearingId, CallBackData])
	end,
	FightResult = CallBackData#callback_data2.fight_result,
	LWastage = FightResult#fight_result.l_wastage,
	CombatHero = LWastage#fight_wastage.fighter,
	TroopsId = PlayerId * 1000 + CombatHero#combat_hero.hero_id,
	Troops = (lib_troops_api:troops(TroopsId))#troops{combat_hero = CombatHero},
	NewTroops =
		case LWastage#fight_wastage.is_win of
			true -> Troops;
			false ->
				lib_map:del_callback_troops(FightResult#fight_result.combat_id, TroopsId),
				Troops#troops{state = ?TROOPS_FREE, city_id = ?COUNTRY_CAPITAL(CombatHero#combat_hero.country)}
		end,
	lib_troops_api:u_troops(NewTroops)
;
callback2(_Params, _CallBackData) ->
	ok
.

-define(BROAD_ID_ATTACK, 1021). %% 进攻成功广播
-define(BROAD_ID_DEFEND, 1022). %% 防守成功广播
callback3({?CALL_FIGHT_TYPE_COUNTRY, CityId, LCountry, RCountry}, CombatCallBack) ->
	CallBackData = CombatCallBack#combat_callback.callback_data,
	NewCity =
		case CallBackData#callback_data3.win_type of
			?FIGHTER_TYPE_R ->
				City = lib_map_api:city(CityId),
				send_broad(?BROAD_ID_DEFEND, RCountry, CityId),
				TroopsIdList = [X || X <- City#city.defend_troops, X > 10],
				TroopsList = lib_troops_api:troops(TroopsIdList),
				NewTroopsList = [X#troops{state = ?TROOPS_FREE} || X <- TroopsList],
				lib_troops_api:u_troops(NewTroopsList),
				lib_map:gain_notice_country_war(City#city.fighting),
				City#city{fighting = ?FIGHTING_NO, defend_troops = TroopsIdList, attack_country = 0};
			_ ->
				send_broad(?BROAD_ID_ATTACK, LCountry, CityId),
				lib_map:process_city_occupy(CityId, RCountry, LCountry),
				City = lib_map_api:city(CityId),
				TroopsList = lib_troops_api:troops(City#city.attack_troops),
				{DeFendTroops, AttackTroops} = lists:foldl(
					fun(AttackTroop, {L2, L3}) ->
						case AttackTroop#troops.combat_hero#combat_hero.country =:= LCountry of
							true -> {[AttackTroop | L2], L3};
							false -> {L2, [AttackTroop | L3]}
						end
					end, {[], []}, TroopsList),
				lib_map:gain_notice_country_war(City#city.fighting),
				case AttackTroops of
					[] ->
						NewTroopsList = [X#troops{state = ?TROOPS_FREE} || X <- DeFendTroops],
						lib_troops_api:u_troops(NewTroopsList),
						City#city{country = LCountry, fighting = ?FIGHTING_NO, defend_troops = City#city.attack_troops, attack_country = 0, attack_troops = [], occupy_tick = lib_timer:unixtime()};
					_ ->
						{AttackId, LCombatHero} = lists:foldl(
							fun(#troops{troops_id = TroopsId, combat_hero = CombatHero}, {L2, L3}) ->
								{[TroopsId | L2], [CombatHero | L3]}
							end, {[], []}, AttackTroops),
						[#combat_hero{country = NewLCountry} | _] = LCombatHero,
						{DeFendId, RCombatHero} = lists:foldl(
							fun(#troops{troops_id = TroopsId, combat_hero = CombatHero}, {L2, L3}) ->
								{[TroopsId | L2], [CombatHero | L3]}
							end, {[], []}, DeFendTroops),
						NewRCountry = City#city.attack_country,
						CombatId = start_country_war(CityId, NewLCountry, LCombatHero, NewRCountry, RCombatHero),
						[lib_map:add_notice_country_war(CombatId, X#combat_hero.id) || X <- LCombatHero],
						[lib_map:add_notice_country_war(CombatId, X#combat_hero.id) || X <- RCombatHero],
						City#city{country = NewRCountry, fighting = CombatId, defend_troops = DeFendId, attack_country = NewLCountry, attack_troops = AttackId, occupy_tick = lib_timer:unixtime()}
				end
		end,
	lib_map_api:u_city(NewCity)
;
callback3({?CALL_FIGHT_TYPE_ALIEN_INVASION, PlayerId, ClearingId}, CombatCallBack) ->
	case lib_player:get_pid(PlayerId) of
		undefined -> lib_map:add_notice_alien_invasion(PlayerId, {ClearingId, CombatCallBack});
		Pid -> mod_server:async_apply(Pid, fun lib_player_alien_invasion:respond_alien_invasion_fight/2, [ClearingId, CombatCallBack])
	end,
	CombatId = CombatCallBack#combat_callback.combat_id,
	TroopsIdList = lib_map:gain_callback_troops(CombatId),
	TroopsList = lib_troops_api:troops(TroopsIdList),
	NewTroopsList = lists:foldl(
		fun(Troops, List) ->
			CityId = Troops#troops.city_id,
			lib_map_api:a_defend_troops(Troops#troops.troops_id, CityId),
			[case lib_map_api:fighting(CityId) of
				?FIGHTING_NO -> Troops#troops{state = ?TROOPS_FREE};
				CountryCombatId ->
					CombatHero = Troops#troops.combat_hero,
					lib_combat_queue_api:join_combat_queue(CountryCombatId, CombatHero),
					lib_map:add_notice_country_war(CountryCombatId, CombatHero#combat_hero.id),
					Troops#troops{state = ?TROOPS_FIGHTING, city_id = CityId}
			end | List]
		end, [], TroopsList),
	lib_troops_api:u_troops(NewTroopsList)
;
callback3(_Params, _CallBackData) ->
	ok
.

callback4(_Params, _CallBackData) ->
	ok
.

callback5(_Params, _CallBackData) ->
	ok
.

fight_result_list(FightResultList) ->
	fight_result_list(FightResultList, {dict:new(), 0})
.
fight_result_list([FightResult | FightResultList], {TroopsDict, _}) ->
	CombatHero = FightResult#fight_result.l_wastage#fight_wastage.fighter,
	TroopsId = CombatHero#combat_hero.id * 1000 + CombatHero#combat_hero.hero_id,
	NewTroopsDict = dict:store(TroopsId, {FightResult#fight_result.win_type =:= ?FIGHTER_TYPE_L, CombatHero}, TroopsDict),
	fight_result_list(FightResultList, {NewTroopsDict, FightResult#fight_result.combat_id})
;
fight_result_list([], {TroopsDict, CombatId}) ->
	TroopsIdList = lib_map:gain_callback_troops(CombatId),
	TroopsList = lib_troops_api:troops(TroopsIdList),
	NewTroops = [
		(case dict:find(TroopsId, TroopsDict) of
			{ok, {State, CombatHero}} ->
				(case State of
					true -> lib_map_api:a_defend_troops(TroopsId, CityId), Troops;
					false -> Troops#troops{city_id = ?COUNTRY_CAPITAL(CombatHero#combat_hero.country)}
				end)#troops{combat_hero = CombatHero};
			error -> lib_map_api:a_defend_troops(TroopsId, CityId), Troops
		end)#troops{state = ?TROOPS_FREE} || #troops{troops_id = TroopsId, city_id = CityId} = Troops <- TroopsList],
	lib_troops_api:u_troops(NewTroops)
.

send_award({Player1, Level1, IsRobot1, Kills1}, {Player2, Level2, IsRobot2, Kills2}) ->
	case IsRobot1 of
		true -> skip;
		_ ->lib_country_warehouse_api:add_year_annihilation_and_battle_losses(Player1,Kills1,Kills2),
			mod_server:async_apply(mod_meritorious_rank:get_pid(), fun lib_meritorious_award_rank:city_fight_count_meritorious/6, [Player1, Kills1, Level2, IsRobot2, Kills2, 0])
	end,
	case IsRobot2 of
		true -> skip;
		_ ->lib_country_warehouse_api:add_year_annihilation_and_battle_losses(Player2,Kills2,Kills1),
			mod_server:async_apply(mod_meritorious_rank:get_pid(), fun lib_meritorious_award_rank:city_fight_count_meritorious/6, [Player2, Kills2, Level1, IsRobot1, Kills1, 0])
	end
.

send_broad(Type, Country, CityId) ->
	Shout1 = lib_broadcast_api:create_broadcast(Type),
	Shout2 = lib_broadcast_api:push_broad_arg(Shout1, ?BROAD_TYPE_COUNTRY_ID, Country),
	Shout3 = lib_broadcast_api:push_broad_arg(Shout2, ?BROAD_TYPE_CITY_ID, CityId),
	lib_broadcast_api:send_all_system(Shout3)
.

u_fight_troops(Type, Wastage, CityId) ->
	CombatHero = Wastage#fight_wastage.fighter,
	IsRobot = CombatHero#combat_hero.is_robot,
	IsWin = Wastage#fight_wastage.is_win,
	PlayerId = CombatHero#combat_hero.id,
	case IsRobot of
		true ->
			if
				IsWin -> skip;
				Type =:= attack -> skip;
				true ->
					RobotType = maps:get(robot_type, tb_robot:get(PlayerId div 1000)),
					lib_map_api:d_defend_troops(RobotType, CityId),
					lib_map_api:d_guard_num(CityId, RobotType)
			end;
		false ->
			TroopsId = PlayerId * 1000 + CombatHero#combat_hero.hero_id,
			lib_map:add_notice_country_war_kill(PlayerId, Wastage#fight_wastage.kills),
			Troops = (lib_troops_api:troops(TroopsId))#troops{combat_hero = CombatHero},
			NewTroops =
				case Type of
					attack ->
						lib_map_api:d_attack_troops(TroopsId, CityId),
						case IsWin of
							true -> lib_map_api:a_attack_troops(TroopsId, CityId), Troops;
							false -> Troops#troops{state = ?TROOPS_FREE, city_id = ?COUNTRY_CAPITAL(CombatHero#combat_hero.country)}
						end;
					defend ->
						lib_map_api:d_defend_troops(TroopsId, CityId),
						case IsWin of
							true -> lib_map_api:a_defend_troops(TroopsId, CityId), Troops;
							false -> Troops#troops{state = ?TROOPS_FREE, city_id = ?COUNTRY_CAPITAL(CombatHero#combat_hero.country)}
						end
				end,
			lib_troops_api:u_troops(NewTroops)
	end,
	{PlayerId, CombatHero#combat_hero.hero_level, IsRobot, Wastage#fight_wastage.kills}
.
guard_robot_list(Country, Type, Level, Num) ->
	List = lists:seq(1, Num),
	[guard_robot(Country, Type, Level, X) || X <- List]
.
guard_robot(Country, Type, Level, X) ->
	CombatHero = lib_robot_api:guard_robot(Type, Level),
	CombatHero#combat_hero{id = CombatHero#combat_hero.id * 1000 + X, country = Country}
.



