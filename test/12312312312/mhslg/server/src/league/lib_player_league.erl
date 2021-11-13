%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_league
%%% Created on : 2020/8/15 0015 13:07
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_league).
-author("glendy").
-include("common.hrl").
-include("player.hrl").
-include("league.hrl").
-include("ProtoClient_10106.hrl").

%% API
-export([
	put_player_league/2,
	get_player_league/0,
	ets_init/0,
	build_index/0,
	player_league_handler/0,
	league_id/0,
	league_name/0,
	league_level/0,
	league_position/0
]).

-export([
	sign_in/0,
	sign_out/0,
	request_league_list/0,
	request_league_info/0,
	request_league_create/1,
	async_league_create_check/0,
	async_league_info/5,
	request_league_apply/1,
	request_league_apply_reply/1,
	request_league_quit/0,
	request_league_kick/1,
	request_league_dismiss/0,
	request_league_member_list/0,
	request_league_position/1,
	request_league_change_leader/1,
	request_league_notice/1,
	request_league_apply_list/0,
	request_league_log_list/0
]).

-export([
	validate_kick_tick/2,
	async_league_member_show/0,
	test_league_command/4
]).

put_player_league(PlayerLeague, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_LEAGUE),
	erlang:put(?ETS_PLAYER_LEAGUE, PlayerLeague).

get_player_league() ->
	erlang:get(?ETS_PLAYER_LEAGUE).

ets_init() ->
	ets:new(?ETS_PLAYER_LEAGUE, [?ETS_KEY_POS(#player_league.id) | ?ETS_OPTIONS]),
	ets:new(?ETS_LEAGUE, [?ETS_KEY_POS(#league.id) | ?ETS_OPTIONS]),
	ets:new(?ETS_LEAGUE_MEMBER, [?ETS_KEY_POS(#league_member.ets_key) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_LEAGUE, {?TUPLE_INT(<<"id">>, 1)}, true),
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBLEAGUE, {?TUPLE_INT(<<"id">>, 1)}, true),
	ok.

player_league_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_LEAGUE,
		table_name = ?DBPLAYER_LEAGUE,
		table_player_field = <<"id">>,
		ets_init_func = fun lib_player_league:ets_init/0,
		mongo_index_func = fun lib_player_league:build_index/0,
		load_func = fun db_league:load_player_league/1,
		save_func = fun db_league:save_player_league/1,
		get_func = fun lib_player_league:get_player_league/0,
		put_func = fun lib_player_league:put_player_league/2
	}.

league_id() ->
	PlayerLeague = get_player_league(),
	PlayerLeague#player_league.league_id.
league_name() ->
	PlayerLeague = get_player_league(),
	PlayerLeague#player_league.league_name.
league_level() ->
	PlayerLeague = get_player_league(),
	PlayerLeague#player_league.league_level.
league_position() ->
	PlayerLeague = get_player_league(),
	PlayerLeague#player_league.league_position.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 客户端请求接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 登录
sign_in() ->
	LeagueMember = lib_league_base:show_role_to_member(league_id(), lib_player:serialize_show_role()),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_fetch_player_league_info/3, [LeagueMember, ?LEAGUE_SYNC_LOGIN]),
	ok.

%% 登出
sign_out() ->
	LeagueMember = lib_league_base:show_role_to_member(league_id(), lib_player:serialize_show_role()),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_fetch_player_league_info/3, [LeagueMember, ?LEAGUE_SYNC_LOGOUT]),
	ok.

%% 联盟列表
request_league_list() ->
	daily_refresh(),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_fetch_all_league/2, [lib_player:player_id()]).

%% 联盟界面信息
request_league_info() ->
	daily_refresh(),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_fetch_league_info/1, [lib_player:player_id()]).

%% 创建联盟
request_league_create(Msg) ->
	daily_refresh(),
	#'Proto10106003'{name = LeagueName} = Msg,
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId =< 0, ?ERROR_HAVE_LEAGUE),
	#{value:=MaxNameLen} = tb_league_const:get(max_name_len),
	?JUDGE_RETURN(length(LeagueName) =< MaxNameLen, ?ERROR_LEAGUE_NAME_LEN),
	#{jsonvalue:= [UseItemId, UseItemAmount]} = tb_league_const:get(create_use),
	Ret0 = lib_player_pack:validate_remove(#item{item_id = UseItemId, amount = UseItemAmount}),
	?JUDGE_RETURN(Ret0 =:= ?PACK_SUCCESS, Ret0),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_check_league_create/3, [lib_player:player_id(), LeagueName]).
async_league_create_check() ->
	#{jsonvalue:= [UseItemId, UseItemAmount]} = tb_league_const:get(create_use),
	lib_player_pack:auto_remove(#item{item_id = UseItemId, amount = UseItemAmount},
		#serial_obj{remove_serial_type = ?USE_LEAGUE_CREATE}, true, ?PACK_TIPS1),
	PlayerBase = lib_player:get_player_base(),
	ShowRole = lib_player:serialize_show_role(),
	mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_league_create/4, [ShowRole, PlayerBase#player_base.agent_code, PlayerBase#player_base.market]).

%% 同步更新玩家进程的联盟信息
async_league_info(OpType, LeagueId, LeagueName, LeagueLevel, PlayerPosition) ->
	daily_refresh(),
	PlayerLeague = get_player_league(),
	NewJoinTimes = update_join_times(PlayerLeague, OpType),
	NewQuitTick = update_quit_tick(PlayerLeague, OpType),
	NewKickTickMap = update_kick_tick(PlayerLeague, PlayerLeague#player_league.league_id, OpType),
	NewPlayerLeague = PlayerLeague#player_league{
		league_id = LeagueId,
		league_name = LeagueName,
		league_level = LeagueLevel,
		league_position = PlayerPosition,
		join_league_times = NewJoinTimes,
		quit_league_tick = NewQuitTick,
		kick_league_map = NewKickTickMap
	},
	put_player_league(NewPlayerLeague, true),
%%	?DEBUG("sync player league: ~p ~p ~p ~ts ~p ~p", [PlayerLeague#player_league.id, OpType, LeagueId, LeagueName, LeagueLevel, PlayerPosition]),
	mod_server:async_status(mod_chat:get_pid(), fun lib_chat:async_league_info/6, [lib_player:player_id(), LeagueId, LeagueName, LeagueLevel, PlayerPosition]),
	if
		LeagueId =/= PlayerLeague#player_league.league_id ->
			lib_player_league_listen:listen_player_league_change(OpType, PlayerLeague, NewPlayerLeague);
		true -> skip
	end,
	if
		PlayerPosition =/= PlayerLeague#player_league.league_position ->
			lib_player_league_listen:listen_player_position_change(OpType, PlayerLeague, NewPlayerLeague);
		true -> skip
	end,
	if
		LeagueLevel =/= PlayerLeague#player_league.league_level ->
			lib_player_league_listen:listen_league_level_change(OpType, PlayerLeague, NewPlayerLeague);
		true -> skip
	end,
	if
		LeagueName =/= PlayerLeague#player_league.league_name ->
			lib_player_league_listen:listen_league_name_change(OpType, PlayerLeague, NewPlayerLeague);
		true -> skip
	end,
	notify_league_info().

%% 申请加入联盟
request_league_apply(Msg) ->
	daily_refresh(),
	#'Proto10106004'{type = Type, league_id = LeagueId} = Msg,
	?JUDGE_RETURN(league_id() =< 0, ?ERROR_HAVE_LEAGUE),
	PlayerLeague = get_player_league(),
	validate_join_times(PlayerLeague),
	validate_quit_tick(PlayerLeague),
	if
		Type =:= 0 ->
			validate_kick_tick(LeagueId, PlayerLeague#player_league.kick_league_map),
			LeaguePid = mod_league:get_pid(LeagueId),
			?JUDGE_RETURN(erlang:is_pid(LeaguePid) andalso erlang:is_process_alive(LeaguePid), ?ERROR_LEAGUE_NO_EXISTS),
			SelfMember = lib_league_base:show_role_to_member(LeagueId, lib_player:serialize_show_role()),
			mod_server:async_apply(LeaguePid, fun lib_league_op:async_prepare_league_apply/2, [SelfMember, ?APPLY_LEAGUE_SINGLE]);
		true ->
			SelfMember = lib_league_base:show_role_to_member(LeagueId, lib_player:serialize_show_role()),
			mod_server:async_status(mod_league_manager:get_pid(), fun lib_league_manager:async_apply_all_league/4, [SelfMember, PlayerLeague#player_league.kick_league_map, ?APPLY_LEAGUE_ALL])
	end,
	ok.

%% 回复申请加入联盟
request_league_apply_reply(Msg) ->
	daily_refresh(),
	#'Proto10106005'{type = Type, player_id = PlayerId} = Msg,
	?JUDGE_RETURN(1 =< Type andalso Type =< 4, ?ERROR_INVALID_PARAM),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_apply_reply/3, [lib_player:player_id(), Type, PlayerId]).

%% 主动退出联盟
request_league_quit() ->
	daily_refresh(),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_quit/1, [lib_player:player_id()]).

%% 踢某个玩家出联盟
request_league_kick(Msg) ->
	daily_refresh(),
	#'Proto10106007'{member_id = MemberId} = Msg,
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_kick/2, [lib_player:player_id(), MemberId]).

%% 解散联盟
request_league_dismiss() ->
	daily_refresh(),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_dismiss/1, [lib_player:player_id()]).

%% 成员列表
request_league_member_list() ->
	daily_refresh(),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_fetch_member_list/1, [lib_player:player_id()]).

%% 任命职位
request_league_position(Msg) ->
	daily_refresh(),
	#'Proto10106011'{member_id = MemberId, position = Position} = Msg,
	PlayerId = lib_player:player_id(),
	?JUDGE_RETURN(PlayerId =/= MemberId, ?ERROR_INVALID_PARAM),
	?JUDGE_RETURN(Position =/= ?LEAGUE_POS_LEADER, ?ERROR_INVALID_PARAM),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_league_position/3, [PlayerId, MemberId, Position]).

%% 转让会长
request_league_change_leader(Msg) ->
	daily_refresh(),
	#'Proto10106012'{member_id = MemberId} = Msg,
	PlayerId = lib_player:player_id(),
	?JUDGE_RETURN(PlayerId =/= MemberId, ?ERROR_INVALID_PARAM),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_change_leader/2, [PlayerId, MemberId]).

%% 修改联盟公告
request_league_notice(Msg) ->
	daily_refresh(),
	#'Proto10106013'{notice = Notice} = Msg,
	#{value:=MaxNoticeLen} = tb_league_const:get(max_notice_len),
	?JUDGE_RETURN(length(Notice) =< MaxNoticeLen, ?ERROR_LEAGUE_NOTICE_LEN),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_change_notice/2, [lib_player:player_id(), Notice]).

%% 申请列表
request_league_apply_list() ->
	daily_refresh(),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_fetch_apply_list/1, [lib_player:player_id()]).

%% 日志列表
request_league_log_list() ->
	daily_refresh(),
	LeagueId = league_id(),
	?JUDGE_RETURN(LeagueId > 0, ?ERROR_LEAGUE_NO_EXISTS),
	mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_log:async_fetch_log_list/1, [lib_player:player_id()]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 内部接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
notify_league_info() ->
	#player_league{
		league_id = LeagueId,
		league_name = LeagueName,
		league_level = LeagueLevel,
		league_position = LeaguePosition
	} = get_player_league(),
	Respond = #'Proto80106009'{
		league_id = LeagueId,
		league_name = LeagueName,
		league_level = LeagueLevel,
		league_position = LeaguePosition
	},
	lib_send:respond_to_client(Respond).

%% 每日刷新玩家身上联盟数据
daily_refresh() ->
	#player_league{
		daily_tick = DailyTick
	} = PlayerLeague = get_player_league(),
	NowTick = lib_timer:unixtime(),
	if
		DailyTick =< NowTick ->
			put_player_league(PlayerLeague#player_league{
				daily_tick = lib_timer:next_zero_unixtime(),
				join_league_times = 0
			}, true);
		true -> skip
	end.

update_join_times(PlayerLeague, ?LEAGUE_SYNC_JOIN) ->
	PlayerLeague#player_league.join_league_times + 1;
update_join_times(PlayerLeague, _OpType) ->
	PlayerLeague#player_league.join_league_times.

validate_join_times(PlayerLeague) ->
	#player_league{
		join_league_times = JoinTimes
	} = PlayerLeague,
	#{value:=MaxTimes} = tb_league_const:get(daily_join_league),
	?JUDGE_RETURN(JoinTimes < MaxTimes, ?ERROR_LEAGUE_JOIN_TIMES).

update_quit_tick(_PlayerLeague, ?LEAGUE_SYNC_QUIT) ->
	lib_timer:unixtime();
update_quit_tick(PlayerLeague, _OpType) ->
	PlayerLeague#player_league.quit_league_tick.

validate_quit_tick(PlayerLeague) ->
	#player_league{
		quit_league_tick = QuitTick
	} = PlayerLeague,
	#{value:=QuitIntervalSec} = tb_league_const:get(quit_cool_tick),
	NowTick = lib_timer:unixtime(),
	?JUDGE_RETURN((QuitTick + QuitIntervalSec) =< NowTick, ?ERROR_LEAGUE_QUIT_WAIT_TICK).

update_kick_tick(PlayerLeague, OldLeagueId, OpType) when OpType =:= ?LEAGUE_SYNC_QUIT orelse OpType =:= ?LEAGUE_SYNC_KICK ->
	if
		OldLeagueId > 0 ->
			maps:put(OldLeagueId, lib_timer:unixtime(), PlayerLeague#player_league.kick_league_map);
		true -> PlayerLeague#player_league.kick_league_map
	end;
update_kick_tick(PlayerLeague, _OldLeagueId, _OpType) ->
	PlayerLeague#player_league.kick_league_map.

validate_kick_tick(LeagueId, KickLeagueMap) ->
	KickTick = maps:get(LeagueId, KickLeagueMap, 0),
	#{value:=CoolIntervalSec} = tb_league_const:get(league_cool_tick),
	NowTick = lib_timer:unixtime(),
	?JUDGE_RETURN((KickTick + CoolIntervalSec) =< NowTick, ?ERROR_LEAGUE_LEAVE_WAIT_TICK).

%% 同步玩家信息到联盟进程
async_league_member_show() ->
	LeagueId = league_id(),
	if
		LeagueId > 0 ->
			LeagueMember = lib_league_base:show_role_to_member(league_id(), lib_player:serialize_show_role()),
			mod_server:async_apply(mod_league:get_pid(LeagueId), fun lib_league_op:async_fetch_player_league_info/2, [LeagueMember, ?LEAGUE_SYNC_NORMAL]);
		true -> skip
	end.

test_league_command(Par1, Par2, Par3, Par4) ->
	if
		Par1 =:= 1 ->	%% 创建
			LeagueName = "league_" ++ lib_types:to_list(Par2),
			request_league_create(#'Proto10106003'{name = LeagueName});
		Par1 =:= 2 andalso Par2 =:= 1 -> %% 联盟列表
			request_league_list();
		Par1 =:= 2 andalso Par2 =:= 2 -> %% 联盟界面
			request_league_info();
		Par1 =:= 2 andalso Par2 =:= 3 -> %% 成员列表
			request_league_member_list();
		Par1 =:= 2 andalso Par2 =:= 4 -> %% 申请列表
			request_league_apply_list();
		Par1 =:= 2 andalso Par2 =:= 5 ->
			Amount = mod_server:sync_apply(mod_league:get_pid(league_id()), fun lib_league_base:get_position_amount/1, [Par3]),
			?DEBUG("league postion amount: ~p ~p", [Par3, Amount]);
		Par1 =:= 3 -> %% 申请
			request_league_apply(#'Proto10106004'{type = Par2, league_id = Par3});
		Par1 =:= 4 -> %% 申请审核
			request_league_apply_reply(#'Proto10106005'{type = Par2, player_id = Par3});
		Par1 =:= 5 -> %% 退出
			request_league_quit();
		Par1 =:= 6 -> %% 逐出
			request_league_kick(#'Proto10106007'{member_id = Par2});
		Par1 =:= 7 -> %% 解散
			request_league_dismiss();
		Par1 =:= 8 -> %% 日志
			request_league_log_list();
 		true ->
			?WARNING("test league: ~p ~p ~p ~p", [Par1, Par2, Par3, Par4])
	end,
	ok.