%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2020 3:22 PM
%%%-------------------------------------------------------------------
-author("df").
-define(RECRUIT_ONE       ,1).		%% 小酌
-define(RECRUIT_TWO       ,2).		%% 豪饮
-define(RECRUIT_THREE     ,3).		%% 盛宴


-record(pub_recruit, {
	id = 0,				%% 玩家id
	buy_type = [],		%% 抽取过的池子
	num = 0,			%% 已经抽取豪饮次数 用于触发特殊池子
	today_recruit = 0   %% 小酌(第一档)当日抽取次数
}).