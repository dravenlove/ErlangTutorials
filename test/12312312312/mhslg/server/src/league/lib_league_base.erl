%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_base
%%% Created on : 2020/8/15 0015 13:07
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		联盟基础信息的同步与获取
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_league_base).
-author("glendy").
-include("common.hrl").
-include("league.hrl").
-include("ProtoClient_10106.hrl").

%% API
-export([
	show_role_to_member/2,
	put_league/2,
	get_league/0,
	get_member/1,
	put_member/2,
	remove_member/1,
	get_leader_name/0,
	get_member_name/1,
	put_league_with_ets/2,
	put_member_with_ets/2,
	serialize_proto_league/1,
	serialize_proto_member/1,
	get_position_amount/1,
	get_position_name/1
]).

-export([
]).

-export([
]).

show_role_to_member(LeagueId, ShowRole) ->
	PlayerId = ShowRole#'ProtoShowRole'.id,
	#league_member{
		ets_key = {LeagueId, PlayerId},
		id = PlayerId,
		player_show = ShowRole
	}.

%% 用于需要即时保存ets的地方
put_league_with_ets(League, IsSaveDb) ->
	ets:insert(?ETS_LEAGUE, League),
	put_league(League, IsSaveDb).
%% 定时写入ets和数据库
put_league(League, IsSaveDb) ->
	if
		IsSaveDb =:= true -> erlang:put(?LEAGUE_CACHE_UPDATE_FLAG, 1);
		true -> skip
	end,
	erlang:put(?ETS_LEAGUE, League).
get_league() ->
	erlang:get(?ETS_LEAGUE).

get_member(MemberId) ->
	erlang:get({?ETS_LEAGUE_MEMBER, MemberId}).
%% 定时写入ets和数据库
put_member(Member, IsSaveDb) ->
	if
		IsSaveDb =:= true -> erlang:put(?LEAGUE_CACHE_UPDATE_FLAG, 1);
		true -> skip
	end,
	MemberId = Member#league_member.id,
	erlang:put({?ETS_LEAGUE_MEMBER, MemberId}, Member).

%% 用于需要即时保存ets的地方
put_member_with_ets(Member, IsSaveDb) ->
	ets:insert(?ETS_LEAGUE_MEMBER, Member),
	put_member(Member, IsSaveDb).

remove_member(MemberId) ->
	#league{
		id = LeagueId,
		member_map = MemberMap
	} = League = get_league(),
	case maps:is_key(MemberId, MemberMap) of
		true ->
			NewLeague = League#league{
				member_map = maps:remove(MemberId, MemberMap)
			},
			ets:delete(?ETS_LEAGUE_MEMBER, {LeagueId, MemberId}),
			put_league_with_ets(NewLeague, true);
		_ -> skip
	end,
	erlang:erase({?ETS_LEAGUE_MEMBER, MemberId}).

get_leader_name() ->
	#league{
		leader_id = LeaderId
	} = get_league(),
	get_member_name(LeaderId).

get_member_name(MemberId) ->
	case get_member(MemberId) of
		#league_member{
			player_show = PlayerShow
		} ->
			PlayerShow#'ProtoShowRole'.name;
		_ ->
			""
	end.

serialize_proto_league(League) ->
	#{max_member:=MaxMember} = tb_league_level:get(League#league.level),
	#'ProtoLeague'{
		id = League#league.id,
		name = League#league.name,
		level = League#league.level,
		member_amount = maps:size(League#league.member_map),
		max_member = MaxMember,
		force = League#league.force,
		rank = 0,
		has_apply = 0
	}.

serialize_proto_member(Member) ->
	#'ProtoLeagueMember'{
		show = Member#league_member.player_show,
		online = Member#league_member.online,
		offline_tick = Member#league_member.offline_tick,
		position = Member#league_member.position
	}.

%% 获取某个职位的成员数量
get_position_amount(Position) ->
	#league{
		member_map = MemberMap
	} = get_league(),
	maps:fold(
		fun(MemberId, _, AccAmount0) ->
			case get_member(MemberId) of
				#league_member{position = Position} ->
					AccAmount0 + 1;
				_ -> AccAmount0
			end
		end, 0, MemberMap).

%% 获取职位的名字
get_position_name(Position) ->
	#{jsonvalue:=NameList} = tb_league_const:get(position_name),
	case 1 =< Position andalso Position =< length(NameList) of
		true -> lists:nth(Position, NameList);
		_ -> ""
	end.
