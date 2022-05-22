%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_combat_queue_test.erl
%% Created on : 2020.11.8
%% Author: Jiuan
%% Last Modified: 2020.11.9
%% Description: 战斗队列测试
%% 示例：
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_combat_queue_test).
-include("combat_queue.hrl").
-include("player.hrl").
-include("hero.hrl").
-include("fight_prop.hrl").
-include("fight.hrl").

-export([
	sync_call_fight/2,
	async_call_fight/2,
	async_cast_fight/3,
	fight_test_skill/0,
	fight_test_skill1/0,
	test_fight/0,
	rend/0
]).
sync_call_fight(HeroId, RobotId) ->
	lib_combat_queue_api:sync_call_fight(req_queue(HeroId, RobotId)).
async_call_fight(HeroId, RobotId) ->
	lib_combat_queue_api:async_call_fight(req_queue(HeroId, RobotId)).
async_cast_fight(_Type, HeroId, RobotId) ->
	lib_combat_queue_api:async_cast_fight(req_queue(HeroId, RobotId)).


req_queue(HeroId, RobotId) ->
	Hero = lib_combat_queue_api:to_combat_hero(lib_player:player_show(), lib_hero_api:hero_base_info(HeroId)),
	Config = tb_robot:get(RobotId),
	MonsterIdList = maps:get(monster_id_list, Config, []),
	Robot = lists:foldr(fun(MonsterId, Acc) ->
		HeroBase = lib_robot_api:get_monster(MonsterId,RobotId),
		Combat_hero = lib_combat_queue_api:to_combat_hero(lib_robot_api:robot_player_show(RobotId), HeroBase),
		[Combat_hero| Acc]
	end, [], MonsterIdList),
	#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_TEST,                           %% 调用者自身类型，例如 沙盘，国战等
		interval_type = 2,    %% 间隔类型 1-固定时间间隔interval 2-战斗中统计技能配置 3-interval+战斗中统计技能配置
		fight_type = ?FIGHT_TYPE1,          %% 战斗类型 1-战胜方回到队伍后方  2-顺序一对一，对比胜场
		params = [1,2],                        %% 调用者自定义参数，每次回调时附上
		count_down = 10,                    %% 倒计时，请求开始新队列后多久开始战斗。
		interval = 50,                       %% 每场对决的时间间隔
		l_fighters = [Hero],      			%% #combat_hero{}s
		r_fighters = Robot,      			%% #combat_hero{}s
		drums_limit = ?DRUMS_LIMIT_SIZE    	%% 敲鼓队伍数量要求
	}.


fight_test_skill() ->
	HeroIdList = [406],
	RobotId = 9000102,
	HeroList = [lib_combat_queue_api:to_combat_hero(lib_player:player_show(), lib_hero_api:hero_base_info(HeroId))||HeroId <- HeroIdList],
	Config = tb_robot:get(RobotId),
	MonsterIdList = maps:get(monster_id_list, Config, []),
	Robot = lists:foldl(fun(MonsterId, Acc) ->
		HeroBase = lib_robot_api:get_monster(MonsterId,RobotId),
		Combat_hero = lib_combat_queue_api:to_combat_hero(lib_robot_api:robot_player_show(RobotId), HeroBase),
		?INFO("Combat_hero ~p",[Combat_hero#combat_hero.name]),
		[Combat_hero| Acc]
						end, [], MonsterIdList),
	lib_combat_queue_api:sync_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_TEST,                           %% 调用者自身类型，例如 沙盘，国战等
		interval_type = 2,    %% 间隔类型 1-固定时间间隔interval 2-战斗中统计技能配置 3-interval+战斗中统计技能配置
		fight_type = ?FIGHT_TYPE1,          %% 战斗类型 1-战胜方回到队伍后方  2-顺序一对一，对比胜场
		params = [1,2],                        %% 调用者自定义参数，每次回调时附上
		count_down = 10,                    %% 倒计时，请求开始新队列后多久开始战斗。
		interval = 50,                       %% 每场对决的时间间隔
		l_fighters = [X#combat_hero{skill_list = [201504001|X#combat_hero.skill_list]} || X <- HeroList],      			%% #combat_hero{}s
		r_fighters = Robot,      			%% #combat_hero{}s
		drums_limit = ?DRUMS_LIMIT_SIZE    	%% 敲鼓队伍数量要求
	})

.

fight_test_skill1() ->
	HeroIdList = [201, 202],
	RobotId = 1000000,
	HeroList = [lib_combat_queue_api:to_combat_hero(lib_player:player_show(), lib_hero_api:hero_base_info(HeroId))||HeroId <- HeroIdList],
	Config = tb_robot:get(RobotId),
	MonsterIdList = maps:get(monster_id_list, Config, []),
	Robot = lists:foldl(fun(MonsterId, Acc) ->
		HeroBase = lib_robot_api:get_monster(MonsterId,RobotId),
		Combat_hero = lib_combat_queue_api:to_combat_hero(lib_robot_api:robot_player_show(RobotId), HeroBase),
		?INFO("Combat_hero ~p",[Combat_hero#combat_hero.name]),
		[Combat_hero| Acc]
	end, [], MonsterIdList),
	?INFO("~p~n", [HeroList]),
	lib_combat_queue_api:sync_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_TEST,                           %% 调用者自身类型，例如 沙盘，国战等
		interval_type = 2,    %% 间隔类型 1-固定时间间隔interval 2-战斗中统计技能配置 3-interval+战斗中统计技能配置
		fight_type = ?FIGHT_TYPE1,          %% 战斗类型 1-战胜方回到队伍后方  2-顺序一对一，对比胜场
		params = [1,2],                        %% 调用者自定义参数，每次回调时附上
		count_down = 10,                    %% 倒计时，请求开始新队列后多久开始战斗。
		interval = 50,                       %% 每场对决的时间间隔
		l_fighters = HeroList,      			%% #combat_hero{}s
		r_fighters = lists:sublist(Robot, 1),      			%% #combat_hero{}s
		drums_limit = ?DRUMS_LIMIT_SIZE    	%% 敲鼓队伍数量要求
	})
.

test_fight() ->
	HeroIdList = lists:sublist(lib_hero_api:hero_id_list(), 6),
	RobotId = 9000105,
	HeroList = [lib_combat_queue_api:to_combat_hero(lib_player:player_show(), lib_hero_api:hero_base_info(HeroId))||HeroId <- HeroIdList],
	Config = tb_robot:get(RobotId),
	MonsterIdList = maps:get(monster_id_list, Config, []),
	Robot = lists:foldl(fun(MonsterId, Acc) ->
		HeroBase = lib_robot_api:get_monster(MonsterId,RobotId),
		Combat_hero = lib_combat_queue_api:to_combat_hero(lib_robot_api:robot_player_show(RobotId), HeroBase),
		?INFO("Combat_hero ~p",[Combat_hero#combat_hero.name]),
		[Combat_hero| Acc]
	end, [], MonsterIdList),
	lib_combat_queue_api:sync_call_fight(#req_combat_queue{
		type = ?CALL_FIGHT_TYPE_TEST,                           %% 调用者自身类型，例如 沙盘，国战等
		interval_type = 2,    %% 间隔类型 1-固定时间间隔interval 2-战斗中统计技能配置 3-interval+战斗中统计技能配置
		fight_type = ?FIGHT_TYPE1,          %% 战斗类型 1-战胜方回到队伍后方  2-顺序一对一，对比胜场
		params = [1,2],                        %% 调用者自定义参数，每次回调时附上
		count_down = 10,                    %% 倒计时，请求开始新队列后多久开始战斗。
		interval = 50,                       %% 每场对决的时间间隔
		l_fighters = HeroList,      			%% #combat_hero{}s
		r_fighters = Robot,      			%% #combat_hero{}s
		drums_limit = ?DRUMS_LIMIT_SIZE    	%% 敲鼓队伍数量要求
	})
.

rend() ->


	rend.