%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 3月 2021 16:48
%%%-------------------------------------------------------------------
-module(lib_challenge).
-author("df").
-include("common.hrl").
-include("challenge.hrl").
-include("hero.hrl").
-include("ProtoClient_10145.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("fight_prop.hrl").
-define(CHALLENGE_KEY, challenge_key).


%% API
-export([
	get_challenge_gather/0,
	put_challenge_gather/1
]).
-export([
	async_apply/1,
	async_apply/2,
	sync_apply/2,
	get_challenge_info/1,
	challenge_info/2,
	challenge_guess/3,
	challenge_attack/4,
	challenge_report/4,
	buy_time/2,
	player_use/4,
	sign_in/2,
	get_item/2,
	hero_initial_troop/1			%% 初始的前后军兵力
]).
%% 定时器
-export([
	add_prize_pool/0,				%% 开始定时累计奖励池
	add_pool/0,						%% 增加奖池
	challenge_fight/1,				%% 定时战斗
	fight/1,
	fight_result/1,
	process_fight_result/4,			%% 战斗结算
	recover_attack_time/1,			%% 定时恢复攻击次数
	recover_attack/1,				%% 恢复攻击次数
	time_winner_add/2,				%% 定时擂主获得奖励
	winner_add/2					%% 擂主获得
]).

get_challenge_gather() ->
	erlang:get(?CHALLENGE_KEY)
.
put_challenge_gather(Challenge_gather) when is_record(Challenge_gather, challenge_gather)  ->
	erlang:put(?CHALLENGE_KEY,Challenge_gather)
.
%% 异步
async_apply(Func) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_challenge:get_pid(), Func, [PlayerShow,Player_pid])
.
async_apply(Func,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:async_apply(mod_challenge:get_pid(), Func, [PlayerShow,Player_pid] ++ Args)
.
%% 同步
sync_apply(Fun,Args) ->
	PlayerShow = lib_player:player_show(),
	Player_pid = lib_player:get_pid(PlayerShow#player_show.id),
	mod_server:sync_apply(mod_challenge:get_pid(),Fun, [PlayerShow,Player_pid] ++ Args)
.
get_challenge_info() ->
	List = lib_challenge_api:challenge_type_list(),
	get_challenge_info(List)
.
get_challenge_info(List) ->
	lists:foldr(fun(T,L)->
		Challenge = lib_challenge_api:get_challenge(T),
		Defend_info = play_info_to_proto(Challenge#challenge.defend_info),
		?DEBUG("Challenge#challenge.now_record_id ~p",[Challenge#challenge.now_record_id]),
		[#'ProtoChallenge'{
			type = T,
			defend_info = Defend_info,
			attack_num = Challenge#challenge.attack_num,
			attack_id = Challenge#challenge.attack_id,
			attack_buff = Challenge#challenge.attack_buff,
			pond =  Challenge#challenge.pond,
			record_id = Challenge#challenge.now_record_id,
			hero_troop = hero_troop_to_proto(Challenge#challenge.defend_info)
		}|L]
	end,[],List)
.

hero_troop_to_proto(Defend_info)->
	Map = Defend_info#player_challenge_fight.hero_troop,
	lists:foldl(fun(HeroId,L) ->
		Troop = maps:get(HeroId,Map),
		[#'ProtoHeroTroops'{hero_id = HeroId,all_troop = Troop#challenge_hero_troop.all_troop,
			now_troop = Troop#challenge_hero_troop.now_troop}|L]
	end,[],maps:keys(Map))
.

play_info_to_proto(Defend_info) ->
	Show = Defend_info#player_challenge_fight.show,
	#'ProtoRoleShowInfo'{
		role_show = #'ProtoShowRole'{id = Show#player_show.id,name = Show#player_show.name,country = Show#player_show.country},
		hero_list = hero_info_to_proto(Defend_info#player_challenge_fight.hero_list)
	}
.
hero_info_to_proto(Hero_list) ->
	lists:foldr(fun(HeroBase,List)->
		[lib_hero_api:hero_base_to_proto(HeroBase)|List]
				end,[],Hero_list)
.


report_to_proto(Challenge_type,ReportType,Player) ->
	Challenge = lib_challenge_api:get_challenge(Challenge_type),
	Map = Challenge#challenge.report,
	%% ReportType 0 ->个人 1 ->全部
	List = case ReportType of
			   0 ->lists:filter(fun(K)->
				   		Report = maps:get(K,Map),
				   		((Report#challenge_report.l_id =:= Player) orelse (Report#challenge_report.r_id =:= Player))
					end,maps:keys(Map));
			   1 -> maps:keys(Map)
		   end,
	report_to_proto(List,Map)
.

report_to_proto(List,Map) ->
	lists:foldr(fun(K,L)->
		Report = maps:get(K,Map),
		[#'ProtoReport'{left_show = lib_common:player_show_to_proto(Report#challenge_report.l_show),right_show = lib_common:player_show_to_proto(Report#challenge_report.r_show),
			tick = Report#challenge_report.tick,winner =  Report#challenge_report.win,award_info = Report#challenge_report.award,
			info1 =  Report#challenge_report.winner,info2 =  Report#challenge_report.record_id}|L]
	end,[],List)
.

%==============================%


challenge_info(PlayerShow,Player_pid)->
	Player = lib_challenge_api:get_player_challenge(PlayerShow#player_show.id),
	Stage = lib_challenge_api:get_activity_stage(),
	Type =  lib_challenge_api:get_challenge_main_type(),
	Challenge_info = get_challenge_info(),
%%	?DEBUG("剩余时间 :~p",[lib_challenge_api:get_stage_timer(Stage)]),
	?DEBUG("发送界面信息给前端"),
	Respond = #'Proto50145001'{
		type = lib_challenge_api:get_dark_house_stage(),
		choose_type = Player#player_challenge.guess_type,
		challenge_info = Challenge_info,
		stage = Stage,
		timer = lib_challenge_api:get_stage_timer(Stage),
		challenge_time =  Player#player_challenge.attack_time,
		recover_time = lib_challenge_api:get_recover_time(PlayerShow#player_show.id),
		buy_time = Player#player_challenge.buy_time,
		hero_num = lib_challenge_api:get_hero_num(Type),
		activity_type = lib_challenge_api:get_challenge_main_type()
	},
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("challenge_info :~p",[Respond])
.



challenge_guess(PlayerShow,Player_pid,Type) ->
	Player = lib_challenge_api:get_player_challenge(PlayerShow#player_show.id),
	case Player#player_challenge.guess_type =/= 0 of
		 false ->?DEBUG("玩家~p 竞猜王座~p",[PlayerShow#player_show.id,Type]),
			 lib_challenge_api:update_player_challenge(PlayerShow#player_show.id,Player#player_challenge{guess_type = Type}),
			 lib_challenge_api:add_guess(Type),
			 Respond = #'Proto80145006'{
				 choose_type = Type
			 },
			 lib_send:respond_to_client_by_pid(Player_pid, Respond),
			 ?DEBUG("challenge_guess :~p",[Respond])
		;
		 true  ->?DEBUG("玩家已参与竞猜")
	end
.



challenge_attack(PlayerShow,Player_pid,Type,HeroList) ->
	Player = lib_challenge_api:get_player_challenge(PlayerShow#player_show.id),
	Challenge = lib_challenge_api:get_challenge(Type),
	case (Player#player_challenge.attack_time =:= 0) orelse lists:member(PlayerShow#player_show.id,Challenge#challenge.attack_id)  of
		 true ->?DEBUG("没有攻擂次数不能攻擂");
		 false->lib_challenge_api:add_attack_info(Type,PlayerShow,HeroList),
			 respond_challenge(Player_pid,PlayerShow#player_show.id,[Type])
	end
.

challenge_report(PlayerShow,Player_pid,Challenge_type,ReportType) ->
	Respond = #'Proto50145005'{
		report_info = report_to_proto(Challenge_type,ReportType,PlayerShow#player_show.id),
		challenge_type = Challenge_type,
		report_type = ReportType
	},
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("challenge_report :~p",[Respond])
.


buy_time(PlayerShow,Player_pid)->
	Player = lib_challenge_api:get_player_challenge(PlayerShow#player_show.id),
	lib_challenge_api:update_player_challenge(PlayerShow#player_show.id,Player#player_challenge{
		attack_time = Player#player_challenge.attack_time + 1,buy_time = Player#player_challenge.buy_time + 1
	}),
	respond_challenge(Player_pid,PlayerShow#player_show.id,[])
.


%% Function: 1 -> 进入界面  2 -> 进入战报界面
%% Type: 0 -> 进入 1 -> 退出
player_use(PlayerShow,_Player_pid,Type,Function) ->
	case Type of
		?CHALLENGE_JOIN   ->lib_challenge_api:add_use(PlayerShow#player_show.id,Function);
		?CHALLENGE_LEAVEN ->lib_challenge_api:leaven_use(PlayerShow#player_show.id,Function);
		_ ->skip
	end
.

sign_in(PlayerShow,Player_pid) ->
	{Type,_Is_open,Time} = lib_challenge_api:get_open_need_time(),
	Stage = lib_challenge_api:get_activity_stage(),
	Tick = lib_timer:unixtime(),
	TodayZero = lib_timer:current_zero_unixtime(Tick),
	IconTime = lib_challenge_api:icon_time(),
	OverTime = lib_challenge_api:over_time(),
	case (Tick >= (TodayZero + IconTime)) orelse (Tick < (TodayZero + OverTime)) of
		 false -> skip;
		 true -> Open =
			 case Stage =:= ?NO_START_TIME of
				 true -> Stage;
				 false-> 1
			 end,
			 Respond = #'Proto80145008'{
				 is_open = Open,
				 time = Time,
				 type = Type
			 },
			 lib_send:respond_to_client_by_pid(Player_pid, Respond),
			 ?DEBUG("get_challenge_stage :~p",[Respond])
		end,
	get_item(PlayerShow#player_show.id,Player_pid)
.

%% 战斗完成发回放id
respond_challenge(Type) ->
	Gather = get_challenge_gather(),
	?DEBUG("online_list  ~p",[Gather#challenge_gather.online_list]),
	lists:foreach(fun(PlayerId) ->
		respond_challenge(lib_player:get_pid(PlayerId),PlayerId,[Type])
	end,Gather#challenge_gather.online_list)
.
respond_challenge(Player_pid,PlayerId,TypeList) ->
	?DEBUG("玩家 ：~p通知刷新",[PlayerId]),
	Player = lib_challenge_api:get_player_challenge(PlayerId),
	Stage = lib_challenge_api:get_activity_stage(),
	Respond = #'Proto80145006'{
		challenge_info = get_challenge_info(TypeList),
		type = lib_challenge_api:get_dark_house_stage(),
		choose_type = Player#player_challenge.guess_type,
		stage = Stage,
		timer = lib_challenge_api:get_stage_timer(Stage),
		challenge_time =  Player#player_challenge.attack_time,
		recover_time = lib_challenge_api:get_recover_time(PlayerId),
		buy_time = Player#player_challenge.buy_time
	},
	lib_send:respond_to_client_by_pid(Player_pid, Respond),
	?DEBUG("刷新王座之争"),
	?DEBUG("respond_challenge_order :~p",[Respond])
.

%% 战斗结束通知战斗结果
respond_fight_over(Record_id,Type) ->
	Gather = get_challenge_gather(),
	?DEBUG("战斗结束通知战斗结果"),
	?DEBUG("在线玩家: ~p",[Gather#challenge_gather.online_list]),
	lists:foreach(fun(PlayerId) ->
		Player_pid = lib_player:get_pid(PlayerId),
		respond_challenge(Player_pid,PlayerId,[Type])
	end,Gather#challenge_gather.online_list),
	lists:foreach(fun(PlayerId) ->
		Player_pid = lib_player:get_pid(PlayerId),
		respond_fight_report(Player_pid,Record_id,Type)
	end,Gather#challenge_gather.report_list)
.


%% 战斗结束通知战报
respond_fight_report(Player_pid,Record_id,Type) ->
	Info = lib_challenge_api:get_one_report(Record_id,Type),
	Respond = #'Proto80145010'{
		report = Info,
		challenge_type = Type
	},
	lib_send:respond_to_client_by_pid(Player_pid,Respond)
%%	?DEBUG("respond_fight_over :~p",[Respond])
.


%% ===== 定时器 ==== %%
get_item(PlayerId,Player_pid) ->
	Player = lib_challenge_api:get_player_challenge(PlayerId),
	Item = Player#player_challenge.item,
	case Item =:= [] of
		true -> skip;
		false-> lib_challenge_api:update_player_challenge(PlayerId,Player#player_challenge{item = []}),
			mod_server:async_apply(Player_pid,fun get_item_to_pack/1, [Item])
	end
.
get_item_to_pack(Item) ->
	Item_list = lib_item_api:conf_item_to_pack_item(Item),
	lib_player_pack:auto_insert(Item_list, ?INSERT_SERIAL(?ADD_CHALLENGE, 1),true, 0)
.

%% 奖池累计
add_prize_pool() ->
	case lib_challenge_api:get_activity_stage() =:= ?RUN_TIME of
		true -> ?DEBUG("开始累积奖池"),
				Time =  maps:get(value, tb_challenge_const:get(add_up_interval)),
				erlang:send_after(Time * 1000, self(),add_prize_pool);
		false-> skip
	end
.

add_pool() ->
	case lib_challenge_api:get_activity_stage() =:= ?RUN_TIME of
		true ->
			?DEBUG("增加奖池"),
			SpecialType = lib_challenge_api:get_dark_house_stage(),
			SpecialAdd = maps:get(value, tb_challenge_const:get(special_add_up)),
			Add = maps:get(value, tb_challenge_const:get(common_add_up)),
			List = lib_challenge_api:challenge_type_list(),
			lists:foreach(fun(Type) ->
				lib_challenge_api:calculate_attack_buff(Type),
				Challenge = lib_challenge_api:get_challenge(Type),
				New_Pond =
					case Type =:= SpecialType of
						true -> Challenge#challenge.pond + SpecialAdd;
						false-> Challenge#challenge.pond + Add
					end,
				lib_challenge_api:update_challenge(Type,Challenge#challenge{pond = New_Pond})
			end,List),
			Gather = get_challenge_gather(),
			lists:foreach(fun(PlayerId) ->
				Player_pid = lib_player:get_pid(PlayerId),
				respond_challenge(Player_pid,PlayerId,List)
			end,Gather#challenge_gather.online_list),
			Time =  maps:get(value, tb_challenge_const:get(add_up_interval)),
			?DEBUG("~p秒后继续~n", [Time]),
			erlang:send_after(Time * 1000, self(), add_prize_pool);
		false-> skip
	end
.


%%　攻擂战斗
challenge_fight(Type) ->
	Challenge = lib_challenge_api:get_challenge(Type),
	case (Challenge#challenge.now_record_id =:= 0) andalso (Challenge#challenge.attack_num > 0) of
			true -> fight(Type);
			false-> skip
		end
.

fight(Type) ->
	lib_challenge_api:calculate_attack_buff(Type),
	Challenge = lib_challenge_api:get_challenge(Type),
	L_info = Challenge#challenge.defend_info,
	R_info = get_attack_info(Challenge),
%%	?DEBUG("~p擂主~n", [L_info#player_challenge_fight.fighters]),
%%	?DEBUG("~p攻擂者~n", [R_info#player_challenge_fight.fighters]),
	?DEBUG("~p攻擂buff~n", [Challenge#challenge.attack_buff]),
	_CombatId = lib_combat_queue_api:async_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_CHALLENGE,
		params = {L_info, R_info, Type},
		l_fighters = L_info#player_challenge_fight.fighters,
		r_fighters = R_info#player_challenge_fight.fighters,
		r_buff_list = Challenge#challenge.attack_buff,
		fight_type = ?FIGHT_TYPE1,
		save_record = true
	})
%%	?DEBUG("CombatId  ~p~n", [CombatId])
.


%% 选择攻擂者
get_attack_info(Challenge) ->
	Map = Challenge#challenge.attack_info,
%%	?DEBUG("maps:keys(Map) ~p",[maps:keys(Map)]),
	Id =
	lists:foldr(fun(PlayerId,First)->
		case First =:= 0 of
			true -> PlayerId;
			false->
				Info = maps:get(PlayerId,Map),
				FirstInfo = maps:get(First,Map),
				case Info#player_challenge_fight.tick < FirstInfo#player_challenge_fight.tick of
						true -> PlayerId;
						false-> First
					end
		end
			  end,0,maps:keys(Map)),
	maps:get(Id,Map)
.

fight_result(Data)->
	#combat_callback{
		params = {L_info, R_info, Type},
		callback_data = CallBackData
	} = Data,
	Challenge = lib_challenge_api:get_challenge(Type),
%%	?DEBUG("Data ~p",[ CallBackData#callback_data0.msg]),
	lib_challenge_api:update_challenge(Type, Challenge#challenge{now_record_id = CallBackData#callback_data0.record_id}),
	respond_challenge(Type),
	%% 开启定时器
	Time = lib_challenge_api:get_attack_time(),
	?DEBUG("开启~p秒后结算的定时器~n", [Time]),
	erlang:send_after(Time * 1000, self(), {challenge_attack,CallBackData,L_info,R_info,Type})
.

%% 结算战斗
process_fight_result(Data,L_info,R_info,Type) ->
	IsWin = Data#callback_data0.win_type =:= ?FIGHTER_TYPE_L,
	FightResultList = Data#callback_data0.fight_result,
	Tick = lib_timer:unixtime(),
	case IsWin of
		true ->
			NewFighters = get_fight_fighters(FightResultList,L_info,Type),
			Challenge = lib_challenge_api:get_challenge(Type),
			OldOrder = Challenge#challenge.defend_order,
			Defend_info = Challenge#challenge.defend_info,
			NewChallenge = Challenge#challenge{
				defend_info = Defend_info#player_challenge_fight{fighters = NewFighters},
				defend_order = OldOrder#defend_order{
					win_time = OldOrder#defend_order.win_time + 1
				}},
			lib_challenge_api:update_challenge(Type,NewChallenge);

		false->
			lib_challenge_api:became_winner(R_info#player_challenge_fight.id,Type,R_info,Tick)
	end,
	New = lib_challenge_api:get_challenge(Type),
	AwardNum = get_attack_item(Data,R_info,Type),
	lib_challenge_api:add_report(New#challenge.now_record_id,Type,Data,Tick,L_info#player_challenge_fight.show,R_info#player_challenge_fight.show,AwardNum),
	lib_challenge_api:delete_attack_info(Type,R_info#player_challenge_fight.id),
	lib_challenge_api:calculate_attack_buff(Type),
	respond_fight_over(New#challenge.now_record_id,Type),
	case IsWin of
		true ->	%% 发送广播
				Challenge1 = lib_challenge_api:get_challenge(Type),
				case (Challenge1#challenge.attack_num =:= 0) andalso (lib_challenge_api:get_activity_stage() =/= ?RUN_TIME) of
					true ->
						Main = lib_challenge_api:get_challenge_main_type(),
						Info = Challenge1#challenge.defend_info,
						Win = Info#player_challenge_fight.id,
						Pond = Challenge1#challenge.pond,
						lib_challenge_api:add_player_money(Pond,Win),
						lib_challenge_api:update_challenge(Type,Challenge1#challenge{pond = 0}),
						lib_challenge_api:challenge_BroadCase(L_info#player_challenge_fight.show, (Main * 100 + Type), ?CHALLENGE_BROAD_END);
					false-> skip
				end;
		false-> skip
	end,
	challenge_fight(Type)

.

%% 守擂胜利处理
get_fight_fighters(FightList,Info,Type) ->
	FightMap = lists:foldl(fun(Fight,Map)->
		Fight_wastage = Fight#fight_result.l_wastage,
		Combat_hero = Fight_wastage#fight_wastage.fighter,
			case maps:is_key(Combat_hero#combat_hero.hero_id,Map) of
				 false -> maps:put(Combat_hero#combat_hero.hero_id,Fight_wastage,Map);
				 true  ->
					 OldFight = maps:get(Combat_hero#combat_hero.hero_id,Map),
					 case (OldFight#fight_wastage.over_back < Fight_wastage#fight_wastage.over_back) orelse (OldFight#fight_wastage.over_front < Fight_wastage#fight_wastage.over_front) of
							   true -> maps:put(Combat_hero#combat_hero.hero_id,Fight_wastage,Map);
						       false-> Map
					end
		end
	end,maps:new(),FightList),
	Min_troop = maps:get(floatvalue, tb_challenge_const:get(win_min_troops)),
	lists:foldr(fun(HeroBase,L)->
		Fight = maps:get(HeroBase#hero_base.id,FightMap,undefined),
		Fighter =
			case Fight =:= undefined of
				true -> get_old(Info,HeroBase);
				false->
					{Front,Back} = hero_initial_troop(HeroBase),
					NewFront = case Fight#fight_wastage.over_front >= util:ceil(Front * Min_troop) of
								   true -> Fight#fight_wastage.over_front;
								   false-> util:ceil(Front * Min_troop)
							   end,
					NewBack = case Fight#fight_wastage.over_back >= util:ceil(Back * Min_troop) of
								  true -> Fight#fight_wastage.over_back;
								  false-> util:ceil(Back * Min_troop)
							  end,

					Challenge = lib_challenge_api:get_challenge(Type),
					Defend = Challenge#challenge.defend_info,
					Map = Defend#player_challenge_fight.hero_troop,
					Troop = maps:get(HeroBase#hero_base.id,Map),
					NewMap = maps:put(HeroBase#hero_base.id,Troop#challenge_hero_troop{now_troop = NewFront + NewBack},Map),
					?DEBUG("英雄 ~p 总兵力 ~p   剩余兵力 ~p",[HeroBase#hero_base.id,(Front+Back),(NewFront + NewBack)]),
					lib_challenge_api:update_challenge(Type,Challenge#challenge{defend_info = Defend#player_challenge_fight{hero_troop = NewMap}}),
					lib_combat_queue_api:to_combat_hero_with_troops(Info#player_challenge_fight.show, HeroBase, {NewFront, NewBack})
			end,
		[Fighter|L]
	end,[],Info#player_challenge_fight.hero_list)
.


get_old(Info,HeroBase) ->
	HeroId = HeroBase#hero_base.id,
	OldFighters = Info#player_challenge_fight.fighters,
	get_old(HeroId,OldFighters,0)
.
get_old(HeroId,[Fighter|OldFighters],Old) ->
	case HeroId =:= Fighter#combat_hero.hero_id of
		true -> Fighter;
		false-> get_old(HeroId,OldFighters,Old)
	end
;
get_old(_HeroId,[],Old)->
	Old.

%% {前军初始兵力:front,后军初始兵力:back}
hero_initial_troop(HeroBase) ->
	PropBase = lib_fight_prop:hero_base_to_prop_base(HeroBase),
	Prop = lib_fight_prop:statistics_prop_dict(PropBase, HeroBase#hero_base.prop_dict),
	{trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_FORMER, Prop)),
		trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_LATTER, Prop))}
.

get_attack_item(Data,Info,Type) ->
	IsWin = Data#callback_data0.win_type =:= ?FIGHTER_TYPE_R,
	Challenge = lib_challenge_api:get_challenge(Type),
	FightResultList = Data#callback_data0.fight_result,
	Kills = lists:foldr(fun(Fight,K) ->
			Fight_wastage = Fight#fight_result.r_wastage,
			Fight_wastage#fight_wastage.kills + K
		end,0,FightResultList),
	All = lists:foldr(fun(HeroBase,Num)->
		{Front,Back} = hero_initial_troop(HeroBase),
		Num + Front + Back
	end,0,Info#player_challenge_fight.hero_list),
	Basics = maps:get(value, tb_challenge_const:get(get_basics)),
	Pond = Challenge#challenge.pond,
	ItemNum =
		case IsWin of
			true -> Coefficient = maps:get(floatvalue, tb_challenge_const:get(win_get_coefficient)),
					Num = util:ceil(Coefficient * Pond * (Kills / All)),
					lib_challenge_api:update_challenge(Type,Challenge#challenge{pond = Pond - Num}),
					Num + Basics;
			false-> Coefficient = maps:get(value, tb_challenge_const:get(lose_get_coefficient)),
					Num = util:ceil(Coefficient * (Kills / All)),
					LoseMax = maps:get(value, tb_challenge_const:get(lose_max)),
				case (Num + Basics) > LoseMax of
					  true -> LoseMax;
					  false-> Num + Basics
		end

	end,
	lib_challenge_api:add_player_money(ItemNum,Info#player_challenge_fight.id),
	ItemNum
.


recover_attack_time(PlayerId) ->
	Time = 	maps:get(value, tb_challenge_const:get(attack_time_regain)),
	erlang:send_after(Time * 1000, self(),{recover_attack_time,PlayerId})
.

recover_attack(PlayerId) ->
	?DEBUG("恢复攻击次数"),
	Player = lib_challenge_api:get_player_challenge(PlayerId),
	case Player#player_challenge.attack_time < lib_challenge_api:basics_attack_time() of
		false -> skip;
		true  ->
			NewTime = Player#player_challenge.attack_time + 1,
			lib_challenge_api:update_player_challenge(PlayerId,Player#player_challenge{attack_time = NewTime}),
			NewPlayer = lib_challenge_api:get_player_challenge(PlayerId),
			case NewTime < lib_challenge_api:basics_attack_time() of
				 true ->
					 lib_challenge_api:update_player_challenge(PlayerId,NewPlayer#player_challenge{attack_tick = lib_timer:unixtime()}),
					 recover_attack_time(PlayerId);
				 false-> lib_challenge_api:update_player_challenge(PlayerId,NewPlayer#player_challenge{attack_tick = 0})
			end,
			Gather = get_challenge_gather(),
			case lists:member(PlayerId,Gather#challenge_gather.online_list) of
				 true -> respond_challenge(lib_player:get_pid(PlayerId),PlayerId,[]);
				 false-> skip
			end
	end
.

time_winner_add(Type,PlayerId) ->
	Time = maps:get(value, tb_challenge_const:get(get_interval)),
	erlang:send_after(Time * 1000, self(),{time_winner_add,Type,PlayerId})
.
winner_add(Type,PlayerId) ->
	SpecialType = lib_challenge_api:get_dark_house_stage(),
	case (lib_challenge_api:winner_id(Type) =:= PlayerId) andalso lib_challenge_api:get_activity_stage() =:= ?RUN_TIME of
		 false -> skip;
		 true  -> Num = case SpecialType =:= Type of
					    	true  ->maps:get(value, tb_challenge_const:get(special_get));
							false ->maps:get(value, tb_challenge_const:get(common_get))
				end,
			 	lib_challenge_api:add_player_money(Num,PlayerId),
				time_winner_add(Type,PlayerId)
	end
.