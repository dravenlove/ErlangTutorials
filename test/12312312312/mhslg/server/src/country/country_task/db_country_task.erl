%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. Apr 2021 3:44 PM
%%%-------------------------------------------------------------------
-module(db_country_task).
-author("lichaoyu").
-include("common.hrl").
-include("country_task.hrl").

%% API
-export([
	load_country_task/0,
	save_country_task/1
]).

load_country_task() ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DB_COUNTRY, #{?BSONSET_INT(uid, 2)}) of
		Bson = #{} ->
			bson_to_maps(?BSON_LIST(Bson, <<"list">>));
		_ ->
			lists:foldl(
				fun(Country, M) ->
					maps:put(Country, #country_task{}, M)
				end, #{}, lib_map_api:player_country())
	end
.

bson_to_maps(Bson) ->
	lists:foldl(
		fun(B, M) ->
			CountryTask = #country_task{
				task = ?BSON_INT(B, <<"task">>),
				param = ?BSON_INT(B, <<"param">>)
			},
			maps:put(?BSON_INT(B, <<"country">>), CountryTask, M)
		end, #{}, Bson)
.

maps_to_bson(CountryTaskMaps) ->
	maps:fold(
		fun(Country, CountryTask, L) ->
			[#{
				?BSONSET_INT(<<"country">>, Country),
				?BSONSET_INT(<<"task">>, CountryTask#country_task.task),
				?BSONSET_INT(<<"param">>, CountryTask#country_task.param)
			} | L]
		end, [], CountryTaskMaps)
.

save_country_task(CountryTaskMaps) ->
	Bson = #{
		?BSONSET_INT(<<"uid">>, 2),
		?BSONSET_LIST(<<"list">>, maps_to_bson(CountryTaskMaps))
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DB_COUNTRY, #{?BSONSET_INT(uid, 2)}, Bson)
.
