%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: mod_player
%%% Created on : 2020/8/4 0004 17:56
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(mod_player).
-behavior(mod_server).
-author("glendy").
-include("common.hrl").
-include("combat_queue.hrl").
-include("player.hrl").
-include("ProtoClient_10100.hrl").

-define(PLAYER_SAVE_TICK, player_save_tick).
-define(PLAYER_SAVE_MICROSEC, 180 * 1000).	%% 玩家保存数据库的间隔180s
-define(PLAYER_MAIL_MICROSEC, 10 * 1000).	%% 玩家收取邮件的间隔10s
-define(PLAYER_MAIL_OVERTIME_MICROSEC, 60 * 1000).	%% 玩家删除失效邮件的间隔1min
-define(PLAYER_FORCE_MICROSEC, 1000).		%% 玩家刷新战力的间隔1s
-define(PLAYER_SHOW_MICROSEC, 10 * 1000).	%% 玩家显示模型更新的间隔
-define(PLAYER_RANK_MICROSEC, 10 * 1000). 	%% 玩家排行更新的间隔
-define(PLAYER_RECHARGE_MICROSEC, 10 * 1000).	%% 玩家充值订单读取的间隔
-define(PLAYER_ONE_MICROSEC, 1000). %% %%通用一秒计时器
-define(PLAYER_TEN_MICROSEC, 10 * 1000). %% %%通用10秒计时器
-define(PLAYER_MINUTE_MICROSEC, 60 * 1000). %% %%通用60秒计时器

-export([start_link/2, do_init/1, do_db_init/2, do_cast/2, do_call/3, do_info/2, do_terminate/2, do_code_change/2]).

%% API
-export([
	interval_save_db/0,
	one_sec_timer/0,
	ten_sec_timer/0,
	min_sec_timer/0,
	async_apply/3
%%	auto_train_timer/0
]).

start_link(PlayerBase, PlayerBaseOther) ->
	ProcessName = lib_player:get_process_name(PlayerBase#player_base.id),
	mod_server:start_link({local, ProcessName}, ?MODULE, [PlayerBase, PlayerBaseOther], []).

do_init([PlayerBase, PlayerBaseOther]) ->
	erlang:process_flag(trap_exit, true),
	PlayerId = PlayerBase#player_base.id,
	Login_tick = lib_timer:unixtime(),
	lib_game_cache:update_player_cache(?ETS_PLAYER_BASE, PlayerId, PlayerBase#player_base{login_tick = Login_tick, online = 1, is_logining = 1}, false),
	lib_game_cache:update_player_cache(?ETS_PLAYER_BASE_OTHER, PlayerId, PlayerBaseOther, false),

	start_player_timer(),
	NextZero = lib_timer:next_zero_time(),
	erlang:send_after(1000 * NextZero, self(), everyday_timer),
	NextRefreshTime= lib_timer:next_refresh_time(Login_tick),
	erlang:send_after(1000 * NextRefreshTime, self(), refresh_time),
	NextFive = lib_timer:next_five_time(),
	erlang:send_after(NextFive * 1000,self(),season_timer),
	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(NextHour * 1000,self(),hour_timer),


	State = #player_state{
		sid = PlayerBase#player_base.sid,
		client_ip = PlayerBaseOther#player_base_other.ip,
		player_id = PlayerId,
		is_logining = 1,
		is_logout = 0
	},

	?INFO("player start: ~p ~ts ~p ~p", [State#player_state.sid, State#player_state.client_ip, State#player_state.player_id, 2]),

	{ok, State}.

do_db_init(State, [PlayerBase, _PlayerBaseOther]) ->
	PlayerId = PlayerBase#player_base.id,
	lib_player_data:login(PlayerId),
	?INFO("登录数据加载完成"),
	lib_send:respond_to_client(?MSG_ACTIVE_LOGIN_DATA_OK),
	{noreply, State#player_state{is_logining = 0}}.
do_call(reconnect, _From, State) ->
	lib_send:respond_to_client(#'Proto50100008'{val = 1}),
	State#player_state.sid ! {server_closed, reconnect},
	{reply, ok, State};
do_call(_Info, _From, State) ->
	{reply,ok,State}.

do_cast({socket_msg, Recogn, ProtoMsg}, State) ->
	NewState =
		case rounting(Recogn, State, ProtoMsg) of
			{ok, state, S} -> S;
			_ -> State
		end,
	{noreply, NewState};
do_cast({combat_queue_callback, Data}, State) ->
	?DEBUG("~p~n", [Data]),%%todo
	{noreply, State};

do_cast(_Info, State) ->
	{noreply, State}.

do_info({player_timer, Flag}, State) ->
	loop_player_timer(Flag),
	{noreply, State};
do_info(everyday_timer, State) ->
	NextZero = lib_timer:next_zero_time(),
	erlang:send_after(1000 * NextZero, self(), everyday_timer),
	lib_player:reset_every_day(),
	{noreply, State};

do_info(refresh_time, State) ->
	Tick = lib_timer:unixtime(),
	Next_refresh_time = lib_timer:next_refresh_time(Tick),
	erlang:send_after(1000 * Next_refresh_time, self(), refresh_time),
	lib_player:system_refresh(Tick),
	{noreply, State};

do_info(season_timer, State) ->
	NextFive = lib_timer:next_five_time(),
	erlang:send_after(1000 * NextFive, self(), season_timer),
	lib_player_process:reset_season(),
	{noreply, State};

do_info(hour_timer, State) ->
	NextHour = lib_timer:next_hour_time(),
	erlang:send_after(1000 * NextHour, self(), hour_timer),
	Now_hour = lib_timer:now_hour(),
	?DEBUG("mod_player"),
	lib_integral_point_reset:player_integral_point_resat(Now_hour),
	lib_integral_point_reset:player_every_integral_point_resat(),

	{noreply, State};

do_info(auto_to_train, State) ->
	lib_barrack_train:barrack_auto_train(),
	{noreply, State};

do_info({resource_building_output, BuildingID}, State) ->
	lib_inner_city:notified_resource_building(BuildingID),
	{noreply, State};

do_info(Info, State) ->
	?INFO("mod_player recv: ~p", [Info]),
	{noreply, State}.

do_terminate(_Reason, State) ->
	%% 停掉对应的mod_player进程
%%	?INFO("player stop sleep: ~p", [State#player_state.player_id]),
%%	lib_timer:sleep(10000),
%%	?INFO("player ready stop: ~p", [State#player_state.player_id]),
	PlayerBase = lib_player:get_player_base(),
	lib_player_data:logout(),
	?INFO("player stop: ~p ~p", [State#player_state.player_id, PlayerBase#player_base.is_logining]),
	ok.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

get_player_save_tick() ->
	case erlang:get(?PLAYER_SAVE_TICK) of
		undefined -> 0;
		Val -> Val
	end.

start_player_timer() ->
	start_player_timer(player_timers()).
start_player_timer([]) ->
	ok;
start_player_timer([{Flag, MicroSec, _Func} | T]) ->
	erlang:send_after(MicroSec, self(), {player_timer, Flag}),
	start_player_timer(T).

%% 玩家的定时统一处理接口
loop_player_timer(Flag) ->
%%	?DEBUG("player timer: ~p", [Flag]),
	try
		PlayerBase = lib_player:get_player_base(),
		?JUDGE_RETURN(PlayerBase#player_base.is_logining =:= 0, -1),
		case lists:keyfind(Flag, 1, player_timers()) of
			{Flag, MicroSec, Func} ->
				erlang:send_after(MicroSec, self(), {player_timer, Flag}),
				Func();
			_ ->
				?WARNING("no player timer: ~p", [Flag]),
				skip
		end
	catch
	    throw:{error, _} -> skip
	end.

interval_save_db() ->
	SaveTick = get_player_save_tick(),
	NowTick = lib_timer:unixtime(),
	if
		SaveTick =< NowTick ->
			erlang:put(?PLAYER_SAVE_TICK, NowTick + 180),
			lib_player_data:cache_save();
		true -> skip
	end.

one_sec_timer() ->
	RunList = [
		fun lib_hero_prop:check_and_refresh_all_hero_prop/0,
		fun online_gift:online_gift_icon/0,
		fun lib_player_activity_handle:process_cache_event/0
	],
	lib_common:try_run(RunList)
.

ten_sec_timer() ->
	RunList = [
		fun lib_player_pack:check_item_overdue/0,
		fun lib_player_science:check_science_timeout/0,
		fun lib_player_city_industry:check_finish/0,
		fun lib_player_hero_busy:check_finish/0,
		fun lib_player:check_reset/0,
		fun lib_inner_city:inspect_is_work_ok/0,
		fun lib_player_alien_invasion:check_fresh/0
	],
	lib_common:try_run(RunList)
.

min_sec_timer() ->
	RunList = [

	],
	lib_common:try_run(RunList)
.

%%auto_train_timer() ->
%%	%% 兵营自动训练
%%	lib_barrack_train:barrack_auto_train()
%%.

rounting(Recogn, #player_state{sid = Sid} = State, ProtoMsg) ->
	try
		PlayerBase = lib_player:get_player_base(),
		?JUDGE_RETURN(PlayerBase#player_base.is_logining =:= 0, ?ERROR_PLAYER_LOGIN_ERR),
		erlang:put(recogn, Recogn),
		case Recogn div 1000 of
			10101 -> pp_move:handle(Recogn, State, ProtoMsg);
			10102 -> pp_fight:handle(Recogn, State, ProtoMsg);
			10103 -> pp_pack:handle(Recogn, State, ProtoMsg);
			10104 -> pp_mail:handle(Recogn, State, ProtoMsg);
			10105 -> pp_chat:handle(Recogn, State, ProtoMsg);
			10106 -> pp_league:handle(Recogn, State, ProtoMsg);
			10107 -> pp_friend:handle(Recogn, State, ProtoMsg);
			10108 -> pp_backactivity:handle(Recogn, State, ProtoMsg);
			10109 -> pp_rank0:handle(Recogn, State, ProtoMsg);
			10110 -> pp_recharge:handle(Recogn, State, ProtoMsg);
			10111 -> pp_role:handle(Recogn, State, ProtoMsg);
			10112 -> pp_vip:handle(Recogn, State, ProtoMsg);
			10113 -> pp_chapter:handle(Recogn, State, ProtoMsg);
			10114 -> pp_map:handle(Recogn, State, ProtoMsg);
			10115 -> pp_online_gift:handle(Recogn, State, ProtoMsg);
			10116 -> pp_hero:handle(Recogn, State, ProtoMsg);
			10118 -> pp_player_task:handle(Recogn, State, ProtoMsg);
			10119 -> pp_function_open:handle(Recogn, State, ProtoMsg);
			10120 -> pp_head_icon:handle(Recogn, State, ProtoMsg);
			10121 -> pp_troops:handle(Recogn, State, ProtoMsg);
			10122 -> pp_season_and_days:handle(Recogn, State, ProtoMsg)  ;
			10123 -> pp_inner_city:handle(Recogn, State, ProtoMsg) ;
			10124 -> pp_pub_recruit:handle(Recogn, State, ProtoMsg)  ;
			10126 -> pp_player_equip:handle(Recogn, State, ProtoMsg);
			10127 -> pp_barrack_train:handle(Recogn, State, ProtoMsg);
			10128 -> pp_country:handle(Recogn, State, ProtoMsg);
			10129 -> pp_honor_title:handle(Recogn, State, ProtoMsg);
			10130 -> pp_logistics_center:handle(Recogn, State, ProtoMsg);
			10131 -> pp_holy_spirit_hall:handle(Recogn, State, ProtoMsg);
			10132 -> pp_nobility:handle(Recogn, State, ProtoMsg);
			10133 -> pp_city_building:handle(Recogn, State, ProtoMsg);
			10134 -> pp_dungeoned:handle(Recogn, State, ProtoMsg);
			10135 -> pp_science:handle(Recogn, State, ProtoMsg);
			10136 -> pp_city_industry:handle(Recogn, State, ProtoMsg);
			10137 -> pp_arena:handle(Recogn, State, ProtoMsg);
			10138 -> pp_hero_busy:handle(Recogn, State, ProtoMsg);
			10139 -> pp_task_new:handle(Recogn, State, ProtoMsg);
			10140 -> pp_dragon_palace_adventure:handle(Recogn, State, ProtoMsg);
			10141 -> pp_city_visiting:handle(Recogn, State, ProtoMsg);
			10142 -> pp_meritorious_award:handle(Recogn, State, ProtoMsg);
			10143 -> pp_alien:handle(Recogn, State, ProtoMsg);
			10144 -> pp_shop:handle(Recogn, State, ProtoMsg);
			10145 -> pp_challenge:handle(Recogn, State, ProtoMsg);
			10146 -> pp_puppet:handle(Recogn, State, ProtoMsg);
			10148 -> pp_country_war_task:handle(Recogn, State, ProtoMsg);
			10149 -> pp_honour_top:handle(Recogn, State, ProtoMsg);
			10150 -> pp_activity:handle(Recogn, State, ProtoMsg);
			10151 -> pp_star:handle(Recogn, State, ProtoMsg);
			10152 -> pp_season_activity:handle(Recogn, State, ProtoMsg);
			10153 -> pp_gift_code:handle(Recogn, State, ProtoMsg);
			10154 -> pp_new_map:handle(Recogn, State, ProtoMsg);
			10155 -> pp_troop:handle(Recogn, State, ProtoMsg);
			10156 -> pp_activity:handle(Recogn, State, ProtoMsg);
			10157 -> pp_welfare_exchange:handle(Recogn, State, ProtoMsg);
			_ ->
				?ERROR("not handle recogn:~w, PlayerId:~w, Data:~w ~n", [Recogn, State#player_state.player_id, ProtoMsg]),
				ok
		end
	catch
		throw:{error, ErrCode} ->
			ResRecogn = lib_msg:request_code_to_respond_code(Recogn),
			if
				erlang:is_integer(ErrCode) ->
					lib_send:respond_to_client_by_sid(Sid, ResRecogn, ErrCode);
				true ->
					?WARNING("recogn[proto] throw error: ~p ~p", [Recogn, ErrCode])
			end,
			error;
		_:Reason ->
			?ERROR("recogn[proto] error: ~p ~p~n ~p", [Recogn, Reason, erlang:get_stacktrace()]), error
	end.

%% 玩家身上的定时处理接口
player_timers() ->
	[
		{save_timer, ?PLAYER_SAVE_MICROSEC, fun mod_player:interval_save_db/0},
		{mail_timer, ?PLAYER_MAIL_MICROSEC, fun lib_player_mail:check_receive_mail/0},
		%%{mail_overtime_timer, ?PLAYER_MAIL_OVERTIME_MICROSEC, fun lib_player_mail:check_remove_expire_mail/0},
		%%{force_timer, ?PLAYER_FORCE_MICROSEC, fun lib_player_fight:check_update_player_force/0},
		{show_role_timer, ?PLAYER_SHOW_MICROSEC, fun lib_player_copy:check_update_player_show/0},
		{rank_timer, ?PLAYER_RANK_MICROSEC, fun lib_player_rank:check_update_rank/0},
		{recharge_timer, ?PLAYER_RECHARGE_MICROSEC, fun lib_player_recharge:check_recharge_order/0},
		{ont_sec_timer, ?PLAYER_ONE_MICROSEC, fun mod_player:one_sec_timer/0},
		{ten_sec_timer, ?PLAYER_TEN_MICROSEC, fun mod_player:ten_sec_timer/0},
		{min_sec_timer, ?PLAYER_MINUTE_MICROSEC, fun mod_player:min_sec_timer/0}
%%		{auto_train_timer, maps:get(value, tb_const:get(auto_train_interval)), fun mod_player:auto_train_timer/0}
	].

async_apply(PlayerId, Fun, Args) ->
	mod_server:async_apply(lib_player:get_pid(PlayerId), Fun, Args)
.