%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Jan 2021 2:48 PM
%%%-------------------------------------------------------------------
-module(db_logistics_center).
-author("df").
-include("common.hrl").
-include("logistics_center.hrl").

%% API
-export([
	load_player_logistics_center/1,
	save_player_logistics_center/1
]).


load_player_logistics_center(PlayerId)->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_LOGISTICS_CENTER, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			BsonList = ?BSON_LIST(Bson, "today_buy_times", []),
			Map = lib_common:bson_list_to_map(BsonList),
			#logistics_center{
				id = PlayerId,
				today_use_free_times = ?BSON_INT(Bson,  <<"today_use_free_times">>),
				today_buy_times = Map
			}
		;
		_ ->
			#logistics_center{
				id = PlayerId
			}

	end.



save_player_logistics_center(Logistics_center) when is_record(Logistics_center, logistics_center) ->
	PlayerId = Logistics_center#logistics_center.id,
	BsonList = lib_common:map_to_bson_list(Logistics_center#logistics_center.today_buy_times),
	Bson = #{
		?BSONSET_INT(<<"id">>,PlayerId),
		?BSONSET_INT(<<"today_use_free_times">>, Logistics_center#logistics_center.today_use_free_times),
		?BSONSET_LIST(<<"today_buy_times">>,BsonList)
		},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_LOGISTICS_CENTER,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson})
.

