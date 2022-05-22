%%--- coding:utf-8 ---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% File Name: lib_player_chat_block
%%% Created on : 2021/1/23 11:24
%%% @author yc yangcheng@shengheyouxi.com
%%% @copyright (C) 2021, shengheyouxi
%%% @doc
%%%
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(lib_player_chat_block).
-author("yc").
-include("common.hrl").
-include("ProtoClient_10105.hrl").
-include("chat_block.hrl").

%% API
-export([
  request_block_one_player/1,
  sign_in/0,
  request_ban_player_id/1,
  msg_active_block/1,
  msg_active_ban/2,
  request_block_list/0,
  get_state/0,
  request_ban_list/0,
  request_other_info/1
]).

request_block_one_player(Msg) ->
  State = Msg#'Proto10105009'.state,
  Player_id = Msg#'Proto10105009'.player_id,
  My_id = lib_player:player_id(),
  {OK,Map} = mod_server:sync_status(mod_chat_block:get_pid(),fun mod_chat_block:request_block_one_player/4,[State,Player_id,My_id]),
  case OK == ok of
    true -> skip;
    _ -> ?DEBUG("ERROR IS ~p",[Map])
  end,
  Player_list = ?DICT_FETCH(My_id,Map#'chat_block'.player_block,[]),
  List_new = lists:foldl(fun(Key,_Val) ->
    lib_player:serialize_other_player_show_role(Key)
    end,[],Player_list),
  msg_active_block(List_new),
  Respond = #'Proto80105009'{
    player_id = List_new
  },
  case State of
    ?BLOCK ->  lib_send:respond_to_client(Respond,?ERROR_BLOCK_TRUE);
    ?NO_BLOCK ->   lib_send:respond_to_client(Respond,?ERROR_REMOVE_BOLCK)
  end
.

msg_active_block(List) ->
  Respond = #'Proto80105009'{
  player_id = List
  },
  lib_send:respond_to_client(Respond)
.

sign_in() ->
  My_id = lib_player:player_id(),
  {OK,State} = mod_server:sync_status(mod_chat_block:get_pid(),fun mod_chat_block:do_sign_in/1,[]),
  case OK == ok of
    true -> skip;
    _ -> ?DEBUG("State is false ~p",[State])
  end,
  Player_list = ?DICT_FETCH(My_id,State#'chat_block'.player_block,[]),
  List_new = lists:foldl(fun(Key,_Val) ->
    lib_player:serialize_other_player_show_role(Key)
                         end,[],Player_list),
  msg_active_block(List_new)
.

request_ban_player_id(Msg) ->
   Ret = judge_self(),
  ?JUDGE_RETURN(Ret == true,?ERROR_CLIENT_OPERATOR),
  Player_id = Msg#'Proto10105015'.player_id,
  ?DEBUG("Player_id IS ~p",[Player_id]),
  State = Msg#'Proto10105015'.state,
  ?DEBUG("State IS ~p",[State]),
  Country_id = lib_player:player_country(),
  My_id = lib_player:player_id(),
  mod_server:async_status(mod_chat_block:get_pid(),fun mod_chat_block:ban_player_id/5,[Player_id,State,Country_id,My_id])
.

msg_active_ban(Player_id,State_id) ->
  Country_id = lib_player:player_country(),
  mod_server:async_status(mod_chat_block:get_pid(),fun mod_chat_block:do_msg_active_ban/3,[Player_id,Country_id]),
  lib_send:respond_to_client( #'Proto50105015'{id = 1}),
  case State_id of
    ?BLOCK ->   lib_send:respond_to_client(#'Proto50105015'{id = 1},?ERROR_BAN_TRUE);
    ?NO_BLOCK -> lib_send:respond_to_client(#'Proto50105015'{id = 1},?ERROR_REOMVE_BAN)
  end
.

request_block_list() ->
  My_id = lib_player:player_id(),
  mod_server:async_status(mod_chat_block:get_pid(),fun mod_chat_block:do_request_block_list/2,[My_id])
.

get_state() ->
  try
  Country_id = lib_player:player_country(),
  Player_id = lib_player:player_id(),
  {_OK,Dict}  = mod_server:sync_status(mod_chat_block:get_pid(),fun mod_chat_block:do_get_state_two/3,[Player_id,Country_id]),
  List = dict:fetch(Country_id,Dict),
  _Player_state = case lists:any(fun(X) -> X == Player_id end,List) of
                   true -> ?BLOCK;
                   _ -> ?NO_BLOCK
                 end
  catch
    _:_  -> ?DEBUG("lib_player_chat_block ~p",[erlang:get_stacktrace()])
  end
.

request_ban_list() ->
  Country = lib_player:player_country(),
  {OK,State}  = mod_server:sync_status(mod_chat_block:get_pid(),fun mod_chat_block:do_request_ban_list/1 ,[]),
  case OK == ok of
    true -> skip;
    _ -> ?DEBUG("ERROR IS ~p",[State])
  end,
  Player_id_list = ?DICT_FETCH(Country,State#'chat_block'.player_no_speak_dict,[]),

  List_new = lists:foldl(fun(Key,_Val) ->
    lib_player:serialize_other_player_show_role(Key)
                         end,[],Player_id_list),
  Respond = #'Proto50105013'{player_list = List_new},
  lib_send:respond_to_client(Respond)
.

%%获取他人info
request_other_info(Msg) ->
  Player_id = Msg#'Proto10105014'.player_id,
  Player_info = lib_player:serialize_other_player_show_role(Player_id),
  Respond = #'Proto50105014'{info = Player_info},
  lib_send:respond_to_client(Respond)
.


%%后续功能接口
judge_self() ->
  try
      true
  catch
      _:_  -> ?DEBUG("error is ~p",[erlang:get_stacktrace()]),
        error
  end
.

