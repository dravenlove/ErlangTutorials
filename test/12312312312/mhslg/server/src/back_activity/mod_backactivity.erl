%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_backactivity
%%% Created on : 2020/8/25 0025 10:43
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_backactivity).
-behavior(mod_server).
-author("glendy").
-include("common.hrl").
-include("back_activity.hrl").

-define(BACK_LOAD_TIMEOUT, 10 * 1000).

-export([start_link/0, stop/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	get_pid/0
]).

-record(backactivity_state, {}).

get_pid() ->
	erlang:whereis(?MODULE).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(get_pid()).

do_init([]) ->
	erlang:process_flag(trap_exit, true),
	erlang:send_after(?BACK_LOAD_TIMEOUT, self(), back_load_timeout),
	{ok, #backactivity_state{}}.

do_db_init(State, _Args) ->
	BackActivityList = db_backactivity:load_all_backactivity_active(),
	NewBackActivityMap = lists:foldl(
		fun(BackActivity, AccBackActivityMap0) ->
			?DEBUG("load backactivity active: ~p ~p ~ts ~p ~p ~p ~p", [
				BackActivity#backactivity.act_index,
				BackActivity#backactivity.main_type,
				BackActivity#backactivity.title,
				BackActivity#backactivity.state,
				BackActivity#backactivity.start_tick,
				BackActivity#backactivity.end_tick,
				BackActivity#backactivity.disappear_tick]),
			NewBackActivity0 = BackActivity#backactivity{
				conf = lib_backact_base:dynamic_compile_backactivity_config(BackActivity#backactivity.config_string)
			},
			NewBackActivity = lib_backact_base:process_fast_load_config(NewBackActivity0),
			maps:put(NewBackActivity#backactivity.act_index, NewBackActivity, AccBackActivityMap0)
		end, #{}, BackActivityList),
	lib_backact_base:put_backactivity_map(NewBackActivityMap),
	{noreply, State}.

do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(back_load_timeout, State) ->
	erlang:send_after(?BACK_LOAD_TIMEOUT, self(), back_load_timeout),
	lib_backact_base:check_and_convert_backactivity(),
	lib_backact_base:check_and_active_backactivity(),
	lib_backact_base:check_and_update_backactivity_state(),
	lib_backact_base:check_and_remove_backactivity(),
	save_backactivity_to_db(),
	remove_backactivity_to_db(),
	{noreply, State};
do_info(Info, State) ->
	?INFO("~p recv: ~p", [?MODULE, Info]),
	{noreply, State}.

do_terminate(_Reason, _State) ->
	save_backactivity_to_db(),
	remove_backactivity_to_db(),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

save_backactivity_to_db() ->
	List = lib_backact_base:get_cache_save_list(),
	save_backactivity_to_db(List),
	lib_backact_base:put_cache_save_list([]).
save_backactivity_to_db([]) ->
	ok;
save_backactivity_to_db([Id | T]) ->
	case lib_backact_base:get_backactivity(Id) of
		undefined -> skip;
		BackActivity ->
			db_backactivity:save_to_backactivity_active(BackActivity)
	end,
	save_backactivity_to_db(T).

remove_backactivity_to_db() ->
	List = lib_backact_base:get_cache_remove_list(),
	remove_backactivity_to_db(List),
	lib_backact_base:put_cache_remove_list([]).
remove_backactivity_to_db([]) ->
	ok;
remove_backactivity_to_db([Id | T]) ->
	db_backactivity:remove_backactivity_active(Id),
	remove_backactivity_to_db(T).
