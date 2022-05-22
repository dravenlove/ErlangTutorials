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

-ifndef('fight_HRL').
-define('fight_HRL', true).

-define(FIGHTER_TYPE_L, 1).    %% 左边
-define(FIGHTER_TYPE_R, 2).    %% 右边
-define(FIGHTER_TYPE_C, 3).    %% 平局

-define(FIGHT_TYPE_1, 1).    %% 1-战胜方回到队伍后方
-define(FIGHT_TYPE_2, 2).    %% 2-顺序一对一，对比胜场

-define(FIGHT_RANK_INIT, 9999999999).    %% 随机初始化范围。
-define(FIGHT_MAX_ROUND, 100).    %% 最大回合

-define(EFFECT_TIPS, 1).	%% 技能飘字等表现
-define(EFFECT_NO_TIPS, 0).	%% 技能飘字等不表现

-define(FIGHT_FINISH(P, Win), case (P) of true -> throw({finish, Win});_ -> skip end).
-define(NEXT_FIGHT(P), case (P) of true -> throw(next_fight);_ -> skip end).
-define(NEXT_ROUND(P), case (P) of true -> throw(next_round);_ -> skip end).
-define(NEXT_SKILL(P), case (P) of true -> throw(skip_skill);_ -> skip end).

-define(OTHER(Object), case Object of ?FIGHTER_TYPE_L -> ?FIGHTER_TYPE_R; ?FIGHTER_TYPE_R -> ?FIGHTER_TYPE_L end).
-define(OTHER_ARMY(Prefix), case Prefix of qianjun -> houjun; houjun -> qianjun end).
-define(OTHER_PREFIX_LIST(PrefixS), lists:foldl(fun(Prefix, Acc) -> [?OTHER_ARMY(Prefix) | Acc] end, [], PrefixS)).

-define(LISTS_FOLD(F, Acc, List),
	lists:foldl(fun(Value, TmpFunAcc) ->
		try
			F(Value, TmpFunAcc)
		catch
			_:_ -> TmpFunAcc
		end
	end, Acc, List)
).

-define(FIGHT_ROUND0, 0).    %% 未开始
-define(FIGHT_ROUND1, 1).    %% 战斗预备阶段
-define(FIGHT_ROUND2, 2).    %% 战斗开始时
-define(FIGHT_ROUND3, 3).    %% 远战回合
-define(FIGHT_ROUND4, 4).    %% 近战回合

-define(FIGHT_ATTACK_TYPE1, 1).	%% 闪避
-define(FIGHT_ATTACK_TYPE2, 2).	%% 格挡
-define(FIGHT_ATTACK_TYPE3, 3).	%% 暴击
-define(FIGHT_ATTACK_TYPE4, 4).	%% 普攻
-define(FIGHT_ATTACK_TYPE5, 5).	%% 技能免疫

-define(FIGHT_SKILL_TARGET0, 0).	%% 主效果目标
-define(FIGHT_SKILL_TARGET1, 1).	%% 敌方主将
-define(FIGHT_SKILL_TARGET2, 2).	%% 敌方前军
-define(FIGHT_SKILL_TARGET3, 3).	%% 敌方后军
-define(FIGHT_SKILL_TARGET4, 4).	%% 敌方前军或后军：等概率随机一个
-define(FIGHT_SKILL_TARGET5, 5).	%% 敌方前后军全体
-define(FIGHT_SKILL_TARGET6, 6).	%% 主效果目标另一方
-define(FIGHT_SKILL_TARGET7, 7).	%% 触发被动技能前的主动技能目标（适合我方造成伤害后触发被动技能加buff之类的效果）

%% 延后推前
-define(SKILL_GROUP0, 0).	%% 延后释放
-define(SKILL_GROUP1, 1).	%% 正常释放
-define(SKILL_GROUP2, 2).	%% 推前释放
-define(SKILL_GROUPS, [?SKILL_GROUP0,?SKILL_GROUP1,?SKILL_GROUP2]).
%% 优先级
-define(SKILL_PRIORITY0, 0).
-define(SKILL_PRIORITY1, 1).
-define(SKILL_PRIORITY2, 2).
-define(SKILL_PRIORITY3, 3).
-define(SKILL_PRIORITY_LIST, [?SKILL_SORT_TYPE0,?SKILL_SORT_TYPE1,?SKILL_SORT_TYPE2,?SKILL_PRIORITY3]).
%% 排序方式
-define(SKILL_SORT_TYPE0, 0).	%% 神将战力类
-define(SKILL_SORT_TYPE1, 1).	%% 战力类
-define(SKILL_SORT_TYPE2, 2).	%% 速度类
-define(SKILL_SORT_TYPES, [?SKILL_SORT_TYPE0,?SKILL_SORT_TYPE1,?SKILL_SORT_TYPE2]).


-define(SKILL_TYPE0, 0).	%% 普攻
-define(SKILL_TYPE1, 1).	%% 合击技
-define(SKILL_TYPE2, 2).	%% 套装技
-define(SKILL_TYPE3, 3).	%% 英雄技
-define(SKILL_TYPE4, 4).	%% 兵种技
-define(SKILL_TYPE5, 5).	%% 连携属性
-define(SKILL_TYPE6, 6).	%% 被动属性
-define(SKILL_TYPE7, 7).	%% 常态辅助
-define(SKILL_TYPE8, 8).	%% 内政

-define(SKILL_ACTIVE, 1).	%% 主动
-define(SKILL_PASSIVE, 2).	%% 被动

%%发动需要联合的前军或后军
-define(SKILL_ARMY_LIMIT0, 0).	%% 无
-define(SKILL_ARMY_LIMIT1, 1).	%% 需要联合前军
-define(SKILL_ARMY_LIMIT2, 2).	%% 需要联合后军

%%发动需要其他英雄条件类型
-define(SKILL_HERO_LIMIT0, 0).	%% 无
-define(SKILL_HERO_LIMIT1, 1).	%% 任意英雄
-define(SKILL_HERO_LIMIT2, 2).	%% 指定英雄
-define(SKILL_HERO_LIMIT3, 3).	%% 任意指定类型英雄
-define(SKILL_HERO_LIMIT4, 4).	%% 任意指定性别英雄
-define(SKILL_HERO_LIMIT5, 5).	%% 任意指定品质英雄
-define(SKILL_HERO_LIMIT6, 6).	%% 任意指定颜色英雄
-define(SKILL_HERO_LIMIT7, 7).	%% 诸葛亮专用

%%发动需要额外条件类型
-define(SKILL_EXTRA_LIMIT1, 1).	%% 兵力不足n%，只能发动m次


-define(CLIENT_EFFECT_TYPE1, 1).    %% 技能效果
-define(CLIENT_EFFECT_TYPE2, 2).    %% buff效果
-define(CLIENT_EFFECT_TYPE3, 3).    %% 删除buff

-record(fight_result, {
	combat_id = 0,          %% 战斗队列唯一id
	win_type = 0,           %% 胜利类型 FIGHTER_TYPE_L  FIGHTER_TYPE_R
	interval = 0,           %% 统计出来的间隔
	l_wastage = undefined, 	%% 战损信息 #fight_wastage{} or false
	r_wastage = undefined, 	%% 战损信息 #fight_wastage{} or false
	rend
}).

-record(fight_wastage, {
	fighter = undefined,	%% #combat_hero{} (combat_queue.hrl)
	kills = 0,              %% 战斗过程杀敌数
	front_loss = 0,         %% 战斗过程损失的前军兵力
	back_loss = 0,          %% 战斗过程损失的后军兵力
	is_win = false,			%% 是否胜利
	start_front = 0,		%% 开始时前军兵力
	start_back = 0,			%% 开始时后军兵力
	over_front = 0,			%% 结束时前军兵力
	over_back = 0,			%% 结束时后军兵力
	rend
}).

-record(fight_data, {
	type = 1,					%% 通知客户端效果类型
	effect_type = 0,			%% 效果类型
	object = 0,					%% 释放者
	prefix = undefined,			%% 释放者前缀
	passive_flag = true,		%%
	target_object = 0,			%% 目标
	target_prefix = [],			%% 目标前缀
	target_passive_flag = true,	%%
	skill_id = 0,				%% 技能id
	flag = 1,					%% 为1时需要处理技能飘字动画等
	attack_type = 0,			%% 攻击类型
	value = 0,					%% 效果值
	add_value = 0,				%% 固定附加效果值
	extra_value = 0,			%% 额外效果值
	value_list = [],			%%
	attack_type_list = [],		%%
	condition = 0,				%% 比拼类型
	condition_str = "",			%% 基础属性名（XL）
	condition_value = 0,		%% 基础属性值（XL）
	related = false,			%% 有附加效果为true
	ignore_defence = 0,			%% 无视防御
	is_be_invalid = false,		%% 是否被无效
	rend
}).





-record(fight_skill, {
	skill_id = 0,		%% 技能id
	skill_level = 0		%% 技能等级
}).

-endif.