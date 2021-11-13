%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 3月 2021 17:37
%%%-------------------------------------------------------------------
-module(mod_challenge).
-author("df").
-include("common.hrl").
-include("challenge.hrl").

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
	?DEBUG("challenge_gather_init: ~p ~n",[1]),
	{ok, #challenge_gather{}}.

do_db_init(_State, []) ->
	ChallengeGather = db_challenge:load_challenge(),
	lib_challenge:put_challenge_gather(ChallengeGather),
	mod_start(),
	{noreply, _State}
.

do_call(_Info, _From, State) ->
	{reply,State,State}.

%% 接收战斗返回
do_cast({combat_queue_callback, Data}, State) ->
%%	?DEBUG("~p~n", [Data]),
	lib_challenge:fight_result(Data),
	{noreply, State};

do_cast(_Info, State) ->
	{noreply, State}.


%% 擂台赛开启累加定时器
do_info(add_prize_pool, State) ->
	lib_challenge:add_pool(),
	{noreply, State};

%% 攻擂结算定时器
do_info({challenge_attack,Data,L_info,R_info,Type}, State) ->
	?DEBUG("开始结算"),
	lib_challenge:process_fight_result(Data,L_info,R_info,Type),
	{noreply, State};

%% 恢复攻擂次数定时器
do_info({recover_attack_time,PlayerId}, State) ->
	lib_challenge:recover_attack(PlayerId),
	{noreply, State};

%% 擂主增加定时器
do_info({time_winner_add,Type,PlayerId}, State) ->
	lib_challenge:winner_add(Type,PlayerId),
	{noreply, State};

%% 通知图标
do_info(icon_time, State) ->
	update_stage(icon_time),
	{noreply, State};

%% 开始竞猜
do_info(open_time, State) ->
	update_stage(open_time),
	{noreply, State};

%% 开始攻守擂
do_info(run_time, State) ->
	update_stage(run_time),
	{noreply, State};

%% 结果展示
do_info(show_time, State) ->
	update_stage(show_time),
	{noreply, State};

%% 关闭活动
do_info(over_time, State) ->
	update_stage(over_time),
	{noreply, State};




do_info(_Info, State) ->
	{noreply, State}.

do_code_change(_Mod, State) ->
	mod_server:put_callback_mod(?MODULE),
	{ok, State}.

do_terminate(_Reason, _State) ->
	db_challenge:save_challenge(lib_challenge:get_challenge_gather()),
	?INFO("mod_challenge stop ~n").


%=================%
mod_start() ->
	Day = this_activity_start_day(),
	Now_tick = lib_timer:unixtime(),
	OpenDay = Now_tick + Day * 86400,
	OpenZeroTick = lib_timer:current_zero_unixtime(OpenDay),
	IconTime = lib_challenge_api:icon_time(),
	case Now_tick > (IconTime + OpenZeroTick) of
		 false -> update_stage(over_time);
		 true  ->	T =  Now_tick - OpenZeroTick,
			 		Open = lib_challenge_api:open_time(),
					Run = lib_challenge_api:run_time(),
			 		Show = lib_challenge_api:show_time(),
			 		Over = lib_challenge_api:over_time(),
			 	  if
					  T < Open -> update_stage(icon_time);
					  (T > Open) andalso (T < Run)-> update_stage(open_time);
					  (T > Run) andalso (T < Show)-> update_stage(run_time);
					  (T > Show) andalso (T < Over)-> update_stage(show_time);
					  T > Over -> update_stage(over_time);
					  true -> skip
				  end
	end
.

this_activity_start_day() ->
	Next_type = lib_challenge_api:get_challenge_main_type(),
	InfoList = lib_challenge_api:get_open_info(),
	[{_,_,Day}] = lists:filter(fun({T,_,_})-> T =:= Next_type end,InfoList),
	Day
.
next_activity_start_day() ->
	Next_type = lib_challenge_api:get_challenge_main_type(),
	InfoList = lib_challenge_api:get_open_info(),
	[{_,_,Day}] = lists:filter(fun({T,_,_})-> T =/= Next_type end,InfoList),
	Day
.

update_stage(Type) ->
	Stage = lib_challenge_api:get_activity_stage(),
	Tick = lib_timer:unixtime(),
	update_stage(Tick,Stage,Type)
.

 update_stage(Tick,_Stage,icon_time) ->
	ZeroTick = lib_timer:current_zero_unixtime(Tick),
	Open = lib_challenge_api:open_time(),
	Time = ZeroTick + Open - Tick,
	?DEBUG("~p秒后开启竞猜",[Time]),
	erlang:send_after(Time * 1000, self(),open_time),
	lib_challenge_api:icon_respond()
;

update_stage(Tick,Stage,open_time) ->
	ZeroTick = lib_timer:current_zero_unixtime(Tick),
	Run = lib_challenge_api:run_time(),
	Time = ZeroTick + Run - Tick,
	?DEBUG("~p秒后开启攻擂",[Time]),
	erlang:send_after(Time * 1000, self(),run_time),
	case Stage =:= ?GUESS_TIME of
		 true -> skip;
		 false-> lib_challenge_api:open_challenge(?GUESS_TIME)
	end
;

update_stage(Tick,Stage,run_time) ->
	Tick = lib_timer:unixtime(),
	ZeroTick = lib_timer:current_zero_unixtime(Tick),
	Show = lib_challenge_api:show_time(),
	Time = ZeroTick + Show - Tick,
	?DEBUG("~p秒后开启展示",[Time]),
	erlang:send_after(Time * 1000, self(),show_time),
	case Stage =:= ?RUN_TIME of
		true -> fight_continue();
		false-> lib_challenge_api:run_challenge(?RUN_TIME)
	end
;

update_stage(Tick,Stage,show_time) ->
	ZeroTick = lib_timer:current_zero_unixtime(Tick),
	Over = lib_challenge_api:over_time(),
	Time = ZeroTick + Over - Tick,
	?DEBUG("~p秒后开启活动结束",[Time]),
	erlang:send_after(Time * 1000, self(),over_time),
	case Stage =:= ?OVER_TIME of
		true -> skip;
		false-> fight_continue(),lib_challenge_api:show_challenge(?OVER_TIME)
	end
;

update_stage(Tick,Stage,over_time) ->
	Day = next_activity_start_day(),
	OpenDay = Tick + Day * 86400,
	OpenZeroTick = lib_timer:current_zero_unixtime(OpenDay),
	IconTime = lib_challenge_api:icon_time(),
	Time = OpenZeroTick + IconTime - Tick,
	?DEBUG("~p秒后通知图标",[Time]),
	erlang:send_after(Time * 1000, self(),icon_time),
	case Stage =:= ?NO_START_TIME of
		true -> skip;
		false-> lib_challenge_api:close_challenge(?NO_START_TIME)
	end
;

update_stage(_Tick,_Stage,_) ->
	skip
.

fight_continue() ->
	lib_challenge:add_prize_pool(),
	lists:foreach(fun(Type)->
		Challenge = lib_challenge_api:get_challenge(Type),
		Winner = lib_challenge_api:winner_id(Type),
		case Winner =/= 0 of
			true -> lib_challenge:time_winner_add(Type,Winner);
			false-> skip
		end,
		case Challenge#challenge.attack_num > 0 of
			true -> lib_challenge:fight(Type);
			false-> skip
		end
	end,lib_challenge_api:challenge_type_list()),
	Gather = lib_challenge:get_challenge_gather(),
	lists:foreach(fun(PlayerId)->
		Time = lib_challenge_api:get_recover_time(PlayerId),
		case Time =< 0 of
			true -> lib_challenge:recover_attack(PlayerId);
			false-> erlang:send_after(Time * 1000, self(),{recover_attack_time,PlayerId})
		end
	end,maps:keys(Gather#challenge_gather.player_map))

.