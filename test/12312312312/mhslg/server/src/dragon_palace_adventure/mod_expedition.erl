%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 2月 2021 15:27
%%%-------------------------------------------------------------------
-module(mod_expedition).
-author("df").
-include("common.hrl").
-include("dragon_palace_adventure.hrl").

-define(PDA_ONE_MICROSEC, 1000). %% %%通用一秒计时器

%% API
-export([start/0, get_pid/0, stop/0, start_link/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], []).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(?MODULE).

get_pid() ->
	erlang:whereis(?MODULE).

do_init([]) ->
	?DEBUG("dragon_palace_adventure_init: ~p ~n",[1]),
	{ok, #dragon_palace_adventure_gather{}}.

do_db_init(_State, []) ->

	Gather = db_dragon_palace_adventure:load_dragon_palace_adventure_gather(),
	CurTick = lib_timer:unixtime(),
	lib_dragon_palace_adventure:put_dragon_palace_adventure(Gather#dragon_palace_adventure_gather{start_tick = CurTick}),
	lib_dragon_palace_adventure_api:reset_system_refresh(CurTick),
	%% 系统通用刷新时间重置数据
	NextRefresh = lib_timer:next_refresh_time(CurTick),
	erlang:send_after(NextRefresh * 1000,self(),system_refresh),

	erlang:send_after(?PDA_ONE_MICROSEC,self(),one_timer),

	{noreply, _State}
.

do_call(_Info, _From, State) ->
	{reply,State,State}.

do_cast(_Info, State) ->
	{noreply, State}.


do_info(system_refresh, State) ->
	CurTick = lib_timer:unixtime(),
	NextRefresh = lib_timer:next_refresh_time(CurTick),
	erlang:send_after(NextRefresh * 1000, self(), system_refresh),
	%% 系统通用时间刷新数据
	lib_dragon_palace_adventure_api:reset_system_refresh(CurTick),
	{noreply, State};

do_info(one_timer,State) ->
	erlang:send_after(?PDA_ONE_MICROSEC,self(),one_timer),
	lib_dragon_palace_adventure_api:all_adventure_player(),
	{noreply,State};

do_info(_Info, State) ->
	{noreply, State}.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

do_terminate(_Reason, _State) ->
	db_dragon_palace_adventure:save_dragon_palace_adventure_gather(lib_dragon_palace_adventure:get_dragon_palace_adventure()),
	?INFO("mod_expedition stop ~n").


