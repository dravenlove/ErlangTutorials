%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_season_activity
%%% Created on : 2021/7/15 11:24
%%% @author leever
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_season_activity).
-author("leever").
-include("common.hrl").
-include("season_activity.hrl").

%% API
-export([
	get_player_season_activity/0,
	put_player_season_activity/1,
	player_season_activity_handler/0,
	season_activity_info/0,
	spring_info/0,
	summer_info/0,
	autumn_info/0,
	winter_info/1,
	spring_forward/1,
	spring_one_award/1,
	spring_final_award/0,
	summer_campfire_award/1,
	summer_recharge_campfire/1,
	autumn_forward/1,
	autumn_fight/0,
	autumn_one_award/1,
	autumn_final_award/0,
	winter_rank/1,
	winter_final_rank/0
]).
get_player_season_activity() ->
	erlang:get(?ETS_PLAYER_SEASON_ACTIVITY)
.
put_player_season_activity(PlayerSeasonActivity) when is_record(PlayerSeasonActivity, player_season_activity) ->
	put_player_season_activity(PlayerSeasonActivity, true)
.
put_player_season_activity(PlayerSeasonActivity, IsSaveDb) when is_record(PlayerSeasonActivity, player_season_activity) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_SEASON_ACTIVITY),
	erlang:put(?ETS_PLAYER_SEASON_ACTIVITY, PlayerSeasonActivity)
.
ets_init() ->
	ets:new(?ETS_PLAYER_SEASON_ACTIVITY, [?ETS_KEY_POS(#player_season_activity.id) | ?ETS_OPTIONS])
.
build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_SEASON_ACTIVITY, {?TUPLE_INT(id, 1)}, true)
.
player_season_activity_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_SEASON_ACTIVITY,
		table_name = ?DB_PLAYER_SEASON_ACTIVITY,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_season_activity:load_player_season_activity/1,
		save_func = fun db_player_season_activity:save_player_season_activity/1,
		get_func = fun get_player_season_activity/0,
		put_func = fun put_player_season_activity/2
	}.
season_activity_info() ->
	lib_season_activity:season_activity_info().
spring_info() ->
	PlayerId = lib_player:player_id(),
	lib_season_activity:spring_info(PlayerId).
summer_info() ->
	PlayerId = lib_player:player_id(),
	lib_season_activity:async_apply(fun lib_season_activity:summer_info/1,[PlayerId]).
autumn_info() ->
	PlayerId = lib_player:player_id(),
	lib_season_activity:autumn_info(PlayerId).
winter_info(Msg) ->
	#'Proto10152005'{request_winter = RequestWInter} = Msg,
	ProtoShowRole = lib_player:serialize_show_role(),
	lib_season_activity:async_apply(fun lib_season_activity:winter_info/2,[RequestWInter,ProtoShowRole]).

spring_forward(Msg) ->
	#'Proto10152006'{spring_mission_id = SpringMissionId,troops_hero = TroopsHero} = Msg,
	lib_season_activity:spring_forward(SpringMissionId,TroopsHero).
spring_one_award(Msg) ->
	#'Proto10152007'{spring_mission = ProtoSpringMission} = Msg,
	lib_season_activity:spring_one_award(ProtoSpringMission).
spring_final_award() ->
	lib_season_activity:spring_final_award().

summer_campfire_award(Msg) ->
	#'Proto10152009'{campfire = ProtoCampfire} = Msg,
	PlayerId = lib_player:player_id(),
	lib_season_activity:async_apply(fun lib_season_activity:summer_campfire_award/2,[ProtoCampfire,PlayerId])
.
summer_recharge_campfire(Msg) ->
	#'Proto10152010'{campfire = ProtoCampfire} = Msg,
	lib_season_activity:summer_recharge_campfire(ProtoCampfire).

autumn_forward(Msg) ->
	#'Proto10152011'{autumn_mission_id = AutumnMissionId,troops_hero = TroopsHero} = Msg,
	lib_season_activity:autumn_forward(AutumnMissionId,TroopsHero).
autumn_fight() ->
	lib_season_activity:async_apply(fun lib_season_activity:autumn_fight/0).
autumn_one_award(Msg) ->
	#'Proto10152013'{autumn_mission = ProtoAutumnMission} = Msg,
	lib_season_activity:autumn_one_award(ProtoAutumnMission).
autumn_final_award() ->
	lib_season_activity:autumn_final_award().

winter_rank(Msg) ->
	#'Proto10152015'{is_right = IsRight,answer_time = AnswerTime,answer = Answered} = Msg,
	lib_season_activity:async_apply(fun lib_season_activity:winter_rank/4,[lib_player:player_id(),IsRight,AnswerTime,Answered]).
winter_final_rank() ->
	PlayerId = lib_player:player_id(),
	lib_season_activity:async_apply(fun lib_season_activity:winter_final_rank/1,[PlayerId]).

