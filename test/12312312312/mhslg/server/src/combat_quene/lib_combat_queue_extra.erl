%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_combat_queue_extra.erl
%% Created on : 2019-05-31 11:18:00
%% Author: Jiuan
%% Last Modified: 2019-05-31 11:18:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_combat_queue_extra).
-include("common.hrl").
-include("fight.hrl").
-include("player.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10102.hrl").

%% API
-export([
	fetch_handle_tick/2,
	parsing_fighters/1,
	fighter_join/2,
	fighter_quit/3,
	handle_wastage/5,				%% 处理战斗损耗
	serialize_highest_msg/1,
	is_die/1,						%% 判断是否死亡
	fight_result_to_proto/1,
	fight_result_list_to_proto/1,
	add_drop_id/3,
	drop_map_to_proto/1
]).

fetch_handle_tick(CombatDetail, FightResult) ->
	if
		CombatDetail#combat_queue_detail.interval_type =:= ?INTERVAL_TYPE1 ->
			CombatDetail#combat_queue_detail.handle_tick + CombatDetail#combat_queue_detail.interval;
		CombatDetail#combat_queue_detail.interval_type =:= ?INTERVAL_TYPE2 ->
			CombatDetail#combat_queue_detail.handle_tick + FightResult#fight_result.interval div 1000;
		CombatDetail#combat_queue_detail.interval_type =:= ?INTERVAL_TYPE3 ->
			CombatDetail#combat_queue_detail.handle_tick + CombatDetail#combat_queue_detail.interval + FightResult#fight_result.interval div 1000;
		true -> 0
	end.

parsing_fighters(Fighters) ->
	lists:foldr(fun(Fighter, {Highest, PlayerDict, FightersAcc, Acc0}) ->
		Dominate = #highest_detail{
			id = Fighter#combat_hero.id,
			name = Fighter#combat_hero.name,
			head_id = Fighter#combat_hero.head_id,
			hero_id = Fighter#combat_hero.hero_id,
			value = 0
		},
		MaxForce =
		case Highest#combat_highest.max_force#highest_detail.value < Fighter#combat_hero.hero_force of
			true ->
				#highest_detail{
					id = Fighter#combat_hero.id,
					name = Fighter#combat_hero.name,
					head_id = Fighter#combat_hero.head_id,
					hero_id = Fighter#combat_hero.hero_id,
					value = Fighter#combat_hero.hero_force
				};
			_ -> Highest#combat_highest.max_force
		end,
		MaxOffice =
		case Highest#combat_highest.max_office#highest_detail.value < Fighter#combat_hero.office of
			true ->
				#highest_detail{
					id = Fighter#combat_hero.id,
					name = Fighter#combat_hero.name,
					head_id = Fighter#combat_hero.head_id,
					hero_id = Fighter#combat_hero.hero_id,
					value = Fighter#combat_hero.office
				};
			_ -> Highest#combat_highest.max_force
		end,
		NewAcc0 = case Fighter#combat_hero.is_robot =:= false of true -> erlang:length(FightersAcc) +  1; _ -> Acc0 end,
		Player0 = ?DICT_FETCH(Fighter#combat_hero.id, PlayerDict, #combat_player{}),
		FighterHeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id; _ -> Fighter#combat_hero.hero_id end,
		{#combat_highest{
			max_dominate = Dominate,
			max_force = MaxForce,
			max_office = MaxOffice},
		dict:store(Fighter#combat_hero.id, Player0#combat_player{
			id = Fighter#combat_hero.id,
			name = Fighter#combat_hero.name,
			country = Fighter#combat_hero.country,
			head_id = Fighter#combat_hero.head_id,
			office = Fighter#combat_hero.office,
			heros = [FighterHeroId | Player0#combat_player.heros]
		}, PlayerDict),
		[Fighter#combat_hero{index = erlang:length(FightersAcc) + 1} | FightersAcc], NewAcc0}
	end, {#combat_highest{}, dict:new(), [], 0}, Fighters).

fighter_join(Fighter, CombatDetail) ->
	if
		Fighter#combat_hero.country =:= CombatDetail#combat_queue_detail.country ->
			Player = ?DICT_FETCH(Fighter#combat_hero.id, CombatDetail#combat_queue_detail.r_player_dict, #combat_player{}),
			Highest = CombatDetail#combat_queue_detail.r_highest,
			FighterHeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id; _ -> Fighter#combat_hero.hero_id end,
			PlayerDict = dict:store(Fighter#combat_hero.id, Player#combat_player{
				id = Fighter#combat_hero.id,
				heros = [FighterHeroId | Player#combat_player.heros],
				name = Fighter#combat_hero.name,
				country = Fighter#combat_hero.country,
				head_id = Fighter#combat_hero.head_id,
				office = Fighter#combat_hero.office
			}, CombatDetail#combat_queue_detail.l_player_dict),
			MaxForce =
				case Highest#combat_highest.max_force#highest_detail.value < Fighter#combat_hero.hero_force of
					true ->
						#highest_detail{
							id = Fighter#combat_hero.id,
							name = Fighter#combat_hero.name,
							head_id = Fighter#combat_hero.head_id,
							hero_id = Fighter#combat_hero.hero_id,
							value = Fighter#combat_hero.hero_force
						};
					_ -> Highest#combat_highest.max_force
				end,
			MaxOffice =
				case Highest#combat_highest.max_office#highest_detail.value < Fighter#combat_hero.office of
					true ->
						#highest_detail{
							id = Fighter#combat_hero.id,
							name = Fighter#combat_hero.name,
							head_id = Fighter#combat_hero.head_id,
							hero_id = Fighter#combat_hero.hero_id,
							value = Fighter#combat_hero.office
						};
					_ -> Highest#combat_highest.max_force
				end,
			{Fighters, LsatRole} = handle_fighters(Fighter, CombatDetail#combat_queue_detail.r_fighters, CombatDetail#combat_queue_detail.r_last_role),

			CombatDetail#combat_queue_detail{
				r_last_role = LsatRole,
				r_fighters = Fighters,
				r_player_dict = PlayerDict,
				r_highest = Highest#combat_highest{max_force = MaxForce,max_office = MaxOffice}
			};
		true ->
			Player = ?DICT_FETCH(Fighter#combat_hero.id, CombatDetail#combat_queue_detail.l_player_dict, #combat_player{}),
			Highest = CombatDetail#combat_queue_detail.l_highest,
			FighterHeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id; _ -> Fighter#combat_hero.hero_id end,
			PlayerDict = dict:store(Fighter#combat_hero.id, Player#combat_player{
				id = Fighter#combat_hero.id,
				name = Fighter#combat_hero.name,
				heros = [FighterHeroId | Player#combat_player.heros],
				country = Fighter#combat_hero.country,
				head_id = Fighter#combat_hero.head_id,
				office = Fighter#combat_hero.office
			}, CombatDetail#combat_queue_detail.l_player_dict),
			MaxForce =
				case Highest#combat_highest.max_force#highest_detail.value < Fighter#combat_hero.hero_force of
					true ->
						#highest_detail{
							id = Fighter#combat_hero.id,
							name = Fighter#combat_hero.name,
							head_id = Fighter#combat_hero.head_id,
							hero_id = Fighter#combat_hero.hero_id,
							value = Fighter#combat_hero.hero_force
						};
					_ -> Highest#combat_highest.max_force
				end,
			MaxOffice =
				case Highest#combat_highest.max_office#highest_detail.value < Fighter#combat_hero.office of
					true ->
						#highest_detail{
							id = Fighter#combat_hero.id,
							name = Fighter#combat_hero.name,
							head_id = Fighter#combat_hero.head_id,
							hero_id = Fighter#combat_hero.hero_id,
							value = Fighter#combat_hero.office
						};
					_ -> Highest#combat_highest.max_force
				end,
			{Fighters, LsatRole} = handle_fighters(Fighter, CombatDetail#combat_queue_detail.l_fighters, CombatDetail#combat_queue_detail.l_last_role),
			CombatDetail#combat_queue_detail{
				l_last_role = LsatRole,
				l_fighters = Fighters,
				l_player_dict = PlayerDict,
				l_highest = Highest#combat_highest{max_force = MaxForce,max_office = MaxOffice}
			}
	end.

fighter_quit(PlayerShow, HeroId, CombatDetail) ->
	WhileFun = fun(HeroInfo) -> HeroInfo#combat_hero.id =:= PlayerShow#player_show.id andalso HeroInfo#combat_hero.hero_id =:= HeroId end,
	if
		PlayerShow#player_show.country =:= CombatDetail#combat_queue_detail.country ->
			[Fighter|_] = lists:filter(WhileFun, CombatDetail#combat_queue_detail.r_fighters),
			Fighters = lists:dropwhile(WhileFun, CombatDetail#combat_queue_detail.r_fighters),
			{LsatRole, NewFighters} =
			lists:foldl(fun(Fighter0, {Acc0, Acc1}) ->
				NewAcc0 = case Fighter#combat_hero.is_robot =:= false of true -> erlang:length(Fighters) + 1; _ -> Acc0 end,
				{NewAcc0, [Fighter0#combat_hero{index = erlang:length(Fighters) + 1} | Acc1]}
			end, {0, []}, Fighters),
			Highest = CombatDetail#combat_queue_detail.r_highest,
			MaxForce =
			case Highest#combat_highest.max_force#highest_detail.id =:= Fighter#combat_hero.id andalso
				Highest#combat_highest.max_force#highest_detail.hero_id =:= Fighter#combat_hero.hero_id of
				true ->
					fetch_max_force(NewFighters);
				_ -> Highest#combat_highest.max_force
			end,
			MaxOffice =
			case Highest#combat_highest.max_office#highest_detail.id =:= Fighter#combat_hero.id andalso
				Highest#combat_highest.max_office#highest_detail.hero_id =:= Fighter#combat_hero.hero_id of
				true ->
					fetch_max_office(NewFighters);
				_ -> Highest#combat_highest.max_office
			end,

			Player = ?DICT_FETCH(Fighter#combat_hero.id, CombatDetail#combat_queue_detail.r_player_dict, #combat_player{}),
			FighterHeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id; _ -> Fighter#combat_hero.hero_id end,
			PlayerDict = dict:store(Fighter#combat_hero.id, Player#combat_player{
				id = Fighter#combat_hero.id,
				name = Fighter#combat_hero.name,
				heros = lists:delete(FighterHeroId,Player#combat_player.heros),
				country = Fighter#combat_hero.country,
				head_id = Fighter#combat_hero.head_id,
				office = Fighter#combat_hero.office
			}, CombatDetail#combat_queue_detail.r_player_dict),
			CombatDetail#combat_queue_detail{
				r_last_role = LsatRole,
				r_player_dict = PlayerDict,
				r_fighters = lists:reverse(NewFighters),
				r_highest = Highest#combat_highest{max_force = MaxForce,max_office = MaxOffice}
			};
		true ->
			[Fighter|_] = lists:filter(WhileFun, CombatDetail#combat_queue_detail.l_fighters),
			Fighters = lists:dropwhile(WhileFun, CombatDetail#combat_queue_detail.l_fighters),
			{LsatRole, NewFighters} =
				lists:foldl(fun(Fighter0, {Acc0, Acc1}) ->
					NewAcc0 = case Fighter#combat_hero.is_robot =:= false of true -> erlang:length(Fighters) + 1; _ -> Acc0 end,
					{NewAcc0, [Fighter0#combat_hero{index = erlang:length(Fighters) + 1} | Acc1]}
				            end, {0, []}, Fighters),
			Highest = CombatDetail#combat_queue_detail.l_highest,
			MaxForce =
				case Highest#combat_highest.max_force#highest_detail.id =:= Fighter#combat_hero.id andalso
					Highest#combat_highest.max_force#highest_detail.hero_id =:= Fighter#combat_hero.hero_id of
					true ->
						fetch_max_force(NewFighters);
					_ -> Highest#combat_highest.max_force
				end,
			MaxOffice =
				case Highest#combat_highest.max_office#highest_detail.id =:= Fighter#combat_hero.id andalso
					Highest#combat_highest.max_office#highest_detail.hero_id =:= Fighter#combat_hero.hero_id of
					true ->
						fetch_max_office(NewFighters);
					_ -> Highest#combat_highest.max_office
				end,
			Player = ?DICT_FETCH(Fighter#combat_hero.id, CombatDetail#combat_queue_detail.l_player_dict, #combat_player{}),
			FighterHeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id; _ -> Fighter#combat_hero.hero_id end,
			PlayerDict = dict:store(Fighter#combat_hero.id, Player#combat_player{
				id = Fighter#combat_hero.id,
				name = Fighter#combat_hero.name,
				heros = lists:delete(FighterHeroId,Player#combat_player.heros),
				country = Fighter#combat_hero.country,
				head_id = Fighter#combat_hero.head_id,
				office = Fighter#combat_hero.office
			}, CombatDetail#combat_queue_detail.l_player_dict),
			CombatDetail#combat_queue_detail{
				l_last_role = LsatRole,
				l_player_dict = PlayerDict,
				l_fighters = lists:reverse(NewFighters),
				l_highest = Highest#combat_highest{max_force = MaxForce,max_office = MaxOffice}
			}
	end.

fetch_max_force(Fighters) ->
	lists:foldl(fun(Fighter, Acc0) ->
		case Acc0#highest_detail.value < Fighter#combat_hero.hero_force of
			true ->
				#highest_detail{
					id = Fighter#combat_hero.id,
					name = Fighter#combat_hero.name,
					head_id = Fighter#combat_hero.head_id,
					hero_id = Fighter#combat_hero.hero_id,
					value = Fighter#combat_hero.hero_force
				};
			_ -> Acc0
		end
	end, #highest_detail{}, Fighters).
fetch_max_office(Fighters) ->
	lists:foldl(fun(Fighter, Acc0) ->
		case Acc0#highest_detail.value < Fighter#combat_hero.office of
			true ->
				#highest_detail{
					id = Fighter#combat_hero.id,
					name = Fighter#combat_hero.name,
					head_id = Fighter#combat_hero.head_id,
					hero_id = Fighter#combat_hero.hero_id,
					value = Fighter#combat_hero.office
				};
			_ -> Acc0
		end
	end, #highest_detail{}, Fighters).

is_die(Fighter) ->
	FrontInfo = Fighter#combat_hero.former,
	BackInfo = Fighter#combat_hero.latter,
	FrontInfo#combat_army.cur_troops =< 0 andalso BackInfo#combat_army.cur_troops =< 0.

handle_wastage(Fighters, Wastage, Highest, PlayerDict, FightType) ->
	[Fighter | LeftList] = Fighters,
	FrontInfo = Fighter#combat_hero.former,
	BackInfo = Fighter#combat_hero.latter,
	Fighter1 = Fighter#combat_hero{
		former = FrontInfo#combat_army{cur_troops = min(FrontInfo#combat_army.troops, Wastage#fight_wastage.over_front)},
		latter = BackInfo#combat_army{cur_troops = min(BackInfo#combat_army.troops, Wastage#fight_wastage.over_back)}
	},
	{List, Last} = index_fighters(LeftList),
	{Fighters1, LsatRole, DelFlag} =
		if
			FightType =:= ?FIGHT_TYPE1 ->
				case is_die(Fighter1) of
					true -> {List, Last, true};
					_ -> {TA,TB} = handle_fighters(Fighter1#combat_hero{
						hero_win_time = Fighter1#combat_hero.hero_win_time + 1
					}, List, Last), {TA,TB,false} 
				end;
			FightType =:= ?FIGHT_TYPE2 ->
				{List, Last, true};
			true ->
				{List, Last, true}
		end,
	Player0 = ?DICT_FETCH(Fighter#combat_hero.id, PlayerDict, #combat_player{}),
	FighterHeroId = case Fighter#combat_hero.is_robot of true -> Fighter#combat_hero.robot_base_id; _ -> Fighter#combat_hero.hero_id end,
	Player = Player0#combat_player{
		id = Fighter#combat_hero.id,
		name = Fighter#combat_hero.name,
		heros = case DelFlag of true ->lists:delete(FighterHeroId,Player0#combat_player.heros);_->Player0#combat_player.heros end,
		country = Fighter#combat_hero.country,
		head_id = Fighter#combat_hero.head_id,
		office = Fighter#combat_hero.office,
		kills = Wastage#fight_wastage.kills + Player0#combat_player.kills,
		loss = Player0#combat_player.loss + max(0, Wastage#fight_wastage.start_back - Wastage#fight_wastage.over_back) +
			max(0, Wastage#fight_wastage.start_front - Wastage#fight_wastage.over_front)
	},
	PlayerDict1 = dict:store(Fighter#combat_hero.id, Player, PlayerDict),

	MaxOffice =
		case Highest#combat_highest.max_office#highest_detail.id =:= Fighter#combat_hero.id andalso is_die(Fighter1) andalso
			Highest#combat_highest.max_office#highest_detail.hero_id =:= Fighter#combat_hero.hero_id of
			true ->
				fetch_max_office(Fighters1);
			_ -> Highest#combat_highest.max_office
		end,
	MaxForce =
		case Highest#combat_highest.max_force#highest_detail.id =:= Fighter#combat_hero.id andalso is_die(Fighter1) andalso
			Highest#combat_highest.max_force#highest_detail.hero_id =:= Fighter#combat_hero.hero_id of
			true ->
				fetch_max_force(Fighters1);
			_ -> Highest#combat_highest.max_force
		end,

	MaxDominate0 = Highest#combat_highest.max_dominate,
	MaxDominate =
	case Wastage#fight_wastage.kills + Player#combat_player.kills > MaxDominate0#highest_detail.value of
		true ->
			#highest_detail{
				id = Fighter#combat_hero.id,
				name = Fighter#combat_hero.name,
				head_id = Fighter#combat_hero.head_id,
				hero_id = Fighter#combat_hero.hero_id,
				value = Wastage#fight_wastage.kills + Player#combat_player.kills
			};
		_ -> Highest#combat_highest.max_dominate
	end,

	{#combat_highest{max_office = MaxOffice, max_force = MaxForce, max_dominate = MaxDominate}, PlayerDict1, Fighters1, LsatRole}.


serialize_highest_msg(CombatDetail) ->
	L = CombatDetail#combat_queue_detail.l_highest,
	R = CombatDetail#combat_queue_detail.r_highest,
	LProto = #'ProtoFightHighest'{
		max_dominate = serialize_highest_detail(L#combat_highest.max_dominate),
		max_force = serialize_highest_detail(L#combat_highest.max_force),
		max_office = serialize_highest_detail(L#combat_highest.max_office)
	},
	RProto = #'ProtoFightHighest'{
		max_dominate = serialize_highest_detail(R#combat_highest.max_dominate),
		max_force = serialize_highest_detail(R#combat_highest.max_force),
		max_office = serialize_highest_detail(R#combat_highest.max_office)
	},
	#'Proto80102005'{
		l_highest = LProto,
		r_highest = RProto
	}.
serialize_highest_detail(Detail) ->
	#'ProtoShowRole'{
		id = Detail#highest_detail.id,
		head_icon = Detail#highest_detail.head_id,
		name = Detail#highest_detail.name,
		value = Detail#highest_detail.value
	}.

handle_fighters(Fighter, Fighters, Last) ->
	case erlang:length(Fighters) > Last of
		true ->
			{List1, List2} = lists:split(Last, Fighters),
			{lists:append(lists:append(List1, [Fighter]), List2), Last + 1};
		_ ->
			{lists:append(Fighters, [Fighter]), Last + 1}
	end.

index_fighters(Fighters) ->
	{List, Last} =
	lists:foldl(fun(Fighter, {Acc0, Acc1}) ->
		NewAcc1 = case Fighter#combat_hero.is_robot =:= false of true -> erlang:length(Acc0) +  1; _ -> Acc1 end,
		{[Fighter#combat_hero{index = erlang:length(Acc0)} | Acc0], NewAcc1}
	end, {[], 0}, Fighters),
	{lists:reverse(List), Last}.

fight_result_list_to_proto(ResultList) when is_list(ResultList) ->
	[fight_result_to_proto(Result) || Result <- ResultList].
fight_result_to_proto(Result) ->
	#'ProtoFightResult'{
		combat_id = Result#fight_result.combat_id,
		win_type = Result#fight_result.win_type,
		l_wastage = wastage_to_proto(Result#fight_result.l_wastage),
		r_wastage = wastage_to_proto(Result#fight_result.r_wastage)
	}.

wastage_to_proto(Wastage) ->
	case Wastage of
		false -> #'ProtoFightWastage'{};
		_ ->
			#'ProtoFightWastage'{
				fighter = lib_fight_parsing:fighter_to_proto(Wastage#fight_wastage.fighter),
				kills = Wastage#fight_wastage.kills,
				start_front = Wastage#fight_wastage.start_front,
				start_back = Wastage#fight_wastage.start_back,
				over_front = Wastage#fight_wastage.over_front,
				over_back = Wastage#fight_wastage.over_back
			}
	end.

add_drop_id(PlayerId, DropId, CombatDetail) ->
	DropMap = maps:get(PlayerId, CombatDetail#combat_queue_detail.drop_map, maps:new()),
	Amount = maps:get(DropId, DropMap, 0),
	NewDropMap = maps:put(DropId, Amount + 1, DropMap),
	AllDropMap = maps:put(PlayerId, NewDropMap, CombatDetail#combat_queue_detail.drop_map),
	DropAssistMap = drop_assist_map(PlayerId, DropId, CombatDetail#combat_queue_detail.drop_assist_map),
	CombatDetail#combat_queue_detail{
		drop_id = DropId,
		drop_map = AllDropMap,
		drop_assist_map = DropAssistMap
	}.
drop_assist_map(PlayerId, DropId, AssistMap) ->
	Map =
	maps:fold(fun(K, V, Acc) ->
		case DropId =:= K of
			true ->
				maps:put(K, 0, Acc);
			_ ->
				maps:put(K, V + 1, Acc)
		end
	end, maps:new(), maps:get(PlayerId, AssistMap, maps:new())),
	maps:put(PlayerId, Map, AssistMap).

drop_map_to_proto(DropMap) ->
	maps:fold(fun(RoleId, Info, Acc) ->
		[#'ProtoFightDrop'{
			role_id = RoleId,
			detail_map = detail_map_to_proto(Info)
		} | Acc]
	end, [], DropMap).

detail_map_to_proto(Info) ->
	maps:fold(fun(DropId, Amount, Acc) ->
		[#'ProtoKeyValue'{
			key = DropId,
			value = Amount
		} | Acc]
	end, [], Info).