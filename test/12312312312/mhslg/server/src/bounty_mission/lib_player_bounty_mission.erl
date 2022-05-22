%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Jan 2021 8:29 PM
%%%-------------------------------------------------------------------
-module(lib_player_bounty_mission).
-author("lichaoyu").
-include("common.hrl").
-include("ProtoClient_10118.hrl").
-include("bounty_mission.hrl").
-include("troops.hrl").
-include("map.hrl").
-include("clearing.hrl").
-include("fight.hrl").

%% API
-export([
	test/0,
	update_season/0,		%% 赛季更新时
	city_occupy/1,
	city_be_occupy/1,
	request_bounty_mission/0,		%% 请求赏金任务信息
	request_bounty_mission_finish/1,%% 请求赏金任务完成
	request_bounty_mission_fight/2,	%% 请求赏金任务战斗
	respond_bounty_mission_fight/2
]).

-export([
	put_bounty_mission/1,
	get_bounty_mission/0,
	player_bounty_mission_handler/0
]).

-define(NOTICE_UPDATE, 0).
-define(NOTICE_DELETE, 1).

put_bounty_mission(BountyMission) ->
	put_bounty_mission(BountyMission, true).
put_bounty_mission(BountyMission, IsSaveDb) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BOUNTY_MISSION),
	erlang:put(?ETS_PLAYER_BOUNTY_MISSION, BountyMission).

get_bounty_mission() ->
	erlang:get(?ETS_PLAYER_BOUNTY_MISSION).

ets_init() ->
	ets:new(?ETS_PLAYER_BOUNTY_MISSION, [?ETS_KEY_POS(#player_bounty.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_BOUNTY_MISSION, {?TUPLE_INT(id, 1)}, true).

player_bounty_mission_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_BOUNTY_MISSION,
		table_name = ?DBPLAYER_BOUNTY_MISSION,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_bounty_mission:load_player_bounty_mission/1,
		save_func = fun db_bounty_mission:save_player_bounty_mission/1,
		get_func = fun get_bounty_mission/0,
		put_func = fun put_bounty_mission/2
	}.

update_season() -> %%todo 策划要求，赛季赏金任务进行重置，需合服时调用，修改全部玩家的赏金任务状态
	lib_bounty_mission_api:d_bounty()
.

city_occupy(CityId) ->
	case lib_bounty_mission_api:mission(CityId) of
		false -> skip;
		Mission -> notice_bounty_mission(?NOTICE_UPDATE, Mission)
	end
.
city_be_occupy(CityId) ->
	case lib_bounty_mission_api:mission(CityId) of
		false -> skip;
		Mission -> notice_bounty_mission(?NOTICE_DELETE, Mission)
	end
.

to_proto(BountyMission) ->
	#'ProtoBountyMission'{
		city_id = BountyMission#bounty_mission.city_id,
		task_id = BountyMission#bounty_mission.task_id,
		state = BountyMission#bounty_mission.state
	}
.

request_bounty_mission() ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_125), ?INFO("功能未开启")),
	CityIdList = lib_player_map:country_city(lib_player:player_country()),
	BountyMissionList = [to_proto(Y) || X <- CityIdList,
		lib_map_api:type(X) >= ?CITY_XIAN_CITY,
		(Y = lib_bounty_mission_api:mission(X))#bounty_mission.state =/= ?ACTIVATION],
	Res = #'Proto50118005'{
		bounty_mission_list = BountyMissionList
	},
	lib_send:respond_to_client(Res)
.

request_bounty_mission_finish(CityId) ->
	?JUDGE_RETURN(lib_function_open:function_is_open(?CONDITION_ID_125), ?INFO("功能未开启")),
	Conf = tb_city_mission:get(lib_map_api:type(CityId)),
	?JUDGE_RETURN(Conf, ?ERROR_BAD_TASK),
	BountyMission = lib_bounty_mission_api:mission(CityId),
	State = BountyMission#bounty_mission.state,
	?JUDGE_RETURN(State =/= ?ACTIVATION, ?ERROR_TASK_NOT_FINISH),
	TaskId = BountyMission#bounty_mission.task_id,
	TaskConf = tb_bounty_mission:get(TaskId),
	{Flag, NewBountyMission} =
		case maps:get(x, TaskConf) > lib_season_and_days_api:get_season() of
			false ->
				lib_equip_api:item(maps:get(final_award, Conf), ?ADD_BOUNTY_MISSION, CityId),
				{?NOTICE_DELETE, BountyMission#bounty_mission{state = ?ACTIVATION}};
			true ->
				?JUDGE_RETURN(lib_troops_api:is_city(CityId), ?ERROR_TROOPS_NULL),
				case State of
					?UNRECEIVED ->
						TaskType = maps:get(type, TaskConf),
						case TaskType of
							?RECEIVED_MONSTER ->
								CanClearing = lib_map_clearing_api:city_task(CityId, ?TYPE_BOUNTY_MISSION, TaskId),
								?JUDGE_RETURN(CanClearing, ?ERROR_CONFIG_NOT_EXISTENT);
							_ -> skip
						end,
						{?NOTICE_UPDATE, BountyMission#bounty_mission{state = TaskType}};
					?RECEIVED_RESOURCE ->
						Consume = maps:get(consume, TaskConf),
						lib_equip_api:item(Consume, ?USE_BOUNTY_MISSION, CityId),
						{?NOTICE_UPDATE, BountyMission#bounty_mission{state = ?COMPLETED}};
%%			?RECEIVED_MONSTER -> %%todo 杀怪任务
%%				request_bounty_mission_fight(Robot, 201),
%%				{?NOTICE_UPDATE, BountyMission#bounty_mission{state = ?COMPLETED, robot = ""}};
					?COMPLETED ->
						Award = maps:get(award, TaskConf),
						lib_equip_api:item(Award, ?ADD_BOUNTY_MISSION, CityId),
						case lib_bounty_mission_api:next_bounty(CityId, TaskId) of
							true -> {?NOTICE_UPDATE, BountyMission#bounty_mission{state = ?ALL_FINISH}};
							Next -> {?NOTICE_UPDATE, BountyMission#bounty_mission{task_id = Next, state = ?UNRECEIVED}}
						end;
					?ALL_FINISH ->
						Type = lib_map_api:type(CityId),
						FinalAward = maps:get(final_award, tb_city_mission:get(Type)),
						lib_equip_api:item(FinalAward, ?ADD_BOUNTY_MISSION, CityId),
						{?NOTICE_DELETE, BountyMission#bounty_mission{state = ?ACTIVATION}};
					_ -> throw({error, ?ERROR_TASK_NOT_FINISH})
				end
		end,
	lib_bounty_mission_api:u_bounty(NewBountyMission),
	notice_bounty_mission(Flag, NewBountyMission)
.

request_bounty_mission_fight(ClearingId, HeroIdList) ->
	CityId = lib_map_clearing_api:city_id(ClearingId),
	#bounty_mission{task_id = TaskId} = lib_bounty_mission_api:mission(CityId),
	RobotId = hd(maps:get(consume, tb_bounty_mission:get(TaskId))),
	TroopsIdList = lib_troops_api:troops_id(HeroIdList),
	PlayerId = lib_player:player_id(),
	Robots = [lib_robot_api:random_monster(RobotId)],
	Params = {?CALL_FIGHT_TYPE_BOUNTY, PlayerId, ClearingId},
	F = lib_troops_api:async(fun lib_troops_api:to_fighting/5, [?CALL_FIGHT_TYPE_BOUNTY, Params, TroopsIdList, Robots, CityId]),
	?JUDGE_RETURN(F =/= 0, ?ERROR_TROOPS_ERROR)
.
respond_bounty_mission_fight(ClearingId, CallBackData) ->
	lib_send:respond_to_client(CallBackData#callback_data0.msg),
	lib_send:respond_to_client(CallBackData#callback_data0.result_msg),
	case CallBackData#callback_data0.win_type of
		?FIGHTER_TYPE_L ->
			CityId = lib_map_clearing_api:city_id(ClearingId),
			lib_map_clearing_api:d_clearing(ClearingId),
			BountyMission = lib_bounty_mission_api:mission(CityId),
			NewBountyMission = BountyMission#bounty_mission{state = ?COMPLETED},
			lib_bounty_mission_api:u_bounty(NewBountyMission),
			notice_bounty_mission(?NOTICE_UPDATE, NewBountyMission);
		_ -> skip
	end
.

notice_bounty_mission(Flag, BountyMission) ->
	Res = #'Proto80118005'{
		state = Flag,
		bounty_mission = to_proto(BountyMission)
	},
	lib_send:respond_to_client(Res)
.

test() ->
	request_bounty_mission_fight("17_33", [201]),
	CityId = lib_troops_api:sync(fun lib_troops_api:city_id/1, [lib_troops_api:troops_id(201)]),
	request_bounty_mission_finish(CityId)
.
