%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: fight_effect
%%% Created on : 2020/8/15 0015 10:51
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('fight_effect_HRL').
-define('fight_effect_HRL', true).

-define(ACTIVE_EFFECT_TIME1,    1).  %% 主动技能额外效果攻击前触发
-define(ACTIVE_EFFECT_TIME2,    2).  %% 主动技能额外效果攻击后触发

-define(EFFECT_UNDEFINED,            _).  %% 无定义

-define(EFFECT_COMMON_HURT,                 1001).  %% 普通伤害
-define(EFFECT_COPY_HURT,                   1002).  %% 复制伤害
-define(EFFECT_PERCENT_HURT,                1003).  %% 百分比减少兵力
-define(EFFECT_PERCENT_RETURN,              1004).  %% 百分比恢复兵力
-define(EFFECT_IGNORE_DEFENCE,              1005).  %% 无视防御
-define(EFFECT_ENHANCE_HURT,                1006).  %% 技能强度增幅 （基础伤害中计算）
-define(EFFECT_IMMUNE_SKILL_HURT,           1007).  %% 技能免伤
-define(EFFECT_INSERT_BUFF,                 1008).  %% 附加状态buff
-define(EFFECT_REMOVE_BUFF,                 1009).  %% 移除状态
-define(EFFECT_TMP_PROP,                    1010).  %% 临时属性
-define(EFFECT_CERTAINLY_CRIT,              1011).  %% 必定暴击
-define(EFFECT_ATTACK_BACK,                 1012).  %% 反击
-define(EFFECT_IGNORE_PASSIVE,              1013).  %% 忽略敌方被动技能
-define(EFFECT_IMMUNE_HURT,                 1014).  %% 伤害减免
-define(EFFECT_SKILL_REACTIVE,              1015).  %% 主动技能再次触发
-define(EFFECT_SKILL_A_BUFF_RATE,           1016).  %% 受到不良buff概率
-define(EFFECT_SKILL_D_BUFF_RATE,           1017).  %% 敌方受到不良buff概率(自己的技能影响敌方,被动)
-define(EFFECT_IGNORE_DEFENCE_HURT,         1018).  %% 无视防御伤害
-define(EFFECT_SPECIAL_IMMUNE_HURT,         1019).  %% 特殊伤害减免 单次承受的伤害超出其最大兵力的x%，超出部分将被减免y%
-define(EFFECT_ADD_FIGHT_PROP,              1020).  %% 增加属性（作用于整场战斗）（每次激活此效果都增加属性 fight_prop1）（多次激活多次叠加）
-define(EFFECT_ADD_ROUND_FIGHT_PROP,        1021).  %% 增加属性（作用于整个回合）（每次激活此效果都增加属性 fight_prop2）（多次激活多次叠加）
-define(EFFECT_GROUP_SKILL_ADD_HURT,        1022).  %% 增加某组技能伤害（每次激活此效果都记录在进程group_skill_hurt，多次激活多次叠加）
-define(EFFECT_SKILL_ACTIVE_AGAIN,          1023).  %% 特定类型技能多次触发
-define(EFFECT_SKILL_ACTIVE_ROUND,          1024).  %% 特定技能额外触发回合
-define(EFFECT_SKILL_ADD_HURT_TIMES,        1025).  %% 特定技能增加攻击次数
-define(EFFECT_SKILL_CHANGE_ACTIVE_ROUND,   1026).  %% 特定技能改变触发回合
-define(EFFECT_SKILL_CHANGE_TARGET_OBJECT,  1027).  %% 特定技能改变攻击目标
-define(EFFECT_INCREASE_HURT,               1028).  %% 伤害增加  （跟伤害2 一起计算）
-define(EFFECT_BUFF_SHIELD_RATE,            1029).  %% 增加指定buff组的护盾量
-define(EFFECT_ITSELF_HURT,                 1030).  %% 己方每战损x兵力，便引导冤魂緾绕敌方，反噬敌军y兵力
-define(EFFECT_ITSELF_RETURN_HURT,          1031).  %% 受到任意伤害，x（percent）倍反噬，每场对决限y（times）次
-define(EFFECT_REMIT_FATAL_INJURY,          1032).  %% 豁免会导致全灭的攻击伤害
-define(EFFECT_IGNORE_TROOPS_DAMPING,       1033).  %% 无视兵力衰减
-define(EFFECT_DEFENCE_MULTI,               1034).  %% 防御效果倍率
-define(EFFECT_ATTACK_MULTI,                1035).  %% 攻击效果倍率
-define(EFFECT_INCREASE_HURT_BY_SKILL,      1036).  %% 伤害增加(每提升1级［xx］，［yy］技能伤害+a%（最多b%))
-define(EFFECT_IMMUNE_PERCENT_HURT,         1037).  %% 豁免百分比减少兵力  value 豁免百分比
-define(EFFECT_GROUP_SKILL_NO_ACTIVE,       1038).  %% 特定技能不生效
-define(EFFECT_SPECIAL_COMPETE_FOUR_D,      1039).  %% 四维比拼x胜利则所有比拼都胜利  x为0则”对方发起的“比拼默认胜利
-define(EFFECT_IGNORE_DEFENCE_ADD_VALUE,    1040).  %% 增加无视防御
-define(EFFECT_INCREASE_SKILL_HURT,         1041).  %% 特定技能增加技能伤害  （技能最后计算）
-define(EFFECT_IMMUNE_HURT_BY_SKILL,        1042).  %% 伤害减免(每提升1级［xx］，伤害减免+a%（最多b%))
-define(EFFECT_ADD_ACTIVE_SKILL_FIGHT_PROP, 1043).  %% 增加属性（作用于单个主动技能释放期间）（每次激活此效果都增加属性 fight_prop3）（多次激活多次叠加）
-define(EFFECT_FIXED_DAMAGE, 				1044).  %% 造成固定伤害，只能被基础兵种初始防御所抵挡（basedefence*（1+ basedefencerate））
-define(EFFECT_SKILL_NULLIFY, 				1045).  %% 使对方技能无效
-define(EFFECT_SKILL_RAND_ADD, 				1046).  %% 指定技能发动概率增加
-define(EFFECT_INCREASE_HURT_BY_BUFF,       1047).  %% 伤害增加,对方每有一个不良状态伤害增加 percent 最高为 max_percent
-define(EFFECT_SKILL_ADD_EFFECT,	   	    1048).  %% 技能增加Conf
-define(EFFECT_SKILL_CHANGE_EFFECT,	   	    1049).  %% 技能更改Conf
-define(EFFECT_SKILL_NO_LAUNCH,		   	    1050).  %% 特定技能禁止释放
-define(EFFECT_IGNORE_BUFF,		   	   		1051).  %% 免疫特定buff
-define(EFFECT_SKILL_ADD_OR_CUR_ROUND,		1052).  %% 特定技能提前或延迟释放回合
-define(EFFECT_ADD_AVOID_HURT_TIME,			1053).  %% 增加免疫伤害次数
-define(EFFECT_CHANGE_BUFF_ID,				1054).  %% 把XX buff 更改为 YY buff
-define(EFFECT_PERCENT_RETURN_ADD,			1055).  %% 增加百分比恢复兵力
-define(EFFECT_ADD_FIGHT_PROP_BY_FOUR_D,    1056).  %% 增加属性（作用于整场战斗）对比四维 xx ,每提升一点增加 yy% 最高 zz%
-define(EFFECT_COIN_TOSSING,				1057).  %% 问卦 随机判定发动效果A 或 B
-define(EFFECT_SKILL_BUFF_TYPE_RATE,		1058).  %% 增加受到特定类型buff几率 配正负
-define(EFFECT_ITSELF_RETURN_HURT_DERATE,	1059).  %% 反噬伤害减免 （1031）
-define(EFFECT_DEFENSE_HURT,				1060).  %% 以己方主将的前后军防御总和作为攻击，对敌方全体造成大量伤害
-define(EFFECT_A_SHIELD_WEAKEN,				1061).  %% 敌方护盾削弱
-define(EFFECT_D_SHIELD_WEAKEN,				1062).  %% 我方护盾削弱

%% 技能特殊效果属性，生效后存入prop_dict
-define(EFFECT_PROP_IMMUNE_HURT, effect_prop_immune_hurt). %% 伤害减免


%% 条件类型
-define(EFFECT_CONDITION_0,     0).  %% 无条件
-define(EFFECT_CONDITION_1,     1).  %% 四维比拼
-define(EFFECT_CONDITION_2,     2).  %% 战力比拼
-define(EFFECT_CONDITION_3,     3).  %% 四维比拼
-define(EFFECT_CONDITION_4,     4).  %% 战力比拼（低于对手）
-define(EFFECT_CONDITION_5,     5).  %% 四维比拼且对手为x性target别
-define(EFFECT_CONDITION_6,     6).  %% 四维总数比拼
-define(EFFECT_CONDITION_7,     7).  %% 兵力不足x%并且只能触发y次
-define(EFFECT_CONDITION_8,     8).  %% 对战玩家时
-define(EFFECT_CONDITION_9,     9).  %% 四维比拼 (x或y高于对手)
-define(EFFECT_CONDITION_10,   10).  %% 剩余兵力大于
-define(EFFECT_CONDITION_11,   11).  %% 剩余兵力小于
-define(EFFECT_CONDITION_12,   12).  %% 战力不小于
-define(EFFECT_CONDITION_13,   13).  %% 每回合发动次数
-define(EFFECT_CONDITION_14,   14).  %% 四维（condition_type1）大于condition_type2
-define(EFFECT_CONDITION_15,   15).  %% xx技能达到yy级
-define(EFFECT_CONDITION_16,   16).  %% 四维比拼且剩余兵力大于
-define(EFFECT_CONDITION_17,   17).  %% 技能等级比拼
-define(EFFECT_CONDITION_18,   18).  %% 连胜场数判断 condition_type1 = 条件数量
-define(EFFECT_CONDITION_19,   19).  %% 比较双方英雄性别 condition_type1 = 0 相同 1 不同
-define(EFFECT_CONDITION_20,   20).  %% 判断当前战斗模式 以及属于攻放还是守方
-define(EFFECT_CONDITION_21,   21).  %% 判断当前英雄品质 condition_type1 = 品质类型
-define(EFFECT_CONDITION_22,   22).	 %% 判定对手兵力剩余百分比

%% 被动技能触发时机
-define(PASSIVE_SKILL_TRIGGER_TIME_1,   1).  %% 造成伤害时
-define(PASSIVE_SKILL_TRIGGER_TIME_2,   2).  %% 回合开始时
-define(PASSIVE_SKILL_TRIGGER_TIME_3,   3).  %% 回合结束时
-define(PASSIVE_SKILL_TRIGGER_TIME_4,   4).  %% 主动技能释放时
-define(PASSIVE_SKILL_TRIGGER_TIME_5,   5).  %% 主动技能释放后
-define(PASSIVE_SKILL_TRIGGER_TIME_6,   6).  %% 战斗开始时
-define(PASSIVE_SKILL_TRIGGER_TIME_7,   7).  %% 战败时
-define(PASSIVE_SKILL_TRIGGER_TIME_8,   8).  %% 胜利时
-define(PASSIVE_SKILL_TRIGGER_TIME_9,   9).  %% 造成伤害时(特定效果伤害)

%% 被动技能触发条件
-define(PASSIVE_SKILL_TRIGGER_0,     0).  %% 无
-define(PASSIVE_SKILL_TRIGGER_1,     1).  %% 我方xx攻击敌方yy时    （0-技能拥有者 1-前军 2-后军 3-英雄 4-任意）
-define(PASSIVE_SKILL_TRIGGER_2,     2).  %% 我方xx遭受敌方yy攻击时 （0-技能拥有者 1-前军 2-后军 3-英雄 4-前军或后军 5-任意）
-define(PASSIVE_SKILL_TRIGGER_3,     3).  %% 技能拥有者攻击首个目标时
-define(PASSIVE_SKILL_TRIGGER_4,     4).  %% 技能拥有者首次主动攻击时
-define(PASSIVE_SKILL_TRIGGER_5,     5).  %% 每个回合双方攻击完后
-define(PASSIVE_SKILL_TRIGGER_6,     6).  %% 我方xx发动yy类型技能时    （0-技能拥有者 1-前军 2-后军 3-英雄 4-任意）
-define(PASSIVE_SKILL_TRIGGER_7,     7).  %% 我方xx遭受敌方yy类型技能时 （0-技能拥有者 1-前军 2-后军 3-英雄 4-前军或后军 5-任意）
-define(PASSIVE_SKILL_TRIGGER_8,     8).  %% 被xx类型英雄击败时 （1-智慧 2-勇猛 3-均衡）
-define(PASSIVE_SKILL_TRIGGER_9,     9).  %% 每个回合双方攻击前
-define(PASSIVE_SKILL_TRIGGER_10,   10).  %% 战斗开始时
-define(PASSIVE_SKILL_TRIGGER_11,   11).  %% 战斗胜利
-define(PASSIVE_SKILL_TRIGGER_12,   12).  %% 每受到n次伤害
-define(PASSIVE_SKILL_TRIGGER_13,   13).  %% 受到伤害时
-define(PASSIVE_SKILL_TRIGGER_14,   14).  %% 释放主动技能时
-define(PASSIVE_SKILL_TRIGGER_15,   15).  %% 敌方释放主动技能时
-define(PASSIVE_SKILL_TRIGGER_16,   16).  %% 释放xx技能时
-define(PASSIVE_SKILL_TRIGGER_17,   17).  %% 敌方释放xx技能时
-define(PASSIVE_SKILL_TRIGGER_18,   18).  %% 我方（X兵种类型），遭受敌方（Y对象）攻击时
-define(PASSIVE_SKILL_TRIGGER_19,   19).  %% 我方（X兵种类型），攻击敌方(Y兵种类型)时
-define(PASSIVE_SKILL_TRIGGER_20,   20).  %% 从XX回合开始 每Y回合释放一次技能

%% 被动技能效果额外条件  参数字段 passive_condition_value1为X,passive_condition_value2为Y
-define(PASSIVE_CONDITION_0,    0).  %% 无
-define(PASSIVE_CONDITION_1,    1).  %% 我方（X对象），敌方（Y对象）          （0-无要求 1-前军 2-后军）
-define(PASSIVE_CONDITION_2,    2).  %% 我方（X兵种类型），敌方（Y兵种类型）    （0-无要求 1-步兵,2-骑兵,3-弓兵,4-方士）
-define(PASSIVE_CONDITION_3,    3).  %% 攻击首个目标
-define(PASSIVE_CONDITION_4,    4).  %% 受到X类型主动技能攻击	(0-普攻,1-合击技,2-套装技,3-英雄技,4-兵种技)
-define(PASSIVE_CONDITION_5,    5).  %% 同时上阵X型英雄
-define(PASSIVE_CONDITION_6,    6).  %% 对战X型英雄
-define(PASSIVE_CONDITION_7,    7).  %% 对战X性别英雄
-define(PASSIVE_CONDITION_8,    8).  %% 我方（X兵种类型），敌方（Y对象）
-define(PASSIVE_CONDITION_9,    9).  %% 我方（X兵种类型），受到敌方（Y类型主动技能攻击）
-define(PASSIVE_CONDITION_10,   10). %% 我方（X对象），受到敌方（Y类型主动技能攻击）
-define(PASSIVE_CONDITION_11,   11). %% 同时上阵英雄 passive_condition = 英雄列表

-endif.

