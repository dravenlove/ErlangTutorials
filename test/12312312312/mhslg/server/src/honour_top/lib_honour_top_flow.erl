%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 5月 2021 15:55
%%%-------------------------------------------------------------------
-module(lib_honour_top_flow).
-author("df").
-include("common.hrl").
-include("honour_top.hrl").
-include("player.hrl").
-include("season_and_day.hrl").
-include("fight.hrl").
-include("combat_queue.hrl").
-include("fight_prop.hrl").
-include("hero.hrl").
-include("ProtoClient_10149.hrl").
%% 活动流程
-export([

	activity_start/0,		%% 活动开始
	next_timer/0,			%% 定时分组并开始下个阶段
	grouping_fight/0,		%% 小组赛战斗
	grouping_fight_over/0,
	fight_result/1,			%% 战斗返回
 	award_mail/1,			%% 发送排名奖励(淘汰即发)
	bet_award_mail/0,		%% 发送押注奖励
	join_top_eight/0,		%% 添加八强信息
	activity_over/0,		%% 活动结束
	next_activity_start/0,	%% 定时开启下一场活动

	report_fight/1

]).

%% 活动开始
activity_start() ->
	init_date(), %%初始化数据
	Gather = lib_honour_top:get_honour_top_gather(),
	%% 添加机器人
	?DEBUG("添加机器人 "),
	ALL_robot = tb_honour_top_robot:get_list(),
	case Gather#honour_top_gather.apply_num < ?APPLY_MAX of
		 true -> join_robot(?APPLY_MAX - Gather#honour_top_gather.apply_num,ALL_robot),
			 	?DEBUG("join_robot ok");
		 false-> skip
	end,
	NewGather = lib_honour_top:get_honour_top_gather(),
	%% 分组
	{PlayerList,RobotList} =
	lists:foldl(fun(PlayerId,{PlayerList,RobotList}) ->
		PlayerInfo = lib_honour_top_api:get_player_info(PlayerId),
		case PlayerInfo#player_honour_top.is_apply =:= 1 of
			 false -> {PlayerList,RobotList};
			 true -> Show = PlayerInfo#player_honour_top.show,
					case Show#player_show.is_robot of
						true -> {PlayerList,[{PlayerId,Show#player_show.force}|RobotList]};
						false-> {[{PlayerId,Show#player_show.force}|PlayerList],RobotList}
					end
		end
	end,{[],[]},maps:keys(NewGather#honour_top_gather.player_map)),
	?INFO("PlayerList length ~p",[length(PlayerList)]),
	?INFO("RobotList length ~p",[length(RobotList)]),
	group(?START_STAGE,lists:reverse(lists:keysort(2, PlayerList)),lists:reverse(lists:keysort(2, RobotList))),
	lib_honour_top:put_honour_top_gather((lib_honour_top:get_honour_top_gather())#honour_top_gather{stage = 1,times = 1}),
	next_timer()
.
%% 添加机器人
join_robot(Num,RobotList) ->
	case Num =:= 0 of
		 true -> skip;
		 false->
			 Sex = util:rand(?SEX_MAN, ?SEX_WOMAN),
			 Name = get_robot_name(Sex),
			 RobotId = util:rand_one(RobotList),
			 Config = tb_honour_top_robot:get(RobotId),
			 List = lib_random:rand_more(maps:get(hero_number, Config), maps:get(heros, Config)),
			 HeroList = lib_robot_api:monster_id_list_to_hero_base_list(RobotId,List),
			 Force = lib_honour_top_api:count_force(HeroList),
			 Heads = maps:get(heads, Config, ""),
			 Show = #player_show{
				 id = RobotId,
				 is_robot = true,
				 country = maps:get(country, Config, ""),
				 name = Name,
				 sex = Sex,
				 head_icon = lib_common:random_one(Heads),
				 level = maps:get(level, Config, 0),
				 force = Force
			 },
			 lib_honour_top_api:update_player_info(RobotId,#player_honour_top{player_id = RobotId,is_robot = 1,
				 show = Show#player_show{force = Force},hero_info = HeroList,is_apply = 1}),
			 Gather = lib_honour_top:get_honour_top_gather(),
			 lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{apply_num = Gather#honour_top_gather.apply_num + 1}),
			 join_robot(Num - 1,lists:delete(RobotId,RobotList))
	end
.

get_robot_name(Sex) ->
	Name = lib_common:random_name(Sex),
	case mongo_poolboy:count(?MMO_POOL, ?DBROLE, #{?BSONSET_STRING(<<"name">>, Name)}) =< 0 of
		true  -> Name;
		false -> get_robot_name(Sex)
	end
.

activity_group() ->
	?INFO("分组"),
	#honour_top_gather{stage = Stage} = Gather = lib_honour_top:get_honour_top_gather(),
	OldStage = Stage - 1,
	StageInfo = maps:get(OldStage,Gather#honour_top_gather.stage_map),
	List =
		maps:fold(fun(_GroupId,GroupInfo,LIST)->
			PlayerIdList = maps:fold(fun(PlayerId,Grade_info,L)->
							ConditionInfo = tb_honour_top_rise:get(OldStage),
							case condition_ok(Grade_info,ConditionInfo) of
								 true -> [PlayerId|L];
								 false-> L
							end
						end,[],GroupInfo#group_map.player_grade_info),
			ForceList = lists:foldl(fun(PlayerId,L) ->
				Player = lib_honour_top_api:get_player_info(PlayerId),
				Show = Player#player_honour_top.show,
				[{PlayerId,Show#player_show.force}|L]
			end,[],PlayerIdList),
			LIST ++ ForceList
		end,[],StageInfo#stage_map.group),
	%% 分组
	case Stage =:= ?EIGHT_STAGE of
		 true ->  eight_group(lists:reverse(lists:keysort(2, List)),1);
		 false-> {PlayerList,RobotList} = separate_player_robot(List),
			 group(Stage,lists:reverse(lists:keysort(2, PlayerList)),lists:reverse(lists:keysort(2, RobotList)))
	end
.

condition_ok(Grade_info,ConditionInfo) ->
	#player_grade_info{win = Win,lose = Lose} = Grade_info,
	case maps:get(type,ConditionInfo) of
		1 -> [Win1,Lose1] = maps:get(condition1,ConditionInfo),
			(Win =:= Win1) andalso (Lose =:= Lose1);
		2 -> [[Win1,Lose1],[Win2,Lose2]] =maps:get(condition2,ConditionInfo),
			((Win =:= Win1) andalso (Lose =:= Lose1)) orelse ((Win =:= Win2) andalso (Lose =:= Lose2))
	end
.

separate_player_robot(List) ->
	lists:foldl(fun({PlayerId,Force},{PlayerList,RobotList}) ->
		PlayerInfo = lib_honour_top_api:get_player_info(PlayerId),
		Show = PlayerInfo#player_honour_top.show,
		case Show#player_show.is_robot of
			true -> {PlayerList,[{PlayerId,Force}|RobotList]};
			false-> {[{PlayerId,Force}|PlayerList],RobotList}
		end
	end,{[],[]},List)
.

group(Stage,PlayerList,RobotList) ->
	GroupMum = (length(PlayerList) + length(RobotList)) div ?GROUP_NUM,
	Ratio = length(PlayerList) div GroupMum,
	{PlayerNum,RobotNum} = case Ratio of 0 -> {1,3};_ -> {Ratio,?GROUP_NUM - Ratio} end,
	group(Stage,PlayerNum,RobotNum,PlayerList,RobotList,lists:seq(1,GroupMum))
.

group(Stage,PlayerNum,RobotNum,PlayerList,RobotList,[GroupId|GroupList])->
	case (length(PlayerList) < PlayerNum) orelse (length(RobotList) < RobotNum) of
		true -> only_group(Stage,lists:append(PlayerList,RobotList),[GroupId|GroupList]);
		false-> {L1,NewPlayerList} = lists:split(PlayerNum,PlayerList),
			{L2,NewRobotList} = lists:split(RobotNum,RobotList),
			List = lists:reverse(lists:keysort(2, L1 ++ L2)),
			lists:foldl(fun({PlayerId,_},Rank) ->
				lib_honour_top_api:player_add_group(PlayerId,Stage,GroupId,Rank),
				Rank + 1
			end,1,List),
			group(Stage,PlayerNum,RobotNum,NewPlayerList,NewRobotList,GroupList)
	end
;
group(_Stage,_PlayerNum,_RobotNum,_PlayerList,_RobotList,[])->
	skip
.

only_group(_Stage,[],[]) ->
	skip
;
only_group(Stage,List,[GroupId|GroupList]) ->
	{L,NewList} = lists:split(?GROUP_NUM,List),
	lists:foldl(fun({PlayerId,_},Rank) ->
		lib_honour_top_api:player_add_group(PlayerId,Stage,GroupId,Rank),
		Rank + 1
	end,1,lists:reverse(lists:keysort(2, L))),
	only_group(Stage,NewList,GroupList)
.


eight_group([{PlayerId,_Force}|RankList],Rank) ->
	Player = lib_honour_top_api:get_player_info(PlayerId),
	lib_honour_top_api:player_add_group(PlayerId,?EIGHT_STAGE,1,Rank),
	%% 添加到押注信息中
	?INFO("添加到押注信息"),
	lib_honour_top_api:update_bet_info(Rank,#bet_map{id = Rank,be_bet_show = Player#player_honour_top.show}),
	eight_group(RankList,(Rank + 1))
;
eight_group([],_Rank) ->
	skip
.

next_timer() ->
	?INFO("next_timer"),
	#honour_top_gather{stage = Stage,times = Times,fight_group_id = Fight_group_id,fight_list = Fight_list} = lib_honour_top:get_honour_top_gather(),
	case Stage of
		?OVER_STAGE    -> 	activity_over();
		?OVER_STAGE_2  ->   next_activity_start();
		?ACTIVITY_OVER -> 	Tick = lib_timer:unixtime(),
						   	Time = lib_season_and_days_api:next_season(lib_honour_top_api:const(open_season,value),Tick) - Tick,
						  	?DEBUG("下场活动在~p秒后开始",[Time]),
						  	erlang:send_after(Time * 1000, self(), activity_start);
		_              -> 	case (Times =:= 1) andalso(Fight_group_id =:= 0) andalso (Stage =/= ?START_STAGE) andalso (Fight_list =:= [])of
								 true -> activity_group();
								 false-> skip
							end,
							Gather = lib_honour_top:get_honour_top_gather(),
							StageInfo = maps:get(Stage,Gather#honour_top_gather.stage_map,#stage_map{stage = Stage}),
							List = lists:subtract(lists:sort(maps:keys(StageInfo#stage_map.group)),Gather#honour_top_gather.fight_over_list),
							lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_list = List,fight_mod = 0}),
							Key = Stage * 100 + Times,
							Tick = lib_timer:unixtime(),
							StartTime = maps:get(times_start, tb_honour_top_time:get(Key)),
							Zero = lib_timer:current_zero_unixtime(Tick),
							Time = StartTime - (Tick - Zero),
							?INFO("~p秒后开启下一场战斗~n", [Time]),
							case Time =< 0 of
								true -> erlang:send_after(5 * 1000, self(), grouping_fight);
								false-> erlang:send_after(Time * 1000, self(), grouping_fight)
							end
	end
.

grouping_fight() ->
	#honour_top_gather{stage = Stage,times = Times,fight_list = GroupList} = lib_honour_top:get_honour_top_gather(),
	case GroupList =:= [] of
		 true ->	skip;
		 false->	KeyList = lists:filter(fun(Key)->
						Info = tb_honour_top_match:get(Key),
			 			(maps:get(stage,Info) =:= Stage) andalso (maps:get(times,Info) =:= Times)
					end, tb_honour_top_match:get_list()),
					MaxReportId = lists:max([maps:get(report_id, tb_honour_top_match:get(Key)) || Key <- KeyList]),
					MaxGroupId = lists:max(GroupList),
					grouping_fight(Stage,Times,GroupList,KeyList,MaxReportId,MaxGroupId)
	end
.

grouping_fight(Stage,Times,[GroupId|GroupList],List,MaxReportId,MaxGroupId) ->
	case (lib_honour_top:get_honour_top_gather())#honour_top_gather.fight_mod =:= 4 of
		true  -> 	Gather = lib_honour_top:get_honour_top_gather(),
			lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_list = [GroupId|GroupList]});
		false ->
			lists:foreach(fun(Key) ->
				GroupInfo = lib_honour_top_api:get_group_info(Stage,GroupId),
				Info = tb_honour_top_match:get(Key),
				Report_id = maps:get(report_id,Info),
				NewGather = lib_honour_top:get_honour_top_gather(),
				case (NewGather#honour_top_gather.fight_group_id =:= GroupId) andalso (NewGather#honour_top_gather.fight_report_id =:= Report_id) of
					true -> skip;
					false-> ?INFO("第~p阶段 第~p场 第~p组 第~p小场 开始战斗",[Stage,Times,GroupId,Report_id]),
							{LeftId,RightId} = get_fight_player(GroupInfo,GroupInfo#group_map.report_map,Info),
							fight(LeftId,RightId,Stage,GroupId,Times,Report_id,MaxReportId,MaxGroupId)
				end
			end,lists:sort(List)),
			Gather = lib_honour_top:get_honour_top_gather(),
			lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_mod = Gather#honour_top_gather.fight_mod + 1}),
			case GroupList =:= [] of
				true -> lib_honour_top:put_honour_top_gather((lib_honour_top:get_honour_top_gather())#honour_top_gather{fight_list = []}),
					?INFO("列表完毕");
				false-> grouping_fight(Stage,Times,GroupList,List,MaxReportId,MaxGroupId)
			end
	end
.
grouping_fight_over() ->
	#honour_top_gather{stage = Stage,times = Times} = lib_honour_top:get_honour_top_gather(),
	fight_count(Stage,Times),
	report_fight(0),
	?INFO("阶段~p 第~p场战斗完毕",[Stage,Times]),
	Gather = lib_honour_top:get_honour_top_gather(),
	case Times =:= ?ALL_TIMES of
		false -> lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{times = Times + 1,fight_mod = 0,fight_group_id = 0,fight_report_id = 0,fight_over_list = []})
				 ,erlang:send_after(10 * 1000, self(), next_timer)
		;
		true  ->lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{stage = Stage + 1,times = 1,fight_mod = 0,fight_group_id = 0,fight_report_id = 0,fight_over_list = []}),
				erlang:send_after(10 * 1000, self(), {award_mail,Stage})
				,erlang:send_after(10 * 1000, self(), next_timer)
	end
.

get_fight_player(GroupInfo,ReportMap,Info) ->
	case maps:get(type,Info) of
		 1 ->[LRank,RRank] = maps:get(condition1,Info),
			 {get_rank_player(GroupInfo,LRank),
			  get_rank_player(GroupInfo,RRank)};
		 2 ->[[LTimes,LReportID,LIsWin],[RTimes,RReportID,RIsWin]] = maps:get(condition2,Info),
			 {get_grade_player(ReportMap,LTimes,LReportID,LIsWin),get_grade_player(ReportMap,RTimes,RReportID,RIsWin)}
	end
.

get_rank_player(GroupInfo,Rank) ->
	maps:fold(fun(PlayerId,Player_grade,Id)->
		case Player_grade#player_grade_info.rank =:= Rank of
			true -> PlayerId;
			false-> Id
		end
	end,0,GroupInfo#group_map.player_grade_info)
.
get_grade_player(ReportMap,Times,ReportID,IsWin) ->
	ReportInfo = maps:get(Times,ReportMap),
	maps:fold(fun(NewReportID,Report,Id)->
		case NewReportID =:= ReportID of
			true -> {Win,Lose} = get_winner(Report),
				case IsWin =:= 1 of
					true -> Win;
					false-> Lose
				end;
			false-> Id
		end
	end,0,ReportInfo#report_map.reports)
.

fight(LeftId,RightId,Stage,GroupId,Times,ReportId,MaxReportId,MaxGroupId) ->
	Left = lib_honour_top_api:get_player_info(LeftId),
	Right = lib_honour_top_api:get_player_info(RightId),
	_CombatId = lib_combat_queue_api:async_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_HONOUR_TOP,
		params = {LeftId,RightId,Stage,GroupId,ReportId,Times,MaxReportId,MaxGroupId},
		l_fighters =  lib_combat_queue_api:hero_list_fighters(Left#player_honour_top.show,Left#player_honour_top.hero_info),
		r_fighters = lib_combat_queue_api:hero_list_fighters(Right#player_honour_top.show,Right#player_honour_top.hero_info),
		fight_type = ?FIGHT_TYPE1,
		save_record = true
	})
.

fight_result(Data)->
	#combat_callback{
		params = {LeftId,RightId,Stage,GroupId,ReportId,Times,MaxReportId,MaxGroupId},
		callback_data = CallBackData
	} = Data,
	?INFO("第~p阶段 第~p场 第~p组 第~p小场战斗完毕",[Stage,Times,GroupId,ReportId]),
	IsWin = CallBackData#callback_data0.win_type =:= ?FIGHTER_TYPE_L,
	Left = lib_honour_top_api:get_player_info(LeftId),
	Right = lib_honour_top_api:get_player_info(RightId),
	Report =
		case IsWin of
			true -> #report{id = ReportId,record_id = CallBackData#callback_data0.record_id,
					l_id = LeftId,l_show = Left#player_honour_top.show,
					r_id = RightId,r_show = Right#player_honour_top.show, win = 0};
			false-> #report{id = ReportId,record_id = CallBackData#callback_data0.record_id,
					l_id = LeftId,l_show = Left#player_honour_top.show,
					r_id = RightId,r_show = Right#player_honour_top.show, win = 1}
		end,
	lib_honour_top_api:join_report(Times,Stage,GroupId,ReportId,Report),
	#honour_top_gather{stage = NowStage,times = NowTimes} = Gather = lib_honour_top:get_honour_top_gather(),
	case MaxReportId =:= ReportId of
		true -> case MaxGroupId =:= GroupId of
						 true ->lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_group_id = GroupId,fight_report_id = ReportId,fight_mod = Gather#honour_top_gather.fight_mod - 1}),
							 	erlang:send_after(30 * 1000, self(), grouping_fight_over);
						 false-> case (NowStage =:= Stage) andalso (NowTimes =:= Times) of
									  true ->
										  lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_group_id = GroupId,fight_report_id = ReportId,fight_mod = Gather#honour_top_gather.fight_mod - 1}),
										  grouping_fight();
									  false->lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_group_id = GroupId,fight_report_id = ReportId,
										  fight_mod = Gather#honour_top_gather.fight_mod - 1,fight_over_list = [GroupId|Gather#honour_top_gather.fight_over_list]})
								 end
				end;
		false-> lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{fight_group_id = GroupId,fight_report_id = ReportId})
	end
.

fight_count(Stage,Times) ->
	?INFO("积分结算"),
	Gather = lib_honour_top:get_honour_top_gather(),
	StageInfo = maps:get(Stage,Gather#honour_top_gather.stage_map,#stage_map{stage = Stage}),
	lists:foreach(fun(GroupId) ->
		ReportList = lib_honour_top_api:get_report_list(Times,Stage,GroupId),
		[fight_count(Stage,GroupId,Report) || Report <- ReportList]
	end,maps:keys(StageInfo#stage_map.group))

.
fight_count(Stage,GroupId,Report) ->
	{Win,Lose} = get_winner(Report),
	lib_honour_top_api:player_fight_count(Win,Stage,GroupId,true),
	lib_honour_top_api:player_fight_count(Lose,Stage,GroupId,false)
.

award_mail(Stage) ->
	?INFO("发奖励"),
	List = lists:filter(fun(Key) ->
		maps:get(stage, tb_honour_top_award:get(Key)) =:= Stage
	end, tb_honour_top_award:get_list()),
	Gather = lib_honour_top:get_honour_top_gather(),
	StageInfo = maps:get(Stage,Gather#honour_top_gather.stage_map,#stage_map{stage = Stage}),
	lists:foreach(fun(GroupId)->
		GroupInfo = maps:get(GroupId,StageInfo#stage_map.group),
		lists:foreach(fun(Key) ->
			#{ 'times' := Times, 'report_id' := Report_id, 'is_win' := Is_win  ,'award' := Award} = tb_honour_top_award:get(Key),
			ReportInfo = maps:get(Times,GroupInfo#group_map.report_map),
			PlayerId = maps:fold(fun(ReportId,Report,Id)->
					case ReportId =:= Report_id of
						 true -> {Win,Lose} = get_winner(Report),
							 case Is_win =:= 1 of
								  true -> Win;
								  false-> Lose
							end;
						 false-> Id
				end
			end,0,ReportInfo#report_map.reports),
			PlayerInfo = lib_honour_top_api:get_player_info(PlayerId),

			case PlayerInfo#player_honour_top.is_robot =:= 1 of
					 true -> skip;
				     false-> lib_mail_api:fast_send_mail(PlayerId, ?HONOUR_TOP_AWARD_MAIL_ID, [Key],
							 lib_item_api:conf_item_list_to_pack_item_list(Award), ?ADD_HONOUR_TOP_RANK)

			end
		end, List)
	end,maps:keys(StageInfo#stage_map.group))

.

get_winner(Report)->
	case Report#report.win of
		 0 -> {Report#report.l_id,Report#report.r_id};
		 1 -> {Report#report.r_id,Report#report.l_id}
	end
.

bet_award_mail() ->
	?INFO("bet_award_mail 奖励"),
	#top_eight{player_id = Top1} = lib_honour_top_api:get_top_eight(1),
	Top1BetId = get_bet_id(Top1),
	case Top1BetId =:= 0 of
		 true -> ?INFO("数据错误,Top1BetId ~p",[Top1BetId]);
		 false-> Odds = lib_honour_top_api:get_now_odds(Top1BetId),
			     BetMap = lib_honour_top_api:get_bet_info(Top1BetId),
			 	 ?INFO("bet_award_mail ~p",[BetMap#bet_map.player_bet]),
			     maps:fold(fun(PlayerId,PlayBet,_)->
					 #player_bet{bet_money = Num} = PlayBet,
					 Item = [?MONEY,util:ceil(Num * Odds)],
					 ?INFO("Item ~p",[Item]),
					 lib_mail_api:fast_send_mail(PlayerId, ?HONOUR_TOP_BET_AWARD_MAIL_ID, [],
						 [lib_item_api:conf_item_to_pack_item(Item)], ?ADD_HONOUR_TOP_BET)
				 end,0,BetMap#bet_map.player_bet)
	end
.

get_bet_id(PlayerId) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	maps:fold(fun(NewBetId,BetInfo,BetId)->
		Show = BetInfo#bet_map.be_bet_show,
			case Show#player_show.id =:= PlayerId of
				true -> NewBetId;
				false-> BetId
		end
	end,0,Gather#honour_top_gather.bet_map)
.

join_top_eight() ->
	GroupInfo = lib_honour_top_api:get_group_info(?EIGHT_STAGE,1),
	join_top_eight(8,GroupInfo)
.
join_top_eight(Rank,GroupInfo) ->
	case Rank =:= 0 of
		 true -> skip;
		 false-> #{'times' := Times, 'report_id' := Report_id,'is_win' := Is_win } = tb_honour_top_award:get(Rank),
			 	 ReportInfo = maps:get(Times,GroupInfo#group_map.report_map),
			 	 PlayerId = maps:fold(fun(NewReportID,Report,Id)->
				 	case NewReportID =:= Report_id of
						 true -> {Win,Lose} = get_winner(Report),
							 case Is_win =:= 1 of
								 true -> Win;
								 false-> Lose
							 end;
						 false-> Id
				 	end
				 end,0,ReportInfo#report_map.reports),
			 	PlayerInfo = lib_honour_top_api:get_player_info(PlayerId),
			     lib_honour_top_api:update_top_eight(Rank,#top_eight{
					 rand = Rank,player_id = PlayerId,show = PlayerInfo#player_honour_top.show,
					 show_hero_id = get_max_force(PlayerInfo)
				 }),
			 	 join_top_eight(Rank - 1,GroupInfo)
	end
.

get_max_force(PlayerInfo) ->
	List = [{HeroBase#hero_base.id,HeroBase#hero_base.force}|| HeroBase <- PlayerInfo#player_honour_top.hero_info],
	{HeroId,_} = lists:last(lists:keysort(2, List)),
	HeroId
.

init_date() ->
	Gather = lib_honour_top:get_honour_top_gather(),
	NewMap = maps:fold(fun(PlayerId,PlayerInfo,Map) ->
			case PlayerInfo#player_honour_top.is_apply =:= 1 of
				 true -> maps:put(PlayerId,PlayerInfo,Map);
				 false-> Map
			end
	end,maps:new(),Gather#honour_top_gather.player_map),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{
		bet_map = maps:new(),stage_map = maps:new(),top_eight = maps:new(),player_map = NewMap
	}),
	%% 活动结束删除回放记录
	db_fight:delete_fight_record(?CALL_FIGHT_HONOUR_TOP, #{})
.

activity_over() ->
	lib_honour_top_flow:join_top_eight(),
	lib_honour_top_flow:bet_award_mail(),
	Gather = lib_honour_top:get_honour_top_gather(),
	NewMap = maps:fold(fun(PlayerId,PlayerInfo,MAP) ->
		maps:put(PlayerId,PlayerInfo#player_honour_top{
			is_apply = 0,bet = 0,group_map = maps:new(),hero_info = []},MAP)
	end,maps:new(),Gather#honour_top_gather.player_map),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{stage = ?OVER_STAGE_2, times = 0,player_map = NewMap,apply_num = 0,is_fight =0 ,
		fight_group_id = 0, fight_report_id = 0, fight_list = [], fight_over_list = []}),
	NextZero = lib_timer:current_zero_unixtime() + lib_timer:day_second(),
	erlang:send_after(NextZero * 1000, self(), next_activity_start)
.

next_activity_start() ->
	Gather = lib_honour_top:get_honour_top_gather(),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{stage = ?OVER_STAGE, times = 0}),
	Tick = lib_timer:unixtime(),
	Time = lib_season_and_days_api:next_season(lib_honour_top_api:const(open_season,value),Tick) - Tick,
	?DEBUG("下场活动在~p秒后开始",[Time]),
	erlang:send_after(Time * 1000, self(), activity_start)
.

report_fight(Is_fight) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{is_fight = Is_fight}),
	lists:foreach(fun(PlayerId) ->
		Player_pid = lib_player:get_pid(PlayerId),
		Respond = #'Proto80149011'{
			is_fight = Is_fight
		},
		lib_send:respond_to_client_by_pid(Player_pid,Respond)
	end,Gather#honour_top_gather.online_player)
.
