%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_season_activity
%%% Created on : 6/16/2021 2:49 PM
%%% @author leever
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%		冬夏信息由mod_season_activity回复
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_season_activity).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	async_apply/1,
	async_apply/2,
	sync_apply/2,
	season_activity_info/0,
	spring_info/1,
	summer_info/1,
	autumn_info/1,
	winter_info/2,
	spring_forward/2,
	spring_one_award/1,
	spring_final_award/0,
	spring_forward_respond/0,
	spring_forward_notify/2,
	summer_campfire_award/2,
	summer_recharge_campfire/1,
	autumn_forward/2,
	autumn_fight/0,
	autumn_one_award/1,
	autumn_final_award/0,
	winter_rank/4,
	cur_s_a/0,
	autumn_forward_respond/0,
	autumn_forward_notify/2,
	notify_winter_info/3,
	winter_final_rank/1,
	notify_summer_info/1
]).
%% 异步
async_apply(Func) ->
	mod_server:async_apply(mod_season_activity:get_pid(), Func)
.
async_apply(Func,Args) ->
	mod_server:async_apply(mod_season_activity:get_pid(), Func, Args)
.
%% 同步
sync_apply(Fun,Args) ->
	mod_server:sync_apply(mod_season_activity:get_pid(),Fun, Args)
.
cur_s_a() ->
	case ?CURRENT_SEASON of
		?SPRING -> {?SPRING,spring_start_time,spring_end_time};
		?SUMMER -> {?SUMMER,summer_start_time,summer_end_time};
		?AUTUMN -> {?AUTUMN,autumn_start_time,autumn_end_time};
		?WINTER -> {?WINTER,winter_start_time,winter_end_time};
		true -> false
	end
.
season_activity_info()->
	{Season,StartTime,EndTime} = lib_season_activity_api:open_tick(cur_s_a()),
	Respond = #'Proto50152001'{
		season = Season,			%说明：当前季节
		start_time = StartTime,		%说明：开始时间
		end_time = EndTime			%说明：结束时间
	},
	lib_send:respond_to_client(Respond)
.
spring_info(PlayerId)->
%%	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_155), ?INFO("功能未开启")),
	SpringMissionList = lib_spring:get_spring_list(PlayerId),
	ProtoSpringMissionList = lib_spring:spring_to_proto(SpringMissionList),
	Respond = #'Proto50152002'{
		final_award = 0,							%说明：最终奖励
		mission = ProtoSpringMissionList			%说明：任务列表
	},
	lib_send:respond_to_client(Respond)
.
summer_info(PlayerId)->
%%	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_156), ?INFO("功能未开启")),
	ProtoCampfireList = lib_summer:get_proto_campfire_list(PlayerId),
	Respond = #'Proto50152003'{
		campfire_info = ProtoCampfireList,
		firecracker_remain_times = lib_summer:firecracker_remain_times(PlayerId),
		firework_remain_times = lib_summer:firework_remain_times(PlayerId)
	},
	lib_send:respond_to_player(PlayerId, Respond)
.
notify_summer_info(PlayerId)->
	ProtoCampfireList = lib_summer:get_proto_campfire_list(PlayerId),
	Respond = #'Proto80152003'{
		campfire_list = ProtoCampfireList,
		firecracker_remain_times = lib_summer:firecracker_remain_times(PlayerId),
		firework_remain_times = lib_summer:firework_remain_times(PlayerId)
	},
	lib_send:respond_to_player(PlayerId, Respond)
.
autumn_info(PlayerId)->
%%	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_157), ?INFO("功能未开启")),
	AutumnMissionList = lib_autumn:get_autumn_list(PlayerId),
	ProtoAutumnMissionList = lib_autumn:autumn_to_proto(AutumnMissionList),
	Respond = #'Proto50152004'{
		final_award = ?TB_S_A_CONST(json,autumn_final_award),		%说明：最终奖励
		mission_info= ProtoAutumnMissionList	%说明：驱盗任务信息
	},
	lib_send:respond_to_client(Respond)
.
%% 由 mod_season_activity 返回
winter_info(RequestWInter,ProtoShowRole)->
%%	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_158), ?INFO("功能未开启")),
	#'ProtoShowRole'{id = PlayerId} = ProtoShowRole,
	case RequestWInter of
		0 -> lib_winter:close(PlayerId);
		1 -> lib_winter:open(ProtoShowRole);
		_ -> ?INFO("Winter activity get problem with close or open!")
	end
.
%% 由 mod_season_activity 返回
notify_winter_info(QuestionId,Status,PlayerId)->
	Question = lib_winter:get_question(QuestionId),
	ProtoQuestion = lib_winter:question_to_proto(Question,PlayerId),
	ProtoRank = case QuestionId =:= 1 of
		true -> #'ProtoWinterRank'{no = 0,right = 0,time = 0};
		false -> lib_winter:rank_to_proto(lib_winter:get_my_rank(PlayerId))
	end,
	Respond = #'Proto80152005'{
		question = ProtoQuestion,	%说明：题目信息
		rank = ProtoRank,
		status = Status,
		remain_time = lib_winter:get_remain_time(Status)
	},
	lib_send:respond_to_player(PlayerId, Respond)
.
spring_forward(SpringMissionId,TroopsHero)->
	#'ProtoTroopsHero'{hero_id = HeroId} = TroopsHero,
	SpringMissionMap = lib_spring:spring_map(),
	SpringMission = maps:get(SpringMissionId,SpringMissionMap),
	lib_spring:update_spring(SpringMission#spring{is_forwarding = true,hero_id = HeroId}),
	lib_player_troops:request_troops_depart(TroopsHero),
	spring_forward_respond()
.
spring_forward_respond() ->
	SpringMissionList = lib_spring:get_spring_list(lib_player:player_id()),
	ProtoSpringMissionLists = lib_spring:spring_to_proto(SpringMissionList),
	Respond = #'Proto50152006'{spring_mission = ProtoSpringMissionLists},
	lib_send:respond_to_client(Respond)
.
%% 到达目的地时地图进程通过玩家进程调用
spring_forward_notify(PlayerId,HeroId) ->
	SpringMissionList = lib_spring:get_spring_list(PlayerId),
	lists:foreach(fun(SpringMission) ->
		case SpringMission#spring.hero_id =:= HeroId of
			true -> lib_spring:update_spring(SpringMission#spring{is_forwarding = false,is_arrived = true});
			false -> skip
		end
				  end,SpringMissionList),
	lib_send:respond_to_client(#'Proto80152006'{spring_mission_list = lib_spring:spring_to_proto(lib_spring:get_spring_list(PlayerId))})
.
spring_one_award(ProtoSpringMission)->
	#'ProtoSpringMission'{id = SpringMissionId,award = AwardId} = ProtoSpringMission,
	Item = lib_season_activity_api:get_award(AwardId),
	lib_season_activity_api:s_a_item_insert([Item],?SPRING),
	SpringMissionMap = lib_spring:spring_map(),
	SpringMission = maps:get(SpringMissionId,SpringMissionMap),
	lib_spring:update_spring(SpringMission#spring{is_received = true}),
	lib_send:respond_to_client(#'Proto50152007'{spring_mission = lib_spring:spring_to_proto(lib_spring:get_spring_list(lib_player:player_id()))}).

spring_final_award()->
	SpringFinalAward = ?TB_S_A_CONST(json,spring_final_award),
	ItemList = lists:foldl(fun(AwardId,List) -> [lib_season_activity_api:get_award(AwardId)|List] end,[],SpringFinalAward),
	lib_season_activity_api:s_a_item_insert(ItemList,?SUMMER),
	PlayerSeasonActivity = lib_player_season_activity:get_player_season_activity(),
	lib_player_season_activity:put_player_season_activity(PlayerSeasonActivity#player_season_activity{is_spring_final_award = true}),
	lib_send:respond_to_client(#'Proto50152008'{spring_mission = lib_spring:spring_to_proto(lib_spring:get_spring_list(lib_player:player_id()))}).

summer_campfire_award(ProtoCampfire,PlayerId) ->
	#'ProtoCampfire'{id = CampfireId,received_times = ReceivedTimes,award = AwardIdList,total_times = TotalTimes} = ProtoCampfire,
	case CampfireId of
		?FIRECRACKER_ID -> lib_summer:firecracker_award(ReceivedTimes,AwardIdList,PlayerId);
		?FIREWORK_ID -> lib_summer:firework_award(ReceivedTimes,AwardIdList,TotalTimes,PlayerId);
		true -> lib_summer:campfire_award(CampfireId,ReceivedTimes,AwardIdList,PlayerId)
	end,
	%% 刷新
	lib_season_activity:summer_info(lib_player:player_id())
.
summer_recharge_campfire(ProtoCampfire) ->
	#'ProtoCampfire'{id = _CampfireId,received_times = _ReceivedTimes,award = _AwardIdList} = ProtoCampfire
.
autumn_forward(AutumnMissionId,TroopsHero) ->
	#'ProtoTroopsHero'{hero_id = HeroId} = TroopsHero,
	AutumnMissionMap = lib_autumn:autumn_map(),
	AutumnMission = maps:get(AutumnMissionId,AutumnMissionMap),
	lib_autumn:update_autumn(AutumnMission#autumn{hero_id = HeroId}),
	lib_player_troops:request_troops_depart(TroopsHero),
	autumn_forward_respond()
.
autumn_forward_respond() ->
	AutumnMissionList = lib_autumn:get_autumn_list(lib_player:player_id()),
	ProtoAutumnMissionList = lib_autumn:autumn_to_proto(AutumnMissionList),
	Respond = #'Proto50152011'{autumn_mission_list = ProtoAutumnMissionList},
	lib_send:respond_to_client(Respond)
.
%% 到达目的地时地图进程通过玩家进程调用
autumn_forward_notify(PlayerId,HeroId) ->
	AutumnMissionList = lib_autumn:get_autumn_list(PlayerId),
	lists:foreach(fun(AutumnMission) ->
		case AutumnMission#autumn.hero_id =:= HeroId of
			true -> lib_spring:update_spring(AutumnMission#autumn{is_arrived = true});
			false -> skip
		end
				  end,AutumnMissionList),
	lib_send:respond_to_client(#'Proto80152011'{autumn_mission_list = lib_autumn:autumn_to_proto(lib_autumn:get_autumn_list(PlayerId))})
.
autumn_fight() ->
	ok
.
autumn_one_award(ProtoAutumnMission) ->
	#'ProtoSpringMission'{id = AutumnMissionId,award = AwardId} = ProtoAutumnMission,
	Item = lib_season_activity_api:get_award(AwardId),
	lib_season_activity_api:s_a_item_insert([Item],?AUTUMN),
	AutumnMissionMap = lib_autumn:autumn_map(),
	AutumnMission = maps:get(AutumnMissionId,AutumnMissionMap),
	lib_autumn:update_autumn(AutumnMission#autumn{is_received = true}),
	lib_send:respond_to_client(#'Proto50152013'{autumn_mission_list = lib_spring:get_spring_list(lib_player:player_id())})
.
autumn_final_award() ->
	AutumnFinalAward = ?TB_S_A_CONST(json,autumn_final_award),
	ItemList = lists:foldl(fun(AwardId,List) -> [lib_season_activity_api:get_award(AwardId)|List] end,[],AutumnFinalAward),
	lib_season_activity_api:s_a_item_insert(ItemList,?AUTUMN),
	PlayerSeasonActivity = lib_player_season_activity:get_player_season_activity(),
	lib_player_season_activity:put_player_season_activity(PlayerSeasonActivity#player_season_activity{is_autumn_final_award = true}),
	lib_send:respond_to_client(#'Proto50152014'{autumn_mission_list = lib_autumn:autumn_to_proto(lib_autumn:get_autumn_list(lib_player:player_id()))})
.
winter_rank(PlayerId,IsRight,AnswerTime,Answered) ->
	lib_winter:solve(PlayerId,IsRight,AnswerTime,Answered)
.
winter_final_rank(PlayerId) ->
	RankList = lib_winter:get_rank_list(),
	ProtoRankList = lib_winter:final_rank_to_proto(RankList),
	Respond = #'Proto50152016'{
		final_rank_list = ProtoRankList
			},
	?DEBUG("there`s my winter Notify!!!!~p",[Respond]),
	lib_send:respond_to_player(PlayerId, Respond)
.