%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 4月 2021 17:23
%%%-------------------------------------------------------------------
-author("df").
-define(STUDY_MAX_TIME, lib_hero_crops_study_api:get_tb_const(study_time_max,value)).		%% 研究次数上限
-define(STUDY_TIME_RECOVER, lib_hero_crops_study_api:get_tb_const(recover_time,value)).		%% 恢复时间



-define(HERO_CROP_STUDY, 1). %% 英雄兵种研究
-define(HERO_CROP_BREAK, 2). %% 英雄兵种突破

-define(COMMON_STUDY_TYPE, 	1).	%% 普通研究
-define(TEN_STUDY_TYPE, 	2).	%% 十连研究

-record(hero_crops_study,{
	id = 0,
	study_maps = maps:new()
}).

-record(crops_study,{
	type = 0,				%% 兵种类型
	level = 0,				%% 兵种等级
	is_break = 0,			%% 是否已经突破
	empirical = 0,			%% 经验值
	fail_time = 0,			%% 突破失败次数
	study_time = 0,			%% 研究次数
	last_add_tick = 0,		%% 增加研究次数tick
	study_fail = 0,			%% 研究失败未处理
	study_fail_type = 0,	%% 研究类型
	break_fail = 0			%% 突破失败未处理

}).