%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 08. Jul 2021 5:29 PM
%%%-------------------------------------------------------------------

-ifndef('alien_invasion_HRL').
-define('alien_invasion_HRL', true).

-record(player_alien_invasion, {
	id = 0,
	tick = 0,					%% 下线时间戳
	save_time = 0				%% 保存次数

}).


-endif.
