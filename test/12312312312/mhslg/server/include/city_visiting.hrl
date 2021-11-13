%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 26. Feb 2021 5:52 PM
%%%-------------------------------------------------------------------

-ifndef('city_visiting_HRL').
-define('city_visiting_HRL', true).

-record(player_city_visiting, {
	id = 0,
	total_num = 0,			%% 拜访总次数
	city_visiting = maps:new()		%% 城池拜访每日次数记录,CityId => Num
}).

-endif.
