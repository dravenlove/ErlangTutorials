%%%-------------------------------------------------------------------
%%% @author df
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 11月 2020 17:03
%%%-------------------------------------------------------------------
-module(db_online_gift).
-author("df").
-include("common.hrl").
-include("player.hrl").
-include("online_gift.hrl").


%% API


%% API
-export([
	load_online_gift/1,
	save_online_gift/1
]).


load_online_gift(PlayerId) ->
	case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_ONLINE_GIFT, #{?BSONSET_INT(id, PlayerId)}) of
		Bson = #{} ->
			#player_online_gift{
				id = PlayerId,
				today_accumulative_time = ?BSON_INT(Bson, today_accumulative_time),
				recharge_state = ?BSON_INT(Bson,  recharge_state),
				online_gift_state = ?BSON_INT(Bson,  online_gift_state),
				is_receive_all = ?BSON_INT(Bson, is_receive_all),
				icon_state = ?BSON_INT(Bson,  icon_state)
			}
		;
		_ ->
			#player_online_gift{
				id = PlayerId
			}

	end.

save_online_gift(Player_Online_gift) when is_record(Player_Online_gift, player_online_gift) ->
	PlayerId = Player_Online_gift#player_online_gift.id,
	Bson = #{
		?BSONSET_INT(id,PlayerId),
		?BSONSET_INT(today_accumulative_time, Player_Online_gift#player_online_gift.today_accumulative_time),
		?BSONSET_INT(recharge_state, Player_Online_gift#player_online_gift.recharge_state),
		?BSONSET_INT(online_gift_state,Player_Online_gift#player_online_gift.online_gift_state),
		?BSONSET_INT(is_receive_all, Player_Online_gift#player_online_gift.is_receive_all),
		?BSONSET_INT(icon_state, Player_Online_gift#player_online_gift.icon_state)
	},

	mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_ONLINE_GIFT,
		#{?BSONSET_INT(id, PlayerId)},
		#{<<"$set">> => Bson}).



