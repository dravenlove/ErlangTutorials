%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: record
%%% Created on : 2021/1/19 17:20
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_record).
-author("yc").
-include("common.hrl").
-include("chat.hrl").
-include("chat_block.hrl").

%% API
-export([record_field_names/1]).

record_field_names(Record) when erlang:is_record(Record, player_chat_limit) ->
  {player_chat_limit, record_info(fields, player_chat_limit)};
record_field_names(Record) when erlang:is_record(Record, chat_limit_record) ->
  {chat_limit_record, record_info(fields, chat_limit_record)};
record_field_names(Record) when erlang:is_record(Record, limit_rec) ->
  {limit_rec, record_info(fields, limit_rec)};
record_field_names(Record) when erlang:is_record(Record, chat_block) ->
  {limit_rec, record_info(fields, chat_block)};
record_field_names(Record) ->
  ?ERROR("can't fetch field name by record: ~p ~n", [Record]),
  {undefined, []}.