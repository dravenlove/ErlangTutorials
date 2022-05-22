%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_league_listen
%%% Created on : 2020/8/18 0018 16:59
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%		其他功能加入的监听接口, 在联盟进程里调用
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_league_listen).
-author("glendy").
-include("common.hrl").
-include("league.hrl").

%% API
-export([
	do_listen_change_position/4,
	do_listen_change_leader/2,
	do_listen_league_force/2,
	do_listen_league_create/2,
	do_listen_league_apply/2,
	do_listen_league_apply_reject/4,
	do_listen_league_apply_agree/3,
	do_listen_league_quit/2,
	do_listen_league_kick/3,
	do_listen_league_dimiss/2,
	do_listen_league_notice/2
]).

%% 其他处理职位变化的逻辑, 其他功能逻辑在此处添加
do_listen_change_position(ReqPlayerId, MemberId, OldPosition, NewPosition) ->
	League = lib_league_base:get_league(),
	lib_league_serial:serial_league_position(ReqPlayerId, League, MemberId, OldPosition, NewPosition),
	case lib_player:is_player_process_alive(MemberId) of
		true ->
			MemberPid = lib_player:get_pid(MemberId),
			lib_league_op:async_player_league_info(MemberPid, League, NewPosition, ?LEAGUE_SYNC_POSITION);
		_ -> skip
	end,
	lib_league_log:insert_position_change_log(ReqPlayerId, MemberId, OldPosition, NewPosition),
	ok.

%% 转让会长时，其他功能的相关处理逻辑
do_listen_change_leader(LeaderId, MemberId) ->
	lib_league_serial:serial_league_change_leader(LeaderId, MemberId),
	lib_league_log:insert_change_leader_log(LeaderId, MemberId),
	ok.

%% 在联盟战力变化时，其他功能的相关处理逻辑
do_listen_league_force(_PrevForce, _TotalForce) ->
	ok.

%% 创建联盟触发
do_listen_league_create(LeaderId, League) ->
	lib_league_serial:serial_league_create(LeaderId, League),
	lib_league_log:insert_create_log(LeaderId, League),
	ok.

%% 申请加入联盟触发
do_listen_league_apply(ReqMember, League) ->
	lib_league_serial:serial_league_apply(ReqMember, League),
	ok.

%% 拒绝申请触发
do_listen_league_apply_reject(PlayerId, League, _OpType, ApplyId) ->
	try
		lib_league_serial:serial_league_apply_disagree(PlayerId, League, ApplyId),
		ok
	catch
		_:Reason ->
			?WARNING("listen league apply reject: ~w ~n ~p", [Reason, erlang:get_stacktrace()])
	end.

%% 同意申请触发
do_listen_league_apply_agree(PlayerId, League, MemberId) ->
	try
		lib_league_serial:serial_league_apply_agree(PlayerId, League, MemberId),
		lib_league_log:insert_join_log(PlayerId, League, MemberId),
		ok
	catch
	    _:Reason ->
			?WARNING("listen league apply agree: ~w ~n ~p", [Reason, erlang:get_stacktrace()])
	end.

%% 主动退出联盟触发
do_listen_league_quit(PlayerId, League) ->
	lib_league_serial:serial_quit_league(PlayerId, League),
	lib_league_log:insert_exit_league_log(PlayerId, PlayerId),
	ok.

%% 踢出成员触发
do_listen_league_kick(PlayerId, League, KickMember) ->
	lib_league_serial:serial_league_kick(PlayerId, League, KickMember),
	lib_league_log:insert_exit_league_log(PlayerId, KickMember#league_member.id),
	ok.

%% 解散联盟时触发
do_listen_league_dimiss(LeaderId, League) ->
	try
		lib_league_serial:serial_league_dismiss(LeaderId, League),
		ok
	catch
		_:Reason ->
			?WARNING("listen league dimiss: ~w ~n ~p", [Reason, erlang:get_stacktrace()])
	end.

%% 修改公告
do_listen_league_notice(PlayerId, League) ->
	lib_league_serial:serial_league_notice(PlayerId, League),
	ok.
