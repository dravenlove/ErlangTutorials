%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_league
%%% Created on : 2020/8/15 0015 13:07
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_league).
-author("glendy").
-include("log.hrl").
-include("mongodb.hrl").
-include("league.hrl").

%% API
-export([
	load_player_league/1,
	save_player_league/1,
	save_league/3,
	save_league/4,
	load_league/1,
	load_all_league_for_manage/0
]).

load_player_league(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_LEAGUE, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			bson_to_player_league(Bson);
		_ ->
			#player_league{id = PlayerId}
	end.

save_player_league(PlayerLeague) ->
	PlayerId = PlayerLeague#player_league.id,
	Bson = player_league_to_bson(PlayerLeague),
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_LEAGUE,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson}).

save_league(League, MemberList, IsBlock) ->
	save_league(League, MemberList, [], IsBlock).
save_league(League, MemberList, LogList, IsBlock) ->
	LeagueId = League#league.id,
	Bson = league_to_bson(League, MemberList, LogList),
	if
		IsBlock =:= true ->
			mongo_poolboy:update(?MMO_POOL, ?DBLEAGUE,
				#{?BSONSET_INT(<<"id">>, LeagueId)},
				#{<<"$set">> => Bson});
		true ->
			mongo_poolboy:async_update(?MMO_POOL, ?DBLEAGUE,
				#{?BSONSET_INT(<<"id">>, LeagueId)},
				#{<<"$set">> => Bson})
	end.

%% 返回:{League, LeagueMemberList}
load_league(LeagueId) ->
	?DEBUG("load league db: ~p", [LeagueId]),
	case mongo_poolboy:find_one(?MMO_POOL, ?DBLEAGUE, #{?BSONSET_INT(<<"id">>, LeagueId)}) of
		Bson = #{} ->
			bson_to_league_and_members(Bson);
		_ ->
			{#league{id = LeagueId}, [], []}
	end.

%% 返回: {LeagueIdMap, LeagueNameMap, PlayerLeagueMap}
load_all_league_for_manage() ->
	case mongo_poolboy:find(?MMO_POOL, ?DBLEAGUE, #{?BSONSET_INT(<<"is_remove">>, 0)}) of
		BsonList = [_ | _] ->
			lists:foldl(
				fun(LeagueBson, {AccLeagueIdMap0, AccLeagueNameMap0, AccPlayerLeagueMap0}) ->
					LeagueId = ?BSON_INT(LeagueBson, <<"id">>),
					LeagueName = ?BSON_STRING(LeagueBson, <<"name">>),
					AccLeagueIdMap1 = maps:put(LeagueId, LeagueName, AccLeagueIdMap0),
					AccLeagueNameMap1 = maps:put(LeagueName, LeagueId, AccLeagueNameMap0),
					MemberBsonList = ?BSON_LIST(LeagueBson, <<"member">>),
					AccPlayerLeagueMap1 = lists:foldl(
						fun(MemberBson, AccAccPlayerLeagueMap0) ->
							MemberId = ?BSON_INT(MemberBson, <<"id">>),
							maps:put(MemberId, LeagueId, AccAccPlayerLeagueMap0)
						end, AccPlayerLeagueMap0, MemberBsonList),
					{AccLeagueIdMap1, AccLeagueNameMap1, AccPlayerLeagueMap1}
				end, {#{}, #{}, #{}}, BsonList);
		_ -> {#{}, #{}, #{}}
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bson_to_player_league(Bson) ->
	#player_league{
		id = ?BSON_INT(Bson, <<"id">>),
		league_id = ?BSON_INT(Bson, <<"league_id">>),
		league_name = ?BSON_STRING(Bson, <<"league_name">>),
		league_level = ?BSON_INT(Bson, <<"league_level">>),
		league_position = ?BSON_INT(Bson, <<"league_position">>),
		daily_tick = ?BSON_INT(Bson, <<"daily_tick">>),
		join_league_times = ?BSON_INT(Bson, <<"join_league_times">>),
		quit_league_tick = ?BSON_INT(Bson, <<"quit_league_tick">>),
		kick_league_map = lib_mongodb:bson_list_to_kvmap(?BSON_LIST(Bson, <<"kick_league_map">>))
	}.

player_league_to_bson(PlayerLeague) ->
	#{
		?BSONSET_INT(<<"id">>, PlayerLeague#player_league.id),
		?BSONSET_INT(<<"league_id">>, PlayerLeague#player_league.league_id),
		?BSONSET_STRING(<<"league_name">>, PlayerLeague#player_league.league_name),
		?BSONSET_INT(<<"league_level">>, PlayerLeague#player_league.league_level),
		?BSONSET_INT(<<"league_position">>, PlayerLeague#player_league.league_position),
		?BSONSET_INT(<<"daily_tick">>, PlayerLeague#player_league.daily_tick),
		?BSONSET_INT(<<"join_league_times">>, PlayerLeague#player_league.join_league_times),
		?BSONSET_INT(<<"quit_league_tick">>, PlayerLeague#player_league.quit_league_tick),
		?BSONSET_LIST(<<"kick_league_map">>, lib_mongodb:kvmap_to_bson_list(PlayerLeague#player_league.kick_league_map))
	}.

league_to_bson(League, MemberList, LogList) ->
	#{
		?BSONSET_INT(<<"id">>, League#league.id),
		?BSONSET_STRING(<<"name">>, League#league.name),
		?BSONSET_INT(<<"level">>, League#league.level),
		?BSONSET_INT(<<"exp">>, League#league.exp),
		?BSONSET_STRING(<<"notice">>, League#league.notice),
		?BSONSET_INT(<<"force">>, League#league.force),
		?BSONSET_STRING(<<"server_flag">>, League#league.server_flag),
		?BSONSET_INT(<<"agent_code">>, League#league.agent_code),
		?BSONSET_INT(<<"market">>, League#league.market),
		?BSONSET_INT(<<"leader_id">>, League#league.leader_id),
		?BSONSET_INT(<<"is_remove">>, League#league.is_remove),
		?BSONSET_LIST(<<"member">>, member_list_to_bson_list(League#league.id, MemberList)),
		?BSONSET_LIST(<<"apply">>, member_map_to_bson_list(League#league.apply_map)),
		?BSONSET_LIST(<<"log">>, log_list_to_bson_list(LogList))
	}.

member_list_to_bson_list(LeagueId, MemberList) ->
	member_list_to_bson_list([], LeagueId, MemberList).
member_list_to_bson_list(BsonList, _LeagueId, []) ->
	BsonList;
member_list_to_bson_list(BsonList, LeagueId, [Member | T]) ->
	Bson = member_to_bson(Member),
	member_list_to_bson_list([Bson | BsonList], LeagueId, T).

member_to_bson(Member) ->
	{LeagueId, _} = Member#league_member.ets_key,
	#{
		?BSONSET_INT(<<"id">>, Member#league_member.id),
		?BSONSET_INT(<<"league_id">>, LeagueId),
		?BSONSET_BSON(<<"player_show">>, lib_player:show_role_to_bson(Member#league_member.player_show)),
		?BSONSET_INT(<<"online">>, Member#league_member.online),
		?BSONSET_INT(<<"offline_tick">>, Member#league_member.offline_tick),
		?BSONSET_INT(<<"position">>, Member#league_member.position),
		?BSONSET_INT(<<"join_tick">>, Member#league_member.join_tick),
		?BSONSET_INT(<<"position_times">>, Member#league_member.position_times)
	}.

member_map_to_bson_list(MemberMap) ->
	maps:fold(
		fun(_, Member, AccBsonList0) ->
			Bson = member_to_bson(Member),
			[Bson | AccBsonList0]
		end, [], MemberMap).

log_list_to_bson_list(LogList) ->
	log_list_to_bson_list([], LogList).
log_list_to_bson_list(BsonList, []) ->
	BsonList;
log_list_to_bson_list(BsonList, [LeagueLog | T]) ->
	Bson = league_log_to_bson(LeagueLog),
	log_list_to_bson_list([Bson | BsonList], T).

league_log_to_bson(LeagueLog) ->
	#{
		?BSONSET_INT(<<"type">>, LeagueLog#league_log.type),
		?BSONSET_INT(<<"player_id">>, LeagueLog#league_log.player_id),
		?BSONSET_STRING(<<"player_name">>, LeagueLog#league_log.player_name),
		?BSONSET_STRING(<<"content">>, LeagueLog#league_log.content),
		?BSONSET_INT(<<"log_tick">>, LeagueLog#league_log.log_tick)
	}.

bson_to_league_and_members(Bson) ->
	{MemberList, MemberMap} = bson_list_to_member_list(?BSON_LIST(Bson, <<"member">>)),
	LogList = bson_list_to_log_list(?BSON_LIST(Bson, <<"log">>)),
	League = #league{
		id = ?BSON_INT(Bson, <<"id">>),
		name = ?BSON_STRING(Bson, <<"name">>),
		level = ?BSON_INT(Bson, <<"level">>),
		exp = ?BSON_INT(Bson, <<"exp">>),
		notice = ?BSON_STRING(Bson, <<"notice">>),
		force = ?BSON_INT(Bson, <<"force">>),
		server_flag = ?BSON_STRING(Bson, <<"server_flag">>),
		agent_code = ?BSON_INT(Bson, <<"agent_code">>),
		market = ?BSON_INT(Bson, <<"market">>),
		leader_id = ?BSON_INT(Bson, <<"leader_id">>),
		is_remove = ?BSON_INT(Bson, <<"is_remove">>),
		member_map = MemberMap,
		apply_map = bson_list_to_member_map(?BSON_LIST(Bson, <<"apply">>))
	},
	{League, MemberList, LogList}.

bson_list_to_member_list(BsonList) ->
	bson_list_to_member_list([], #{}, BsonList).
bson_list_to_member_list(MemberList, MemberMap, []) ->
	{MemberList, MemberMap};
bson_list_to_member_list(MemberList, MemberMap, [Bson | T]) ->
	Member = bson_to_member(Bson),
	NewMemberList = [Member | MemberList],
	NewMemberMap = maps:put(Member#league_member.id, 0, MemberMap),
	bson_list_to_member_list(NewMemberList, NewMemberMap, T).

bson_to_member(Bson) ->
	LeagueId = ?BSON_INT(Bson, <<"league_id">>),
	MemberId = ?BSON_INT(Bson, <<"id">>),
	Online = ?BSON_INT(Bson, <<"online">>),
	OfflineTick =
		if
			Online =:= 1 -> lib_timer:unixtime();
			true -> ?BSON_INT(Bson, <<"offline_tick">>)
		end,
	#league_member{
		ets_key = {LeagueId, MemberId},
		id = MemberId,
		player_show = lib_player:bson_to_show_role(?BSON_BSON(Bson, <<"player_show">>)),
		online = 0,
		offline_tick = OfflineTick,
		position = ?BSON_INT(Bson, <<"position">>),
		join_tick = ?BSON_INT(Bson, <<"join_tick">>),
		position_times = ?BSON_INT(Bson, <<"position_times">>)
	}.

bson_list_to_member_map(BsonList) ->
	bson_list_to_member_map(#{}, BsonList).
bson_list_to_member_map(MemberMap, []) ->
	MemberMap;
bson_list_to_member_map(MemberMap, [Bson | T]) ->
	Member = bson_to_member(Bson),
	NewMemberMap = maps:put(Member#league_member.id, Member, MemberMap),
	bson_list_to_member_map(NewMemberMap, T).

bson_list_to_log_list(BsonList) ->
	bson_list_to_log_list([], BsonList).
bson_list_to_log_list(LogList, []) ->
	LogList;
bson_list_to_log_list(LogList, [Bson | T]) ->
	LeagueLog = bson_to_league_log(Bson),
	bson_list_to_log_list([LeagueLog | LogList], T).

bson_to_league_log(Bson) ->
	#league_log{
		type = ?BSON_INT(Bson, <<"type">>),
		player_id = ?BSON_INT(Bson, <<"player_id">>),
		player_name = ?BSON_STRING(Bson, <<"player_name">>),
		content = ?BSON_STRING(Bson, <<"content">>),
		log_tick = ?BSON_INT(Bson, <<"log_tick">>)
	}.

