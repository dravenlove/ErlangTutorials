%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_player_chat_limit
%%% Created on : 2021/1/19 16:38
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_player_chat_limit).
-author("yc").
-include("common.hrl").
-include("chat.hrl").
-include("chat_block.hrl").

%% API
-export([
  load_player_chat_limit/1,
  save_player_chat_limit/1,
  load_chat_block/0,
  save_chat_block/1
]).

load_player_chat_limit(PlayerId) ->
  case mongo_poolboy:find_one(?MMO_POOL, ?DB_PLAYER_CHAT_LIMIT, #{?BSONSET_INT(id, PlayerId)}) of
    Res = #{} ->
      #player_chat_limit{
        id = PlayerId,
        chat_list = bson_record_list_to_record_list(?BSON_LIST_DEFAULT(Res, chat_list, [])),
        chat_tick_list = ?BSON_LIST_DEFAULT(Res, chat_tick_list, []),
        chat_record_list = bson_record_list_to_record_list(?BSON_LIST_DEFAULT(Res, chat_record_list, [])),
        ban_tick_list = ?BSON_LIST_DEFAULT(Res, ban_tick_list, []),
        last_chat_tick = ?BSON_INT_DEFAULT(Res, last_chat_tick, 0),
        last_vip_chat_limit_reset_tick = ?BSON_INT_DEFAULT(Res, last_vip_chat_limit_reset_tick, 0),
        vip_chat_limit_list = bson_limit_rec_list_to_limit_rec_list(?BSON_LIST_DEFAULT(Res, vip_chat_limit_list, [])),
        last_level_chat_limit_reset_tick = ?BSON_INT_DEFAULT(Res, last_level_chat_limit_reset_tick, 0),
        level_chat_limit_list = bson_limit_rec_list_to_limit_rec_list(?BSON_LIST_DEFAULT(Res, level_chat_limit_list, [])),
        ban_chat_tick = ?BSON_INT_DEFAULT(Res, ban_chat_tick, 0)
      };
    _ ->
      #player_chat_limit{id = PlayerId}
  end.

save_player_chat_limit(PlayerChatLimit) ->
  PlayerId = PlayerChatLimit#player_chat_limit.id,
  Bson = lib_mongodb:record_to_bson(PlayerChatLimit),
  mongo_poolboy:async_update(?MMO_POOL, ?DB_PLAYER_CHAT_LIMIT, #{?BSONSET_INT(id, PlayerId)}, Bson).

bson_record_list_to_record_list(BsonList) ->
  lists:foldl(fun(Bson, RecordListAcc) ->
    [bson_record_to_record(Bson) | RecordListAcc]
              end, [], BsonList).

bson_record_to_record(Bson) ->
  #chat_limit_record{
    tick = ?BSON_INT_DEFAULT(Bson, tick, 0),
    content = ?BSON_STRING_DEFAULT(Bson, content, ""),
    chat_type = ?BSON_INT_DEFAULT(Bson, chat_type, 0)
  }.

bson_limit_rec_list_to_limit_rec_list(BsonList) ->
  lists:foldl(fun(Bson, RecordListAcc) ->
    [bson_limit_rec_to_limit_rec(Bson) | RecordListAcc]
              end, [], BsonList).

bson_limit_rec_to_limit_rec(Bson) ->
  #limit_rec{
    chat_type = ?BSON_INT_DEFAULT(Bson, chat_type, 0),
    chat_time = ?BSON_INT_DEFAULT(Bson, chat_time, 0)
  }.


%%聊天屏蔽数据库存储
load_chat_block() ->
  case mongo_poolboy:find_one(?MMO_POOL, ?DB_CHAT_BLOCK, #{?BSONSET_INT(id, 0)}) of
    Res = #{} ->
      #chat_block{
        player_block = player_block_to_bson(?BSON_BSON_DEFAULT(Res, player_block, #{})),
        player_no_speak_dict = player_no_speak_dict_to_bson(?BSON_BSON_DEFAULT(Res, player_no_speak_dict, #{}))
      };
    _ ->
      #chat_block{}
  end.

save_chat_block(Record) ->
  Bson = record_to_bson(Record),
  mongo_poolboy:async_update(?MMO_POOL, ?DB_CHAT_BLOCK, #{?BSONSET_INT(id, 0)}, Bson),
  ?DEBUG("Bson is ~p",[Bson])
.

player_block_to_bson(Map) ->
  maps:fold(fun(Key,Val,Acc) ->
    dict:store(util:to_integer(Key),util:to_list(Val),Acc)
            end,dict:new(),Map)
.

player_no_speak_dict_to_bson(Map) ->
  maps:fold(fun(Key,Val,Acc) ->
    dict:store(util:to_integer(Key),util:to_list(Val),Acc)
            end,dict:new(),Map)
.

record_to_bson(Record) ->
  Player_block = deal_with_player_block(Record#'chat_block'.player_block),
  Player_no_speak_dict = deal_with_player_no_speak_dict(Record#'chat_block'.player_no_speak_dict),
  #{
   ?BSONSET_BSON(player_block,Player_block),
    ?BSONSET_BSON(player_no_speak_dict,Player_no_speak_dict)
  }
.

deal_with_player_block(Dict) ->
  dict:fold(fun(Key,Val,Acc) ->
    maps:put(lib_types:to_binary(Key),Val,Acc)
    end,#{},Dict)
.

deal_with_player_no_speak_dict(Dict) ->
  dict:fold(fun(Key,Val,Acc) ->
    maps:put(lib_types:to_binary(Key),Val,Acc)
            end,#{},Dict)
.





