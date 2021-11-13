%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_league
%%% Created on : 2020/8/15 0015 13:07
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_league).
-behavior(mod_server).
-author("glendy").
-include("base.hrl").
-include("log.hrl").
-include("ets.hrl").
-include("league.hrl").
-include("chat.hrl").

-export([start_link/2, stop/1, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_process_name/1,
	get_pid/1
]).

start_link(LeagueId, IsCreate) ->
	ProgressName = get_process_name(LeagueId),
	mod_server:start_link({local, ProgressName}, ?MODULE, [LeagueId, IsCreate], []).

stop(LeagueId) ->
	LeaguePid = get_pid(LeagueId),
	mod_server:stop(LeaguePid).

do_init([LeagueId, IsCreate]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(120 * 1000, self(), save_timeout),
	erlang:send_after(1800 * 1000, self(), leader_timeout),
	erlang:send_after(10 * 1000, self(), force_timeout),
	?INFO("mod_league start: ~w ~w", [LeagueId, IsCreate]),
	{ok, #league_state{id = LeagueId}}.

do_db_init(State, [LeagueId, IsCreate]) ->
	{League, LeagueMemberList, LogList} = db_league:load_league(LeagueId),
	lib_league_base:put_league(League, false),
	lib_league_log:put_league_log_list(LogList),
	lists:foreach(
		fun(Member) ->
			lib_league_base:put_member_with_ets(Member, false)
		end, LeagueMemberList),
	if
		IsCreate =:= true ->
			lib_league_listen:do_listen_league_create(League#league.leader_id, League);
		true -> skip
	end,
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(save_timeout, State) ->
	erlang:send_after(120 * 1000, self(), save_timeout),
	check_and_save_league(),
	{noreply, State};
do_info(leader_timeout, State) ->
	erlang:send_after(1800 * 1000, self(), leader_timeout),
	lib_league_op:check_leader_offline_timeout(),
	{noreply, State};
do_info(force_timeout, State) ->
	erlang:send_after(10 * 1000, self(), force_timeout),
	case lib_league_op:get_league_force_flag() of
		1 ->
			lib_league_op:set_league_force_flag(0),
			lib_league_op:update_league_force();
		_ -> skip
	end,
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, #league_state{id = LeagueId}) ->
	save_league(),
	mod_server:async_apply(mod_chat:get_pid(), fun mod_channel:stop/2, [?CHANNEL_COUNTRY, LeagueId]),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get_process_name(LeagueId) ->
	lib_types:to_atom("league_" ++ lib_types:to_list(LeagueId)).

get_pid(LeagueId) ->
	ProgessName = get_process_name(LeagueId),
	erlang:whereis(ProgessName).

get_league_cache_update_flag() ->
	case erlang:get(?LEAGUE_CACHE_UPDATE_FLAG) of
		undefined -> 0;
		Val -> Val
	end.
check_and_save_league() ->
	try
		Flag = get_league_cache_update_flag(),
		?JUDGE_RETURN(Flag =:= 1, -1),
		erlang:put(?LEAGUE_CACHE_UPDATE_FLAG, 0),
		#league{
			is_remove = IsRemove
		} = lib_league_base:get_league(),
		?JUDGE_RETURN(IsRemove =:= 0, -1),
		save_league()
	catch
	    throw:{error, _} -> skip
	end.

save_league() ->
	#league{
		id = LeagueId,
		member_map = MemberOnlineMap,
		is_remove = IsRemove
	} = League = lib_league_base:get_league(),
	if
		IsRemove =:= 1 ->
			ets:delete(?ETS_LEAGUE, LeagueId);
		true ->
			ets:insert(?ETS_LEAGUE, League)
	end,
	MemberList = maps:fold(
		fun(MemberId, _, AccMemberList0) ->
			case lib_league_base:get_member(MemberId) of
				undefined ->
					ets:delete(?ETS_LEAGUE_MEMBER, {LeagueId, MemberId}),
					AccMemberList0;
				Member ->
					if
						IsRemove =:= 1 ->
							ets:delete(?ETS_LEAGUE_MEMBER, {LeagueId, MemberId});
						true ->
							ets:insert(?ETS_LEAGUE_MEMBER, Member)
					end,
					[Member | AccMemberList0]
			end
		end, [], MemberOnlineMap),
	LogList = lib_league_log:get_league_log_list(),
	db_league:save_league(League, MemberList, LogList, false).
