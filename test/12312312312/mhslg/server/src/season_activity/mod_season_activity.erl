%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_season_activity
%%% Created on : 2021/7/8 22:16
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_season_activity).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").
-behavior(mod_server).

%% API
-export([start/0,get_pid/0,stop/0,start_link/0,do_init/1,do_db_init/2,do_call/3,do_cast/2,do_info/2,do_code_change/2,do_terminate/2]).
-export([get_season_activity/0,put_season_activity/1]).
-export([
	check_season_activity_status/0,
	check_summer_campfire_charging/0
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
erlang:send_after(1*1000,self(),season_activity),
{ok, ok}.

do_db_init(State, _Args) ->
mod_season_activity:put_season_activity(db_season_activity:load_season_activity()),
{noreply, State}.

do_call(Info, _From, State) ->
{reply, Info, State}.

do_cast(_Info, State) ->
{noreply, State}.

do_info(season_activity, State) ->
erlang:send_after(5 * 1000, self(), season_activity),
	mod_season_activity:check_season_activity_status(),
	mod_season_activity:check_summer_campfire_charging(),
{noreply, State};

do_info(realtime_rank, State) ->
	lib_winter:realtime_rank(),
	erlang:send_after(?TB_S_A_CONST(int,next_question_rank_time)*1000,self(),extr_time),
	{noreply, State};

do_info(extr_time, State) ->
	lib_winter:extr_time(),
	erlang:send_after(?TB_S_A_CONST(int,next_question_extr_time)*1000,self(),next_question)
	,{noreply, State};

do_info(next_question, State) ->
	case (lib_winter:get_question_number() < ?TB_S_A_CONST(int,question_number)) of
		true ->
			lib_winter:next_question(),
			erlang:send_after(?TB_S_A_CONST(int,question_time)*1000,self(),realtime_rank);
		false -> %% 测试期间重置循环启动
			lib_winter:question_over(),
			SeasonActivity = mod_season_activity:get_season_activity(),
			mod_season_activity:put_season_activity(SeasonActivity#season_activity{player_answer = maps:new(),rank_list = [],question_tick = 0,	question_number = 0})
	end,
	{noreply, State};

do_info(_Info, State) ->
{noreply, State}.

do_terminate(_Reason, State) ->
db_season_activity:save_season_activity(mod_season_activity:get_season_activity()),
?INFO("mod_season_activity stop"),
{ok, State}.

do_code_change(_Mod, State) ->
mod_server:put_callback_mod(?MODULE),
{ok, State}.


get_season_activity() ->
erlang:get(?ETS_SEASON_ACTIVITY)
.
put_season_activity(SeasonActivity) ->
erlang:put(?ETS_SEASON_ACTIVITY, SeasonActivity)
.
check_season_activity_status() ->
	SeasonActivityMap = get_season_activity(),
	#season_activity{is_open = IsOpen} = SeasonActivityMap,
	NowTime = lib_timer:unixtime(),
	{Season,StartTime,EndTime} = lib_season_activity_api:open_tick(lib_season_activity:cur_s_a()),
	case StartTime < NowTime of
		true ->
			case EndTime > NowTime of
				true ->
					case IsOpen of
						%% 单次活动进行中
						true ->
							case Season of
								?SPRING -> skip;
								?SUMMER -> mod_season_activity:check_summer_campfire_charging();
								?AUTUMN -> skip;
								?WINTER -> skip;
								true -> skip
							end;
						%% 单次活动开始
						false -> put_season_activity(SeasonActivityMap#season_activity{is_open = true}),
							case Season of
								?SPRING -> skip;
								?SUMMER -> skip;
								?AUTUMN -> skip;
								?WINTER -> lib_winter:start();
								true -> skip
							end
					end;
				false ->
					case IsOpen of
						%% 单次活动结束
						true ->
							put_season_activity(SeasonActivityMap#season_activity{is_open = false}),
							case Season of
								?SPRING -> lib_spring:award_of_spring_unreceived();
								?SUMMER -> skip;
								?AUTUMN -> skip;
								?WINTER -> lib_winter:award_of_winter_rank();
								true -> skip
							end;
						%% 非活动时间
						false -> skip
					end
			end;
		false -> skip
	end
.
check_summer_campfire_charging() ->
	CheckTimeLine = lib_timer:unixtime() - ?TB_S_A_CONST(int,campfire_charge_time),
	PlayerSummerMap = lib_summer:get_player_summer_map(),
	PlayerIdList = maps:keys(PlayerSummerMap),
	lists:foreach(fun(PlayerId) ->
		PlayerSummer = maps:get(PlayerId,PlayerSummerMap),
		#player_summer{summer = SummerMap} = PlayerSummer,
		SummerKeys = maps:keys(SummerMap),
		lists:foreach(fun(SummerKey) ->
			case SummerKey of
				0 -> skip;
				1 -> skip;
				_ ->
					Summer = maps:get(SummerKey,SummerMap),
					#summer{is_recharging = IsRecharging,tick = Tick} = Summer,
					case (IsRecharging andalso (Tick < CheckTimeLine)) of
						true ->
							lib_summer:update_summer(Summer#summer{is_recharging = false,is_received = false},PlayerId),
							lib_season_activity:notify_summer_info(PlayerId);
						false -> skip
					end
			end
					  end,SummerKeys)
				  end,PlayerIdList)
.