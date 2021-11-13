%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_op
%%% Created on : 2020/8/19 0019 11:43
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		联盟基本管理操作
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_league_op).
-author("glendy").
-include("common.hrl").
-include("league.hrl").
-include("ProtoClient_10106.hrl").

-define(UPDATE_LEAGUE_FORCE_FLAG, update_league_force_flag).

%% API
-export([
	daily_refresh/0,
	async_fetch_league_info/1,
	async_fetch_member_list/1,
	async_fetch_apply_list/1,
	async_prepare_league_apply/2,
	async_league_apply/2,
	async_league_apply_reply/3,
	async_league_join_list/4,
	async_league_quit/1,
	async_league_kick/2,
	async_league_dismiss/1,
	async_league_position/3,
	async_change_leader/2,
	async_change_notice/2,
	check_leader_offline_timeout/0
]).

-export([
	set_league_force_flag/1,
	get_league_force_flag/0,
	update_league_force/0,
	async_fetch_player_league_info/2,
	async_player_league_info/4
]).

%% 联盟每日刷新
daily_refresh() ->
	#league{
		daily_tick = DailyTick,
		member_map = MemberMap
	} = League = lib_league_base:get_league(),
	NowTick = lib_timer:unixtime(),
	if
		DailyTick =< NowTick ->
			lib_league_base:put_league(League#league{
				daily_tick = lib_timer:next_zero_unixtime()
			}, true),
			maps:fold(
				fun(MemberId, _, Acc0) ->
					case lib_league_base:get_member(MemberId) of
						undefined -> Acc0;
						Member ->
							NewMember = Member#league_member{
								position_times = 0
							},
							lib_league_base:put_member(NewMember, true),
							Acc0
					end
				end, ok, MemberMap);
		true -> skip
	end,
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 同步玩家的显示模型到联盟进程，进程同步更新玩家进程上的联盟信息
async_fetch_player_league_info(PlayerMember, OpType) ->
	PlayerId = PlayerMember#league_member.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	#league{
		member_map = MemberOnlineMap
	} = League = lib_league_base:get_league(),
	case lib_league_base:get_member(PlayerId) of
		#league_member{} = LeagueMember ->
			if
				OpType =:= ?LEAGUE_SYNC_LOGIN ->
					NewLeagueMember = sync_member_info(LeagueMember#league_member{
						online = 1
					}, PlayerMember),
					lib_league_base:put_member_with_ets(NewLeagueMember, false),
					NewLeague = League#league{
						member_map = maps:put(PlayerId, 1, MemberOnlineMap)
					},
					lib_league_base:put_league_with_ets(NewLeague, false),
					async_player_league_info(PlayerPid, NewLeague, NewLeagueMember#league_member.position, OpType);
				OpType =:= ?LEAGUE_SYNC_LOGOUT ->
					NewLeagueMember = sync_member_info(LeagueMember#league_member{
						online = 0,
						offline_tick = lib_timer:unixtime()
					}, PlayerMember),
					lib_league_base:put_member_with_ets(NewLeagueMember, true),
					NewLeague = League#league{
						member_map = maps:put(PlayerId, 0, MemberOnlineMap)
					},
					lib_league_base:put_league_with_ets(NewLeague, true);
				true ->
					NewLeagueMember = sync_member_info(LeagueMember, PlayerMember),
					lib_league_base:put_member(NewLeagueMember, false),
					async_player_league_info(PlayerPid, League, NewLeagueMember#league_member.position, OpType)
			end,
			check_update_league_force(LeagueMember, lib_league_base:get_member(PlayerId));
		_ ->
			mod_server:async_apply(PlayerPid, fun lib_player_league:async_league_info/5, [OpType, 0, "", 0, 0])
	end.

%% 同步联盟信息到玩家进程
%% OpType: 因何种操作而同步
async_player_league_info(PlayerPid, League, PlayerPosition, OpType) ->
	#league{
		id = LeagueId,
		name = LeagueName,
		level = LeagueLevel
	} = League,
	mod_server:async_apply(PlayerPid, fun lib_player_league:async_league_info/5, [OpType, LeagueId, LeagueName, LeagueLevel, PlayerPosition]).

sync_member_info(SyncMember, Member) ->
	{LeagueId, _} = SyncMember#league_member.ets_key,
	#'ProtoShowRole'{
		league_name = LeagueName
	} = SyncMember#league_member.player_show,
	ShowRole = Member#league_member.player_show,
	NewShowRole = ShowRole#'ProtoShowRole'{
		league_id = LeagueId,
		league_name = LeagueName,
		league_position = SyncMember#league_member.position
	},
	SyncMember#league_member{
		player_show = NewShowRole
	}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 获取联盟信息
async_fetch_league_info(PlayerId) ->
	daily_refresh(),
	League = lib_league_base:get_league(),
	LeaderMember = lib_league_base:get_member(League#league.leader_id),
	SelfMember = lib_league_base:get_member(PlayerId),
	Respond = #'Proto50106002'{
		league = lib_league_base:serialize_proto_league(League),
		notice = League#league.notice,
		leader_show = LeaderMember#league_member.player_show,
		self_position = SelfMember#league_member.position
	},
	?DEBUG("league info: ~p ~w", [PlayerId, Respond]),
	PlayerPid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(PlayerPid, Respond).

%% 获取成员列表
async_fetch_member_list(PlayerId) ->
	daily_refresh(),
	League = lib_league_base:get_league(),
	ProtoMemberList = maps:fold(
		fun(MemberId, _, AccProtpList0) ->
			case lib_league_base:get_member(MemberId) of
				undefined -> AccProtpList0;
				Member ->
					Proto = lib_league_base:serialize_proto_member(Member),
					[Proto | AccProtpList0]
			end
		end, [], League#league.member_map),
	Respond = #'Proto50106010'{
		member_list = ProtoMemberList
	},
	?DEBUG("league member list: ~w", [Respond]),
	PlayerPid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(PlayerPid, Respond).

%% 获取申请列表
async_fetch_apply_list(PlayerId) ->
	daily_refresh(),
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		validate_league_right(PlayerId, ?LEAGUE_RIGHT_APPLY),
		#league{
			apply_map = ApplyMap
		} = lib_league_base:get_league(),
		ProtoMemberList = maps:fold(
			fun(_, Member, AccProtoMemberList0) ->
				Proto = lib_league_base:serialize_proto_member(Member),
				[Proto | AccProtoMemberList0]
			end, [], ApplyMap),
		Respond = #'Proto50106014'{
			apply_list = ProtoMemberList
		},
		?DEBUG("league apply list: ~w", [Respond]),
		lib_send:respond_to_client_by_pid(PlayerPid, Respond)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_APPLY_LIST, ErrCode)
	end.

async_prepare_league_apply(ReqMember, OpType) ->
	daily_refresh(),
	PlayerId = ReqMember#league_member.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		apply_map = ApplyMap,
		member_map = MemberMap
	} = lib_league_base:get_league(),
	try
		?JUDGE_RETURN(maps:is_key(PlayerId, ApplyMap) =:= false, ?ERROR_LEAGUE_HAS_APPLY),
		validate_member_size(maps:size(MemberMap), LeagueLevel),
		mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_check_league_apply/4, [ReqMember, OpType, LeagueId]),
	    ok
	catch
	    throw:{error, ErrCode} ->
			if
				OpType =:= ?APPLY_LEAGUE_SINGLE ->
					lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_CLIENT_LEAGUE_APPLY, ErrCode);
				true -> skip
			end
	end.

%% TODO 自动加入联盟逻辑
async_league_apply(ReqMember, OpType) ->
	daily_refresh(),
	PlayerId = ReqMember#league_member.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	#league{
		level = LeagueLevel,
		apply_map = ApplyMap,
		member_map = MemberMap
	} = League = lib_league_base:get_league(),
	try
		?JUDGE_RETURN(maps:is_key(PlayerId, ApplyMap) =:= false, ?ERROR_LEAGUE_HAS_APPLY),
		validate_member_size(maps:size(MemberMap), LeagueLevel),
		NewApplyMap = maps:put(PlayerId, ReqMember, ApplyMap),
		NewLeague = League#league{
			apply_map = NewApplyMap
		},
		lib_league_base:put_league(NewLeague, true),
		if
			OpType =:= ?APPLY_LEAGUE_SINGLE ->
				lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_APPLY);
			true -> skip
		end,
		lib_league_listen:do_listen_league_apply(ReqMember, NewLeague)
	catch
	    throw:{error, ErrCode} ->
			if
				OpType =:= ?APPLY_LEAGUE_SINGLE ->
					lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_APPLY, ErrCode);
				true -> skip
			end
	end.

%% 审核申请
async_league_apply_reply(ReqPlayerId, OpType, ApplyId) ->
	daily_refresh(),
	ReqPlayerPid = lib_player:get_pid(ReqPlayerId),
	#league{
		id = LeagueId,
		level = LeagueLevel,
		apply_map = ApplyMap,
		member_map = MemberMap
	} = League = lib_league_base:get_league(),
	try
		validate_league_right(ReqPlayerId, ?LEAGUE_RIGHT_APPLY),
		case OpType of
			?REPLY_APPLY_LEAGUE_DISAGREE_ONE ->
				NewApplyMap = maps:remove(ApplyId, ApplyMap),
				NewLeague = League#league{
					apply_map = NewApplyMap
				},
				lib_league_base:put_league(NewLeague, true),
				case maps:is_key(ApplyId, ApplyMap) of
					true -> lib_league_listen:do_listen_league_apply_reject(ReqPlayerId, NewLeague, OpType, ApplyId);
					_ -> skip
				end,
				lib_send:respond_to_client_by_pid(ReqPlayerPid, ?MSG_RETURN_LEAGUE_APPLY_REPLY);
			?REPLY_APPLY_LEAGUE_DISAGREE_ALL ->
				?JUDGE_RETURN(maps:size(ApplyMap) > 0, ?ERROR_LEAGUE_APPLY_NULL),
				NewLeague = League#league{
					apply_map = #{}
				},
				lib_league_base:put_league(NewLeague, true),
				lib_send:respond_to_client_by_pid(ReqPlayerPid, ?MSG_RETURN_LEAGUE_APPLY_REPLY),
				lib_league_listen:do_listen_league_apply_reject(ReqPlayerId, NewLeague, OpType, 0);
			?REPLY_APPLY_LEAGUE_AGREE_ONE ->
				validate_member_size(maps:size(MemberMap), LeagueLevel),
				?JUDGE_RETURN(maps:is_key(ApplyId, ApplyMap) =:= true, ?ERROR_INVALID_PARAM),
				ApplyMember = maps:get(ApplyId, ApplyMap),
				mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_check_join_list/5, [ReqPlayerId, LeagueId, [{ApplyId, ApplyMember}], OpType]);
			?REPLY_APPLY_LEAGUE_AGREE_ALL ->
				validate_member_size(maps:size(MemberMap), LeagueLevel),
				mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_check_join_list/5, [ReqPlayerId, LeagueId, maps:to_list(ApplyMap), OpType]);
			_ -> throw({error, ?ERROR_INVALID_PARAM})
		end,
		ok
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(ReqPlayerPid, ?MSG_RETURN_LEAGUE_APPLY_REPLY, ErrCode)
	end.

%% 申请检查通过, 处理申请者加入联盟的逻辑
async_league_join_list(ReqPlayerId, ApplyList, RemoveList, OpType) ->
	daily_refresh(),
	League = lib_league_base:get_league(),
	{NewLeague0, FailApplyIdList} = do_join_league(ReqPlayerId, League, [], ApplyList, OpType),
	NewApplyMap0 = lists:foldl(
		fun({RemoveId, _ }, AccApplyMap0) ->
			maps:remove(RemoveId, AccApplyMap0)
		end, NewLeague0#league.apply_map, RemoveList),
	NewLeague = NewLeague0#league{
		apply_map = NewApplyMap0
	},
	case length(ApplyList) > 0 orelse length(RemoveList) > 0 of
		true -> lib_league_base:put_league_with_ets(NewLeague, true);
		_ -> skip
	end,
	ReqPlayerPid = lib_player:get_pid(ReqPlayerId),
	if
		OpType =:= ?REPLY_APPLY_LEAGUE_AGREE_ONE orelse OpType =:= ?REPLY_APPLY_LEAGUE_AGREE_ALL ->
			lib_send:respond_to_client_by_pid(ReqPlayerPid, ?MSG_RETURN_LEAGUE_APPLY_REPLY);
		true ->
			skip
	end,
	case length(FailApplyIdList) > 0 of
		true ->
			mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_remove_wait_join/2, [FailApplyIdList]);
		_ -> skip
	end.

do_join_league(_ReqPlayerId, League, FailApplyIdList, [], _OpType) ->
	{League, FailApplyIdList};
do_join_league(ReqPlayerId, League, FailApplyIdList, [{MemberId, ApplyMember} | T], OpType) ->
	#league{
		level = LeagueLevel,
		apply_map = ApplyMap,
		member_map = MemberMap
	} = League,
	try
		validate_member_size(maps:size(MemberMap), LeagueLevel),
		NewLeague = do_join_member(ReqPlayerId, League, ApplyMember, OpType),
	    do_join_league(ReqPlayerId, NewLeague, FailApplyIdList, T, OpType)
	catch
	    throw:{error, _ErrCode}  ->
			do_join_league(ReqPlayerId, League#league{apply_map = maps:remove(MemberId, ApplyMap)}, [MemberId | FailApplyIdList], T, OpType)
	end.

%% 退出联盟
async_league_quit(PlayerId) ->
	daily_refresh(),
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		#league{
			id = LeagueId,
			leader_id = LeaderId
		} = League = lib_league_base:get_league(),
		?JUDGE_RETURN(LeaderId =/= PlayerId, ?ERROR_LEADER_QUIT),
		lib_league_base:remove_member(PlayerId),
		mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_quit_league/4, [LeagueId, PlayerId, ?LEAGUE_SYNC_QUIT]),
		mod_server:async_apply(PlayerPid, fun lib_player_league:async_league_info/5, [?LEAGUE_SYNC_QUIT, 0, "", 0, 0]),
		lib_league_op:set_league_force_flag(1),
	    lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_QUIT),
		lib_league_listen:do_listen_league_quit(PlayerId, League)
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_QUIT, ErrCode)
	end.

%% 逐出玩家
async_league_kick(PlayerId, MemberId) ->
	daily_refresh(),
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		#league{
			id = LeagueId,
			leader_id = LeaderId
		} = League = lib_league_base:get_league(),
		?JUDGE_RETURN(LeaderId =/= MemberId, ?ERROR_LEADER_QUIT),
		validate_league_right(PlayerId, ?LEAGUE_RIGHT_KICK),
		KickMember = lib_league_base:get_member(MemberId),
		lib_league_base:remove_member(MemberId),
		mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_quit_league/4, [LeagueId, MemberId, ?LEAGUE_SYNC_KICK]),
		case lib_player:is_player_process_alive(MemberId) of
			true ->
				MemberPid = lib_player:get_pid(MemberId),
				mod_server:async_apply(MemberPid, fun lib_player_league:async_league_info/5, [?LEAGUE_SYNC_KICK, 0, "", 0, 0]);
			_ -> skip
		end,
		lib_league_op:set_league_force_flag(1),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_KICK),
		lib_league_listen:do_listen_league_kick(PlayerId, League, KickMember)
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_KICK, ErrCode)
	end.

%% 解散联盟
async_league_dismiss(PlayerId) ->
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		validate_league_right(PlayerId, ?LEAGUE_RIGHT_DISMISS),
	    do_dimiss_league()
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_DIMISS, ErrCode)
	end.

%% 任命职位
async_league_position(PlayerId, MemberId, Position) ->
	daily_refresh(),
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		case Position of
			?LEAGUE_POS_ASSISTANT ->
				validate_league_right(PlayerId, ?LEAGUE_RIGHT_SET_ASSISTANT),
				validate_assistant_amount();
			?LEAGUE_POS_ELITE ->
				validate_league_right(PlayerId, ?LEAGUE_RIGHT_SET_ELITE);
			?LEAGUE_POS_MEMBER ->
				validate_league_right(PlayerId, ?LEAGUE_RIGHT_SET_MEMBER);
			_ ->
				throw({error, ?ERROR_INVALID_PARAM})
		end,
		validate_position_modify_times(MemberId),
		Member = lib_league_base:get_member(MemberId),
		do_change_position(MemberId, Position),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_POSITION),
		lib_league_listen:do_listen_change_position(PlayerId, MemberId, Member#league_member.position, Position)
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_POSITION, ErrCode)
	end.

%% 转让会长
async_change_leader(PlayerId, MemberId) ->
	daily_refresh(),
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		validate_league_right(PlayerId, ?LEAGUE_RIGHT_CHANGE_LEADER),
		Member = lib_league_base:get_member(MemberId),
		?JUDGE_RETURN(Member =/= undefined, ?ERROR_NO_LEAGUE_MEMBER),
		#league{
			member_map = MemberMap
		} = lib_league_base:get_league(),
		?JUDGE_RETURN(maps:is_key(MemberId, MemberMap) =:= true, ?ERROR_NO_LEAGUE_MEMBER),
		do_change_leader(MemberId),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_LEADER)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_LEADER, ErrCode)
	end.

%% 联盟公告修改
async_change_notice(PlayerId, Notice) ->
	daily_refresh(),
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		validate_league_right(PlayerId, ?LEAGUE_RIGHT_CHANGE_NOTICE),
		League = lib_league_base:get_league(),
		NewLeague = League#league{
			notice = Notice
		},
		lib_league_base:put_league(NewLeague, true),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_NOTICE),
		lib_league_listen:do_listen_league_notice(PlayerId, NewLeague)
	catch
		throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_NOTICE, ErrCode)
	end.

%% 会长下线时间检查自动换会长
check_leader_offline_timeout() ->
	try
		#{value:=LeaderOfflineSec} = tb_league_const:get(leader_offline),
		#league{
			id = LeagueId,
			leader_id = LeaderId,
			member_map = MemberMap
		} = lib_league_base:get_league(),
		LeaderMember = lib_league_base:get_member(LeaderId),
		?JUDGE_RETURN(LeaderMember#league_member.online =:= 0, -1),
		NowTick = lib_timer:unixtime(),
		?JUDGE_RETURN((LeaderMember#league_member.offline_tick + LeaderOfflineSec) =< NowTick, -1),
		MemberList = fetch_member_canbe_leader([], LeaderId, maps:to_list(MemberMap)),
		SortMemberList = lists:sort(fun member_be_leader_cmp/2, MemberList),
		?JUDGE_RETURN(length(SortMemberList) > 0, -1),
		FirstMember = lists:nth(1, SortMemberList),
		?INFO("leader offline change: ~p ~p ~p", [LeagueId, LeaderId, FirstMember#league_member.id]),
		do_change_leader(FirstMember#league_member.id),
		ok
	catch
	    throw:{error, _} -> skip
	end.
fetch_member_canbe_leader(MemberList, _LeaderId, []) ->
	MemberList;
fetch_member_canbe_leader(MemberList, LeaderId, [{LeaderId, _} | T]) ->
	fetch_member_canbe_leader(MemberList, LeaderId, T);
fetch_member_canbe_leader(MemberList, LeaderId, [{MemberId, _} | T]) ->
	case lib_league_base:get_member(MemberId) of
		#league_member{online = Online, offline_tick = OfflineTick} = Member ->
			#{value:=MaxOfflineSec} = tb_league_const:get(auto_leader_offline),
			NowTick = lib_timer:unixtime(),
			if
				Online =:= 1 orelse (OfflineTick + MaxOfflineSec) > NowTick ->
					fetch_member_canbe_leader([Member | MemberList], LeaderId, T);
				true ->
					fetch_member_canbe_leader(MemberList, LeaderId, T)
			end;
		_ ->
			fetch_member_canbe_leader(MemberList, LeaderId, T)
	end.

set_league_force_flag(Val) ->
	erlang:put(?UPDATE_LEAGUE_FORCE_FLAG, Val).

get_league_force_flag() ->
	case erlang:get(?UPDATE_LEAGUE_FORCE_FLAG) of
		undefined -> 0;
		Val -> Val
	end.

update_league_force() ->
	#league{
		force = PrevForce,
		member_map = MemberMap
	} = League = lib_league_base:get_league(),
	TotalForce = maps:fold(
		fun(MemberId, _, AccForce0) ->
			case lib_league_base:get_member(MemberId) of
				#league_member{player_show = Show} ->
					Show#'ProtoShowRole'.force + AccForce0;
				_ -> AccForce0
			end
		end, 0, MemberMap),
	lib_league_base:put_league(League#league{
		force = TotalForce
	}, true),
	if
		PrevForce =/= TotalForce ->
			lib_league_listen:do_listen_league_force(PrevForce, TotalForce);
		true -> skip
	end,
	ok.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 判断成员权限
validate_league_right(PlayerId, Right) ->
	Member = lib_league_base:get_member(PlayerId),
	?JUDGE_RETURN(Member =/= undefined, ?ERROR_LEAGUE_POSITION_RIGHT),
	Position = Member#league_member.position,
	FieldName = lib_types:to_atom("pos_" ++ lib_types:to_list(Position)),
	Conf = tb_league_right:get(Right),
	?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),
	Value = maps:get(FieldName, Conf, 0),
	?JUDGE_RETURN(Value =:= 1, ?ERROR_LEAGUE_POSITION_RIGHT).

%% 判断成员数量
validate_member_size(CurMemberSize, LeagueLevel) ->
	#{max_member:=MaxMember} = tb_league_level:get(LeagueLevel),
	?JUDGE_RETURN(CurMemberSize < MaxMember, ?ERROR_LEAGUE_FULL).

%% 判断副会长数量
validate_assistant_amount() ->
	Amount = lib_league_base:get_position_amount(?LEAGUE_POS_ASSISTANT),
	#{value:=MaxAmount} = tb_league_const:get(assistant_amount),
	?JUDGE_RETURN(Amount < MaxAmount, ?ERROR_MAX_LEAGUE_ASSISTANT).

validate_position_modify_times(MemberId) ->
	Member = lib_league_base:get_member(MemberId),
	?JUDGE_RETURN(Member =/= undefined, ?ERROR_NO_LEAGUE_MEMBER),
	Times = Member#league_member.position_times,
	#{value:=MaxTimes} = tb_league_const:get(change_position_times),
	?JUDGE_RETURN(Times < MaxTimes, ?ERROR_LEAGUE_POSITION_TIMES).

member_be_leader_cmp(LeftMember, RightMember) ->
	#league_member{id = LeftId, position = LeftPosition, offline_tick = LeftOfflineTick, player_show = LeftShow, join_tick = LeftJoinTick} = LeftMember,
	#'ProtoShowRole'{force = LeftForce} = LeftShow,
	#league_member{id = RightId, position = RightPosition, offline_tick = RightOfflineTick, player_show = RightShow, join_tick = RightJoinTick} = RightMember,
	#'ProtoShowRole'{force = RightForce} = RightShow,
	try
		?JUDGE_RETURN(LeftPosition =:= RightPosition, LeftPosition < RightPosition),
		?JUDGE_RETURN(LeftForce =:= RightForce, LeftForce > RightForce),
		?JUDGE_RETURN(LeftOfflineTick =:= RightOfflineTick, LeftOfflineTick > RightOfflineTick),
		?JUDGE_RETURN(LeftJoinTick =:= RightJoinTick, LeftJoinTick < RightJoinTick),
	    LeftId < RightId
	catch
	    throw:{error, Flag} -> Flag
	end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 成员加入逻辑
do_join_member(ReqPlayerId, League, ApplyMember, _OpType) ->
	#league{
		id = LeagueId,
		name = LeagueName,
		apply_map = ApplyMap,
		member_map = MemberMap
	} = League,
	MemberId = ApplyMember#league_member.id,
	NewApplyMap = maps:remove(MemberId, ApplyMap),
	{MemberOnline, MemberOfflineTick} =
		case lib_player:is_player_process_alive(MemberId) of
			true ->
				async_player_league_info(lib_player:get_pid(MemberId), League, ?LEAGUE_POS_MEMBER, ?LEAGUE_SYNC_JOIN),
				{1, 0};
			_ ->
				{0, lib_timer:unixtime()}
		end,
	NewMemberMap = maps:put(MemberId, MemberOnline, MemberMap),
	MemberShow = ApplyMember#league_member.player_show,
	NewMember = ApplyMember#league_member{
		ets_key = {LeagueId, MemberId},
		player_show = MemberShow#'ProtoShowRole'{league_id = LeagueId, league_name = LeagueName, league_position = ?LEAGUE_POS_MEMBER},
		online = MemberOnline,
		offline_tick = MemberOfflineTick,
		position = ?LEAGUE_POS_MEMBER,
		join_tick = lib_timer:unixtime()
	},
	lib_league_base:put_member_with_ets(NewMember, true),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_join_member/3, [LeagueId, MemberId]),
	lib_league_op:set_league_force_flag(1),
	NewLeague = League#league{
		apply_map = NewApplyMap,
		member_map = NewMemberMap
	},
	lib_league_listen:do_listen_league_apply_agree(ReqPlayerId, NewLeague, MemberId),
	NewLeague.

do_dimiss_league() ->
	#league{
		id = LeagueId,
		leader_id = LeaderId,
		name = LeagueName,
		member_map = MemberMap
	} = League = lib_league_base:get_league(),
	MemberIdList = maps:fold(
		fun(MemberId, _, AccMemberIdList0) ->
			case lib_player:is_player_process_alive(MemberId) of
				true ->
					MemberPid = lib_player:get_pid(MemberId),
					mod_server:async_apply(MemberPid, fun lib_player_league:async_league_info/5, [?LEAGUE_SYNC_DISMISS, 0, "", 0, 0]);
				_ -> skip
			end,
			[MemberId | AccMemberIdList0]
		end, [], MemberMap),
	ets:delete(?ETS_LEAGUE, LeagueId),
	lib_league_base:put_league(League#league{is_remove = 1}, true),
	mod_league:stop(LeagueId),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_dismiss_league/4, [LeagueId, LeagueName, MemberIdList]),
	lib_league_listen:do_listen_league_dimiss(LeaderId, League).

do_change_position(MemberId, Position) ->
	try
		Member = lib_league_base:get_member(MemberId),
		?JUDGE_RETURN(Member =/= undefined, -1),
		?JUDGE_RETURN(Member#league_member.position =/= Position, -1),
		NewMember = Member#league_member{
			position = Position
		},
		lib_league_base:put_member_with_ets(NewMember, true),
	    ok
	catch
	    throw:{error, _} -> skip
	end.

do_change_leader(MemberId) ->
	#league{
		leader_id = LeaderId
	} = League = lib_league_base:get_league(),
	lib_league_base:put_league_with_ets(League#league{
		leader_id = MemberId
	}, true),
	do_change_position(MemberId, ?LEAGUE_POS_LEADER),
	do_change_position(LeaderId, ?LEAGUE_POS_MEMBER),
	lib_league_listen:do_listen_change_leader(LeaderId, MemberId).

check_update_league_force(#league_member{player_show = OrgShow}, #league_member{player_show = NewShow}) ->
	if
		OrgShow#'ProtoShowRole'.force =/= NewShow#'ProtoShowRole'.force ->
			set_league_force_flag(1);
		true -> skip
	end.
