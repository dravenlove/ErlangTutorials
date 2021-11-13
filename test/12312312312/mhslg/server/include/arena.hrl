%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 2月 2021 10:36
%%%-------------------------------------------------------------------
-author("13661").

-define(ARENA_MAX_NUMBER, 10000).

-record(arena_monitor, {
	is_init = false,    %% 是否已初始化
	rank_list = array:new([{size, 0}]), %% 排行数组[player_id]
	player_map = maps:new(),        %% 玩家map player_id => #arena_player
	country_top_map = maps:new(),   %% 国家最高排名map country_id => obj_heap({player_id, rank})
	rank_settlement_tick = 0        %% 排名奖励发送时间
}).

-record(arena_record, {
	first_show = undefined,     %% 第一个玩家显示信息
	second_show = undefined,    %% 第二个玩家显示信息
	first_hero_list = [],       %% 第一个玩家英雄列表[#hero_base]
	second_hero_list = [],      %% 第二个玩家英雄列表[#hero_base]
	result_list = [],           %% 对战结果列表
	first_rank = 0,             %% 第一个玩家排名
	second_rank = 0,            %% 第二个玩家排名
	win_type = 0,               %% 胜利类型
	tick = 0                    %% 时间戳
}).

-record(arena_player, {
	is_robot = false,       %% 是否是机器人
	id = 0,                 %% ID
	show = undefined,       %% 显示信息
	hero_list = [],         %% 英雄列表 [#hero_base]
	force = 0,				%% 战力
	rank = 0,               %% 排名
	top_rank = 0,           %% 历史最高排名
	history_list = [],      %% 历史记录 [#arena_record]
	challenge_list = []     %% 挑战列表玩家 {player_id, rank}
}).

-record(player_arena, {
	id = 0,                 %% ID
	challenge_times = 0,    %% 以挑战次数
	buy_times = 0,          %% 购买次数
	refresh_tick = 0        %% 对手刷新时间
}).