%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 5月 2021 17:07
%%%-------------------------------------------------------------------
-module(db_honour_top).
-author("df").
-include("common.hrl").
-include("honour_top.hrl").

%% API
-export([
	save_honour_top/1,
	load_honour_top/0
]).

player_to_bson(Player) ->
	BsonPlayerGroupMapList =
		maps:fold(fun(_, Player_group_map, List) ->
			[player_group_map_to_bson(Player_group_map) | List]
				  end, [], Player#player_honour_top.group_map),
	#{
		?BSONSET_INT(player_id, Player#player_honour_top.player_id),
		?BSONSET_INT(is_robot, Player#player_honour_top.is_robot),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Player#player_honour_top.show)),
		?BSONSET_INT(is_apply, Player#player_honour_top.is_apply),
		?BSONSET_INT(is_worship, Player#player_honour_top.is_worship),
		?BSONSET_INT(bet, Player#player_honour_top.bet),
		?BSONSET_LIST(group_map, BsonPlayerGroupMapList),
		?BSONSET_LIST(hero_info, [lib_hero_api:hero_base_to_bson(HeroBase) || HeroBase <- Player#player_honour_top.hero_info])
	}
.
bson_to_player(Bson) ->
	GroupMapList = ?BSON_LIST(Bson, group_map, []),
	GroupMap =
		lists:foldl(fun(Bson1, Map) ->
			Player_group_map = bson_to_player_group_map(Bson1),
			maps:put(Player_group_map#player_group_map.stage, Player_group_map, Map)
					end, maps:new(), GroupMapList),

	#player_honour_top{
		player_id = ?BSON_INT(Bson, player_id),
		is_robot = ?BSON_INT(Bson, is_robot),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		is_apply = ?BSON_INT(Bson, is_apply),
		is_worship = ?BSON_INT(Bson, is_worship),
		bet = ?BSON_INT(Bson, bet),
		group_map = GroupMap,
		hero_info = [lib_hero_api:bson_to_hero_base(BsonHeroBase) || BsonHeroBase <- ?BSON_LIST(Bson, hero_info)]
	}
.
player_group_map_to_bson(Player_group_map) ->
	#{
		?BSONSET_INT(stage, Player_group_map#player_group_map.stage),
		?BSONSET_INT(group, Player_group_map#player_group_map.group)
	}
.
bson_to_player_group_map(Bson)->
	#player_group_map{
		stage = ?BSON_INT(Bson, stage),
		group = ?BSON_INT(Bson, group)
	}
.

bet_to_bson(Bet) ->
	BsonPlayerBetList =
		maps:fold(fun(_, Player_bet, List) ->
			[player_bet_to_bson(Player_bet) | List]
		end, [], Bet#bet_map.player_bet),
	#{
		?BSONSET_INT(id, Bet#bet_map.id),
		?BSONSET_BSON(be_bet_show, lib_common:player_show_to_bson(Bet#bet_map.be_bet_show)),
		?BSONSET_INT(money, Bet#bet_map.money),
		?BSONSET_LIST(player_bet, BsonPlayerBetList)
	}
.
bson_to_bet(Bson) ->
	PlayerBetList = ?BSON_LIST(Bson, player_bet, []),
	PlayerBetMap =
		lists:foldl(fun(Bson1, Map) ->
			Player_bet = bson_to_player_bet(Bson1),
			maps:put(Player_bet#player_bet.player_id, Player_bet, Map)
		end, maps:new(), PlayerBetList),
	#bet_map{
		id = ?BSON_INT(Bson, id),
		be_bet_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, be_bet_show)),
		money = ?BSON_INT(Bson, money),
		player_bet = PlayerBetMap
	}
.
player_bet_to_bson(Player_bet) ->
	#{
		?BSONSET_INT(player_id, Player_bet#player_bet.player_id),
		?BSONSET_INT(bet_money, Player_bet#player_bet.bet_money)
	}
.
bson_to_player_bet(Bson)->
	#player_bet{
		player_id = ?BSON_INT(Bson, player_id),
		bet_money = ?BSON_INT(Bson, bet_money)
	}
.

stage_to_bson(Stage) ->
	BsonGroupList =
		maps:fold(fun(_, Group, List) ->
			[group_map_to_bson(Group) | List]
				  end, [], Stage#stage_map.group),
	#{
		?BSONSET_INT(stage, Stage#stage_map.stage),
		?BSONSET_LIST(group, BsonGroupList)
	}
.
bson_to_stage(Bson) ->
	GroupList = ?BSON_LIST(Bson, group, []),
	GroupMap =
		lists:foldl(fun(Bson1, Map) ->
			Group = bson_to_group_map(Bson1),
			maps:put(Group#group_map.group_id, Group, Map)
					end, maps:new(), GroupList),
	#stage_map{
		stage = ?BSON_INT(Bson, stage),
		group = GroupMap
	}
.
group_map_to_bson(Group) ->
	BsonPlayerGradeList =
		maps:fold(fun(_, PlayerGrade, List) ->
			[player_grade_to_bson(PlayerGrade) | List]
				  end, [], Group#group_map.player_grade_info),
	BsonReportList =
		maps:fold(fun(_, ReportMap, List) ->
			[report_map_to_bson(ReportMap)| List]
				  end, [], Group#group_map.report_map),
	#{
		?BSONSET_INT(group_id, Group#group_map.group_id),
		?BSONSET_LIST(player_grade_info, BsonPlayerGradeList),
		?BSONSET_LIST(report_map, BsonReportList)
	}
.
bson_to_group_map(Bson)->
	PlayerGradeList = ?BSON_LIST(Bson, player_grade_info, []),
	PlayerGradeMap =
		lists:foldl(fun(Bson1, Map) ->
			PlayerGrade = bson_to_player_grade(Bson1),
			maps:put(PlayerGrade#player_grade_info.player_id, PlayerGrade, Map)
					end, maps:new(), PlayerGradeList),
	ReportList = ?BSON_LIST(Bson, report_map, []),
	ReportMap =
		lists:foldl(fun(Bson2, Map) ->
			Report = bson_to_report_map(Bson2),
			maps:put(Report#report_map.times, Report, Map)
					end, maps:new(), ReportList),
	#group_map{
		group_id = ?BSON_INT(Bson, group_id),
		player_grade_info = PlayerGradeMap,
		report_map = ReportMap
	}
.
player_grade_to_bson(PlayerGrade) ->
	#{
		?BSONSET_INT(player_id, PlayerGrade#player_grade_info.player_id),
		?BSONSET_INT(rank, PlayerGrade#player_grade_info.rank),
		?BSONSET_INT(win, PlayerGrade#player_grade_info.win),
		?BSONSET_INT(lose, PlayerGrade#player_grade_info.lose)
	}
.
bson_to_player_grade(Bson)->
	#player_grade_info{
		player_id = ?BSON_INT(Bson, player_id),
		rank = ?BSON_INT(Bson, rank),
		win = ?BSON_INT(Bson, win),
		lose = ?BSON_INT(Bson, lose)
	}
.
report_map_to_bson(ReportMap) ->
	BsonReportsList =
		maps:fold(fun(_, Report, List) ->
			[report_to_bson(Report) | List]
				  end, [], ReportMap#report_map.reports),
	#{
		?BSONSET_INT(times, ReportMap#report_map.times),
		?BSONSET_LIST(reports, BsonReportsList)
	}
.
bson_to_report_map(Bson)->
	ReportsList = ?BSON_LIST(Bson, reports, []),
	ReportsMap =
		lists:foldl(fun(Bson1, Map) ->
			Reports = bson_to_report(Bson1),
			maps:put(Reports#report.id, Reports, Map)
					end, maps:new(), ReportsList),
	#report_map{
		times = ?BSON_INT(Bson, times),
		reports = ReportsMap
	}
.
report_to_bson(Report) ->
	#{
		?BSONSET_INT(id, Report#report.id),
		?BSONSET_INT(record_id, Report#report.record_id),
		?BSONSET_INT(l_id, Report#report.l_id),
		?BSONSET_BSON(l_show, lib_common:player_show_to_bson(Report#report.l_show)),
		?BSONSET_INT(r_id, Report#report.r_id),
		?BSONSET_BSON(r_show, lib_common:player_show_to_bson(Report#report.r_show)),
		?BSONSET_INT(win, Report#report.win)
	}
.
bson_to_report(Bson) ->
	#report{
		id = ?BSON_INT(Bson, id),
		record_id = ?BSON_INT(Bson, record_id),
		l_id = ?BSON_INT(Bson, l_id),
		l_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, l_show)),
		r_id = ?BSON_INT(Bson, r_id),
		r_show = lib_common:bson_to_player_show(?BSON_BSON(Bson, r_show)),
		win = ?BSON_INT(Bson, win)
	}
.

top_eight_to_bson(TopEight) ->
	#{
		?BSONSET_INT(rand, TopEight#top_eight.rand),
		?BSONSET_INT(player_id, TopEight#top_eight.player_id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(TopEight#top_eight.show)),
		?BSONSET_INT(show_hero_id, TopEight#top_eight.show_hero_id)
	}
.
bson_to_top_eight(Bson) ->
	#top_eight{
		rand = ?BSON_INT(Bson, rand),
		player_id = ?BSON_INT(Bson, player_id),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
		show_hero_id = ?BSON_INT(Bson, show_hero_id)
	}
.

%% ======================== %%
save_honour_top(Gather) when is_record(Gather, honour_top_gather) ->
	BsonPlayerList =
		maps:fold(fun(_, Player, List) ->
			[player_to_bson(Player) | List]
				  end, [], Gather#honour_top_gather.player_map),
	BsonBetList =
		maps:fold(fun(_, Bet, List) ->
			[bet_to_bson(Bet) | List]
				  end, [], Gather#honour_top_gather.bet_map),
	BsonStageList =
		maps:fold(fun(_, Stage, List) ->
			[stage_to_bson(Stage) | List]
				  end, [], Gather#honour_top_gather.stage_map),
	BsonTopEightList =
		maps:fold(fun(_, TopEight, List) ->
			[top_eight_to_bson(TopEight) | List]
				  end, [], Gather#honour_top_gather.top_eight),
	Bson =
		#{
			?BSONSET_INT(uid, 1),
			?BSONSET_INT(stage, Gather#honour_top_gather.stage),
			?BSONSET_INT(times, Gather#honour_top_gather.times),
			?BSONSET_LIST(player_map,  BsonPlayerList),
			?BSONSET_LIST(bet_map,  BsonBetList),
			?BSONSET_LIST(stage_map, BsonStageList),
			?BSONSET_INT(fight_mod, Gather#honour_top_gather.fight_mod),
			?BSONSET_INT(fight_group_id, Gather#honour_top_gather.fight_group_id),
			?BSONSET_INT(fight_report_id, Gather#honour_top_gather.fight_report_id),
			?BSONSET_LIST(fight_list, Gather#honour_top_gather.fight_list),
			?BSONSET_LIST(fight_over_list, Gather#honour_top_gather.fight_over_list),
			?BSONSET_INT(apply_num, Gather#honour_top_gather.apply_num),
			?BSONSET_LIST(top_eight, BsonTopEightList),
			?BSONSET_INT(is_fight, Gather#honour_top_gather.is_fight),
			?BSONSET_LIST(online_player, Gather#honour_top_gather.online_player)
		},
	QueryBson = #{
		?BSONSET_INT(uid, 1)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_HONOUR_TOP, QueryBson, Bson)

.

load_honour_top() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_HONOUR_TOP, #{?BSONSET_INT(uid, 1)}) of
		Res = #{} ->
			BsonPlayerList = ?BSON_LIST(Res, player_map, []),
			Player_map =
				lists:foldl(fun(Bson, Map) ->
					Player = bson_to_player(Bson),
					maps:put(Player#player_honour_top.player_id, Player, Map)
				end, maps:new(), BsonPlayerList),
			BsonBetList = ?BSON_LIST(Res, bet_map, []),
			Bet_map =
				lists:foldl(fun(Bson1, Map1) ->
					Bet = bson_to_bet(Bson1),
					maps:put(Bet#bet_map.id, Bet, Map1)
				end, maps:new(), BsonBetList),
			BsonStageList = ?BSON_LIST(Res, stage_map, []),
			Stage_map =
				lists:foldl(fun(Bson2, Map2) ->
					Stage = bson_to_stage(Bson2),
					maps:put(Stage#stage_map.stage, Stage, Map2)
				end, maps:new(), BsonStageList),
			BsonTopEightList = ?BSON_LIST(Res, top_eight, []),
			TopEightMap = lists:foldl(fun(Bson3, Map3) ->
				TopEight = bson_to_top_eight(Bson3),
				maps:put(TopEight#top_eight.rand, TopEight, Map3)
				end, maps:new(), BsonTopEightList),
			#honour_top_gather{
				stage = ?BSON_INT(Res, stage),
				times = ?BSON_INT(Res, times),
				player_map = Player_map,
				bet_map = Bet_map,
				stage_map = Stage_map,
				fight_mod = ?BSON_INT(Res, fight_mod),
				fight_group_id = ?BSON_INT(Res, fight_group_id),
				fight_report_id = ?BSON_INT(Res, fight_report_id),
				fight_list = ?BSON_LIST(Res, fight_list),
				fight_over_list = ?BSON_LIST(Res, fight_over_list),
				apply_num = ?BSON_INT(Res, apply_num),
				top_eight = TopEightMap,
				is_fight = ?BSON_INT(Res, is_fight),
				online_player = ?BSON_LIST(Res, online_player)
			};
		_ ->
			#honour_top_gather{
			}
	end
.