%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Dec 2020 3:31 PM
%%%-------------------------------------------------------------------
-module(db_pub_recruit).
-include("pub_recruit.hrl").
-include("common.hrl").
-include("player.hrl").
-author("df").

-export([
	load_pub_recruit/1,
	save_pub_recruit/1
]).


load_pub_recruit(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_PUB_RECRUIT, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#pub_recruit{
				id = PlayerId,
				buy_type = ?BSON_LIST(Bson,  <<"buy_type">>),
				num = ?BSON_INT(Bson,  <<"num">>),
				today_recruit = ?BSON_INT(Bson,  <<"today_recruit">>)
			}
		;
		_ ->
			#pub_recruit{
				id = PlayerId
			}

	end.

save_pub_recruit(Pub_recruit) when is_record(Pub_recruit, pub_recruit) ->
	PlayerId = Pub_recruit#pub_recruit.id,
	Bson = #{
		?BSONSET_INT(<<"id">>,PlayerId),
		?BSONSET_LIST(<<"buy_type">>,Pub_recruit#pub_recruit.buy_type),
		?BSONSET_INT(<<"num">>, Pub_recruit#pub_recruit.num),
		?BSONSET_INT(<<"today_recruit">>, Pub_recruit#pub_recruit.today_recruit)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_PUB_RECRUIT,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson}).

