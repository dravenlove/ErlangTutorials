%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_global_timer
%%% Created on : 2020/10/16 10:37
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_global_timer).
-behaviour(mod_server).
-author("glendy").
-include("common.hrl").
-include("global_timer.hrl").

-record(global_timer_state, {}).

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0
]).

get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:stop(get_pid()).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	NextMin = lib_timer:next_min_time(),
	NextHour = lib_timer:next_hour_time(),
	NextZero = lib_timer:next_zero_time(),
	NextSix = lib_timer:next_six_time(),
	NextFive = lib_timer:next_five_time(),
	NextCommonRefresh = lib_timer:next_refresh_time(),
	erlang:send_after(NextMin * 1000,self(),min_timer),
	erlang:send_after(NextHour * 1000,self(),hour_timer),
	erlang:send_after(NextZero * 1000,self(),zero_timer),
	erlang:send_after(NextSix * 1000,self(),six_timer),
	erlang:send_after(NextFive * 1000,self(),season_timer),
	erlang:send_after(NextCommonRefresh * 1000,self(),common_refresh_timer),
	{ok, #global_timer_state{}}.

do_db_init(State, _Args) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(min_timer,State) ->
	NextMin = lib_timer:next_min_time(),
	_MinRef = erlang:send_after(NextMin * 1000,self(),min_timer),
%%    ?INFO("=============== min timer NextMin:~w =================~n",[NextMin]),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> skip;
		?SERVER_TYPE_CLUSTER -> handle(?CLUSTER_MIN_TIMER_MODULES, false);
		?SERVER_TYPE_TEST -> handle(?SINGLE_MIN_TIMER_MODULES,false);
		?SERVER_TYPE_GAME -> handle(?SINGLE_MIN_TIMER_MODULES,false);
		_ -> skip
	end,
	{noreply,State};

do_info(hour_timer,State) ->
	NextHour = lib_timer:next_hour_time(),
	_HourRef = erlang:send_after(NextHour * 1000,self(),hour_timer),
	%%misc:set_ref(?TIMER_HOUR_REF, HourRef),
	?INFO("=============== hour timer NextHour:~w =================~n",[NextHour]),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> skip;
		?SERVER_TYPE_CLUSTER -> handle(?CLUSTER_HOUR_TIMER_MODULES, false);
		?SERVER_TYPE_TEST -> handle(?SINGLE_HOUR_TIMER_MODULES,false);
		?SERVER_TYPE_GAME -> handle(?SINGLE_HOUR_TIMER_MODULES,false);
		_ -> skip
	end,
	{noreply,State};

do_info(zero_timer,State) ->
	NextZero = lib_timer:next_zero_time(),
	_ZeroRef = erlang:send_after(NextZero * 1000,self(),zero_timer),
	%%misc:set_ref(?TIMER_ZERO_REF, ZeroRef),
	?INFO("=============== zero timer NextZero:~w =================~n",[NextZero]),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> skip;
		?SERVER_TYPE_CLUSTER -> handle(?CLUSTER_ZERO_TIMER_MODULES, false);
		?SERVER_TYPE_TEST -> handle(?SINGLE_ZERO_TIMER_MODULES,false);
		?SERVER_TYPE_GAME -> handle(?SINGLE_ZERO_TIMER_MODULES,false);
		_ -> skip
	end,
	{noreply,State};

do_info(six_timer,State) ->
	NextSix = lib_timer:next_six_time(),
	_SixRef = erlang:send_after(NextSix * 1000,self(),six_timer),
	%%misc:set_ref(?TIMER_SIX_REF, SixRef),
	?INFO("=============== six timer NextSix:~w =================~n",[NextSix]),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> skip;
		?SERVER_TYPE_CLUSTER -> handle(?CLUSTER_SIX_TIMER_MODULES, false);
		?SERVER_TYPE_TEST -> handle(?SINGLE_SIX_TIMER_MODULES,false);
		?SERVER_TYPE_GAME -> handle(?SINGLE_SIX_TIMER_MODULES,false);
		_ -> skip
	end,
	{noreply,State};


do_info(season_timer,State) ->
	NextFive = lib_timer:next_refresh_time(),
	_FiveRef = erlang:send_after(NextFive * 1000,self(),season_timer),
	%%misc:set_ref(?TIMER_SIX_REF, SixRef),
	?INFO("=============== season  timer NextFive:~w =================~n",[NextFive]),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> skip;
		?SERVER_TYPE_CLUSTER -> handle(?CLUSTER_SEASON_CHANGE_MODULES, false);
		?SERVER_TYPE_TEST -> handle(?SINGLE_SEASON_CHANGE_MODULES,false);
		?SERVER_TYPE_GAME -> handle(?SINGLE_SEASON_CHANGE_MODULES,false);
		_ -> skip
	end,
	{noreply,State};


do_info(common_refresh_timer,State) ->
	NextRefresh = lib_timer:next_refresh_time(),
	_FiveRef = erlang:send_after(NextRefresh * 1000,self(),common_refresh_timer),
	%%misc:set_ref(?TIMER_SIX_REF, SixRef),
	?INFO("=============== common_refresh_timer:~w =================~n",[NextRefresh]),
	case config:server_type() of
		?SERVER_TYPE_MERGE -> skip;
		?SERVER_TYPE_CLUSTER -> handle(?CLUSTER_COMMON_REFRESH_CHANGE_MODULES, false);
		?SERVER_TYPE_TEST -> handle(?SINGLE_COMMON_REFRESH_CHANGE_MODULES,false);
		?SERVER_TYPE_GAME -> handle(?SINGLE_COMMON_REFRESH_CHANGE_MODULES,false);
		_ -> skip
	end,
	{noreply,State};



do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

handle([{Fun, Args} | T], IsSleep) ->
	try
		spawn(fun()-> apply(Fun, Args) end),
		case IsSleep of
			true ->
				lib_timer:sleep(100);
			_ -> ok
		end
	catch
		_:Err ->
			?ERROR("handle ~s error:~w ",[Fun,Err])
	end,
	handle(T,IsSleep);
handle([],_IsSleep) -> ok.
