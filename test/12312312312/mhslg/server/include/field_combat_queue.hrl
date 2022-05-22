%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 9月 2021 15:37
%%%-------------------------------------------------------------------

-include("common.hrl").
-ifndef('field_combat_queue_HRL').
-define('field_combat_queue_HRL', true).

-define(MONSTER_UNIT, 999).		%% 中立阵营

-define(TRIGGER_TYPE_1001, 1001).	%% 主动技能释放
-define(TRIGGER_TYPE_1002, 1002).	%%
-define(TRIGGER_TYPE_1003, 1003).	%%
-define(TRIGGER_TYPE_1004, 1004).	%%


-record(field_combat_hero, {
	unit_id = 0,				%% 单位id
	id = 0,                     %% 玩家id
	is_robot = false,
	robot_base_id = 0,			%% 机器人模型id（怪物随机模型）
	name = "",                  %% 玩家名字
	server_flag = "",			%% 服务器标识
	head_id = 0,                %% 玩家头像
	hero_id = 0,                %% 英雄id
	prop_base = undefined,		%% 英雄提取属性结构#prop_base{}
	awaken = false,				%% 是否是神将
	win_times = 0,              %% 胜场数
	hero_level = 0,             %% 英雄等级
	country = 0,                %% 国家
	office = 0,                 %% 官职
	hero_star = 0,              %% 英雄星数
	hero_force = 0,             %% 英雄战力
	hero_title = 0,             %% 英雄称号
	formation = 0,              %% 阵型
	former = undefined,         %% 前军
	latter = undefined,         %% 后军
	prop_dict = dict:new(),     %% 实际属性
	skill_list = [],            %% 技能列表
	equip_dict = dict:new(),    %% 装备信息
	honor_title = #hero_title{},%% 称号信息

	active_attack_times = 0,	%% 主动攻击次数
	attack_times = 0,			%% 攻击次数

	fight_tick = 0,

	fight_prop1 = dict:new(),   %% 战斗结束清空（用于记录整场战斗都生效的的属性）
	fight_prop2 = dict:new(),   %% 主动技能结束清空（用于记录一个主动技能释放期间生效的属性
	fight_prop3 = maps:new(),	%% 存放时效性的属性 MAP key => end_tick value => 属性 dict

	distance_map = maps:new(),	%% 存放与周围其他单位的距离 MAP Key => Unit_id ,Value => 距离

	rend
}).


-record(skill_trigger,{
	type = 0,
	value1 = 0,
	value2 = 0,
	value3 = 0
}).

-record(field_fight_data,{
	type = 1,					%% 通知客户端效果类型
	trigger = #skill_trigger{},
	skill_id = 0,				%% 技能id
	effect_type = 0,			%% 效果类型
	unit_id = 0,				%% 释放单位
	prefix = undefined,			%% 释放者前缀
	passive_flag = true,		%%
	target_unit_id = 0,			%% 目标单位
	target_prefix = [],			%% 受击对象前缀类型
	target_passive_flag = true,	%%
	attack_type = 0,			%% 攻击类型
	value = 0,					%% 效果值
	add_value = 0,				%% 固定附加效果值
	extra_value = 0,			%% 额外效果值
	value_list = [],			%%
	attack_type_list = [],		%%
	related = false,			%% 有附加效果为true
	ignore_defence = 0,			%% 无视防御
	is_be_invalid = false,		%% 是否被无效
	rend
}).


%%-record(time_prop,{
%%	end_tick = 0,
%%	prop = dict:new()
%%}).
%%
%%-record(time_buff,{
%%	end_tick = 0,
%%	buff_id = 0
%%}).

-endif.