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

-ifndef('fight_buff_HRL').
-define('fight_buff_HRL', true).

-define(FIGHT_BUFF_AD_TYPE0, 0).  %% 所有BUFF
-define(FIGHT_BUFF_AD_TYPE1, 1).  %% 增益BUFF
-define(FIGHT_BUFF_AD_TYPE2, 2).  %% 减益BUFF

-define(FIGHT_BUFF_TYPE_1001, 1001).  %% 内讧(前后军会自相残害，英雄无法释放需要该部队的英雄技)
-define(FIGHT_BUFF_TYPE_1002, 1002).  %% 虚弱(攻击和防御-20%)
-define(FIGHT_BUFF_TYPE_1003, 1003).  %% 迟缓(速度-30)
-define(FIGHT_BUFF_TYPE_1004, 1004).  %% 混乱(部队无法行动，英雄无法释放需要该部队的英雄技)
-define(FIGHT_BUFF_TYPE_1005, 1005).  %% 火灾(受到持续燃烧，每回合损失10%当前兵力)
-define(FIGHT_BUFF_TYPE_1006, 1006).  %% 死斗(所有伤害和免伤+31%，暴击率+25%)
-define(FIGHT_BUFF_TYPE_1007, 1007).  %% 溃逃(每回合损失5%的最大兵力)
-define(FIGHT_BUFF_TYPE_1008, 1008).  %% 迷幻(攻防-5%，且受到任意不良状态的几率提升50%)
-define(FIGHT_BUFF_TYPE_1009, 1009).  %% 护盾
-define(FIGHT_BUFF_TYPE_1010, 1010).  %% 护盾(不能抵挡百分比伤害)
-define(FIGHT_BUFF_TYPE_1011, 1011).  %% 伤害减少百分比
-define(FIGHT_BUFF_TYPE_1012, 1012).  %% 伤害增加百分比
-define(FIGHT_BUFF_TYPE_1013, 1013).  %% 斩杀
-define(FIGHT_BUFF_TYPE_1014, 1014).  %% 护盾(拥有护盾期间增加属性)
-define(FIGHT_BUFF_TYPE_1015, 1015).  %% 兵力衰减反向增加  最多20%
-define(FIGHT_BUFF_TYPE_2001, 2001).  %% 通用当前回合属性buff value_str：属性字段名 value_a：属性值
-define(FIGHT_BUFF_TYPE_2002, 2002).  %% 通用整场战斗属性buff value_str：属性字段名 value_a：属性值


-record(fight_buff, {
    id = 0,             %% BUFF ID
    group = 0,          %% BUFF组id
    object = 0,         %% 所属对象
    prefix = n,         %% 所属前缀
    overdue = {0,0},    %% 过期回合
    overlay = 0,		%% buff已叠加次数
    type = 0,           %% buff效果类型
    source_object = 0,  %% buff来源对象
    source_prefix = n,  %% buff来源前缀
    source_id = 0,      %% buff来源skill id
    value_a = 0,        %% buff记录值a
    value_b = 0,        %% buff记录值b
    rend
}).


-endif.