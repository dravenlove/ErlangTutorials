%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 10:35
%%%-------------------------------------------------------------------
-module(mod_arena).
-author("13661").

-include("common.hrl").
-include("arena.hrl").

%% API
-export([start/0, start_link/0, stop/0, get_pid/0, do_init/1, do_db_init/2, do_stop/0, do_call/3, do_cast/2, do_info/2, do_terminate/2, do_code_change/2]).
-export([
	get_monitor/0,
	put_monitor/1
]).
-export([
	async_apply/2,
	sync_apply/2,
	do_player_request/4
]).
-export([
	save_monitor/0
]).

start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], [])
.

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], [])
.

stop() ->
	mod_server:sync_stop(get_pid())
.

get_pid() ->
	erlang:whereis(?MODULE).

do_init([]) ->
	process_flag(trap_exit, true),

	{ok, undefined}
.

do_db_init(State, []) ->
	Monitor = db_arena:load_monitor(),
	put_monitor(Monitor),

	lib_arena:start(),
	save_monitor(),

	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(NextHour * 1000, self(), hour_timer),

	{noreply, State}.

do_stop() ->
	ok
.

do_call(_Info, _From, State) ->
	{reply, State, State}.

do_cast(_Info, State) ->
	{noreply, State}.

do_info(hour_timer, State) ->
	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(NextHour * 1000, self(), hour_timer),

	lib_arena:check_send_rank_reward(),

	save_monitor(),

	{noreply, State}
;
do_info(_Info, State) ->
	{noreply, State}
.

do_terminate(_Reason, _State) ->
	db_arena:save_monitor(get_monitor()),

	do_stop(),
	?INFO("=======mod_arena stop=======~n")
.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.


get_monitor() ->
	erlang:get(?MODULE)
.

put_monitor(Monitor) when is_record(Monitor, arena_monitor) ->
	erlang:put(?MODULE, Monitor)
.

save_monitor() ->
	Monitor = get_monitor(),
	db_arena:save_monitor(Monitor)
.


async_apply(F, A) ->
	mod_server:async_apply(?MODULE, F, A)
.

sync_apply(F, A) ->
	mod_server:sync_apply(?MODULE, F, A)
.

do_player_request(Recogn, PlayerId, F, A) ->
	try
		erlang:apply(F, [PlayerId] ++ A)
	catch
		throw: {respond, ErrCode, Line} when is_integer(ErrCode) ->
			ResRecogn = lib_msg:request_code_to_respond_code(Recogn),
			lib_send:respond_to_player(PlayerId, ResRecogn, ErrCode),
			?INFO("recogn[proto] error: ~p ~p ~p ~p", [PlayerId, ResRecogn, ErrCode, Line]);
		throw: {respond, Body, _Line} ->
			lib_send:respond_to_player(PlayerId, Body);
		throw: {respond, Msg, ErrCode, Line} when is_integer(Msg) andalso is_integer(ErrCode) ->
			lib_send:respond_to_player(PlayerId, Msg, ErrCode),
			?INFO("recogn[proto] error: ~p ~p ~p ~p", [PlayerId, Msg, ErrCode, Line])
	end
.