%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_serial
%%% Created on : 2020/9/15 0015 11:40
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_league_serial).
-author("glendy").
-include("common.hrl").
-include("league.hrl").
-include("ProtoPublic.hrl").

%% API
-export([
	serial_league_create/2,
	serial_league_apply/2,
	serial_league_apply_agree/3,
	serial_league_apply_disagree/3,
	serial_quit_league/2,
	serial_league_kick/3,
	serial_league_dismiss/2,
	serial_league_position/5,
	serial_league_change_leader/2,
	serial_league_notice/2
]).

serial_league_create(LeaderId, League) ->
	#league_member{
		player_show = LeaderShow
	} = lib_league_base:get_member(LeaderId),
	LeaderName = LeaderShow#'ProtoShowRole'.name,
	lib_serial_api:serial_league(LeaderId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_CREATE}),
	lib_serial_api:serial_operate(LeaderShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_CREATE}, 0, 0, League#league.id).

serial_league_apply(Member, League) ->
	#league_member{
		id = PlayerId,
		player_show = ReqPlayerShow
	} = Member,
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(PlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_APPLY}),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		leader_id = LeaderId,
		member_map = MemberMap
	} = League,
	lib_serial_api:serial_operate(ReqPlayerShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_APPLY}, 0, 0,
		LeagueId, LeaderId, 0, LeagueLevel, maps:size(MemberMap)).

serial_league_apply_agree(PlayerId, League, MemberId) ->
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(PlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_JOIN}, MemberId),
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(PlayerId),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_JOIN}, 0, 0,
		LeagueId, MemberId, 0, LeagueLevel, maps:size(MemberMap)).

serial_league_apply_disagree(PlayerId, League, ApplyId) ->
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(PlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_REJECT_JOIN}, ApplyId),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(PlayerId),
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_REJECT_JOIN}, 0, 0,
		LeagueId, ApplyId, 0, LeagueLevel, maps:size(MemberMap)).

serial_quit_league(PlayerId, League) ->
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(PlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_QUIT}),
	#league_member{
		player_show = OpShow,
		position = OpPosition
	} = lib_league_base:get_member(PlayerId),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_QUIT}, 0, 0,
		LeagueId, 0, OpPosition, LeagueLevel, maps:size(MemberMap)).

serial_league_kick(PlayerId, League, KickMember) ->
	#league_member{
		id = MemberId,
		position = KickPosition
	} = KickMember,
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(PlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_KICK}, MemberId),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(PlayerId),
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_KICK}, 0, 0,
		LeagueId, MemberId, KickPosition, LeagueLevel, maps:size(MemberMap)).

serial_league_dismiss(LeaderId, League) ->
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(LeaderId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_DISMISS}),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(LeaderId),
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_DISMISS}, 0, 0,
		LeagueId, 0, 0, LeagueLevel, maps:size(MemberMap)).

serial_league_position(ReqPlayerId, League, MemberId, OldPosition, NewPosition) ->
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(ReqPlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_POSITION}, MemberId, NewPosition, OldPosition),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(ReqPlayerId),
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_POSITION}, 0, 0,
		LeagueId, MemberId, NewPosition, LeagueLevel, maps:size(MemberMap)).

serial_league_change_leader(LeaderId, MemberId) ->
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League = lib_league_base:get_league(),
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(LeaderId),
	LeaderName = OpShow#'ProtoShowRole'.name,
	lib_serial_api:serial_league(LeaderId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_LEADER}, MemberId),
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_LEADER}, 0, 0,
		LeagueId, MemberId, 0, LeagueLevel, maps:size(MemberMap)).

serial_league_notice(PlayerId, League) ->
	LeaderName = lib_league_base:get_leader_name(),
	lib_serial_api:serial_league(PlayerId, League, LeaderName, #serial_obj{insert_serial_type = ?SERIAL_LEAGUE_NOTICE}),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		member_map = MemberMap
	} = League,
	#league_member{
		player_show = OpShow
	} = lib_league_base:get_member(PlayerId),
	lib_serial_api:serial_operate(OpShow, #serial_obj{insert_serial_type = ?SERIAL_OP_LEAGUE_NOTICE}, 0, 0,
		LeagueId, 0, 0, LeagueLevel, maps:size(MemberMap)).


