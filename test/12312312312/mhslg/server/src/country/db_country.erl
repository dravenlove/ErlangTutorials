%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 12月 2020 16:32
%%%-------------------------------------------------------------------
-module(db_country).
-author("13661").

-include("common.hrl").
-include("country.hrl").

%% API
-export([
	load_country_monitor/0,
	save_country_monitor/1
]).

player_to_bson(Player) when is_record(Player, country_player) ->
	#{
		?BSONSET_INT(id, Player#country_player.id),
		?BSONSET_INT(country_id, Player#country_player.country_id),
		?BSONSET_BSON(show, lib_common:player_show_to_bson(Player#country_player.show)),
		?BSONSET_INT(pos, Player#country_player.pos),
		?BSONSET_INT(pos_name_id, Player#country_player.pos_name_id),
		?BSONSET_INT(city_id, Player#country_player.city_id),
		?BSONSET_BOOL(can_appoint_master, Player#country_player.can_appoint_master),
		?BSONSET_LIST(fief_map, lib_common:map_to_bson_list(Player#country_player.fief_map)),
		?BSONSET_INT(recv_tax_revenue_tick, Player#country_player.recv_tax_revenue_tick),
		?BSONSET_BSON(hero, lib_hero_api:hero_base_to_bson(Player#country_player.hero))
	}
.

bson_to_player(Bson) ->
	#country_player{
		id = ?BSON_INT(Bson, id),
		country_id = ?BSON_INT(Bson, country_id),
		show = lib_common:bson_to_player_show(?BSON_BSON(Bson, show)),
%%		pos = ?BSON_INT(Bson, pos),
%%		pos_name_id = ?BSON_INT(Bson, pos_name_id),
%%		city_id = ?BSON_INT(Bson, city_id),
		can_appoint_master = ?BSON_BOOL(Bson, can_appoint_master),
		fief_map = lib_common:bson_list_to_map(?BSON_LIST(Bson, fief_map)),
		recv_tax_revenue_tick = ?BSON_INT(Bson, recv_tax_revenue_tick),
		hero = lib_hero_api:bson_to_hero_base(?BSON_BSON(Bson, hero))
	}
.

order_to_bson(Order) when is_record(Order, military_orders) ->
	#{
		?BSONSET_INT(uuid, Order#military_orders.uuid),
		?BSONSET_INT(type, Order#military_orders.type),
		?BSONSET_BOOL(is_in_open, Order#military_orders.is_in_open),
		?BSONSET_INT(start_tick, Order#military_orders.start_tick),
		?BSONSET_INT(city_id, Order#military_orders.city_id),
		?BSONSET_INT(open_times, Order#military_orders.open_times)
	}
.

bson_to_order(Bson) ->
	#military_orders{
		uuid = ?BSON_INT(Bson, uuid),
		type = ?BSON_INT(Bson, type),
		is_in_open = ?BSON_BOOL(Bson, is_in_open),
		start_tick = ?BSON_INT(Bson, start_tick),
		city_id = ?BSON_INT(Bson, city_id),
		open_times = ?BSON_INT(Bson, open_times)
	}
.

impeach_to_bson(Impeach) when is_record(Impeach, impeach) ->
	#{
		?BSONSET_INT(uuid, Impeach#impeach.uuid),
		?BSONSET_BOOL(is_in_impeach, Impeach#impeach.is_in_impeach),
		?BSONSET_INT(tag_impeach_id, Impeach#impeach.tag_impeach_id),
		?BSONSET_INT(req_impeach_id, Impeach#impeach.req_impeach_id),
		?BSONSET_INT(req_impeach_tick, Impeach#impeach.req_impeach_tick),
		?BSONSET_INT(a_votes_number, Impeach#impeach.a_votes_number),
		?BSONSET_INT(b_votes_number, Impeach#impeach.b_votes_number),
		?BSONSET_LIST(rank_list, Impeach#impeach.rank_list),
		?BSONSET_LIST(votes_list, Impeach#impeach.votes_list)
	}
.

bson_to_impeach(Bson) ->
	#impeach{
		uuid = ?BSON_INT(Bson, uuid),
		is_in_impeach = ?BSON_BOOL(Bson, is_in_impeach),
		tag_impeach_id = ?BSON_INT(Bson, tag_impeach_id),
		req_impeach_id = ?BSON_INT(Bson, req_impeach_id),
		req_impeach_tick = ?BSON_INT(Bson, req_impeach_tick),
		a_votes_number = ?BSON_INT(Bson, a_votes_number),
		b_votes_number = ?BSON_INT(Bson, b_votes_number),
		rank_list = ?BSON_LIST(Bson, rank_list),
		votes_list = ?BSON_LIST(Bson, votes_list)
	}
.

country_to_bson(Country) when is_record(Country, country) ->
	BsonPosList = lib_common:map_to_bson_list(Country#country.pos_map),
	BsonImpeachInfo = impeach_to_bson(Country#country.impeach_info),

	BsonOrderList =
	maps:fold(fun(_OrderType, Order, List) ->
		[order_to_bson(Order) | List]
  	end, [], Country#country.order_map),

	#{
		?BSONSET_INT(id, Country#country.id),
		?BSONSET_STRING(notice, Country#country.notice),
		?BSONSET_INT(notice_uuid, Country#country.notice_uuid),
		?BSONSET_LIST(pos_map, BsonPosList),
		?BSONSET_INT(king_change_tick, Country#country.king_change_tick),
		?BSONSET_BSON(impeach_info, BsonImpeachInfo),
		?BSONSET_LIST(order_map, BsonOrderList)
	}
.

bson_to_country(Bson) ->
	BsonPosList = ?BSON_LIST(Bson, pos_map, []),
	PosMap = lib_common:bson_list_to_map(BsonPosList),

	BsonImpeachInfo = ?BSON_BSON(Bson, impeach_info),
	Impeach = bson_to_impeach(BsonImpeachInfo),

	BsonOrderList = ?BSON_LIST(Bson, order_map, []),
	OrderMap =
	lists:foldl(fun(BsonOrder, Map) ->
		Order = bson_to_order(BsonOrder),
		maps:put(Order#military_orders.type, Order, Map)
	end, maps:new(), BsonOrderList),

	#country{
		id = ?BSON_INT(Bson, id),
		notice = ?BSON_STRING(Bson, notice),
		notice_uuid = ?BSON_INT(Bson, notice_uuid),
		king_change_tick = ?BSON_INT(Bson, king_change_tick),
		pos_map = PosMap,
		impeach_info = Impeach,
		order_map = OrderMap
	}
.

load_country_monitor() ->
	RankPlayerMap =
	case mongo_poolboy:find(?MMO_POOL, ?DBPLAYER_RANK, #{}) of
		[_ | _] = BsonRankPlayerList ->
			lists:foldl(fun(BsonPlayer, Map) ->
				Player = bson_to_player(BsonPlayer),
				maps:put(Player#country_player.id, Player, Map)
            end, maps:new(), BsonRankPlayerList);
		_ ->
			maps:new()
	end,

	PlayerMap =
	case mongo_poolboy:find(?MMO_POOL, ?DB_COUNTRY_PLAYER, #{}) of
		[_ | _] = BsonPlayerList ->
				lists:foldl(fun(BsonPlayer, Map) ->
					Player = bson_to_player(BsonPlayer),
					maps:put(Player#country_player.id, Player, Map)
	            end, RankPlayerMap, BsonPlayerList);
		_ ->
			RankPlayerMap
	end,

	case mongo_poolboy:find_one(?MMO_POOL, ?DB_COUNTRY, #{?BSONSET_INT(uid, 1)}) of
		Res = #{} ->
			BsonCountryList = ?BSON_LIST(Res, country_map, []),
			CountryMap =
			lists:foldl(fun(BsonCountry, Map) ->
				Country = bson_to_country(BsonCountry),
				maps:put(Country#country.id, Country, Map)
			end, maps:new(), BsonCountryList),

			NewCountryMap =
			lists:foldl(fun(CountryId, Map) ->
				Country = maps:get(CountryId, CountryMap, #country{id = CountryId}),
				maps:put(CountryId, Country, Map)
			end, maps:new(), tb_role_country:get_list()),

			#country_monitor{
				country_map = NewCountryMap,
				player_map = PlayerMap,
				reset_everyday_tick = ?BSON_INT(Res, reset_everyday_tick),
				send_salary_tick = ?BSON_INT(Res, send_salary_tick)
			};
		_ ->
			CountryMap =
			lists:foldl(fun(CountryId, Map) ->
				maps:put(CountryId, #country{id = CountryId}, Map)
			end, maps:new(), tb_role_country:get_list()),
			#country_monitor{
				country_map = CountryMap
			}
	end
.

save_country_monitor(Monitor) when is_record(Monitor, country_monitor) ->
	maps:map(fun(_, Player) ->
		PlayerBson = player_to_bson(Player),
		mongo_poolboy:async_update(?MMO_POOL, ?DB_COUNTRY_PLAYER, #{?BSONSET_INT(id, Player#country_player.id)}, PlayerBson)
    end, Monitor#country_monitor.player_map),

	BsonCountryList =
	maps:fold(fun(_, Country, List) ->
		[country_to_bson(Country) | List]
  	end, [], Monitor#country_monitor.country_map),

	Bson =
	#{
		?BSONSET_INT(uid, 1),
		?BSONSET_LIST(country_map, BsonCountryList),
		?BSONSET_INT(send_salary_tick, Monitor#country_monitor.send_salary_tick),
		?BSONSET_INT(reset_everyday_tick, Monitor#country_monitor.reset_everyday_tick)
	},

	QueryBson = #{
		?BSONSET_INT(uid, 1)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_COUNTRY, QueryBson, Bson)
.