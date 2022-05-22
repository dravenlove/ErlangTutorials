%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 3月 2021 16:48
%%%-------------------------------------------------------------------
-module(db_challenge).
-author("df").
-include("common.hrl").
-include("challenge.hrl").
-include("hero.hrl").
-include("player.hrl").

%% API
-export([
	save_challenge/1,
	load_challenge/0
]).

challenge_to_bson(Challenge) ->
	BsonAttackList =
		maps:fold(fun(_Attack_info, Attack_info, List) ->
			[challenge_fight_to_bson(Attack_info) | List]
				  end, [], Challenge#challenge.attack_info),
	BsonReportList =
		maps:fold(fun(_Report_info, Report_info, List) ->
			[challenge_report_to_bson(Report_info) | List]
				  end, [], Challenge#challenge.report),

	#{
		?BSONSET_INT(type, Challenge#challenge.type),
		?BSONSET_BSON(defend_info, challenge_fight_to_bson(Challenge#challenge.defend_info)),
		?BSONSET_BSON(defend_order, defend_order_to_bson(Challenge#challenge.defend_order)),
		?BSONSET_LIST(attack_info, BsonAttackList),
		?BSONSET_INT(attack_num, Challenge#challenge.attack_num),
		?BSONSET_LIST(attack_id, Challenge#challenge.attack_id),
		?BSONSET_LIST(attack_buff, Challenge#challenge.attack_buff),
		?BSONSET_INT(pond, Challenge#challenge.pond),
		?BSONSET_INT(now_record_id, Challenge#challenge.now_record_id),
		?BSONSET_LIST(report, BsonReportList)
	}
.
bson_to_challenge(Bson) ->
	BsonDefend = bson_to_challenge_fight(?BSON_BSON(Bson, defend_info)),

	BsonDefendOrder = bson_to_defend_order(?BSON_BSON(Bson, defend_order)),

	BsonAttackList = ?BSON_LIST(Bson, attack_info, []),
	AttackMap =
		lists:foldl(fun(BsonAttack, Map) ->
			PlayerId = ?BSON_INT(BsonAttack, id),
			maps:put(PlayerId, bson_to_challenge_fight(BsonAttack), Map)
					end, maps:new(), BsonAttackList),

	BsonReportList = ?BSON_LIST(Bson, report, []),
	ReportMap =
		lists:foldl(fun(BsonReport, Map) ->
			Record_id = ?BSON_INT(BsonReport, record_id),
			maps:put(Record_id, bson_to_challenge_report(BsonReport), Map)
					end, maps:new(), BsonReportList),

	#challenge{
		type = ?BSON_INT(Bson, type),
		defend_info = BsonDefend,
		defend_order = BsonDefendOrder,
		attack_info = AttackMap,
		attack_num = ?BSON_INT(Bson, attack_num),
		attack_id = ?BSON_LIST(Bson, attack_id),
		attack_buff = ?BSON_LIST(Bson, attack_buff),
		pond = ?BSON_INT(Bson, pond),
		now_record_id = ?BSON_INT(Bson, now_record_id),
		report = ReportMap
	}
.

troop_to_bson(Hero_troop) ->
	#{
		?BSONSET_INT(hero_id, Hero_troop#challenge_hero_troop.hero_id),
		?BSONSET_INT(all_troop, Hero_troop#challenge_hero_troop.all_troop),
		?BSONSET_INT(now_troop, Hero_troop#challenge_hero_troop.now_troop)
	}
.

bson_to_troop(Bson) ->
	#challenge_hero_troop{
		hero_id = ?BSON_INT(Bson, id),
		all_troop = ?BSON_INT(Bson, all_troop),
		now_troop = ?BSON_INT(Bson, now_troop)
	}
.

challenge_fight_to_bson(Challenge_fight) ->
	BsonHeroTroopList =
		maps:fold(fun(_Hero_troop, Hero_troop, List) ->
			[troop_to_bson(Hero_troop) | List]
				  end, [], Challenge_fight#player_challenge_fight.hero_troop),
	#{
		?BSONSET_INT(id, Challenge_fight#player_challenge_fight.id),
		?BSONSET_INT(tick, Challenge_fight#player_challenge_fight.tick),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Challenge_fight#player_challenge_fight.show)),
		?BSONSET_LIST(hero_list, [lib_hero_api:hero_base_to_bson(HeroBase) || HeroBase <- Challenge_fight#player_challenge_fight.hero_list]),
		?BSONSET_LIST(fighters, db_combat_queue:fighters_to_bson_list(Challenge_fight#player_challenge_fight.fighters)),
		?BSONSET_LIST(hero_troop, BsonHeroTroopList)
	}
.

bson_to_challenge_fight(Bson) ->
	BsonTroopList = ?BSON_LIST(Bson, hero_troop, []),
	TroopMap =
		lists:foldl(fun(BsonTroop, Map) ->
			Hero_id = ?BSON_INT(BsonTroop, hero_id),
			maps:put(Hero_id, bson_to_troop(BsonTroop), Map)
					end, maps:new(), BsonTroopList),

	#player_challenge_fight{
		id = ?BSON_INT(Bson, id),
		tick = ?BSON_INT(Bson, tick),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		hero_list = [lib_hero_api:bson_to_hero_base(BsonHeroBase) || BsonHeroBase <- ?BSON_LIST(Bson, hero_list)],
		fighters = db_combat_queue:bson_list_to_fighters(?BSON_LIST(Bson, fighters)),
		hero_troop = TroopMap
	}
.

defend_order_to_bson(Defend_order) ->
	#{
		?BSONSET_INT(id, Defend_order#defend_order.id),
		?BSONSET_INT(tick, Defend_order#defend_order.tick),
		?BSONSET_INT(win_time, Defend_order#defend_order.win_time)
	}

.
bson_to_defend_order(Bson) ->
	#defend_order{
		id = ?BSON_INT(Bson, id),
		tick = ?BSON_INT(Bson, tick),
		win_time = ?BSON_INT(Bson, win_time)
	}
.

challenge_report_to_bson(Report) ->
	#{
		?BSONSET_INT(record_id, Report#challenge_report.record_id),
		?BSONSET_INT(tick, Report#challenge_report.tick),
		?BSONSET_INT(l_id, Report#challenge_report.l_id),
		?BSONSET_BSON(l_show, lib_common:player_show_to_bson(Report#challenge_report.l_show)),
		?BSONSET_INT(r_id, Report#challenge_report.r_id),
		?BSONSET_BSON(r_show, lib_common:player_show_to_bson(Report#challenge_report.r_show)),
		?BSONSET_INT(win, Report#challenge_report.win),
		?BSONSET_INT(award, Report#challenge_report.award),
		?BSONSET_INT(winner, Report#challenge_report.winner)
	}
.

bson_to_challenge_report(Bson) ->
	#challenge_report{
		record_id = ?BSON_INT(Bson, record_id),
		tick = ?BSON_INT(Bson, tick),
		l_id = ?BSON_INT(Bson, l_id),
		l_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, l_show)),
		r_id = ?BSON_INT(Bson, r_id),
		r_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, r_show)),
		win = ?BSON_INT(Bson, win),
		award = ?BSON_INT(Bson, award),
		winner = ?BSON_INT(Bson, winner)
	}
.

guess_to_bson(Guess) ->
	#{
		?BSONSET_INT(type, Guess#challenge_guess.type),
		?BSONSET_INT(tick, Guess#challenge_guess.tick),
		?BSONSET_INT(num, Guess#challenge_guess.num)
	}
.
bson_to_guess(Bson) ->
	#challenge_guess{
		type = ?BSON_INT(Bson, type),
		tick = ?BSON_INT(Bson, tick),
		num = ?BSON_INT(Bson, num)
	}
.

player_to_bson(Player) ->
	#{
		?BSONSET_INT(id, Player#player_challenge.id),
		?BSONSET_INT(guess_type, Player#player_challenge.guess_type),
		?BSONSET_INT(attack_time, Player#player_challenge.attack_time),
		?BSONSET_INT(attack_tick, Player#player_challenge.attack_tick),
		?BSONSET_INT(buy_time, Player#player_challenge.buy_time),
		?BSONSET_LIST(item, Player#player_challenge.item)
	}
.
bson_to_player(Bson) ->
	#player_challenge{
		id = ?BSON_INT(Bson, id),
		guess_type = ?BSON_INT(Bson, guess_type),
		attack_time = ?BSON_INT(Bson, attack_time),
		attack_tick = ?BSON_INT(Bson, attack_tick),
		buy_time = ?BSON_INT(Bson, buy_time),
		item = ?BSON_LIST(Bson, item)
	}
.

save_challenge(Challenge_gather)when is_record(Challenge_gather, challenge_gather) ->
	BsonChallengeList =
		maps:fold(fun(_, Challenge, List) ->
			[challenge_to_bson(Challenge) | List]
				  end, [], Challenge_gather#challenge_gather.challenge_map),
	BsonGuessList =
		maps:fold(fun(_, Guess, List) ->
			[guess_to_bson(Guess) | List]
				  end, [], Challenge_gather#challenge_gather.guess_map),
	BsonPlayerList =
		maps:fold(fun(_, Player, List) ->
			[player_to_bson(Player) | List]
				  end, [], Challenge_gather#challenge_gather.player_map),
	Bson =
		#{
			?BSONSET_INT(uid, 1),
			?BSONSET_INT(stage,  Challenge_gather#challenge_gather.stage),
			?BSONSET_INT(fight_type,  Challenge_gather#challenge_gather.fight_type),
			?BSONSET_LIST(challenge_map, BsonChallengeList),
			?BSONSET_LIST(guess_map, BsonGuessList),
			?BSONSET_LIST(player_map, BsonPlayerList),
			?BSONSET_LIST(online_list, Challenge_gather#challenge_gather.online_list),
			?BSONSET_LIST(report_list, Challenge_gather#challenge_gather.report_list)
		},
	QueryBson = #{
		?BSONSET_INT(uid, 1)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_CHALLENGE, QueryBson, Bson)

.
load_challenge()->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_CHALLENGE, #{?BSONSET_INT(uid, 1)}) of
		Res = #{} ->
			BsonChallengeList = ?BSON_LIST(Res, challenge_map, []),
			Challenge_map =
				lists:foldl(fun(Bson1, Map1) ->
					Challenge = bson_to_challenge(Bson1),
					maps:put(Challenge#challenge.type, Challenge, Map1)
							end, maps:new(), BsonChallengeList),
			BsonGuessList = ?BSON_LIST(Res, guess_map, []),
			Guess_map =
				lists:foldl(fun(Bson2, Map2) ->
					Guess = bson_to_guess(Bson2),
					maps:put(Guess#challenge_guess.type, Guess, Map2)
							end, maps:new(), BsonGuessList),
			BsonPlayerList = ?BSON_LIST(Res, player_map, []),
			Player_map =
				lists:foldl(fun(Bson3, Map3) ->
					Player = bson_to_player(Bson3),
					maps:put(Player#player_challenge.id, Player, Map3)
							end, maps:new(), BsonPlayerList),
			#challenge_gather{
				stage = ?BSON_INT(Res, stage),
				fight_type = ?BSON_INT(Res, fight_type),
				challenge_map = Challenge_map,
				guess_map = Guess_map,
				player_map = Player_map,
				online_list = ?BSON_LIST(Res, online_list),
				report_list = ?BSON_LIST(Res, report_list)

			};
		_ ->
			#challenge_gather{
			}
	end
.