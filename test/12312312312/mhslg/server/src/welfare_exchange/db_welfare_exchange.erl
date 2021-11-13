%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Sep 2021 2:13 PM
%%%-------------------------------------------------------------------
-module(db_welfare_exchange).
-author("123").
-include("common.hrl").
-include("player.hrl").
-include("welfare_exchange.hrl").



%% API
-export([
  load_welfare_exchange/1,
  save_welfare_exchange/1
]).


load_welfare_exchange(PlayerId) ->
  case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_WELFARE_EXCHANGE, #{?BSONSET_INT(id, PlayerId)}) of
    Bson = #{} ->
      #player_welfare_exchange{
        id = PlayerId,
        welfare_exchange_state = ?BSON_LIST(Bson, welfare_exchange_state),
        welfare_exchange_exist_time = ?BSON_LIST(Bson,  welfare_exchange_exist_time),
        welfare_exchange_finish_state=?BSON_LIST(Bson,welfare_exchange_finish_state),
        welfare_exchange_last_time=?BSON_LIST(Bson,welfare_exchange_last_time),
        icon_state = ?BSON_INT(Bson,  icon_state)
      }
    ;
    _ ->
      #player_welfare_exchange{
        id = PlayerId
      }

  end.

save_welfare_exchange(Player_Welfare_Exchange) when is_record(Player_Welfare_Exchange, player_welfare_exchange) ->
  PlayerId = Player_Welfare_Exchange#player_welfare_exchange.id,
  %%Welfare_exchange=welfare_exchange:get_player_welfare_exchange(),
  %%#player_welfare_exchange{welfare_exchange_state = State,welfare_exchange_exist_time = Exist_time,welfare_exchange_finish_state = Finish_time,welfare_exchange_last_time = Last_time} = Welfare_exchange,
  Bson = #{
    ?BSONSET_INT(id,PlayerId),
    ?BSONSET_LIST(welfare_exchange_state, Player_Welfare_Exchange#player_welfare_exchange.welfare_exchange_state),
    ?BSONSET_LIST(welfare_exchange_exist_time, Player_Welfare_Exchange#player_welfare_exchange.welfare_exchange_exist_time),
    ?BSONSET_LIST(welfare_exchange_finish_state, Player_Welfare_Exchange#player_welfare_exchange.welfare_exchange_finish_state),
    ?BSONSET_LIST(welfare_exchange_last_time, Player_Welfare_Exchange#player_welfare_exchange.welfare_exchange_last_time),
    ?BSONSET_INT(icon_state, Player_Welfare_Exchange#player_welfare_exchange.icon_state)
  },

  mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_WELFARE_EXCHANGE,
    #{?BSONSET_INT(id, PlayerId)},
    #{<<"$set">> => Bson}).
