%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 13. Apr 2021 3:44 PM
%%%-------------------------------------------------------------------
-module(db_player_country_task).
-author("lichaoyu").
-include("common.hrl").
-include("country_task.hrl").

%% API
-export([
	load_player_country_task/1,
	save_player_country_task/1
]).

load_player_country_task(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_COUNTRY_TASK, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_country_task{
				id = PlayerId,
				task = ?BSON_INT(Bson, <<"task">>),
				param = ?BSON_INT(Bson, <<"param">>)
			};
		_ ->
			#player_country_task{id = PlayerId}
	end
.

save_player_country_task(#player_country_task{id = PlayerId} = PlayerCountryTask) ->
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_INT(<<"task">>, PlayerCountryTask#player_country_task.task),
		?BSONSET_INT(<<"param">>, PlayerCountryTask#player_country_task.param)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_COUNTRY_TASK, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.






