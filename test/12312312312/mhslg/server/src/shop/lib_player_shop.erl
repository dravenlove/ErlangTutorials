%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 三月 2021 15:00
%%%-------------------------------------------------------------------
-module(lib_player_shop).
-author("13661").

-include("common.hrl").
-include("shop.hrl").
-include("ProtoClient_10144.hrl").

-define(REFRESH_TYPE_AUTO, 1).      %% 只能自动刷新
-define(REFRESH_TYPE_MANUAL, 2).    %% 可以手动刷新

-define(PRICE_TYPE_ADD, 1).         %% 每次购买加价
-define(PRICE_TYPE_FIXED, 2).       %% 价格不变

%% API
-export([
	put_player_shop/1,
	put_player_shop/2,
	get_player_shop/0,
    ets_init/0,
    build_index/0,
    player_shop_handler/0
]).
-export([
    sign_in/0,
    check_open_grid/0,
    process_system_refresh/0    
]).
-export([
   request_info/1,
   request_buy/1,
   request_refresh/1,
   request_buy_limit/1
]).

put_player_shop(PlayerShop) when is_record(PlayerShop, player_shop) ->
	put_player_shop(PlayerShop, false)
.
put_player_shop(PlayerShop, IsSaveDb) when is_record(PlayerShop, player_shop) ->
	lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_SHOP),
	erlang:put(?ETS_PLAYER_SHOP, PlayerShop)
.

get_player_shop() ->
    erlang:get(?ETS_PLAYER_SHOP)
.

ets_init() ->
	ets:new(?ETS_PLAYER_SHOP, [?ETS_KEY_POS(#player_shop.id) | ?ETS_OPTIONS]).

build_index() ->
	mongo_poolboy:async_ensure_index(?MMO_POOL, ?DBPLAYER_SHOP, {?TUPLE_INT(id, 1)}, true)
.

player_shop_handler() ->
	#player_handler{
		ets = ?ETS_PLAYER_SHOP,
		table_name = ?DBPLAYER_SHOP,
		table_player_field = <<"id">>,
		ets_init_func = fun ets_init/0,
		mongo_index_func = fun build_index/0,
		load_func = fun db_player_shop:load_player_shop/1,
		save_func = fun db_player_shop:save_player_shop/1,
		get_func = fun get_player_shop/0,
		put_func = fun put_player_shop/2
	}.

shop_info(ShopId) ->
    Info = get_player_shop(),
    maps:get(ShopId, Info#player_shop.shop_map, #shop{id = ShopId})
.

update_shop(Shop) when is_record(Shop, shop) ->
    Info = get_player_shop(),
    NewMap = maps:put(Shop#shop.id, Shop, Info#player_shop.shop_map),
    put_player_shop(Info#player_shop{shop_map = NewMap})
.

grid_info(ShopId, GridId) ->
    Shop = shop_info(ShopId),
    maps:get(GridId, Shop#shop.grid_map, #grid{id = GridId})
.

update_grid(ShopId, Grid) when is_record(Grid, grid) ->
    Shop = shop_info(ShopId),
    NewMap = maps:put(Grid#grid.id, Grid, Shop#shop.grid_map),
    update_shop(Shop#shop{grid_map = NewMap})
.

calc_grid_random_group(GridId, BuyTimes) ->
    Conf = tb_shop_grid:get(GridId),
    PreTimes = maps:get(pre_times, Conf, 0),

    case PreTimes =:= 0 orelse BuyTimes >= PreTimes of
        false -> maps:get(pre_group, Conf);
        true -> maps:get(group, Conf)
    end
.

random_goods(GroupId) ->
    WeightList = lib_config_api:get_shop_goods_list(GroupId),
    TotalWeight = lib_config_api:get_shop_group_weight(GroupId),
    lib_common:random_weight_list(WeightList, TotalWeight) 
.

add_refresh_times(ShopId, Times) ->
    Shop = shop_info(ShopId),
    OldTimes = Shop#shop.refresh_times,
    update_shop(Shop#shop{refresh_times = OldTimes + Times})
.

add_grid_buy_times(ShopId, GridId, Times) ->
    Grid = grid_info(ShopId, GridId),
    OldTimes = Grid#grid.buy_times,
    update_grid(ShopId, Grid#grid{buy_times = OldTimes + Times})
.

add_grid_total_buy_times(ShopId, GridId, Times) ->
    Grid = grid_info(ShopId, GridId),
    OldTimes = Grid#grid.total_buy_times,
    update_grid(ShopId, Grid#grid{total_buy_times = OldTimes + Times})
.

grid_max_buy_times(ShopId, _GridId) ->
    Conf = tb_shop:get(ShopId),
    maps:get(grid_limit, Conf, 0)
.

add_shop_buy_times(ShopId, Times) ->
    lib_player_process:process_shop_buy(ShopId, Times),
    Shop = shop_info(ShopId),
    OldTimes = Shop#shop.buy_times,
    update_shop(Shop#shop{buy_times = OldTimes + Times})
.

shop_max_buy_times(ShopId) ->
    Conf = tb_shop:get(ShopId),
    maps:get(total_limit, Conf, 0)
.

system_refresh_shop() ->
    [system_refresh_shop(ShopId) || ShopId <- tb_shop:get_list()]
.
system_refresh_shop(ShopId) ->
    Shop = shop_info(ShopId),

    NewGridMap = 
    lib_common:map_fold(fun(GridId, Grid, Map) ->
        ?JUDGE_CONTINUE(Grid#grid.is_open, Map),

        BuyTimes = Grid#grid.total_buy_times,
        GroupId = calc_grid_random_group(GridId, BuyTimes),
        GoodsId = random_goods(GroupId),

        maps:put(GridId, Grid#grid{
            goods_id = GoodsId,
            buy_times = 0
        }, Map)
    end, Shop#shop.grid_map, Shop#shop.grid_map),

    update_shop(Shop#shop{
        refresh_times = 0,
        buy_times = 0,
        grid_map = NewGridMap
    })
.

manual_refresh_shop(ShopId) ->
    Shop = shop_info(ShopId),

    NewGridMap = 
    lib_common:map_fold(fun(GridId, Grid, Map) ->
        ?JUDGE_CONTINUE(Grid#grid.is_open, Map),

        BuyTimes = Grid#grid.total_buy_times,
        GroupId = calc_grid_random_group(GridId, BuyTimes),
        GoodsId = random_goods(GroupId),

        maps:put(GridId, Grid#grid{
            goods_id = GoodsId,
            buy_times = 0
        }, Map)
    end, Shop#shop.grid_map, Shop#shop.grid_map),

    update_shop(Shop#shop{
        grid_map = NewGridMap
    })
.

check_open_grid() ->
    [check_open_grid(ShopId) || ShopId <- tb_shop:get_list()]  
.
check_open_grid(ShopId) ->
    ShopConf = tb_shop:get(ShopId),
    GridNumber = maps:get(grid_number, ShopConf),
    lib_common:for(fun(Index) ->
        GridId = ShopId * 1000 + Index,
        Grid = grid_info(ShopId, GridId),
        ?JUDGE_CONTINUE(not Grid#grid.is_open),

        GridConf = tb_shop_grid:get(GridId),
        ?JUDGE_CONTINUE(GridConf =/= false),

        NeedNobility = maps:get(need_nobility, GridConf, 0),

        ?JUDGE_CONTINUE(NeedNobility =:= 0 orelse lib_nobility_api:is_open(NeedNobility)),

        BuyTimes = Grid#grid.total_buy_times,
        GroupId = calc_grid_random_group(GridId, BuyTimes),
        GoodsId = random_goods(GroupId),

        update_grid(ShopId, Grid#grid{
            is_open = true,
            goods_id = GoodsId
        })
    end, 1, GridNumber)
.

sign_in() ->
    check_open_grid()
.

process_system_refresh() ->
    system_refresh_shop()
.

grid_to_proto(Grid) when is_record(Grid, grid) ->
    #'ProtoShopGrid'{
        id = Grid#grid.id,
        buy_times = Grid#grid.buy_times,
        is_open = Grid#grid.is_open,
        goods_id = Grid#grid.goods_id    
    }
.

shop_to_proto(Shop) when is_record(Shop, shop) ->
    ProtoGridList = 
    maps:fold(fun(_, Grid, List) -> 
        [grid_to_proto(Grid) | List]
    end, [], Shop#shop.grid_map),

    #'ProtoShop'{
        id = Shop#shop.id,
        buy_times = Shop#shop.buy_times,
        refresh_times = Shop#shop.refresh_times,
        grid_list = ProtoGridList
    }
.

request_info(Msg) ->
    ShopId = Msg#'Proto10144001'.shop_id,
    Conf = tb_shop:get(ShopId),
    ?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

    Shop = shop_info(ShopId),
    Respond = #'Proto50144001'{
        shop = shop_to_proto(Shop)    
    },
    lib_send:respond_to_client(Respond)
.

request_buy(Msg) ->
    #'Proto10144002'{
        shop_id = ShopId,
        index = Index,
        grid_id = GridId,
        goods_id = GoodsId
    } = Msg,

    ?JUDGE_RETURN(ShopId * 1000 + Index =:= GridId, ?ERROR_INVALID_PARAM),

    ShopConf = tb_shop:get(ShopId),
    ?JUDGE_RETURN(ShopConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

    GridConf = tb_shop_grid:get(GridId),
    ?JUDGE_RETURN(GridConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

    GoodsConf = tb_shop_goods:get(GoodsId),
    ?JUDGE_RETURN(GoodsConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

    Shop = shop_info(ShopId),
    Grid = grid_info(ShopId, GridId),

    ?JUDGE_RETURN(Grid#grid.is_open, ?ERROR_CLIENT_OPERATOR),
    ?JUDGE_RETURN(Grid#grid.goods_id =/= 0, ?ERROR_CLIENT_OPERATOR),
    ?JUDGE_RETURN(GoodsId =/= 0 andalso GoodsId =:= Grid#grid.goods_id, ?ERROR_CLIENT_OPERATOR),

    GirdBuyTimes = Grid#grid.buy_times,
    GridTotalBuyTimes = Grid#grid.total_buy_times,
    GridMaxBuyTimes = grid_max_buy_times(ShopId, GridId),
    ?JUDGE_RETURN(GridMaxBuyTimes =:= 0 orelse GridMaxBuyTimes > GirdBuyTimes, ?ERROR_CLIENT_OPERATOR),

    ShopMaxBuyTimes = shop_max_buy_times(ShopId),
    ?JUDGE_RETURN(ShopMaxBuyTimes =:= 0 orelse ShopMaxBuyTimes > Shop#shop.buy_times, ?ERROR_CLIENT_OPERATOR),
    
    PriceType = maps:get(price_type, ShopConf),

    Cost = 
    case PriceType of
        ?PRICE_TYPE_FIXED -> maps:get(cost, GoodsConf);
        ?PRICE_TYPE_ADD ->
            [CostId, CostNumber] = maps:get(cost, GoodsConf),
            CostAdd = maps:get(cost_add, GoodsConf),
            [CostId, CostNumber + GirdBuyTimes * CostAdd]
    end,

    CostItem = lib_item_api:conf_item_to_item_obj(Cost),
    Ret = lib_player_pack:validate_remove(CostItem),
    ?PACK_IS_SUCCESS(Ret),

    lib_player_pack:auto_remove(CostItem, ?REMOVE_SERIAL(?USE_SHOP_BUY, GoodsId)),
    add_grid_buy_times(ShopId, GridId, 1),
    add_grid_total_buy_times(ShopId, GridId, 1),
    add_shop_buy_times(ShopId, 1),

    ConfItem = maps:get(item, GoodsConf),
    Item = lib_item_api:conf_item_to_item_obj(ConfItem),
    lib_player_pack:auto_insert(Item, ?INSERT_SERIAL(?ADD_SHOP_BUY, GoodsId)),

    PreTimes = maps:get(pre_times, GridConf, 0),
    case PreTimes =/= 0 andalso GridTotalBuyTimes + 1 =:= PreTimes of
        false -> skip;
        true ->
            GroupId = calc_grid_random_group(GridId, GridTotalBuyTimes + 1),
            NewGoodsId = random_goods(GroupId),
            NewGrid = grid_info(ShopId, GridId),
            update_grid(ShopId, NewGrid#grid{
                goods_id = NewGoodsId
            })
    end,

    Respond = #'Proto50144002'{
        shop_id = ShopId,
        index = Index,
        grid_id = GridId,
        goods_id = GoodsId    
    },
    lib_send:respond_to_client(Respond)
.

request_refresh(Msg) ->
    ShopId = Msg#'Proto10144003'.shop_id,
    Conf = tb_shop:get(ShopId),
    ?JUDGE_RETURN(Conf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

    Shop = shop_info(ShopId),
    RefreshType = maps:get(refresh_type, Conf),

    case RefreshType of
        ?REFRESH_TYPE_AUTO -> ?RETURN(?ERROR_CLIENT_OPERATOR);
        ?REFRESH_TYPE_MANUAL ->
            FreeRefreshTimes = maps:get(free_refresh_times, Conf, 0),
            MaxIndex = maps:get(refresh_max_index, Conf, 0),
            RefreshTimes = Shop#shop.refresh_times,

            BuyTimes = max(RefreshTimes - FreeRefreshTimes, 0),
            Index = min(BuyTimes + 1, MaxIndex),
            RefreshConf = tb_shop_refresh:get(ShopId * 1000 + Index),
            ?JUDGE_RETURN(RefreshConf =/= false, ?ERROR_CONFIG_NOT_EXISTENT),

            Cost = maps:get(cost, RefreshConf),
            CostItem = lib_item_api:conf_item_to_item_obj(Cost),

            Ret = lib_player_pack:validate_remove(CostItem),
            ?PACK_IS_SUCCESS(Ret),

            lib_player_pack:auto_remove(CostItem, ?REMOVE_SERIAL(?USE_SHOP_REFRESH, ShopId)),
            add_refresh_times(ShopId, 1),
            manual_refresh_shop(ShopId)
    end,

    Respond = #'Proto50144003'{
        shop_id = ShopId    
    },
    lib_send:respond_to_client(Respond)
.

request_buy_limit(Msg) ->

    PropId = Msg#'Proto10144004'.prop_id,
    EquipDict = lib_equip_api:all_equip(),

    Fun =	%% 查找消耗里面有没有需要的道具
    fun
        F (ItemId, Par, Acc) ->
            case tb_equip_break:get(ItemId) of
                false -> Acc;
                Conf ->
                    Consume = maps:get(consume, Conf, []),
                    NewAcc = lists:foldl(
                        fun([Id, Num], Acc0) ->
                            case Id of
                                Par -> Num + Acc0;
                                _ -> Acc0
                            end
                        end, Acc, Consume),
                    F(ItemId + 1, Par, NewAcc)
            end
    end,
    NumLimit = dict:fold(
        fun(_, EquipItem, Acc) ->
            Fun(EquipItem#item.item_id * 10 + EquipItem#item.equip_info#equip_info.break_through, PropId, Acc)
        end, 0, EquipDict),

    Respond = #'Proto50144004'{
        num_limit = NumLimit
    },
    lib_send:respond_to_client(Respond)
.