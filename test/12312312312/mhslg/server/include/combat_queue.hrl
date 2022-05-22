%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: fight
%%% Created on : 2020/8/15 0015 10:51
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-include("common.hrl").
-ifndef('combat_queue_HRL').
-define('combat_queue_HRL', true).

%% 调用战斗类型
-define(CALL_FIGHT_TYPE_TEST, 			1).    		%% 测试调试
-define(CALL_FIGHT_TYPE_COUNTRY,		1001).    	%% 国战
-define(CALL_FIGHT_TYPE_CHAPTER,		1002).    	%% 沙盘演绎
-define(CALL_FIGHT_TYPE_BOUNTY,			1003).		%% 赏金任务
-define(CALL_FIGHT_TYPE_DUNGEONED,		1004).		%% 魔塔
-define(CALL_FIGHT_TYPE_PUPPET,			1005).		%% 混沌傀儡
-define(CALL_FIGHT_TYPE_ALIEN_INVASION,	1006).		%% 异族入侵
-define(CALL_FIGHT_TYPE_INDUSTRY,		1008).		%% 产业占领
-define(CALL_FIGHT_TYPE_ARENA,			1009).      %% 巅峰竞技
-define(CALL_FIGHT_HONOUR_TOP,			1010).		%% 荣耀之巅
-define(CALL_FIGHT_TYPE_DRAGON_PALACE,	1011).      %% 龙殿探险
-define(CALL_FIGHT_TYPE_ALIEN,			1012).      %% 异族征伐
-define(CALL_FIGHT_TYPE_CHALLENGE,		1015).      %% 王座之争
-define(CALL_FIGHT_TYPE_GOVERNMENT_TASK,1016).		%% 政务任务

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 调用开始战斗队列参数的结构
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(DRUMS_LIMIT_SIZE, 5).   %% 敲鼓队伍数量最低要求
-define(FIGHT_TYPE1, 1).        %% 战胜方回到队伍后方，直至一方死完
-define(FIGHT_TYPE2, 2).        %% 顺序一对一，对比胜场
-define(INTERVAL_TYPE0, 0).     %% 无时间间隔，一次性打完
-define(INTERVAL_TYPE1, 1).     %% 固定时间间隔interval
-define(INTERVAL_TYPE2, 2).     %% 战斗中统计技能配置
-define(INTERVAL_TYPE3, 3).     %% 固定时间间隔interval + 战斗中统计技能配置
-record(req_combat_queue, {
	type = 0,                           %% 调用者自身类型，例如 沙盘，国战等
	interval_type = ?INTERVAL_TYPE1,    %% 间隔类型 0-无时间间隔，一次性打完 1-固定时间间隔interval 2-战斗中统计技能配置 3-interval+战斗中统计技能配置
	fight_type = ?FIGHT_TYPE1,          %% 战斗类型 1-战胜方回到队伍后方  2-顺序一对一，对比胜场
	params = undefined,                 %% 调用者自定义参数，每次回调时附上
	count_down = 0,                     %% 倒计时，请求开始新队列后多久开始战斗。
	interval = 0,                       %% 每场对决的时间间隔
	l_country = 0,                      %% 国家
	l_fighters = [],                    %% #combat_hero{}s
	l_buff_list = [],					%% 附加buff列表
	r_country = 0,                      %% 国家
	r_fighters = [],                    %% #combat_hero{}s
	r_buff_list = [],					%% 附加buff列表
	drums_limit = ?DRUMS_LIMIT_SIZE,    %% 敲鼓队伍数量要求
	save_record = false,
	have_drop = false,					%% 是否有怪物掉落
	rend
}).
-record(combat_hero, {
	index = 0,                  %% 排位
	is_robot = false,			%%
	robot_base_id = 0,			%% 机器人模型id（怪物随机模型）
	id = 0,                     %% 玩家id
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
	fight_prop1 = dict:new(),   %% 战斗结束清空（用于记录整场战斗都生效的的属性）
	fight_prop2 = dict:new(),   %% 回合结束清空（用于记录一个回合内生效的属性）
	fight_prop3 = dict:new(),   %% 主动技能结束清空（用于记录一个主动技能释放期间生效的属性）

	hero_win_time = 0,			%% 连胜场数

	skill_flag = 1,				%% 主动技能技能首个效果飘字

	rend
}).

-record(combat_army, {
	type = 0,       %% 类型
	level = 0,      %% 阶级
	stage = 0,		%% 等阶
	attack = 0,     %% 攻击
	defence = 0,    %% 防御
	speed = 0,      %% 速度
	troops = 0,     %% 兵力
	cur_troops = 0, %% 兵力
	active_attack_times = 0,	%% 主动攻击次数
	attack_times = 0,			%% 被动攻击次数
	rend
}).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 战斗队列回调信息（异步）
%% 根据#req_combat_queue.fight_type会有不同的响应事件：
%%    FIGHT_TYPE1：响应事件包括（战斗开始，战斗过程，战斗结束，队伍加入战斗队列，队伍退出战斗队列）。
%%    FIGHT_TYPE2：响应事件COMBAT_QUEUE_CALLBACK_TYPE0，一次性返回完整战斗数据
%% lib_combat_queue_api 提供部分回调数据dataToProto接口
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-define(COMBAT_QUEUE_CALLBACK_TYPE0, 0).    %% 一次性打完时返回完整战斗数据。
-define(COMBAT_QUEUE_CALLBACK_TYPE1, 1).    %% 战斗开始
-define(COMBAT_QUEUE_CALLBACK_TYPE2, 2).    %% 战斗过程（每打完一场调用一次）
-define(COMBAT_QUEUE_CALLBACK_TYPE3, 3).    %% 战斗结束
-define(COMBAT_QUEUE_CALLBACK_TYPE4, 4).    %% 队伍加入战斗队列
-define(COMBAT_QUEUE_CALLBACK_TYPE5, 5).    %% 队伍退出战斗队列
-define(HANDLE_TYPE1, 1).    %% 操作队伍 l_fighters
-define(HANDLE_TYPE2, 2).    %% 操作队伍 r_fighters
-record(combat_callback, {
	combat_id = 0,              %% 战斗队列唯一id
	params = undefined,         %% 调用者自定义参数
	callback_type = 0,          %% 回调类型

	callback_data = undefined,
	%% 当回调类型是COMBAT_QUEUE_CALLBACK_TYPE1时，返回新的战场信息 #callback_data1{}
	%% 当回调类型是COMBAT_QUEUE_CALLBACK_TYPE2时，返回单场战斗信息 #callback_data2{}
	%% 当回调类型是COMBAT_QUEUE_CALLBACK_TYPE3时，返回战场结束信息 #callback_data3{}
	%% 当回调类型是COMBAT_QUEUE_CALLBACK_TYPE4时，返回战场结束信息 #callback_data4{}
	%% 当回调类型是COMBAT_QUEUE_CALLBACK_TYPE5时，返回战场结束信息 #callback_data5{}

	rend
}).

-record(callback_data0, {
	win_type = 0,
	fight_result = [],	%% [#fight_result{}] fight.hrl
	l_win_times = 0,
	r_win_times = 0,
	record_id = 0,
	drop_map = 0,
	msg = undefined,		%% Proto80102002
	result_msg = undefined	%% Proto80102007
}).
-record(callback_data1, {
	count_down = 0	%% 距战场开始倒计时
}).
-record(callback_data2, {
	drop_id = 0,
	fight_result = undefined	%% #fight_result{} fight.hrl
}).
-record(callback_data3, {
	win_type = 0,
	drop_map = maps:new()
}).
-record(callback_data4, {
	handle_type = 0,	%% 1-操作队伍 l_fighters  2-操作队伍 r_fighters
	hero = undefined
}).
-record(callback_data5, {
	handle_type = 0,	%% 1-操作队伍 l_fighters  2-操作队伍 r_fighters
	player_id = 0,
	hero_id = 0
}).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 战斗队列进程信息
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(combat_queue, {
	queue_dict = dict:new() %% key:CombatId value:combat_queue_detail
}).
-record(combat_queue_detail, {
	combat_id = 0,                      %% 战斗队列唯一id
	is_stop = false,					%%
	type = 0,                           %% 调用者自身类型，例如 沙盘，国战等
	interval_type = ?INTERVAL_TYPE1,    %% 间隔类型 1-固定时间间隔interval 2-战斗中统计技能配置 3-interval+战斗中统计技能配置
	fight_type = ?FIGHT_TYPE1,          %% 战斗类型 1-战胜方回到队伍后方  2-顺序一对一，对比胜场
	combat_state = 0,                   %% 队列状态 0-未开始战斗 1-战斗中，未返回结果 2-接受到战斗结果
	handle_tick = 0,                    %% 下次运行时间戳
	interval = 0,                       %% 每场对决的时间间隔
	combat_times = 0,                   %% 战场已进行场数
	combat_rank = [],                   %% 战场排行
	l_last_role = 0,
	l_win_times = 0,
	l_highest = undefined,              %% 信息
	l_player_dict = dict:new(),         %% 玩家信息
	l_fighters = [],                    %% 战斗英雄队列
	l_country = 0,                      %% 国家
	l_buff_list = [],					%% 附加buff列表
	r_last_role = 0,
	r_win_times = 0,
	r_highest = undefined,              %% 信息
	r_player_dict = dict:new(),         %% 玩家信息
	r_fighters = [],                    %% 战斗英雄队列
	r_country = 0,                      %% 国家
	r_buff_list = [],					%% 附加buff列表
	drums_limit = 0,                    %% 敲鼓要求队伍数量
	drums = 0,                          %% >0-敲鼓中剩余场次 0-未敲鼓或敲鼓已结束
	msg_bin = undefined,                %% 当前战斗消息
	node = undefined,                   %% 源服节点
	combat_node = undefined,            %% 战场所在节点信息
	params = undefined,                 %% 调用者参数
	country = 0,                        %% 战场所属国家
	watching_players = [],              %% 观战玩家列表
	save_record = false,
	have_drop = false,					%% 是否有怪物掉落
	drop_id = 0,						%% 本回合掉落id
	drop_map = maps:new(),				%% 掉落信息 key-掉落id  value-掉落次数
	drop_assist_map = maps:new(),		%% 掉落辅助信息 key-掉落id  value-连续无掉落次数
	rend
}).


-record(rank_detail, {
	id = 0,             %% 玩家id
	country = 0,        %% 国家
	name = "",          %% 玩家名字
	kills = 0           %% 杀敌数
}).

-record(highest_detail, {
	id = 0,             %% 玩家id
	head_id = 0,        %% 玩家头像
	hero_id = 0,        %% 英雄id
	name = "",          %% 玩家名字
	value = 0           %% 值
}).
-record(combat_highest, {
	max_dominate = #highest_detail{},   %% 战场主宰
	max_force = #highest_detail{},      %% 最强战力
	max_office = #highest_detail{}      %% 最高官职
}).

-record(combat_player, {
	id = 0,         %% 玩家id
	name = "",		%%
	heros = [],		%% 在队列中的英雄id
	head_id = 0,    %% 玩家头像
	country = 0,    %% 国家
	kills = 0,      %% 杀敌数
	loss = 0,       %% 战损数
	office = 0      %% 官职
}).

-record(watching_player, {
	id = 0,
	sid = 0,
	country = 0
}).

-define(COMBAT_STATE0, 0).  %% 未开始战斗
-define(COMBAT_STATE1, 1).  %% 战斗中，未返回结果
-define(COMBAT_STATE2, 2).  %% 接收到战斗结果

-endif.
