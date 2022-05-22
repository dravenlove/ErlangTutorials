%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 20. Jan 2021 9:15 PM
%%%-------------------------------------------------------------------
-module(db_player_map_clearing).
-author("lichaoyu").
-include("common.hrl").
-include("clearing.hrl").

%% API
-export([
	load_player_map_clearing/1,
	save_player_map_clearing/1
]).

bson_to_map_clearing(Bson) ->
	Type = ?BSON_INT(Bson, <<"type">>),
	#map_clearing{
		id = ?BSON_STRING(Bson, <<"clearing_id">>),
		type = Type,
		city_id = ?BSON_INT(Bson, <<"city_id">>),
		data = bson_to_data(Type, ?BSON_BSON(Bson, <<"data">>))
	}
.
bson_to_data(?TYPE_BOUNTY_MISSION, Bson) ->
	?BSON_INT(Bson, <<"task_id">>)
;
bson_to_data(?TYPE_PUPPET, Bson) ->
	?BSON_LIST(Bson, <<"data">>)
;
bson_to_data(?TYPE_GOVERNMENT_TASK, Bson) ->
	?BSON_INT(Bson, <<"task_id">>)
;
bson_to_data(?TYPE_ALIEN_INVASION, Bson) ->
	#alien_invasion{
		combat_id = ?BSON_INT(Bson, <<"combat_id">>),
		num = ?BSON_INT(Bson, <<"num">>),
		conf_id = ?BSON_INT(Bson, <<"conf_id">>)
	}
;
bson_to_data(_, _) ->
	undefined
.

map_clearing_to_bson(MapClearing) ->
	Type = MapClearing#map_clearing.type,
	#{
		?BSONSET_STRING(<<"clearing_id">>, MapClearing#map_clearing.id),
		?BSONSET_INT(<<"type">>, Type),
		?BSONSET_INT(<<"city_id">>, MapClearing#map_clearing.city_id),
		?BSONSET_BSON(<<"data">>, data_to_bson(Type, MapClearing#map_clearing.data))
	}
.
data_to_bson(?TYPE_BOUNTY_MISSION, Data) ->
	#{
		?BSONSET_INT(<<"task_id">>, Data)
	}
;
data_to_bson(?TYPE_PUPPET, Data) ->
	#{
		?BSONSET_LIST(<<"data">>, Data)
	}
;
data_to_bson(?TYPE_GOVERNMENT_TASK, Data) ->
	#{
		?BSONSET_INT(<<"task_id">>, Data)
	}
;
data_to_bson(?TYPE_ALIEN_INVASION, Data) ->
	#{
		?BSONSET_INT(<<"combat_id">>, Data#alien_invasion.combat_id),
		?BSONSET_INT(<<"num">>, Data#alien_invasion.num),
		?BSONSET_INT(<<"conf_id">>, Data#alien_invasion.conf_id)
	}
;
data_to_bson(_, _) ->
	#{}
.

load_player_map_clearing(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_MAP_CLEARING, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_map_clearing{
				id = PlayerId,
				map_clearing = lists:foldl(
					fun(B, D) ->
						V = bson_to_map_clearing(B),
						dict:store(V#map_clearing.id, V, D)
					end, dict:new(), ?BSON_LIST(Bson, <<"clearing_list">>))
			};
		_ ->
			#player_map_clearing{id = PlayerId}
	end
.

save_player_map_clearing(PlayerMapClearing) ->
	#player_map_clearing{
		id = PlayerId,
		map_clearing = MapClearing
	} = PlayerMapClearing,
	ClearingList = dict:fold(
		fun(_, V, L) ->
			[map_clearing_to_bson(V) | L]
		end, [], MapClearing),
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_LIST(<<"clearing_list">>, ClearingList)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_MAP_CLEARING, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.

