%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 4月 2021 15:39
%%%-------------------------------------------------------------------
-module(mod_meritorious_rank).
-author("df").
-include("common.hrl").
-include("meritorious_award.hrl").
-include("season_and_day.hrl").

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
	?DEBUG("meritorious_rank_init: ~p ~n",[1]),
	{ok, #meritorious_rank_gather{}}.

do_db_init(_State, []) ->
	Gather = db_meritorious_award_rank:load_meritorious_rank(),
	CurTick = lib_timer:unixtime(),
	lib_meritorious_award_rank:put_meritorious_rank_gather(Gather),
	reset_system_refresh(CurTick),
	%% 系统通用刷新时间重置数据
	NextRefresh = lib_timer:next_meritorious_rank_time(CurTick),
	erlang:send_after(NextRefresh * 1000,self(),system_refresh),


	{noreply, _State}
.

do_call(_Info, _From, State) ->
	{reply,State,State}.

do_cast(_Info, State) ->
	{noreply, State}.


do_info(system_refresh, State) ->
	CurTick = lib_timer:unixtime(),
	NextRefresh = lib_timer:next_meritorious_rank_time(CurTick),
	erlang:send_after(NextRefresh * 1000, self(), system_refresh),
	%% 刷新数据
	reset_system_refresh(CurTick),
	{noreply, State};

do_info(_Info, State) ->
	{noreply, State}.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

do_terminate(_Reason, _State) ->
	db_meritorious_award_rank:save_meritorious_rank(lib_meritorious_award_rank:get_meritorious_rank_gather()),
	?INFO("mod_meritorious_rank stop ~n").

%%======%%
reset_system_refresh(CurTick) ->
	Gather = lib_meritorious_award_rank:get_meritorious_rank_gather(),
	Last_reset_tick = Gather#meritorious_rank_gather.system_refresh_tick,
	Refresh_time = lib_timer:meritorious_rank_time(),
	Refresh_tick = lib_timer:current_zero_unixtime(CurTick) + Refresh_time,
	Tick = case Last_reset_tick =:= 0 of
			   true -> Refresh_tick;
			   false ->	lib_timer:current_zero_unixtime(Last_reset_tick + lib_timer:day_second()) + Refresh_time
		end,
	?INFO("Last_reset_tick ~p",[Last_reset_tick]),
	?INFO("Refresh_tick ~p",[Refresh_tick]),
	?INFO("Tick ~p",[Tick]),
	case not lib_timer:is_same_day(Last_reset_tick,CurTick) andalso CurTick >= Tick  of
		true ->
			lib_meritorious_award_rank:put_meritorious_rank_gather(Gather#meritorious_rank_gather{system_refresh_tick = Tick}),
			?INFO("mod_meritorious_rank reset_system_refresh.~n"),
			lib_meritorious_award_rank:send_rank_award_to_mail(Tick);
		false ->
			skip
	end
.







