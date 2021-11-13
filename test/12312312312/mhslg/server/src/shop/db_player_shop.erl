%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 三月 2021 21:12
%%%-------------------------------------------------------------------
-module(db_player_shop).
-author("13661").

-include("common.hrl").
-include("shop.hrl").

%% API
-export([
	load_player_shop/1,
	save_player_shop/1
]).

bson_to_grid(Bson) ->
	#grid{
		id = ?BSON_INT(Bson, id),
		buy_times = ?BSON_INT(Bson, buy_times),
		total_buy_times = ?BSON_INT(Bson, total_buy_times),
		goods_id = ?BSON_INT(Bson, goods_id),
		is_open = ?BSON_BOOL(Bson, is_open)
	}
.

grid_to_bson(Grid) when is_record(Grid, grid) ->
	#{
		?BSONSET_INT(id, Grid#grid.id),	
		?BSONSET_INT(buy_times, Grid#grid.buy_times),
		?BSONSET_INT(total_buy_times, Grid#grid.total_buy_times),
		?BSONSET_INT(goods_id, Grid#grid.goods_id),	
		?BSONSET_BOOL(is_open, Grid#grid.is_open)
	}
.

bson_to_shop(Bson) ->
	BsonGridList = ?BSON_LIST(Bson, grid_map),
	GridMap = 
	lists:foldl(fun(BsonGrid, Map) -> 
		Grid = bson_to_grid(BsonGrid),
		maps:put(Grid#grid.id, Grid, Map)
	end, maps:new(), BsonGridList),

	#shop{
		id = ?BSON_INT(Bson, id),
		refresh_times = ?BSON_INT(Bson, refresh_times),
		buy_times = ?BSON_INT(Bson, buy_times),
		grid_map = GridMap
	}
.

shop_to_bson(Shop) when is_record(Shop, shop) ->
	BsonGridList = 
	maps:fold(fun(_, Grid, List) -> 
		[grid_to_bson(Grid) | List]	
	end, [], Shop#shop.grid_map),

	#{
		?BSONSET_INT(id, Shop#shop.id),
		?BSONSET_INT(refresh_times, Shop#shop.refresh_times),
		?BSONSET_INT(buy_times, Shop#shop.buy_times),
		?BSONSET_LIST(grid_map, BsonGridList)
	}
.

load_player_shop(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_SHOP, #{?BSONSET_INT(id, PlayerId)}) of
		Res = #{} ->
			BsonShopList = ?BSON_LIST(Res, shop_map),
			ShopMap = 
			lists:foldl(fun(BsonShop, Map) -> 
				Shop = bson_to_shop(BsonShop),
				maps:put(Shop#shop.id, Shop, Map)
			end, maps:new(), BsonShopList),

			#player_shop{
				id = PlayerId,
				shop_map = ShopMap
			};
		_ -> #player_shop{
			id = PlayerId
		}
	end
.

save_player_shop(PlayerShop) ->
	PlayerId = PlayerShop#player_shop.id,

	BsonShopList = 
	maps:fold(fun(_, Shop, List) -> 
		[shop_to_bson(Shop) | List]
	end, [], PlayerShop#player_shop.shop_map),

	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_LIST(shop_map, BsonShopList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_SHOP,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.