%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_dissolve_hero_fragment
%%% Created on : 2021/1/5 17:56
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_dissolve_hero_fragment).
-author("yc").
-include("common.hrl").
-include("dissovle_hero_fragment.hrl").

%% API
-export([
  save_dissolve_record/1,
  load_dissolve_record/1
]).


save_dissolve_record(Dissolve_dict) when is_record(Dissolve_dict, player_dissolve) ->
  PlayerId = Dissolve_dict#player_dissolve.id,
  Bson = player_dissolve_to_bson(Dissolve_dict),
  mongo_poolboy:async_update(?MMO_POOL, ?DBPLAYER_DISSOLVE_HERO_FRAGMENT,
    #{?BSONSET_INT(<<"id">>, PlayerId)},
    #{<<"$set">> => Bson})
.

player_dissolve_to_bson(Dissolve_dict) ->
  #{
    ?BSONSET_INT(id, Dissolve_dict#player_dissolve.id),
    ?BSONSET_LIST(dissolve_dict, lib_common:dict_to_bson_list(Dissolve_dict#player_dissolve.dissolve_dict)),
    ?BSONSET_INT(<<"time">>, Dissolve_dict#player_dissolve.time)
  }
.

load_dissolve_record(Player_id) ->
  case mongo_poolboy:find_one(?MMO_POOL, ?DBPLAYER_DISSOLVE_HERO_FRAGMENT, #{?BSONSET_INT(<<"id">>, Player_id)}) of
    Bson = #{} ->
      #player_dissolve{
        id = Player_id,
        dissolve_dict = lib_common:bson_list_to_dict(?BSON_LIST_DEFAULT(Bson,dissolve_dict,[])),
        time = ?BSON_INT(Bson, <<"time">>)
      };
    _ ->
      #player_dissolve{id = Player_id}
  end
.
