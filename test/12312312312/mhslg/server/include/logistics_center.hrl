%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Jan 2021 10:47 AM
%%%-------------------------------------------------------------------
-author("df").


-record(logistics_center, {
	id = 0,
	today_use_free_times = 0,		%% 今日使用免费次数
	today_buy_times = maps:new()	%% key: type, value: buy_times
}).
