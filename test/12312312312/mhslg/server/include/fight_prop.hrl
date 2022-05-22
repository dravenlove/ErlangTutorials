%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: ban
%%% Created on : 2020/9/14 0014 11:52
%%% @author glendy ganby@163.com
%%% @copyright (C) 2020, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-ifndef('fight_prop_HRL').
-define('fight_prop_HRL', true).


-record(prop_base, {
	id = 0,
	sex = 0,		%%性别
	type = 0,		%%类型
	quality = 0,	%%品质
	color = 0,		%%颜色
	front_corps = 0, %%前军兵种
	back_corps = 0,	%%后军兵种
	skill_list = []
}).

%%基本属性前缀
-define(PROP_PREFIX_HERO, hero).          %% 英雄对象
-define(PROP_PREFIX_FORMER, qianjun).     %% 前军对象
-define(PROP_PREFIX_LATTER, houjun).       %% 后军对象





-define(PREFIX_LIST, [?PROP_PREFIX_HERO, ?PROP_PREFIX_FORMER, ?PROP_PREFIX_LATTER]).          %% 对象

%%策划配置用限制型属性前缀，程序会统一转成基本属性前缀
-define(PROP_PREFIX_ALL, all).          		%% 所有对象
-define(PROP_PREFIX_NAN, nan).          		%% 男性英雄
-define(PROP_PREFIX_NV, nv).            		%% 女性英雄
-define(PROP_PREFIX_WEN, wen).          		%% 智慧英雄
-define(PROP_PREFIX_WU, wu).            		%% 勇猛英雄
-define(PROP_PREFIX_QUAN, quan).        		%% 均衡英雄
-define(PROP_PREFIX_LANSE, lanse).      		%% 蓝色及以上英雄
-define(PROP_PREFIX_ZISE, zise).        		%% 紫色及以上英雄
-define(PROP_PREFIX_CHENGSE, chengse).  		%% 金色及以上英雄
-define(PROP_PREFIX_HONGSE, hongse).    		%% 红色及以上英雄
-define(PROP_PREFIX_BUBING, bubing).    		%% 步兵
-define(PROP_PREFIX_QIBING, qibing).    		%% 骑兵
-define(PROP_PREFIX_GONGBING, gongbing).		%% 弓兵
-define(PROP_PREFIX_FANGSHI, fangshi).  		%% 方士
-define(PROP_PREFIX_BINGZHONG, bingzhong).  	%% 兵种
-define(PROP_PREFIX_WEN_FORMER, wenqianjun).  	%% 智慧英雄前军
-define(PROP_PREFIX_WU_FORMER, wuqianjun).  	%% 勇猛英雄前军
-define(PROP_PREFIX_QUAN_FORMER, quanqianjun).  %% 均衡英雄前军
-define(PROP_PREFIX_WEN_LATTER, wenhoujun).  	%% 智慧英雄后军
-define(PROP_PREFIX_WU_LATTER, wuhoujun).  		%% 勇猛英雄后军
-define(PROP_PREFIX_QUAN_LATTER, quanhoujun).  	%% 均衡英雄后军
-define(PROP_PREFIX_CHUANQI_BINGZHONG, chuanqibingzhong).  %% 传奇英雄

-define(PROP_PREFIX_LIST, [?PROP_PREFIX_HERO,?PROP_PREFIX_FORMER,?PROP_PREFIX_LATTER,?PROP_PREFIX_ALL,?PROP_PREFIX_NAN,
	?PROP_PREFIX_NV,?PROP_PREFIX_WEN,?PROP_PREFIX_WU,?PROP_PREFIX_QUAN,?PROP_PREFIX_LANSE,?PROP_PREFIX_ZISE,?PROP_PREFIX_CHENGSE,
	?PROP_PREFIX_HONGSE,?PROP_PREFIX_BUBING,?PROP_PREFIX_QIBING,?PROP_PREFIX_GONGBING,?PROP_PREFIX_FANGSHI,?PROP_PREFIX_BINGZHONG,
	?PROP_PREFIX_WEN_FORMER,?PROP_PREFIX_WU_FORMER,?PROP_PREFIX_QUAN_FORMER,?PROP_PREFIX_WEN_LATTER,?PROP_PREFIX_WU_LATTER,
	?PROP_PREFIX_QUAN_LATTER,?PROP_PREFIX_CHUANQI_BINGZHONG]).

%% 基础属性名
-define(STRENGTH, strength).                            %% 力量
-define(INTELECT, intelect).                            %% 智力
-define(SPIRIT, spirit).                                %% 精神
-define(LEADERSHIP, leadership).                        %% 统率
-define(FINAL_ATTACK, final_attack).                    %% 最终攻击
-define(FINAL_DEFENCE, final_defence).                  %% 最终防御
-define(FINAL_SPEED, final_speed).                      %% 最终速度
-define(FINAL_TROOPS, final_troops).                    %% 最终兵力
-define(ATTACK, attack).                                %% 攻击
-define(DEFENCE, defence).                              %% 防御
-define(SPEED, speed).                                  %% 速度
-define(TROOPS, troops).                                %% 兵力
-define(BASE_ATTACK, base_attack).                      %% 基础攻击
-define(BASE_DEFENCE, base_defence).                    %% 基础防御
-define(BASE_SPEED, base_speed).                        %% 基础速度
-define(BASE_TROOPS, base_troops).                      %% 基础兵力
-define(HIT, hit).                                      %% 命中
-define(AVOID, avoid).                                  %% 闪避
-define(CRIT, crit).                                    %% 暴击
-define(CRIT_RED, crit_red).                            %% 免暴
-define(CRIT_MULTI, crit_multi).                        %% 暴击倍率
-define(PIERCING, piercing).                            %% 穿透
-define(PARRY, parry).                                  %% 格挡
-define(PARRY_MULTI, parry_multi).                      %% 格挡倍率
-define(HURT_INC, hurt_inc).                            %% 基础伤害
-define(MAN_HURT_INC, man_hurt_inc).                    %% 对男性伤害
-define(WOMAN_HURT_INC, woman_hurt_inc).                %% 对女性伤害
-define(HERO_SKILL_HURT_INC, hero_skill_hurt_inc).      %% 英雄技伤害
-define(TROOPS_SKILL_HURT_INC, troops_skill_hurt_inc).  %% 兵种技伤害
-define(CIVILIAN_HURT_INC, civilian_hurt_inc).          %% 对文官伤害
-define(GENERAL_HURT_INC, general_hurt_inc).            %% 对武将伤害
-define(GENERALIST_HURT_INC, generalist_hurt_inc).      %% 对全才伤害
-define(INFANTRY_HURT_INC, infantry_hurt_inc).          %% 对步兵伤害
-define(CAVALRY_HURT_INC, cavalry_hurt_inc).            %% 对骑兵伤害
-define(THOUGH_HURT_INC, though_hurt_inc).              %% 对弓兵伤害
-define(ALCHEMIST_HURT_INC, alchemist_hurt_inc).        %% 对方士伤害
-define(FORMER_HURT_INC, former_hurt_inc).              %% 对前军伤害
-define(LATER_HURT_INC, later_hurt_inc).                %% 对后军伤害
-define(HURT_RED, hurt_red).                            %% 受到伤害
-define(MAN_HURT_RED, man_hurt_red).                    %% 受到男性伤害
-define(WOMAN_HURT_RED, woman_hurt_red).                %% 受到女性伤害
-define(HERO_SKILL_HURT_RED, hero_skill_hurt_red).      %% 受到英雄技伤害时
-define(TROOPS_SKILL_HURT_RED, troops_skill_hurt_red).  %% 受到兵种技伤害时
-define(CIVILIAN_HURT_RED, civilian_hurt_red).          %% 受到文官伤害时
-define(GENERAL_HURT_RED, general_hurt_red).            %% 受到武将伤害时
-define(GENERALIST_HURT_RED, generalist_hurt_red).      %% 受到全才伤害时
-define(INFANTRY_HURT_RED, infantry_hurt_red).          %% 受到步兵伤害时
-define(CAVALRY_HURT_RED, cavalry_hurt_red).            %% 受到骑兵伤害时
-define(THOUGH_HURT_RED, though_hurt_red).              %% 受到弓兵伤害时
-define(ALCHEMIST_HURT_RED, alchemist_hurt_red).        %% 受到方士伤害时
-define(FORMER_HURT_RED, former_hurt_red).              %% 受到前军伤害时
-define(LATER_HURT_RED, later_hurt_red).                %% 受到后军伤害时
%-define(POWER, power).                                  %% 战力
-define(FINAL_ATTACK_RATE, final_attack_rate).                    %% 最终攻击 百分比
-define(FINAL_DEFENCE_RATE, final_defence_rate).                  %% 最终防御 百分比
-define(FINAL_SPEED_RATE, final_speed_rate).                      %% 最终速度 百分比
-define(FINAL_TROOPS_RATE, final_troops_rate).                    %% 最终兵力 百分比
-define(ATTACK_RATE, attack_rate).                                %% 攻击 百分比
-define(DEFENCE_RATE, defence_rate).                              %% 防御 百分比
-define(SPEED_RATE, speed_rate).                                  %% 速度 百分比
-define(TROOPS_RATE, troops_rate).                                %% 兵力 百分比
-define(BASE_ATTACK_RATE, base_attack_rate).                      %% 基础攻击 百分比
-define(BASE_DEFENCE_RATE, base_defence_rate).                    %% 基础防御 百分比
-define(BASE_SPEED_RATE, base_speed_rate).                        %% 基础速度 百分比
-define(BASE_TROOPS_RATE, base_troops_rate).                      %% 基础兵力 百分比
-define(HIT_RATE, hit_rate).                                      %% 命中 百分比
-define(AVOID_RATE, avoid_rate).                                  %% 闪避 百分比
-define(CRIT_RATE, crit_rate).                                    %% 暴击 百分比
-define(CRIT_RED_RATE, crit_red_rate).                            %% 免暴 百分比
-define(CRIT_MULTI_RATE, crit_multi_rate).                        %% 暴击倍率 百分比
-define(PIERCING_RATE, piercing_rate).                            %% 穿透 百分比
-define(PARRY_RATE, parry_rate).                                  %% 格挡 百分比
-define(PARRY_MULTI_RATE, parry_multi_rate).                      %% 格挡倍率 百分比
-define(BREAK_ATTACK_RATE, break_attack_rate).                    %% 破攻 百分比
-define(BREAK_DEFENCE_RATE, break_defence_rate).                  %% 破甲 百分比
-define(HURT_INC_RATE, hurt_inc_rate).                            %% 基础伤害 百分比
-define(MAN_HURT_INC_RATE, man_hurt_inc_rate).                    %% 对男性伤害 百分比
-define(WOMAN_HURT_INC_RATE, woman_hurt_inc_rate).                %% 对女性伤害 百分比
-define(HERO_SKILL_HURT_INC_RATE, hero_skill_hurt_inc_rate).      %% 英雄技伤害 百分比
-define(TROOPS_SKILL_HURT_INC_RATE, troops_skill_hurt_inc_rate).  %% 兵种技伤害 百分比
-define(CIVILIAN_HURT_INC_RATE, civilian_hurt_inc_rate).          %% 对文官伤害 百分比
-define(GENERAL_HURT_INC_RATE, general_hurt_inc_rate).            %% 对武将伤害 百分比
-define(GENERALIST_HURT_INC_RATE, generalist_hurt_inc_rate).      %% 对全才伤害 百分比
-define(INFANTRY_HURT_INC_RATE, infantry_hurt_inc_rate).          %% 对步兵伤害 百分比
-define(CAVALRY_HURT_INC_RATE, cavalry_hurt_inc_rate).            %% 对骑兵伤害 百分比
-define(THOUGH_HURT_INC_RATE, though_hurt_inc_rate).              %% 对弓兵伤害 百分比
-define(ALCHEMIST_HURT_INC_RATE, alchemist_hurt_inc_rate).        %% 对方士伤害 百分比
-define(FORMER_HURT_INC_RATE, former_hurt_inc_rate).              %% 对前军伤害 百分比
-define(LATER_HURT_INC_RATE, later_hurt_inc_rate).                %% 对后军伤害 百分比
-define(HURT_RED_RATE, hurt_red_rate).                            %% 受到伤害 百分比
-define(MAN_HURT_RED_RATE, man_hurt_red_rate).                    %% 受到男性伤害 百分比
-define(WOMAN_HURT_RED_RATE, woman_hurt_red_rate).                %% 受到女性伤害 百分比
-define(HERO_SKILL_HURT_RED_RATE, hero_skill_hurt_red_rate).      %% 受到英雄技伤害时 百分比
-define(TROOPS_SKILL_HURT_RED_RATE, troops_skill_hurt_red_rate).  %% 受到兵种技伤害时 百分比
-define(CIVILIAN_HURT_RED_RATE, civilian_hurt_red_rate).          %% 受到文官伤害时 百分比
-define(GENERAL_HURT_RED_RATE, general_hurt_red_rate).            %% 受到武将伤害时 百分比
-define(GENERALIST_HURT_RED_RATE, generalist_hurt_red_rate).      %% 受到全才伤害时 百分比
-define(INFANTRY_HURT_RED_RATE, infantry_hurt_red_rate).          %% 受到步兵伤害时 百分比
-define(CAVALRY_HURT_RED_RATE, cavalry_hurt_red_rate).            %% 受到骑兵伤害时 百分比
-define(THOUGH_HURT_RED_RATE, though_hurt_red_rate).              %% 受到弓兵伤害时 百分比
-define(ALCHEMIST_HURT_RED_RATE, alchemist_hurt_red_rate).        %% 受到方士伤害时 百分比
-define(FORMER_HURT_RED_RATE, former_hurt_red_rate).              %% 受到前军伤害时 百分比
-define(LATER_HURT_RED_RATE, later_hurt_red_rate).                %% 受到后军伤害时 百分比
%-define(POWER_RATE, power_rate).                                  %% 战力 百分比

-define(PROP_BASE_LIST, [?STRENGTH, ?INTELECT, ?SPIRIT, ?LEADERSHIP]). %%四维属性

%% 非战斗属性(功能属性)
-define(BUILD_VALUE_MULTI, build_value_multi).			%% 建设度加成
-define(MARCH_SPEED_MULTI, march_speed_multi).			%% 行军速度加成
-define(HUNT_UNITS_MULTI, hunt_units_multi).			%% 围猎加成
-define(VISIT_MULTI, visit_multi).						%% 拜访加成
-define(TAXATION_MULTI, taxation_multi).				%% 征税加成
-define(WASTELAND_MULTI, wasteland_multi).				%% 屯田加成
-define(GENERATION_WOOD_MULTI, generation_wood_multi).	%% 代木加成
-define(MINING_MULTI, mining_multi).					%% 挖矿加成
-define(POWER, power).                                  %% 战力
-define(SKILL_POWERBASE, skill_powerbase).				%% 技能战力
-define(EQUIPMENT_POWERBASE, equipment_powerbase).		%% 宝物战力
-define(STAR_POWERBASE, star_powerbase).				%% 星辰战力
-define(AIDE_POWERBASE, aide_powerbase).				%% 副将战力
-define(FORMATION_POWERBASE, formation_powerbase).		%% 阵法战力
-define(BEAST_POWERBASE, beast_powerbase).				%% 兽灵战力
-define(SOUL_POWERBASE, soul_powerbase).				%% 魂玉战力
-define(SKILL_POWERBASE_COEFFICIENT, skill_powerbase_coefficient).				%% 技能战力
-define(EQUIPMENT_POWERBASE_COEFFICIENT, equipment_powerbase_coefficient).		%% 宝物战力
-define(STAR_POWERBASE_COEFFICIENT, star_powerbase_coefficient).				%% 星辰战力
-define(AIDE_POWERBASE_COEFFICIENT, aide_powerbase_coefficient).				%% 副将战力
-define(FORMATION_POWERBASE_COEFFICIENT, formation_powerbase_coefficient).		%% 阵法战力
-define(BEAST_POWERBASE_COEFFICIENT, beast_powerbase_coefficient).				%% 兽灵战力
-define(SOUL_POWERBASE_COEFFICIENT, soul_powerbase_coefficient).				%% 魂玉战力

-define(FUNCTION_PROP_LIST, [?BUILD_VALUE_MULTI, ?MARCH_SPEED_MULTI, ?HUNT_UNITS_MULTI, ?VISIT_MULTI, ?TAXATION_MULTI,
	?WASTELAND_MULTI, ?GENERATION_WOOD_MULTI, ?MINING_MULTI, POWER,
	SKILL_POWERBASE, EQUIPMENT_POWERBASE, STAR_POWERBASE, AIDE_POWERBASE, FORMATION_POWERBASE, BEAST_POWERBASE, SOUL_POWERBASE,
	SKILL_POWERBASE_COEFFICIENT, EQUIPMENT_POWERBASE_COEFFICIENT, STAR_POWERBASE_COEFFICIENT, AIDE_POWERBASE_COEFFICIENT,
	FORMATION_POWERBASE_COEFFICIENT, BEAST_POWERBASE_COEFFICIENT, SOUL_POWERBASE_COEFFICIENT]).



-define(HERO_PROP_COEFFICIENT, 0.5).	%% 英雄属性取值系数

-endif.
