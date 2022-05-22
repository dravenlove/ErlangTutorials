%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: season_activity
%%% Created on : 2021/7/8 16:31
%%% @author leever 
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-include("hero.hrl").
-include("inner_city.hrl").
-include("msgcode.hrl").
-include("player.hrl").
-include("ProtoClient_10152.hrl").
-include("map.hrl").
-include("season_and_day.hrl").
-include("city_industry.hrl").

-ifndef('season_activity_HRL').
-define('season_activity_HRL', true).
%%
-define(ETS_SPRING_MISSION,ets_spring_mission). %% 季节活跃活动
%% 春
%% 英雄筛选条件
-define(CONDITION_ALL_HERO,0).
%%英雄性别
-define(SEX_MALE, 	1). %%男
-define(SEX_FEMALE, 2). %%女
-define(SEX_LIST, [?SEX_MALE, ?SEX_FEMALE]).
%%英雄类型
-define(TYPE_WISDOM, 	3). %%智慧
-define(TYPE_VALIANT, 	4).	%%勇猛
-define(TYPE_BALANCE, 	5).	%%均衡
-define(TYPE_LIST, [?TYPE_WISDOM, ?TYPE_VALIANT, ?TYPE_BALANCE]).
%%兵种类型
-define(CORPS_CAVALRY, 	6).	%%骑兵
-define(CORPS_INFANTRY,	7). %%步兵
-define(CORPS_ARCHER, 		8).	%%弓兵
-define(CORPS_MAGICIAN, 	9).	%%方士
-define(CORPS_LIST, [?CORPS_INFANTRY, ?CORPS_CAVALRY, ?CORPS_ARCHER, ?CORPS_MAGICIAN]).
-define(CONDITION_TYPE_CORPS_LIST,lists:merge(?TYPE_LIST,?CORPS_LIST)).
-define(CONDITION_SEX_TYPE_CORPS_LIST,lists:merge(?SEX_LIST,?CONDITION_TYPE_CORPS_LIST)).
%% 夏
-define(FIRECRACKER_ID , 0).
-define(FIREWORK_ID , 1).

-define(BROAD_ID_SEASON_ACTIVITY, 1025).		%% 广播id
%% 秋
%% 城池ID
-define(CITY_TYPE_FORTRESS,1).
-define(CITY_TYPE_CAPITAL,6).
-define(CITY_ID_TO_CITY_TYPE,fun(CityId) -> CityId div 1000000 end).
-define(CITY_ID_TO_COUNTRY,fun(CityId) -> City = CityId div 1000,City rem 100 end).
%% 冬
-define(ANSWER_TIME_LIMIT,20*1000).

-define(QUESTION_STATUS_BEFORE,0).			%% 活动开始前
-define(QUESTION_STATUS_ANSWERING,1).		%% 答题中
-define(QUESTION_STATUS_REALTIME_RANK,2).	%% 实时排名
-define(QUESTION_STATUS_FINAL_RANK,3).		%% 最终排名
-define(QUESTION_STATUS_QUESTION_ANSWER,4).	%% 答题对错
-define(QUESTION_STATUS_OVER,5).			%% 答题结束
%% 常量表取值
-define(TB_S_A_CONST , fun(KEY,Type) -> maps:get(KEY, tb_season_activity_const:get(Type)) end).
-define(CURRENT_SEASON , lib_season_and_days_api:get_season_info()).
%% 奖励邮件
-define(SPRING_MAIL_ID, 1022).
-define(SUMMER_MAIL_ID, 1023).
-define(WINTER_MAIL_ID, 1024).
-define(FIRECRACKER, <<"爆竹"/utf8>>).
-define(FIREWORK, <<"烟花"/utf8>>).

-define(ETS_SEASON_ACTIVITY,ets_season_activity).

-record(player_season_activity,{
	id =0 ,			%玩家id
	spring = maps:new(),	%春色远游任务 => #spring
	autumn = maps:new(),	%秋收驱盗信息 => #autumn
	is_spring_final_award = false, %春色远游最终奖励是否领取
	is_autumn_final_award = false, %秋收驱盗最终奖励是否领取
	mod_map_temp_list = []   %暂存从地图获取的信息列表
}).
-record(season_activity,{
	player_summer = maps:new(),	%% => #player_summer
	question = maps:new(),		%冬日问答题库 => #question
	is_open = false,			% 活动状态标签
	winter_answering_list = [],	%% 冬日问答答题的玩家id列表
	player_answer = maps:new(),	%冬日答题情况 PlayerId => #rank
	rank_list = [],			%% 排名 【=> #rank】
	spring_doing_offline = maps:new(),		%% 下线玩家进行中任务列表 => #spring_doing_offline
	question_tick = 0,		%%当前题开始时间
	question_number = 0,		%%当前题号
	mod_map_temp_list = [],   %暂存从地图获取的信息列表
	winter_answered_list = []		%% 暂存单题已答玩家
}).
-record(spring_doing_offline,{
	id,
	spring = maps:new()	%春色远游任务 => #spring
}).
-record(rank,{ %% 答题情况，用于排名
	proto_show_role,	%% 玩家信息
	no = 0,			%%名次
	right = 0 ,		%%答对数
	wrong = 0 ,		%%答错数
	time = 0 ,		%%总耗时
	answered = 0	%%当前已选答案
}).
-record(player_summer,{
	id = 0,					%% PlayerId
	summer = maps:new(),	%夏夜篝火信息 => #summer
	summer_firecracker_remain_times = 0,  %%爆竹燃放剩余次数
	summer_firework_remain_times = 0  %%烟花燃放剩余次数
}).
-record(spring,{
	id = 0,					%任务id
	hero_condition = 0,		%英雄条件
	target_city = 0,		%目标城池
	award = [],				%奖励id列表
	is_completed = false,	%任务是否完成
	is_received = false,	%说明：领取状态
	is_display = false,		%任务是否刷出
	is_forward = false,		%是否需要前往
	is_forwarding = false,	%是否进行中
	is_arrived = false,		%是否到达目标地
	hero_id = 0				%英雄id：申请做任务时用
}).
-record(summer,{
	id = 0,					%说明：篝火id
	is_recharging = false,	%说明：充能状态
	is_received = false,	%说明：领取状态
	received_times = 0,		%说明：已领取奖励次数
	total_times = 0,		%说明：总奖励领取次数
	award = [],				%奖励id列表
	tick = 0				%说明：时间戳
}).
-record(autumn,{
	id = 0,				%说明：第几个
	industry = 0,		%说明：目标产业
	industry_level = 0,	%说明：产业等级
	robber = 0,			%说明：盗贼信息
	is_forward = false,	%说明：是否需要前往
	is_arrived = false,		%是否到达目标地
	is_display = false,	%说明：任务是否刷出
	is_received = false,%说明：领取状态
	last_time = 0,		%说明：上个任务刷新时间
	award = [],			%奖励id列表
	is_completed = false,%说明：是否完成
	hero_id = 0			%英雄id：申请做任务时用
}).
-record(question,{
	id = 0,				%% 题号
	question = 0,		%% 题库键
	answer_list = 0		%%答案位置
}).

-endif.
