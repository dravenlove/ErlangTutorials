%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_log
%%% Created on : 2020/8/31 0031 14:38
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_league_log).
-author("glendy").
-include("common.hrl").
-include("league.hrl").
-include("ProtoClient_10106.hrl").

-define(LEAGUE_LOG_LIST, league_log_list).

%% API
-export([
	get_league_log_list/0,
	put_league_log_list/1,
	insert_league_log/3,
	insert_create_log/2,
	insert_join_log/3,
	insert_exit_league_log/2,
	insert_position_change_log/4,
	insert_change_leader_log/2,
	async_fetch_log_list/1
]).

get_league_log_list() ->
	case erlang:get(?LEAGUE_LOG_LIST) of
		undefined -> [];
		Val -> Val
	end.

put_league_log_list(LogList) ->
	erlang:put(?LEAGUE_LOG_LIST, LogList).

insert_league_log(ReqMember, LogType, Args) ->
	#{content:=ContentFmt} = tb_league_log:get(LogType),
	Content = lib_types:to_list(lib_common:format_chinese(ContentFmt, Args)),
	Show = ReqMember#league_member.player_show,
	LeagueLog = #league_log{
		type = LogType,
		player_id = ReqMember#league_member.id,
		player_name = Show#'ProtoShowRole'.name,
		content = Content,
		log_tick = lib_timer:unixtime()
	},
	LeagueLogList = get_league_log_list(),
	LogSize = length(LeagueLogList),
	#{value:=MaxLogSize} = tb_league_const:get(max_log_size),
	NewLeagueLogList =
		if
			LogSize >= MaxLogSize ->
				[LeagueLog | lists:split(MaxLogSize - 1, LeagueLogList)];
			true ->
				[LeagueLog | LeagueLogList]
		end,
	put_league_log_list(NewLeagueLogList).

%% 创建联盟日志
insert_create_log(LeaderId, _League) ->
	#league_member{player_show = Show} = LeaderMember = lib_league_base:get_member(LeaderId),
	LeaderName = Show#'ProtoShowRole'.name,
	insert_league_log(LeaderMember, ?LEAGUE_LOG_CREATE, [LeaderName]).

%% 加入联盟日志
insert_join_log(PlayerId, _League, MemberId) ->
	ReqMember = lib_league_base:get_member(PlayerId),
	JoinMemberName = lib_league_base:get_member_name(MemberId),
	insert_league_log(ReqMember, ?LEAGUE_LOG_JOIN, [JoinMemberName]).

%% 退出联盟日志
insert_exit_league_log(PlayerId, ExitMemberId) ->
	ReqMember = lib_league_base:get_member(PlayerId),
	ExitMemberName = lib_league_base:get_member_name(ExitMemberId),
	insert_league_log(ReqMember, ?LEAGUE_LOG_EXIT, [ExitMemberName]).

%% 职位变化的日志
insert_position_change_log(ReqPlayerId, MemberId, OldPosition, NewPosition) ->
	ReqMember = lib_league_base:get_member(ReqPlayerId),
	LogType =
		if
			OldPosition < NewPosition -> ?LEAGUE_LOG_POS_DOWN;
			true -> ?LEAGUE_LOG_POS_UP
		end,
	PosMemberName = lib_league_base:get_member_name(MemberId),
	PositionName = lib_league_base:get_position_name(NewPosition),
	insert_league_log(ReqMember, LogType, [PosMemberName, PositionName]).

%% 转让会长日志
insert_change_leader_log(LeaderId, MemberId) ->
	OrgLeaderMember = lib_league_base:get_member_name(LeaderId),
	OrgLeaderName = lib_league_base:get_member_name(LeaderId),
	NewLeadername = lib_league_base:get_member_name(MemberId),
	insert_league_log(OrgLeaderMember, ?LEAGUE_LOG_LEADER, [OrgLeaderName, NewLeadername]).

%% 请求日志列表信息
async_fetch_log_list(PlayerId) ->
	LogList = get_league_log_list(),
	ProtoLogList = serialize_log_list(LogList),
	Respond = #'Proto50106015'{
		log_list = ProtoLogList
	},
	?DEBUG("league log: ~p ~w", [PlayerId, Respond]),
	PlayerPid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(PlayerPid, Respond).

serialize_log_list(LogList) ->
	serialize_log_list([], LogList).
serialize_log_list(ProtoLogList, []) ->
	lists:reverse(ProtoLogList);
serialize_log_list(ProtoLogList, [LeagueLog | T]) ->
	Proto = serialize_league_log(LeagueLog),
	serialize_log_list([Proto | ProtoLogList], T).

serialize_league_log(LeagueLog) ->
	#'ProtoLeagueLog'{
		log_tick = LeagueLog#league_log.log_tick,
		type = LeagueLog#league_log.type,
		player_id = LeagueLog#league_log.player_id,
		player_name = LeagueLog#league_log.player_name,
		content = LeagueLog#league_log.content
	}.

