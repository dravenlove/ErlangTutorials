%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 26. Jan 2021 5:54 PM
%%%-------------------------------------------------------------------

-ifndef('city_building_HRL').
-define('city_building_HRL', true).

-define(TYPE_NOBILITY, 1).
-define(TYPE_COUNTRY_TASK, 2).

-record(player_city_building, {
    id = 0,					%% 玩家id
    total_feat = 0,         %% 建设累计功勋值
    total_build_val = 0,    %% 总建设值
    rend
}).

-endif.
