%%--- coding:utf-8 ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File Name: lib_combat_queue_api.erl
%% Created on : 2020.11.8
%% Author: Jiuan
%% Last Modified: 2020.11.9
%% Description: 战斗队列接口
%% 示例：
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(lib_combat_queue_api).
-include("common.hrl").
-include("hero.hrl").
-include("fight.hrl").
-include("fight_prop.hrl").
-include("player.hrl").
-include("combat_queue.hrl").
-include("ProtoPublic.hrl").
-include("ProtoClient_10102.hrl").

-export([
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 开始战斗队列接口
%% 同步方法直接返回完整战斗过程，异步调用则返回CombatQueueId(战斗队列唯一id)
%% 后续信息更新则响应调用进程do_cast{combat_queue_callback, Data}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%combat_queue/1,     %% 开始战斗队列 异步
	%%combat_queue/2,     %% 开始战斗队列 (同步 直接返回完整战斗过程) (异步 返回CombatQueueId，战斗回调函数为调用进程mod文件 do_cast{combat_queue_callback, Data})
	%% 调用战斗接口
	sync_call_fight/1,	%% 同步调用一次性打完 战斗数据直接函数返回
	sync_call_fight/2,

	async_call_fight/1,	%% 异步调用无时间间隔一次性打完 战斗数据异步一次性返回
	async_call_fight/2,

	async_cast_fight/1,	%% 异步调用有时间间隔分段式战斗 战斗数据以回调形式返回
	async_cast_fight/2,

	hero_id_list_to_fighters/1,		%% 参数：出战英雄id列表  只能在玩家进程调用 返回战斗英雄列表

	robot_id_to_fighters/1,			%% 参数：机器人配置id， 返回战斗英雄列表

	%% 与进程无关结构转换接口
	hero_list_fighters/2,			%% 参数 #player_show{}  #hero_base{}列表  返回 战斗英雄列表
	to_combat_hero/2,				%% 参数 #player_show{}, #hero_base{}  返回 战斗英雄结构
	to_combat_hero/3,
	to_combat_hero_with_troops/3,	%% 参数 #player_show{}, #hero_base{}  {前军兵力， 后军兵力} 返回 战斗英雄结构
	get_skill_list/1,

	result_msg_add_reward/2,

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 操作战斗队列相关接口
%% 所有操作改变战斗队列状态后均会响应(调用开始战斗的进程)do_cast{combat_queue_callback, Data}
%% 另外，调用操作接口函数的进程会获得返回true or false，返回方式看对应操作函数注释
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	join_combat_queue/2,    %% 加入战斗队列 同步 返回true or false
	join_combat_queue/3,    %% 加入战斗队列 异步 响应调用进程mod文件 do_cast{join_combat_queue_callback, [true or false | Params]} (战斗中抵达)

	quit_combat_queue/3,    %% 退出战斗队列 同步 返回true or false
	quit_combat_queue/4,    %% 退出战斗队列 异步 响应调用进程mod文件 do_cast{quit_combat_queue_callback, [true or false | Params]} (撤军，突进)

	quic_combat_queue/1,    %% 加速战斗队列 同步 返回true or false
	quic_combat_queue/2,    %% 加速战斗队列 异步 响应调用进程mod文件 do_cast{quic_combat_queue_callback, [true or false | Params]} (敲鼓)

	insert_combat_buff/3,    %% 异步增加buff  参数(combat_queue_id, ?FIGHTER_TYPE_L or ?FIGHTER_TYPE_R, buff_list)
	remove_combat_buff/3,    %% 异步删除buff  参数(combat_queue_id, ?FIGHTER_TYPE_L or ?FIGHTER_TYPE_R, buff_list)

	restart_combat_queue/1, %% 重启战斗队列

%%	robot_conf_to_player_show/1,
%%	monster_id_list_to_fighters/1,
%%	monster_id_to_fighter/1,

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 观战战斗相关接口 异步
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	join_watching/2,
	quit_watching/2,


	request_rank/2,


	combat_hero_to_hero_base/1,

	rend/0
]).

sync_call_fight(ReqCombatQueue) ->
	sync_call_fight(erlang:self(), ReqCombatQueue).
sync_call_fight(CallBackModule, ReqCombatQueue) ->
	combat_queue(CallBackModule, ReqCombatQueue#req_combat_queue{interval_type = ?INTERVAL_TYPE0}, sync).

async_call_fight(ReqCombatQueue) ->
	async_call_fight(erlang:self(), ReqCombatQueue).
async_call_fight(CallBackModule, ReqCombatQueue) ->
	combat_queue(CallBackModule, ReqCombatQueue#req_combat_queue{interval_type = ?INTERVAL_TYPE0}).

async_cast_fight(ReqCombatQueue) ->
	async_cast_fight(erlang:self(), ReqCombatQueue).
async_cast_fight(CallBackModule, ReqCombatQueue) ->
	combat_queue(CallBackModule, ReqCombatQueue).


combat_queue(CallBackModule, ReqCombatQueue) ->
	combat_queue(CallBackModule, ReqCombatQueue, async).
combat_queue(CallBackModule, ReqCombatQueue, ReqWay) ->
	mod_combat_queue:combat_queue(ReqCombatQueue, ReqWay, CallBackModule).

%%join_combat_queue(CombatQueueId, PlayerBase, Hero) ->
%%	join_combat_queue(CombatQueueId, Fighter, async).
join_combat_queue(CombatQueueId, Fighter) when is_record(Fighter, combat_hero) ->
	join_combat_queue(CombatQueueId, [Fighter], async);
join_combat_queue(CombatQueueId, Fighters) when is_list(Fighters) ->
	join_combat_queue(CombatQueueId, Fighters, async).
join_combat_queue(CombatQueueId, Fighter, ReqWay) when is_record(Fighter, combat_hero) ->
	join_combat_queue(CombatQueueId, [Fighter], ReqWay, []);
join_combat_queue(CombatQueueId, Fighters, ReqWay) when is_list(Fighters) ->
	join_combat_queue(CombatQueueId, Fighters, ReqWay, []).
join_combat_queue(CombatQueueId, Fighter, ReqWay, Params) when is_record(Fighter, combat_hero) ->
	join_combat_queue(CombatQueueId, [Fighter], ReqWay, Params);
join_combat_queue(CombatQueueId, Fighters, ReqWay, Params) when is_list(Fighters) ->
	mod_combat_queue:join_combat_queue(CombatQueueId, Fighters, ReqWay, erlang:self(), Params).

quit_combat_queue(CombatQueueId, PlayerBase, HeroId) ->
	quit_combat_queue(CombatQueueId, PlayerBase, HeroId, async).
quit_combat_queue(CombatQueueId, PlayerBase, HeroId, ReqWay) ->
	quit_combat_queue(CombatQueueId, PlayerBase, HeroId, ReqWay, []).
quit_combat_queue(CombatQueueId, PlayerBase, HeroId, ReqWay, Params) ->
	mod_combat_queue:quit_combat_queue(CombatQueueId, PlayerBase, HeroId, ReqWay, erlang:self(), Params).

quic_combat_queue(CombatQueueId) ->
	quic_combat_queue(CombatQueueId, async).
quic_combat_queue(CombatQueueId, ReqWay) ->
	quic_combat_queue(CombatQueueId, ReqWay, []).
quic_combat_queue(CombatQueueId, ReqWay, Params) ->
	mod_combat_queue:quic_combat_queue(CombatQueueId, ReqWay, erlang:self(), Params).

insert_combat_buff(CombatQueueId, InsertType, BuffId) when is_integer(BuffId) ->
	insert_combat_buff(CombatQueueId, InsertType, [BuffId]);
insert_combat_buff(CombatQueueId, InsertType, BuffList) ->
	mod_combat_queue:insert_combat_buff(CombatQueueId, InsertType, BuffList).

remove_combat_buff(CombatQueueId, RemoveType, BuffId) when is_integer(BuffId) ->
	remove_combat_buff(CombatQueueId, RemoveType, [BuffId]);
remove_combat_buff(CombatQueueId, RemoveType, BuffList) ->
	mod_combat_queue:remove_combat_buff(CombatQueueId, RemoveType, BuffList).

join_watching(CombatQueueId, PlayerBase) ->
	mod_combat_queue:join_watching(CombatQueueId, PlayerBase).

quit_watching(CombatQueueId, PlayerId) ->
	mod_combat_queue:quit_watching(CombatQueueId, PlayerId).

request_rank(CombatQueueId, PlayerId) ->
	mod_combat_queue:request_rank(CombatQueueId, PlayerId).

restart_combat_queue(CombatQueueId) ->
	mod_combat_queue:restart_combat_queue(CombatQueueId).

hero_id_list_to_fighters(HeroIdList) ->
	lists:foldr(fun(HeroID, Acc) ->
		HeroBase = lib_hero_api:hero_base_info(HeroID),
		PlayerShow = lib_player:player_show(),
		[to_combat_hero(PlayerShow, HeroBase) | Acc]
	end, [], HeroIdList).
hero_list_fighters(PlayerShow, HeroList) ->
	lists:foldr(fun(HeroBase, Acc) ->
		[to_combat_hero(PlayerShow, HeroBase) | Acc]
	end, [], HeroList).


to_combat_hero_with_troops(PlayerShow, HeroBase, {FormerTroops, LatterTroops}) ->
	PropBase = lib_fight_prop:hero_base_to_prop_base(HeroBase),
	to_combat_hero(PlayerShow, HeroBase, PropBase, {FormerTroops, LatterTroops}).
to_combat_hero(PlayerShow, HeroBase) ->
	PropBase = lib_fight_prop:hero_base_to_prop_base(HeroBase),
	to_combat_hero(PlayerShow, HeroBase, PropBase).
to_combat_hero(PlayerShow, HeroBase, PropBase) ->
	to_combat_hero(PlayerShow, HeroBase, PropBase, {max,max}).
to_combat_hero(PlayerShow, HeroBase, PropBase, {FormerTroops, LatterTroops}) ->
	FormerType = case PlayerShow#player_show.is_robot of
					 true -> HeroBase#hero_base.former_type;
					 _ -> lib_hero_api:hero_front_corps(HeroBase#hero_base.id)
				 end,
	LatterType = case PlayerShow#player_show.is_robot of
					 true -> HeroBase#hero_base.latter_type;
					 _ -> lib_hero_api:hero_back_corps(HeroBase#hero_base.id)
				 end,
	Hero_title = HeroBase#hero_base.honor_title,
	Conf = tb_item:get(Hero_title#hero_title.item_id),
	TitleId =
	case Conf of
		false 	-> 0;
		_ 		-> maps:get(honor_title, Conf)
	end,
	Prop = lib_fight_prop:statistics_prop_dict(PropBase, HeroBase#hero_base.prop_dict),
	#combat_hero{
		is_robot = PlayerShow#player_show.is_robot,
		id = PlayerShow#player_show.id,
		robot_base_id = HeroBase#hero_base.robot_base_id,
		name = PlayerShow#player_show.name,
		head_id = PlayerShow#player_show.head_icon,
		hero_id = HeroBase#hero_base.id,
		prop_base = PropBase,
		awaken = HeroBase#hero_base.awaken,
		hero_level = HeroBase#hero_base.level,
		country = PlayerShow#player_show.country,
		office = PlayerShow#player_show.country_pos,	%% 官职
		hero_star = HeroBase#hero_base.star,
		hero_force = HeroBase#hero_base.force,
		hero_title = TitleId,							%% 英雄称号
		formation = HeroBase#hero_base.formation_id,	%% 阵型
		former = #combat_army{
			type = FormerType,
			level = HeroBase#hero_base.front_level,
			stage = HeroBase#hero_base.front_stage,
			attack = trunc(lib_fight_prop:panel_attack(?PROP_PREFIX_FORMER, Prop)),
			defence = trunc(lib_fight_prop:panel_defence(?PROP_PREFIX_FORMER, Prop)),
			speed = trunc(lib_fight_prop:panel_speed(?PROP_PREFIX_FORMER, Prop)),
			troops = trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_FORMER, Prop)),
			cur_troops = ?IIF(FormerTroops =:= max, trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_FORMER, Prop)), FormerTroops)
		},
		latter = #combat_army{
			type = LatterType,
			level = HeroBase#hero_base.back_level,
			stage = HeroBase#hero_base.back_stage,
			attack = trunc(lib_fight_prop:panel_attack(?PROP_PREFIX_LATTER, Prop)),
			defence = trunc(lib_fight_prop:panel_defence(?PROP_PREFIX_LATTER, Prop)),
			speed = trunc(lib_fight_prop:panel_speed(?PROP_PREFIX_LATTER, Prop)),
			troops = trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_LATTER, Prop)),
			cur_troops = ?IIF(LatterTroops =:= max, trunc(lib_fight_prop:panel_troops(?PROP_PREFIX_LATTER, Prop)), LatterTroops)
		},
		prop_dict = HeroBase#hero_base.prop_dict,
		equip_dict = HeroBase#hero_base.equip_item_dict,
		skill_list = get_skill_list(HeroBase#hero_base.skill_list)
	}.

combat_hero_to_hero_base(CombatHero) ->
	#hero_base{
		id = CombatHero#combat_hero.hero_id,
		robot_base_id = CombatHero#combat_hero.robot_base_id,
		level = CombatHero#combat_hero.hero_level,
		star = CombatHero#combat_hero.hero_star,
		awaken = CombatHero#combat_hero.awaken,
		front_level = CombatHero#combat_hero.former#combat_army.level,
		back_level = CombatHero#combat_hero.latter#combat_army.level,
		front_stage = CombatHero#combat_hero.former#combat_army.stage,
		back_stage = CombatHero#combat_hero.latter#combat_army.stage,
		force = CombatHero#combat_hero.hero_force,
		equip_item_dict = CombatHero#combat_hero.equip_dict,
		skill_list = CombatHero#combat_hero.skill_list,
		prop_dict = CombatHero#combat_hero.prop_dict,
		honor_title = CombatHero#combat_hero.honor_title
	}.

robot_id_to_fighters(RobotId) ->
	RobotShow = lib_robot_api:robot_player_show(RobotId),
	MonsterList = lib_robot_api:robot_monster_list(RobotId),
	lists:foldl(fun(Monster, Acc) ->
		[to_combat_hero(RobotShow, Monster) | Acc]
	end, [], MonsterList).

get_skill_list(SkillList) ->
	get_skill_list(SkillList, dict:new()).
get_skill_list([], Dict) ->
	dict:fold(fun(_Key, {SkillId, _Lvl}, Acc) ->
		[SkillId | Acc]
	end, [], Dict);
get_skill_list([SkillId | SkillList], Dict) ->
	Conf = tb_skill:get(SkillId),
	case Conf of
		false -> get_skill_list(SkillList, Dict);
		_ ->
			#{group := Group, level := SkillLvl} = Conf,
			case dict:is_key(Group, Dict) of
				true ->
					{_Skill, Lvl} = dict:fetch(Group, Dict),
					case SkillLvl > Lvl of
						true ->
							get_skill_list(SkillList, dict:store(Group, {SkillId, SkillLvl}, Dict));
						false ->
							get_skill_list(SkillList, Dict)
					end;
				_ ->
					get_skill_list(SkillList, dict:store(Group, {SkillId, SkillLvl}, Dict))
			end
	end.

result_msg_add_reward(Msg, RewardList) ->
	Proto = lib_item_api:conf_item_list_to_proto_obj_list(RewardList),
	Msg#'Proto80102007'{reward =  Proto}.

rend() ->
	rend.