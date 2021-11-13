%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_manager
%%% Created on : 2020/8/18 0018 15:42
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		mod_league_manager进程里的处理逻辑模块
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_league_manager).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("league.hrl").
-include("ProtoClient_10106.hrl").

-define(WAIT_CREATE_LEAGUE_TIMEOUT_SEC, 120).
-define(WAIT_APPLY_LEAGUE_TIMEOUT_SEC, 60).

%% API
-export([
	async_check_league_create/3,
	async_league_create/4,
	async_fetch_player_league_info/3,
	async_fetch_all_league/2,
	async_check_league_apply/4,
	async_apply_all_league/4,
	async_check_join_list/5,
	async_join_member/3,
	async_remove_wait_join/2,
	async_quit_league/4,
	async_dismiss_league/4
]).

async_check_league_create(State, PlayerId, LeagueName) ->
	#league_manage_state{
		wait_create_league_map = WaitCreateMap,
		player_league_map = PlayerLeagueMap,
		league_name_id_map = LeagueNameMap
	} = State,
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		?JUDGE_RETURN(maps:is_key(PlayerId, WaitCreateMap) =:= false, ?ERROR_OPERATE_TOO_FAST),
		?JUDGE_RETURN(maps:is_key(PlayerId, PlayerLeagueMap) =:= false, ?ERROR_HAVE_LEAGUE),
		?JUDGE_RETURN(maps:is_key(LeagueName, LeagueNameMap) =:= false, ?ERROR_LEAGUE_NAME_EXISTS),
		LeagueId = lib_counter:get_league_id(),
		NewPlayerLeagueMap = maps:put(PlayerId, LeagueId, PlayerLeagueMap),
		NewLeagueNameMap = maps:put(LeagueName, LeagueId, LeagueNameMap),
		WaitLeague = #wait_league{
			creater_id = PlayerId,
			league_id = LeagueId,
			league_name = LeagueName,
			timeout_tick = lib_timer:unixtime() + ?WAIT_CREATE_LEAGUE_TIMEOUT_SEC
		},
		NewWaitCreateMap = maps:put(PlayerId, WaitLeague, WaitCreateMap),
		mod_server:async_apply(PlayerPid, fun lib_player_league:async_league_create_check/0),
		{ok, State#league_manage_state{
			wait_create_league_map = NewWaitCreateMap,
			player_league_map = NewPlayerLeagueMap,
			league_name_id_map = NewLeagueNameMap
		}}
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_CREATE, ErrCode)
	end.

async_league_create(State, ShowRole, AgentCode, Market) ->
	PlayerId = ShowRole#'ProtoShowRole'.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	#league_manage_state{
		wait_create_league_map = WaitCreateMap,
		player_league_map = PlayerLeagueMap,
		league_name_id_map = LeagueNameMap,
		league_id_name_map = LeagueIdMap
	} = State,
	try
		?JUDGE_RETURN(maps:is_key(PlayerId, WaitCreateMap), ?ERROR_OPERATE_TIMEOUT),
		#wait_league{
			league_id = LeagueId,
			league_name = LeagueName
		} = maps:get(PlayerId, WaitCreateMap),
		League = do_create_league(LeagueId, LeagueName, ShowRole, AgentCode, Market),
		lib_league_op:async_player_league_info(PlayerPid, League, ?LEAGUE_POS_LEADER, ?LEAGUE_SYNC_CREATE),
		NewWaitCreateMap = maps:remove(PlayerId, WaitCreateMap),
		NewPlayerLeagueMap = maps:put(PlayerId, LeagueId, PlayerLeagueMap),
		NewLeagueNameMap = maps:put(LeagueName, LeagueId, LeagueNameMap),
		NewLeagueIdMap = maps:put(LeagueId, LeagueName, LeagueIdMap),
		{ok, State#league_manage_state{
			wait_create_league_map = NewWaitCreateMap,
			player_league_map = NewPlayerLeagueMap,
			league_name_id_map = NewLeagueNameMap,
			league_id_name_map = NewLeagueIdMap
		}}
	catch
	    throw:{error, ErrCode} ->
			lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_CREATE, ErrCode)
	end.

async_fetch_player_league_info(State, PlayerMember, OpType) ->
	try
		#league_manage_state{
			player_league_map = PlayerLeagueMap
		} = State,
		PlayerId = PlayerMember#league_member.id,
		case maps:is_key(PlayerId, PlayerLeagueMap) of
			true ->
				LeagueId = maps:get(PlayerId, PlayerLeagueMap),
				mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_fetch_player_league_info/2, [PlayerMember, OpType]);
			_ ->
				?JUDGE_RETURN(OpType =/= ?LEAGUE_SYNC_LOGOUT, -1),
				PlayerPid = lib_player:get_pid(PlayerId),
				mod_server:async_apply(PlayerPid, fun lib_player_league:async_league_info/5, [OpType, 0, "", 0, 0])
		end
	catch
	    throw:{error, _ErrCode} -> skip
	end.

async_fetch_all_league(State, PlayerId) ->
	#league_manage_state{
		league_id_name_map = LeagueIdMap
	} = State,
	ProtoLeagueList = maps:fold(
		fun(LeagueId, _, AccProtoLeagueList0) ->
			case lib_game_cache:get_league_cache(LeagueId) of
				undefined -> AccProtoLeagueList0;
				League ->
					ProtoLeague = lib_league_base:serialize_proto_league(League),
					%% TODO 设置has_apply字段
					[ProtoLeague | AccProtoLeagueList0]
			end
		end, [], LeagueIdMap),
	%% TODO 排序后设置rank字段
	Respond = #'Proto50106001'{
		league_list = ProtoLeagueList
	},
	?DEBUG("league list: ~w", [Respond]),
	PlayerPid = lib_player:get_pid(PlayerId),
	lib_send:respond_to_client_by_pid(PlayerPid, Respond).

%% 检查是否可以申请该联盟
async_check_league_apply(State, ReqMember, OpType, LeagueId) ->
	#league_manage_state{
		player_league_map = PlayerLeagueMap
	} = State,
	PlayerId = ReqMember#league_member.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		?JUDGE_RETURN(maps:is_key(PlayerId, PlayerLeagueMap) =:= false, ?ERROR_HAVE_LEAGUE),
		mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_apply/2, [ReqMember, OpType]),
		ok
	catch
	    throw:{error, ErrCode} ->
			if
				OpType =:= ?APPLY_LEAGUE_SINGLE ->
					lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_APPLY, ErrCode);
				true -> skip
			end
	end.

%% 处理一键申请逻辑
async_apply_all_league(State, ReqMember, KickLeagueMap, OpType) ->
	#league_manage_state{
		league_id_name_map = LeagueIdMap,
		player_league_map = PlayerLeagueMap
	} = State,
	PlayerId = ReqMember#league_member.id,
	PlayerPid = lib_player:get_pid(PlayerId),
	try
		?JUDGE_RETURN(maps:is_key(PlayerId, PlayerLeagueMap) =:= false, ?ERROR_HAVE_LEAGUE),
		maps:fold(
			fun(LeagueId, _, Acc0) ->
				try
					lib_player_league:validate_kick_tick(LeagueId, KickLeagueMap),
					mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_apply/2, [ReqMember, OpType]),
					Acc0
				catch
				    throw:{error, _} -> Acc0
				end
			end, ok, LeagueIdMap),
		lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_APPLY)
	catch
		throw:{error, ErrCode} -> lib_send:respond_to_client_by_pid(PlayerPid, ?MSG_RETURN_LEAGUE_APPLY, ErrCode)
	end.

%% 检查申请列表
async_check_join_list(State, ReqPlayerId, LeagueId, MemberList, OpType) ->
	async_check_join_list(State, ReqPlayerId, LeagueId, [], [], MemberList, OpType).
async_check_join_list(State, ReqPlayerId, LeagueId, ApplyList, RemoveList, [], OpType) ->
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_join_list/4, [ReqPlayerId, ApplyList, RemoveList, OpType]),
	{ok, State};
async_check_join_list(State, ReqPlayerId, LeagueId, ApplyList, RemoveList, [{MemberId, _Member} = Item | T], OpType) ->
	#league_manage_state{
		player_league_map = PlayerLeagueMap,
		wait_join_map = WaitJoinMap
	} = State,
	{NewState, NewApplyList, NewRemoveList} =
		case maps:is_key(MemberId, PlayerLeagueMap) =:= false andalso maps:is_key(MemberId, WaitJoinMap) =:= false of
			true ->
				WaitJoinLeague = #wait_join_league{
					apply_id = MemberId,
					league_id = LeagueId,
					timeout_tick = lib_timer:unixtime() + ?WAIT_APPLY_LEAGUE_TIMEOUT_SEC
				},
				NewState0 = State#league_manage_state{
					wait_join_map = maps:put(MemberId, WaitJoinLeague, WaitJoinMap)
				},
				{NewState0, [Item | ApplyList], RemoveList};
			_ ->
				{State, ApplyList, [Item | RemoveList]}
		end,
	async_check_join_list(NewState, ReqPlayerId, LeagueId, NewApplyList, NewRemoveList, T, OpType).

%% 新加入联盟的玩家更新state
async_join_member(State, LeagueId, MemberId) ->
	#league_manage_state{
		player_league_map = PlayerLeagueMap,
		wait_join_map = WaitJoinMap
	} = State,
	NewPlayerLeagueMap = maps:put(MemberId, LeagueId, PlayerLeagueMap),
	NewWaitJoinMap = maps:remove(MemberId, WaitJoinMap),
	{ok, State#league_manage_state{
		player_league_map = NewPlayerLeagueMap,
		wait_join_map = NewWaitJoinMap
	}}.

%% 删除失败玩家的加入
async_remove_wait_join(State, FailApplyIdList) ->
	#league_manage_state{
		wait_join_map = WaitJoinMap
	} = State,
	NewWaitJoinMap = lists:foldl(
		fun(MemberId, AccWaitJoinMap0) ->
			maps:remove(MemberId, AccWaitJoinMap0)
		end, WaitJoinMap, FailApplyIdList),
	{ok, State#league_manage_state{
		wait_join_map = NewWaitJoinMap
	}}.

%% 退出联盟删除相关信息
async_quit_league(State, LeagueId, PlayerId, _OpType) ->
	#league_manage_state{
		player_league_map = PlayerLeagueMap
	} = State,
	OrgLeagueId = maps:get(PlayerId, PlayerLeagueMap, 0),
	NewPlayerLeagueMap =
		if
			OrgLeagueId =:= LeagueId -> maps:remove(PlayerId, PlayerLeagueMap);
			true -> PlayerLeagueMap
		end,
	{ok, State#league_manage_state{
		player_league_map = NewPlayerLeagueMap
	}}.

%% 解散联盟时删除相关信息
async_dismiss_league(State, LeagueId, LeagueName, MemberIdList) ->
	#league_manage_state{
		league_id_name_map = LeagueIdMap,
		league_name_id_map = LeagueNameMap,
		player_league_map = PlayerLeagueMap,
		wait_join_map = WaitJoinMap
	} = State,
	NewLeagueIdMap = maps:remove(LeagueId, LeagueIdMap),
	NewLeagueNameMap = maps:remove(LeagueName, LeagueNameMap),
	{NewPlayerLeagueMap, NewWaitJoinMap} = lists:foldl(
		fun(MemberId, {AccPlayerLeagueMap0, AccWaitJoinMap0}) ->
			OrgLeagueId = maps:get(MemberId, AccPlayerLeagueMap0, 0),
			if
				OrgLeagueId =:= LeagueId ->
					{maps:remove(MemberId, AccPlayerLeagueMap0), maps:remove(MemberId, AccWaitJoinMap0)};
				true ->
					{AccPlayerLeagueMap0, AccWaitJoinMap0}
			end
		end, {PlayerLeagueMap, WaitJoinMap}, MemberIdList),
	{ok, State#league_manage_state{
		league_id_name_map = NewLeagueIdMap,
		league_name_id_map = NewLeagueNameMap,
		player_league_map = NewPlayerLeagueMap,
		wait_join_map = NewWaitJoinMap
	}}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_create_league(LeagueId, LeagueName, ShowRole, AgentCode, Market) ->
	#'ProtoShowRole'{
		id = PlayerId,
		force = Force,
		server_flag = ServerFlag
	} = ShowRole,
	League = #league{
		id = LeagueId,
		name = LeagueName,
		level = 1,
		exp = 0,
		force = Force,
		server_flag = ServerFlag,
		agent_code = AgentCode,
		market = Market,
		member_map = maps:put(PlayerId, 1, #{}),
		leader_id = PlayerId
	},
	LeagueMember = lib_league_base:show_role_to_member(LeagueId, ShowRole),
	NewLeagueMember = LeagueMember#league_member{
		online = 1,
		position = ?LEAGUE_POS_LEADER,
		player_show = ShowRole#'ProtoShowRole'{league_id = LeagueId, league_name = LeagueName, league_position = ?LEAGUE_POS_LEADER},
		join_tick = lib_timer:unixtime()
	},
	ets:insert(?ETS_LEAGUE, League),
	ets:insert(?ETS_LEAGUE_MEMBER, NewLeagueMember),
	db_league:save_league(League, [NewLeagueMember], true),
	ProcessName = mod_league:get_process_name(LeagueId),
	server_sup:start_child(ProcessName, mod_league, start_link, [LeagueId, true]),
	League.
