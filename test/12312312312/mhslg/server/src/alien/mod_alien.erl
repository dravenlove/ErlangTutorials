%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: mod_dungeoned.erl
%% Created on : 2019-07-12 17:00:00
%% Author: Jiuan
%% Last Modified: 2019-07-12 17:00:00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(mod_alien).
-behaviour(mod_server).
-include("common.hrl").
-include("alien.hrl").
-export([get_pid/1, start_link/1, stop/1, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	start_all/0,
	stop_all/0,
	put_alien/1,
	get_alien/0,

	async_apply/2,
	player_request/1
]).
-define(REFRESH_BUFF_TIMEOUT, 60 * 60 * 1000).
-define(CHECK_STATE_TIME, 5 * 1000).
-define(CHECK_PLAYER_REWARD_TIME, ?REWARD_CHECK_TIME * 1000).
-record(alien_state, {
	country_id = 0
}).

put_alien(Rank) when is_record(Rank, alien) ->
	erlang:put(?MODULE, Rank).
get_alien() ->
	erlang:get(?MODULE).

get_process_name(CountryId) ->
	lib_types:to_atom("alien" ++ lib_types:to_list(CountryId)).

get_pid(CountryId) ->
	ProcessName = get_process_name(CountryId),
	erlang:whereis(ProcessName).

start_all() ->
	lists:foreach(fun(CountryId) ->
		start_link(CountryId)
	end, tb_role_country:get_list()).
start_link(CountryId) ->
	ProcessName = get_process_name(CountryId),
	mod_server:start_link({local, ProcessName}, ?MODULE, [CountryId], []).

stop_all() ->
	lists:foreach(fun(CountryId) ->
		stop(CountryId)
	end, tb_role_country:get_list()).
stop(CountryId) ->
	Pid = get_pid(CountryId),
	?IIF(is_pid(Pid) andalso is_process_alive(Pid), mod_server:sync_stop(Pid), skip).

do_init([CountryId]) ->
	{ok, #alien_state{country_id = CountryId}}.

do_db_init(State, [CountryId]) ->
	put_alien(db_alien:load_alien(CountryId)),
	erlang:send_after(lib_random:rand(?CHECK_STATE_TIME), self(), check_state),
	erlang:send_after(lib_timer:next_hour_time() * 1000, self(), refresh_buff),
	erlang:send_after(?CHECK_PLAYER_REWARD_TIME, self(), check_player_reward),
	lib_alien:check_buff_refresh(),
	{noreply, State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_call(_Info, _From, State) ->
    {reply,State,State}.

do_info(check_state, State) ->
	erlang:send_after(?CHECK_STATE_TIME, self(), check_state),
	lib_alien:check_state(),
	lib_alien:check_start_fight(),
	{noreply, State};
do_info(refresh_buff, State) ->
	erlang:send_after(lib_timer:next_hour_time() * 1000, self(), refresh_buff),
	lib_alien:check_buff_refresh(),
	{noreply, State};
do_info(check_player_reward, State) ->
	erlang:send_after(?CHECK_PLAYER_REWARD_TIME, self(), check_player_reward),
	lib_alien:check_player_tips(),
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_terminate(_Reason, _State) ->
	db_alien:save_alien(get_alien()),
	?INFO("mod_dungeoned stop ~n").

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

%%玩家进程接口 异步调用
async_apply(Fun, Args) ->
	async_apply(lib_player:player_country(), fun mod_alien:player_request/1, [{lib_player:player_id(), Fun, Args}]).
async_apply(CountryId, Fun, Args) ->
	mod_server:async_apply(get_pid(CountryId), Fun, Args).
player_request({PlayerId, Fun, Args}) ->
	try
		apply(Fun, Args)
	catch
	    throw:{error, Msg, ErrCode}  -> lib_send:respond_to_player(PlayerId, Msg, ErrCode);
		_:Reason -> ?ERROR("mod_alien player_request [~p]~n~p", [Reason, erlang:get_stacktrace()])
	end.