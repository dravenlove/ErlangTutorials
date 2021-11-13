%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 5月 2021 11:07
%%%-------------------------------------------------------------------
-module(lib_honour_top_api).
-author("df").
-include("honour_top.hrl").
-include("common.hrl").
-include("hero.hrl").
%% 功能内部使用API
-export([
	get_player_info/1,
	update_player_info/2,

	get_player_group/2,
	update_player_group/3,

	get_bet_info/1,
	update_bet_info/2,

	get_group_info/2,
	update_group_info/3,

	get_player_grade/3,
	update_player_grade/4,

	get_report_list/3,					%% 获取战报列表 [#report{}]
	join_report/5,						%% 增加战报

	get_stage_and_times/0,				%% 获得系统当前阶段和轮次 {Stage,Times}

	get_top_eight/1,
	update_top_eight/2
]).
-export([
	player_bet/3,						%% 玩家投注
	get_now_odds/1,						%% 计算当前赔率
	player_add_group/4,					%% 玩家活动分组
	player_fight_count/4				%% 战斗完成计算分数
]).

%% 任意进程获取
-export([
%%	get_now_stage/0,					%% 当前活动阶段(按时间获得)
%%	get_now_stage/1,
	get_activity_time/0,				%% 活动举办次数(上一次举办完成未到下一次+1)
	bet_money/0,						%% 押注数量范围
	count_force/1,						%% 计算战力
	const/2
]).

get_player_info(PlayerId) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	maps:get(PlayerId,Gather#honour_top_gather.player_map,#player_honour_top{player_id = PlayerId})
.
update_player_info(PlayerId,PlayerHonourTop) when is_record(PlayerHonourTop,player_honour_top)->
	Gather = lib_honour_top:get_honour_top_gather(),
	NewMap = maps:put(PlayerId,PlayerHonourTop,Gather#honour_top_gather.player_map),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{player_map = NewMap})
.

get_player_group(PlayerId,Stage)->
	PlayerInfo = get_player_info(PlayerId),
	maps:get(Stage,PlayerInfo#player_honour_top.group_map,#player_group_map{stage = Stage})
.
update_player_group(PlayerId,Stage,PlayerGroup) when is_record(PlayerGroup,player_group_map)->
	PlayerInfo = get_player_info(PlayerId),
	NewMap = maps:put(Stage,PlayerGroup,PlayerInfo#player_honour_top.group_map),
	update_player_info(PlayerId,PlayerInfo#player_honour_top{group_map = NewMap})
.

get_bet_info(BetId) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	maps:get(BetId,Gather#honour_top_gather.bet_map,#bet_map{id = BetId})
.
update_bet_info(BetId,Bet) when is_record(Bet, bet_map)->
	Gather = lib_honour_top:get_honour_top_gather(),
	NewMap = maps:put(BetId,Bet,Gather#honour_top_gather.bet_map),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{bet_map = NewMap})
.

get_group_info(Stage,GroupId) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	StageInfo = maps:get(Stage,Gather#honour_top_gather.stage_map,#stage_map{stage = Stage}),
	maps:get(GroupId,StageInfo#stage_map.group,#group_map{group_id = GroupId})
.
update_group_info(Stage,GroupId,GroupInfo) when is_record(GroupInfo,group_map)->
	Gather = lib_honour_top:get_honour_top_gather(),
	StageInfo = maps:get(Stage,Gather#honour_top_gather.stage_map,#stage_map{stage = Stage}),
	NewGroup = maps:put(GroupId,GroupInfo,StageInfo#stage_map.group),
	NewStage = maps:put(Stage,StageInfo#stage_map{group = NewGroup},Gather#honour_top_gather.stage_map),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{stage_map = NewStage})
.

get_player_grade(PlayerId,Stage,GroupId) ->
	GroupInfo = get_group_info(Stage,GroupId),
	maps:get(PlayerId,GroupInfo#group_map.player_grade_info,#player_grade_info{player_id = PlayerId})
.
update_player_grade(PlayerId,Stage,GroupId,Player_grade_info) when is_record(Player_grade_info,player_grade_info)->
	GroupInfo = get_group_info(Stage,GroupId),
	NewMap = maps:put(PlayerId,Player_grade_info,GroupInfo#group_map.player_grade_info),
	update_group_info(Stage,GroupId,GroupInfo#group_map{player_grade_info = NewMap})
.

get_report_list(Times,Stage,GroupId) ->
	GroupInfo = get_group_info(Stage,GroupId),
	Map = maps:get(Times,GroupInfo#group_map.report_map,#report_map{times = Times}),
	maps:fold(fun(_ReportID,Report,List)->
		[Report|List]
	end,[],Map#report_map.reports)
.
join_report(Times,Stage,GroupId,ReportId,Report) when is_record(Report,report) ->
	GroupInfo = get_group_info(Stage,GroupId),
	ReportMap = maps:get(Times,GroupInfo#group_map.report_map,#report_map{times = Times}),
	NewReport = maps:put(ReportId,Report,ReportMap#report_map.reports),
	NewReportMap = maps:put(Times,ReportMap#report_map{reports = NewReport},GroupInfo#group_map.report_map),
	update_group_info(Stage,GroupId,GroupInfo#group_map{report_map = NewReportMap})
.

get_stage_and_times() ->
	Gather = lib_honour_top:get_honour_top_gather(),
	{Gather#honour_top_gather.stage,Gather#honour_top_gather.times}
.

get_top_eight(Rank) ->
	Gather = lib_honour_top:get_honour_top_gather(),
	maps:get(Rank,Gather#honour_top_gather.top_eight,#top_eight{rand = Rank})
.

update_top_eight(Rank,Top_eight) when is_record(Top_eight,top_eight)->
	Gather = lib_honour_top:get_honour_top_gather(),
	NewMap = maps:put(Rank,Top_eight,Gather#honour_top_gather.top_eight),
	lib_honour_top:put_honour_top_gather(Gather#honour_top_gather{top_eight = NewMap})
.
%% =============== %%
player_bet(PlayerId,Rank,Money) ->
	Bet = get_bet_info(Rank),
	NewMap = maps:put(PlayerId,#player_bet{player_id = PlayerId,bet_money = Money},Bet#bet_map.player_bet),
	update_bet_info(Rank,Bet#bet_map{player_bet = NewMap,money = (Bet#bet_map.money + Money)}),
	PlayerInfo = get_player_info(PlayerId),
	update_player_info(PlayerId,PlayerInfo#player_honour_top{bet = Rank})
.

get_now_odds(BetId) ->
	Bet = get_bet_info(BetId),
	lists:foldl(fun(Key,Odds)->
		#{
			'left' := Left, 'right' := Right, 'odds' := NewOdds
		} = tb_honour_top_guess:get(Key),
		case (Bet#bet_map.money >= Left) andalso (Bet#bet_map.money =< Right) of
			true -> NewOdds;
			false-> Odds
		end
	end,0, tb_honour_top_guess:get_list())
.

player_add_group(PlayerId,Stage,GroupId,Rank) ->
	update_player_group(PlayerId,Stage,#player_group_map{stage = Stage,group = GroupId}),
	update_player_grade(PlayerId,Stage,GroupId,#player_grade_info{
		rank = Rank,player_id = PlayerId
	})
.

player_fight_count(PlayerId,Stage,GroupId,IsWin) ->
	Player_grade = get_player_grade(PlayerId,Stage,GroupId),
	case IsWin of
		true -> update_player_grade(PlayerId,Stage,GroupId,Player_grade#player_grade_info{win = Player_grade#player_grade_info.win + 1});
		false-> update_player_grade(PlayerId,Stage,GroupId,Player_grade#player_grade_info{lose = Player_grade#player_grade_info.lose + 1})
	end
.


%% ======= %%
%%stage_map() ->
%%	lists:foldl(fun(Key,Map)->
%%		maps:put(maps:get(stage, tb_honour_top_time:get(Key)), maps:get(stage_start, tb_honour_top_time:get(Key)),Map)
%%	end,maps:new(), tb_honour_top_time:get_list())
%%.
%%
%%get_now_stage() ->
%%	Tick = lib_timer:unixtime(),
%%	get_now_stage(Tick)
%%.
%%get_now_stage(Tick) ->
%%	Time = Tick - lib_timer:current_zero_unixtime(Tick),
%%	get_now_stage(?START_STAGE,Time,stage_map())
%%.
%%
%%get_now_stage(Stage,Time,Map) ->
%%	case Stage =:= ?EIGHT_STAGE of
%%		true  -> Stage;
%%		false -> case Time < maps:get((Stage + 1),Map) of
%%					 true -> Stage;
%%					 false-> get_now_stage(Stage + 1,Time,Map)
%%				 end
%%	end
%%.

get_activity_time() ->
	Day = lib_season_and_days_api:get_season_day(),
	Time = (Day - 3) div 4,
	case ((Day - 3) rem 4) =:= 0 of
		true  -> Time + 1;
		false -> Time + 2
	end
.

bet_money() ->
	[Min,Max] = const(bat_money,jsonvalue),
	{Min,Max}
.

count_force(HeroList) ->
	lists:foldl(fun(Hero,Sum)->
		Hero#hero_base.force + Sum
	end,0,HeroList)
.

const(Key,Start) ->
	maps:get(Start, tb_honour_top_const:get(Key))
.

