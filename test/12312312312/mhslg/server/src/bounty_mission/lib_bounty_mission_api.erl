%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 18. Jan 2021 8:31 PM
%%%-------------------------------------------------------------------
-module(lib_bounty_mission_api).
-author("lichaoyu").
-include("common.hrl").
-include("bounty_mission.hrl").

%% API
-export([			%% 通用
	next_bounty/2			%% 获取下一个赏金任务
]).

-export([			%% 玩家
	mission/1,				%% 获取城池当前赏金任务
	is_finish/1,			%% 赏金任务是否完成
	u_bounty/1,				%% 更新赏金任务
	d_bounty/0				%% 删除赏金任务
]).

next_bounty(CityId, TaskId) ->
	Conf = tb_city_mission:get(lib_map_api:type(CityId)),
	next(TaskId, maps:get(bounty_mission, Conf))
.
next(_, []) -> true;
next(TaskId, [TaskId | [Task | _]]) -> Task;
next(TaskId, [_ | TaskList]) ->
	next(TaskId, TaskList)
.

player_bounty() ->
	lib_player_bounty_mission:get_bounty_mission()
.

mission(CityId) ->
	BountyMission = (player_bounty())#player_bounty.bounty_mission,
	case dict:find(CityId, BountyMission) of
		{ok, Mission} -> Mission;
		error ->
			case tb_city_mission:get(lib_map_api:type(CityId)) of
				false -> false;
				Conf ->
					TaskId = hd(maps:get(bounty_mission, Conf)),
					#bounty_mission{city_id = CityId, task_id = TaskId}
			end
	end
.

is_finish(CityId) ->
	case mission(CityId) of
		false -> false;
		Mission -> Mission#bounty_mission.state =:= ?ACTIVATION
	end
.

u_bounty(#bounty_mission{city_id = CityId} = BountyMission) ->
	#player_bounty{
		bounty_mission = BountyMissionDict
	} = PlayerBounty = player_bounty(),
	NewBountyMissionDict = dict:store(CityId, BountyMission, BountyMissionDict),
	lib_player_bounty_mission:put_bounty_mission(PlayerBounty#player_bounty{bounty_mission = NewBountyMissionDict}),
	lib_player_process:process_bounty_mission(CityId)
.
d_bounty() ->
	PlayerBounty = player_bounty(),
	lib_player_bounty_mission:put_bounty_mission(PlayerBounty#player_bounty{bounty_mission = dict:new()})
.




