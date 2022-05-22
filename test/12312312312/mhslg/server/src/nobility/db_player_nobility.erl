%%%-------------------------------------------------------------------
%%% @author lichaoyu
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2021 2:19 PM
%%%-------------------------------------------------------------------
-module(db_player_nobility).
-author("lichaoyu").
-include("common.hrl").

%% API
-export([
	load_player_nobility/1,
	save_player_nobility/1
]).

load_player_nobility(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_NOBILITY, #{?BSONSET_INT(<<"id">>, PlayerId)}) of
		Bson = #{} ->
			#player_nobility{
				id = ?BSON_INT(Bson, <<"id">>),
				nobility = ?BSON_INT(Bson, <<"nobility">>),
				privilege = sets:from_list(?BSON_LIST(Bson, <<"privilege">>))
			};
		_ ->
			#player_nobility{id = PlayerId}
	end
.
save_player_nobility(PlayerNobility) ->
	PlayerId = PlayerNobility#player_nobility.id,
	Bson = #{
		?BSONSET_INT(<<"id">>, PlayerId),
		?BSONSET_INT(<<"nobility">>, PlayerNobility#player_nobility.nobility),
		?BSONSET_LIST(<<"privilege">>, sets:to_list(PlayerNobility#player_nobility.privilege))
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_NOBILITY, #{?BSONSET_INT(<<"id">>, PlayerId)}, #{<<"$set">> => Bson})
.