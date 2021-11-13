%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_chat_limit
%%% Created on : 2021/1/19 15:51
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_chat_limit).
-author("yc").
-include("common.hrl").
-include("chat.hrl").

-define(BACKSTAGE_CHAT_SETTING_RECORD, backstage_chat_setting_record).


%% API
-export([
  do_update_chat_limit_setting/1,
  update_chat_limit_setting/2,
  sign_in/0,
  check_is_limit_content/1
]).

-export([
  player_chat_handler/0,
  get_player_chat_limit/0,
  put_player_chat_limit/2,
  ets_init/0,
  build_index/0,
  get_chat_setting_record/0,
  save_chat_setting_record/1
]).

player_chat_handler() ->
  #player_handler{
    ets = ?ETS_PLAYER_BACKSTAGE_CHAT_SETTING_RECORD,
    table_name = ?DB_PLAYER_CHAT_LIMIT,
    table_player_field = <<"id">>,
    ets_init_func = fun lib_player_chat_limit:ets_init/0,
    mongo_index_func = fun lib_player_chat_limit:build_index/0,
    load_func = fun db_player_chat_limit:load_player_chat_limit/1,
    save_func = fun db_player_chat_limit:save_player_chat_limit/1,
    get_func = fun lib_player_chat_limit:get_player_chat_limit/0,
    put_func = fun lib_player_chat_limit:put_player_chat_limit/2
  }.

get_player_chat_limit() ->
  get(?ETS_PLAYER_BACKSTAGE_CHAT_SETTING_RECORD).

put_player_chat_limit(Player_dissolve_dict,IsSaveDb) ->
  lib_player:check_update_ets_cache(IsSaveDb, ?ETS_PLAYER_BACKSTAGE_CHAT_SETTING_RECORD),
  put(?ETS_PLAYER_BACKSTAGE_CHAT_SETTING_RECORD, Player_dissolve_dict).

ets_init() ->
  ets:new(?ETS_PLAYER_BACKSTAGE_CHAT_SETTING_RECORD, [?ETS_KEY_POS(#player_chat_limit.id) | ?ETS_OPTIONS]).

build_index() ->
  mongo_poolboy:async_ensure_index(?MMO_POOL, ?DB_PLAYER_CHAT_LIMIT, {?TUPLE_INT(id, 1)}, true)
.

update_chat_limit_setting(PlayerId, ChatLimitRecord) ->
  mod_server:async_apply(lib_player:get_pid(PlayerId),fun lib_player_chat_limit:do_update_chat_limit_setting/1, [ChatLimitRecord]).

do_update_chat_limit_setting(ChatLimitRecord) ->
  save_chat_setting_record(ChatLimitRecord)
  .

get_chat_setting_record() ->
  get(?BACKSTAGE_CHAT_SETTING_RECORD).

save_chat_setting_record(Record) ->
  put(?BACKSTAGE_CHAT_SETTING_RECORD, Record).

%% 检查是否有敏感词
check_is_limit_content(Content) ->
  #backstage_chat_limit{shield_world_list = ShieldList} = get_chat_setting_record(),
  RetContent =
    lists:foldl(fun(ShieldWord, RetContentAcc) ->
      re:replace(RetContentAcc, ShieldWord, "*", [unicode, global, {return, list}])
                end, Content, ShieldList),
  {not string:equal(Content, RetContent), RetContent}.

sign_in() ->
  mod_backstage_chat_limit:player_get_chat_setting(lib_player:player_id(), lib_player:player_agent()).