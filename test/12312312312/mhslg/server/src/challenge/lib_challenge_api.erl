%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 3月 2021 10:21
%%%-------------------------------------------------------------------
-module(lib_challenge_api).
-author("df").
-include("challenge.hrl").
-include("common.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("fight_prop.hrl").
-include("chat.hrl").
-include("ProtoClient_10145.hrl").
-include("hero.hrl").
%% 地图进程调用
-export([
	get_activity_stage/0,
	update_activity_stage/1,
	get_player_challenge/1,				%% 获得玩家擂台信息
	update_player_challenge/2,			%% 更改玩家擂台信息
	get_challenge/1,					%% 获得擂台信息
	update_challenge/2,					%% 更改擂台信息
	add_guess/1,						%% 增加黑马竞猜
	get_dark_house_stage/0,				%% 获得黑马擂台类型
	add_use/2,							%% 增加使用者
	leaven_use/2,						%% 减少使用者
	add_attack_info/3,					%% 增加擂台挑战队列
	delete_attack_info/2,				%% 减少擂台挑战队列
	calculate_attack_buff/1,			%% 计算进攻buff
	winner_id/1,						%% 获得擂主id
	add_report/7,						%% 增加战报
	get_one_report/2,					%% 获得单条战报
	get_recover_time/1,					%% 恢复攻擂次数秒数
	add_player_money/2,					%% 增加玩家擂台币
	became_winner/4 					%% 成为擂主
]).
%% 地图进程定时调用
-export([
	icon_respond/0,						%% 图标通知倒计时
	open_challenge/1,					%% 开启王座之争
	run_challenge/1,					%% 进行攻守擂
	show_challenge/1,					%% 进入展示阶段
	close_challenge/1					%% 关闭活动
]).


%% 无限制进程
-export([
	get_challenge_main_type/0,			%% 本次擂台类型
%%	get_stage/0,						%% 获得擂台赛阶段
	get_stage_timer/1,					%% 获得阶段剩余时间
	get_hero_num/1,						%% 获得可上阵英雄数量
	challenge_type_list/0,				%% 王座类型列表
	buy_time_need/1,					%% 购买攻擂次数需要道具
	get_open_need_time/0,				%% 下次擂台赛类型及所需时间
	get_attack_time/0,					%% 进攻时间
	basics_attack_time/0				%% 基础攻击次数
]).
-export([
	get_open_info/0,
	open_time/0,
	run_time/0,
	show_time/0,
	over_time/0,
	icon_time/0,
	money_id/0
]).


get_activity_stage() ->
	Gather = lib_challenge:get_challenge_gather(),
	Gather#challenge_gather.stage
.

update_activity_stage(Stage) ->
	Gather = lib_challenge:get_challenge_gather(),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{stage = Stage}),
	case Stage of
		?NO_START_TIME -> 	skip;
		?GUESS_TIME ->		open_challenge(Stage);
		?RUN_TIME ->		run_challenge(Stage);
		?OVER_TIME ->		show_challenge(Stage);
		?ACTIVITY_OVER ->	close_challenge(?NO_START_TIME)
	end
.

get_player_challenge(PlayerId) ->
	Gather = lib_challenge:get_challenge_gather(),
	maps:get(PlayerId,Gather#challenge_gather.player_map,#player_challenge{id = PlayerId,attack_time = basics_attack_time()})
.
update_player_challenge(PlayerId, PlayerChallenge) when is_record(PlayerChallenge, player_challenge)->
	Gather = lib_challenge:get_challenge_gather(),
	New_maps = maps:put(PlayerId,PlayerChallenge,Gather#challenge_gather.player_map),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{player_map = New_maps})
.
get_challenge(Type) ->
	Gather = lib_challenge:get_challenge_gather(),
	maps:get(Type,Gather#challenge_gather.challenge_map,#challenge{type = Type})
.
update_challenge(Type,Challenge) when is_record(Challenge, challenge) ->
	Gather = lib_challenge:get_challenge_gather(),
	New_maps = maps:put(Type,Challenge,Gather#challenge_gather.challenge_map),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{challenge_map = New_maps})
.
add_guess(Type) ->
	Gather = lib_challenge:get_challenge_gather(),
	Guess = maps:get(Type,Gather#challenge_gather.guess_map,#challenge_guess{type = Type}),
	New_maps = maps:put(Type,Guess#challenge_guess{num = Guess#challenge_guess.num + 1,tick = lib_timer:unixtime()},Gather#challenge_gather.guess_map),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{guess_map = New_maps})
.
get_guess_num(Type) ->
	Gather = lib_challenge:get_challenge_gather(),
	Guess = maps:get(Type,Gather#challenge_gather.guess_map,#challenge_guess{type = Type}),
	Guess#challenge_guess.num
.
get_guess_tick(Type) ->
	Gather = lib_challenge:get_challenge_gather(),
	Guess = maps:get(Type,Gather#challenge_gather.guess_map,#challenge_guess{type = Type}),
	Guess#challenge_guess.tick
.
get_dark_house_stage() ->
	NowStage = get_activity_stage(),
	case NowStage < ?GUESS_TIME of
		 true -> 0 ;
		 false->#challenge_gather{guess_map = Map} = lib_challenge:get_challenge_gather(),
			Key_list = maps:keys(Map),
			case Key_list =:= [] of
				true -> 0;
				false -> get_dark_house_stage(Key_list)
			end
	end
.
get_dark_house_stage([Key|Key_list]) ->
	get_dark_house_stage(Key_list,Key)
.
get_dark_house_stage([Key|Key_list],Min) ->
	case (get_guess_num(Key) < get_guess_num(Min)) orelse (get_guess_num(Key) =:= get_guess_num(Min) andalso get_guess_tick(Key) < get_guess_num(Min))  of
		true -> get_dark_house_stage(Key_list,Key);
		false-> get_dark_house_stage(Key_list,Min)
	end
;
get_dark_house_stage([],Min) ->
	Min
.

add_use(PlayerId,Function) ->
	Challenge_gather = lib_challenge:get_challenge_gather(),
	case Function of
		1 ->
			case lists:member(PlayerId,Challenge_gather#challenge_gather.online_list) of
				true -> skip;
				false-> New_list = lists:append([PlayerId],Challenge_gather#challenge_gather.online_list),
						lib_challenge:put_challenge_gather(Challenge_gather#challenge_gather{online_list = New_list})
			end;
		2 ->
			case lists:member(PlayerId,Challenge_gather#challenge_gather.report_list) of
				true -> skip;
				false-> New_list = lists:append([PlayerId],Challenge_gather#challenge_gather.report_list),
						lib_challenge:put_challenge_gather(Challenge_gather#challenge_gather{report_list = New_list})
			end
	end
.
leaven_use(PlayerId,Function) ->
	Challenge_gather = lib_challenge:get_challenge_gather(),
	case Function of
		1 ->New_list = lists:delete(PlayerId,Challenge_gather#challenge_gather.online_list),
			lib_challenge:put_challenge_gather(Challenge_gather#challenge_gather{online_list = New_list});
		2 ->New_list = lists:delete(PlayerId,Challenge_gather#challenge_gather.report_list),
			lib_challenge:put_challenge_gather(Challenge_gather#challenge_gather{report_list = New_list})
	end
.
add_attack_info(Type,Show,HeroList) ->
	Tick = lib_timer:unixtime(),
	PlayerId = Show#player_show.id,
	Player_challenge_fight = #player_challenge_fight{
		id = PlayerId,tick = Tick,show = Show,hero_list = HeroList,
		fighters = lib_combat_queue_api:hero_list_fighters(Show,HeroList)},
	case winner_id(Type) =:= 0 of
		 true  ->
			 became_winner(PlayerId,Type,Player_challenge_fight,Tick),
			 Basics = maps:get(value, tb_challenge_const:get(get_basics)),
			 add_player_money(Basics,PlayerId),
			 Gather = lib_challenge:get_challenge_gather(),
			 lists:foreach(fun(Id) ->
			 	info_to_client(Id,challenge_type_list())
			 end,Gather#challenge_gather.online_list)
		;
		 false ->
			 Challenge = get_challenge(Type),
			 NewMap = maps:put(PlayerId,Player_challenge_fight,Challenge#challenge.attack_info),
			 Attack_num = Challenge#challenge.attack_num + 1,
			 AttackIdList = Challenge#challenge.attack_id ++ [PlayerId],
			 ?DEBUG("玩家:~p   开始战斗",[PlayerId]),
			 update_challenge(Type,Challenge#challenge{attack_info = NewMap,attack_num = Attack_num,attack_id = AttackIdList}),
			 NewChallenge = get_challenge(Type),
			 case NewChallenge#challenge.attack_num =:= 1 of
				 true ->  lib_challenge:challenge_fight(Type);
				 false-> skip
			 end

	end,
	Player = get_player_challenge(PlayerId),
	case Player#player_challenge.attack_tick =:= 0 of
		 true ->update_player_challenge(PlayerId,Player#player_challenge{attack_time = Player#player_challenge.attack_time - 1,attack_tick = Tick}),
			 	lib_challenge:recover_attack_time(PlayerId);
		false ->update_player_challenge(PlayerId,Player#player_challenge{attack_time = Player#player_challenge.attack_time - 1})
	end
.

delete_attack_info(Type,PlayerId) ->
	Challenge = get_challenge(Type),
	NewMap = maps:remove(PlayerId,Challenge#challenge.attack_info),
	?DEBUG("玩家:~p   战斗完毕",[PlayerId]),
	AttackIdList = lists:delete(PlayerId,Challenge#challenge.attack_id),
	update_challenge(Type,Challenge#challenge{
		attack_num = Challenge#challenge.attack_num - 1,attack_info = NewMap,attack_id = AttackIdList,now_record_id = 0})
.


calculate_attack_buff(Type) ->
	Challenge = get_challenge(Type),
	Stage = get_activity_stage(),
	case (Stage =/= ?RUN_TIME) andalso (Challenge#challenge.attack_num =:= 0) of
		 true ->	update_challenge(Type,Challenge#challenge{attack_buff = []});
		 false-> 	Time = maps:get(value, tb_challenge_const:get(time_buff)),
					WimTime = maps:get(value, tb_challenge_const:get(win_time_buff)),
					DefendInfo = Challenge#challenge.defend_order,
					Id = case DefendInfo#defend_order.id =:= 0 of
							  true -> 0;
							 false ->((lib_timer:unixtime() - DefendInfo#defend_order.tick) div Time) + (DefendInfo#defend_order.win_time div WimTime)
					end,
					MaxId = lists:last(tb_challenge_buff:get_list()),
					Attack_buff =
					case Id =:= 0 of
						true -> [];
						false->	case Id > MaxId of
								true -> maps:get(value, tb_challenge_buff:get(MaxId));
								false-> maps:get(value, tb_challenge_buff:get(Id))
								end
					end,
					update_challenge(Type,Challenge#challenge{attack_buff = Attack_buff})
	end
.

winner_id(Type) ->
	Challenge = get_challenge(Type),
	Winner = Challenge#challenge.defend_info,
	Winner#player_challenge_fight.id
.

add_report(Record_id,Type,Data,Tick,DefendShow,AttackShow,Award) ->
	Challenge = get_challenge(Type),
	Map = Challenge#challenge.report,
	Win = case Data#callback_data0.win_type of
			  ?FIGHTER_TYPE_L -> 1;
			  ?FIGHTER_TYPE_R -> 0
	end,
	NewMap = maps:put(Record_id,#challenge_report{
		record_id = Record_id,tick = Tick,l_id = AttackShow#player_show.id,l_show = AttackShow,
		r_id = DefendShow#player_show.id,r_show = DefendShow,win = Win,award = Award,winner = 1},Map),
	update_challenge(Type,Challenge#challenge{report = NewMap})
.

get_one_report(Record_id,Type) ->
	Challenge = get_challenge(Type),
	Map = Challenge#challenge.report,
	Report = maps:get(Record_id,Map,#challenge_report{}),
	#'ProtoReport'{left_show = lib_common:player_show_to_proto(Report#challenge_report.l_show),
		right_show =  lib_common:player_show_to_proto(Report#challenge_report.r_show),
		tick = Report#challenge_report.tick,winner =  Report#challenge_report.win,award_info = Report#challenge_report.award,
		info1 =  Report#challenge_report.winner,info2 =  Report#challenge_report.record_id}

.
get_recover_time(PlayerId) ->
	PlayerChallenge = get_player_challenge(PlayerId),
	Min = basics_attack_time(),
	Tick = lib_timer:unixtime(),
	Time = 	maps:get(value, tb_challenge_const:get(attack_time_regain)),
	case PlayerChallenge#player_challenge.attack_time < Min of
		  true	-> Time - (Tick - PlayerChallenge#player_challenge.attack_tick);
		  false -> 0
	end
.

add_player_money(Num,PlayerId) ->
	Player = get_player_challenge(PlayerId),
	Item = case Player#player_challenge.item =:= [] of
			   true -> [money_id(),Num];
			   false-> [_,OldNum] = Player#player_challenge.item,
				   [money_id(),OldNum + Num]
		   end,
	update_player_challenge(PlayerId,Player#player_challenge{item = Item}),
	Pid = lib_player:get_pid(PlayerId),
	case is_pid(Pid) of
		false -> skip;
		true -> lib_challenge:get_item(PlayerId,Pid)
	end
.

became_winner(PlayerId,Type,Player_challenge_fight,Tick) ->
	Challenge = get_challenge(Type),
	Defend_order = #defend_order{id = PlayerId, tick = Tick},
	update_challenge(Type,Challenge#challenge{defend_info = Player_challenge_fight#player_challenge_fight{tick = 0,
		hero_troop = get_first_troop(Player_challenge_fight#player_challenge_fight.hero_list)},defend_order = Defend_order,attack_buff = []}),
	lib_challenge:time_winner_add(Type,PlayerId),
	%% 发送广播
	Main = get_challenge_main_type(),
	BroadCaseId =
	case (Challenge#challenge.attack_num =:= 0) andalso (get_activity_stage() =/= ?RUN_TIME) of
		true ->
			 Challenge = get_challenge(Type),
			 Info = Challenge#challenge.defend_info,
			 Win = Info#player_challenge_fight.id,
			 Pond = Challenge#challenge.pond,
			 add_player_money(Pond,Win),
			 update_challenge(Type,Challenge#challenge{pond = 0,now_record_id = 0}),
			?CHALLENGE_BROAD_END;
		false-> ?CHALLENGE_BROAD
	end,
	challenge_BroadCase(Player_challenge_fight#player_challenge_fight.show, (Main * 100 + Type), BroadCaseId)
.
get_first_troop(Hero_list)->
	lists:foldl(fun(Hero,Map)->
		{Front,Back} = lib_challenge:hero_initial_troop(Hero),
		All = Front + Back,
		maps:put(Hero#hero_base.id,#challenge_hero_troop{hero_id = Hero#hero_base.id,all_troop =All,now_troop = All},Map)
	end,maps:new(),Hero_list)
.

%%=====================%%
get_open_info() ->
	Season = lib_season_and_days_api:get_season(),
	Day = lib_season_and_days_api:get_season_day(),
	List = lists:filter(fun(K)->
		maps:get(season, tb_challenge_open:get(K)) =:= Season
	end, tb_challenge_open:get_list()),
	lists:foldr(fun(K,L)->
	#{'type' := Type, 'open' := Open, 'interval' := Interval} = tb_challenge_open:get(K),
		{Time,Next_day} = case Day < Open of
				  true -> {1,(Open - Day)};
				  false-> IntervalDay = Day - Open,
					  {(IntervalDay div Interval) + 1,
						  case (IntervalDay rem Interval) =:= 0 of
							    true -> 0;
							    false-> Interval- (IntervalDay rem Interval)
							end
					  }
				end,
		[{Type,Time,Next_day}] ++ L
	end,[],List)
.
stage_time_info() ->
	T1 = open_time(), T2 = run_time(),
	T3 = show_time(), T4 = over_time(),
	[{?NO_START_TIME,0},{?GUESS_TIME,T1},{?RUN_TIME,T2},{?OVER_TIME,T3},{?ACTIVITY_OVER,T4}]
.
open_time() ->
	maps:get(timevalue, tb_challenge_const:get(guess_time))
.
run_time() ->
	maps:get(timevalue, tb_challenge_const:get(run_time))
.
show_time() ->
	maps:get(timevalue, tb_challenge_const:get(over_time))
.
over_time() ->
	maps:get(timevalue, tb_challenge_const:get(activity_over))
.
icon_time() ->
	maps:get(timevalue, tb_challenge_const:get(start_icon))
.
money_id() ->
	maps:get(value, tb_challenge_const:get(money))
.
get_challenge_main_type() ->
	InfoList = get_open_info(),
	get_challenge_main_type(InfoList)
.
get_challenge_main_type([{T1,_,N1},{T2,_,N2}]) ->
	case N1 < N2 of
		true  -> T1;
		false -> T2
	end
.

get_open_need_time() ->
	Next_type = get_challenge_main_type(),
	InfoList = get_open_info(),
	[{_,_,Day}] = lists:filter(fun({T,_,_})-> T =:= Next_type end,InfoList),
	Now_tick = lib_timer:unixtime(),
	OpenDay = Now_tick + Day * 86400,
	OpenZeroTick = lib_timer:current_zero_unixtime(OpenDay),
	OpenTime = open_time(),
	T = OpenZeroTick + OpenTime - Now_tick,
	NeedTime = case T < 0 of
				   true  -> 0;
				   false -> T
	end,
	Is_open = case T =:= 0 of
				  true -> 1;
				  false -> 0
			  end,
	{Next_type,Is_open,NeedTime}
.

get_attack_time() ->
	OneTime = maps:get(value, tb_challenge_const:get(hero_attack_time)),
	HeroNum = get_hero_num(get_challenge_main_type()),
	OneTime * HeroNum
.

basics_attack_time()->
	maps:get(value, tb_challenge_const:get(basics_attack_time))
.

get_stage_timer(Stage) ->
	case (Stage =:= ?ACTIVITY_OVER) orelse (Stage =:= ?NO_START_TIME)  of
		true -> 0;
		false->	NowTick = lib_timer:unixtime(),
				TodayZero = lib_timer:current_zero_unixtime(NowTick),
				[{_,Time}] = lists:filter(fun({T,_})->
					T =:= (Stage + 1)
				end,stage_time_info()),
				(TodayZero + Time) - NowTick
	end
.

get_hero_num(Type) ->
	List = maps:get(jsonvalue, tb_challenge_const:get(hero_num)),
	[{_,Time,_}] = lists:filter(fun({T,_,_})-> T =:= Type end, get_open_info()),
	Map = lists:foldl(fun([T,N],Map) -> maps:put(T,N,Map)end,maps:new(),List),
	ActivityTime =
	lists:foldr(fun(T,T1) ->
		case (Time >= T) andalso (T > T1) of
			  true -> T;
			  false-> T1
		end
	end,0,maps:keys(Map)),
	maps:get(ActivityTime,Map)
.

challenge_type_list() ->
	maps:get(jsonvalue, tb_challenge_const:get(challenge_type))
.

buy_time_need(Time) ->
	List = maps:get(jsonvalue, tb_challenge_const:get(buy_attack_time)),
	[maps:get(value, tb_const:get(gold)),
		buy_time_need(Time,List)]
.
buy_time_need(Time,[[_Need_Time,Num]|List]) ->
	buy_time_need(Time,List,Num)
.
buy_time_need(Time,[[Need_Time,Num]|List],NeedNum) ->
	case Time >= Need_Time of
		true -> buy_time_need(Time,List,Num);
		false-> NeedNum
	end
;
buy_time_need(_Time,[],NeedNum) ->
	NeedNum
.

icon_respond() ->
	{Type,_Is_open,Time} = lib_challenge_api:get_open_need_time(),
	Stage = lib_challenge_api:get_activity_stage(),
	Open = case Stage =:= ?NO_START_TIME of
			true -> Stage;
			false-> 1
		end,
	Respond = #'Proto80145008'{
		is_open = Open,
		time = Time,
		type = Type
	},
	mod_server:async_status(mod_player_manage:get_pid(), fun mod_player_manage:async_all_player_notify/2, [Respond])
.
open_challenge(Stage)->
	Gather = lib_challenge:get_challenge_gather(),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{stage = Stage,player_map = maps:new()}),
	lists:foreach(fun(Id) ->
		info_to_client(Id,[])
	end,Gather#challenge_gather.online_list),
	icon_respond()
.
run_challenge(Stage)->
	Gather = lib_challenge:get_challenge_gather(),
	Dark_house_stage = get_dark_house_stage(),
	?DEBUG("黑马擂台为 ~p",[Dark_house_stage]),
	lists:foreach(fun(Id) ->
		Player = get_player_challenge(Id),
		case (Dark_house_stage =:= Player#player_challenge.guess_type) andalso (Player#player_challenge.guess_type =/= 0) of
			true -> ?DEBUG("猜种黑马擂台"),
					add_player_money(maps:get(value, tb_challenge_const:get(dark_horse_award)),Id);
			false-> skip
		end
	end,maps:keys(Gather#challenge_gather.player_map)),
	lists:foreach(fun(Type) ->
		Challenge = get_challenge(Type),
		Pond =
		case Dark_house_stage =:= Type of
			true ->maps:get(value, tb_challenge_const:get(special_basics));
			false ->maps:get(value, tb_challenge_const:get(common_basics))
		end,
		update_challenge(Type,Challenge#challenge{pond = Pond})
	end,challenge_type_list()),
	NewGather = lib_challenge:get_challenge_gather(),
	lib_challenge:put_challenge_gather(NewGather#challenge_gather{fight_type = 1,stage = Stage}),
	lib_challenge:add_prize_pool(),
	lists:foreach(fun(Id) ->
		info_to_client(Id,challenge_type_list())
	 end,NewGather#challenge_gather.online_list),
	icon_respond()
.
show_challenge(Stage)->
	Gather = lib_challenge:get_challenge_gather(),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{fight_type = 0,stage = Stage}),
	lists:foreach(fun(Type)->
		Challenge = get_challenge(Type),
		case Challenge#challenge.attack_num =:= 0 of
			  false ->skip;
			  true  ->Info = Challenge#challenge.defend_info,
				  Win = Info#player_challenge_fight.id,
				  case Win =:= 0 of
					   true ->skip;
					   false->Pond = Challenge#challenge.pond,
						   add_player_money(Pond,Win),
						   Main = lib_challenge_api:get_challenge_main_type(),
						   challenge_BroadCase(Info#player_challenge_fight.show, (Main * 100 + Type), ?CHALLENGE_BROAD_END)
				  end,
				  update_challenge(Type,Challenge#challenge{
					  attack_info = maps:new(), attack_num = 0,
					  attack_buff = [], pond = 0, now_record_id = 0
				  })
		end
	end,challenge_type_list()),
	lists:foreach(fun(Id) ->
		info_to_client(Id,challenge_type_list())
	end,Gather#challenge_gather.online_list),
	icon_respond()

.
close_challenge(Stage)->
	icon_respond(),
	lists:foreach(fun(Type)->
		update_challenge(Type,#challenge{type = Type})
	end,challenge_type_list()),
	Gather = lib_challenge:get_challenge_gather(),
	lib_challenge:put_challenge_gather(Gather#challenge_gather{stage = Stage,challenge_map = maps:new(),
		guess_map = maps:new(), online_list = [], report_list = []	}),
	lists:foreach(fun(Id) ->
		info_to_client(Id,challenge_type_list())
	end,Gather#challenge_gather.online_list),
	%% 活动结束删除回放记录
	db_fight:delete_fight_record(?CALL_FIGHT_TYPE_CHALLENGE, #{})
.

info_to_client(Player_id,ChallengeList) ->
	Player = get_player_challenge(Player_id),
	Stage = get_activity_stage(),
	Respond = #'Proto80145006'{
		challenge_info = lib_challenge:get_challenge_info(ChallengeList),
		type = get_dark_house_stage(),
		choose_type = Player#player_challenge.guess_type,
		stage = Stage,
		timer = get_stage_timer(Stage),
		challenge_time =  Player#player_challenge.attack_time,
		recover_time = get_recover_time(Player_id),
		buy_time = Player#player_challenge.buy_time
	},
	lib_send:respond_to_client_by_pid(lib_player:get_pid(Player_id), Respond)
%%	?DEBUG("Respond ~p",[Respond])
.

challenge_BroadCase(Show, Type, BroadCaseId) ->
	ShoutMsg0 = lib_broadcast_api:push_broad_arg(lib_broadcast_api:create_broadcast(BroadCaseId),?BROAD_TYPE_COUNTRY_ID, Show#player_show.country ),
	ShoutMsg1 = lib_broadcast_api:push_broad_arg(ShoutMsg0,  ?BROAD_TYPE_ROLE_INFO,#'ProtoBroadRole'{role_id = Show#player_show.id,role_name = Show#player_show.name}),
	ShoutMsg = lib_broadcast_api:push_broad_arg(ShoutMsg1,?BROAD_TYPE_CHALLENGE, Type),
	lib_broadcast_api:send_all_system(ShoutMsg).


