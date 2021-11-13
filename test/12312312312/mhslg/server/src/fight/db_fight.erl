%%--- coding:utf-8 ---

%%%-------------------------------------------------------------------
%% File Name: db_arena.erl
%% Created on : 2019-06-11 17:48:00
%% Author: Jiuan
%% Last Modified: 2019-06-11 17:48:00
%% Description:
%%%-------------------------------------------------------------------
-module(db_fight).
-include("common.hrl").
-include("combat_queue.hrl").
-include("ProtoClient_10102.hrl").

%% API
-export([
    load_fight_record/1,
    save_fight_record/2,
    delete_fight_record/1,
    delete_fight_record/2
]).

load_fight_record(RecordId) ->
    case mongo_poolboy:find_one(?MMO_POOL, ?DB_FIGHT_RECORD, #{?BSONSET_INT(record_id, RecordId)}) of
        Res = #{} ->
            Msg = ?BSON_BIN(Res, msg),
            ResultMsg = ?BSON_BIN(Res, result_msg),
            #callback_data0{
                msg = Msg,
                result_msg = ResultMsg
            };
        _ ->
            #callback_data0{}
    end.

save_fight_record(Data, Type) ->
    RecordId = lib_counter:get_fight_record_id(),
    Bson =
    #{
        ?BSONSET_INT(record_id, RecordId),
        ?BSONSET_INT(type, Type),
        ?BSONSET_INT(tick, lib_timer:unixtime()),
        ?BSONSET_BIN(msg, lib_msg:pack_to_bin(Data#callback_data0.msg)),
        ?BSONSET_BIN(result_msg, lib_msg:pack_to_bin(Data#callback_data0.result_msg))
    },
    mongo_poolboy:async_update(?MMO_POOL, ?DB_FIGHT_RECORD, #{?BSONSET_INT(<<"record_id">>, RecordId)}, #{<<"$set">> => Bson}),
    RecordId.

delete_fight_record(RecordId) ->
    mongo_poolboy:async_delete(?MMO_POOL, ?DB_FIGHT_RECORD, #{?BSONSET_INT(<<"record_id">>, RecordId)}).

delete_fight_record(Type, Cond) ->
    NewCond = maps:put(<<"type">>, Type, Cond),
    mongo_poolboy:async_delete(?MMO_POOL, ?DB_FIGHT_RECORD, NewCond).