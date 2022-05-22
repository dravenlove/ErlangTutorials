%%%-------------------------------------------------------------------
%%% @author 13661
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 12月 2020 16:58
%%%-------------------------------------------------------------------
-module(db_player_country).
-author("13661").

-include("common.hrl").
-include("country.hrl").

%% API
-export([
	load_player_country/1,
	save_player_country/1
]).

load_player_country(PlayerId) ->
	case mongo_poolboy:find(?MMO_POOL, ?DBPLAYER_COUNTRY, #{?BSONSET_INT(id, PlayerId)}) of
		Res = #{} ->
			#player_country{
				id = PlayerId,
				notice_uuid = ?BSON_INT(Res, notice_uuid)
			};
		_ -> #player_country{
			id = PlayerId
		}
	end
.

save_player_country(PlayerCountry) ->
	PlayerId = PlayerCountry#player_country.id,
	Bson = #{
		?BSONSET_INT(id, PlayerId),
		?BSONSET_INT(notice_uuid, PlayerCountry#player_country.notice_uuid)
	},
	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_COUNTRY,
		#{?BSONSET_INT(<<"id">>, PlayerId)},
		#{<<"$set">> => Bson})
.