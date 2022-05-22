%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 十一月 2020 16:06
%%%-------------------------------------------------------------------
-author("13661").

-record(player_chapter,{
	id = id,
	chapters = dict:new(),
	challenge_times = 0,
	buy_times = 0
}).

-record(chapter,{
	chapter_id = 0,
	stages = dict:new(),
	total_star = 0,
	star_rewards = dict:new(),
	top_stage_id = 0
}).

-record(stage, {
	stage_id = 0,
	challenge_times = 0,
	is_pass = false,
	pass_star = 0,
	pass_times = 0,
	pass_targets = [] %%完成的目标列表
}).