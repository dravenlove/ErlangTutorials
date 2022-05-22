%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 5月 2021 11:07
%%%-------------------------------------------------------------------
-module(mod_honour_top).
-author("df").
-include("common.hrl").
-include("honour_top.hrl").
-include("season_and_day.hrl").
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
	?DEBUG("honour_top_gather_init: ~p ~n",[1]),
	{ok, #honour_top_gather{}}.

do_db_init(_State, []) ->
	HonourTopGather = db_honour_top:load_honour_top(),
	lib_honour_top:put_honour_top_gather(HonourTopGather),
	activity_timer(lib_timer:unixtime()),

	{noreply, _State}
.

do_call(_Info, _From, State) ->
	{reply,State,State}.

%% 接收战斗返回
do_cast({combat_queue_callback, Data}, State) ->
	lib_honour_top_flow:fight_result(Data),
	{noreply, State};

do_cast(_Info, State) ->
	{noreply, State}.


do_info(activity_start, State) ->
	lib_honour_top_flow:activity_start(),
	{noreply, State};

do_info(grouping_fight, State) ->
	lib_honour_top_flow:report_fight(1),
	lib_honour_top_flow:grouping_fight(),
	{noreply, State};

do_info(grouping_fight_over, State) ->
	lib_honour_top_flow:grouping_fight_over(),
	{noreply, State};

do_info(next_activity_start, State) ->
	lib_honour_top_flow:next_activity_start(),
	{noreply, State};

do_info(next_timer, State) ->
	lib_honour_top_flow:next_timer(),
	{noreply, State};

do_info({award_mail,Stage}, State) ->
	lib_honour_top_flow:award_mail(Stage),
	{noreply, State};

do_info(_Info, State) ->
	{noreply, State}.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

do_terminate(_Reason, _State) ->
	db_honour_top:save_honour_top(lib_honour_top:get_honour_top_gather()),
	?INFO("mod_honour_top stop ~n").

%%==================%%

activity_timer(Tick) ->
	?DEBUG("当前季节为 ~p",[lib_season_and_days_api:get_season_info()]),
	#honour_top_gather{stage = Stage,times = Times} = lib_honour_top:get_honour_top_gather(),
	case lib_season_and_days_api:get_season_info() =:= lib_honour_top_api:const(open_season,value) of
		 true -> case (Stage =:= 0) andalso (Times =:= 0) of
				true -> lib_honour_top_flow:activity_start();
				false->	lib_honour_top_flow:next_timer()
		 end;
		 false->
			 	case (Stage =/= 0) orelse (Times =/= 0) of
					 true -> 	Gather = lib_honour_top:get_honour_top_gather(),
						 		NewMap =
								maps:fold(fun(PlayerId,PlayerInfo,MAP) ->
									maps:put(PlayerId,PlayerInfo#player_honour_top{is_apply = 0,bet = 0,group_map = maps:new(),hero_info = []},MAP)
								end,maps:new(),Gather#honour_top_gather.player_map),
						 		lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{stage = 0,times = 0,player_map = NewMap,apply_num = 0,is_fight =0 ,
									fight_group_id = 0, fight_report_id = 0, fight_list = [], fight_over_list = []});
					 false-> skip
				 end,
			 	 Time = lib_season_and_days_api:next_season(lib_honour_top_api:const(open_season,value),Tick) - Tick,
	 			 ?INFO("下场活动在~p秒后开始",[Time]),
			 	 erlang:send_after(Time * 1000, self(), activity_start)
	end

.

