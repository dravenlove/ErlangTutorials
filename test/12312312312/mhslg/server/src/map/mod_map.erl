%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 16. 11月 2020 14:38
%%%-------------------------------------------------------------------
-module(mod_map).
-author("lichaoyu").
-include("common.hrl").
-include("season_and_day.hrl").
-include("map.hrl").

-define(HALF_SEC,	500).		%% 半秒
-define(ONE_SEC,	1000).		%% 一秒
-define(TEN_SEC,	10000).		%% 十秒
-define(HALF_MIN,	30000).		%% 半分
-define(ONE_MIN,	60000).		%% 一分
-define(TEN_MIN,	600000).	%% 十分
-define(HALF_HOUR,	1800000).	%% 半时
-define(ONE_HOUR,	3600000).	%% 一时
-define(LAST_MAP_TICK, last_map_tick).		%% 上一次地图进程关闭时间戳

%% API
-export([start/0, get_pid/0, stop/0, start_link/0, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

-export([
	player_request/4
]).


start() ->
	mod_server:start({local, ?MODULE}, ?MODULE, [], []).

start_link() ->
	mod_server:start_link({local, ?MODULE}, ?MODULE, [], []).

stop() ->
	mod_server:sync_stop(?MODULE).

get_pid() ->
	erlang:whereis(?MODULE).

do_init([]) ->
	?DEBUG("request_map_init: ~p ~n",[1]),
	{ok, false}.

do_db_init(_State, []) ->
	erlang:put(?LAST_MAP_TICK, db_map:load_map_time()),
	lib_map:load_db(),
	start_out(),
	start_after(),
	{noreply, _State}.

do_call(_Info, _From, State) ->
	{reply,State,State}.

do_cast({restart_combat_queue, Data}, State) ->
	?DEBUG("~p~n", [Data]),
	{noreply, State};
do_cast({combat_queue_callback, Data}, State) ->
	?DEBUG("~p~n", [Data]),
	lib_city_defense_api:callback(Data),
	{noreply, State};
do_cast({join_combat_queue_callback, Data}, State) ->
	?DEBUG("~p~n", [Data]),
	{noreply, State};
do_cast({quit_combat_queue_callback, Data}, State) ->
	?DEBUG("~p~n", [Data]),
	{noreply, State};
do_cast(_Info, State) ->
	{noreply, State}.


do_info(hour_timer, State) ->
	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(NextHour * 1000, self(), hour_timer),
	lib_country:process_hour_timeout(),
	{noreply, State};
do_info({timer, Fun, Args}, State) ->
	apply(Fun, Args),
	{noreply, State};
do_info(time_out, State) ->
	start_out(),
	{noreply, State};
do_info({time_after, Flag}, State) ->
	{_, Time, Fun} = lists:keyfind(Flag, 1, time_after()),
	erlang:send_after(Time, self(), {time_after, Flag}),
	Fun(),
	{noreply, State};
do_info(_Info, State) ->
	{noreply, State}.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

do_terminate(_Reason, _State) ->
	lib_map:save_db(),
	?INFO("mod_map stop ~n").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

player_request(Recogn, PlayerId, Fun, Args) ->
	try
		erlang:apply(Fun, [PlayerId] ++ Args)
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


start_out() ->
	[E, LastTick] = erlang:get(?LAST_MAP_TICK),
	{FunList, NextTickList} = lists:foldl(
		fun({Ex, Season, Time, Fun}, {F, N}) ->
			LastFunTick = last_fun_tick(Season, Time),
			{case Ex =/= E andalso LastFunTick >= LastTick of
				true -> [Fun | F];
				false -> F
			end,
			[case Season of
				0 -> LastFunTick + 86400;
				_ -> LastFunTick + 86400 * 4
			end | N]}
		end, {[], []}, time_out()),
	NowTick = lib_timer:unixtime(),
	erlang:put(?LAST_MAP_TICK, [2, NowTick]),
	NextTime = lists:min(NextTickList) - NowTick,
	erlang:send_after(case NextTime < 0 of true -> 0;false -> NextTime * 1000 end, self(), time_out),
	lib_common:try_run(FunList)
.
%% 准时处理接口
time_out() ->
	%% {0-关服时不执行1-关服时执行，季节(0-每天)，几点，Fun}
	[
		{1, 0, lib_city_visiting_api:reset_time(),  fun lib_city_visiting_api:reset_visiting_hero/0},
		{1, 4, lib_timer:annual_award_time(),		fun lib_country_warehouse:grant_year_award/0},
		{1, 0, lib_timer:submit_tax_time(),			fun lib_country_warehouse:pay_axes/0},
		{1, 4, lib_timer:pay_tribute_time(),		fun lib_country_warehouse:pay_tribute/0},
		{1, 4, lib_timer:refresh_time(),			fun lib_country_warehouse:reset_country_warehouse_info/0},

		{0, 0, maps:get(timevalue, tb_genesis_church_const:get(small_one)),		fun lib_genesis_church:create_small/0},
		{0, 0, maps:get(timevalue, tb_genesis_church_const:get(small_two)),		fun lib_genesis_church:create_small/0},
		{0, 0, maps:get(timevalue, tb_genesis_church_const:get(small_three)),	fun lib_genesis_church:create_small/0},
		{0, 0, maps:get(timevalue, tb_genesis_church_const:get(small_four)),	fun lib_genesis_church:create_small/0},
		{0, 0, maps:get(timevalue, tb_genesis_church_const:get(big_time)),		fun lib_genesis_church:create_big/0},

		{0, 0, maps:get(timevalue, tb_country_war_task_const:get(border_time)),	fun lib_country_war_task:border_city/0},
		{0, 0, maps:get(timevalue, tb_country_war_task_const:get(start_time)),	fun lib_country_war_task:start_task/0}
	]
.
last_fun_tick(Season, Time) ->
	NowTick = lib_timer:unixtime(),
	{_, {H, M, S}} = NowLocalTime = lib_timer:to_localtime(NowTick),
	NowTime = H * 3600 + M * 60 + S,
	LastTick = NowTick -
		case NowTime >= Time of
			true ->
				NowTime - Time;
			false ->
				86400 - Time + NowTime
		end,
	case Season of
		0 -> LastTick;
		_ ->
			NowSeason = lib_season_and_days_api:season(NowLocalTime),
			InterValSeason = NowSeason - Season,
			LastTick -
				case InterValSeason >= 0 of
					true -> InterValSeason;
					false -> 4 + InterValSeason
				end * 86400
	end
.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_after() -> start_after(time_after()).
start_after([]) -> ok;
start_after([{Flag, _, _} | L]) ->
	erlang:send(self(), {time_after, Flag}),
	start_after(L)
.
%% 循环处理接口
time_after() ->
	[
		{one_sec, ?ONE_SEC, fun one_sec/0},
		{one_hour, ?ONE_HOUR, fun one_hour/0}
	]
.

one_sec() ->
	List = [
		fun lib_troops_api:u_troops_march/0,
		fun lib_player_map:notice_troops/0,
		fun lib_player_map:notice_city/0,
		fun lib_genesis_church:check/0,
		fun lib_country_war_task:check/0
	],
	lib_common:try_run(List)
.
one_hour() ->
	List = [
		fun lib_city_defense_api:refresh_guard/0
	],
	lib_common:try_run(List)
.













