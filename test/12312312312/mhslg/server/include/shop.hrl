%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 三月 2021 14:46
%%%-------------------------------------------------------------------

-record(player_shop, {
    id = 0,
    shop_map = maps:new()
}).

-record(shop, {
    id = 0,
    refresh_times = 0,
    buy_times = 0,
    grid_map = maps:new()
}).

-record(grid, {
    id = 0,
    buy_times = 0,
    total_buy_times = 0,
    goods_id = 0,
    is_open = false
}).