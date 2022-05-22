%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: db_backstage_chat_limit
%%% Created on : 2021/1/19 16:08
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(db_backstage_chat_limit).
-author("yc").
-include("common.hrl").
-include("chat.hrl").

%% API
-export([
  load_backstage_chat_limit/0
]).

load_backstage_chat_limit() ->
  case mongo_poolboy:find(?BACK_POOL, ?DB_BACKSTAGE_CHAT_LIMIT, #{?BSONSET_VALUE(agent_code, #{?BSONSET_VALUE(<<"$gte">>, 0)})}) of
    BsonList when is_list(BsonList) ->
      lists:foldl(fun(Bson, RecordDictAcc) ->
        Record = bson_to_chat_limit_record(Bson),
        dict:store(Record#backstage_chat_limit.agent_code , Record, RecordDictAcc)
                  end, dict:new(), BsonList);
    _ ->
      dict:new()
  end.

bson_to_chat_limit_record(Bson) ->
  ChannelLimitList = ?BSON_LIST_DEFAULT(Bson, channel_limit, []),
  ChannelLimitDict =
    lists:foldl(fun(ChannelLimit, ChannelLimitDictAcc) ->
      case is_list(ChannelLimit) andalso erlang:length(ChannelLimit) >= 3 of
        true ->
          [ChannelId, OpenLevel, ChatInterval | _] = ChannelLimit,
          dict:store(ChannelId, [OpenLevel, ChatInterval], ChannelLimitDictAcc);
        false ->
          ChannelLimitDictAcc
      end
                end, dict:new(), ChannelLimitList),

  VipLimitList = ?BSON_LIST_DEFAULT(Bson, vip_limit, []),
  VipLimitDict =
    lists:foldl(fun(VipLimit, VipLimitDictAcc) ->
      case is_list(VipLimit) andalso erlang:length(VipLimit) >= 6 of
        true ->
          [VipLevel, WorldChannelTime, LegionChannelTime, TaskChannelTime, PrivateChannelTime, TravelChannelTime | _] = VipLimit,
          dict:store(VipLevel, [WorldChannelTime, LegionChannelTime, TaskChannelTime, PrivateChannelTime, TravelChannelTime], VipLimitDictAcc);
        false ->
          VipLimitDictAcc
      end
                end, dict:new(), VipLimitList),

  LevelLimitList = ?BSON_LIST_DEFAULT(Bson, level_limit, []),
  LevelLimitDict =
    lists:foldl(fun(LevelLimit, LevelLimitDictAcc) ->
      case is_list(LevelLimit) andalso erlang:length(LevelLimit) >= 5 of
        true ->
          [ChannelType, LevelMin, LevelMax, ChatTime, VipLevel| _] = LevelLimit,
          ValueList = ?DICT_FETCH(ChannelType, LevelLimitDictAcc, []),
          dict:store(ChannelType, [[LevelMin, LevelMax, ChatTime, VipLevel] | ValueList], LevelLimitDictAcc);
        false ->
          LevelLimitDictAcc
      end
                end, dict:new(), LevelLimitList),

  ShieldBsonList = ?BSON_LIST_DEFAULT(Bson, shield_word, []),
  ShieldList =
    lists:foldl(fun(ShieldBson, ShieldListAcc) ->
      [unicode:characters_to_list(ShieldBson) | ShieldListAcc]
                end, [], ShieldBsonList),

  #backstage_chat_limit{
    agent_code = ?BSON_INT_DEFAULT(Bson, agent_code, 0),
    channel_limit_dict = ChannelLimitDict,
    vip_limit_unit_tick = ?BSON_INT_DEFAULT(Bson, vip_limit_unit_tick, 0),
    vip_limit_dict = VipLimitDict,
    level_limit_unit_tick = ?BSON_INT_DEFAULT(Bson, level_limit_unit_tick, 0),
    level_limit_ban_tick = ?BSON_INT_DEFAULT(Bson, level_limit_ban_tick, 0),
    level_limit_dict = LevelLimitDict,
    shield_world_list = ShieldList
  }.